#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - Postfix Log Analysis
#  Version:    1.0
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Analysiert Postfix Logs nach SASL, Relay, TLS, Spam, Virus und Postscreen Events
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================
CONTAINER=$(docker ps --filter "name=postfix" --format "{{.Names}}" 2>/dev/null | grep -i mailcow | head -1)
if [ -z "$CONTAINER" ]; then
    echo 0
    exit 0
fi
# Verzeichnis anlegen: im Normalbetrieb macht das systemd (RuntimeDirectory),
# bei einem manuellen Aufruf existiert es aber nicht.
mkdir -p /run/mailcow-monitor 2>/dev/null || true

CACHE_FILE="/run/mailcow-monitor/postfix_log.cache"
CACHE_MAX_AGE=60  # 60 Sekunden Cache

# Cache aktualisieren wenn nötig
update_cache() {
    LOGS=$(timeout 20 docker exec "$CONTAINER" tail -1000 /var/log/mail.log 2>/dev/null)

    if [ -z "$LOGS" ]; then
        echo '{"sasl_auth_failed":0}' > "$CACHE_FILE"
        return
    fi

    # Robuste Zaehlung. grep -c gibt bei 0 Treffern "0" aus UND liefert exit 1 -
    # das alte "|| echo 0" haengte dann ein zweites "0" an ("0\n0") und machte das
    # JSON kaputt, sobald ein Zaehler 0 war (auf gesunden Servern der Normalfall).
    # Folge: jq scheiterte am kaputten Cache und ALLE Keys dieses Scripts lasen 0.
    # safe_count validiert das Ergebnis und liefert immer genau eine Zahl.
    safe_count() { local c; c=$(printf '%s\n' "$LOGS" | grep -cE "$1" 2>/dev/null | head -1); [[ "$c" =~ ^[0-9]+$ ]] || c=0; echo "$c"; }

    # Alle Counts in einem Durchgang
    SASL_AUTH_FAILED=$(safe_count "SASL.*authentication failed")
    RELAY_DENIED=$(safe_count "Relay access denied")
    USER_UNKNOWN=$(safe_count "User unknown in")
    RBL_REJECT=$(safe_count "blocked using")
    CONNECTION_TIMEOUT=$(safe_count "Connection timed out")
    TLS_FAILED=$(safe_count "TLS.*handshake failed|SSL.*error")
    QUOTA_EXCEEDED=$(safe_count "mailbox.*full|quota.*exceeded|Disk quota")
    SPAM_REJECTED=$(safe_count "milter-reject.*Spam message rejected")
    VIRUS_FOUND=$(safe_count "Infected.*FOUND")
    WARNINGS=$(safe_count "warning:")
    ERRORS=$(safe_count "error:|fatal:")

    # Postscreen Stats (nur wenn aktiv)
    POSTSCREEN_PASS_NEW=$(safe_count "postscreen.*PASS NEW")
    POSTSCREEN_PASS_OLD=$(safe_count "postscreen.*PASS OLD")
    POSTSCREEN_REJECT=$(safe_count "postscreen.*NOQUEUE.*reject")
    POSTSCREEN_DNSBL=$(safe_count "postscreen.*DNSBL")
    POSTSCREEN_PREGREET=$(safe_count "postscreen.*PREGREET")
    POSTSCREEN_HANGUP=$(safe_count "postscreen.*HANGUP")
    POSTSCREEN_WHITELISTED=$(safe_count "postscreen.*WHITELISTED")
    POSTSCREEN_CONNECT=$(safe_count "postscreen.*CONNECT")
    # Aktiv = mindestens 1 postscreen-Logeintrag
    if [ "$POSTSCREEN_CONNECT" -gt 0 ] || [ "$POSTSCREEN_PASS_NEW" -gt 0 ]; then
        POSTSCREEN_ACTIVE=1
    else
        POSTSCREEN_ACTIVE=0
    fi

    # JSON schreiben
    cat > "$CACHE_FILE" << EOFJSON
{
  "sasl_auth_failed": $SASL_AUTH_FAILED,
  "relay_denied": $RELAY_DENIED,
  "user_unknown": $USER_UNKNOWN,
  "rbl_reject": $RBL_REJECT,
  "connection_timeout": $CONNECTION_TIMEOUT,
  "tls_failed": $TLS_FAILED,
  "quota_exceeded": $QUOTA_EXCEEDED,
  "spam_rejected": $SPAM_REJECTED,
  "virus_found": $VIRUS_FOUND,
  "warnings": $WARNINGS,
  "errors": $ERRORS,
  "postscreen_active": $POSTSCREEN_ACTIVE,
  "postscreen_pass_new": $POSTSCREEN_PASS_NEW,
  "postscreen_pass_old": $POSTSCREEN_PASS_OLD,
  "postscreen_reject": $POSTSCREEN_REJECT,
  "postscreen_dnsbl": $POSTSCREEN_DNSBL,
  "postscreen_pregreet": $POSTSCREEN_PREGREET,
  "postscreen_hangup": $POSTSCREEN_HANGUP,
  "postscreen_whitelisted": $POSTSCREEN_WHITELISTED,
  "postscreen_connect": $POSTSCREEN_CONNECT
}
EOFJSON
}

# Cache prüfen
if [ ! -f "$CACHE_FILE" ] || [ $(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0))) -gt $CACHE_MAX_AGE ]; then
    update_cache
fi

# Aus Cache lesen
if command -v jq &>/dev/null; then
    cat "$CACHE_FILE" 2>/dev/null | jq -r ".${1} // 0" 2>/dev/null || echo 0
else
    grep -oP "\"$1\":\s*\K\d+" "$CACHE_FILE" 2>/dev/null || echo 0
fi
