#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - Postfix Stats Parser
#  Version:    1.0
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Liest Postfix Queue-Statistiken aus dem Docker-Container
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================
CONTAINER=$(docker ps --filter "name=postfix" --format "{{.Names}}" 2>/dev/null | grep -i mailcow | head -1)
if [ -z "$CONTAINER" ]; then
    printf '{}\n'
    exit 0
fi

# Hole Logs (mit Timeout, falls der Container haengt)
LOGS=$(timeout 20 docker exec "$CONTAINER" tail -1000 /var/log/mail.log 2>/dev/null)

# Safe Count Funktion (robust gegen Fehler)
safe_count() {
    local pattern="$1"
    local count
    count=$(echo "$LOGS" | grep -c "$pattern" 2>/dev/null)
    count=$(echo "$count" | head -1)
    if ! [[ "$count" =~ ^[0-9]+$ ]]; then
        count=0
    fi
    echo "$count"
}

# Metriken zählen
RECEIVED=$(safe_count "postfix/smtpd.*client=")
DELIVERED=$(safe_count "status=sent")
BOUNCED=$(safe_count "status=bounced")
DEFERRED=$(safe_count "status=deferred")
REJECTED=$(safe_count "reject:")
REJECT_WARN=$(safe_count "reject_warning")
DISCARDED=$(safe_count "discard:")
HELD=$(safe_count "status=hold")
FORWARDED=$(safe_count "forwarded")

# Senders & Recipients
SENDERS=$(echo "$LOGS" | grep "from=<" 2>/dev/null | grep -oP 'from=<[^>]+>' 2>/dev/null | sort -u | wc -l | head -1)
RECIPIENTS=$(echo "$LOGS" | grep "to=<" 2>/dev/null | grep -oP 'to=<[^>]+>' 2>/dev/null | sort -u | wc -l | head -1)

[[ "$SENDERS" =~ ^[0-9]+$ ]] || SENDERS=0
[[ "$RECIPIENTS" =~ ^[0-9]+$ ]] || RECIPIENTS=0

# JSON Output
printf '{"received":%d,"delivered":%d,"bounced":%d,"deferred":%d,"rejected":%d,"reject_warnings":%d,"discarded":%d,"held":%d,"forwarded":%d,"bytes_received":0,"bytes_delivered":0,"senders":%d,"recipients":%d,"bounced_domains":[]}\n' \
  "$RECEIVED" "$DELIVERED" "$BOUNCED" "$DEFERRED" "$REJECTED" "$REJECT_WARN" "$DISCARDED" "$HELD" "$FORWARDED" "$SENDERS" "$RECIPIENTS"
