#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - JSON Reader
#  Version:    1.0
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Liest Metriken aus /run/mailcow-monitor/monitor.json
#               Wird von Zabbix UserParameters aufgerufen - keine Rechte nötig
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================
#  v1.0: Python3 für alle Value-Typen (LLD JSON-Arrays etc.)
# ====================================================================

JSON_FILE="/run/mailcow-monitor/monitor.json"
KEY="$1"

if [ -z "$KEY" ]; then
    echo "Usage: $0 <key>"
    exit 1
fi

if [ ! -f "$JSON_FILE" ]; then
    echo "ZBX_NOTSUPPORTED: No data file"
    exit 1
fi

# Prüfe ob Datei älter als 5 Minuten (Collector läuft nicht)
FILE_AGE=$(( $(date +%s) - $(stat -c %Y "$JSON_FILE" 2>/dev/null || echo 0) ))
if [ "$FILE_AGE" -gt 300 ]; then
    echo "ZBX_NOTSUPPORTED: Data stale (${FILE_AGE}s)"
    exit 1
fi

# Python3 zum Lesen - sicher für alle Value-Typen (Strings, Zahlen, JSON-Arrays)
#
# Key und Pfad werden per argv uebergeben, NICHT in den Quelltext interpoliert.
# Vorher stand hier d.get('${KEY}') in einem doppelt gequoteten Here-String:
# damit war jeder Aufrufer in der Lage, beliebigen Python-Code auszufuehren, z.B.
#   mailcow-reader.sh "x') or open('/tmp/pwn','w').write('x') or d.get('y"
# Die UserParameter dieses Templates uebergeben zwar nur feste Keys aus der
# Config, aber das Script liegt ausfuehrbar in /usr/local/bin und laeuft mit den
# Rechten des Aufrufers - eine offene Code-Ausfuehrung ohne Not.
# Einfache Quotes um das Python-Programm: die Shell ersetzt darin nichts.
RESULT=$(python3 -c '
import json, sys
try:
    with open(sys.argv[1]) as f:
        d = json.load(f)
except (OSError, ValueError):
    print("ZBX_NOTSUPPORTED: Read error")
    sys.exit(1)
v = d.get(sys.argv[2])
if v is None:
    print("ZBX_NOTSUPPORTED: Key not found")
    sys.exit(1)
if isinstance(v, (dict, list)):
    print(json.dumps(v, separators=(",", ":")))
else:
    print(v)
' "$JSON_FILE" "$KEY" 2>/dev/null)
RC=$?

# Pythons Meldung durchreichen statt sie zu ueberschreiben.
# Vorher stand hier:
#     if [ $? -ne 0 ] || [ -z "$RESULT" ]; then echo "...Read error"; fi
# Damit wurde das praezise "Key not found" durch ein generisches "Read error"
# ersetzt - ein Diagnosewerkzeug, das die Diagnose wegwirft. Und ein Wert, der
# legitim ein Leerstring ist, wurde als Fehler gemeldet.
if [ -n "$RESULT" ]; then
    echo "$RESULT"
    exit $RC
fi

# Kein Output: entweder ist der Wert ein Leerstring (dann RC=0 und das ist
# korrekt), oder python3 selbst ist gescheitert.
if [ $RC -eq 0 ]; then
    echo ""
    exit 0
fi
echo "ZBX_NOTSUPPORTED: Read error (python3 failed)"
exit 1
