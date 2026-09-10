#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - Update auf v1.2
#  Vendor:   Alexander Fox | PlaNet Fox
#  Project:  https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  License:  MIT (siehe LICENSE)
# ====================================================================
#
#  Aktualisiert die Host-Seite (Collector + Check-Scripts + Agent-Config).
#  Die Zabbix-Seite (Template-Import) muss im Frontend erfolgen, siehe UPDATE.md.
#
#  Aufruf:
#      sudo ./update.sh              # aktualisieren
#      sudo ./update.sh --check      # nur pruefen, nichts aendern
#      sudo ./update.sh --rollback   # letztes Backup zurueckspielen
# ====================================================================

set -u

BIN_DIR="/usr/local/bin"
AGENT_CONF="/etc/zabbix/zabbix_agent2.conf"
JSON="/run/mailcow-monitor/monitor.json"
BACKUP_ROOT="/var/backups/mailcow-zabbix"
SRC="$(cd "$(dirname "$0")" && pwd)"

CHECK_ONLY=0
ROLLBACK=0
[ "${1:-}" = "--check" ] && CHECK_ONLY=1
[ "${1:-}" = "--rollback" ] && ROLLBACK=1

RED=$'\033[0;31m'; GRN=$'\033[0;32m'; YEL=$'\033[0;33m'; NC=$'\033[0m'
ok()   { echo "  ${GRN}OK${NC}    $*"; }
warn() { echo "  ${YEL}WARN${NC}  $*"; }
err()  { echo "  ${RED}FEHLER${NC} $*"; }

FAIL=0

if [ "$(id -u)" -ne 0 ]; then
    err "Please run as root (sudo ./update.sh)"
    exit 1
fi

# ---------------------------------------------------------------- rollback
if [ $ROLLBACK -eq 1 ]; then
    LAST=$(ls -1d "$BACKUP_ROOT"/* 2>/dev/null | sort | tail -1)
    if [ -z "$LAST" ]; then
        err "No backup found in $BACKUP_ROOT"
        exit 1
    fi
    echo "Rollback from: $LAST"
    RESTORED=0
    # Scripts: neues Layout ($LAST/bin), altes flaches Layout als Fallback (< v1.3.5)
    if [ -d "$LAST/bin" ] && ls "$LAST"/bin/* >/dev/null 2>&1; then
        cp -a "$LAST"/bin/* "$BIN_DIR"/ && RESTORED=1
    elif ls "$LAST"/*.sh "$LAST"/*.py >/dev/null 2>&1; then
        cp -a "$LAST"/*.sh "$LAST"/*.py "$BIN_DIR"/ 2>/dev/null && RESTORED=1
    fi
    # systemd-Units zuruecknehmen (nur neues Layout hat sie im Backup)
    if [ -d "$LAST/systemd" ] && ls "$LAST"/systemd/* >/dev/null 2>&1; then
        cp -a "$LAST"/systemd/* /etc/systemd/system/ && systemctl daemon-reload 2>/dev/null && RESTORED=1
    fi
    systemctl restart mailcow-monitor.timer 2>/dev/null
    if [ "$RESTORED" -eq 1 ]; then
        ok "Restored from $LAST. Reset the template in the frontend separately if needed."
        exit 0
    else
        err "Nothing to restore in $LAST (empty or unknown backup layout)."
        exit 1
    fi
fi

echo "=============================================="
echo " Mailcow-Zabbix-Monitoring  Update v1.2"
[ $CHECK_ONLY -eq 1 ] && echo " MODE: --check (nothing will be changed)"
echo "=============================================="
echo

# ------------------------------------------------- 1. Voraussetzungen
echo "[1/6] Prerequisites"
command -v docker >/dev/null 2>&1 && ok "docker found" || { err "docker missing"; FAIL=1; }
command -v python3 >/dev/null 2>&1 && ok "python3 found" || { err "python3 missing"; FAIL=1; }
if docker ps --format '{{.Names}}' 2>/dev/null | grep -q 'postfix-mailcow'; then
    ok "Mailcow containers running"
else
    err "No postfix-mailcow container found - is Mailcow running?"
    FAIL=1
fi
[ $FAIL -eq 1 ] && { echo; err "Aborted."; exit 1; }
echo

# ------------------------------------------------- 2. Agent-Konfiguration
# Das ist der Bug, der in v1.0/v1.1 jede Installation still lahmgelegt hat:
# ALLE Items sind aktive Checks und brauchen ServerActive. Server= allein
# genuegt NICHT. Wir aendern hier nichts automatisch (eine kaputte Config
# verhindert den Agent-Start), sondern melden nur.
echo "[2/6] Zabbix agent configuration"
if [ -f "$AGENT_CONF" ]; then
    SA=$(grep -E '^ServerActive=' "$AGENT_CONF" | head -1 | cut -d= -f2-)
    HN=$(grep -E '^Hostname=' "$AGENT_CONF" | head -1 | cut -d= -f2-)
    SA_COUNT=$(grep -cE '^ServerActive=' "$AGENT_CONF")
    if [ -z "$SA" ]; then
        err "ServerActive missing -> NOT a single item will collect data!"
        echo "        Add: ServerActive=<ip-or-name-of-your-zabbix-server>"
        FAIL=1
    elif echo "$SA" | grep -qE '^(127\.0\.0\.1|localhost)$'; then
        warn "ServerActive=$SA points at localhost."
        echo "        Only correct if the Zabbix server runs on THIS host."
    else
        ok "ServerActive=$SA"
    fi
    [ "$SA_COUNT" -gt 1 ] && err "ServerActive defined $SA_COUNT times - the agent will not start"
    if [ -z "$HN" ]; then
        warn "Hostname not set (must exactly match the host name in Zabbix)"
    else
        ok "Hostname=$HN"
    fi
else
    warn "$AGENT_CONF not found - is Agent 2 installed?"
fi
echo

# ------------------------------------------------- 3. Backup
echo "[3/6] Backup"
STAMP=$(date +%Y%m%d-%H%M%S)
BACKUP="$BACKUP_ROOT/$STAMP"
if [ $CHECK_ONLY -eq 0 ]; then
    mkdir -p "$BACKUP/bin" "$BACKUP/systemd"
    N=0
    # Scripts unter /usr/local/bin
    for f in "$BIN_DIR"/mailcow-collector.py "$BIN_DIR"/mailcow-reader.sh "$BIN_DIR"/check_*.sh \
             "$BIN_DIR"/postfix_*.sh "$BIN_DIR"/sync_jobs_check.sh; do
        [ -f "$f" ] && { cp -a "$f" "$BACKUP/bin/"; N=$((N+1)); }
    done
    # systemd-Units: werden von [4b] ebenfalls ersetzt, muessen also mit ins Backup -
    # sonst kann --rollback eine kaputte Unit nicht zuruecknehmen.
    for u in /etc/systemd/system/mailcow-monitor.service /etc/systemd/system/mailcow-monitor.timer; do
        [ -f "$u" ] && { cp -a "$u" "$BACKUP/systemd/"; N=$((N+1)); }
    done
    ok "$N files backed up -> $BACKUP"
else
    ok "(check) backup would go to $BACKUP"
fi
echo

# ------------------------------------------------- 4. Scripts aktualisieren
echo "[4/6] Scripts"
UPD=0
for f in "$SRC"/scripts/*; do
    NAME=$(basename "$f")
    TARGET="$BIN_DIR/$NAME"
    if [ -f "$TARGET" ] && cmp -s "$f" "$TARGET"; then
        echo "        unchanged: $NAME"
        continue
    fi
    if [ $CHECK_ONLY -eq 1 ]; then
        warn "(check) would replace: $NAME"
    else
        install -o root -g root -m 0755 "$f" "$TARGET" && ok "updated: $NAME"
    fi
    UPD=$((UPD+1))
done
[ $UPD -eq 0 ] && ok "All scripts already up to date"
echo

# --------------------------------------- 4b. systemd-Units + Altlasten
# update.sh hat bis v1.2 NUR die Scripts unter /usr/local/bin ersetzt. Die
# systemd-Unit blieb unangetastet - wer updatete, bekam den neuen Collector,
# aber die alte, ungehaertete Unit ohne RuntimeDirectory. Dank des Fallbacks im
# Collector lief das sogar, nur eben ohne die Haertung. Ein Update, das Erfolg
# meldet und die Haelfte liefert.
for UNIT in mailcow-monitor.service mailcow-monitor.timer; do
    [ -f "$SRC/$UNIT" ] || continue
    TARGET="/etc/systemd/system/$UNIT"
    if [ -f "$TARGET" ] && cmp -s "$SRC/$UNIT" "$TARGET"; then
        echo "        unchanged: $UNIT"
        continue
    fi
    if [ $CHECK_ONLY -eq 1 ]; then
        warn "(check) would replace: $UNIT"
    else
        install -o root -g root -m 0644 "$SRC/$UNIT" "$TARGET" && ok "updated: $UNIT"
        UNITS_CHANGED=1
    fi
done

# Zustand lag bis v1.2.1 im weltschreibbaren /var/tmp; jetzt /run/mailcow-monitor
LEGACY=0
for OLD_STATE in mailcow-monitor.json mailcow-monitor.json.tmp \
                 mailcow-monitor-slow.json mailcow-monitor-mailflow.json \
                 rbl_check.cache rbl_check_detail.cache ptr_check.cache \
                 postfix_log_analysis.cache rspamd_stats.cache \
                 dovecot_check.cache; do
    [ -e "/var/tmp/$OLD_STATE" ] || continue
    LEGACY=$((LEGACY+1))
    [ $CHECK_ONLY -eq 0 ] && rm -f "/var/tmp/$OLD_STATE"
done
if [ $LEGACY -gt 0 ]; then
    if [ $CHECK_ONLY -eq 1 ]; then
        warn "(check) would remove $LEGACY legacy state file(s) from /var/tmp"
    else
        ok "$LEGACY legacy state file(s) removed from /var/tmp"
    fi
fi
echo

# ------------------------------------------------- 5. Caches + Dienst
echo "[5/6] Caches and service"
if [ $CHECK_ONLY -eq 0 ]; then
    # RBL-Cache muss weg, sonst liefert der alte Fehlalarm noch bis zu 30 Min.
    rm -f /run/mailcow-monitor/rbl.cache /run/mailcow-monitor/rbl_detail.cache
    ok "RBL cache cleared"
    systemctl daemon-reload 2>/dev/null
    # Ohne Neustart des Timers laeuft der Dienst weiter mit der alten Unit -
    # die Haertung und das RuntimeDirectory griffen erst beim naechsten Reboot.
    if [ "${UNITS_CHANGED:-0}" = "1" ]; then
        ok "systemd units reloaded"
    fi
    START_TS=$(date +%s)
    if systemctl list-unit-files 2>/dev/null | grep -q mailcow-monitor.timer; then
        systemctl restart mailcow-monitor.timer && ok "Timer restarted"
        systemctl start mailcow-monitor.service 2>/dev/null
        ok "Collector run triggered"
    else
        warn "mailcow-monitor.timer not installed (run install.sh?)"
    fi
    # Auf eine WIRKLICH neue JSON warten statt fest zu schlafen. Der Collector
    # braucht ~10-15s; ein `sleep 3` liess die Verifikation auf den Werten des
    # vorherigen Laufs pruefen - also auf Daten der noch nicht ersetzten
    # Scripts. Das kann ein falsches OK erzeugen.
    printf "        waiting for fresh data "
    FRESH=0
    for _ in $(seq 1 40); do
        if [ -f "$JSON" ] && [ "$(stat -c %Y "$JSON" 2>/dev/null || echo 0)" -ge "$START_TS" ]; then
            FRESH=1
            break
        fi
        printf "."
        sleep 1
    done
    echo
    if [ $FRESH -eq 1 ]; then
        ok "JSON rewritten"
    else
        warn "Collector did not write a new JSON within 40s."
        echo "        The values below may still be from the previous run."
        echo "        Check: systemctl status mailcow-monitor.service"
    fi
else
    ok "(check) cache/service unchanged"
fi
echo

# ------------------------------------------------- 6. Verifikation
echo "[6/6] Verification"
if [ -f "$JSON" ]; then
    AGE=$(( $(date +%s) - $(stat -c %Y "$JSON") ))
    [ $AGE -lt 180 ] && ok "JSON is ${AGE}s old" || warn "JSON is ${AGE}s old - is the timer running?"
    python3 - "$JSON" <<'EOF'
import json, sys
try:
    d = json.load(open(sys.argv[1]))
except Exception as e:
    print("  \033[0;31mERROR\033[0m JSON not readable:", e); sys.exit(0)

def show(label, key, bad=None):
    v = d.get(key, "<fehlt>")
    flag = "\033[0;33mWARN\033[0m  " if (bad is not None and v == bad) else "\033[0;32mOK\033[0m    "
    print(f"  {flag}{label}: {v}")

print(f"  \033[0;32mOK\033[0m    {len(d)} metrics in the JSON")
show("Postfix running", "postfix.process.running", bad=0)
show("Rspamd scanned", "mailcow.rspamd.scanned", bad=0)
show("RBL listed", "mailcow.security.rbl.listed")
show("RBL detail", "mailcow.security.rbl.detail")
show("Collector errors", "mailcow.collector.errors")
EOF
else
    err "$JSON does not exist - the collector never ran successfully"
fi
echo
echo "=============================================="
echo " Host side done."
echo
echo " NEXT STEP (Zabbix frontend, cannot be automated):"
echo "   Data collection -> Templates -> Import"
echo "   File: templates/mailcow-complete-monitoring.yaml"
echo "   IMPORTANT: tick 'Create new' AND 'Update existing',"
echo "            NOT 'Delete missing'."
echo "   The template should then show: Items 246 | Triggers 63 | Dashboards 19"
echo
echo " Details and troubleshooting: UPDATE.md"
echo "=============================================="
