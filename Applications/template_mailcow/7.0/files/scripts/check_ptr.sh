#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - PTR Record Check
#  Version:    1.0
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Prüft ob der PTR-Record der öffentlichen IP auf den MAILCOW_HOSTNAME zeigt
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================
MAILCOW_DIR="/opt/mailcow-dockerized"
# Verzeichnis anlegen: im Normalbetrieb macht das systemd (RuntimeDirectory),
# bei einem manuellen Aufruf existiert es aber nicht.
mkdir -p /run/mailcow-monitor 2>/dev/null || true

CACHE_FILE="/run/mailcow-monitor/ptr.cache"
CACHE_MAX_AGE=3600  # 1 Stunde

# Cache prüfen
if [ -f "$CACHE_FILE" ]; then
    CACHE_AGE=$(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)))
    if [ $CACHE_AGE -lt $CACHE_MAX_AGE ]; then
        cat "$CACHE_FILE"
        exit 0
    fi
fi

# --- MAILCOW_HOSTNAME ermitteln ---
MAILCOW_HOSTNAME=$(grep -oP "^MAILCOW_HOSTNAME=\K[a-zA-Z0-9._-]+" "$MAILCOW_DIR/mailcow.conf" 2>/dev/null)
if [ -z "$MAILCOW_HOSTNAME" ]; then
    echo 0 | tee "$CACHE_FILE"
    exit 0
fi

# --- Öffentliche IP ermitteln (Fallback-Kette, Bug #7) ---
MAIL_IP=$(timeout 5 dig +short +time=3 +tries=1 myip.opendns.com @resolver1.opendns.com 2>/dev/null | grep -oP "^[0-9.]+" | head -1)
[ -z "$MAIL_IP" ] && MAIL_IP=$(curl -4 -s --max-time 5 ifconfig.me 2>/dev/null)
[ -z "$MAIL_IP" ] && MAIL_IP=$(curl -4 -s --max-time 5 icanhazip.com 2>/dev/null)
[ -z "$MAIL_IP" ] && MAIL_IP=$(timeout 5 dig +short +time=3 +tries=1 txt o-o.myaddr.l.google.com @ns1.google.com 2>/dev/null | tr -d '"' | head -1)

# Prüfe ob IP gültig
if [ -z "$MAIL_IP" ] || echo "$MAIL_IP" | grep -qE '^(10\.|172\.(1[6-9]|2[0-9]|3[01])\.|192\.168\.)'; then
    echo 0 | tee "$CACHE_FILE"
    exit 0
fi

# --- PTR Lookup ---
# Reverse IP für dig -x
PTR_RESULT=$(timeout 5 dig +short +time=3 +tries=1 -x "$MAIL_IP" 2>/dev/null | sed 's/\.$//' | head -1)

if [ -z "$PTR_RESULT" ]; then
    echo 0 | tee "$CACHE_FILE"
    exit 0
fi

# --- Vergleich: PTR muss auf MAILCOW_HOSTNAME zeigen ---
if [ "$PTR_RESULT" = "$MAILCOW_HOSTNAME" ]; then
    echo 1 | tee "$CACHE_FILE"
else
    echo 0 | tee "$CACHE_FILE"
fi
