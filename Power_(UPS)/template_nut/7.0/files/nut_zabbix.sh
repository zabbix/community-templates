#!/bin/sh

# Zabbix NUT monitoring helper
#
# Usage:
#   nut_zabbix.sh get <upsname> <host[:port]> <variable>
#   nut_zabbix.sh comm <upsname> <host[:port]>
#   nut_zabbix.sh usb-present <upsname> <host[:port]> <0|1>
#
# The helper builds the NUT endpoint internally so Zabbix Agent does not
# need UnsafeUserParameters=1 just to pass "ups@host" as an item argument.

UPSC="${UPSC:-/usr/bin/upsc}"

build_endpoint() {
    [ -n "$1" ] && [ -n "$2" ] || return 1
    printf '%s@%s\n' "$1" "$2"
}

ACTION="$1"
UPS_NAME="$2"
UPS_HOST="$3"
ENDPOINT="$(build_endpoint "$UPS_NAME" "$UPS_HOST")" || {
    echo "UPS name and host are required" >&2
    exit 2
}

case "$ACTION" in
    get)
        KEY="$4"
        [ -n "$KEY" ] || {
            echo "NUT variable is required" >&2
            exit 2
        }
        "$UPSC" "$ENDPOINT" "$KEY" 2>/dev/null
        ;;

    comm)
        if "$UPSC" "$ENDPOINT" >/dev/null 2>&1; then
            echo 1
        else
            echo 0
        fi
        ;;

    usb-present)
        USB_CHECK="$4"

        if [ "$USB_CHECK" != "1" ]; then
            echo 2
            exit 0
        fi

        command -v lsusb >/dev/null 2>&1 || {
            echo "lsusb not found; install usbutils to enable USB presence checks" >&2
            exit 1
        }

        VID="$("$UPSC" "$ENDPOINT" ups.vendorid 2>/dev/null)"
        PID="$("$UPSC" "$ENDPOINT" ups.productid 2>/dev/null)"

        if [ -z "$VID" ] || [ -z "$PID" ]; then
            echo "NUT does not expose ups.vendorid/ups.productid for this UPS" >&2
            exit 1
        fi

        if lsusb -d "${VID}:${PID}" >/dev/null 2>&1; then
            echo 1
        else
            echo 0
        fi
        ;;

    *)
        echo "Usage: $0 {get|comm|usb-present} <upsname> <host[:port]> [variable|0|1]" >&2
        exit 2
        ;;
esac
