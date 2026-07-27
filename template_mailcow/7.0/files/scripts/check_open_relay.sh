#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - Open Relay Check
#  Version:    1.0
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Prüft ob mynetworks unsichere Einträge enthält (0.0.0.0/0 oder ::/0)
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================
# --- Postfix Container ermitteln ---
POSTFIX_CONTAINER=$(docker ps --filter "name=postfix" --format "{{.Names}}" 2>/dev/null | grep -i mailcow | head -1)

if [ -z "$POSTFIX_CONTAINER" ]; then
    # Postfix Container nicht gefunden → kann nicht prüfen → sicher melden
    echo 0
    exit 0
fi

# --- mynetworks aus Postfix auslesen ---
MYNETWORKS=$(docker exec "$POSTFIX_CONTAINER" postconf mynetworks 2>/dev/null)

if [ -z "$MYNETWORKS" ]; then
    # Kann postconf nicht lesen → sicher melden
    echo 0
    exit 0
fi

# --- Prüfe auf unsichere Einträge ---
# 0.0.0.0/0 = jede IPv4-Adresse darf relayen
# ::/0 = jede IPv6-Adresse darf relayen
# Auch Varianten wie 0.0.0.0/0 ohne Leerzeichen etc.
if echo "$MYNETWORKS" | grep -qE '(0\.0\.0\.0/0|::/0)'; then
    # OPEN RELAY: Unsichere mynetworks-Konfiguration!
    echo 1
    exit 0
fi

# --- Zusätzlich: Prüfe ob permit_mynetworks UND smtpd_recipient_restrictions korrekt ---
RECIPIENT_RESTRICTIONS=$(docker exec "$POSTFIX_CONTAINER" postconf smtpd_recipient_restrictions 2>/dev/null)

# Wenn smtpd_recipient_restrictions komplett leer oder nur permit enthält
if echo "$RECIPIENT_RESTRICTIONS" | grep -qE '^\s*smtpd_recipient_restrictions\s*=\s*permit\s*$'; then
    # Alles wird erlaubt → Open Relay
    echo 1
    exit 0
fi

# Alles okay
echo 0
