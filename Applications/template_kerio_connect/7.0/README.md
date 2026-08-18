# Kerio Connect by External check

## Overview

Monitors Kerio Connect mail server via Zabbix External check scripts and Zabbix agent UserParameters.

Tested with Kerio Connect 10.x on Debian 12 and Windows Server.

## Requirements

Zabbix version: 7.0 and higher

### Setup

**On the Zabbix server or proxy:**

1. Copy `files/kerio_connect_check.sh` and `files/kerio_check_ssl.sh` to the ExternalScripts directory (default: `/usr/lib/zabbix/externalscripts/`).

2. Set permissions:

```bash
chmod 750 /usr/lib/zabbix/externalscripts/kerio_connect_check.sh
chmod 750 /usr/lib/zabbix/externalscripts/kerio_check_ssl.sh
chown root:zabbix /usr/lib/zabbix/externalscripts/kerio_connect_check.sh
chown root:zabbix /usr/lib/zabbix/externalscripts/kerio_check_ssl.sh
```

3. Create the credentials file:

```bash
cat > /etc/zabbix/kerio_credentials.conf << 'EOF'
KERIO_USER=zbx_monitor
KERIO_PASS=YourPassword
EOF
chmod 600 /etc/zabbix/kerio_credentials.conf
chown zabbix:zabbix /etc/zabbix/kerio_credentials.conf
```

4. Install dependencies: `apt install curl openssl gawk`

**On the Kerio Connect server (Zabbix agent):**

1. Copy `files/kerio_agent.conf` to `/etc/zabbix/zabbix_agentd.d/`
2. Copy `files/kerio_mailstats.sh` to `/etc/zabbix/scripts/`
3. Update the script path in `kerio_agent.conf`
4. Set ACLs so the zabbix user can read Kerio logs, queue, and backup directories
5. Install dependencies: `apt install gawk acl`

**On a Windows Kerio Connect server (Zabbix agent):**

1. Copy `files/kerio_agent.conf` to `C:\Program Files\Zabbix Agent\zabbix_agentd.d\`
2. Edit `kerio_agent.conf`: comment out the Linux lines, uncomment the Windows lines
3. Copy `files/kerio_mailstats.ps1` to `C:\Program Files\Zabbix Agent\scripts\`
4. Ensure the Zabbix agent service account has read access to the Kerio store directories (`C:\Program Files\Kerio\MailServer\store\logs`, `queue`, `backup`)
5. Restart the Zabbix Agent service

**On a Windows Zabbix server or proxy:**

1. Copy `files/kerio_connect_check.ps1` to the ExternalScripts directory
2. Create a wrapper batch file in the same directory:

```batch
@echo off
powershell -ExecutionPolicy Bypass -File "%~dp0kerio_connect_check.ps1" %1 %2 %3
```

Save as `kerio_connect_check.sh.bat` (Zabbix calls the `.sh` name from the template, the `.bat` extension is matched automatically on Windows).

3. Create credentials file:

```
C:\ProgramData\Zabbix\kerio_credentials.conf
```

Content:
```
KERIO_USER=Admin
KERIO_PASS=YourPassword
```

Set NTFS permissions: only the Zabbix agent service account should have read access:

```powershell
icacls "C:\ProgramData\Zabbix\kerio_credentials.conf" /inheritance:r /grant "NT SERVICE\Zabbix Agent:(R)"
```

**In Kerio Connect administration:**

Create a monitoring user `zbx_monitor` with admin privileges. Enter its credentials in the credentials file above.

### Macros used

| Macro | Default | Description |
|-------|---------|-------------|
| {$KERIO.ADMIN.PORT} | 4040 | Kerio Connect administration port |
| {$KERIO.QUEUE.MAX.WARN} | 50 | Mail queue warning threshold |
| {$KERIO.QUEUE.MAX.CRIT} | 200 | Mail queue critical threshold |
| {$KERIO.CERT.DAYS.MAX.WARN} | 30 | SSL certificate warning days before expiry |
| {$KERIO.CERT.DAYS.MAX.CRIT} | 7 | SSL certificate critical days before expiry |
| {$KERIO.BACKUP.AGE.MAX.CRIT} | 26 | Maximum backup age in hours |
| {$KERIO.LICENSE.DAYS.MAX.WARN} | 30 | License warning days before expiry |
| {$KERIO.LICENSE.DAYS.MAX.CRIT} | 7 | License critical days before expiry |
| {$KERIO.PUBLIC.HOSTNAME} | *(empty)* | Public FQDN for external checks. Leave empty to disable. |
| {$KERIO.MAIL.DOMAIN} | *(empty)* | Mail domain for MX record check. Leave empty to disable. |
| {$KERIO.CRED.FILE} | /etc/zabbix/kerio_credentials.conf | Path to the credentials file on the Zabbix server/proxy. Override per host for different passwords. |

### Multiple Kerio servers with different passwords

If you monitor multiple Kerio servers with different admin passwords, create a separate credentials file for each server on the Zabbix server or proxy:

```bash
sudo tee /etc/zabbix/kerio_cred_customer1.conf << 'EOF'
KERIO_USER=Admin
KERIO_PASS=Customer1Password
EOF
sudo chmod 600 /etc/zabbix/kerio_cred_customer1.conf
sudo chown zabbix:zabbix /etc/zabbix/kerio_cred_customer1.conf
```

Then set the `{$KERIO.CRED.FILE}` macro on each host to point to the correct file:

```
Host → Macros → Add:
  {$KERIO.CRED.FILE} = /etc/zabbix/kerio_cred_customer1.conf
```

### Items collected

| Name | Key | Type | Description |
|------|-----|------|-------------|
| Service status | systemd.unit.info | Zabbix agent | Kerio Connect service state |
| Process count | proc.num | Zabbix agent | Number of running mailserver processes |
| Memory usage (RSS) | proc.mem | Zabbix agent | Process memory consumption |
| CPU utilization | proc.cpu.util | Zabbix agent | Process CPU usage |
| SMTP/IMAP/POP3/HTTPS ports | net.tcp.service | Simple check | 11 internal + 5 external port checks |
| Response times | net.tcp.service.perf | Simple check | SMTP, IMAP, HTTPS response times |
| Mail queue count | kerio.queue.count | UserParameter | Number of emails in queue |
| Store size/free | kerio.store.* | UserParameter | Kerio store disk usage |
| Backup age/size/count | kerio.backup.* | UserParameter | Backup monitoring |
| Get statistics (master) | kerio.connect.stats.get | External check | JSON with all API data |
| Users total | kerio.connect.users.total | Dependent | Across all domains |
| Domains total | kerio.connect.domains.total | Dependent | Number of mail domains |
| Version | kerio.connect.version | Dependent | Kerio Connect version |
| Uptime | kerio.connect.uptime | Dependent | Server uptime in seconds |
| Storage used % | kerio.connect.storage.pused | Dependent | Storage utilization |
| IMAP/POP3/Web/SMTP connections | kerio.connect.connections.* | Dependent | Cumulative per protocol |
| SMTP auth failures | kerio.connect.smtp.auth.failures | Dependent | Cumulative since start |
| Spam rejected | kerio.connect.spam.rejected | Dependent | Cumulative since start |
| License days remaining | kerio.connect.license.days | Dependent | Days until expiry |
| SSL certificate days | kerio.connect.ssl.check | External check | Days until certificate expiry |
| MX record | net.dns.record | Simple check | MX record resolvable (disabled by default) |
| Mail/security/warning logs | log[] | Zabbix agent active | Log file monitoring |

### Triggers

| Name | Severity | Description |
|------|----------|-------------|
| Service is not running | High | Kerio Connect service stopped |
| No running processes | High | No mailserver process found |
| SMTP/IMAP/HTTPS not reachable | High | Internal port checks failed |
| Mail queue is growing | Warning | Queue exceeds warning threshold |
| Mail queue is too large | High | Queue exceeds critical threshold |
| SSL certificate expires soon | Warning/High | Certificate approaching expiry |
| Backup is outdated | High | Newest backup too old |
| No backup found | High | No backup files in directory |
| Storage utilization high/critical | Warning/High | Store disk running full |
| License expires soon | Warning/High | License approaching expiry |
| Has been restarted | Info | Uptime less than 10 minutes |
| Version has changed | Info | Software version changed |
| SMTP/IMAP response time high | Warning | Response time exceeds 3 seconds |
| External checks (disabled by default) | High/Average | SMTP/IMAPS/WebMail/MX not reachable externally |

### Security

- Credentials are read from a protected file, never passed as CLI arguments
- No `system.run[]` items — all local checks use UserParameters with hardcoded paths
- SSL certificate validation when `/etc/zabbix/kerio-ca.pem` exists
- Input validation on all script parameters
- Cookie files created in secure temporary directory

### Common pitfalls

**Linux agent:**

- The `kerio_agent.conf` has a default mailflow script path of `/usr/local/bin/kerio_mailstats.sh`. If your script is in `/etc/zabbix/scripts/`, update the path:
  ```bash
  sed -i 's|/usr/local/bin/kerio_mailstats.sh|/etc/zabbix/scripts/kerio_mailstats.sh|g' \
      /etc/zabbix/zabbix_agentd.d/kerio_agent.conf
  ```

- The scripts directory needs execute permission (`chmod 750`), not just read (`chmod 644`).

- Kerio's backup directory is often **not** in the default store path. Check `mailserver.cfg`:
  ```bash
  grep BackupDir /opt/kerio/mailserver/mailserver.cfg
  ```
  If it shows a different path (e.g. `/mnt/Backup`), update `kerio_agent.conf` and set ACLs on that path.

- `setfacl` is not installed by default on Debian: `apt install acl`

- `gawk` is required (not just `awk`): `apt install gawk`

**Windows agent:**

- The `kerio_agent.conf` ships with **Linux lines active and Windows lines commented out**. You must swap them: comment out all Linux lines (with `find`, `du`, `df`, `awk`) and uncomment the Windows lines (with `powershell -Command`).

- On German Windows, the agent path is `C:\Programme\Zabbix Agent 2\` not `C:\Program Files\Zabbix Agent\`. Update the mailflow script path accordingly:
  ```
  UserParameter=kerio.mailflow,powershell -ExecutionPolicy Bypass -File "C:\Programme\Zabbix Agent 2\scripts\kerio_mailstats.ps1"
  ```

- The `kerio.store.free` UserParameter is missing from the default Windows section. Add it manually:
  ```
  UserParameter=kerio.store.free,powershell -Command "(Get-PSDrive C).Free"
  ```
  Replace `C` with the drive letter where the Kerio store is located.

- Zabbix Agent 2 uses `zabbix_agent2.d\` for config includes (not `zabbix_agentd.d\`). Verify the include path in `zabbix_agent2.conf`.

- The `kerio.store.size` UserParameter can take 20+ seconds on large mail stores. Increase the agent timeout in `zabbix_agent2.conf`:
  ```
  Timeout=30
  ```
  Default is 3 seconds, which is too short for recursive directory scans.

**Proxy / multi-server:**

- External check scripts and credentials must be on the **Zabbix proxy**, not on the Kerio server.

- Each Kerio server with a different admin password needs its own credentials file. Set `{$KERIO.CRED.FILE}` on the host to point to the correct file.

- Test the API from the proxy before configuring Zabbix:
  ```bash
  sudo -u zabbix /usr/lib/zabbix/externalscripts/kerio_connect_check.sh <KERIO-IP> 4040 /etc/zabbix/kerio_cred_customer.conf
  ```

**Kerio Connect 10.x API:**

- `ServerInfo.getInfo`, `Server.getAbout`, `Connections.get`, and `Queue.get` do not exist. The scripts use `Server.getProductInfo`, `Statistics.get`, and `Server.getLicenseInfo` instead.

- `Users.get` requires a `domainId` parameter. The script iterates over all domains automatically.

**Template:**

- Disable items tagged `os: linux` on Windows hosts and `os: windows` on Linux hosts.

- POP3 port 110 may be intentionally disabled in Kerio. Check Kerio Admin → Configuration → Services before investigating the trigger. Disable the POP3 item if the service is stopped.

- External connectivity checks (`{$KERIO.PUBLIC.HOSTNAME}`) are disabled by default. Enable them only after setting the macro on the host.

## Author

Alexander Fox — [PlaNet Fox IT Consulting](https://planetfox.biz) · [GitHub](https://github.com/linuser)
