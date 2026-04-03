#!/usr/bin/env bash
set -euo pipefail

HMC_HOST="${1:-}"
HMC_USER="${2:-}"
HMC_PASS="${3:-}"
MODE="${4:-}"
ARG1="${5:-}"

[[ -n "$HMC_HOST" && -n "$HMC_USER" && -n "$HMC_PASS" && -n "$MODE" ]] || { echo "[]"; exit 0; }

BASE="https://${HMC_HOST}:12443"
WEB="${BASE}/rest/api/web"
UOM="${BASE}/rest/api/uom"
PCM="${BASE}/rest/api/pcm"

# ---- Zabbix-safe temp workspace (single directory, atomic cleanup) ----
# Even if Zabbix kills the script, worst case is ONE directory per killed run,
# not dozens of mktemp files. (SIGKILL can't be trapped.)
umask 077
TMPDIR="$(mktemp -d /tmp/hmc_zbx.XXXXXX)"
trap 'rm -rf "$TMPDIR"' EXIT INT TERM

COOKIE="$TMPDIR/cookie.txt"
LOGIN_XML="$TMPDIR/login.xml"
HDR="$TMPDIR/headers.txt"
BODY="$TMPDIR/body.xml"
PCM_FEED="$TMPDIR/pcm_energy_feed.xml"
PCM_JSON="$TMPDIR/pcm_energy.json"

# Bounded runtime for Zabbix external checks
CURL=(-sS -k --connect-timeout 5 --max-time 20)

# ---- Build real XML (NOT HTML escaped) ----
python3 - "$HMC_USER" "$HMC_PASS" >"$LOGIN_XML" <<'PY'
import sys
from xml.sax.saxutils import escape
u = escape(sys.argv[1])
p = escape(sys.argv[2])
print(f'''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<LogonRequest xmlns="http://www.ibm.com/xmlns/systems/power/firmware/web/mc/2012_10/" schemaVersion="V1_0">
  <UserID>{u}</UserID>
  <Password>{p}</Password>
</LogonRequest>''')
PY

logon() {
  local code
  code="$(
    curl "${CURL[@]}" -c "$COOKIE" -o /dev/null -w "%{http_code}" \
      -X PUT \
      -H "Content-Type: application/vnd.ibm.powervm.web+xml; type=LogonRequest" \
      -H "Accept: */*" \
      -H "X-Audit-Memento: zabbix" \
      -d @"$LOGIN_XML" \
      "${WEB}/Logon"
  )" || code="000"
  [[ "$code" == "200" ]] || return 1
  grep -qE 'JSESSIONID|CCFWSESSION' "$COOKIE" || return 1
  return 0
}

logoff() {
  curl "${CURL[@]}" -b "$COOKIE" -X DELETE "${WEB}/Logon" >/dev/null 2>&1 || true
}

http_code() {
  awk 'BEGIN{c=""} /^HTTP\//{c=$2} END{print c}' "$HDR"
}

# ---- UOM fetch (Atom) ----
fetch_uom() {
  local url="$1"
  : >"$HDR"; : >"$BODY"

  curl "${CURL[@]}" -b "$COOKIE" -D "$HDR" -o "$BODY" \
    -H "Accept: application/atom+xml; charset=UTF-8" \
    -H "X-Audit-Memento: zabbix" \
    "$url" || true

  # Retry without charset if 500
  if awk 'BEGIN{c=""} /^HTTP\//{c=$2} END{exit !(c=="500")}' "$HDR"; then
    : >"$HDR"; : >"$BODY"
    curl "${CURL[@]}" -b "$COOKIE" -D "$HDR" -o "$BODY" \
      -H "Accept: application/atom+xml" \
      -H "X-Audit-Memento: zabbix" \
      "$url" || true
  fi
}

# ---- Normalize state strings for stable triggers ----
# operating -> Operating, running -> Running, unknown unchanged
NORM_STATE_PY='
def norm(s):
    s=(s or "").strip()
    if not s: return ""
    if s.lower()=="unknown": return "unknown"
    return s[:1].upper() + s[1:].lower()
'

# ---- Parse UOM atom feed ----
parse_uom() {
  local kind="$1" needle="$2"
  python3 - "$kind" "$needle" "$BODY" <<PY
import sys, json, xml.etree.ElementTree as ET
$NORM_STATE_PY

kind = sys.argv[1]
needle = sys.argv[2]
path = sys.argv[3]

xml = open(path, encoding="utf-8", errors="ignore").read().strip()
if not xml:
    print("[]" if kind.startswith("discover") else "unknown")
    sys.exit(0)

ATOM="http://www.w3.org/2005/Atom"
def a(t): return "{%s}%s"%(ATOM,t)
def ln(t): return t.split("}",1)[-1] if "}" in t else t

try:
    root = ET.fromstring(xml)
except Exception:
    print("[]" if kind.startswith("discover") else "unknown")
    sys.exit(0)

entries=[]
if ln(root.tag)=="feed":
    entries=root.findall(a("entry"))
elif ln(root.tag)=="entry":
    entries=[root]

def payload(ent):
    c=ent.find(a("content"))
    if c is None: return None
    kids=list(c)
    return kids[0] if kids else None

def text(obj, want):
    for e in obj.iter():
        if ln(e.tag)==want and e.text and e.text.strip():
            return e.text.strip()
    return ""

if kind=="discover.systems":
    out=[]
    for ent in entries:
        obj=payload(ent)
        if obj is None: continue
        name=text(obj,"SystemName")
        state=norm(text(obj,"State"))
        if name:
            out.append({"{#MS_NAME}":name,"{#MS_STATE}":state})
    print(json.dumps(out, ensure_ascii=False))
    sys.exit(0)

if kind=="system.state":
    for ent in entries:
        obj=payload(ent)
        if obj is None: continue
        name=text(obj,"SystemName")
        if name!=needle: continue
        st=norm(text(obj,"State"))
        print(st if st else "unknown")
        sys.exit(0)
    print("unknown"); sys.exit(0)

if kind=="discover.lpars":
    out=[]
    for ent in entries:
        obj=payload(ent)
        if obj is None: continue
        name=text(obj,"PartitionName")
        state=norm(text(obj,"PartitionState"))
        ms=text(obj,"AssociatedManagedSystem")
        if name:
            d={"{#LPAR_NAME}":name,"{#LPAR_STATE}":state}
            if ms: d["{#MS_NAME}"]=ms
            out.append(d)
    print(json.dumps(out, ensure_ascii=False))
    sys.exit(0)

if kind=="lpar.state":
    for ent in entries:
        obj=payload(ent)
        if obj is None: continue
        name=text(obj,"PartitionName")
        if name!=needle: continue
        st=norm(text(obj,"PartitionState"))
        print(st if st else "unknown")
        sys.exit(0)
    print("unknown"); sys.exit(0)

print("unknown")
PY
}

# ---- ManagedSystem UUID by SystemName ----
ms_uuid_by_name() {
  local ms_name="$1"
  fetch_uom "${UOM}/ManagedSystem"
  [[ "$(http_code)" == "200" ]] || { echo ""; return; }

  python3 - "$ms_name" "$BODY" <<'PY'
import sys, xml.etree.ElementTree as ET
ms_name=sys.argv[1]
path=sys.argv[2]

ATOM="http://www.w3.org/2005/Atom"
def a(t): return "{%s}%s"%(ATOM,t)
def ln(t): return t.split("}",1)[-1] if "}" in t else t

xml=open(path, encoding="utf-8", errors="ignore").read().strip()
if not xml: sys.exit(0)
root=ET.fromstring(xml)
entries=root.findall(a("entry"))

def payload(ent):
    c=ent.find(a("content"))
    if c is None: return None
    kids=list(c)
    return kids[0] if kids else None

def text(obj, want):
    for e in obj.iter():
        if ln(e.tag)==want and e.text and e.text.strip():
            return e.text.strip()
    return ""

for ent in entries:
    obj=payload(ent)
    if obj is None: continue
    name=text(obj,"SystemName")
    if name!=ms_name: continue
    mid=ent.find(a("id"))
    if mid is not None and mid.text:
        print(mid.text.strip())
        break
PY
}

# ---- PCM: fetch newest EnergyMonitor JSON ----
pcm_latest_energy_json() {
  local ms_uuid="$1"
  : >"$PCM_FEED"
  : >"$PCM_JSON"

  # Atom-first (matches your HMC feed format)
  curl "${CURL[@]}" -b "$COOKIE" \
    -H "Accept: application/atom+xml; charset=UTF-8" \
    -H "X-Audit-Memento: zabbix" \
    "${PCM}/ManagedSystem/${ms_uuid}/RawMetrics/EnergyMonitor" >"$PCM_FEED" || true

  # Fallback if empty
  if [[ ! -s "$PCM_FEED" ]]; then
    curl "${CURL[@]}" -b "$COOKIE" \
      -H "Accept: application/xml" \
      -H "X-Audit-Memento: zabbix" \
      "${PCM}/ManagedSystem/${ms_uuid}/RawMetrics/EnergyMonitor" >"$PCM_FEED" || true
  fi

  [[ -s "$PCM_FEED" ]] || { echo ""; return; }

  local href
  href="$(python3 - "$PCM_FEED" <<'PY'
import sys, xml.etree.ElementTree as ET
ATOM="http://www.w3.org/2005/Atom"
def a(t): return "{%s}%s"%(ATOM,t)
def ln(t): return t.split("}",1)[-1] if "}" in t else t

xml=open(sys.argv[1], encoding="utf-8", errors="ignore").read().strip()
if not xml: sys.exit(0)
root=ET.fromstring(xml)
entries = root.findall(a("entry")) if ln(root.tag)=="feed" else []

best_ts=""
best_href=""
for ent in entries:
    upd=ent.find(a("updated"))
    ts=(upd.text or "").strip() if upd is not None else ""
    href=""
    for link in ent.findall(a("link")):
        t=link.get("type","")
        h=link.get("href","")
        if "application/vnd.ibm.powervm.pcm.json" in t and h.endswith(".json"):
            href=h; break
    if href and ts >= best_ts:
        best_ts=ts; best_href=href

if best_href:
    print(best_href)
PY
)"
  [[ -z "$href" ]] && { echo ""; return; }

  href="${href/:443/:12443}"

  # Download JSON (quoted URL handles '*')
  curl "${CURL[@]}" -b "$COOKIE" \
    -H "Accept: application/json" \
    -H "X-Audit-Memento: zabbix" \
    "$href" >"$PCM_JSON" || { echo ""; return; }

  echo "$PCM_JSON"
}

pcm_max_temp() {
  local json="$1" kind="$2"
  python3 - "$json" "$kind" <<'PY'
import sys, json
fn=sys.argv[1]; kind=sys.argv[2]
try:
    d=json.load(open(fn))
except Exception:
    print("0"); sys.exit(0)

# Only accept good samples
if d.get("status") != 0:
    print("0"); sys.exit(0)

therm = d.get("thermalEnergyReading", {}) or {}
key = {"inlet":"inletTemperatures","cpu":"cpuTemperatures","baseboard":"baseboardTemperatures"}.get(kind,"")
arr = therm.get(key, []) or []

vals=[]
for it in arr:
    v=it.get("temperatureData", None)
    if isinstance(v,(int,float)):
        vals.append(float(v))
print(str(max(vals)) if vals else "0")
PY
}

pcm_watts() {
  local json="$1"
  python3 - "$json" <<'PY'
import sys, json
fn=sys.argv[1]
try:
    d=json.load(open(fn))
except Exception:
    print("0"); sys.exit(0)

if d.get("status") != 0:
    print("0"); sys.exit(0)

p = d.get("powerEnergyReading", {}) or {}
v = p.get("currentPowerReading", None)
print(str(v) if isinstance(v,(int,float)) else "0")
PY
}

# ---- VIOS discovery via VirtualIOServer child resource ----
discover_vios() {
  fetch_uom "${UOM}/ManagedSystem"
  [[ "$(http_code)" == "200" ]] || { echo "[]"; return; }

  python3 - "$BODY" "$COOKIE" "$BASE" <<'PY'
import sys, json, subprocess, xml.etree.ElementTree as ET

ms_xml_path=sys.argv[1]
cookie_file=sys.argv[2]
base_url=sys.argv[3].rstrip("/")

ATOM="http://www.w3.org/2005/Atom"
def a(t): return "{%s}%s"%(ATOM,t)
def ln(t): return t.split("}",1)[-1] if "}" in t else t

ms_xml=open(ms_xml_path, encoding="utf-8", errors="ignore").read().strip()
if not ms_xml:
    print("[]"); sys.exit(0)

root=ET.fromstring(ms_xml)
entries=root.findall(a("entry"))

def payload(ent):
    c=ent.find(a("content"))
    if c is None: return None
    kids=list(c)
    return kids[0] if kids else None

def text(obj, want):
    for e in obj.iter():
        if ln(e.tag)==want and e.text and e.text.strip():
            return e.text.strip()
    return ""

ms_map={}
for ent in entries:
    mid=ent.find(a("id"))
    obj=payload(ent)
    if mid is None or obj is None:
        continue
    msid=(mid.text or "").strip()
    msname=text(obj,"SystemName")
    if msid and msname:
        ms_map[msid]=msname

out=[]
for msid, msname in ms_map.items():
    url=f"{base_url}/rest/api/uom/ManagedSystem/{msid}/VirtualIOServer"
    cmd=["curl","-sS","-k","--connect-timeout","5","--max-time","20",
         "-b",cookie_file,
         "-H","Accept: application/atom+xml; charset=UTF-8",
         "-H","X-Audit-Memento: zabbix",
         url]
    try:
        vxml=subprocess.check_output(cmd).decode("utf-8","ignore").strip()
    except Exception:
        continue
    if not vxml:
        continue
    try:
        vr=ET.fromstring(vxml)
    except Exception:
        continue

    vents=vr.findall(a("entry")) if ln(vr.tag)=="feed" else ([vr] if ln(vr.tag)=="entry" else [])
    for ent in vents:
        obj=payload(ent)
        if obj is None:
            continue
        name=text(obj,"PartitionName")
        state=text(obj,"PartitionState")
        if name:
            out.append({"{#VIOS_NAME}":name,"{#VIOS_STATE}":state,"{#MS_NAME}":msname})

print(json.dumps(out, ensure_ascii=False))
PY
}

case "$MODE" in
  hmc.ping)
    if logon; then logoff; echo 1; else echo 0; fi
    ;;

  discover.systems)
    logon || { echo "[]"; exit 0; }
    fetch_uom "${UOM}/ManagedSystem"
    code="$(http_code)"
    [[ "$code" == "302" || -z "$code" || "$code" == "500" ]] && { logoff; echo "[]"; exit 0; }
    parse_uom discover.systems ""
    logoff
    ;;

  discover.lpars)
    logon || { echo "[]"; exit 0; }
    fetch_uom "${UOM}/LogicalPartition"
    code="$(http_code)"
    [[ "$code" == "302" || -z "$code" || "$code" == "500" ]] && { logoff; echo "[]"; exit 0; }
    parse_uom discover.lpars ""
    logoff
    ;;

  system.state)
    logon || { echo "unknown"; exit 0; }
    fetch_uom "${UOM}/ManagedSystem"
    code="$(http_code)"
    [[ "$code" == "302" || -z "$code" || "$code" == "500" ]] && { logoff; echo "unknown"; exit 0; }
    parse_uom system.state "$ARG1"
    logoff
    ;;

  lpar.state)
    logon || { echo "unknown"; exit 0; }
    fetch_uom "${UOM}/LogicalPartition"
    code="$(http_code)"
    [[ "$code" == "302" || -z "$code" || "$code" == "500" ]] && { logoff; echo "unknown"; exit 0; }
    parse_uom lpar.state "$ARG1"
    logoff
    ;;

  discover.vios)
    logon || { echo "[]"; exit 0; }
    discover_vios
    logoff
    ;;

  system.temp.inlet)
    logon || { echo 0; exit 0; }
    ms_uuid="$(ms_uuid_by_name "$ARG1")"
    [[ -z "$ms_uuid" ]] && { logoff; echo 0; exit 0; }
    jf="$(pcm_latest_energy_json "$ms_uuid")"
    [[ -z "$jf" ]] && { logoff; echo 0; exit 0; }
    pcm_max_temp "$jf" inlet
    logoff
    ;;

  system.temp.cpu)
    logon || { echo 0; exit 0; }
    ms_uuid="$(ms_uuid_by_name "$ARG1")"
    [[ -z "$ms_uuid" ]] && { logoff; echo 0; exit 0; }
    jf="$(pcm_latest_energy_json "$ms_uuid")"
    [[ -z "$jf" ]] && { logoff; echo 0; exit 0; }
    pcm_max_temp "$jf" cpu
    logoff
    ;;

  system.temp.baseboard)
    logon || { echo 0; exit 0; }
    ms_uuid="$(ms_uuid_by_name "$ARG1")"
    [[ -z "$ms_uuid" ]] && { logoff; echo 0; exit 0; }
    jf="$(pcm_latest_energy_json "$ms_uuid")"
    [[ -z "$jf" ]] && { logoff; echo 0; exit 0; }
    pcm_max_temp "$jf" baseboard
    logoff
    ;;

  system.power.watts)
    logon || { echo 0; exit 0; }
    ms_uuid="$(ms_uuid_by_name "$ARG1")"
    [[ -z "$ms_uuid" ]] && { logoff; echo 0; exit 0; }
    jf="$(pcm_latest_energy_json "$ms_uuid")"
    [[ -z "$jf" ]] && { logoff; echo 0; exit 0; }
    pcm_watts "$jf"
    logoff
    ;;

  *)
    echo "[]"
    ;;
