# Brocade G620 by SNMPv3 — Zabbix 7.0

Import file: `template_fiber-channel_switch-brocade_G620_snmpv3.yaml`

Monitors a Brocade G620 (Gen 6, 32GFC) Fibre Channel switch over SNMP. Adapted from the Zabbix Brocade FC template by way of the *Brocade 6505 by SNMPv3* template, with its own name and UUIDs so it can live alongside both — but **do not link more than one of them to the same host**, the item keys collide.

> **Dell Connectrix DS-6620B:** Dell sells the Brocade G620 under its own brand as the **Dell Connectrix DS-6620B** (OEM). It is the same switch running Fabric OS, so this template can also be used to monitor a Dell Connectrix DS-6620B.

MIBs used: **SW-MIB**, **FCMGMT-MIB (FA-MIB)**, **IF-MIB**, **SNMPv2-MIB**, **HOST-RESOURCES-MIB**.

The SNMP version and credentials belong to the **host interface**, not to the template. The SNMP trap item needs a trap receiver configured separately on the server or proxy.

**OIDs verified with `snmpwalk` against a Dell Connectrix DS-6620B (Brocade G620, `switchType 183`, `sysObjectID` `1.3.6.1.4.1.1588.2.1.1.1.183`) running Fabric OS v9.0.0a.** Derived from the Brocade 6505 template, which was tested against a Brocade 6505 running Fabric OS 8.0.2c, with Zabbix server 7.0.29.

*Vietnamese version: [files/README_vi.md](files/README_vi.md)*

---

# 1. Monitored items

## 1.1 Template-level items

| Item | Key | Source | Units | Interval |
| --- | --- | --- | --- | --- |
| ICMP ping | `icmpping` | simple check | | 1m |
| ICMP loss | `icmppingloss` | simple check | % | 1m |
| ICMP response time | `icmppingsec` | simple check | s | 1m |
| SNMP agent availability | `zabbix[host,snmp,available]` | internal | | 1m |
| SNMP traps (fallback) | `snmptrap.fallback` | snmp trap | | — |
| CPU utilization | `system.cpu.util[swCpuUsage.0]` | `1.3.6.1.4.1.1588.2.1.1.1.26.1.0` | % | 1m |
| Memory utilization | `vm.memory.util[swMemUsage.0]` | `1.3.6.1.4.1.1588.2.1.1.1.26.6.0` | % | 1m |
| Overall system health status | `system.status[swOperStatus.0]` | `1.3.6.1.4.1.1588.2.1.1.1.1.7.0` | | 30s |
| Firmware version | `system.hw.firmware` | `1.3.6.1.4.1.1588.2.1.1.1.1.6.0` | | 1h |
| Factory serial number | `system.hw.serialnumber` | `1.3.6.1.4.1.1588.2.1.1.1.1.10.0` | | 1h |
| Uptime (network) | `system.net.uptime[sysUpTime.0]` | `1.3.6.1.2.1.1.3.0` | uptime | 30s |
| System name | `system.name` | `1.3.6.1.2.1.1.5.0` | | 15m |
| System description | `system.descr[sysDescr.0]` | `1.3.6.1.2.1.1.1.0` | | 15m |
| System location | `system.location[sysLocation.0]` | `1.3.6.1.2.1.1.6.0` | | 15m |
| System contact details | `system.contact[sysContact.0]` | `1.3.6.1.2.1.1.4.0` | | 15m |
| System object ID | `system.objectid[sysObjectID.0]` | `1.3.6.1.2.1.1.2.0` | | 15m |
| ~~Uptime (hardware)~~ | `system.hw.uptime[hrSystemUptime.0]` | `1.3.6.1.2.1.25.1.1.0` | uptime | **Disabled** |

**Uptime (hardware)** is disabled by default: Fabric OS does not implement HOST-RESOURCES-MIB and the switch answers `noSuchName`. Enable it if your firmware does answer that OID — it is the better source, because it counts from boot, while `sysUpTime` counts from the last start of the SNMP agent.

## 1.2 `FC port discovery` — Fibre Channel port state and errors

Source: SW-MIB `swFCPortTable` (`1.3.6.1.4.1.1588.2.1.1.1.6.2.1`). Discovery interval `1h`.
`{#SNMPINDEX}` is `swFCPortIndex`, which starts at 1, while the Fabric OS port number starts at 0 → index 1 is port 0.

| Item | OID column | Units | Interval |
| --- | --- | --- | --- |
| Frames received | `.14` `swFCPortRxFrames` | fps | 1m |
| Frames sent | `.13` `swFCPortTxFrames` | fps | 1m |
| CRC errors | `.22` `swFCPortRxCrcs` | /s | 1m |
| Encoding errors outside of frames | `.26` `swFCPortRxEncOutFrs` | /s | 1m |
| Class 3 frames discarded | `.28` `swFCPortC3Discards` | /s | 1m |
| Transmit credit shortage | `.20` `swFCPortNoTxCredits` | /s | 1m |
| Operational status | `.4` `swFCPortOpStatus` | | 1m |
| Physical state | `.3` `swFCPortPhyState` | | 3m |
| Port type | `.39` `swFCPortBrcdType` | | 5m |
| ~~Bits received~~ | `.12` `swFCPortRxWords` | bps | **Disabled** |
| ~~Bits sent~~ | `.11` `swFCPortTxWords` | bps | **Disabled** |
| ~~Speed~~ / ~~Speed, nominal bitrate~~ | `.35` `swFCPortSpeed` | | **Disabled** |

Fabric OS 8.x **removed** columns `11`, `12` and `35` from `swFCPortTable`. The G620 runs Fabric OS 8.x or later — on Fabric OS v9.0.0a the three columns are confirmed absent — so on this model leave those items disabled.

**Frames received/sent is a frame rate, not a bit rate** — an FC frame carries between 0 and 2112 bytes of payload, so it cannot be converted to bps. Real throughput comes from the next rule.

## 1.3 `FC port traffic discovery` — Fibre Channel bandwidth

Source: FCMGMT-MIB `connUnitPortStatTable` (`1.3.6.1.3.94.4.5.1`) and `connUnitPortTable`. Discovery interval `1h`.

| Item | OID | Units | Interval |
| --- | --- | --- | --- |
| Bits received | `1.3.6.1.3.94.4.5.1.7` `connUnitPortStatCountRxElements` | bps | 1m |
| Bits sent | `1.3.6.1.3.94.4.5.1.6` `connUnitPortStatCountTxElements` | bps | 1m |
| Speed | `1.3.6.1.3.94.1.10.1.15` `connUnitPortSpeed` | bps | 5m |

The counters are **64-bit octet counters** returned as an 8-byte OCTET STRING (`00 04 34 14 10 A2 BF E0`), which makes them readable over SNMPv1 as well — unlike the `Counter64` objects of IF-MIB. Each item converts the hex dump to a number in JavaScript, then applies `Change per second`, then `×8`.

This table is indexed by a **16-byte switch WWN followed by the port index**, which has nothing in common with `swFCPortIndex`, so Zabbix cannot combine it into a single discovery rule with the SW-MIB one. The last component of the index equals `swFCPortIndex`, so `{#FCPORTNUM}` is the Fabric OS port number. Both FC rules tag their items `port: <port number>` so they can be filtered together.

`connUnitPortSpeed` reports kilobytes per second; the item multiplies by `8000` to give the signalling rate the way Fibre Channel names it: `4000000` → **32 Gbps**, `2000000` → **16 Gbps**, matching the speed column of `switchshow`. On Fabric OS v9.0.0a an online port reports its negotiated speed (a port at N16 returns `2000000` next to N32 ports at `4000000`); a port without link reports the maximum, `4000000`.

`connUnitPortStatTable` **has no administrative status column**, so the rule also pulls `connUnitPortState` (`1.3.6.1.3.94.1.10.1.6`) from `connUnitPortTable`, which shares the same index, into `{#FCPORTSTATE}`. A G620 has 64 ports (48 SFP+ ports 0–47 and 4 QSFP ports carrying ports 48–63), usually with only part of them licensed through Ports on Demand.

FCMGMT-MIB describes `connUnitPortState` as the user selected state, but Fabric OS reports `offline(3)` for **every port that is not online**, and `swFCPortAdmStatus` behaves the same way. Values read from a DS-6620B on Fabric OS v9.0.0a:

| Port in `switchshow` | `connUnitPortState` | `swFCPortAdmStatus` | Discovered |
| --- | --- | --- | --- |
| `Online` | `online(2)` | `online(1)` | ✓ |
| `No_Light`, port enabled | `offline(3)` | `offline(2)` | — |
| `No_Module`, no QFLEX Ports on Demand license, `Disabled` | `offline(3)` | `offline(2)` | — |

So both FC rules discover the ports that are **online at discovery time**. A port brought online later — newly cabled, or licensed and enabled — is picked up by the next run, with no macro to change. `{$FC.TRAFFIC.PORT.NOT_MATCHES}` remains available to drop online ports by number.

### Ports that go down after discovery

A discovered port that loses its link drops out of the next discovery run. To keep watching it, both FC rules set **Disable lost resources = Never** and **Delete lost resources = after 30d**: its items keep polling, the *Port is not online* problem stays open until the port comes back, and only a port missing for 30 days is removed. Change this on the rules under **Data collection → Templates → Discovery rules → \<rule\>** if you want a different trade-off — **Never** for both keeps every port that was ever online.

## 1.4 `FAN Discovery` / `PSU Discovery` / `Temperature Discovery`

Source: SW-MIB `swSensorTable` (`1.3.6.1.4.1.1588.2.1.1.1.1.22.1`). Discovery interval `1h`.

| Rule | `swSensorType` | Items |
| --- | --- | --- |
| FAN Discovery | `fan(2)` | Fan speed (`.4`, rpm), Fan status (`.3`) |
| PSU Discovery | `power-supply(3)` | Power supply status (`.3`) |
| Temperature Discovery | `temperature(1)` | Temperature (`.4`, °C), Temperature status (`.3`) |

`swSensorTable` lists **every sensor slot the platform can have**, not only the populated ones. A switch with an empty fan or power supply bay still exposes a row for that bay, with `swSensorStatus` = `absent(6)`. All three rules pull `{#SENSOR_STATUS}` as well and drop the rows matching `{$SENSOR.STATUS.NOT_MATCHES}`.

A JavaScript preprocessing step trims leading and trailing whitespace from `{#SENSOR_INFO}`, because Fabric OS returns sensor names with a leading space (`" FAN #1"`).

On a DS-6620B with Fabric OS v9.0.0a the table holds 11 temperature sensors (`SLOT #0: TEMP #1` … `#11`), 2 fans and 2 power supplies.

## 1.5 `Network interfaces discovery` — management Ethernet port

Source: IF-MIB. Discovery interval `1h`. `{$NET.IF.IFTYPE.MATCHES}` defaults to `^6$`, so only Ethernet interfaces are picked up.

| Item | OID |
| --- | --- |
| Bits received / sent | `ifHCInOctets` / `ifHCOutOctets` (64-bit) |
| Inbound/Outbound packets with errors | `ifInErrors` / `ifOutErrors` |
| Inbound/Outbound packets discarded | `ifInDiscards` / `ifOutDiscards` |
| Speed | `ifHighSpeed` |
| Operational status | `ifOperStatus` |
| Interface type | `ifType` |

FC ports do **not** go through this rule. `ifHCInOctets` is a `Counter64`, a data type SNMPv1 does not have and therefore cannot return, and many Fabric OS releases do not implement `ifXTable` for FC ports at all. If yours does, set `{$NET.IF.IFTYPE.MATCHES}` to `^(6\|56)$`.

---

# 2. Alerting triggers

## 2.1 Availability and system

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| Unavailable by ICMP ping | HIGH | | |
| No SNMP data collection | WARNING | | Unavailable by ICMP ping |
| High ICMP ping loss | WARNING | | Unavailable by ICMP ping |
| High ICMP ping response time | WARNING | | High ICMP ping loss |
| System status is in critical state | HIGH | | |
| System status is in warning state | WARNING | | System status is in critical state |
| High CPU utilization | WARNING | | |
| High memory utilization | AVERAGE | | |
| Host has been restarted | WARNING | ✓ | No SNMP data collection |
| Firmware has changed | INFO | ✓ | |
| Device has been replaced | INFO | ✓ | |
| System name has changed | INFO | ✓ | |

**Host has been restarted** reads `sysUpTime` and carries an extra condition, `max(sysUpTime,15m) < {$UPTIME.WRAP.THRESHOLD}`. SNMP `TimeTicks` is an unsigned 32-bit counter of hundredths of a second: it runs out after **497 days** and starts again from zero with no reboot involved, and this condition suppresses that recurring false alert.

## 2.2 Fibre Channel ports

| Trigger | Severity | Manual close | Depends on | Rule |
| --- | --- | --- | --- | --- |
| Port is not online | AVERAGE | ✓ | | FC port discovery |
| High error rate | WARNING | ✓ | Port is not online | FC port discovery |
| Class 3 frames are being discarded | WARNING | ✓ | Port is not online | FC port discovery |
| ~~High bandwidth usage~~ (SW-MIB) | WARNING | ✓ | Port is not online | **Disabled** |
| High bandwidth usage | WARNING | ✓ | | FC port traffic discovery |

**Port is not online** fires on a **state change**: only when the port leaves `online(1)` after having been online, so a port that was never in use raises nothing. Silence individual ports with `{$FC.PORTCONTROL:"<port label>"}=0`.

**High bandwidth usage** in the traffic rule compares against `Speed × {$FC.SPEED.PAYLOAD.RATIO}`, not against Speed itself. The two traffic items count frame octets while `connUnitPortSpeed` reports the raw signalling on the wire; multiplying by `0.8` gives the throughput figure the Fibre Channel standard publishes (16GFC = 1600 MB/s = 12.8 Gbps, 32GFC = 3200 MB/s = 25.6 Gbps). This trigger has no dependency on the port state trigger, because that one belongs to the other discovery rule and Zabbix only allows dependencies within the same rule.

## 2.3 Fans, power supplies, temperature

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| Fan is in critical state | AVERAGE | ✓ | |
| Fan is not in normal state | INFO | ✓ | Fan is in critical state |
| Power supply is in critical state | AVERAGE | ✓ | |
| Power supply is not in normal state | INFO | ✓ | Power supply is in critical state |
| Temperature is above critical threshold | HIGH | | |
| Temperature is above warning threshold | WARNING | | Temperature is above critical threshold |
| Temperature is too low | AVERAGE | | |

**`is not in normal state`** fires on a **state change**, with its own recovery expression:

```
count(status,#1,"ne",{$FAN_OK_STATUS})=1 and (last(status,#1)<>last(status,#2))
recovery: count(status,#1,"eq",{$FAN_OK_STATUS})=1
```

A sensor simply sitting in an abnormal state raises nothing. When the state *moves* away from `nominal(4)` the problem is created and stays open until the sensor reports `nominal(4)` again, or until you close it manually.

| Scenario | Status sequence | INFO | AVERAGE |
| --- | --- | --- | --- |
| Empty slot, always absent | `6 6 6 6` | — | — |
| Running fan gets pulled | `4 4 6 6` | **fires** | — |
| Running fan fails | `4 4 2 2` | **fires** | **fires** |
| Failed fan gets replaced | `2 2 4 4` | recovers | recovers |
| Template linked to an already failed fan | `2 2 2 2` | — | **fires** |

**`is in critical state`** deliberately **stays state-based**: `faulty(2)` is always a real fault, never an empty slot, so it must alert even for hardware that was already faulty before the template was linked — the last row of the table.

A state-change expression needs **two samples** before it can be evaluated, so the trigger stays Unknown for one poll after the item is created.

If a sensor moves to `absent(6)`, the next discovery run filters it out and the item is deleted after the rule's `Delete lost resources` period — taking the problem with it. Set `Delete lost resources` to **Never** on the FAN/PSU/Temperature rules under **Data collection → Templates → Discovery rules → \<rule\> → LLD tab** if you want the alert to survive until it is dealt with.

## 2.4 Management Ethernet port

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| Link down | AVERAGE | ✓ | |
| High bandwidth usage | WARNING | ✓ | Link down |
| High error rate | WARNING | ✓ | Link down |
| Ethernet has changed to lower speed than it was before | INFO | ✓ | Link down |

---

# 3. Macros

## 3.1 Alerting thresholds

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$CPU.UTIL.CRIT}` | `90` | CPU threshold (%), 5-minute average |
| `{$MEMORY.UTIL.MAX}` | `90` | Memory threshold (%), 5-minute average |
| `{$TEMP_WARN}` / `{$TEMP_CRIT}` | `65` / `75` | Temperature thresholds in °C. Accepts the sensor name as context |
| `{$TEMP_CRIT_LOW}` | `5` | Abnormally low temperature threshold in °C |
| `{$ICMP_LOSS_WARN}` | `20` | ICMP packet loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | ICMP response time threshold (seconds) |
| `{$SNMP.TIMEOUT}` | `5m` | Time window of the SNMP availability trigger |
| `{$UPTIME.WRAP.THRESHOLD}` | `496d` | Uptime above which a drop to zero is read as the TimeTicks counter wrapping, not as a reboot |

## 3.2 Hardware state values

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$HEALTH_CRIT_STATUS}` | `4` | `swOperStatus` = faulty |
| `{$HEALTH_WARN_STATUS:"offline"}` | `2` | `swOperStatus` = offline |
| `{$HEALTH_WARN_STATUS:"testing"}` | `3` | `swOperStatus` = testing |
| `{$FAN_OK_STATUS}` / `{$PSU_OK_STATUS}` | `4` | `swSensorStatus` = nominal |
| `{$FAN_CRIT_STATUS}` / `{$PSU_CRIT_STATUS}` | `2` | `swSensorStatus` = faulty |
| `{$TEMP_WARN_STATUS}` | `5` | `swSensorStatus` = above max |
| `{$SENSOR.STATUS.NOT_MATCHES}` | `^(1\|6)$` | States that mean **no hardware behind the sensor row**: `unknown(1)` and `absent(6)`. The FAN/PSU/Temperature rules skip those rows. Set to `CHANGE_IF_NEEDED` to discover them anyway |

## 3.3 Fibre Channel ports

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$FC.PORT.ADMSTATUS.MATCHES}` | `^.*$` | Discovery filter on `swFCPortAdmStatus` |
| `{$FC.PORT.ADMSTATUS.NOT_MATCHES}` | `^2$` | Skip FC ports in `offline(2)` — on Fabric OS that is every port not online, including enabled ports with no light |
| `{$FC.PORT.NAME.MATCHES}` | `^.*$` | Discovery filter on the port label (`swFCPortSpecifier` + `swFCPortName`) |
| `{$FC.PORT.NAME.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Exclude ports by label |
| `{$FC.TRAFFIC.PORT.MATCHES}` | `^[0-9]+$` | Filter of the FA-MIB bandwidth rule, on the **port number** |
| `{$FC.TRAFFIC.PORT.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Exclude online ports from the bandwidth rule by number, e.g. `^(4[89]\|5[0-9]\|6[0-3])$` to drop ports 48–63 (the QSFP ports of a G620) |
| `{$FC.TRAFFIC.PORT.STATE.MATCHES}` | `^.*$` | Filter of the FA-MIB bandwidth rule on `connUnitPortState` |
| `{$FC.TRAFFIC.PORT.STATE.NOT_MATCHES}` | `^3$` | Skip ports in `offline(3)` — on Fabric OS that is every port not online. Set to `CHANGE_IF_NEEDED` to discover every port |
| `{$FC.PORTCONTROL}` | `1` | `{$FC.PORTCONTROL:"<port label>"}=0` disables the *Port is not online* trigger for an unused port |
| `{$FC.IF.UTIL.MAX}` | `90` | FC port bandwidth threshold (%) |
| `{$FC.SPEED.PAYLOAD.RATIO}` | `0.8` | Fraction of the signalling rate that carries frame data, used as the 100% reference of the bandwidth trigger. `0.8` comes from 8b/10b encoding and is exact for 1/2/4/8GFC; from 16GFC on the encoding is 64b/66b, so the real ceiling is a few percent higher and a saturated port can read above 100% |
| `{$FC.IF.ERRORS.WARN}` | `2` | CRC and encoding error threshold (errors/second) |
| `{$FC.C3DISCARD.WARN}` | `1` | Class 3 discard threshold (frames/second) |

Every FC macro accepts a context: the **port label** for the SW-MIB rule (`{$FC.IF.ERRORS.WARN:"0 port0"}`), the **port number** for the FA-MIB rule (`{$FC.SPEED.PAYLOAD.RATIO:"2"}`).

## 3.4 Management Ethernet port

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$NET.IF.IFTYPE.MATCHES}` | `^6$` | Discover Ethernet interfaces only. Set to `^(6\|56)$` to add FC ports to IF-MIB discovery |
| `{$NET.IF.IFTYPE.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Exclude by `ifType` |
| `{$NET.IF.IFADMINSTATUS.MATCHES}` | `^.*` | Filter on `ifAdminStatus` |
| `{$NET.IF.IFADMINSTATUS.NOT_MATCHES}` | `^2$` | Skip `ifAdminStatus` down(2) |
| `{$NET.IF.IFOPERSTATUS.MATCHES}` | `^.*$` | Filter on `ifOperStatus` |
| `{$NET.IF.IFOPERSTATUS.NOT_MATCHES}` | `^6$` | Skip `notPresent(6)` |
| `{$NET.IF.IFNAME.MATCHES}` | `^.*$` | Filter on `ifName` |
| `{$NET.IF.IFNAME.NOT_MATCHES}` | loopbacks, nulls, docker… | Filter out virtual interfaces |
| `{$NET.IF.IFALIAS.MATCHES}` | `.*` | Filter on `ifAlias` |
| `{$NET.IF.IFALIAS.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Exclude by `ifAlias` |
| `{$NET.IF.IFDESCR.MATCHES}` | `.*` | Filter on `ifDescr` |
| `{$NET.IF.IFDESCR.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Exclude by `ifDescr` |
| `{$IFCONTROL}` | `1` | `{$IFCONTROL:"<interface name>"}=0` disables the *Link down* trigger |
| `{$IF.UTIL.MAX}` | `90` | Ethernet interface bandwidth threshold (%) |
| `{$IF.ERRORS.WARN}` | `2` | Packet error threshold (packets/second) |
