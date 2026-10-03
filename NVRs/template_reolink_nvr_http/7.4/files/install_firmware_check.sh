#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://raw.githubusercontent.com/dbmello75/community-templates/reolink-nvr/NVRs/template_reolink_nvr_http/7.4"
CONF="/etc/zabbix/reolink_fw_check.conf"

die() {
    printf 'Error: %s\n' "$*" >&2
    exit 1
}

ask() {
    local prompt="$1" default="${2:-}" answer
    if [[ -n "$default" ]]; then
        printf '%s [%s]: ' "$prompt" "$default" >/dev/tty
    else
        printf '%s: ' "$prompt" >/dev/tty
    fi
    read -r answer </dev/tty
    REPLY="${answer:-$default}"
}

[[ $EUID -eq 0 ]] || die "Run this installer as root."
[[ -r /dev/tty ]] || die "Run this installer in an interactive terminal."

for cmd in curl python3 install getent; do
    command -v "$cmd" >/dev/null ||
        die "Required command not found: $cmd. Install it before continuing."
done

getent passwd zabbix >/dev/null ||
    die "The zabbix user was not found."
getent group zabbix >/dev/null ||
    die "The zabbix group was not found."

echo "Reolink firmware check installation"
echo

# Suggest an existing proxy or server configuration file.
suggested_config="/etc/zabbix/zabbix_proxy.conf"
if [[ ! -f "$suggested_config" ]]; then
    suggested_config="/etc/zabbix/zabbix_server.conf"
fi

ask "Zabbix proxy/server configuration file" "$suggested_config"
zabbix_config="$REPLY"
[[ -f "$zabbix_config" ]] ||
    die "Configuration file not found: $zabbix_config"

# Read ExternalScripts from the main configuration and included files.
detected_dir=$(python3 - "$zabbix_config" <<'PY'
import glob
import sys
from pathlib import Path

seen = set()
directories = []

def read_config(filename):
    path = Path(filename).resolve()
    if path in seen:
        return
    seen.add(path)
    for raw in path.read_text().splitlines():
        line = raw.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = [part.strip() for part in line.split("=", 1)]
        if key == "ExternalScripts":
            directories.append(value)
        elif key == "Include":
            pattern = Path(value)
            if not pattern.is_absolute():
                pattern = path.parent / pattern
            for included in sorted(glob.glob(str(pattern))):
                if Path(included).is_file():
                    read_config(included)

read_config(sys.argv[1])
unique = list(dict.fromkeys(directories))
if len(unique) > 1:
    sys.exit("Conflicting ExternalScripts settings were found.")
print(unique[0] if unique else "")
PY
)

if [[ -z "$detected_dir" ]]; then
    echo "ExternalScripts is not explicitly configured."
    echo "Enter the effective directory used by your installation."
fi

ask "ExternalScripts directory" "$detected_dir"
external_dir="$REPLY"
[[ "$external_dir" == /* ]] ||
    die "Enter an absolute path."
[[ -d "$external_dir" ]] ||
    die "Directory not found: $external_dir"

ask "Full Zabbix API URL ending in api_jsonrpc.php"
api_url="$REPLY"
[[ "$api_url" =~ ^https?://[^[:space:]]+/api_jsonrpc\.php$ ]] ||
    die "Invalid URL. Example: https://zabbix.example.com/api_jsonrpc.php"

printf 'Zabbix API token (hidden input): ' >/dev/tty
IFS= read -r -s api_token </dev/tty
printf '\n' >/dev/tty
[[ "$api_token" =~ ^[[:alnum:]]+$ ]] ||
    die "The token is empty or contains invalid characters."

ask "Reolink firmware catalog URL" \
    "https://support.reolink.com/c/rln8-410-rln16-410/"
catalog_url="$REPLY"
[[ "$catalog_url" =~ ^https://[^[:space:]]+$ ]] ||
    die "Enter a valid HTTPS URL."

if [[ -e "$CONF" ]]; then
    ask "Configuration already exists. Replace it and keep a backup? (y/n)" "n"
    [[ "$REPLY" =~ ^[yY]$ ]] || die "Installation canceled."
fi

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

echo "Downloading and checking the Python script..."
curl -fsSL --connect-timeout 10 --max-time 60 \
    "$BASE_URL/reolink_fw_check.py" \
    -o "$tmp_dir/reolink_fw_check.py"

python3 - "$tmp_dir/reolink_fw_check.py" <<'PY'
import ast
import sys
from pathlib import Path
ast.parse(Path(sys.argv[1]).read_text())
PY

# Write the token to a protected file without displaying it.
(
    umask 077
    printf 'ZABBIX_URL=%s\nZABBIX_TOKEN=%s\nREOLINK_DEFAULT_URL=%s\n' \
        "$api_url" "$api_token" "$catalog_url" >"$tmp_dir/config"
)
unset api_token

# Back up the existing configuration before replacing it.
if [[ -e "$CONF" ]]; then
    backup="${CONF}.bak.$(date +%Y%m%d-%H%M%S).$$"
    install -o root -g zabbix -m 0640 "$CONF" "$backup"
    printf 'Backup created: %s\n' "$backup"
fi

# Preserve the existing Zabbix configuration directory permissions.
if [[ ! -d /etc/zabbix ]]; then
    install -d -o root -g zabbix -m 0750 /etc/zabbix
fi

install -o root -g zabbix -m 0640 "$tmp_dir/config" "$CONF"
install -o root -g zabbix -m 0755 \
    "$tmp_dir/reolink_fw_check.py" \
    "$external_dir/reolink_fw_check.py"

echo
echo "Installation completed."
printf 'Script: %s/reolink_fw_check.py\nConfiguration: %s\n' \
    "$external_dir" "$CONF"

ask "Technical NVR host name to test now (press Enter to skip)"
host_name="$REPLY"

if [[ -n "$host_name" ]]; then
    command -v runuser >/dev/null ||
        die "Required command not found: runuser."
    echo "Running the check as the zabbix user..."
    runuser -u zabbix -- python3 \
        "$external_dir/reolink_fw_check.py" "$host_name"
fi

echo
echo "Review the test result before enabling these items on the host:"
echo "  - Firmware online check raw"
echo "  - Firmware check status"
echo "  - Latest available firmware"
echo "  - Firmware update available"
echo "Also enable the trigger: Firmware update available"
echo "The check runs once per week."
