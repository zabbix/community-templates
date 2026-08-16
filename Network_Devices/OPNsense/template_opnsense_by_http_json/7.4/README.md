# OPNsense by HTTP-JSON

## Overview

This template monitors OPNsense firewalls via the built-in REST API using HTTP JSON agent requests.
It collects data about system resources (CPU, memory, disk, uptime), configured cron jobs, firewall states and actions,
gateway health, network interfaces, CARP, pfsync and XMLRPC high-availability status, WireGuard peers,
and UPS status via NUT (Network UPS Tools).

The template uses OPNsense API key/secret authentication and requires no agent installation
on the firewall.

## Requirements

- **Zabbix version**: 7.4 or higher
- **OPNsense version**: Tested with OPNsense 26.x+ (any version providing the used API endpoints)
- An **API key and secret** created on the OPNsense appliance
  (System → Access → Users → API keys)
- The Zabbix server/proxy must have **HTTPS access** to the OPNsense web interface
  (port 443 by default)
- The API user needs read access to the following OPNsense API modules:
  - `diagnostics/system`
  - `diagnostics/firewall`
  - `diagnostics/interface`
  - `diagnostics/traffic`
  - `routes/gateway`
  - `core/firmware`
  - `core/hasync`
  - `core/hasync_status`
  - `cron/settings`
  - `nut/diagnostics`
  - `ipsec/sessions/searchPhase(1|2)` 
  - `wireguard/service/show`
  
### Permissions

| Privilege ID                            | UI Name                                   |
| -------------------------------------- | ----------------------------------------- |
| page-diagnostics-logs-firewall-summary | Diagnostics: Logs: Firewall: Summary View |
| page-diagnostics-pf-info               | Diagnostics: Firewall statistics          |
| page-status-carp                       | Interfaces: Virtual IPs: Status           |
| page-status-trafficgraph               | Reporting: Traffic                        |
| page-system-firmware-manualupdate      | System: Firmware                          |
| page-system-cron                       | System: Settings: Cron                    |
| page-system-hasync                     | System: High Availability                 |
| page-system-gateways                   | System: Gateways                          |
| page-system-login-logout               | Lobby: Dashboard                          |
| page-status-habackup                    | Status: HA backup                         |
| page-status-ipsec | Status: IPsec |
| page-wireguard-diagnostics | VPN: WireGuard: Status |



## Setup

1. [**Create an API key** on OPNsense](https://docs.opnsense.org/development/how-tos/api.html#creating-keys):
   - Navigate to **System → Access → Users**
   - Select or create a user and click the **+** icon under *API keys*
   - Download the `apikey.txt` file – it contains the **key** and the **secret**

2. **Import the template** into Zabbix:
   - Go to **Data collection → Templates → Import** and upload the YAML file

3. **Link the template** to a host:
   - Set the host's **IP/DNS** to the OPNsense management address
   - Link the template `OPNsense by HTTP-JSON`

4. **Configure the required macros** on the host:
   - `{$OPNS.KEY}` – Your OPNsense API key
   - `{$OPNS.SECRET}` – Your OPNsense API secret

5. **Verify connectivity**:
   - After a few minutes check that the item `RAW Gatewaystatus` is receiving data

6. **UPS Monitoring (optional)**:
   - The UPS items are **disabled by default** (`RAW UPS` item has status `DISABLED`)
   - Enable the item `RAW UPS` on the host if a UPS is connected and managed by NUT on OPNsense
   - See the [UPS Monitoring](#ups-monitoring-nut) section below for details


> **Note:** The Zabbix server/proxy must trust the OPNsense TLS certificate, or Zabbix must be
> configured to skip certificate verification for HTTP agent items.

## Macros Used

| Macro | Default Value | Description |
|-------|---------------|-------------|
| `{$OPNS.KEY}` | *(empty)* | OPNsense API key used as the HTTP Basic authentication username. **Required.** |
| `{$OPNS.SECRET}` | *(empty, secret text)* | OPNsense API secret used as the HTTP Basic authentication password. **Required.** |
| `{$OPNS.CPU.LOAD.MAX}` | `2` | Maximum CPU load average before triggering a warning. |
| `{$OPNS.CRON.JOB.MATCHES}` | `.+` | Regex filter for cron job descriptions to discover. |
| `{$OPNS.CRON.JOB.NOT_MATCHES}` | `^$` | Regex filter for cron job descriptions to exclude from discovery. |
| `{$OPNS.MEMORY.UTIL.MAX}` | `90` | Maximum memory utilization (%) before triggering an alert. |
| `{$OPNS.STATE.TABLE.UTIL.MAX}` | `90` | Maximum state table utilization (%) before triggering a warning. |
| `{$OPNS.GW.MIN.PACKET.LOSS}` | `10` | Packet loss (%) to trigger a gateway packet loss alert. |
| `{$OPNS.GW.HIGH.PACKET.LOSS}` | `50` | Packet loss (%) to trigger a high packet loss alert. |
| `{$OPNS.HA.CARP.STATUS.MATCHES}` | `^(MASTER\|BACKUP)$` | Accepted CARP status regex. Override it with a VIP-address macro context to enforce `MASTER` or `BACKUP` on a node. |
| `{$OPNS.HA.CONFIG_SYNC.REQUIRED}` | `0` | Set to `1` on the XMLRPC synchronization source; keep `0` on the backup node because configuration sync is one-way. |
| `{$OPNS.HA.PFSYNC.REMOTE.NODES.MIN}` | `1` | Minimum number of remote creator IDs expected in the synchronized state table. |
| `{$OPNS.LICENSE.EXPIRY.WARN}` | `30` | Days before OPNsense Business license expiry to trigger a warning. |
| `{$OPNS.FS.FSNAME.MATCHES}` | `.+` | Regex filter for filesystem discovery – included mount points. |
| `{$OPNS.FS.FSNAME.NOT_MATCHES}` | `^(/dev\|/sys\|/run\|/proc\|.+/shm$)` | Regex filter for filesystem discovery – excluded mount points. |
| `{$OPNS.FS.FSTYPE.MATCHES}` | `^(btrfs\|ext2\|ext3\|ext4\|reiser\|xfs\|ffs\|ufs\|jfs\|jfs2\|vxfs\|hfs\|apfs\|refs\|ntfs\|fat32\|zfs)$` | Regex filter for filesystem discovery – included filesystem types. |
| `{$OPNS.FS.FSTYPE.NOT_MATCHES}` | `^\s$` | Regex filter for filesystem discovery – excluded filesystem types. |
| `{$OPNS.FS.PUSED.MAX.WARN}` | `90` | Warning threshold for filesystem space utilization (%). |
| `{$OPNS.FS.PUSED.MAX.CRIT}` | `95` | Critical threshold for filesystem space utilization (%). |
| `{$OPNS.NUT.BAT.LOW}` | `30` | Battery charge (%) below which a warning is triggered. |
| `{$OPNS.NUT.BAT.RUNTIME}` | `600` | Remaining battery runtime (seconds) below which an alert is triggered. |
| `{$OPNS.NUT.HIGH.LOAD}` | `80` | UPS load (%) above which a warning is triggered. |
| `{$OPNS.WG.INSTANCE.MATCHES}` | `.+` | Regex filter for WireGuard instances to discover. |
| `{$OPNS.WG.INSTANCE.NOT_MATCHES}` | `^$` | Regex filter for WireGuard instances to exclude from discovery. |
| `{$OPNS.WG.PEER.MATCHES}` | `.+` | Regex filter for WireGuard peers to discover. |
| `{$OPNS.WG.PEER.NOT_MATCHES}` | `^$` | Regex filter for WireGuard peers to exclude from discovery. |

## Items Collected

### System Items

| Name | Key | Type | Update Interval | Description |
|------|-----|------|-----------------|-------------|
| CPU load | `opns.cpu.load` | Dependent | – | System load average (1 min). |
| System Uptime | `opns.system.uptime` | Dependent | – | Uptime converted to seconds. Displayed in Zabbix uptime format. |
| Total Memory | `opns.memory.total` | Dependent | – | Total physical memory in bytes. |
| Used Memory | `opns.memory.used` | Dependent | – | Used memory in bytes. |
| ARC Memory | `opns.memory.arc` | Dependent | – | ZFS ARC memory usage in bytes. Returns `0` when ARC data is absent, for example on UFS systems. |
| Memory utilization in % | `opns.memory.util` | Calculated | – | Percentage of used memory relative to total memory. |
| Licensed until | `opns.product.licenseuntil` | Dependent | – | OPNsense Business Edition license expiry (Unix timestamp). Returns `0` if not present. |
| Firmware update status | `opns.firmware.update.status` | Dependent | – | Firmware update status (`none`, `update`, `upgrade`, or `error`). |
| Firmware update status message | `opns.firmware.update.status_msg` | Dependent | – | Human-readable firmware update status message. |
| Firmware update count | `opns.firmware.update.count` | Dependent | – | Number of available firmware package or set updates. |
| Firmware update packages | `opns.firmware.update.packages` | Dependent | – | List of available package or set updates. |
| Firmware update requires reboot | `opns.firmware.update.reboot` | Dependent | – | Returns `1` when the available firmware update requires a reboot. |
| Cron job count | `opns.cron.job.count` | Dependent | – | Number of configured OPNsense cron jobs. |

### Firewall Items

| Name | Key | Type | Description |
|------|-----|------|-------------|
| Firewall states current | `opns.fw.states.current` | Dependent | Current number of active firewall states. |
| Firewall states max | `opns.fw.states.max` | Dependent | Maximum number of allowed firewall states. |
| States table utilization in % | `opns.states.util` | Calculated | Percentage of the state table currently in use. |

### High Availability Items

| Name | Key | Description |
|------|-----|-------------|
| CARP VIP count | `opns.ha.carp.vip.count` | Number of configured CARP-mode VIPs. |
| CARP is allowed | `opns.ha.carp.allowed` | Global CARP enable state. |
| CARP maintenance mode | `opns.ha.carp.maintenance` | Persistent CARP maintenance state. |
| CARP demotion level | `opns.ha.carp.demotion` | Current CARP demotion counter. |
| CARP status message | `opns.ha.carp.status_message` | Global warning text reported by OPNsense. |
| HA pfsync is configured | `opns.ha.pfsync.configured` | Whether a pfsync interface is configured. |
| HA pfsync interface/peer/version/defer | `opns.ha.pfsync.*` | Effective state-synchronization configuration. |
| HA pfsync remote node count | `opns.ha.pfsync.remote.count` | Remote creator IDs currently visible in the PF state table. |
| HA configuration synchronization is configured | `opns.ha.config_sync.configured` | Whether an XMLRPC synchronization target is configured. |
| HA configuration synchronization target | `opns.ha.config_sync.target` | Configured XMLRPC peer address. |
| HA configuration synchronization items | `opns.ha.config_sync.items` | Configuration sections selected for XMLRPC synchronization. |
| HA peer is reachable through XMLRPC | `opns.ha.peer.reachable` | Result of an XMLRPC firmware-version probe to the configured peer. |
| HA peer firmware/base/kernel version | `opns.ha.peer.version*` | Versions returned by the peer. |
| HA peer firmware version matches | `opns.ha.peer.version.match` | Whether local and remote OPNsense core versions match. |

### UPS Items (NUT)

> These items are only active when `RAW UPS` is enabled on the host.

| Name | Key | Unit | Description |
|------|-----|------|-------------|
| UPS Battery Charge | `nut.battery.charge` | % | Current battery charge level. |
| UPS Battery Runtime | `nut.battery.runtime` | s | Estimated remaining battery runtime in seconds. |
| UPS Battery Load | `nut.battery.load` | % | Current load on the UPS in percent. |
| UPS Input Voltage | `nut.input.voltage` | V | Input (mains) voltage. |
| UPS Input Frequency | `nut.input.frequency` | Hz | Input (mains) frequency. |
| UPS Output Voltage | `nut.output.voltage` | V | Output voltage supplied to connected devices. |
| UPS Status | `nut.status` | Text | Current UPS status code (e.g. `OL`, `OB`, `LB`). See status codes below. |
| UPS Model | `nut.model` | Text | UPS model name as reported by NUT. |

#### UPS Status Codes

| Code | Meaning | Description |
|------|---------|-------------|
| `OL` | On Line | UPS is powered by mains electricity, supplying power to connected devices. |
| `OB` | On Battery | UPS is running on battery power due to a mains failure. |
| `LB` | Low Battery | Battery charge is critically low. UPS will shut down soon. |
| `RB` | Replace Battery | Battery needs replacement due to age or health issues. |
| `HB` | High Battery | Battery is fully charged (rare). |
| `CHRG` | Charging | Battery is currently being charged. |
| `DISCHRG` | Discharging | Battery is actively discharging (more specific than `OB`). |
| `OVER` | Overload | UPS load exceeds its rated capacity. |
| `ALARM` | Alarm Active | UPS has triggered an internal alarm (e.g. overload or battery fault). |
| `CAL` | Calibrating | UPS is performing a battery runtime calibration. |
| `COMMLOST` | Communication Lost | Communication between NUT and the UPS device is lost. |
| `OFF` | Off | UPS output is turned off. |
| `TRIM` | Trim | Input voltage is too high; UPS is stepping it down (buck). |
| `BOOST` | Boost | Input voltage is too low; UPS is stepping it up. |
| `TEST` | Self-Test | UPS is performing an automatic self-test. |
| `SYNC` | Synchronizing | UPS is synchronizing with the mains frequency (rare). |

### Raw Data Items

These items fetch raw JSON from the OPNsense API and serve as master items for dependent
items and discovery rules.

| Name | Key | Update Interval | API Endpoint |
|------|-----|-----------------|--------------|
| RAW Load | `opns.raw.load` | 5m | `/api/diagnostics/system/system_time` |
| RAW Memorystatus | `opns.raw.memory.status` | 5m | `/api/diagnostics/system/systemResources` |
| RAW Disk | `opns.raw.disk` | 5m | `/api/diagnostics/system/system_disk` |
| RAW Cron Jobs | `opns.raw.cron.jobs` | 5m | `/api/cron/settings/searchJobs` |
| RAW Gatewaystatus | `opns.raw.gateway.status` | 1m | `/api/routes/gateway/status` |
| RAW Firewall States | `opns.raw.fw.states` | 1m | `/api/diagnostics/firewall/pfStates` |
| RAW Firewallaction | `opns.raw.fw.action` | 1m | `/api/diagnostics/firewall/stats?group_by=action` |
| RAW Firewall Interfaces | `opns.raw.fw.interface.stat` | 1m | `/api/diagnostics/firewall/pf_statistics/interfaces` |
| RAW Interfaces | `opns.raw.interfaces.stat` | 1m | `/api/diagnostics/traffic/_interface` |
| RAW Carp Interfaces | `opns.raw.interfaces.carp` | 1m | `/api/diagnostics/interface/get_vip_status` |
| RAW HA Settings | `opns.raw.ha.settings` | 5m | `/api/core/hasync/get` *(credentials are removed during preprocessing)* |
| RAW HA pfsync Nodes | `opns.raw.ha.pfsync.nodes` | 1m | `/api/diagnostics/interface/get_pfsync_nodes` |
| RAW HA Peer Version | `opns.raw.ha.peer.version` | 5m | `/api/core/hasync_status/version` |
| RAW HA Peer Services | `opns.raw.ha.peer.services` | 5m | `/api/core/hasync_status/services` |
| RAW Product Info | `opns.raw.product.info` | 30m | `/api/core/firmware/info` |
| RAW Firmware Status | `opns.raw.firmware.status` | 6h | `/api/core/firmware/status` *(POST; runs update probe before fetching status)* |
| RAW UPS | `opns.ups.raw` | 5m | `/api/nut/diagnostics/upsstatus` *(disabled by default)* |
| RAW WireGuard | `opns.wireguard.raw` | 1m | `/api/wireguard/service/show` |

## Triggers

### System Triggers

| Name | Severity | Description |
|------|----------|-------------|
| No data from OPNsense | **High** | No data received from `opns.raw.gateway.status` for 5 minutes – API is unreachable. |
| CPU load is high | **Warning** | CPU load exceeds `{$OPNS.CPU.LOAD.MAX}` for 5 minutes. |
| Memory utilization is high | **Average** | Memory utilization exceeds `{$OPNS.MEMORY.UTIL.MAX}` % for 5 minutes. |
| OPNSense Business License expires soon | **Average** | License expires in less than `{$OPNS.LICENSE.EXPIRY.WARN}` days. Only relevant for Business Edition. |
| OPNsense firmware updates are available | **Info** | Firmware update status is `update` or `upgrade` and at least one update is available. |
| OPNsense firmware update check failed | **Warning** | Firmware update check returned `error`. |
| State table usage is high | **Warning** | State table utilization exceeds `{$OPNS.STATE.TABLE.UTIL.MAX}` % for the last 3 values. |
| {HOST.NAME} has been restarted | **Info** | System uptime is less than 600 seconds (10 minutes). |
| Cron job [{#CRON.DESCRIPTION}] is disabled | **Warning** | A discovered OPNsense cron job is disabled. |

### UPS Triggers

| Name | Severity | Description |
|------|----------|-------------|
| UPS on Battery | **High** | UPS status contains `OB` – mains power has failed. |
| Battery low | **Disaster** | UPS status contains `LB` – battery is critically low and shutdown is imminent. |
| High Load on UPS Battery | **Average** | UPS load exceeds `{$OPNS.NUT.HIGH.LOAD}` % (default: 80%). |
| Battery charge is below {$OPNS.NUT.BAT.LOW} | **Warning** | Battery charge is below `{$OPNS.NUT.BAT.LOW}` % (default: 30%). |
| Remaining battery runtime is low | **High** | Estimated runtime is below `{$OPNS.NUT.BAT.RUNTIME}` seconds (default: 600s / 10 min). |

### High Availability Triggers

| Name | Severity | Description |
|------|----------|-------------|
| CARP is disabled | **High** | Global CARP operation is disabled while CARP VIPs exist. |
| CARP persistent maintenance mode is active | **Warning** | The node remains in persistent maintenance mode. |
| CARP demotion level is elevated | **Warning** | A positive demotion level can prevent promotion to MASTER. |
| CARP reports a status warning | **Warning** | OPNsense returned a global CARP warning message. |
| CARP status changed for VIP {#CARP.ADDRESS} | **High** | A CARP failover or failback occurred. |
| CARP status is unexpected for VIP {#CARP.ADDRESS} | **High** | The status does not match `{$OPNS.HA.CARP.STATUS.MATCHES:"{#CARP.ADDRESS}"}`. |
| HA state synchronization is not configured | **Warning** | CARP VIPs exist, but pfsync is disabled. |
| No remote pfsync state creator is visible | **Warning** | Fewer remote creator IDs than configured were seen for 10 minutes. |
| HA configuration synchronization is not configured | **Warning** | The node is marked as XMLRPC synchronization source, but no target is configured. |
| HA peer is not reachable through XMLRPC | **High** | The configured XMLRPC peer did not answer for 10 minutes. |
| HA peer firmware version differs | **Warning** | Local and remote OPNsense core versions differ. |
| HA peer service […] is not running | **High** | A checkable service reported by the HA peer is stopped. |

### WireGuard Triggers

| Name | Severity | Description |
|------|----------|-------------|
| WireGuard instance {#WG.INSTANCE} is down | **High** | Instance status has not been `up` for 5 minutes. |
| WireGuard peer {#WG.NAME} is not online | **High** | Peer status has not been `online` for 5 minutes. OPNsense marks peers online when the latest handshake is not older than 300 seconds. |

## Discovery Rules

### 1. Cron Job Discovery

| Property | Value |
|----------|-------|
| Key | `opns.cron.job.discovery` |
| Type | Dependent (master: `opns.raw.cron.jobs`) |
| Filters | `{#CRON.DESCRIPTION}` configurable via macros |
| Keep lost resources | 1d |

Each configured job exposes its enabled state, configd command, and five-field cron schedule. A
warning is raised when a discovered job is disabled. The OPNsense Cron API exposes configuration,
not per-run exit codes; this discovery therefore does not assert that a command completed successfully.

---

### 2. Disk Discovery

| Property | Value |
|----------|-------|
| Key | `opns.disk.discovery` |
| Type | Dependent (master: `opns.raw.disk`) |
| Filters | `{#FSNAME}` and `{#FSTYPE}` configurable via macros |
| Keep lost resources | 1h |

**Item Prototypes:**

| Name | Key | Unit | Description |
|------|-----|------|-------------|
| FS [{#FSNAME}]: Get data | `opns.disk.data[{#FSNAME},data]` | – | Raw JSON for the filesystem (intermediate item). |
| FS [{#FSNAME}]: Space: Total | `opns.disk.size[{#FSNAME},total]` | B | Total filesystem size in bytes. |
| FS [{#FSNAME}]: Space: Used | `opns.disk.size[{#FSNAME},used]` | B | Used space in bytes. |
| FS [{#FSNAME}]: Space: Available | `opns.disk.size[{#FSNAME},available]` | B | Available space in bytes. |
| FS [{#FSNAME}]: Space: Used, in % | `opns.disk.size[{#FSNAME},pused]` | % | Used space as a percentage. |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| OPNsense: FS [{#FSNAME}]: Space is low | **Warning** | Used space exceeds `{$OPNS.FS.PUSED.MAX.WARN}` % (default: 90%). |
| OPNsense: FS [{#FSNAME}]: Space is critically low | **Average** | Used space exceeds `{$OPNS.FS.PUSED.MAX.CRIT}` % (default: 95%). |

---

### 3. Gateway Discovery

| Property | Value |
|----------|-------|
| Key | `opns.gateway.discovery` |
| Type | Dependent (master: `opns.raw.gateway.status`) |
| LLD Macro | `{#GWSTATUSNAME}` → `$.name` |
| Keep lost resources | 1h |

**Item Prototypes:**

| Name | Key | Unit | Description |
|------|-----|------|-------------|
| Gateway Address {#GWSTATUSNAME} | `opns.gw.status.address[{#GWSTATUSNAME}]` | – | Gateway IP address. |
| Gateway Status {#GWSTATUSNAME} | `opns.gw.status.status[{#GWSTATUSNAME}]` | – | Translated status string (e.g. "Online"). |
| Gateway RTT {#GWSTATUSNAME} | `opns.gw.status.delay[{#GWSTATUSNAME}]` | ms | Round-trip time. Returns 9999 if monitoring is disabled. |
| Gateway RTTd {#GWSTATUSNAME} | `opns.gw.status.stddev[{#GWSTATUSNAME}]` | ms | RTT standard deviation. Returns 9999 if monitoring is disabled. |
| Gateway loss {#GWSTATUSNAME} | `opns.gw.status.loss[{#GWSTATUSNAME}]` | % | Packet loss percentage. Returns 9999 if monitoring is disabled. |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| Gateway {#GWSTATUSNAME} Packet loss | **Average** | Packet loss > `{$OPNS.GW.MIN.PACKET.LOSS}` % for 5 min. Ignores the `9999` sentinel used when monitoring is disabled. |
| Gateway {#GWSTATUSNAME} High packet loss | **High** | Packet loss > `{$OPNS.GW.HIGH.PACKET.LOSS}` % for 5 min. Ignores the `9999` sentinel used when monitoring is disabled. |
| Gateway {#GWSTATUSNAME} is down | **Disaster** | Packet loss > 99% for 5 min. Ignores the `9999` sentinel used when monitoring is disabled. |
| Gateway Monitoring on {#GWSTATUSNAME} is disabled | **Average** | All monitoring values return 9999 – gateway monitoring is not enabled in OPNsense. |

---

### 4. FW Action Discovery

| Property | Value |
|----------|-------|
| Key | `opns.fw.action.discovery` |
| Type | Dependent (master: `opns.raw.fw.action`) |
| LLD Macro | `{#FWACTION}` → `$.label` |
| Keep lost resources | 1h |

**Item Prototypes:**

| Name | Key | Description |
|------|-----|-------------|
| Firewall action {#FWACTION} | `opns.fw.action[{#FWACTION}]` | Counter for the discovered firewall action (e.g. pass, block, match). |

**Graph Prototypes:**

| Name | Description |
|------|-------------|
| OPNSense Action Graph {#FWACTION} | Graph showing firewall action counts per discovered action type. |

---

### 5. Interface CARP Discovery

| Property | Value |
|----------|-------|
| Key | `opns.interface.carp.discovery` |
| Type | Dependent (master: `opns.raw.interfaces.carp`) |
| LLD Macros | `{#CARP.ADDRESS}`, `{#CARP.INTERFACE}`, `{#CARP.VHID}`, `{#CARP.MODE}` |
| Filter | CARP-mode VIPs only; IP aliases are excluded |
| Keep lost resources | 1d |

**Item Prototypes:**

| Name | Key | Description |
|------|-----|-------------|
| CARP VIP {#CARP.ADDRESS} (…): Advertisement base | `opns.carp.advbase["{#CARP.ADDRESS}"]` | CARP advertisement base interval. |
| CARP VIP {#CARP.ADDRESS} (…): Advertisement skew | `opns.carp.advskew["{#CARP.ADDRESS}"]` | CARP advertisement skew used in role election. |
| CARP VIP {#CARP.ADDRESS} (…): Status | `opns.carp.status["{#CARP.ADDRESS}"]` | CARP status of the individual VIP (MASTER, BACKUP, INIT, DISABLED). Uses discard unchanged heartbeat (2h). |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| CARP status changed for VIP {#CARP.ADDRESS} | **High** | CARP status changed – indicates a failover or failback event. |
| CARP status is unexpected for VIP {#CARP.ADDRESS} | **High** | Status does not match the accepted regex. |

> **Note:** If no CARP interfaces are configured, the discovery returns a custom error and
> no items are created.

---

### 6. HA Peer Service Discovery

Discovers checkable services returned by `/api/core/hasync_status/services` and raises a high-severity
problem when a remote service remains stopped for 10 minutes. Services marked `nocheck` by OPNsense
are excluded.

---

### 7. HA pfsync Node Discovery

Discovers creator IDs present in the PF state table and records whether each ID belongs to the local
node. The aggregate remote-node trigger is evidence-based: a quiet HA peer that has created no
currently retained states may not appear even when pfsync transport itself is functional. Adjust
`{$OPNS.HA.PFSYNC.REMOTE.NODES.MIN}` if this signal is not appropriate for the installation.

---

### 8. Interface Stats Discovery

| Property | Value |
|----------|-------|
| Key | `opns.interface.stats.discovery` |
| Type | Dependent (master: `opns.raw.interfaces.stat`) |
| LLD Macros | `{#OPNS.INTERFACE.DEVICE}` → `$.device`, `{#OPNS.INTERFACE.NAME}` → `$.name` |

**Item Prototypes – Traffic:**

| Name | Key | Unit |
|------|-----|------|
| …Bytes received | `opns.interface.bytes.received[{#OPNS.INTERFACE.DEVICE}]` | Bps |
| …Bytes transmitted | `opns.interface.bytes.transmitted[{#OPNS.INTERFACE.DEVICE}]` | Bps |
| …packets received | `opns.interface.packets.received[{#OPNS.INTERFACE.DEVICE}]` | – |
| …packets transmitted | `opns.interface.packets.transmitted[{#OPNS.INTERFACE.DEVICE}]` | – |
| …multicasts received | `opns.interface.multicast.received[{#OPNS.INTERFACE.DEVICE}]` | – |

**Item Prototypes – Errors & Drops:**

| Name | Key |
|------|-----|
| …collisions | `opns.interface.collisions[{#OPNS.INTERFACE.DEVICE}]` |
| …input queue drops | `opns.interface.input.queue.drops[{#OPNS.INTERFACE.DEVICE}]` |
| …output errors | `opns.interface.output.errors[{#OPNS.INTERFACE.DEVICE}]` |
| …packets for unknown protocol | `opns.interface.packets.unknown.protocol[{#OPNS.INTERFACE.DEVICE}]` |

**Item Prototypes – Firewall per Interface (IPv4):**

| Name | Key | Unit |
|------|-----|------|
| …blocked bytes INv4 | `opns.interface.fw.bytes.blockin.v4[{#OPNS.INTERFACE.DEVICE}]` | Bps |
| …blocked bytes OUTv4 | `opns.interface.fw.bytes.blockout.v4[{#OPNS.INTERFACE.DEVICE}]` | Bps |
| …passed bytes INv4 | `opns.interface.fw.bytes.passin.v4[{#OPNS.INTERFACE.DEVICE}]` | Bps |
| …passed bytes OUTv4 | `opns.interface.fw.bytes.passout.v4[{#OPNS.INTERFACE.DEVICE}]` | Bps |
| …blocked packets INv4 | `opns.interface.fw.packets.blockin.v4[{#OPNS.INTERFACE.DEVICE}]` | – |
| …blocked packets OUTv4 | `opns.interface.fw.packets.blockout.v4[{#OPNS.INTERFACE.DEVICE}]` | – |
| …passed packets INv4 | `opns.interface.fw.packets.passin.v4[{#OPNS.INTERFACE.DEVICE}]` | – |
| …passed packets OUTv4 | `opns.interface.fw.packets.passout.v4[{#OPNS.INTERFACE.DEVICE}]` | – |

---

### 9. WireGuard Instance Discovery

| Property | Value |
|----------|-------|
| Key | `opns.wireguard.instance.discovery` |
| Type | Dependent (master: `opns.wireguard.raw`) |
| LLD Macros | `{#WG.IF}` → `$.if`, `{#WG.INSTANCE}` → `$.name` |
| Filters | `{#WG.INSTANCE}` configurable via `{$OPNS.WG.INSTANCE.MATCHES}` and `{$OPNS.WG.INSTANCE.NOT_MATCHES}` |
| Keep lost resources | 1h |

**Item Prototypes:**

| Name | Key | Unit | Description |
|------|-----|------|-------------|
| WireGuard instance {#WG.INSTANCE}: status | `opns.wireguard.instance.status[{#WG.IF}]` | – | Interface status reported by OPNsense (`up` or `down`). |
| WireGuard instance {#WG.INSTANCE}: listen port | `opns.wireguard.instance.listen_port[{#WG.IF}]` | – | WireGuard listen port. |
| WireGuard instance {#WG.INSTANCE}: public key | `opns.wireguard.instance.public_key[{#WG.IF}]` | – | Instance public key. |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| WireGuard instance {#WG.INSTANCE} is down | **High** | Instance status has not been `up` for 5 minutes. |

---

### 10. WireGuard Peer Discovery

| Property | Value |
|----------|-------|
| Key | `opns.wireguard.peer.discovery` |
| Type | Dependent (master: `opns.wireguard.raw`) |
| LLD Macros | `{#WG.PUBKEY}` → `$.public_key`, `{#WG.NAME}` → `$.name`, `{#WG.IF}` → `$.if`, `{#WG.IFNAME}` → `$.ifname` |
| Filters | `{#WG.NAME}` configurable via `{$OPNS.WG.PEER.MATCHES}` and `{$OPNS.WG.PEER.NOT_MATCHES}`; `{#WG.IFNAME}` configurable via `{$OPNS.WG.INSTANCE.MATCHES}` and `{$OPNS.WG.INSTANCE.NOT_MATCHES}` |
| Keep lost resources | 1h |

**Item Prototypes:**

| Name | Key | Unit | Description |
|------|-----|------|-------------|
| WireGuard peer {#WG.NAME}: status | `opns.wireguard.peer.status["{#WG.PUBKEY}"]` | – | Peer status reported by OPNsense (`online`, `stale`, or `offline`). |
| WireGuard peer {#WG.NAME}: latest handshake | `opns.wireguard.peer.latest_handshake["{#WG.PUBKEY}"]` | unixtime | Latest WireGuard handshake timestamp. Returns `0` if no handshake exists. |
| WireGuard peer {#WG.NAME}: latest handshake age | `opns.wireguard.peer.latest_handshake_age["{#WG.PUBKEY}"]` | s | Age of the latest handshake in seconds. Returns `0` if no handshake exists. |
| WireGuard peer {#WG.NAME}: endpoint | `opns.wireguard.peer.endpoint["{#WG.PUBKEY}"]` | – | Current peer endpoint. |
| WireGuard peer {#WG.NAME}: bytes received | `opns.wireguard.peer.transfer_rx["{#WG.PUBKEY}"]` | B | Total bytes received from the peer. |
| WireGuard peer {#WG.NAME}: bytes received per second | `opns.wireguard.peer.transfer_rx.rate["{#WG.PUBKEY}"]` | Bps | Receive rate calculated from total received bytes. |
| WireGuard peer {#WG.NAME}: bytes sent | `opns.wireguard.peer.transfer_tx["{#WG.PUBKEY}"]` | B | Total bytes sent to the peer. |
| WireGuard peer {#WG.NAME}: bytes sent per second | `opns.wireguard.peer.transfer_tx.rate["{#WG.PUBKEY}"]` | Bps | Send rate calculated from total sent bytes. |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| WireGuard peer {#WG.NAME} is not online | **High** | Peer status has not been `online` for 5 minutes. |

## UPS Monitoring (NUT)

OPNsense includes a built-in NUT (Network UPS Tools) plugin that exposes UPS status via its
REST API. This template can optionally monitor a connected UPS using this integration.

### How it works

The `RAW UPS` item fetches the raw NUT status string from the OPNsense API endpoint
`/api/nut/diagnostics/upsstatus`. A JavaScript preprocessing step parses the newline-separated
`key: value` response into clean JSON. All UPS dependent items then extract their values
from this JSON using standard JSONPath preprocessing – no external scripts required.

### Enabling UPS Monitoring

1. Install and configure the **NUT plugin** on OPNsense
   (Services → Network UPS Tools)
2. Connect a supported UPS via USB or network
3. In Zabbix, navigate to the host and **enable the item** `RAW UPS` (`opns.ups.raw`)
4. All dependent UPS items and triggers will start collecting data automatically


## Dashboards

The template includes a built-in dashboard **"OPNsense Info"** with three pages:

1. **OPNSense Info** – CPU load widget, memory usage pie chart, firewall states pie chart,
   firewall action SVG graph, and CARP status honeycomb overview.
2. **Gateway Info** – SVG graphs for gateway round-trip time and packet loss across all
   discovered gateways.
3. **Interfaces** – SVG graph showing blocked and passed bytes (IPv4) per interface.

## Feedback

If you encounter any issues or have suggestions for improvement, please open an issue or
pull request in the community templates repository.
