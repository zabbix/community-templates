#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - TLS/SSL Certificate Check
#  Version:    1.0
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Prüft TLS-Zertifikate auf HTTPS/IMAPS/Submission Ports
#  Usage:      check_tls.sh [port_check|cert_days|cert_raw] [port]
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================

MAILCOW_DIR="/opt/mailcow-dockerized"
DOMAIN=$(grep -oP "^MAILCOW_HOSTNAME=\K[a-zA-Z0-9._-]+" "$MAILCOW_DIR/mailcow.conf" 2>/dev/null)
CHECK_TYPE="${1:-port_check}"
PORT="${2:-443}"

# Port muss numerisch sein. Ohne diese Pruefung landet $2 ungeprueft in
# bash -c "</dev/tcp/$DOMAIN/$PORT" (port_check) bzw. openssl -connect - ein
# Aufruf wie `check_tls.sh port_check '0; befehl'` wuerde sonst Code ausfuehren.
case "$PORT" in
    ''|*[!0-9]*)
        echo "FEHLER: ungueltiger Port '$PORT'" >&2
        exit 1
        ;;
esac

case "$CHECK_TYPE" in
    port_check)
        timeout 3 bash -c "</dev/tcp/$DOMAIN/$PORT" 2>/dev/null && echo 1 || echo 0
        ;;
    cert_days)
        if [ "$PORT" = "587" ]; then
            EXPIRY=$(echo | timeout 5 openssl s_client -connect "$DOMAIN:$PORT" -starttls smtp -servername "$DOMAIN" 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | cut -d= -f2)
        else
            EXPIRY=$(echo | timeout 5 openssl s_client -connect "$DOMAIN:$PORT" -servername "$DOMAIN" 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | cut -d= -f2)
        fi
        if [ -n "$EXPIRY" ]; then
            EXPIRY_TS=$(date -d "$EXPIRY" +%s 2>/dev/null)
            NOW=$(date +%s)
            echo $(( (EXPIRY_TS - NOW) / 86400 ))
        else
            echo 0
        fi
        ;;
    cert_raw)
        if [ "$PORT" = "587" ]; then
            echo | timeout 5 openssl s_client -connect "$DOMAIN:$PORT" -starttls smtp -servername "$DOMAIN" 2>/dev/null | openssl x509 -noout -enddate -subject 2>/dev/null | tr '\n' ' '
        else
            echo | timeout 5 openssl s_client -connect "$DOMAIN:$PORT" -servername "$DOMAIN" 2>/dev/null | openssl x509 -noout -enddate -subject 2>/dev/null | tr '\n' ' '
        fi
        ;;
    ui_check)
        HTTP_CODE=$(timeout 5 curl -s -k -o /dev/null -w "%{http_code}" "https://$DOMAIN/" 2>/dev/null)
        if echo "$HTTP_CODE" | grep -qE "^[23]"; then echo 1; else echo 0; fi
        ;;
    *)
        echo "Usage: $0 [port_check|cert_days|cert_raw|ui_check] [port]"
        exit 1
        ;;
esac
