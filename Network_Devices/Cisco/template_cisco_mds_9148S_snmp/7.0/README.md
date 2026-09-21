# Cisco MDS 9148S by SNMP — Zabbix 7.0

Import file: `template_cisco_mds_9148S_snmp.yaml` — template name **Cisco MDS 9148S by SNMP**, group *Templates/Network devices*.

Monitors a Cisco MDS 9148S 16G Multilayer Fabric Switch (48 × 16 Gbps FC, NX-OS 6.2 – 9.4) through its SNMP agent: availability, CPU and memory, temperature, power supplies, fans, the Fibre Channel ports (traffic, link state and cause, FC error counters, slow drain), transceiver digital diagnostics, SAN port-channels, FLOGI and name server counts, VSANs and zoning, licenses and crashed processes.

Every OID comes from the Cisco MIB files in [files/cisco](files/cisco), taken from [github.com/cisco/cisco-mibs](https://github.com/cisco/cisco-mibs) and limited to the modules on the [MDS 9000 MIB support list](https://github.com/cisco/cisco-mibs/tree/main/supportlists/mds9000) (identical from NX-OS 8.4(2f) to 9.4(4)). The FC counters are limited to the object groups that the `ciscoFcFeCapabilityV06R0213PMds` statement of **CISCO-FC-FE-CAPABILITY** declares for NX-OS on MDS — the statement lists the m9148S by name.

MIBs used: **SNMPv2-MIB**, **IF-MIB**, **ENTITY-MIB**, **CISCO-ENTITY-SENSOR-MIB**, **CISCO-ENTITY-FRU-CONTROL-MIB**, **CISCO-SYSTEM-EXT-MIB**, **CISCO-FC-FE-MIB**, **CISCO-VSAN-MIB**, **CISCO-ZS-MIB**, **CISCO-NS-MIB**, **CISCO-LICENSE-MGR-MIB**, **CISCO-CONFIG-MAN-MIB**, plus the notification MIBs listed in section 1.13.

> **Not yet verified with `snmpwalk` against a live MDS 9148S.** The template imports into Zabbix 7.0 (tested with 7.0.30, including an export/re-import round trip), and the discovery scripts were run against SNMP walks of an NX-OS switch that uses the same SNMP agent (Nexus, `Ethernet1/x` renamed to `fc1/x`). The points that depend on real MDS output are called out below: transceiver DOM over SNMP, the FC `ifHighSpeed` value, `ccmHistoryRunning*` and the encoding of `clmLicenseFlag`.

*Vietnamese version: [files/README_vi.md](files/README_vi.md)*

---

# 0. Preparing the switch

```
! SNMPv3 (recommended)
snmp-server user zabbix network-operator auth sha <auth-password> priv aes-128 <priv-password>
! or SNMPv2c
snmp-server community <community> group network-operator

! optional: traps to the Zabbix server/proxy
snmp-server host <zabbix-ip> traps version 2c <community> udp-port 162
snmp-server enable traps
show snmp trap
```

- SNMP version and credentials belong to the **host interface** in Zabbix, not to the template. The `network-operator` role (read-only) is enough.
- Poll with **SNMPv2c or SNMPv3**: the traffic items use the 64-bit `ifHCInOctets` / `ifHCOutOctets` and several FC counters are `Counter64`.
- `snmp-server enable traps` enables every notification type; `show snmp trap` lists them so that noisy ones can be disabled one by one.
- The trap items need `snmptrapd` + the Zabbix SNMP trapper on the server or proxy. Load the MIBs of [files/cisco](files/cisco) into `snmptrapd` to get trap names in the text; the regular expressions match either the name or the numeric OID.
- The hourly discovery walk (`mds.entity.walk`) reads the whole entity and sensor tables. If it times out, raise **Max repetition count** of the SNMP interface (for example to 50) or the item timeout.

`sysObjectID` of the MDS 9148S is `1.3.6.1.4.1.9.12.3.1.3.1491` (`cevChassisDSC9148SK9`, CISCO-ENTITY-VENDORTYPE-OID-MIB): MDS NX-OS reports the chassis vendor type, not an entry of CISCO-PRODUCTS-MIB.

---

# 1. Monitored items

## 1.1 Availability and system

| Item | Key | Source | Units | Interval |
| --- | --- | --- | --- | --- |
| ICMP ping | `icmpping` | simple check | | 1m |
| ICMP loss | `icmppingloss` | simple check | % | 1m |
| ICMP response time | `icmppingsec` | simple check | s | 1m |
| SNMP agent availability | `zabbix[host,snmp,available]` | internal | | 1m |
| System name | `system.name` | `1.3.6.1.2.1.1.5.0` sysName | | 15m |
| System description | `system.descr[sysDescr.0]` | `1.3.6.1.2.1.1.1.0` | | 15m |
| System location | `system.location[sysLocation.0]` | `1.3.6.1.2.1.1.6.0` | | 15m |
| System contact details | `system.contact[sysContact.0]` | `1.3.6.1.2.1.1.4.0` | | 15m |
| System object ID | `system.objectid[sysObjectID.0]` | `1.3.6.1.2.1.1.2.0` | | 15m |
| NX-OS version | `system.sw.version` | dependent — `Version x.y(z)` from sysDescr | | — |
| Uptime (network) | `system.net.uptime[sysUpTime.0]` | `1.3.6.1.2.1.1.3.0` | uptime | 1m |
| Uptime (system) | `system.hw.uptime[cseSysUpTime.0]` | `1.3.6.1.4.1.9.9.305.1.1.10.0` | uptime | 1m |
| CPU utilization | `system.cpu.util[cseSysCPUUtilization.0]` | `1.3.6.1.4.1.9.9.305.1.1.1.0` | % | 1m |
| Memory utilization | `vm.memory.util[cseSysMemoryUtilization.0]` | `1.3.6.1.4.1.9.9.305.1.1.2.0` | % | 1m |

**Uptime (system)** is `cseSysUpTime`: seconds since the system was reloaded. Unlike `sysUpTime` it is not reset by an SNMP agent restart and does not wrap after 497 days, so the restart trigger uses it.

CPU and memory come from CISCO-SYSTEM-EXT-MIB (active supervisor). CISCO-PROCESS-MIB is not used: its only MDS capability statement (`ciscoProcessCapabilitySAN3R0001`) declares the per-process groups, not `cpmCPUTotalTable`.

Name, description, NX-OS version, chassis model and serial number fill the host inventory.

## 1.2 Chassis — ENTITY-MIB

| Item | Key | Source | Interval |
| --- | --- | --- | --- |
| ENTITY-MIB and sensor tables walk *(master, no history)* | `mds.entity.walk` | walk of `entPhysicalTable` (class, name, description, vendor type, containment, serial, model), `entAliasMappingTable`, `entSensorValueTable` (type, scale, precision), `entSensorThresholdTable` (severity, relation, value), `ifName`, `ifAlias` | 1h |
| Chassis model | `system.hw.model` | dependent — `entPhysicalModelName` of the `chassis(3)` entity | — |
| Chassis description | `system.hw.descr` | dependent — `entPhysicalDescr` | — |
| Chassis serial number | `system.hw.serialnumber` | dependent — `entPhysicalSerialNum` | — |

The same walk feeds the temperature and transceiver discovery rules (1.5, 1.6).

## 1.3 `FC interfaces discovery` — IF-MIB, CISCO-FC-FE-MIB

`discovery[]` of `ifName`, `ifAlias`, `ifAdminStatus`, `ifType` and `vsanIfVsan`. Keeps the ports whose name matches `{$MDS.FCIF.NAME.MATCHES}` (`fc1/1` … `fc1/48`) and skips ports that are administratively down — on a 9148S an unused or unlicensed port is normally shut. `{#VSAN}` is the port VSAN, used as the `vsan` tag. Discovery `1h`.

| Item | OID | Units | Interval |
| --- | --- | --- | --- |
| Operational status | `ifOperStatus` `1.3.6.1.2.1.2.2.1.8` | | 1m |
| Operational status cause | `fcIfOperStatusCause` `1.3.6.1.4.1.9.9.289.1.1.2.1.7` (380 values mapped) | | 1m |
| Port mode | `fcIfOperMode` `…289.1.1.2.1.3` — F, E, TE, NP… | | 5m |
| Bits received / sent | `ifHCInOctets` / `ifHCOutOctets` ×8 | bps | 3m |
| Speed | `ifHighSpeed` ×1000000 | bps | 5m |
| Link failures | `fcIfLinkFailures` `…289.1.2.1.1.1` | per poll | 5m |
| Loss of sync | `fcIfSyncLosses` `…289.1.2.1.1.2` | per poll | 5m |
| Loss of signal | `fcIfSigLosses` `…289.1.2.1.1.3` | per poll | 5m |
| Invalid transmission words | `fcIfInvalidTxWords` `…289.1.2.1.1.5` | per poll | 5m |
| CRC errors | `fcIfInvalidCrcs` `…289.1.2.1.1.6` | per poll | 5m |
| Credit loss recoveries | `fcIfCreditLoss` `…289.1.2.1.1.37` | per poll | 5m |
| Timeout discards | `fcIfTimeOutDiscards` `…289.1.2.1.1.35` | per poll | 5m |
| TxWait | `fcIfTxWaitCount` `…289.1.2.1.1.15` → % of time | % | 5m |
| Transceiver vendor / part number / serial number | `fcIfVendor` / `fcIfPartNumber` / `fcIfSerialNo` | | 1h |
| Number of logged-in Nx_Ports | dependent on the FLOGI walk (1.8) | | — |
| Logged-in port WWNs | dependent on the FLOGI walk — WWPNs as `20:00:…` | | — |

The error counters use *Simple change*: the value is the number of new events since the previous poll (5 minutes).

**TxWait** increments every 2.5 µs the port has zero transmit credits while frames are queued ([Cisco slow drain white paper](https://www.cisco.com/c/dam/en/us/products/collateral/storage-networking/mds-9700-series-multilayer-directors/whitepaper-c11-737315.pdf)). The item converts it to a percentage of time: per-second rate × 2.5·10⁻⁶ × 100. The MDS 9148S is one of the platforms Cisco lists for TxWait.

Counters that CISCO-FC-FE-MIB added after the MDS capability statement (`fcHCIfTxWaitCount`, `fcIfRxWaitCount`, `fcIfStateChangeCount`, `fcIfNbrWwn`) are not used.

Graph prototypes: *Network traffic*, *FC errors*, *Slow drain indicators*.

## 1.4 `FC port-channels discovery` and `Management interface discovery`

Port-channels: ports matching `{$MDS.PC.NAME.MATCHES}` (`port-channel 1`, `san-port-channel 1`), admin-down skipped.

| Item | OID | Units | Interval |
| --- | --- | --- | --- |
| Operational status | `ifOperStatus` | | 1m |
| Operational status cause | `fcIfOperStatusCause` — e.g. `portChannelMembersDown(43)` | | 1m |
| Port mode | `fcIfOperMode` | | 5m |
| Bits received / sent | `ifHCInOctets` / `ifHCOutOctets` ×8 | bps | 3m |
| Speed | `ifHighSpeed` — sum of the active members | bps | 5m |

Management: `mgmt0` (`{$MDS.MGMT.NAME.MATCHES}`) — status, traffic, speed, in/out errors. No link trigger: when mgmt0 is down the switch cannot be polled and *No SNMP data collection* fires instead.

## 1.5 `Temperature sensor discovery` — CISCO-ENTITY-SENSOR-MIB

Dependent on `mds.entity.walk`. Rows of `entSensorValueTable` with `entSensorType = celsius(8)`, transceiver sensors excluded.

| Item | OID | Units | Interval |
| --- | --- | --- | --- |
| Temperature | `entSensorValue` `1.3.6.1.4.1.9.9.91.1.1.1.1.4`, scaled with `entSensorScale` / `entSensorPrecision` | °C | 3m |
| Sensor status | `entSensorStatus` `…91.1.1.1.1.5` — ok, unavailable, nonoperational | | 5m |

**Thresholds come from the switch**, not from macros: at discovery time the minor and major thresholds of each sensor in `entSensorThresholdTable` (the *MinorThres* / *MajorThresh* columns of `show environment temperature`) become `{#TEMP.WARN}` and `{#TEMP.CRIT}`. Intake and outlet sensors have different limits, so a single macro would be wrong for one of them. `{$MDS.TEMP.WARN}` (60) and `{$MDS.TEMP.CRIT}` (75) are used only for a sensor that reports no threshold; `{#TEMP.SOURCE}` (`device`, `device+macro`, `macro`) tells which was used.

## 1.6 `Transceiver DOM discovery` — CISCO-ENTITY-SENSOR-MIB

Dependent on `mds.entity.walk`. One row per FC port whose transceiver exposes the five digital diagnostics sensors. NX-OS publishes them as entity sensors named `fc1/1 Lane 1 Transceiver Temperature Sensor` etc., with vendor types `cevSensorTransceiverRxPwr/TxPwr/Current/Voltage/Temp` (`1.3.6.1.4.1.9.12.3.1.8.46` – `.50`). A sensor is mapped to its port through `entPhysicalContainedIn` → port entity → `entAliasMappingIdentifier` (ifIndex), or by the port name at the start of `entPhysicalName`.

| Item | Units | Interval |
| --- | --- | --- |
| Link status (transceiver) — `ifOperStatus`, used by the power triggers | | 3m |
| Transceiver temperature | °C | 5m |
| Transceiver supply voltage | V | 5m |
| Transceiver bias current | mA | 5m |
| Transceiver Tx power | dBm | 5m |
| Transceiver Rx power | dBm | 5m |

Each sensor carries its four thresholds from the transceiver EEPROM (high/low alarm, high/low warning), scaled to the same unit: `{#XCVR.RX.HI.CRIT}`, `{#XCVR.RX.LO.WARN}`, … A missing threshold becomes ±1000000000 so that it never fires. Rx/Tx power is reported with `entSensorType = 14` (dBm), a value newer than the published CISCO-ENTITY-SENSOR-MIB; the template does not depend on it.

> **To verify on your switch.** A Cisco community thread reports that the older MDS 9148 on NX-OS 6.2(1) did not expose transceiver sensors over SNMP. If `snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.91.1.1.1.1.1` returns only a handful of chassis sensors, this rule stays empty — nothing else is affected — and the *Sensor or transceiver threshold event* trap (`cIfXcvrMonStatusChangeNotif`) remains the only DOM alarm.

Graph prototype: *Transceiver optical power*.

## 1.7 Power supplies, fans, modules — CISCO-ENTITY-FRU-CONTROL-MIB

| Rule | Source | Item | Interval |
| --- | --- | --- | --- |
| `Power supply discovery` | `cefcFRUPowerOperStatus` `1.3.6.1.4.1.9.9.117.1.1.2.1.2`, rows with `entPhysicalClass = powerSupply(6)` | Power supply status | 3m |
| `Fan discovery` | `cefcFanTrayOperStatus` `…117.1.4.1.1.1` (fan trays and power supply fans) | Fan status | 3m |
| `Module discovery` | `cefcModuleOperStatus` `…117.1.2.1.1.2` | Module status | 3m |
| `Power budget discovery` | `cefcFRUPowerSupplyGroupTable` `…117.1.1.1.1` | Redundancy mode (1h), power units (1h), total available / drawn current (5m), power budget utilization % (calculated) | |

On the 9148S module 1 is the whole switch (integrated supervisor and 48 ports); there are two hot-swappable power supplies (1+1). Names come from `entPhysicalName`. The current values are in the unit given by `cefcPowerUnits`; the utilization percentage does not depend on it.

## 1.8 Fabric

| Item | Key | Source | Interval |
| --- | --- | --- | --- |
| FLOGI table walk *(master, no history)* | `mds.flogi.walk` | walk `fcIfNxPortName` `1.3.6.1.4.1.9.9.289.1.1.5.1.3` (index ifIndex.vsan.login) | 5m |
| Number of FLOGI sessions | `mds.flogi.count` | dependent — rows of `fcIfFLoginTable` (`show flogi database`) | — |
| Name server: registered Nx_Ports | `mds.ns.entries[fcNameServerNumRows.0]` | `1.3.6.1.4.1.9.9.293.1.1.3.0`, fabric wide | 5m |
| Number of VSANs | `mds.vsan.num[vsanNumber.0]` | `1.3.6.1.4.1.9.9.282.1.1.1.0` | 1h |

Graph: *Fabric logins* (FLOGI sessions and name server entries).

## 1.9 `VSAN discovery` — CISCO-VSAN-MIB, CISCO-ZS-MIB

`discovery[]` of `vsanName` and `vsanAdminState`; `{#SNMPINDEX}` is the VSAN id. The isolated VSAN 4094 and suspended VSANs are skipped.

| Item | Source | Interval |
| --- | --- | --- |
| Operational state | `vsanOperState` `1.3.6.1.4.1.9.9.282.1.1.3.1.8` — up while at least one of its interfaces is up | 3m |
| Active zone set | `zoneEnforcedZoneSetName` `…294.1.1.13.1.1` (empty when none is active) | 15m |
| Default zone policy | `zoneDefaultZoneBehaviour` `…294.1.1.1.1.1` — permit / deny | 15m |
| Enforced zone database equals local | `zoneDbEnforcedEqualsLocal` `…294.1.1.30.1.2` | 15m |

The three zoning items are dependent on the *Zone server walk* (`mds.zone.walk`, 15m), which reads the three tables at once.

## 1.10 Licenses — CISCO-LICENSE-MGR-MIB

| Rule / item | Source | Interval |
| --- | --- | --- |
| License feature usage walk *(master)* | `clmLicenseFlag`, `clmLicenseGracePeriodLeft` of `clmLicenseFeatureUsageTable` | 1h |
| `License feature discovery` | one row per feature (`PORT_ACTIVATION_PKG`, `ENTERPRISE_PKG`…), name decoded from the table index | |
| — Grace period state | bit `inGracePeriod(4)` of `clmLicenseFlag` | — |
| — Grace period left | `clmLicenseGracePeriodLeft` | s |
| `Port license discovery` | `clmPortLicCountTable`: maximum (1h) and used (15m) port activation licenses | |

The 9148S activates its ports in 12-port increments (on-demand port activation). `clmLicenseFlag` is a `BITS` value: the script accepts it as hex (`18`), as a raw character or with the bit names appended. **To verify** with `snmpwalk … 1.3.6.1.4.1.9.9.369.1.3.4.1.2` if the grace period state looks wrong.

## 1.11 Software failures and configuration

| Item | Key | Source | Interval |
| --- | --- | --- | --- |
| Core files walk *(master)* | `mds.cores.walk` | walk `cseSwCoresPID` `1.3.6.1.4.1.9.9.305.1.4.2.1.4` | 15m |
| Number of core files | `mds.cores.count` | dependent — rows of `cseSwCoresTable` (`show cores`) | — |
| Crashed processes | `mds.cores.list` | dependent — process names decoded from the index | — |
| Running configuration last changed | `mds.config.running.changed[…]` | `ccmHistoryRunningLastChanged` `1.3.6.1.4.1.9.9.43.1.1.1.0` | 5m |
| Running configuration last saved | `mds.config.running.saved[…]` | `ccmHistoryRunningLastSaved` `1.3.6.1.4.1.9.9.43.1.1.2.0` | 5m |

## 1.12 Graphs

*CPU and memory utilization*, *Fabric logins*, plus the prototypes listed above.

## 1.13 SNMP traps

| Item | Notifications (name or numeric OID) | Trigger |
| --- | --- | --- |
| SNMP traps (fallback) | everything not matched below | |
| Interface link up/down | `linkDown`, `linkUp`, `cieLinkDown`, `cieLinkUp` | history only |
| Hardware FRU event | `cefcModuleStatusChange`, `cefcPowerStatusChange`, `cefcFRUInserted`, `cefcFRURemoved`, `cefcUnrecognizedFRU`, `cefcFanTrayStatusChange`, `cefcPowerSupplyOutputChange` (`…117.2.0.1-7`) | ✓ |
| Sensor threshold event | `entSensorThresholdNotification` (`…91.2.0.1`), `cIfXcvrMonStatusChangeNotif` (`…706.0.1`) | ✓ |
| Software failure | `cseFailSwCoreNotify(Extended)`, `cseHaRestartNotify`, `cseShutDownNotify` | ✓ |
| Zone merge failure | `zoneMergeFailureNotify` (`…294.1.4.0.2`) | ✓ |
| Fabric event | zone set activation, zone merge success, default zone change, VSAN status / membership change, trunk up/down, ELP reject, `fcotInserted`/`fcotRemoved`, FSPF neighbor change | history only |
| License event | `clmLicenseExpiryNotify`, `clmNoLicenseForFeatureNotify`, `clmLicenseFileMissingNotify`, `clmLicenseExpiryWarningNotify` | ✓ |
| Security violation | port security / fabric binding deny (`CISCO-PSM-MIB`), `cfcspAuthFailNotification` | ✓ |
| Syslog message | `clogMessageGenerated` | history only |
| Device restart | `coldStart`, `warmStart` | history only |

The transceiver alarm and warning flags of CISCO-INTERFACE-XCVR-MONITOR-MIB are `accessible-for-notify`: they can only be received in `cIfXcvrMonStatusChangeNotif`, never polled.

---

# 2. Alerting triggers

## 2.1 Availability and system

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| Unavailable by ICMP ping | HIGH | | |
| No SNMP data collection | WARNING | | Unavailable by ICMP ping |
| High ICMP ping loss | WARNING | | Unavailable by ICMP ping |
| High ICMP ping response time | WARNING | | High ICMP ping loss |
| Device has been restarted | WARNING | ✓ | No SNMP data collection |
| High CPU utilization | WARNING | | No SNMP data collection |
| High memory utilization | AVERAGE | | |
| System name has changed | INFO | ✓ | |
| NX-OS version has changed | INFO | ✓ | |
| Device has been replaced (chassis serial changed) | INFO | ✓ | |
| A process crashed and wrote a core file | AVERAGE | ✓ | |
| Running configuration has not been saved | INFO | ✓ | |

- **Restarted**: `cseSysUpTime < 10m`.
- **CPU / memory**: 5-minute minimum above `{$CPU.UTIL.CRIT}` / `{$MEMORY.UTIL.MAX}` (90).
- **Core file**: the number of rows of `cseSwCoresTable` is higher than its minimum over `{$MDS.CORE.HOLD}` (24h). The problem closes by itself 24 hours after the last new core, when the cores are cleared (`clear cores`), or manually. *Crashed processes* shows which process.
- **Configuration not saved**: `ccmHistoryRunningLastChanged > ccmHistoryRunningLastSaved`, the change is older than `{$MDS.CONFIG.UNSAVED.MAX}` (1h), and `LastSaved > 0`. The last condition keeps it silent until the first `copy running-config startup-config` after a reload, when NX-OS has no saved timestamp yet.

## 2.2 FC interfaces

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| Link down | AVERAGE | ✓ | |
| Credit loss recovery | AVERAGE | ✓ | Link down |
| High TxWait | WARNING | ✓ | Link down |
| Frames dropped by congestion-drop timeout | WARNING | ✓ | Link down |
| CRC errors | WARNING | ✓ | Link down |
| Invalid transmission words | WARNING | ✓ | Link down |
| Link instability (link failures + loss of sync + loss of signal) | WARNING | ✓ | Link down |
| High bandwidth usage | WARNING | ✓ | Link down |
| Link speed has decreased | INFO | ✓ | Link down |

- **Link down** fires only when `ifOperStatus` *changes* to `down(2)` — ports that never came up raise nothing — and **not** when the port was shut by an administrator (`fcIfOperStatusCause = adminDown(12)`). The operational data shows the cause (`linkFailure`, `fcotNotPresent`, `errorDisabled`, `portGuard…`). Silence a port with `{$IFCONTROL:"fc1/5"}=0`.
- **Error triggers** compare the number of new events during the last poll with a macro, and recover when there was none above it for 15 minutes. The defaults follow Cisco's [sample port-monitor policy](https://www.cisco.com/c/en/us/support/docs/storage-networking/mds-9000-nx-os-software-release-62/200102-Sample-MDS-port-monitor-policy-for-alert.html) (per 60 s there, per 5-minute poll here, so slightly stricter):

  | Macro | Default | Cisco sample policy |
  | --- | --- | --- |
  | `{$MDS.FC.CRC.MAX}` | 5 | invalid-crc 5 |
  | `{$MDS.FC.ITW.MAX}` | 5 | invalid-words 5 |
  | `{$MDS.FC.LINK.LOSS.MAX}` | 3 | link-loss / sync-loss / signal-loss 3 |
  | `{$MDS.FC.TIMEOUT.DISCARDS.MAX}` | 50 | timeout-discards 50 |
  | `{$MDS.FC.CREDIT.LOSS.MAX}` | 0 | credit-loss-reco 1 |
  | `{$MDS.FC.TXWAIT.MAX}` | 10 (% of the 5-minute poll) | txwait 20 % of 1 s |

  All accept the interface name as context, e.g. `{$MDS.FC.CRC.MAX:"fc1/12"}=50` for a known dirty link.
- **Credit loss recovery** and **TxWait** are the slow drain indicators: the device behind an F port (or the fabric behind an E port) does not return buffer credits. Invalid transmission words also increment while a link comes up, so a flap may raise it together with *Link instability*.
- **High bandwidth**: 15-minute average of in or out above `{$IF.UTIL.MAX}` % (90) of `ifHighSpeed × {$MDS.FC.RATE.RATIO}`. FC carries 100 MB/s of payload per nominal Gbit/s — 16GFC is 1600 MB/s = 12.8 Gbit/s — so `{$MDS.FC.RATE.RATIO}` is 0.8. If your switch reports `ifHighSpeed` as the data rate (a 16G port showing 12800 instead of 16000), set it to 1.

## 2.3 Port-channels

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| Port-channel down | HIGH | ✓ | |
| Port-channel bandwidth has decreased | WARNING | ✓ | Port-channel down |
| High bandwidth usage | WARNING | ✓ | Port-channel down |

A port-channel down means the ISL (or NPV uplink) is lost; it does not fire on `adminDown(12)` / `channelAdminDown(13)`. *Bandwidth has decreased* is the member-link-lost alarm: the aggregated `ifHighSpeed` dropped.

## 2.4 Transceivers (DOM)

| Trigger | Severity | Depends on |
| --- | --- | --- |
| Transceiver temperature / supply voltage / bias current / Tx power / Rx power is out of the alarm range | AVERAGE | |
| … is out of the warning range | WARNING | the alarm trigger |

Out of range for the whole last 15 minutes (`min(15m) >= high` or `max(15m) <= low`) against the transceiver's own thresholds. The Tx and Rx power triggers also require the link to be up: a port without light is a link problem, reported by *Link down*. Silence a port with `{$MDS.XCVR.CONTROL:"fc1/5"}=0`.

## 2.5 Environment and hardware

| Trigger | Severity | Depends on |
| --- | --- | --- |
| Temperature is above the critical threshold | HIGH | |
| Temperature is above the warning threshold | WARNING | critical |
| Temperature sensor is not operational | WARNING | |
| Power supply is not delivering power | AVERAGE | |
| Power supply is in warning state | WARNING | not delivering power |
| Fan is down | AVERAGE | |
| Fan is in warning state | WARNING | Fan is down |
| Module is not in ok state | AVERAGE | |

- Temperature: 5-minute average `>= {#TEMP.CRIT}` / `>= {#TEMP.WARN}` (switch thresholds, see 1.5), recovery 3 °C lower.
- Power supply: *not delivering power* is any state but `on(2)`, `onButFanFail(9)` and `onButInlinePowerFail(12)` — no input power, admin off, failed…; the two *onBut* states are the warning.
- Fan: `down(3)` / `warning(4)`.
- Module: not `ok(2)` for three polls in a row (diagnostics failed, powered down, power denied…).

## 2.6 VSANs and zoning

| Trigger | Severity | Manual close |
| --- | --- | --- |
| VSAN is down | AVERAGE | ✓ |
| Active zone set has changed | INFO | ✓ |
| Default zone policy is permit | INFO | |
| Zoning changes are not activated | INFO | ✓ |

- **VSAN is down** fires when `vsanOperState` changes to down: no interface of the VSAN is up on this switch any more. Unused VSANs that were always down raise nothing. Silence with `{$MDS.VSAN.CONTROL:"<vsan id>"}=0`.
- **Default zone permit**: devices outside any zone can see each other. Allow it per VSAN with `{$MDS.DEFZONE.CONTROL:"<vsan id>"}=0`.
- **Zoning not activated**: `zoneDbEnforcedEqualsLocal` has been false for `{$MDS.ZONE.PENDING.MAX}` (1h) — zones were edited but the zone set was not activated.

## 2.7 Licenses

| Trigger | Severity | Depends on |
| --- | --- | --- |
| Grace period expires soon (less than `{$MDS.LICENSE.GRACE.MIN}`, 7d) | HIGH | |
| Feature is running in the license grace period | AVERAGE | Grace period expires soon |
| All port licenses are in use | INFO | |

A feature enabled without a license runs for a grace period and is then disabled. *All port licenses are in use*: a new port cannot come up (cause `portActLicenseNotAvailable`).

## 2.8 Trap-based triggers

*Hardware FRU event received* (WARNING), *Sensor or transceiver threshold event received* (WARNING), *Software failure or service restart* (AVERAGE), *Zone merge failure* (AVERAGE), *License event received* (WARNING), *Port security or fabric binding violation* (WARNING): `nodata(trap item, {$MDS.TRAP.EVENT.HOLD}) = 0` — open while a matching trap was received within the last hour, then close by themselves; manual close allowed. The operational data shows the trap text.

---

# 3. Macros

## 3.1 Thresholds

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$CPU.UTIL.CRIT}` | `90` | CPU utilization (%), 5-minute minimum |
| `{$MEMORY.UTIL.MAX}` | `90` | Memory utilization (%), 5-minute minimum |
| `{$IF.UTIL.MAX}` | `90` | Bandwidth (%) of the usable data rate, context = ifName |
| `{$MDS.FC.RATE.RATIO}` | `0.8` | Usable FC data rate / `ifHighSpeed` |
| `{$MDS.FC.CRC.MAX}` | `5` | CRC errors per poll, context = ifName |
| `{$MDS.FC.ITW.MAX}` | `5` | Invalid transmission words per poll, context = ifName |
| `{$MDS.FC.LINK.LOSS.MAX}` | `3` | Link failures + sync + signal losses per poll, context = ifName |
| `{$MDS.FC.CREDIT.LOSS.MAX}` | `0` | Credit loss recoveries per poll, context = ifName |
| `{$MDS.FC.TIMEOUT.DISCARDS.MAX}` | `50` | Timeout discards per poll, context = ifName |
| `{$MDS.FC.TXWAIT.MAX}` | `10` | TxWait (% of the poll interval), context = ifName |
| `{$MDS.TEMP.WARN}` / `{$MDS.TEMP.CRIT}` | `60` / `75` | Fallback temperature thresholds (°C) for a sensor without switch thresholds |
| `{$MDS.LICENSE.GRACE.MIN}` | `7d` | Grace period left below which the license trigger becomes HIGH |
| `{$MDS.CONFIG.UNSAVED.MAX}` | `1h` | Tolerated age of an unsaved configuration change |
| `{$MDS.ZONE.PENDING.MAX}` | `1h` | Tolerated time with zoning changes not activated |
| `{$MDS.CORE.HOLD}` | `24h` | How long the core file problem stays open |
| `{$MDS.TRAP.EVENT.HOLD}` | `1h` | How long a trap problem stays open |
| `{$ICMP_LOSS_WARN}` | `20` | ICMP loss (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | ICMP response time (s) |
| `{$SNMP.TIMEOUT}` | `5m` | Window of *No SNMP data collection* |

## 3.2 Switches

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$IFCONTROL}` | `1` | `{$IFCONTROL:"<ifName>"}=0` silences *Link down* / *Port-channel down* |
| `{$MDS.XCVR.CONTROL}` | `1` | `{$MDS.XCVR.CONTROL:"<ifName>"}=0` silences the DOM triggers of a port |
| `{$MDS.VSAN.CONTROL}` | `1` | `{$MDS.VSAN.CONTROL:"<vsan id>"}=0` silences *VSAN is down* |
| `{$MDS.DEFZONE.CONTROL}` | `1` | `{$MDS.DEFZONE.CONTROL:"<vsan id>"}=0` allows a permit default zone |

## 3.3 Discovery filters

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$MDS.FCIF.NAME.MATCHES}` / `…NOT_MATCHES` | `^fc[0-9]+/[0-9]+$` / `CHANGE_IF_NEEDED` | FC ports (also used by the transceiver rule) |
| `{$MDS.FCIF.ALIAS.MATCHES}` / `…NOT_MATCHES` | `.*` / `CHANGE_IF_NEEDED` | Port description (`switchport description`) |
| `{$MDS.FCIF.ADMINSTATUS.NOT_MATCHES}` | `^2$` | Skip admin-down ports and port-channels |
| `{$MDS.PC.NAME.MATCHES}` | `^(san-)?port-channel ?[0-9]+$` | Port-channels |
| `{$MDS.MGMT.NAME.MATCHES}` | `^mgmt[0-9]+$` | Management port |
| `{$MDS.VSAN.NAME.MATCHES}` / `…NOT_MATCHES` | `.*` / `CHANGE_IF_NEEDED` | VSAN name |
| `{$MDS.VSAN.ID.NOT_MATCHES}` | `^4094$` | Exclude VSAN ids (4094 = isolated VSAN) |
| `{$MDS.VSAN.ADMIN.NOT_MATCHES}` | `^2$` | Skip suspended VSANs |

To monitor the admin-down ports as well, set `{$MDS.FCIF.ADMINSTATUS.NOT_MATCHES}` to `CHANGE_IF_NEEDED`; *Link down* still ignores them until they come up.

---

# 4. Checking the switch

```sh
snmpwalk -v2c -c <community> <switch> 1.3.6.1.2.1.1.2.0                 # sysObjectID ...12.3.1.3.1491
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.305.1.1           # CPU, memory, cseSysUpTime
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.289.1.1.2.1.7     # fcIfOperStatusCause per port
snmpwalk -v2c -c <community> <switch> 1.3.6.1.2.1.31.1.1.1.15           # ifHighSpeed (16000 or 12800 on a 16G port?)
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.91.1.1.1.1.1      # entSensorType: chassis + transceiver sensors?
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.91.1.2.1.1        # entSensorThresholdTable
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.43.1.1            # ccmHistoryRunningLastChanged / LastSaved
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.369.1.3.4.1.2     # clmLicenseFlag encoding
```

---

# 5. Not covered

- **Per-flow and per-initiator/target metrics** (SAN Analytics, `show analytics`): not in SNMP, use Cisco Nexus Dashboard Fabric Controller / NDFC or the analytics streaming telemetry.
- **Zoning content** (zones and members): only the active zone set name, the default zone policy and the pending-changes flag are monitored.
- **FCIP, iSCSI, FICON, SME, DMM**: not supported by the 9148S hardware (FCIP needs a 9250i/9220i). **IVR, FSPF routes, port security databases**: not polled; FSPF neighbor changes and port security violations arrive as traps (1.13).
- **Supervisor redundancy** (CISCO-RF-MIB): the 9148S has a single integrated supervisor.
- **RxWait, per-port state change counter, peer WWN**: added to CISCO-FC-FE-MIB after the MDS capability statement; not used until verified on the switch.
