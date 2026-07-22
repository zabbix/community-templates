# Mailcow by Zabbix agent 2

Complete monitoring for [Mailcow-dockerized](https://mailcow.email/) with Zabbix
Agent 2 — **247 items, 72 triggers, 4 LLD rules, 19 template dashboards**, secure
by design.

Author: **Alexander Fox | PlaNet Fox**
Project / source: <https://github.com/linuser/Mailcow-Zabbix-Monitoring>
License: **MIT**

## Overview

A root collector gathers all metrics once per minute and writes them to a
world-unreadable JSON file; the Zabbix agent only reads that file, so it needs no
Docker access, no `sudo` and no `UnsafeUserParameters`.

```
systemd timer (60s) → mailcow-collector.py (root)
  → /run/mailcow-monitor/monitor.json (0640, group zabbix)
    → Zabbix Agent 2 (zabbix user) → mailcow-reader.sh → reads JSON
```

The collector runs as root (needs Docker/MySQL access) and writes the JSON
readable only by root and the `zabbix` group. All 247 items are **active agent
checks**.

## Compatibility

- Zabbix 7.0
- Mailcow-dockerized (running)
- Zabbix Agent 2 on the Mailcow host

## Requirements (on the Mailcow host)

- A GNU/Linux host — Debian/Ubuntu, matching Mailcow-dockerized. The scripts use
  GNU coreutils (`grep -P`, `date -d`, `stat -c`, `find -printf`) and are not
  meant for BSD/macOS or busybox/musl userlands.
- Python 3, git, `dig` (dnsutils), `openssl`, `netcat`
- `pflogsumm` (`apt install pflogsumm`) — for mailflow metrics
- `zabbix-get` — only for the bundled `test-complete.sh`
- The `zabbix` group must exist (standard when zabbix-agent2 is installed)

## Setup

All operational files (collector, check scripts, UserParameters, systemd units,
installer) are in [`files/`](files).

1. Copy `files/` to the Mailcow host and run the installer:

   ```bash
   sudo ./install.sh
   ```

   It installs the collector and check scripts to `/usr/local/bin`, writes the
   UserParameter config to `/etc/zabbix/zabbix_agent2.d/`, enables the systemd
   timer, and checks the agent's `ServerActive`/`Hostname`. Adjust `MAILCOW_DIR`
   and `BACKUP_PATH` at the top of `install.sh` if your paths differ.

2. Make sure the agent has a correct **`ServerActive`** (these are active checks —
   without it, no data is collected, silently):

   ```
   ServerActive=<your-zabbix-server-ip>
   Hostname=<host name as configured in Zabbix>
   ```

3. Import `template_mailcow.yaml` (**Data collection → Templates → Import**), tick
   **Create new** *and* **Update existing**, and link the template
   **"Mailcow by Zabbix agent 2"** to your host.

4. Verify with `sudo ./test-complete.sh` and in **Monitoring → Latest data**.

The 19 dashboards are **template dashboards** — find them under
*Monitoring → Hosts → <host> → Dashboards*.

## User macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$MAILCOW.QUEUE.WARN}` | `50` | Mail queue length that triggers a problem |
| `{$MAILCOW.QUEUE.RECOVER}` | `30` | Queue trigger resolves below this (must be < QUEUE.WARN) |
| `{$MAILCOW.DISK.WARN}` | `90` | Disk usage % that triggers a problem |
| `{$MAILCOW.DISK.RECOVER}` | `85` | Disk trigger resolves below this % (must be < DISK.WARN) |
| `{$MAILCOW.DISK.VMAIL.WARN}` | `85` | Mail storage warns earlier than other filesystems |
| `{$MAILCOW.DISK.VMAIL.RECOVER}` | `80` | vmail trigger resolves below this % |
| `{$MAILCOW.CERT.WARN}` | `14` | Certificate expiry warning threshold (days) |
| `{$MAILCOW.CERT.CRIT}` | `7` | Certificate expiry critical threshold (days, must be < CERT.WARN) |
| `{$MAILCOW.QUOTA.WARN}` | `80` | Domain/mailbox quota warning threshold (%) |
| `{$MAILCOW.QUOTA.CRIT}` | `95` | Domain/mailbox quota critical threshold (%) |
| `{$MAILCOW.CONTAINER.MEM.MAX}` | `25` | Container memory that triggers a problem (% of host memory) |
| `{$MAILCOW.SYNCJOB.AGE.MAX}` | `48` | Sync job is considered stale after this many hours |
| `{$MAILCOW.RBL.CRIT}` | `1` | Trigger if listed on this many RBLs or more |

## What's monitored

| Module | Items | Description |
|--------|-------|-------------|
| Postfix | 16 | Queue, connections, deferred/bounced, SASL failures |
| Postfix Logs | 11 | Relay denied, RBL rejects, TLS errors, quota warnings |
| Postscreen | 9 | Pass/reject/DNSBL/pregreet (auto-detected) |
| Dovecot | 10 | Connections, login failures, IMAP disconnects |
| Rspamd | 14 | Spam/ham ratio, reject rate, greylist, actions |
| Rspamd Bayes | 5 | Training status: untrained → low → good → excellent |
| Security | 13 | Fail2ban, RBL blacklist, DNS records, open relay |
| Security Audit | 6 | DANE/TLSA, MTA-STS, TLS-RPT, BIMI — score 0-7 |
| Disk | 15 | Root, Docker, vmail, log partitions |
| Mailboxes & Domains | 10 | Quota usage, top 5 mailboxes |
| Mailflow | 28 | Received/delivered/bounced + anomaly detection |
| ClamAV | 8 | Signature age, DB version, scan status |
| Watchdog | 18 | Health status for all 15 Mailcow services |
| Docker | 7 + LLD | CPU, RAM, restarts per container |
| TLS / Certificates | 10 | HTTPS, IMAPS, Submission — days until expiry |
| Backup | 9 | Age, size, count, missing backups |
| SOGo, Quarantine, Queue Age, Sync Jobs, Updates, Aliases | … | see the template |

**Low-level discovery:** domains, mailboxes, sync jobs and Docker containers are
discovered and monitored individually (4 LLD rules, 8 trigger prototypes).

**Anomaly detection:** 5 baseline triggers use `trendavg()` to learn the weekly
norm and alert on deviations (received/rejected/bounced/deferred spikes and drops)
instead of fixed thresholds.

## Security

- The Zabbix agent needs no privileges — it only reads a JSON file
  (`UnsafeUserParameters=0`, no sudo rules).
- `monitor.json` is written `0640`, group `zabbix`, so the mailbox/domain data it
  contains is not world-readable.
- The Mailcow DB password is passed to `docker exec` via a `0600` env file /
  `MYSQL_PWD` environment, never on a command line.
- The systemd unit is hardened (`NoNewPrivileges`, `ProtectSystem=full`,
  `PrivateDevices`, `RestrictAddressFamilies`, and more). Note: the collector
  reaches the Docker socket as root, which is the dominant residual risk.

## License

MIT — see the [project repository](https://github.com/linuser/Mailcow-Zabbix-Monitoring).
© 2026 Alexander Fox | PlaNet Fox.
