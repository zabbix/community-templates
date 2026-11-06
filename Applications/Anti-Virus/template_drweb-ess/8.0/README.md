# Dr.Web ESS events by SNMP traps

[Русский](README.ru.md)

A community Zabbix template for notifications sent by the central Dr.Web Enterprise Security Suite server. It receives SNMPv2c traps, decodes UTF-8 Hex-STRING values and creates problems with the affected station in the event name and `station` tag.

The template names and decoded event labels are currently in Russian. This README describes installation in English.

## Event coverage

| Problem | Severity |
| --- | --- |
| Threat detected | High |
| Epidemic | Disaster |
| Station update failed | Warning |
| Repository update failed | Average |
| Repository product frozen after an update error | Average |
| Antivirus installation failed | Average |
| License key about to expire | Warning |
| License key expired | High |
| License key blocked | High |
| Station/license limit | Average |
| Station count close to limit | Warning |
| Connection error during key renewal | Warning |
| Low disk space or free inodes on the ESS server | High |
| Station unseen for a long time | Warning |
| Neighbor ESS server unseen for a long time | Average |
| Server log write/rotation error | Average |
| Station authorization failed | Warning |
| Administrator authorization failed/unknown administrator | Warning |
| Station reboot required | Information |
| Too many abnormal disconnects | Warning |

The common notification prefix is `1.3.6.1.4.1.29690.1.0`. Additional notifications, including file processing errors (`.16`, `.53`), HIPS and application control, are kept in the general history without dedicated triggers. Notification `.35` is stored as a built-in connection check without creating a problem.

## Configure trap reception

If the Zabbix server already receives traps, reuse that setup; do not replace shared configuration blindly. The following example is for Debian 13 and the official Zabbix Perl receiver.

1. Install packages:

   ```bash
   sudo apt install snmptrapd libsnmp-perl curl
   ```

2. Obtain the official receiver from the [Zabbix source repository](https://github.com/zabbix/zabbix/blob/master/misc/snmptrap/zabbix_trap_receiver.pl). The receiver is an external dependency, not included in this package. Review the downloaded script before loading it:

   ```bash
   sudo install -d -m 0755 /usr/local/lib/snmp
   sudo curl -fL https://raw.githubusercontent.com/zabbix/zabbix/master/misc/snmptrap/zabbix_trap_receiver.pl \
     -o /usr/local/lib/snmp/zabbix_trap_receiver.pl
   sudo chmod 0644 /usr/local/lib/snmp/zabbix_trap_receiver.pl
   ```

   Set its `$SNMPTrapperFile` variable to:

   ```perl
   $SNMPTrapperFile = '/var/log/snmptrap/snmptrap.log';
   ```

3. Create the log directory and file. On Debian the receiver service uses `Debian-snmp`; Zabbix needs read access. Use the numeric group of the actual Zabbix service account to avoid local/domain group name collisions:

   ```bash
   trap_reader_gid=$(id -g zabbix)
   sudo install -d -o Debian-snmp -g "$trap_reader_gid" -m 2750 /var/log/snmptrap
   sudo touch /var/log/snmptrap/snmptrap.log
   sudo chown "Debian-snmp:$trap_reader_gid" /var/log/snmptrap/snmptrap.log
   sudo chmod 0640 /var/log/snmptrap/snmptrap.log
   ```

   Adapt the account/group if your services use different identities. Do not truncate an existing trap log.

4. Add to `/etc/snmp/snmptrapd.conf`, replacing both placeholders:

   ```conf
   authCommunity log,execute YOUR_COMMUNITY ESS_SOURCE_IP
   outputOption n
   perl do "/usr/local/lib/snmp/zabbix_trap_receiver.pl";
   ```

   `ESS_SOURCE_IP` is the source address seen by the receiver, including any NAT. Zabbix macros are not expanded in this file. Keep numeric OIDs enabled: the parser expects the official receiver's `PDU INFO`/`VARBINDS` format, not arbitrary SNMPTT output.

5. Set the following in the Zabbix server configuration, with no duplicate active definitions:

   ```ini
   StartSNMPTrapper=1
   SNMPTrapperFile=/var/log/snmptrap/snmptrap.log
   ```

   Enable/restart the receiver and restart Zabbix to apply configuration changes:

   ```bash
   sudo systemctl enable --now snmptrapd.socket
   sudo systemctl restart snmptrapd.service
   sudo systemctl restart zabbix-server.service
   ```

   Permit inbound UDP 162 from the ESS server if filtering is enabled. For a proxy deployment configure trap reception on that proxy, not the central server.

## Configure ESS and import the template

1. In the ESS Control Center open **Administration → Notifications configuration**. Add/select SNMP delivery, set the Zabbix receiver address and the same community as `snmptrapd`. Save and enable the notification types required in your environment. The SNMP polling-agent extension is not required for notification delivery.
2. Import `templates/drweb_ess_snmp_zabbix.yaml` into Zabbix and link **DrWeb ESS SNMP traps** to the host representing the central ESS server.
3. Set the host macro `{$DRWEB.IP}` to the ESS source IP. Its template default is deliberately empty.
4. In that host's SNMP interface enter `{$DRWEB.IP}` as the IP address, select **Connect to: IP**, and leave port `161`. Incoming traps use UDP 162; the interface port does not change the receiver port.
5. Select the server/proxy that actually receives these traps as the host's monitoring endpoint. The template cannot create or change a host interface automatically.
6. Use **Send test message** in ESS. Under Latest data inspect **Dr.Web: тестовое сообщение**, **Dr.Web: последнее событие, читаемый текст** and **Dr.Web: разобранное событие JSON**. Use a fresh message after configuration synchronization.

Keep an existing `snmptrap.fallback` item if needed. A trap matched by the template's trap item no longer reaches fallback. Disable any older demonstration trigger which would otherwise duplicate behavior.

## Problems, history and notifications

- Each matching notification creates a separate problem, even when another problem of the same type is open. Close problems manually after investigation. No automatic time-based recovery is assumed.
- The Zabbix problem host is the central ESS server; the affected station is extracted from the notification. Server-level notifications without a station show `Сервер Dr.Web`.
- Event names and tags are captured for each event. Changes to the template do not rename old problems.
- Raw traps, parsed JSON, readable messages and event-specific values are retained for seven days. Fields depend on the notification and may include station ID/address/group, threat, object path, action, error and license details.
- To include the event details in a Zabbix action message, add `{ITEM.VALUE1}`. Operational data uses `{ITEM.LASTVALUE1}`, which can display a more recent notification from the same item.
- Alert delivery still requires your own Zabbix actions, recipients and media types.
