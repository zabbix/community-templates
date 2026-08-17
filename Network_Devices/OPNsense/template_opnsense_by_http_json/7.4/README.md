# OPNsense by HTTP-JSON

## Overview

This template monitors OPNsense firewalls via the built-in REST API using HTTP JSON agent requests.
It collects data about system resources (CPU, memory, disk, uptime), firewall states and actions,
gateway health, network interfaces, CARP high-availability status, WireGuard peers, and UPS status
via NUT (Network UPS Tools).

The template uses OPNsense API key/secret authentication and requires no agent installation
on the firewall.

It also covers the packet filter in depth: pf counters, the state and source tracking tables
with their limits, the loaded ruleset with change detection, kernel network memory, netisr
queues, IP and TCP protocol errors, clock synchronization, service state, swap, temperature
sensors, and processor utilization split into user, system and interrupt time.

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
  - `nut/diagnostics`
  - `ipsec/sessions/searchPhase(1|2)` 
  - `wireguard/service/show`
  - `diagnostics/activity`
  - `diagnostics/cpu_usage`
  - `diagnostics/interface/get_interface_statistics`, `get_memory_statistics`,
    `get_netisr_statistics`, `get_protocol_statistics`
  - `firewall/alias/get_table_size`
  - `ntpd/service/status`
  - `core/service/search`
  
### Permissions

| Privilege ID                            | UI Name                                   |
| -------------------------------------- | ----------------------------------------- |
| page-diagnostics-logs-firewall-summary | Diagnostics: Logs: Firewall: Summary View |
| page-diagnostics-pf-info               | Diagnostics: Firewall statistics          |
| page-status-carp                       | Interfaces: Virtual IPs: Status           |
| page-status-trafficgraph               | Reporting: Traffic                        |
| page-system-firmware-manualupdate      | System: Firmware                          |
| page-system-gateways                   | System: Gateways                          |
| page-system-login-logout               | Lobby: Dashboard                          |
| page-status-ipsec | Status: IPsec |
| page-wireguard-diagnostics | VPN: WireGuard: Status |
| page-diagnostics-netstat | Diagnostics: Netstat |
| page-diagnostics-system-activity | Diagnostics: System Activity |
| page-firewall-aliases | Firewall: Aliases |
| page-status-ntp | Status: NTP |
| page-status-services | Status: Services |

Most of these are read only. Three are worth a conscious decision before granting them:

| Privilege ID | Grants beyond reading |
|--------------|-----------------------|
| page-system-firmware-manualupdate | matches `api/core/firmware/*`, which includes reboot, poweroff, install and remove |
| page-status-services | permits starting and stopping services. Without it the service discovery simply stays empty |
| page-firewall-aliases | read only, but the same endpoints expose the contents of every alias |

Two of them are easy to miss because the symptom appears on a raw item rather than on the
item you are looking for. Without `page-system-firmware-manualupdate` the firmware update
items, the business license item and the OPNsense version stay unsupported. Without
`page-status-trafficgraph` the whole interface discovery stays empty.



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
| `{$OPNS.KEY}` | *(empty)* | OPNsense API key. **Required.** |
| `{$OPNS.SECRET}` | *(empty)* | OPNsense API secret. **Required.** |
| `{$OPNS.CPU.LOAD.MAX}` | `2` | Maximum CPU load average before triggering a warning. |
| `{$OPNS.MEMORY.UTIL.MAX}` | `90` | Maximum memory utilization (%) before triggering an alert. |
| `{$OPNS.STATE.TABLE.UTIL.MAX}` | `90` | Maximum state table utilization (%) before triggering a warning. |
| `{$OPNS.GW.MIN.PACKET.LOSS}` | `10` | Packet loss (%) to trigger a gateway packet loss alert. |
| `{$OPNS.GW.HIGH.PACKET.LOSS}` | `50` | Packet loss (%) to trigger a high packet loss alert. |
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
| `{$OPNS.CPU.UTIL.WARN}` | `85` | Processor utilization (%) that counts as high, averaged over ten minutes. |
| `{$OPNS.LOAD.AVG5.WARN}` | `4` | Absolute five minute load average that counts as high. Depends on the core count, which is why the per core trigger is usually the better one. |
| `{$OPNS.LOAD.PERCORE.WARN}` | `1` | Five minute load per core that counts as high. A value of 1 means the cores are exactly saturated. |
| `{$OPNS.MBUF.UTIL.WARN}` | `80` | Percentage of the mbuf cluster limit in use that counts as filling up. |
| `{$OPNS.NTP.OFFSET.WARN}` | `100` | Clock offset (ms) that counts as high. |
| `{$OPNS.PF.SRCNODES.UTIL.CRIT}` | `90` | Fill level (%) of the source tracking table that counts as critical. |
| `{$OPNS.PF.TABLES.UTIL.WARN}` | `80` | Share (%) of the pf table entry budget that counts as filling up. Relevant where block lists or GeoIP aliases are in use. |
| `{$OPNS.SWAP.UTIL.WARN}` | `5` | Swap in use (%) that counts as a problem. A firewall should not swap at all, so the default is deliberately low. Overridable per device with the device path as context. |
| `{$OPNS.TEMP.CRIT}` | `80` | Sensor temperature (°C) that counts as critical. Overridable per sensor with the sensor name as context, for example `{$OPNS.TEMP.CRIT:"dev.cpu.0.temperature"}`. |
| `{$OPNS.IF.CONTROL}` | `1` | Set to `0`, optionally per interface as `{$OPNS.IF.CONTROL:"vtnet3"}`, to stop the interface down trigger for interfaces that are allowed to have no link. |
| `{$OPNS.IF.NAME.NOT_MATCHES}` | `^(pflog\|pfsync\|enc\|lo)\d*$` | Interfaces excluded from the link state discovery. |
| `{$OPNS.SERVICE.ID.NOT_MATCHES}` | `^$` | Services excluded from discovery, as a regular expression over the service identifier. The default excludes nothing. |

## Items Collected

### System Items

| Name | Key | Type | Update Interval | Description |
|------|-----|------|-----------------|-------------|
| CPU load | `opns.cpu.load` | Dependent | – | System load average (1 min). |
| System Uptime | `opns.system.uptime` | Dependent | – | Uptime converted to seconds. Displayed in Zabbix uptime format. |
| Total Memory | `opns.memory.total` | Dependent | – | Total physical memory in bytes. |
| Used Memory | `opns.memory.used` | Dependent | – | Used memory in bytes. |
| ARC Memory | `opns.memory.arc` | Dependent | – | ZFS ARC memory usage in bytes. |
| Memory utilization in % | `opns.memory.util` | Calculated | – | Percentage of used memory relative to total memory. |
| Licensed until | `opns.product.licenseuntil` | Dependent | – | OPNsense Business Edition license expiry (Unix timestamp). Returns `0` if not present. |
| Firmware update status | `opns.firmware.update.status` | Dependent | – | Firmware update status (`none`, `update`, `upgrade`, or `error`). |
| Firmware update status message | `opns.firmware.update.status_msg` | Dependent | – | Human-readable firmware update status message. |
| Firmware update count | `opns.firmware.update.count` | Dependent | – | Number of available firmware package or set updates. |
| Firmware update packages | `opns.firmware.update.packages` | Dependent | – | List of available package or set updates. |
| Firmware update requires reboot | `opns.firmware.update.reboot` | Dependent | – | Returns `1` when the available firmware update requires a reboot. |

### Firewall Items

| Name | Key | Type | Description |
|------|-----|------|-------------|
| Firewall states current | `opns.fw.states.current` | Dependent | Current number of active firewall states. |
| Firewall states max | `opns.fw.states.max` | Dependent | Maximum number of allowed firewall states. |
| States table utilization in % | `opns.states.util` | Calculated | Percentage of the state table currently in use. |

### Processor Items

| Name | Key | Type | Unit | Description |
|------|-----|------|------|-------------|
| CPU: Utilization | `opns.cpu.util` | Dependent | % | Processor utilization, derived from the idle share reported by the process listing header. |
| CPU: User time | `opns.cpu.user` | Dependent | % | Share spent in user space. |
| CPU: System time | `opns.cpu.system` | Dependent | % | Share spent in the kernel. |
| CPU: Interrupt time | `opns.cpu.interrupt` | Dependent | % | Share spent servicing interrupts. On a firewall this is mostly the network cards, and it rises well before the total looks alarming. |
| CPU: Cores | `opns.cpu.cores` | Dependent | – | Number of processor cores. |
| Load average (5 min) | `opns.system.load.avg5` | Dependent | – | Five minute load average. |
| Load average (15 min) | `opns.system.load.avg15` | Dependent | – | Fifteen minute load average. |
| Load average per core (5 min) | `opns.system.load.percore` | Calculated | – | Five minute load divided by the core count, so the threshold does not depend on the hardware. |

### Packet Filter Items

pf reports its counters as rates already, so none of these need rate preprocessing.

| Name | Key | Type | Unit | Description |
|------|-----|------|------|-------------|
| pf: Rule matches per second | `opns.pf.counter.match.rate` | Dependent | p/s | Packets matching a rule. |
| pf: Packets dropped for memory per second | `opns.pf.counter.memdrop.rate` | Dependent | p/s | Packets dropped because pf could not allocate memory. |
| pf: State limit hits per second | `opns.pf.counter.statelimit.rate` | Dependent | p/s | Packets refused because the state table is full. |
| pf: Source limit hits per second | `opns.pf.counter.srclimit.rate` | Dependent | p/s | Packets refused by a source tracking limit. |
| pf: State mismatches per second | `opns.pf.counter.statemismatch.rate` | Dependent | p/s | Packets that did not match the state they claimed. |
| pf: Bad offset packets per second | `opns.pf.counter.badoffset.rate` | Dependent | p/s | Malformed packets with an invalid header offset. |
| pf: Short packets per second | `opns.pf.counter.short.rate` | Dependent | p/s | Packets shorter than their header claims. |
| pf: Fragmented packets per second | `opns.pf.counter.fragment.rate` | Dependent | p/s | Fragmented packets seen by pf. |
| pf: Normalized packets per second | `opns.pf.counter.normalize.rate` | Dependent | p/s | Packets rewritten by scrub rules. |
| pf: SYN floods detected per second | `opns.pf.synfloods.rate` | Dependent | /s | SYN floods detected by pf. |
| pf: Overload table insertions per second | `opns.pf.overload.rate` | Dependent | /s | Addresses added to an overload table by a rule limit. |
| pf: State table inserts per second | `opns.pf.states.inserts.rate` | Dependent | /s | New states created. |
| pf: State table removals per second | `opns.pf.states.removals.rate` | Dependent | /s | States expired or removed. |
| pf: State table searches per second | `opns.pf.states.searches.rate` | Dependent | /s | State table lookups. |
| pf: Source nodes | `opns.pf.srcnodes.current` | Dependent | – | Entries in the source tracking table. |
| pf: Source node limit | `opns.pf.srcnodes.limit` | Dependent | – | Configured source tracking limit. |
| pf: Source tracking table utilization | `opns.pf.srcnodes.pused` | Calculated | % | Source tracking table fill level. |
| pf: Table entries in use | `opns.pf.tables.entries.used` | Dependent | – | Entries held by all pf tables together. Block lists and GeoIP aliases live here. |
| pf: Table entry limit | `opns.pf.tables.entries.limit` | Dependent | – | Configured ceiling for pf table entries. |
| pf: Table entry utilization | `opns.pf.tables.entries.pused` | Calculated | % | Share of the pf table entry budget in use. |
| pf: Filter rules loaded | `opns.pf.rules.filter.count` | Dependent | – | Number of filter rules currently loaded. |
| pf: NAT rules loaded | `opns.pf.rules.nat.count` | Dependent | – | Number of NAT rules currently loaded. |
| pf: Rules never matched | `opns.pf.rules.unused` | Dependent | – | Rules that have never matched a packet since the ruleset was loaded. |
| pf: Rule evaluations per second | `opns.pf.rules.evaluations.rate` | Dependent | /s | How often rules are evaluated, a measure of ruleset cost. |
| pf: Ruleset fingerprint | `opns.pf.rules.fingerprint` | Dependent | – | Checksum over the loaded ruleset. Changes when the ruleset changes, which is what the ruleset trigger watches. |
| Firewall log: Blocked share | `opns.fwlog.block.pct` | Dependent | % | Share of blocked entries among the most recent logged packets. |

### Kernel Network Memory and Protocol Items

When either the mbuf pool or a netisr queue runs dry, the firewall still answers ping and
still reports free memory and a normal state table, while throughput collapses and packets
are dropped before reaching any rule. Both counters are cumulative and should stay at zero
for the entire uptime, which is why their triggers fire on any increase rather than on a
threshold.

| Name | Key | Type | Unit | Description |
|------|-----|------|------|-------------|
| mbuf: Clusters in use | `opns.mbuf.cluster.current` | Dependent | – | mbuf clusters currently allocated. |
| mbuf: Cluster limit | `opns.mbuf.cluster.max` | Dependent | – | Configured cluster limit (`kern.ipc.nmbclusters`). |
| mbuf: Cluster utilization | `opns.mbuf.cluster.pused` | Calculated | % | Share of the cluster limit in use. |
| mbuf: Denied requests | `opns.mbuf.denied` | Dependent | – | Requests for network memory the kernel could not satisfy. |
| netisr: Queue drops | `opns.netisr.queue.drops` | Dependent | /s | Packets dropped by the network interrupt queues, all protocols together. |
| IP: Packets with a bad checksum per second | `opns.proto.ip.badsum.rate` | Dependent | p/s | Usually a cable, an optic or an offloading problem. |
| IP: Fragments dropped per second | `opns.proto.ip.fragdrop.rate` | Dependent | p/s | Fragments discarded before reassembly. |
| IP: Packets discarded for lack of a route | `opns.proto.ip.noroute.rate` | Dependent | p/s | No route to the destination, often a missing return route. |
| IP: Packets that cannot be forwarded | `opns.proto.ip.nofwd.rate` | Dependent | p/s | Packets the kernel refused to forward. |
| TCP: Segments with a bad checksum per second | `opns.proto.tcp.badsum.rate` | Dependent | p/s | Corrupted segments. |
| TCP: Retransmitted segments per second | `opns.proto.tcp.retrans.rate` | Dependent | p/s | Retransmissions, a measure of path quality. |

### Time Synchronization Items

| Name | Key | Type | Unit | Description |
|------|-----|------|------|-------------|
| NTP: Synchronised | `opns.ntp.synced` | Dependent | – | Whether the clock is disciplined by a peer. |
| NTP: Offset of the selected peer | `opns.ntp.offset` | Dependent | ms | Offset against the selected peer. |
| NTP: Stratum of the selected peer | `opns.ntp.stratum` | Dependent | – | Stratum of the selected peer. |
| NTP: Reachable peers | `opns.ntp.peers.reachable` | Dependent | – | Number of peers currently reachable. |

### CARP and Configuration Items

| Name | Key | Type | Unit | Description |
|------|-----|------|------|-------------|
| CARP: Demotion factor | `opns.carp.demotion` | Dependent | – | How strongly this node holds itself back from becoming master. Anything above zero is the usual reason a node refuses to take over when the peer fails. |
| CARP: Maintenance mode | `opns.carp.maintenance` | Dependent | – | Maintenance mode hands every virtual address to the peer. Easy to switch on for a planned change and just as easy to forget afterwards. |
| OPNsense: Version | `opns.version` | Dependent | – | Product version string. |
| OPNsense: Configuration last changed | `opns.config.changed` | Dependent | unixtime | Timestamp OPNsense records when the configuration is written. Covers every change, not only firewall rules, and needs no extra request. |

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
| RAW Gatewaystatus | `opns.raw.gateway.status` | 1m | `/api/routes/gateway/status` |
| RAW Firewall States | `opns.raw.fw.states` | 1m | `/api/diagnostics/firewall/pfStates` |
| RAW Firewallaction | `opns.raw.fw.action` | 1m | `/api/diagnostics/firewall/stats?group_by=action` |
| RAW Firewall Interfaces | `opns.raw.fw.interface.stat` | 1m | `/api/diagnostics/firewall/pf_statistics/interfaces` |
| RAW Interfaces | `opns.raw.interfaces.stat` | 1m | `/api/diagnostics/traffic/_interface` |
| RAW Carp Interfaces | `opns.raw.interfaces.carp` | 1m | `/api/diagnostics/interface/get_vip_status` |
| RAW Product Info | `opns.raw.product.info` | 30m | `/api/core/firmware/info` |
| RAW Firmware Status | `opns.raw.firmware.status` | 1d | `/api/core/firmware/status` *(POST; runs update probe before fetching status)* |
| RAW UPS | `opns.ups.raw` | 5m | `/api/nut/diagnostics/upsstatus` *(disabled by default)* |
| RAW WireGuard | `opns.wireguard.raw` | 1m | `/api/wireguard/service/show` |
| OPNsense: System activity (raw) | `opns.activity.raw` | 1m | `/api/diagnostics/activity/get_activity` |
| OPNsense: CPU type (raw) | `opns.cpu.raw` | 1m | `/api/diagnostics/cpu_usage/getCPUType` |
| OPNsense: pf statistics (raw) | `opns.pfinfo.raw` | 1m | `/api/diagnostics/firewall/pf_statistics/info` |
| OPNsense: pf limits (raw) | `opns.pfmem.raw` | 1m | `/api/diagnostics/firewall/pf_statistics/memory` |
| OPNsense: pf ruleset (raw) | `opns.pf.rules.raw` | 10m | `/api/diagnostics/firewall/pf_statistics/rules` |
| OPNsense: Alias tables (raw) | `opns.alias.raw` | 10m | `/api/firewall/alias/get_table_size` |
| OPNsense: mbuf statistics (raw) | `opns.mbuf.raw` | 1m | `/api/diagnostics/interface/get_memory_statistics` |
| OPNsense: netisr statistics (raw) | `opns.netisr.raw` | 1m | `/api/diagnostics/interface/get_netisr_statistics` |
| OPNsense: Protocol statistics (raw) | `opns.proto.raw` | 1m | `/api/diagnostics/interface/get_protocol_statistics` |
| OPNsense: Interface statistics (raw) | `opns.ifstats.raw` | 1m | `/api/diagnostics/interface/get_interface_statistics` |
| OPNsense: NTP peers (raw) | `opns.ntp.raw` | 5m | `/api/ntpd/service/status` |
| OPNsense: Services (raw) | `opns.services.raw` | 5m | `/api/core/service/search` |
| OPNsense: Swap (raw) | `opns.swap.raw` | 5m | `/api/diagnostics/system/system_swap` |
| OPNsense: Temperature sensors (raw) | `opns.temperature.raw` | 1m | `/api/diagnostics/system/system_temperature` |
| RAW IPsec Phase1 | `opns.ipsec.phase1.raw` | 5m | `/api/ipsec/sessions/searchPhase1` |

Seven items need no request of their own because they hang off masters that were already
being polled: the configuration change timestamp and both load averages come from
`opns.raw.load`, the blocked share of the firewall log from `opns.raw.fw.action`, the CARP
demotion factor and maintenance mode from `opns.raw.interfaces.carp`, and the version from
`opns.raw.product.info`.

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

### UPS Triggers

| Name | Severity | Description |
|------|----------|-------------|
| UPS on Battery | **High** | UPS status contains `OB` – mains power has failed. |
| Battery low | **Disaster** | UPS status contains `LB` – battery is critically low and shutdown is imminent. |
| High Load on UPS Battery | **Average** | UPS load exceeds `{$OPNS.NUT.HIGH.LOAD}` % (default: 80%). |
| Battery charge is below {$OPNS.NUT.BAT.LOW} | **Warning** | Battery charge is below `{$OPNS.NUT.BAT.LOW}` % (default: 30%). |
| Remaining battery runtime is low | **High** | Estimated runtime is below `{$OPNS.NUT.BAT.RUNTIME}` seconds (default: 600s / 10 min). |

### WireGuard Triggers

| Name | Severity | Description |
|------|----------|-------------|
| WireGuard instance {#WG.INSTANCE} is down | **High** | Instance status has not been `up` for 5 minutes. |
| WireGuard peer {#WG.NAME} is not online | **High** | Peer status has not been `online` for 5 minutes. OPNsense marks peers online when the latest handshake is not older than 300 seconds. |

### Packet Filter Triggers

| Name | Severity | Description |
|------|----------|-------------|
| OPNsense: pf is dropping packets due to memory | **High** | `opns.pf.counter.memdrop.rate` above zero. Traffic is being lost, not merely delayed. |
| OPNsense: pf state limit is being hit | **High** | `opns.pf.counter.statelimit.rate` above zero. New connections are being refused. |
| OPNsense: pf source tracking table is filling up | **High** | Source tracking above `{$OPNS.PF.SRCNODES.UTIL.CRIT}` % for 5 minutes. Depends on the source limit trigger, so only the more specific one alerts. |
| OPNsense: SYN flood detected | **Average** | `opns.pf.synfloods.rate` above zero. |
| OPNsense: pf source limit is being hit | **Warning** | `opns.pf.counter.srclimit.rate` above zero. |
| OPNsense: pf is seeing malformed packets | **Warning** | `opns.pf.counter.badoffset.rate` above zero. |
| OPNsense: pf table entries are filling up | **Warning** | Table entries above `{$OPNS.PF.TABLES.UTIL.WARN}` % of the configured ceiling. |
| OPNsense: Ruleset has changed | **Info** | The ruleset fingerprint differs from the previous value. |
| OPNsense: Number of filter rules has changed | **Info** | The filter rule count changed. |
| OPNsense: Number of NAT rules has changed | **Info** | The NAT rule count changed. |

### Kernel, Protocol and Processor Triggers

| Name | Severity | Description |
|------|----------|-------------|
| OPNsense: Kernel denied network memory requests | **High** | `opns.mbuf.denied` increased. The counter is cumulative and should stay at zero. |
| OPNsense: mbuf cluster pool is filling up | **Average** | Cluster utilization above `{$OPNS.MBUF.UTIL.WARN}` % for 5 minutes. Depends on the trigger above. |
| OPNsense: netisr queue is dropping packets | **Average** | `opns.netisr.queue.drops` increased. |
| OPNsense: Receiving IP packets with bad checksums | **Warning** | Bad checksums for 10 minutes straight. |
| OPNsense: Packets discarded for lack of a route | **Warning** | No route for 10 minutes straight. |
| OPNsense: CPU utilization is high | **Warning** | Utilization above `{$OPNS.CPU.UTIL.WARN}` % averaged over 10 minutes. |
| OPNsense: Load average is high | **Warning** | Five minute load above `{$OPNS.LOAD.AVG5.WARN}` averaged over 10 minutes. |
| OPNsense: Load per core is high | **Warning** | Load per core above `{$OPNS.LOAD.PERCORE.WARN}` averaged over 15 minutes. |

### Clock, CARP and Configuration Triggers

| Name | Severity | Description |
|------|----------|-------------|
| OPNsense: Clock is not synchronised | **Warning** | Unsynchronised for 30 minutes. |
| OPNsense: Clock offset is high | **Warning** | Absolute offset above `{$OPNS.NTP.OFFSET.WARN}` ms. |
| OPNsense: CARP maintenance mode has been on for 30 minutes | **Warning** | Maintenance mode was probably left on after a planned change. |
| OPNsense: Configuration has been changed | **Info** | The configuration change timestamp moved. |
| OPNsense: Version has changed | **Info** | An update was most likely applied. |

## Discovery Rules

### 1. Disk Discovery

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

### 2. Gateway Discovery

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

### 3. FW Action Discovery

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

### 4. Interface CARP Discovery

| Property | Value |
|----------|-------|
| Key | `opns.interface.carp.discovery` |
| Type | Dependent (master: `opns.raw.interfaces.carp`) |
| LLD Macro | `{#OPNS.INTERFACE.NAME}` → `$.interface` |
| Keep lost resources | 1d |

**Item Prototypes:**

| Name | Key | Description |
|------|-----|-------------|
| Carp Status of {#OPNS.INTERFACE.NAME} | `opns.carp.status[{#OPNS.INTERFACE.NAME}]` | CARP status of the VIP (MASTER, BACKUP, INIT). Uses discard unchanged heartbeat (2h). |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| Carp Status Changed on {#OPNS.INTERFACE.NAME} | **High** | CARP status changed – indicates a failover event. |

> **Note:** If no CARP interfaces are configured, the discovery returns a custom error and
> no items are created.

---

### 5. Interface Stats Discovery

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

### 6. WireGuard Instance Discovery

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

### 7. WireGuard Peer Discovery

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

### 8. Services Discovery

| Property | Value |
|----------|-------|
| Key | `opns.services.discovery` |
| Type | Dependent (master: `opns.services.raw`) |
| LLD Macros | `{#SERVICE.ID}` → `$.id`, `{#SERVICE.NAME}` → `$.name`, `{#SERVICE.DESCRIPTION}` → `$.description` |
| Filters | `{#SERVICE.ID}` configurable via `{$OPNS.SERVICE.ID.NOT_MATCHES}` |

**Item Prototypes:**

| Name | Key | Description |
|------|-----|-------------|
| Service {#SERVICE.DESCRIPTION}: Running | `opns.service.running[{#SERVICE.ID}]` | Run state of the service, the packet filter included. |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| OPNsense: Service {#SERVICE.DESCRIPTION} is not running | **Average** | Service has been down for 5 minutes. |

---

### 9. Swap Discovery

| Property | Value |
|----------|-------|
| Key | `opns.swap.discovery` |
| Type | Dependent (master: `opns.swap.raw`) |
| LLD Macro | `{#SWAPDEV}` → `$.device` |

**Item Prototypes:**

| Name | Key | Unit | Description |
|------|-----|------|-------------|
| Swap {#SWAPDEV}: total | `opns.swap.total[{#SWAPDEV}]` | B | Size of the swap device. |
| Swap {#SWAPDEV}: used | `opns.swap.used[{#SWAPDEV}]` | B | Used swap in bytes. |
| Swap {#SWAPDEV}: utilization | `opns.swap.pused[{#SWAPDEV}]` | % | Used swap as a percentage. |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| OPNsense: Swap {#SWAPDEV} is in use | **Warning** | Above `{$OPNS.SWAP.UTIL.WARN}` % for 10 minutes. A firewall should not swap, so the default threshold is deliberately low. Overridable per device via macro context. |

---

### 10. Temperature Discovery

| Property | Value |
|----------|-------|
| Key | `opns.temperature.discovery` |
| Type | Dependent (master: `opns.temperature.raw`) |
| LLD Macros | `{#DEVICE}` → `$.device`, `{#TYPE}` → `$.type` |

**Item Prototypes:**

| Name | Key | Unit | Description |
|------|-----|------|-------------|
| Temperature {#DEVICE} | `opns.temperature[{#DEVICE}]` | °C | Sensor reading. |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| OPNsense: Sensor {#DEVICE} is running hot | **High** | Above `{$OPNS.TEMP.CRIT}` °C averaged over 5 minutes. Overridable per sensor via macro context, so a single hot sensor does not force the threshold up everywhere. |

**Graph Prototypes:**

| Name | Description |
|------|-------------|
| Temperature {#DEVICE} | Sensor reading over time. |

---

### 11. netisr Queue Discovery

| Property | Value |
|----------|-------|
| Key | `opns.netisr.discovery` |
| Type | Dependent (master: `opns.netisr.raw`) |
| LLD Macro | `{#NETISR.PROTO}`, collected by shape rather than by path because the nesting depth varies between netstat versions |

**Item Prototypes:**

| Name | Key | Unit | Description |
|------|-----|------|-------------|
| netisr {#NETISR.PROTO}: Queue drops | `opns.netisr.queue.drops[{#NETISR.PROTO}]` | /s | Queue drops for the individual protocol. |

---

### 12. Network Interface Discovery (link state and inbound errors)

Deliberately separate from *Interface Stats Discovery*: it adds the two metrics that
discovery does not provide, out of a different endpoint, and leaves the existing rule
untouched. Both rules discover the same interfaces, but no metric exists twice.

| Property | Value |
|----------|-------|
| Key | `opns.net.if.discovery` |
| Type | Dependent (master: `opns.ifstats.raw`) |
| LLD Macros | `{#IFNAME}`, `{#IFALIAS}` |
| Filters | `{#IFNAME}` configurable via `{$OPNS.IF.NAME.NOT_MATCHES}` |

**Item Prototypes:**

| Name | Key | Description |
|------|-----|-------------|
| Interface {#IFALIAS} ({#IFNAME}): Link status | `opns.net.if.status[{#IFNAME}]` | Link up or down, read from the interface flags. |
| Interface {#IFALIAS} ({#IFNAME}): Inbound errors | `opns.net.if.in.errors[{#IFNAME}]` | Receive errors per second. |

**Trigger Prototypes:**

| Name | Severity | Description |
|------|----------|-------------|
| OPNsense: Interface {#IFALIAS} ({#IFNAME}) is down | **Average** | Link is gone or the interface was shut down. Set `{$OPNS.IF.CONTROL:"{#IFNAME}"}` to `0` for interfaces that are allowed to be down, such as a cold standby uplink. |

---

### 13. IPsec Phase 1 Discovery

Was not described here before. Phase 2 no longer has a rule of its own, see below.

| Property | Value |
|----------|-------|
| Key | `opns.ipsec.phase1.discovery` |
| Type | Dependent (master: `opns.ipsec.phase1.raw`) |
| LLD Macros | `{#IPSECDESC}` -> `$.phase1desc`, `{#IPSECNAME}` -> `$.name` |

**Item Prototypes, phase 1:** connection state, local address, and bytes in and out both as a
total and as a rate. The API aggregates these counters over all child SAs of the connection
itself.

**Item Prototypes, phase 2:** `IPsec {#IPSECDESC}: phase 2 (raw)`
(`opns.ipsec.phase2.raw[{#IPSECNAME}]`) is an HTTP agent prototype that posts
`id={#IPSECNAME}` to `/api/ipsec/sessions/search_phase2`, one request per connection, and
serves the ten phase 2 values below it: bytes and packets in and out as totals and rates,
plus mode and state. Values are summed over the child SAs of the connection, and a tunnel that
is down simply reports nothing rather than turning the items unsupported.

---

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

The template includes a built-in dashboard **"OPNsense Info"** with eight pages:

1. **Overview** – memory, state table, processor and load per core as gauges, tiles for CPU
   load, uptime, version, firmware status and the state table, firewall actions over time,
   CARP status, and every filesystem as a honeycomb.
2. **Packet filter** – state table, source tracking and pf table utilization, tiles from
   states in use to source limit hits, state table churn and searches, rule matches against
   evaluations, drops and limit hits, and malformed packets.
3. **Interfaces** – link state per interface, traffic, blocked and passed bytes (IPv4) side
   by side, and inbound errors, output errors, queue drops and collisions in one graph.
4. **Gateways** – status honeycomb, round-trip time and packet loss side by side, and the
   round-trip deviation below.
5. **VPN** – WireGuard peers and instances, peer traffic, IPsec phase 1 tunnels and phase 2
   traffic.
6. **System** – processor, memory and load per core, uptime, version, cores, configuration
   change timestamp, both load averages, processor utilization split into user, system and
   interrupt, load average over time, and temperature and swap honeycombs.
7. **Kernel and protocols** – mbuf utilization, clusters in use, denied requests, netisr
   drops, kernel network memory and netisr drops per protocol, IP and TCP error rates.
8. **Services, clock and power** – every service as a honeycomb, clock synchronization,
   offset, stratum and reachable peers, CARP demotion and maintenance, UPS battery, status,
   load and runtime, and clock offset and UPS voltage over time.

The previous three pages were rebuilt for three reasons. The CPU load widget set `Show=5`,
which Zabbix 7.0 refuses with `Invalid parameter "Show/5": value must be one of 1, 2, 3, 4`.
Both pie charts plotted a total against a part of that same total, so the slice for used
memory was drawn against total plus used and always read about half its real size. And the
pages occupied 41, 45 and 55 of the 72 grid columns, leaving the right third empty, while
`Gateway RTT*` also matched `Gateway RTTd` and mixed round-trip time into one graph with its
own standard deviation. Everything the old pages showed is still shown, and the UPS,
WireGuard and IPsec items that ship with the template but appeared on no page now have one.

## Corrected API URLs

Two master items called their endpoint in camelCase while the OPNsense privilege pattern is
exact snake_case. OPNsense routes both spellings to the same controller action, so an
administrator API key never sees a problem, but the ACL is a different code path: it matches
the raw URL with `preg_match` and no `i` modifier against `api/diagnostics/firewall/pf_states`
and `api/diagnostics/system/system_resources`, both exact rather than wildcards.

Measured against OPNsense 26.7 with a monitoring user holding only Lobby: Dashboard:

```
403  diagnostics/firewall/pfStates        200  diagnostics/firewall/pf_states
403  diagnostics/system/systemResources   200  diagnostics/system/system_resources
```

For anyone following least privilege this took out `opns.fw.states.current`,
`opns.fw.states.max`, `opns.states.util` and all four memory items. Both URLs now use the
snake_case spelling.

The IPsec phase 1 master was also one of two items ignoring `{$OPNS.PORT}` and pinned to 443.
It now uses the macro like everything else.

## Repaired IPsec monitoring

Three defects, none of them visible without a tunnel to test against.

**The masters shipped disabled.** Both IPsec raw items carried `status: DISABLED`. For the UPS
master that is deliberate and documented; for IPsec neither the README nor the Raw Data Items
table mentioned the items at all, so a user with working tunnels saw nothing and had no hint
why. The same confusion already played out for UPS in issue #706. Phase 1 is enabled now;
`ipsec/sessions/search_phase1` answers HTTP 200 with an empty row set on a firewall without
tunnels, so this costs nothing for anyone else.

**Tunnels without a description were dropped.** `searchPhase1Action` leaves `phase1desc` at
`null` when the connection carries no description, and legacy tunnels can miss the ikeid
lookup as well. The discovery used that field as the entity identity and put it into every
prototype key, so several such tunnels collapsed into identical keys and the rule failed as a
whole. A JavaScript step now fills `phase1desc` from `name`, which the API always sets. Item
keys of anybody who does have descriptions are unchanged.

**Phase 2 could never return anything.** `searchPhase2Action` reads its connection from
`getPost('id')` and returns an empty set without it, while the template asked for it with a
plain GET and no parameters. Measured against OPNsense 26.7 with a monitoring key, echoing
`current` back proves that POST parameters arrive:

```
GET  (no parameters)         -> {"current":1,...}
POST form-encoded current=3  -> {"current":3,...}
```

The web interface does the same: `sessions.volt` sends `request['id']` taken from the selected
phase 1 row, whose identifier is the `name` column. Phase 2 therefore needs one request per
connection, which is an item prototype inside the phase 1 rule rather than a standalone
master, because a discovery rule cannot depend on an item another rule created. The ten phase 2
prototypes moved accordingly and now aggregate over the child SAs of their connection.

The privilege set does not change, `page-status-ipsec` covers `api/ipsec/sessions/*`.

## Feedback

If you encounter any issues or have suggestions for improvement, please open an issue or
pull request in the community templates repository.
