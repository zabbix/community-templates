#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - Installer
#  Version:    1.2
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Installiert Collector, Reader, Configs und systemd Units
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================
set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; BLUE='\033[0;34m'; YELLOW='\033[1;33m'; NC='\033[0m'

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Mailcow Monitoring v1.2 - Install       ║${NC}"
echo -e "${BLUE}║  Secure Service Architecture             ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════╝${NC}"
echo ""

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# --- Root check ---
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Please run as root${NC}"
    exit 1
fi

# --- Mailcow finden ---
MAILCOW_DIR="/opt/mailcow-dockerized"
if [ ! -f "$MAILCOW_DIR/mailcow.conf" ]; then
    echo -e "${RED}mailcow.conf not found in $MAILCOW_DIR${NC}"
    exit 1
fi

DOMAIN=$(grep -oP "^MAILCOW_HOSTNAME=\K[a-zA-Z0-9._-]+" "$MAILCOW_DIR/mailcow.conf" 2>/dev/null)
echo -e "${GREEN}✓ Domain: $DOMAIN${NC}"

# --- Backup-Pfad ---
BACKUP_PATH="/opt/backup"
OLD_BACKUP=$(grep -rh "BACKUP_PATH_PLACEHOLDER\|find -L " /usr/local/bin/check_backup_*.sh 2>/dev/null | grep -oP '(?<=-L )[^ ]+' | head -1)
[ -n "$OLD_BACKUP" ] && BACKUP_PATH="$OLD_BACKUP"
if [ -d "/opt/backup" ]; then BACKUP_PATH="/opt/backup"
elif [ -d "/backup" ]; then BACKUP_PATH="/backup"
fi
echo -e "${GREEN}✓ Backup path: $BACKUP_PATH${NC}"

# ====================================================================
echo ""
echo -e "${BLUE}=== [1/5] Installing scripts ===${NC}"
# ====================================================================

# Reader (der Collector folgt gleich danach)
install -o root -g root -m 0755 "$SCRIPT_DIR/scripts/mailcow-reader.sh" /usr/local/bin/
echo -e "  ${GREEN}✓ mailcow-reader.sh${NC}"

# Python Collector
cp "$SCRIPT_DIR/scripts/mailcow-collector.py" /usr/local/bin/
chmod +x /usr/local/bin/mailcow-collector.py
echo -e "  ${GREEN}✓ mailcow-collector.py (Python)${NC}"

# Alten Bash-Collector entfernen
rm -f /usr/local/bin/mailcow-collector.sh
echo -e "  ${GREEN}✓ mailcow-collector.sh (Bash) removed${NC}"

# Alte Scripts aus v4.0-v4.3 aufräumen
# Alte Zustandsdateien aus /var/tmp entfernen. Bis v1.2.1 lag der gesamte
# Zustand dort - weltschreibbar. Ab v1.2.1 liegt er in /run/mailcow-monitor,
# das systemd anlegt und das root gehoert. Die Reste sonst blieben liegen.
for OLD_STATE in mailcow-monitor.json mailcow-monitor.json.tmp \
                 mailcow-monitor-slow.json mailcow-monitor-mailflow.json \
                 rbl_check.cache rbl_check_detail.cache ptr_check.cache \
                 postfix_log_analysis.cache rspamd_stats.cache \
                 dovecot_check.cache; do
    rm -f "/var/tmp/$OLD_STATE"
done

# dovecot_check.sh: seit #opt10 macht collect_dovecot() alles inline via docker
# exec. Das Script wurde nie aufgerufen, lag aber weiter in /usr/local/bin.
for OLD_SCRIPT in dovecot_check.sh \
                  check_postfix_running.sh check_backup_age.sh check_backup_size.sh \
                  check_backup_count.sh check_backup_exists.sh check_backup_zero.sh \
                  check_dovecot_running.sh check_rspamd_running.sh check_fail2ban.sh \
                  check_disk_usage.sh check_vmail.sh mailcow_version.sh; do
    if [ -f "/usr/local/bin/$OLD_SCRIPT" ]; then
        rm -f "/usr/local/bin/$OLD_SCRIPT"
        echo -e "  ${YELLOW}✓ $OLD_SCRIPT (obsolete) removed${NC}"
    fi
done

# Alten Slow-Cache löschen (Format hat sich geändert)
rm -f /run/mailcow-monitor/monitor-slow.json
echo -e "  ${GREEN}✓ Slow cache reset${NC}"

# Bestehende Scripts aktualisieren
for SCRIPT in check_rbl.sh check_dns.sh check_tls.sh check_ptr.sh check_open_relay.sh \
              check_security_audit.sh \
              sync_jobs_check.sh \
              postfix_stats_docker.sh postfix_log_analysis.sh; do
    if [ -f "$SCRIPT_DIR/scripts/$SCRIPT" ]; then
        cp "$SCRIPT_DIR/scripts/$SCRIPT" /usr/local/bin/
        chmod +x /usr/local/bin/$SCRIPT
        echo -e "  ${GREEN}✓ $SCRIPT${NC}"
    fi
done

# Python Collector erkennt Backup-Pfad automatisch

# Git safe.directory
git config --system --add safe.directory "$MAILCOW_DIR" 2>/dev/null

# pflogsumm für Mailflow-Statistiken
if ! which pflogsumm >/dev/null 2>&1; then
    echo -e "  ${YELLOW}pflogsumm not found, installing...${NC}"
    apt-get install -y pflogsumm >/dev/null 2>&1 && \
        echo -e "  ${GREEN}✓ pflogsumm installed${NC}" || \
        echo -e "  ${YELLOW}⚠ pflogsumm could not be installed (mailflow stats unavailable)${NC}"
else
    echo -e "  ${GREEN}✓ pflogsumm present${NC}"
fi

# ====================================================================
echo ""
echo -e "${BLUE}=== [2/5] Installing systemd service ===${NC}"
# ====================================================================

cp "$SCRIPT_DIR/mailcow-monitor.service" /etc/systemd/system/
cp "$SCRIPT_DIR/mailcow-monitor.timer" /etc/systemd/system/
systemctl daemon-reload
systemctl enable mailcow-monitor.timer
systemctl start mailcow-monitor.timer
echo -e "${GREEN}✓ mailcow-monitor.timer enabled${NC}"

# Ersten Lauf manuell starten
echo -e "${YELLOW}  First collector run (may take up to 60s)...${NC}"
systemctl start mailcow-monitor.service
echo -e "${GREEN}✓ First run completed${NC}"

# ====================================================================
echo ""
echo -e "${BLUE}=== [3/5] Configuring Zabbix agent ===${NC}"
# ====================================================================

# Alte Einzel-Configs entfernen
rm -f /etc/zabbix/zabbix_agent2.d/mailcow-*.conf
rm -f /etc/zabbix/zabbix_agent2.d/mailcow.conf.bak

# Neue Single-Config
cp "$SCRIPT_DIR/mailcow-zabbix.conf" /etc/zabbix/zabbix_agent2.d/mailcow.conf
echo -e "${GREEN}✓ 246 UserParameters in a single config${NC}"

# UnsafeUserParameters NICHT mehr nötig
if grep -q "^UnsafeUserParameters=1" /etc/zabbix/zabbix_agent2.conf 2>/dev/null; then
    sed -i 's/^UnsafeUserParameters=1/UnsafeUserParameters=0/' /etc/zabbix/zabbix_agent2.conf
    echo -e "${GREEN}✓ UnsafeUserParameters=0 set${NC}"
fi

# ServerActive pruefen. ALLE 246 Items sind aktive Checks: der Agent holt sie
# selbst von der Adresse in ServerActive. Server= regelt nur passive Abfragen
# und genuegt NICHT. Fehlt ServerActive (oder zeigt es auf localhost, waehrend
# der Zabbix-Server woanders laeuft), sammelt kein einziges Item Daten - ohne
# Fehlermeldung. Items und Trigger sind im Frontend sichtbar, Graphen bleiben
# leer. Wir aendern hier nichts automatisch: eine kaputte Zeile verhindert den
# Agent-Start komplett.
AGENT_CONF="/etc/zabbix/zabbix_agent2.conf"
if [ -f "$AGENT_CONF" ]; then
    SA=$(grep -E '^ServerActive=' "$AGENT_CONF" | head -1 | cut -d= -f2-)
    HN=$(grep -E '^Hostname=' "$AGENT_CONF" | head -1 | cut -d= -f2-)
    SA_COUNT=$(grep -cE '^ServerActive=' "$AGENT_CONF")

    if [ -z "$SA" ]; then
        echo -e "${RED}✗ ServerActive is not set${NC}"
        echo -e "${RED}  All 246 items are ACTIVE checks. Without ServerActive"
        echo -e "  NOT a single item will collect data - silently.${NC}"
        echo -e "${YELLOW}  Add to $AGENT_CONF:"
        echo -e "    ServerActive=<ip-or-name-of-your-zabbix-server>"
        echo -e "    Hostname=<must match the host name in Zabbix>${NC}"
        AGENT_WARN=1
    elif echo "$SA" | grep -qE '^(127\.0\.0\.1|localhost)(,|$)'; then
        echo -e "${YELLOW}⚠ ServerActive=$SA points at localhost"
        echo -e "  Only correct if the Zabbix server runs on THIS host.${NC}"
        AGENT_WARN=1
    else
        echo -e "${GREEN}✓ ServerActive=$SA${NC}"
    fi

    if [ "$SA_COUNT" -gt 1 ]; then
        echo -e "${RED}✗ ServerActive is defined $SA_COUNT times - the agent will not start${NC}"
        AGENT_WARN=1
    fi

    if [ -z "$HN" ]; then
        echo -e "${YELLOW}⚠ Hostname not set - must exactly match the host name in Zabbix${NC}"
        AGENT_WARN=1
    else
        echo -e "${GREEN}✓ Hostname=$HN${NC}"
    fi
else
    echo -e "${YELLOW}⚠ $AGENT_CONF not found - is Zabbix Agent 2 installed?${NC}"
    AGENT_WARN=1
fi

# ====================================================================
echo ""
echo -e "${BLUE}=== [4/5] Hardening security ===${NC}"
# ====================================================================

# Docker-Gruppe: nicht anfassen (wird ggf. von anderen Templates benötigt)

# Alte sudoers entfernen
if [ -f /etc/sudoers.d/zabbix-mailcow ]; then
    rm -f /etc/sudoers.d/zabbix-mailcow
    echo -e "${GREEN}✓ Sudo rules removed${NC}"
else
    echo -e "${GREEN}✓ No sudo rules present${NC}"
fi

# JSON-File für zabbix lesbar
chmod 640 /run/mailcow-monitor/monitor.json 2>/dev/null

# ====================================================================
echo ""
echo -e "${BLUE}=== [5/5] Restarting agent + test ===${NC}"
# ====================================================================

# Nur neu starten/testen, wenn ein Zabbix-Agent erkannt wurde. Sonst wuerde
# 'systemctl restart zabbix-agent2' (bzw. das folgende zabbix_get) unter 'set -e'
# die ganze Installation abbrechen - obwohl der Collector selbst laeuft.
if [ "${AGENT_WARN:-0}" = "1" ]; then
    echo -e "${YELLOW}⚠ Zabbix Agent 2 not detected — skipping restart and self-test.${NC}"
    echo -e "${YELLOW}  Configure zabbix-agent2, then run: systemctl restart zabbix-agent2${NC}"
    PASS=0; ERRORS=0
else
    systemctl restart zabbix-agent2 2>/dev/null \
        && echo -e "${GREEN}✓ zabbix-agent2 restarted${NC}" \
        || echo -e "${YELLOW}⚠ Could not restart zabbix-agent2 — start it manually${NC}"
    sleep 3

    # Quick test
    ERRORS=0
    PASS=0
    for key in postfix.process.running mailcow.rspamd.scanned mailcow.disk.root.used \
               mailcow.dovecot.running mailcow.version.current \
               mailcow.mailbox.total mailcow.collector.running; do
        RESULT=$(zabbix_get -s 127.0.0.1 -k "$key" 2>/dev/null) || RESULT=""
        if [ -n "$RESULT" ] && ! echo "$RESULT" | grep -q "NOTSUPPORTED\|error"; then
            echo -e "  ${GREEN}✓ $key = $RESULT${NC}"
            PASS=$((PASS + 1))
        else
            echo -e "  ${RED}✗ $key = $RESULT${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    done
fi

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║         INSTALLATION COMPLETE            ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${GREEN}✓ Collector: systemd timer (every 60s as root)${NC}"
echo -e "  ${GREEN}✓ Reader: /run/mailcow-monitor/monitor.json${NC}"
echo -e "  ${GREEN}✓ Zabbix: reads JSON only (no privileges required)${NC}"
echo ""
echo -e "  Security:"
echo -e "  ${GREEN}✓ No UnsafeUserParameters${NC}"

echo -e "  ${GREEN}✓ No sudo for Zabbix${NC}"
echo ""
echo -e "  Test: $PASS passed, $ERRORS failed"
echo ""
echo -e "  Commands:"
echo -e "    systemctl status mailcow-monitor.timer"
echo -e "    cat /run/mailcow-monitor/monitor.json | python3 -m json.tool | head -20"
echo -e "    zabbix_get -s 127.0.0.1 -k mailcow.rspamd.scanned"
echo ""
echo -e "  ${YELLOW}⚠ Zabbix Template:${NC}"
echo -e "    Data collection → Templates → Import"
echo -e "    File: templates/mailcow-complete-monitoring.yaml"
echo -e "    ${YELLOW}Tick 'Create new' AND 'Update existing', NOT 'Delete missing'.${NC}"
echo -e "    With only 'Update existing' Zabbix skips missing objects and still"
echo -e "    reports success - you end up with 0 triggers."
echo -e "    Afterwards the template must show: Items 246 | Triggers 63 | Dashboards 19"
echo ""
echo -e "    If old individual templates (Postfix, Dovecot, Security...) are"
echo -e "    still linked: unlink them first."
if [ "${AGENT_WARN:-0}" = "1" ]; then
    echo ""
    echo -e "  ${RED}⚠ Agent configuration needs attention (see [3/5] above).${NC}"
    echo -e "  ${RED}  Until ServerActive is correct, no data will be collected.${NC}"
    echo -e "    Validate before restarting:  zabbix_agent2 -T -c $AGENT_CONF"
fi
