#!/bin/bash
# SSL-Zertifikat Ablaufprüfung für Zabbix
# Verwendung: kerio_check_ssl.sh <HOST> <PORT>
# Rückgabe: Verbleibende Tage oder -1 bei Fehler
export LC_ALL=C
HOST="${1}"; PORT="${2:-443}"
if [ -z "$HOST" ] || [[ "${HOST}" =~ [^a-zA-Z0-9.\-:] ]]; then echo "-1"; exit 1; fi
if [[ "${PORT}" =~ [^0-9] ]]; then echo "-1"; exit 1; fi
EXPIRY_DATE=$(echo | openssl s_client -connect "${HOST}:${PORT}" -servername "${HOST}" 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | cut -d= -f2)
if [ -z "${EXPIRY_DATE}" ]; then echo "-1"; exit 0; fi
EXPIRY_EPOCH=$(date -d "${EXPIRY_DATE}" +%s 2>/dev/null)
if [ -z "${EXPIRY_EPOCH}" ]; then echo "-1"; exit 0; fi
echo $(( (EXPIRY_EPOCH - $(date +%s)) / 86400 ))
