#!/bin/bash
# ====================================================================
#  Mailcow Zabbix Monitoring - Komplett-Test
#  Version:    1.2
#  Vendor:     Alexander Fox | PlaNet Fox
#  Project:    https://github.com/linuser/Mailcow-Zabbix-Monitoring
#  Description: Prüft alle 247 UserParameters via zabbix_get
#  License:    MIT (see LICENSE)
#  Created with Open Source and ♥
# ====================================================================

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
PASS=0; FAIL=0; WARN=0

echo "============================================="
echo " Mailcow Monitoring v1.2 - Complete test"
echo " 247 UserParameters / 247 Template Items"
echo "============================================="
echo ""

test_key() {
    local label="$1" key="$2" expect_type="${3:-any}"
    RESULT=$(zabbix_get -s 127.0.0.1 -k "$key" 2>&1)
    local rc=$?
    # Fehler = zabbix_get-Fehler, leeres Ergebnis oder ein echtes Reader-Sentinel.
    # Der Reader meldet Fehler ausschliesslich mit Prefix "ZBX_NOTSUPPORTED"
    # (No data file / Data stale / Key not found / Read error). Der frühere
    # fuzzy-Match auf "error|not supported|cannot" prüfte den WERT und meldete
    # legitime String-Metriken wie watchdog.detail=...:error fälschlich als FAIL.
    if [ $rc -ne 0 ] || [ -z "$RESULT" ] || [ "${RESULT#ZBX_NOTSUPPORTED}" != "$RESULT" ]; then
        printf "  ${RED}✗${NC} %-45s %s\n" "$label" "${RED}ERROR: $RESULT${NC}"
        FAIL=$((FAIL + 1)); return 1
    fi
    case "$expect_type" in
        number) echo "$RESULT" | grep -qE '^-?[0-9]+\.?[0-9]*$' || { printf "  ${YELLOW}?${NC} %-45s %s\n" "$label" "${YELLOW}$RESULT (erwartet: Zahl)${NC}"; WARN=$((WARN+1)); return 0; } ;;
        bool)   echo "$RESULT" | grep -qE '^[01]$' || { printf "  ${YELLOW}?${NC} %-45s %s\n" "$label" "${YELLOW}$RESULT (erwartet: 0/1)${NC}"; WARN=$((WARN+1)); return 0; } ;;
        json)   echo "$RESULT" | grep -qE '^\[|^\{' || { printf "  ${YELLOW}?${NC} %-45s %s\n" "$label" "${YELLOW}(kein JSON)${NC}"; WARN=$((WARN+1)); return 0; } ;;
    esac
    DISPLAY="$RESULT"; [ ${#DISPLAY} -gt 60 ] && DISPLAY="${DISPLAY:0:57}..."
    printf "  ${GREEN}✓${NC} %-45s %s\n" "$label" "$DISPLAY"
    PASS=$((PASS + 1))
}

# [0] PRE-CHECK
echo -e "${BLUE}=== [0] Zabbix Agent Status ===${NC}\n"
systemctl is-active --quiet zabbix-agent2 || { echo -e "${RED}✗ Agent läuft NICHT!${NC}"; exit 1; }
echo -e "  ${GREEN}✓${NC} Zabbix Agent 2 running"
zabbix_get -s 127.0.0.1 -k agent.ping >/dev/null 2>&1 || { echo -e "${RED}✗ Agent responding NICHT!${NC}"; exit 1; }
echo -e "  ${GREEN}✓${NC} Agent responding"
PARAMS=$(grep -c '^UserParameter' /etc/zabbix/zabbix_agent2.d/mailcow*.conf 2>/dev/null)
echo -e "  ${GREEN}✓${NC} $PARAMS UserParameters loaded"
if [ -f /run/mailcow-monitor/monitor.json ]; then
    AGE=$(( $(date +%s) - $(stat -c %Y /run/mailcow-monitor/monitor.json) ))
    KEYS=$(python3 -c "import json; print(len(json.load(open('/run/mailcow-monitor/monitor.json'))))" 2>/dev/null)
    echo -e "  ${GREEN}✓${NC} Collector: $KEYS keys, ${AGE}s old"
fi
echo ""

# [1] Agent/Meta (8)
echo -e "${BLUE}=== [1] Agent & Meta (8 Keys) ===${NC}\n"
for k in running uptime restarts configs log.errors log.warnings timeout unsafe; do test_key "Agent $k" "zabbix.agent.$k"; done
echo ""

# [2] Collector (4)
echo -e "${BLUE}=== [2] Collector (4 Keys) ===${NC}\n"
for k in running age last_run duration keys errors error.detail module.times; do test_key "Collector $k" "mailcow.collector.$k"; done
test_key "DB reachable" "mailcow.db.reachable" bool
echo ""

# [3] Postfix (16)
echo -e "${BLUE}=== [3] Postfix (16 Keys) ===${NC}\n"
test_key "Queue size" "postfix.pfmailq" number
test_key "Connections" "postfix.connections" number
test_key "Process running" "postfix.process.running" bool
test_key "Fetch log data" "postfix.fetch_log_data" string
test_key "Queue disk %" "mailcow.queue.disk" number
for k in sasl.auth.failed relay.denied user.unknown rbl.reject connection.timeout tls.failed quota.exceeded spam.rejected virus.found warnings errors; do
    test_key "Log: $k" "postfix.log.$k" number
done
for k in active connect pass.new pass.old reject dnsbl pregreet hangup whitelisted; do
    test_key "Postscreen $k" "postfix.postscreen.$k" number
done
echo ""

# [4] Dovecot (9)
echo -e "${BLUE}=== [4] Dovecot (9 Keys) ===${NC}\n"
test_key "Running" "mailcow.dovecot.running" bool
test_key "Connections" "mailcow.dovecot.connections" number
for k in imap.login.failed imap.disconnected pop3.login.failed imap.errors quota.warnings sync.errors; do test_key "$k" "mailcow.dovecot.$k" number; done
test_key "Version" "mailcow.dovecot.version" string
echo ""

# [5] Rspamd (14)
echo -e "${BLUE}=== [5] Rspamd (14 Keys) ===${NC}\n"
test_key "Running" "mailcow.rspamd.running" bool
for k in scanned spam ham greylist soft_reject rewrite learned spam.rate uptime; do test_key "$k" "mailcow.rspamd.$k" number; done
test_key "Version" "mailcow.rspamd.version" string
test_key "Add header" "mailcow.rspamd.add.header" number
test_key "Reject total" "mailcow.rspamd.reject.total" number
test_key "Action detail" "mailcow.rspamd.action.detail" string
for k in bayes.ham.learned bayes.spam.learned bayes.total.learned bayes.ratio; do test_key "Bayes $k" "mailcow.rspamd.$k" number; done
test_key "Bayes status" "mailcow.rspamd.bayes.status" string
echo ""

# [6] Security (13)
echo -e "${BLUE}=== [6] Security (13 Keys) ===${NC}\n"
for k in fail2ban.banned fail2ban.postfix fail2ban.dovecot fail2ban.sogo rbl.listed; do test_key "$k" "mailcow.security.$k" number; done
test_key "RBL detail" "mailcow.security.rbl.detail" string
test_key "Open relay" "mailcow.security.open.relay" bool
for k in dane.exists mta_sts.exists tls_rpt.exists bimi.exists audit.score; do test_key "Security $k" "mailcow.security.$k" number; done
test_key "Audit detail" "mailcow.security.audit.detail" string
for k in spf.exists dmarc.exists dkim.exists ptr.valid; do test_key "$k" "mailcow.dns.$k" bool; done
test_key "DNS detail" "mailcow.dns.detail" string
test_key "DNS domains" "mailcow.dns.domains" string
echo ""

# [7] Disk (15)
echo -e "${BLUE}=== [7] Disk Space (15 Keys) ===${NC}\n"
for prefix in root docker; do
    for k in total free used; do test_key "$prefix $k" "mailcow.disk.$prefix.$k" number; done
done
test_key "Docker top containers" "mailcow.disk.docker.top.containers" string
test_key "vmail exists" "mailcow.disk.vmail.exists" bool
for k in total free used; do test_key "vmail $k" "mailcow.disk.vmail.$k" number; done
test_key "vmail maildir size" "mailcow.disk.vmail.maildir.size" number
for k in total free used; do test_key "log $k" "mailcow.disk.log.$k" number; done
echo ""

# [8] Sync Jobs (6)
echo -e "${BLUE}=== [8] Sync Jobs (6 Keys) ===${NC}\n"
for k in active running failed never_run oldest_run stuck; do test_key "$k" "mailcow.sync.jobs.$k" number; done
echo ""

# [9] Mailbox & Domain (10)
echo -e "${BLUE}=== [9] Mailbox & Domain (10 Keys) ===${NC}\n"
for k in total active quota.used.total over.quota unlimited; do test_key "Mailbox $k" "mailcow.mailbox.$k" number; done
test_key "Top 5" "mailcow.mailbox.top5" string
test_key "Over detail" "mailcow.mailbox.over.detail" string
for k in total active; do test_key "Domain $k" "mailcow.domain.$k" number; done
test_key "Domain list" "mailcow.domain.list" string
echo ""

# [10] Alias (5)
echo -e "${BLUE}=== [10] Alias (5 Keys) ===${NC}\n"
for k in total active inactive forwarding internal; do test_key "Alias $k" "mailcow.alias.$k" number; done
echo ""

# [11] Mailflow (28)
echo -e "${BLUE}=== [11] Mailflow (28 Keys) ===${NC}\n"
for k in received delivered forwarded deferred bounced rejected reject.rate bytes.received bytes.delivered senders recipients sending.domains recipient.domains; do
    test_key "$k" "mailcow.mail.$k" number
done
for k in top.senders top.recipients top.sending.domains top.recipient.domains reject.detail bounce.detail; do
    test_key "$k" "mailcow.mail.$k" string
done
for k in reject.rbl reject.unknown.user reject.relay.denied reject.domain.notfound reject.cleanup warnings.sasl warnings.tls warnings.dns warnings.postscreen; do
    test_key "$k" "mailcow.mail.$k" number
done
echo ""

# [12] ClamAV (8)
echo -e "${BLUE}=== [12] ClamAV (8 Keys) ===${NC}\n"
test_key "Running" "mailcow.clamav.running" bool
test_key "Version" "mailcow.clamav.version" string
test_key "Signatures" "mailcow.clamav.signatures" number
for k in daily.version daily.age main.version db.size; do test_key "$k" "mailcow.clamav.$k" number; done
test_key "Daily build" "mailcow.clamav.daily.build" string
echo ""

# [13] Watchdog (18)
echo -e "${BLUE}=== [13] Watchdog (18 Keys) ===${NC}\n"
test_key "Overall health %" "mailcow.watchdog.overall" number
test_key "Unhealthy count" "mailcow.watchdog.unhealthy" number
test_key "Unhealthy detail" "mailcow.watchdog.detail" string
for k in postfix dovecot rspamd mysql nginx sogo redis unbound phpfpm fail2ban acme queue olefy replication ratelimit; do
    test_key "$k" "mailcow.watchdog.$k" number
done
echo ""

# [14] ACME (7)
echo -e "${BLUE}=== [14] ACME Certificate (7 Keys) ===${NC}\n"
test_key "Cert exists" "mailcow.acme.cert.exists" bool
for k in subject issuer valid.from valid.until serial; do test_key "Cert $k" "mailcow.acme.cert.$k" string; done
test_key "Cert days left" "mailcow.acme.cert.days.left" number
echo ""

# [15] Docker Health (7)
echo -e "${BLUE}=== [15] Docker Health (7 Keys) ===${NC}\n"
for k in total running restarts.total mem.total.mb cpu.total; do test_key "Docker $k" "mailcow.docker.$k" number; done
test_key "Container discovery" "mailcow.docker.containers" json
test_key "Container data" "mailcow.docker.container.data" json
echo ""

# [16] SOGo / Memcached (8)
echo -e "${BLUE}=== [16] SOGo / Memcached (8 Keys) ===${NC}\n"
for k in items bytes limit.mb hits misses evictions uptime; do test_key "Memcached $k" "mailcow.sogo.memcached.$k" number; done
test_key "Hit rate %" "mailcow.sogo.memcached.hit.rate" number
echo ""

# [17] Quarantine (6)
echo -e "${BLUE}=== [17] Quarantine (6 Keys) ===${NC}\n"
for k in total spam virus age.oldest.hours age.newest.hours; do test_key "Quarantine $k" "mailcow.quarantine.$k" number; done
test_key "Top domains" "mailcow.quarantine.top.domains" string
echo ""

# [18] Queue Age (4)
echo -e "${BLUE}=== [18] Queue Age (4 Keys) ===${NC}\n"
for k in deferred active hold age.oldest.hours; do test_key "Queue $k" "mailcow.queue.$k" number; done
echo ""

# [19] LLD Discovery (6)
echo -e "${BLUE}=== [19] LLD Discovery (6 Keys) ===${NC}\n"
for k in domains domain.data mailboxes mailbox.data syncjobs syncjob.data; do
    test_key "LLD $k" "mailcow.lld.$k" json
done
echo ""

# [17] TLS (10)
echo -e "${BLUE}=== [20] TLS / SSL (10 Keys) ===${NC}\n"
for k in https.check submission.check imaps.check; do test_key "$k" "mailcow.tls.$k" bool; done
test_key "UI check" "mailcow.ui.check" bool
for p in 443 587 993; do test_key "Cert days $p" "mailcow.tls.cert.days.$p" number; done
for p in 443 587 993; do test_key "Cert raw $p" "mailcow.tls.cert.raw.$p" string; done
echo ""

# [18] Updates (12)
echo -e "${BLUE}=== [21] Updates & Version (12 Keys) ===${NC}\n"
for k in current branch commit date latest; do test_key "Version $k" "mailcow.version.$k" string; done
test_key "Updates available" "mailcow.updates.available" bool
test_key "Commits behind" "mailcow.updates.commits.behind" number
test_key "Update script" "mailcow.update.script.exists" bool
for k in hostname timezone; do test_key "Config $k" "mailcow.config.$k" string; done
for k in postfix dovecot; do test_key "Container $k" "mailcow.container.version.$k" string; done
echo ""

# [19] Backup (optional, 8)
BACKUP_EXISTS=$(zabbix_get -s 127.0.0.1 -k mailcow.backup.dir.exists 2>/dev/null)
if [ "$BACKUP_EXISTS" = "1" ]; then
    echo -e "${BLUE}=== [22] Backup (8 Keys) ===${NC}\n"
    for k in dir.exists script.exists count age size disk.free last.timestamp zero.files; do
        test_key "Backup $k" "mailcow.backup.$k"
    done
    echo ""
else
    echo -e "${YELLOW}=== [22] Backup: not configured (skipped) ===${NC}\n"
fi

# ERGEBNIS
TOTAL=$((PASS + FAIL + WARN))
echo "============================================="
echo " RESULT"
echo "============================================="
echo ""
printf "  ${GREEN}✓ Passed:${NC}  %d\n" "$PASS"
printf "  ${YELLOW}? Warning:${NC}    %d\n" "$WARN"
printf "  ${RED}✗ Failed:${NC} %d\n" "$FAIL"
printf "  ─────────────────\n"
printf "  Total:         %d / 247\n" "$TOTAL"
echo ""
if [ $FAIL -eq 0 ]; then
    echo -e "${GREEN}============================================="
    echo -e " ✅ ALL TESTS PASSED!"
    echo -e "=============================================${NC}"
else
    echo -e "${RED}============================================="
    echo -e " ⚠  $FAIL FAILURES FOUND!"
    echo -e "=============================================${NC}"
    echo "Hints: sudo python3 /usr/local/bin/mailcow-collector.py"
    echo "       tail -20 /var/log/zabbix/zabbix_agent2.log"
fi
echo ""
