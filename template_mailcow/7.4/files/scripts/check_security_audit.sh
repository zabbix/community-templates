#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - Security Audit Check
#  Version:    1.0
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Prüft DANE/TLSA, MTA-STS, TLS-RPT, BIMI für alle Domains
#  Usage:      check_security_audit.sh [dane|mta_sts|tls_rpt|bimi|detail|score]
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================

MAILCOW_DIR="/opt/mailcow-dockerized"
CHECK_TYPE="${1:-detail}"

# --- Mailcow Hostname und Domains ---
get_hostname() {
    grep -oP "^MAILCOW_HOSTNAME=\K[a-zA-Z0-9._-]+" "$MAILCOW_DIR/mailcow.conf" 2>/dev/null
}

get_domains() {
    # Passwort ungekuerzt lesen (cut -f2- behaelt auch '=' und Sonderzeichen).
    DBPASS=$(grep -m1 "^DBPASS=" "$MAILCOW_DIR/mailcow.conf" 2>/dev/null | cut -d= -f2-)
    MYSQL_CONTAINER=$(docker ps --filter "name=mysql" --format "{{.Names}}" 2>/dev/null | grep -i mailcow | head -1)
    [ -z "$MYSQL_CONTAINER" ] && \
        MYSQL_CONTAINER=$(docker ps --filter "name=maria" --format "{{.Names}}" 2>/dev/null | grep -i mailcow | head -1)
    { [ -z "$MYSQL_CONTAINER" ] || [ -z "$DBPASS" ]; } && return 1

    # Passwort nur als Env-Wert (MYSQL_PWD), niemals im argv: 'docker exec -e
    # MYSQL_PWD' reicht die exportierte Variable durch, ohne sie in die
    # Host-Prozessliste zu schreiben.
    export MYSQL_PWD="$DBPASS"
    docker exec -e MYSQL_PWD "$MYSQL_CONTAINER" \
        mysql -u mailcow mailcow -Nse \
        "SELECT domain FROM domain WHERE active=1 AND domain NOT LIKE '%_sogo%'" 2>/dev/null
}

# --- DANE/TLSA: _25._tcp.hostname ---
# TLSA Records beweisen, dass das TLS-Zertifikat zum DNS-Eintrag passt
check_dane() {
    local hostname="$1"
    timeout 5 dig +short +time=3 +tries=1 TLSA "_25._tcp.${hostname}" 2>/dev/null | grep -q "^[0-9]"
    # Rückgabe: 0=gefunden, 1=nicht gefunden
    [ $? -eq 0 ] && echo 1 || echo 0
}

# --- MTA-STS: _mta-sts.domain TXT + Policy-File ---
# Erzwingt TLS bei eingehenden Mails (ähnlich HSTS für SMTP)
check_mta_sts() {
    local domain="$1"
    # Schritt 1: DNS TXT Record
    local txt
    txt=$(timeout 5 dig +short +time=3 +tries=1 TXT "_mta-sts.${domain}" 2>/dev/null)
    if ! echo "$txt" | grep -q "v=STSv1"; then
        echo 0
        return
    fi
    # Schritt 2: Policy-File erreichbar? (optional, nur DNS reicht für "konfiguriert")
    echo 1
}

# --- TLS-RPT: _smtp._tls.domain ---
# Empfängt Reports über TLS-Fehler bei eingehenden Verbindungen
check_tls_rpt() {
    local domain="$1"
    timeout 5 dig +short +time=3 +tries=1 TXT "_smtp._tls.${domain}" 2>/dev/null | grep -q "v=TLSRPTv1"
    [ $? -eq 0 ] && echo 1 || echo 0
}

# --- BIMI: default._bimi.domain ---
# Brand-Logo in E-Mail-Clients (setzt DMARC p=quarantine/reject voraus)
check_bimi() {
    local domain="$1"
    timeout 5 dig +short +time=3 +tries=1 TXT "default._bimi.${domain}" 2>/dev/null | grep -q "v=BIMI1"
    [ $? -eq 0 ] && echo 1 || echo 0
}

# --- Main ---
HOSTNAME=$(get_hostname)
DOMAINS=$(get_domains)

if [ -z "$DOMAINS" ]; then
    # Fallback: Domain aus Hostname
    DOMAINS=$(echo "$HOSTNAME" | sed 's/^[^.]*//' | sed 's/^\.//')
fi

case "$CHECK_TYPE" in
    dane)
        # DANE wird nur am MX-Hostname geprüft (nicht pro Domain)
        if [ -n "$HOSTNAME" ]; then
            check_dane "$HOSTNAME"
        else
            echo 0
        fi
        ;;
    mta_sts)
        ALL_OK=1
        for domain in $DOMAINS; do
            result=$(check_mta_sts "$domain")
            [ "$result" != "1" ] && ALL_OK=0
        done
        echo "$ALL_OK"
        ;;
    tls_rpt)
        ALL_OK=1
        for domain in $DOMAINS; do
            result=$(check_tls_rpt "$domain")
            [ "$result" != "1" ] && ALL_OK=0
        done
        echo "$ALL_OK"
        ;;
    bimi)
        ALL_OK=1
        for domain in $DOMAINS; do
            result=$(check_bimi "$domain")
            [ "$result" != "1" ] && ALL_OK=0
        done
        echo "$ALL_OK"
        ;;
    score)
        # Gesamt-Score: 0-7 (SPF+DKIM+DMARC+DANE+MTA-STS+TLS-RPT+BIMI)
        SCORE=0

        # SPF/DKIM/DMARC aus dem bestehenden check_dns.sh
        SPF=$(/usr/local/bin/check_dns.sh spf 2>/dev/null)
        DKIM=$(/usr/local/bin/check_dns.sh dkim 2>/dev/null)
        DMARC=$(/usr/local/bin/check_dns.sh dmarc 2>/dev/null)
        [ "$SPF" = "1" ] && SCORE=$((SCORE + 1))
        [ "$DKIM" = "1" ] && SCORE=$((SCORE + 1))
        [ "$DMARC" = "1" ] && SCORE=$((SCORE + 1))

        # Neue Checks
        [ -n "$HOSTNAME" ] && [ "$(check_dane "$HOSTNAME")" = "1" ] && SCORE=$((SCORE + 1))

        for domain in $DOMAINS; do
            MTA=$(check_mta_sts "$domain")
            TLS=$(check_tls_rpt "$domain")
            BIMI=$(check_bimi "$domain")
            # Nur 1 Punkt pro Check wenn ALLE Domains OK
            break  # Nur erste Domain für Score
        done
        [ "${MTA:-0}" = "1" ] && SCORE=$((SCORE + 1))
        [ "${TLS:-0}" = "1" ] && SCORE=$((SCORE + 1))
        [ "${BIMI:-0}" = "1" ] && SCORE=$((SCORE + 1))

        echo "$SCORE"
        ;;
    detail)
        # Detaillierte Ausgabe pro Domain
        RESULTS=""

        # DANE (hostname-level)
        if [ -n "$HOSTNAME" ]; then
            DANE_RESULT=$(check_dane "$HOSTNAME")
            [ "$DANE_RESULT" != "1" ] && RESULTS="${RESULTS}${HOSTNAME}:DANE_missing,"
        fi

        for domain in $DOMAINS; do
            MISSING=""
            [ "$(check_mta_sts "$domain")" != "1" ] && MISSING="${MISSING}MTA-STS "
            [ "$(check_tls_rpt "$domain")" != "1" ] && MISSING="${MISSING}TLS-RPT "
            [ "$(check_bimi "$domain")" != "1" ] && MISSING="${MISSING}BIMI "

            if [ -n "$MISSING" ]; then
                RESULTS="${RESULTS}${domain}:${MISSING% },"
            fi
        done

        if [ -n "$RESULTS" ]; then
            echo "${RESULTS%,}"
        else
            echo "OK"
        fi
        ;;
    *)
        echo "Usage: $0 [dane|mta_sts|tls_rpt|bimi|detail|score]"
        exit 1
        ;;
esac
