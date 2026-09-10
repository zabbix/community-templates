#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - Sync Jobs Check
#  Version:    1.0
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Überwacht Mailcow IMAP Sync Jobs (eingebaute Migration)
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================
MAILCOW_DIR=""
if [ -d "/opt/mailcow-dockerized" ]; then
    MAILCOW_DIR="/opt/mailcow-dockerized"
elif [ -d "/opt/containers/mailcow" ]; then
    MAILCOW_DIR="/opt/containers/mailcow"
else
    echo "0"
    exit 0
fi

# DB Password auslesen. cut -f2- (nicht -f2) behaelt ein '=' im Passwort;
# -f2 haette bei jedem Passwort mit '=' still nur den ersten Teil geliefert.
DBPASS=$(grep -m1 "^DBPASS=" "$MAILCOW_DIR/mailcow.conf" 2>/dev/null | cut -d= -f2-)

if [ -z "$DBPASS" ]; then
    echo "0"
    exit 0
fi

# MySQL Container (mit mailcow-Filter, damit keine fremde mysql-Instanz matcht)
MYSQL_CONTAINER=$(docker ps --filter "name=mysql" --format "{{.Names}}" 2>/dev/null | grep -i mailcow | head -1)
[ -z "$MYSQL_CONTAINER" ] && \
    MYSQL_CONTAINER=$(docker ps --filter "name=maria" --format "{{.Names}}" 2>/dev/null | grep -i mailcow | head -1)

if [ -z "$MYSQL_CONTAINER" ]; then
    echo "0"
    exit 0
fi

# Passwort ueber MYSQL_PWD-Env an docker exec durchreichen, statt -p"$DBPASS"
# im argv: sonst lesbar in der Host-Prozessliste bei jedem der Aufrufe unten.
export MYSQL_PWD="$DBPASS"

case "$1" in
    active)
        # Anzahl aktiver Sync Jobs
        docker exec -e MYSQL_PWD "$MYSQL_CONTAINER" mysql -u mailcow mailcow -Nse "SELECT COUNT(*) FROM imapsync WHERE active=1;" 2>/dev/null || echo 0
        ;;
    running)
        # Aktuell laufende Sync Jobs
        docker exec -e MYSQL_PWD "$MYSQL_CONTAINER" mysql -u mailcow mailcow -Nse "SELECT COUNT(*) FROM imapsync WHERE is_running=1;" 2>/dev/null || echo 0
        ;;
    failed)
        # Failed Syncs (letzte 24h)
        docker exec -e MYSQL_PWD "$MYSQL_CONTAINER" mysql -u mailcow mailcow -Nse "SELECT COUNT(*) FROM imapsync WHERE (returned_text LIKE '%error%' OR returned_text LIKE '%fail%' OR returned_text LIKE '%died%') AND last_run > DATE_SUB(NOW(), INTERVAL 24 HOUR);" 2>/dev/null || echo 0
        ;;
    never_run)
        # Jobs die noch nie liefen aber aktiv sind
        docker exec -e MYSQL_PWD "$MYSQL_CONTAINER" mysql -u mailcow mailcow -Nse "SELECT COUNT(*) FROM imapsync WHERE active=1 AND last_run IS NULL;" 2>/dev/null || echo 0
        ;;
    oldest_run)
        # Ältester Last-Run in Stunden (von aktiven Jobs)
        docker exec -e MYSQL_PWD "$MYSQL_CONTAINER" mysql -u mailcow mailcow -Nse "SELECT COALESCE(TIMESTAMPDIFF(HOUR, MAX(last_run), NOW()), 0) FROM imapsync WHERE active=1 AND last_run IS NOT NULL;" 2>/dev/null || echo 0
        ;;
    stuck)
        # Jobs die >24h am Laufen sind (stuck)
        docker exec -e MYSQL_PWD "$MYSQL_CONTAINER" mysql -u mailcow mailcow -Nse "SELECT COUNT(*) FROM imapsync WHERE is_running=1 AND last_run < DATE_SUB(NOW(), INTERVAL 24 HOUR);" 2>/dev/null || echo 0
        ;;
    *)
        echo 0
        ;;
esac
