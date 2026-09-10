#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - Uninstaller
#  Version:    1.2
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Entfernt Collector, Reader, Configs und systemd Units
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================
set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

echo ""
echo "============================================="
echo " Mailcow Monitoring v1.2 - Uninstall"
echo "============================================="
echo ""

if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}✗ Please run as root!${NC}"
    exit 1
fi

read -p "Remove Mailcow Monitoring completely? (y/n): " -n 1 -r
echo ""
[[ ! $REPLY =~ ^[JjYy]$ ]] && { echo "Aborted."; exit 0; }

# 1. systemd Timer/Service stoppen
echo -e "${YELLOW}[1/6] Stopping systemd units...${NC}"
systemctl stop mailcow-monitor.timer 2>/dev/null || true
systemctl disable mailcow-monitor.timer 2>/dev/null || true
systemctl stop mailcow-monitor.service 2>/dev/null || true
rm -f /etc/systemd/system/mailcow-monitor.timer
rm -f /etc/systemd/system/mailcow-monitor.service
systemctl daemon-reload
echo -e "${GREEN}✓ systemd units removed${NC}"

# 2. Collector & Reader & Helper
echo -e "${YELLOW}[2/6] Removing scripts...${NC}"
rm -f /usr/local/bin/mailcow-collector.py
rm -f /usr/local/bin/mailcow-reader.sh
for S in check_rbl.sh check_dns.sh check_tls.sh check_ptr.sh check_open_relay.sh \
         check_security_audit.sh \
         dovecot_check.sh sync_jobs_check.sh postfix_stats_docker.sh \
         postfix_log_analysis.sh check_postfix_running.sh check_mailcow_ui.sh \
         check_agent_uptime.sh check_backup_age.sh check_backup_size.sh \
         check_backup_zero.sh rspamd_stats.sh; do
    rm -f "/usr/local/bin/$S"
done
echo -e "${GREEN}✓ Scripts removed${NC}"

# 3. Zabbix Agent Config
echo -e "${YELLOW}[3/6] Removing Zabbix config...${NC}"
rm -f /etc/zabbix/zabbix_agent2.d/mailcow*.conf
echo -e "${GREEN}✓ UserParameter configs removed${NC}"

# 4. Sudoers
echo -e "${YELLOW}[4/6] Removing sudoers...${NC}"
rm -f /etc/sudoers.d/zabbix-mailcow
echo -e "${GREEN}✓ Sudoers removed${NC}"

# 5. Cache/JSON
echo -e "${YELLOW}[5/6] Removing cache...${NC}"
rm -f /run/mailcow-monitor/monitor.json
rm -f /run/mailcow-monitor/monitor.json.tmp
rm -f /run/mailcow-monitor/monitor-slow.json
rm -f /run/mailcow-monitor/monitor-mailflow.json
rm -rf /run/mailcow-monitor
# Altlasten bis v1.2.1: der Zustand lag in /var/tmp
rm -f /var/tmp/mailcow-monitor.json /var/tmp/mailcow-monitor.json.tmp \
      /var/tmp/mailcow-monitor-slow.json /var/tmp/mailcow-monitor-mailflow.json \
      /var/tmp/rbl_check.cache /var/tmp/rbl_check_detail.cache \
      /var/tmp/ptr_check.cache /var/tmp/postfix_log_analysis.cache \
      /var/tmp/rspamd_stats.cache /var/tmp/dovecot_check.cache
rm -f /run/mailcow-monitor/rbl.cache /run/mailcow-monitor/rspamd_stats.cache /run/mailcow-monitor/rbl_detail.cache
echo -e "${GREEN}✓ Cache removed${NC}"

# 6. Zabbix Agent neustarten
echo -e "${YELLOW}[6/6] Restarting Zabbix agent...${NC}"
systemctl restart zabbix-agent2 2>/dev/null && \
    echo -e "${GREEN}✓ Zabbix Agent 2 restarted${NC}" || \
    echo -e "${YELLOW}! Zabbix Agent 2 could not be restarted${NC}"

echo ""
echo "============================================="
echo -e "${GREEN} Uninstall complete.${NC}"
echo "============================================="
echo ""
echo "  Backups (created by update.sh): /var/backups/mailcow-zabbix/"
echo "  Remove the Zabbix template manually:"
echo "    Data collection → Templates → 'Mailcow by Zabbix agent 2' → Unlink/Delete"
echo ""
