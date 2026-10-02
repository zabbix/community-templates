#!/bin/sh
set -eu
# Pass the ExternalScripts directory configured for the responsible server/proxy.
if [ "$(id -u)" -ne 0 ]; then echo 'Run as root.' >&2; exit 1; fi
if [ "$#" -ne 1 ] || [ ! -d "$1" ]; then
    echo 'Usage: ./install_firmware_check.sh /configured/ExternalScripts/directory' >&2
    exit 1
fi
command -v python3 >/dev/null
getent group zabbix >/dev/null
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
install -o root -g zabbix -m 0755 "$source_dir/reolink_fw_check.py" "$1/reolink_fw_check.py"
if [ ! -e /etc/zabbix/reolink_fw_check.conf ]; then
    install -o root -g zabbix -m 0640 "$source_dir/reolink_fw_check.conf.example" /etc/zabbix/reolink_fw_check.conf
fi
printf '%s\n' 'Installed. Configure /etc/zabbix/reolink_fw_check.conf using vi, test as zabbix, then enable the firmware items and trigger on the host.'
