#!/bin/bash
# zabbix_podman_collect.sh — Podman multi-user JSON collector for Zabbix
# Version 3: runuser-based — kein DOCKER_HOST-Fallback auf Root-Daemon
# Deploy: /usr/local/bin/zabbix_podman_collect.sh (chmod 750, owner root)
# Cron:   * * * * * root /usr/local/bin/zabbix_podman_collect.sh
# Output: /var/log/podman.json (world-readable für zabbix-agent)

OUTPUT_FILE="/var/log/podman.json"
TMP_FILE="${OUTPUT_FILE}.tmp"
TIMEOUT="${PODMAN_COLLECT_TIMEOUT:-30}"
COLLECT_DISK="${PODMAN_COLLECT_DISK:-1}"

if [[ $EUID -ne 0 ]]; then
    echo "Muss als root ausgeführt werden." >&2
    exit 1
fi

mkdir -p "$(dirname "$OUTPUT_FILE")"

# --- Aktive Benutzer ermitteln: "uid:user:home" ---
declare -A SEEN_UIDS
ACTIVE_USERS=()

# Rootful Podman (root-Daemon via /run/podman/podman.sock)
if [[ -S /run/podman/podman.sock ]]; then
    ACTIVE_USERS+=("0:root:/root")
    SEEN_UIDS[0]=1
fi

# Rootless Benutzer via /run/user/<uid>/podman/podman.sock
for sock in /run/user/*/podman/podman.sock; do
    [[ -S "$sock" ]] || continue
    uid=$(echo "$sock" | grep -oP '/run/user/\K[0-9]+')
    [[ -n "${SEEN_UIDS[$uid]}" ]] && continue
    user=$(id -nu "$uid" 2>/dev/null) || continue
    home=$(getent passwd "$uid" | cut -d: -f6)
    [[ -n "$home" ]] || home="/home/$user"
    ACTIVE_USERS+=("$uid:$user:$home")
    SEEN_UIDS[$uid]=1
done

# --- Python-Collector ---
PODMAN_COLLECT_TIMEOUT="$TIMEOUT" PODMAN_COLLECT_DISK="$COLLECT_DISK" \
python3 - "${ACTIVE_USERS[@]}" <<'PYEOF' > "$TMP_FILE"
import subprocess, json, os, sys
from datetime import datetime, timezone

TIMEOUT = int(os.environ.get('PODMAN_COLLECT_TIMEOUT', '30'))
COLLECT_DISK = os.environ.get('PODMAN_COLLECT_DISK', '1') == '1'


def run_podman(uid, username, home, *args, fallback=None):
    """Podman als Zielbenutzer ausführen.
    Root: direkt. Rootless: via runuser (kein DOCKER_HOST, kein Daemon-Fallback).
    """
    try:
        if uid == 0:
            cmd = ['podman'] + list(args)
            env = dict(os.environ)
        else:
            cmd = ['runuser', '-u', username, '--', 'podman'] + list(args)
            env = {
                'HOME':                  home,
                'XDG_RUNTIME_DIR':       f'/run/user/{uid}',
                'TMPDIR':                f'/run/user/{uid}',
                'PATH':                  '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
                'DBUS_SESSION_BUS_ADDRESS': f'unix:path=/run/user/{uid}/bus',
            }
        result = subprocess.run(
            cmd, capture_output=True, text=True, timeout=TIMEOUT, cwd='/', env=env
        )
        if result.returncode == 0 and result.stdout.strip():
            return json.loads(result.stdout)
    except (subprocess.TimeoutExpired, json.JSONDecodeError, Exception):
        pass
    return fallback if fallback is not None else []


def get_container_state(container):
    s = container.get('State', '')
    if isinstance(s, dict):
        return s.get('Status', '')
    return str(s)


def normalize_stats(raw):
    """Podman stats über Versionen hinweg normalisieren.
    Gibt Liste mit einheitlichen Feldnamen zurück:
      name, id, cpu_percent, mem_usage (bytes), mem_limit (bytes), mem_percent,
      net_input (bytes), net_output (bytes), block_input (bytes), block_output (bytes),
      pids, net_io (string), block_io (string)
    """
    if isinstance(raw, dict) and 'stats' in raw:
        raw = raw['stats']
    if not isinstance(raw, list):
        return []

    def flt(v, d=0.0):
        try:
            return float(str(v or d).rstrip('%') or d)
        except (ValueError, TypeError):
            return float(d)

    def num(v, d=0):
        try:
            return int(v or d)
        except (ValueError, TypeError):
            return int(d)

    result = []
    for s in raw:
        n = {
            'id':           s.get('Id',           s.get('id', '')),
            'name':         s.get('Name',         s.get('name', '')),
            # CPU: Podman 4/5 → cpu_percent (float), ältere → CPUPerc ("5.23%")
            'cpu_percent':  flt(s.get('cpu_percent', s.get('CPU', s.get('CPUPerc', 0)))),
            # Memory bytes
            'mem_usage':    num(s.get('mem_usage',  s.get('MemUsage',  0))),
            'mem_limit':    num(s.get('mem_limit',  s.get('MemLimit',  0))),
            'mem_percent':  flt(s.get('mem_percent', s.get('mem_perc', s.get('MemPerc', 0)))),
            # Network bytes
            'net_input':    num(s.get('net_input',   s.get('NetInput',   0))),
            'net_output':   num(s.get('net_output',  s.get('NetOutput',  0))),
            # Block I/O bytes
            'block_input':  num(s.get('block_input', s.get('BlockInput', 0))),
            'block_output': num(s.get('block_output', s.get('BlockOutput', 0))),
            # PIDs
            'pids':         num(s.get('pids', s.get('PIDs', s.get('PIDS', 0)))),
        }
        # String-Repräsentation für TEXT-Items (Fallback: aus Bytes berechnet)
        for key, raw_keys, fmt in [
            ('net_io',   ['net_io',   'NetIO'],   '{net_input}B / {net_output}B'),
            ('block_io', ['block_io', 'BlockIO'], '{block_input}B / {block_output}B'),
        ]:
            val = next((s[k] for k in raw_keys if k in s and isinstance(s[k], str)), None)
            n[key] = val if val else fmt.format(**n)
        result.append(n)
    return result


users = []
for entry in sys.argv[1:]:
    parts = entry.split(':', 2)
    uid   = int(parts[0])
    uname = parts[1]
    home  = parts[2] if len(parts) > 2 else f'/home/{uname}'

    pods        = run_podman(uid, uname, home, 'pod', 'ps', '--format', 'json')
    containers  = run_podman(uid, uname, home, 'ps', '-a', '--format', 'json')
    networks    = run_podman(uid, uname, home, 'network', 'ls', '--format', 'json')
    volumes     = run_podman(uid, uname, home, 'volume', 'ls', '--format', 'json')
    images      = run_podman(uid, uname, home, 'image', 'ls', '--format', 'json')
    system_info = run_podman(uid, uname, home, 'system', 'info', '--format', 'json', fallback={})

    # Stats: braucht laufenden Daemon — graceful fallback
    stats_raw = run_podman(uid, uname, home,
                           'container', 'stats', '--no-stream', '--format', 'json',
                           fallback=[])
    stats = normalize_stats(stats_raw)

    # Container inspect — alle IDs in einem Aufruf
    cids = [c['Id'] for c in containers if c.get('Id')]
    if cids:
        inspects    = run_podman(uid, uname, home, 'container', 'inspect', *cids, fallback=[])
        inspect_map = {i['Id']: i for i in inspects if isinstance(i, dict) and 'Id' in i}
    else:
        inspects, inspect_map = [], {}

    # Volume inspect (Mountpoint, Größe)
    vnames = [v.get('Name') for v in volumes if v.get('Name')]
    volume_inspects = []
    if vnames:
        vi = run_podman(uid, uname, home, 'volume', 'inspect', *vnames, fallback=[])
        if isinstance(vi, list):
            volume_inspects = vi

    # Disk usage (optional)
    disk = {}
    if COLLECT_DISK:
        dr = run_podman(uid, uname, home, 'system', 'df', '--format', 'json', fallback={})
        if isinstance(dr, dict):
            disk = dr

    # Summary
    containers_running = sum(1 for c in containers if get_container_state(c) == 'running')
    pods_running = sum(
        1 for p in pods if p.get('Status', '').lower() in ('running', 'degraded')
    )

    users.append({
        'user':              uname,
        'uid':               uid,
        'system_info':       system_info,
        'pods':              pods,
        'containers':        containers,
        'container_inspects': inspects,
        'networks':          networks,
        'volumes':           volumes,
        'volume_inspects':   volume_inspects,
        'images':            images,
        'stats':             stats,
        'disk':              disk,
        'summary': {
            'containers_running': containers_running,
            'containers_total':   len(containers),
            'pods_total':         len(pods),
            'pods_running':       pods_running,
            'networks_total':     len(networks),
            'volumes_total':      len(volumes),
            'images_total':       len(images),
        },
    })

output = {
    'collected_at':      datetime.now(timezone.utc).astimezone().isoformat(),
    'collector_version': '3',
    'users':             users,
}

print(json.dumps(output))
PYEOF

status=$?
if [[ $status -ne 0 ]]; then
    echo "Python-Collector fehlgeschlagen (Exit $status)" >&2
    exit $status
fi

mv "$TMP_FILE" "$OUTPUT_FILE" 2>/dev/null || true
chmod 644 "$OUTPUT_FILE"
