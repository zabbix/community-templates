#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - RBL Blacklist Check
#  Version:    1.2
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Prüft ob die Server-IP auf gängigen Blacklists gelistet ist
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================
#
#  v1.2 FIX: DNSBLs antworten mit 127.255.255.x als FEHLERCODE, nicht als
#  Listung. Spamhaus liefert z.B. 127.255.255.254 ("query via open/public
#  resolver"), wenn die Abfrage von einem Rechenzentrums- oder Public-Resolver
#  kommt (Hetzner, Google DNS, Cloudflare ...). Die alte Version zaehlte jede
#  nicht-leere Antwort als Listung -> permanenter Disaster-Fehlalarm.
#  Jetzt gilt nur 127.0.0.x als echte Listung; 127.255.255.x wird als
#  Prueffehler gemeldet (count=0, detail=error_*), damit kein Alarm entsteht
#  und der Fehler trotzdem sichtbar ist.
#
#  HINWEIS: Auf Hetzner/Cloud-Hosts ist Spamhaus ueber den Provider-Resolver
#  grundsaetzlich nicht nutzbar. Fuer echte Ergebnisse entweder einen lokalen
#  rekursiven Resolver (unbound) betreiben und RBL_RESOLVER=127.0.0.1 setzen,
#  oder einen Spamhaus-DQS-Key verwenden.
# ====================================================================

# Verzeichnis anlegen: im Normalbetrieb macht das systemd (RuntimeDirectory),
# bei einem manuellen Aufruf existiert es aber nicht.
mkdir -p /run/mailcow-monitor 2>/dev/null || true

CACHE_FILE="/run/mailcow-monitor/rbl.cache"
CACHE_DETAIL_FILE="/run/mailcow-monitor/rbl_detail.cache"
CACHE_MAX_AGE=1800  # 30 Minuten

# Optional: eigener rekursiver Resolver fuer DNSBL-Abfragen, z.B. 127.0.0.1
RESOLVER="${RBL_RESOLVER:-}"
DIG_OPTS=""
[ -n "$RESOLVER" ] && DIG_OPTS="@$RESOLVER"

# Cache pruefen
if [ -f "$CACHE_FILE" ]; then
    CACHE_AGE=$(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)))
    if [ $CACHE_AGE -lt $CACHE_MAX_AGE ]; then
        if [ "$1" = "detail" ] && [ -f "$CACHE_DETAIL_FILE" ]; then
            cat "$CACHE_DETAIL_FILE"
        else
            cat "$CACHE_FILE"
        fi
        exit 0
    fi
fi

# --- Oeffentliche IPv4 ermitteln -------------------------------------
# -4 erzwingen: auf Dual-Stack-Hosts mit IPv6-Resolvern lieferte die alte
# Variante teils gar nichts.
MAIL_IP=$(dig -4 +short +time=3 myip.opendns.com @resolver1.opendns.com 2>/dev/null | grep -oE "^[0-9]+(\.[0-9]+){3}$" | head -1)
[ -z "$MAIL_IP" ] && MAIL_IP=$(dig -4 +short +time=3 txt o-o.myaddr.l.google.com @ns1.google.com 2>/dev/null | tr -d '"' | grep -oE "^[0-9]+(\.[0-9]+){3}$" | head -1)
[ -z "$MAIL_IP" ] && MAIL_IP=$(curl -4 -s --max-time 5 ifconfig.me 2>/dev/null | grep -oE "^[0-9]+(\.[0-9]+){3}$")
[ -z "$MAIL_IP" ] && MAIL_IP=$(curl -4 -s --max-time 5 icanhazip.com 2>/dev/null | grep -oE "^[0-9]+(\.[0-9]+){3}$")

if [ -z "$MAIL_IP" ] || echo "$MAIL_IP" | grep -qE '^(10\.|172\.(1[6-9]|2[0-9]|3[01])\.|192\.168\.|127\.)'; then
    echo "0" > "$CACHE_FILE"
    echo "error_no_public_ip" > "$CACHE_DETAIL_FILE"
    if [ "$1" = "detail" ]; then cat "$CACHE_DETAIL_FILE"; else cat "$CACHE_FILE"; fi
    exit 0
fi

RBLS=(
    "zen.spamhaus.org"
    "bl.spamcop.net"
    "b.barracudacentral.org"
)

LISTED=0
ERRORS=0
DETAILS=""
ERRDETAILS=""
REVERSED=$(echo "$MAIL_IP" | awk -F. '{print $4"."$3"."$2"."$1}')

for RBL in "${RBLS[@]}"; do
    RESULT=$(dig +short +time=5 $DIG_OPTS "$REVERSED.$RBL" 2>/dev/null | grep -oE "^127\.[0-9]+\.[0-9]+\.[0-9]+$")
    [ -z "$RESULT" ] && continue

    HIT=0
    ERR=0
    while read -r CODE; do
        [ -z "$CODE" ] && continue
        case "$CODE" in
            127.255.255.*)
                # 252 = falsche Abfrage, 254 = public resolver, 255 = rate limit
                ERR=1
                ;;
            127.0.0.*)
                HIT=1
                ;;
            *)
                ERR=1
                ;;
        esac
    done <<< "$RESULT"

    if [ $HIT -eq 1 ]; then
        LISTED=$((LISTED + 1))
        DETAILS="${DETAILS}${RBL} "
    elif [ $ERR -eq 1 ]; then
        ERRORS=$((ERRORS + 1))
        ERRDETAILS="${ERRDETAILS}${RBL} "
    fi
done

# count zaehlt AUSSCHLIESSLICH echte Listungen
# (nicht per tee ausgeben: bei Aufruf mit "detail" wuerde sonst zusaetzlich
#  die Zahl auf stdout landen und das Detail-Item zwei Zeilen bekommen)
echo $LISTED > "$CACHE_FILE"

if [ $LISTED -gt 0 ]; then
    echo "${DETAILS% }" > "$CACHE_DETAIL_FILE"
elif [ $ERRORS -gt 0 ]; then
    echo "error_resolver_blocked:${ERRDETAILS% }" > "$CACHE_DETAIL_FILE"
else
    echo "clean" > "$CACHE_DETAIL_FILE"
fi

if [ "$1" = "detail" ]; then
    cat "$CACHE_DETAIL_FILE"
else
    cat "$CACHE_FILE"
fi
