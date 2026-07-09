#!/usr/bin/env bash
#
# Install ceph-osd-perf-zabbix collector and systemd timers.
# Run from this directory (files/) after copying or cloning the template package.
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_BIN="/usr/local/sbin/ceph-osd-perf-zabbix"
SYSTEMD_DIR="/etc/systemd/system"
ENABLE_RAW="${ENABLE_RAW:-0}"

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Install the Ceph OSD perf collector and systemd timers.

Options:
  --enable-raw    Also install and enable the optional perf-raw timer (60s)
  -h, --help      Show this help

Environment:
  ENABLE_RAW=1    Same as --enable-raw
EOF
}

while [[ "${1:-}" = -* ]]; do
    case "$1" in
        --enable-raw) ENABLE_RAW=1 ;;
        -h|--help) usage; exit 0 ;;
        *) echo "Unknown option: $1" >&2; exit 1 ;;
    esac
    shift
done

if [[ "$(id -u)" -ne 0 ]]; then
    echo "Run as root (sudo $0)" >&2
    exit 1
fi

for cmd in ceph zabbix_sender systemctl; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Required command not found: $cmd" >&2
        exit 1
    fi
done

if ! compgen -G '/var/run/ceph/*osd.*.asok' >/dev/null && \
   ! compgen -G '/run/ceph/*osd.*.asok' >/dev/null; then
    echo "Warning: no local OSD admin sockets found. Install anyway?" >&2
    read -r -p "Continue? [y/N] " ans
    [[ "${ans,,}" = y ]] || exit 1
fi

install -m 0755 "${SCRIPT_DIR}/ceph-osd-perf-zabbix" "${INSTALL_BIN}"

for unit in ceph-osd-perf-zabbix@.service \
            ceph-osd-perf-zabbix-discovery.timer \
            ceph-osd-perf-zabbix-perf-pick.timer \
            ceph-osd-perf-zabbix-perf-raw.timer; do
    install -m 0644 "${SCRIPT_DIR}/${unit}" "${SYSTEMD_DIR}/${unit}"
done

systemctl daemon-reload
systemctl enable --now ceph-osd-perf-zabbix-discovery.timer
systemctl enable --now ceph-osd-perf-zabbix-perf-pick.timer

if [[ "${ENABLE_RAW}" -eq 1 ]]; then
    systemctl enable --now ceph-osd-perf-zabbix-perf-raw.timer
fi

systemctl start ceph-osd-perf-zabbix@discovery.service || true
systemctl start ceph-osd-perf-zabbix@perf-pick.service || true

echo "Installed ${INSTALL_BIN}"
echo "Enabled timers:"
systemctl list-timers 'ceph-osd-perf-zabbix-*' --no-pager || true
echo
echo "Verify with: ${INSTALL_BIN} --dry --show --discovery --perf-pick"
