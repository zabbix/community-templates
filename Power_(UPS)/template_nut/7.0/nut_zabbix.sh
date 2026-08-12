#!/bin/sh

# Zabbix NUT monitoring helper

# UPS location must be defined in the format: <upsname>@<host>[:<port>]
# Example:
# UPS="ups01@192.168.0.99"

# CHANGE THIS PER MONITORED HOST
UPS="ups01@192.168.0.99"

# CHANGE YOUR UPSC PATH, IF DIFFERENT FROM DEFAULT
UPSC="/usr/bin/upsc"

case "$1" in
    status)
        "$UPSC" "$UPS" 2>/dev/null | awk -F': ' '$1=="ups.status"{print $2; found=1} END{if(!found) exit 1}'
        ;;
    comm)
        if "$UPSC" "$UPS" >/dev/null 2>&1; then echo 1; else echo 0; fi
        ;;
    battery.charge|battery.voltage|input.voltage|input.frequency|output.voltage|ups.load)
        "$UPSC" "$UPS" 2>/dev/null | awk -F': ' -v k="$1" '$1==k{print $2; found=1} END{if(!found) exit 1}'
        ;;
    *)
        echo "Usage: $0 {status|comm|battery.charge|battery.voltage|input.voltage|input.frequency|output.voltage|ups.load}" >&2
        exit 2
        ;;
esac
