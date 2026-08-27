#!/bin/bash
# ============================================================================
# kerio_connect_check.sh - Kerio Connect API Monitoring für Zabbix
# ============================================================================
# SECURITY-HARDENED VERSION (Kerio Connect 10.x API)
#
# Credentials werden aus einer geschützten Datei gelesen,
# NICHT als CLI-Argumente übergeben (wären in ps aux sichtbar).
#
# Verwendung: kerio_connect_check.sh <HOST> <PORT> [CREDENTIALS_FILE]
#   HOST              Kerio Connect Hostname/IP
#   PORT              Admin-Port (Standard: 4040)
#   CREDENTIALS_FILE  Pfad zur Credentials-Datei (Standard: /etc/zabbix/kerio_credentials.conf)
#
# Credentials-Datei Format (chmod 600, owner zabbix):
#   KERIO_USER=Admin
#   KERIO_PASS=GeheimesPasswort
#
# Ausgabe: JSON-Objekt für Zabbix-Preprocessing
# ============================================================================

export LC_ALL=C

HOST="${1}"
PORT="${2:-4040}"
CRED_FILE="${3:-/etc/zabbix/kerio_credentials.conf}"

ERROR_JSON='{"users_total":0,"domains_total":0,"total_connections":0,"messages_in_queue":0,"version":"unknown","uptime_seconds":0,"license_days_left":-1,"license_users":0,"license_type":"unknown","storage_percent":0,"smtp_auth_failures":0,"spam_rejected":0,"imap_connections":0,"pop3_connections":0,"web_connections":0,"smtp_connections":0}'

# ============================================================================
# Input-Validierung
# ============================================================================
if [ -z "$HOST" ]; then
    echo "$ERROR_JSON"
    exit 0
fi

# Host: nur Hostnamen, IPs und FQDNs erlauben
if [[ "${HOST}" =~ [^a-zA-Z0-9.\-:] ]]; then
    echo "$ERROR_JSON"
    exit 0
fi

# Port: nur Zahlen
if [[ "${PORT}" =~ [^0-9] ]]; then
    echo "$ERROR_JSON"
    exit 0
fi

# ============================================================================
# Credentials aus geschützter Datei laden
# ============================================================================
if [ ! -f "${CRED_FILE}" ]; then
    echo "$ERROR_JSON"
    exit 0
fi

# Berechtigungen prüfen - Datei darf nicht world-readable sein
CRED_PERMS=$(stat -c %a "${CRED_FILE}" 2>/dev/null)
if [ -n "${CRED_PERMS}" ] && [ "${CRED_PERMS:2:1}" != "0" ]; then
    echo "$ERROR_JSON"
    exit 0
fi

# Credentials einlesen (nur erwartete Variablen, kein blindes source)
KERIO_USER=""
KERIO_PASS=""
while IFS='=' read -r key value; do
    key=$(echo "$key" | tr -d '[:space:]')
    case "$key" in
        KERIO_USER) KERIO_USER="$value" ;;
        KERIO_PASS) KERIO_PASS="$value" ;;
    esac
done < "${CRED_FILE}"

if [ -z "${KERIO_USER}" ] || [ -z "${KERIO_PASS}" ]; then
    echo "$ERROR_JSON"
    exit 0
fi

BASE_URL="https://${HOST}:${PORT}/admin/api/jsonrpc/"

# ============================================================================
# Sichere temporäre Dateien
# ============================================================================
SECURE_TMP="/var/lib/zabbix/tmp"
if [ ! -d "${SECURE_TMP}" ]; then
    SECURE_TMP="/tmp"
fi
COOKIE_FILE=$(mktemp "${SECURE_TMP}/kerio_zabbix_XXXXXX")
trap "rm -f ${COOKIE_FILE}" EXIT

# ============================================================================
# cURL Optionen
# ============================================================================
if [ -f "/etc/zabbix/kerio-ca.pem" ]; then
    CURL_OPTS="-s --cacert /etc/zabbix/kerio-ca.pem --connect-timeout 10 --max-time 30"
else
    CURL_OPTS="-s -k --connect-timeout 10 --max-time 30"
fi

# ============================================================================
# Login (Passwort nur im POST-Body, JSON-escaped)
# ============================================================================
KERIO_PASS_ESCAPED=$(printf '%s' "${KERIO_PASS}" | sed 's/\\/\\\\/g; s/"/\\"/g')
LOGIN_JSON=$(printf '{"jsonrpc":"2.0","id":1,"method":"Session.login","params":{"userName":"%s","password":"%s","application":{"name":"Zabbix Monitoring","vendor":"Zabbix","version":"1.0"}}}' \
    "${KERIO_USER}" "${KERIO_PASS_ESCAPED}")

LOGIN_RESPONSE=$(curl ${CURL_OPTS} -c "${COOKIE_FILE}" -H "Content-Type: application/json" \
    -d "${LOGIN_JSON}" "${BASE_URL}" 2>/dev/null)

TOKEN=$(echo "${LOGIN_RESPONSE}" | grep -o '"token":"[^"]*"' | head -1 | cut -d'"' -f4)
if [ -z "${TOKEN}" ]; then
    echo "$ERROR_JSON"
    exit 0
fi

# ============================================================================
# API-Hilfsfunktion (printf statt String-Interpolation)
# ============================================================================
api_call() {
    local method="$1" id="$2" json
    local params="$3"
    [ -z "$params" ] && params="{}"
    json=$(printf '{"jsonrpc":"2.0","id":%d,"method":"%s","params":%s}' "$id" "$method" "$params")
    curl ${CURL_OPTS} -b "${COOKIE_FILE}" \
        -H "Content-Type: application/json" \
        -H "X-Token: ${TOKEN}" \
        -d "$json" "${BASE_URL}" 2>/dev/null
}

# ============================================================================
# API-Aufrufe (Kerio Connect 10.x Methoden)
# ============================================================================

# Server Info
SERVER_INFO=$(api_call "Server.getProductInfo" 2)
VERSION=$(echo "${SERVER_INFO}" | grep -o '"version":"[^"]*"' | head -1 | cut -d'"' -f4)
VERSION=${VERSION:-"unknown"}

# Statistics (Uptime, Queue, Storage, Connections, SMTP-Stats)
STATS=$(api_call "Statistics.get" 3)

UPTIME_DAYS=$(echo "${STATS}" | grep -oP '"days"\s*:\s*\K[0-9]+' | head -1)
UPTIME_HOURS=$(echo "${STATS}" | grep -oP '"hours"\s*:\s*\K[0-9]+' | head -1)
UPTIME_MINUTES=$(echo "${STATS}" | grep -oP '"minutes"\s*:\s*\K[0-9]+' | head -1)
UPTIME=$(( ${UPTIME_DAYS:-0} * 86400 + ${UPTIME_HOURS:-0} * 3600 + ${UPTIME_MINUTES:-0} * 60 ))

MESSAGES_IN_QUEUE=$(echo "${STATS}" | grep -oP '"storedInQueue":\{"count":"?\K[0-9]+' | head -1)
MESSAGES_IN_QUEUE=${MESSAGES_IN_QUEUE:-0}

STORAGE_PERCENT=$(echo "${STATS}" | grep -oP '"percentage":"?\K[0-9]+' | head -1)
STORAGE_PERCENT=${STORAGE_PERCENT:-0}

SMTP_AUTH_FAIL=$(echo "${STATS}" | grep -oP '"authenticationFailures":"?\K[0-9]+' | head -1)
SMTP_AUTH_FAIL=${SMTP_AUTH_FAIL:-0}

SPAM_REJECTED=$(echo "${STATS}" | grep -oP '"rejected":"?\K[0-9]+' | head -1)
SPAM_REJECTED=${SPAM_REJECTED:-0}

# Connections aus Statistics (kumulativ seit Serverstart)
IMAP_CONNS=$(echo "${STATS}" | grep -oP '"imapServer".*?"totalIncomingConnections":"?\K[0-9]+' | head -1)
POP3_CONNS=$(echo "${STATS}" | grep -oP '"pop3Server".*?"totalIncomingConnections":"?\K[0-9]+' | head -1)
WEB_CONNS=$(echo "${STATS}" | grep -oP '"webServer".*?"totalIncomingConnections":"?\K[0-9]+' | head -1)
SMTP_CONNS=$(echo "${STATS}" | grep -oP '"smtpServer".*?"totalIncomingConnections":"?\K[0-9]+' | head -1)
TOTAL_CONNS=$(( ${IMAP_CONNS:-0} + ${POP3_CONNS:-0} + ${WEB_CONNS:-0} + ${SMTP_CONNS:-0} ))

# Domains (IDs für User-Iteration)
DOMAINS_RESPONSE=$(api_call "Domains.get" 4 '{"query":{"fields":["id","name"],"start":0,"limit":100}}')
DOMAINS_TOTAL=$(echo "${DOMAINS_RESPONSE}" | grep -oP '"totalItems"\s*:\s*\K[0-9]+' | head -1)
DOMAINS_TOTAL=${DOMAINS_TOTAL:-0}

# Users: pro Domain abfragen und summieren (Kerio 10.x braucht domainId)
USERS_TOTAL=0
for DOMAIN_ID in $(echo "${DOMAINS_RESPONSE}" | grep -oP '"id":"[^"]*"' | cut -d'"' -f4); do
    DOMAIN_ID_ESC=$(printf '%s' "$DOMAIN_ID" | sed 's/"/\\"/g')
    DOMAIN_USERS=$(api_call "Users.get" 5 "{\"query\":{\"fields\":[\"id\"],\"start\":0,\"limit\":1},\"domainId\":\"${DOMAIN_ID_ESC}\"}")
    COUNT=$(echo "${DOMAIN_USERS}" | grep -oP '"totalItems"\s*:\s*\K[0-9]+' | head -1)
    USERS_TOTAL=$((USERS_TOTAL + ${COUNT:-0}))
done

# License
LICENSE_DAYS_LEFT=-1; LICENSE_USERS=0; LICENSE_TYPE="unknown"
LICENSE_RESPONSE=$(api_call "Server.getLicenseInfo" 8)
if echo "${LICENSE_RESPONSE}" | grep -q '"result"'; then
    LICENSE_EXPIRES_RAW=$(echo "${LICENSE_RESPONSE}" | grep -oP '"expirationDate"\s*:\s*"[^"]*"' | head -1 | cut -d'"' -f4)
    LICENSE_USERS=$(echo "${LICENSE_RESPONSE}" | grep -oP '"users"\s*:\s*[0-9]+' | head -1 | grep -oP '[0-9]+')
    LICENSE_TYPE=$(echo "${LICENSE_RESPONSE}" | grep -oP '"type"\s*:\s*"[^"]*"' | head -1 | cut -d'"' -f4)
fi
LICENSE_USERS=${LICENSE_USERS:-0}; LICENSE_TYPE=${LICENSE_TYPE:-"unknown"}
if [ -n "${LICENSE_EXPIRES_RAW}" ] && [ "${LICENSE_EXPIRES_RAW}" != "null" ]; then
    EXPIRY_EPOCH=$(date -d "${LICENSE_EXPIRES_RAW}" +%s 2>/dev/null)
    [ -n "${EXPIRY_EPOCH}" ] && LICENSE_DAYS_LEFT=$(( (EXPIRY_EPOCH - $(date +%s)) / 86400 ))
fi

# Logout
api_call "Session.logout" 99 > /dev/null 2>&1

# ============================================================================
# JSON-Ausgabe (printf statt heredoc für sauberes Quoting)
# ============================================================================
printf '{"users_total":%d,"domains_total":%d,"total_connections":%d,"messages_in_queue":%d,"version":"%s","uptime_seconds":%d,"license_days_left":%d,"license_users":%d,"license_type":"%s","storage_percent":%d,"smtp_auth_failures":%d,"spam_rejected":%d,"imap_connections":%d,"pop3_connections":%d,"web_connections":%d,"smtp_connections":%d}\n' \
    "$USERS_TOTAL" "$DOMAINS_TOTAL" "$TOTAL_CONNS" "$MESSAGES_IN_QUEUE" "$VERSION" "$UPTIME" \
    "$LICENSE_DAYS_LEFT" "$LICENSE_USERS" "$LICENSE_TYPE" "$STORAGE_PERCENT" "$SMTP_AUTH_FAIL" "$SPAM_REJECTED" \
    "${IMAP_CONNS:-0}" "${POP3_CONNS:-0}" "${WEB_CONNS:-0}" "${SMTP_CONNS:-0}"
