# Brocade G620 by SNMPv3 — Zabbix 7.0

Import file: `template_fiber-channel_switch-brocade_G620_snmpv3.yaml`

Monitors a Brocade G620 (Gen 6, 32GFC) Fibre Channel switch over SNMP. Adapted from the Zabbix Brocade FC template by way of the *Brocade 6505 by SNMPv3* template, with its own name and UUIDs so it can live alongside both — but **do not link more than one of them to the same host**, the item keys collide.

> **Dell Connectrix DS-6620B:** Dell sells the Brocade G620 under its own brand as the **Dell Connectrix DS-6620B** (OEM). It is the same switch running Fabric OS, so this template can also be used to monitor a Dell Connectrix DS-6620B.

MIBs used: **SW-MIB**, **FCMGMT-MIB (FA-MIB)**, **FIBRE-CHANNEL-FE-MIB**, **IF-MIB**, **SNMPv2-MIB**, **HOST-RESOURCES-MIB**.

The Brocade and Fibre Channel MIB files — SW-MIB, FCMGMT-MIB, FIBRE-CHANNEL-FE-MIB and the Brocade-REG-MIB / Brocade-TC modules they import — are in [files/brocade/](files/brocade/); the standard MIBs ship with Net-SNMP.

The SNMP version and credentials belong to the **host interface**, not to the template. The SNMP trap item needs a trap receiver configured separately on the server or proxy.

**OIDs verified with `snmpwalk` against a Dell Connectrix DS-6620B (Brocade G620, `switchType 183`, `sysObjectID` `1.3.6.1.4.1.1588.2.1.1.1.183`) running Fabric OS v9.0.0a.** Derived from the Brocade 6505 template, which was tested against a Brocade 6505 running Fabric OS 8.0.2c, with Zabbix server 7.0.29.

The buffer credit items added in template version `7.0-2` come from the Brocade Fabric OS MIB Reference and **have not been read from a live switch yet** — see section 1.3.

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

## 1.3 `FC port traffic discovery` — Fibre Channel bandwidth and buffer credit

Source: FCMGMT-MIB `connUnitPortStatTable` (`1.3.6.1.3.94.4.5.1`) and `connUnitPortTable`, SW-MIB `swConnUnitPortStatExtentionTable` (`1.3.6.1.4.1.1588.2.1.1.1.27.1`) and FIBRE-CHANNEL-FE-MIB (`1.3.6.1.2.1.75`). Discovery interval `1h`.

| Item | OID | Units | Interval |
| --- | --- | --- | --- |
| Bits received | `1.3.6.1.3.94.4.5.1.7` `connUnitPortStatCountRxElements` | bps | 1m |
| Bits sent | `1.3.6.1.3.94.4.5.1.6` `connUnitPortStatCountTxElements` | bps | 1m |
| Bits received and sent | calculated: Bits received + Bits sent | bps | 1m |
| Speed | `1.3.6.1.3.94.1.10.1.15` `connUnitPortSpeed` | bps | 5m |
| Time at zero transmit BB credit | `1.3.6.1.3.94.4.5.1.8` `connUnitPortStatCountBBCreditZero` | % | 1m |
| Class 3 frames discarded on transmit timeout | `1.3.6.1.4.1.1588.2.1.1.1.27.1.27` `swConnUnitC3DiscardDueToTXTimeout` | /s | 1m |
| Link resets received / sent | `1.3.6.1.3.94.4.5.1.33` / `.34` `connUnitPortStatCountRxLinkResets` / `TxLinkResets` | /s | 1m |
| BB credit, receive buffers allocated | `1.3.6.1.2.1.75.1.1.5.1.5` `fcFxPortBbCredit` | | 1h |
| BB credit, receive buffers available | `1.3.6.1.2.1.75.1.2.1.1.2` `fcFxPortBbCreditAvailable` | | 1m |

The counters are **64-bit octet counters** returned as an 8-byte OCTET STRING (`00 04 34 14 10 A2 BF E0`), which makes them readable over SNMPv1 as well — unlike the `Counter64` objects of IF-MIB. Each item converts the hex dump to a number in JavaScript, then applies `Change per second`, then `×8`.

This table is indexed by a **16-byte switch WWN followed by the port index**, which has nothing in common with `swFCPortIndex`, so Zabbix cannot combine it into a single discovery rule with the SW-MIB one. The last component of the index equals `swFCPortIndex`, so `{#FCPORTNUM}` is the Fabric OS port number. Both FC rules tag their items `port: <port number>` so they can be filtered together.

The rule also reads `connUnitPortName` (`1.3.6.1.3.94.1.10.1.17`). If a port has a name/description configured on the switch, it is appended to the discovered item, graph and problem names; for example, port `4` named `ESXi-01 HBA1` is shown as `FC port 4 ESXi-01 HBA1`. An unnamed port keeps the number-only label.

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

### Buffer credit

Fibre Channel sends a frame only against a buffer-to-buffer (BB) credit: the receiver grants a number of buffers at login and returns one `R_RDY` for every frame it has drained. A device that returns credits too slowly — a **slow drain device** — makes the switch hold its frames, and the latency spreads to every flow that shares the path.

- **Time at zero transmit BB credit** is the main indicator. Fabric OS maps `connUnitPortStatCountBBCreditZero` to `tim_txcrd_z` of `portstatsshow`, which goes up by one for every **2.5 µs** the port has a frame queued and no transmit credit. The item takes the per-second rate and multiplies it by `0.00025` (2.5 µs × 100) to give the **percentage of time** the port was stalled: 100% is 400 000 increments per second. A few percent on a busy port is normal; a port that stays high has a slow device or a congested ISL behind it.
- **Class 3 frames discarded on transmit timeout** counts frames that waited for credit on this port longer than the hold time and were dropped (`er_tx_c3_timeout`). That is real frame loss: the I/O behind it fails with a timeout on the host. Unlike *Class 3 frames discarded* of the SW-MIB rule, it leaves out frames dropped on the receive side or for an unreachable destination.
- **Link resets received / sent**: a link reset restores the credit state of a link. Resets also happen when the link comes up, but repeated resets on a link that stays up point at lost credits.
- **BB credit, receive buffers allocated / available** come from FIBRE-CHANNEL-FE-MIB: how many credits the switch grants the attached device (8 by default on an F_Port) and how many are free at the moment of the poll. *Available* is a snapshot of a state that changes every few microseconds, so only a value that stays at 0 poll after poll means something: the switch cannot drain what the port receives.

The *Transmit credit shortage* item of the SW-MIB rule (`swFCPortNoTxCredits`) is unchanged.

`swConnUnitPortStatExtentionTable` augments `connUnitPortStatTable`, so it shares its index. FIBRE-CHANNEL-FE-MIB is indexed by `fcFeModuleIndex.fcFxPortIndex` instead: the rule builds `{#FXPORTINDEX}` = `1.<port number + 1>`, which assumes a single module, as on any fixed-port switch. If the two FE-MIB items turn unsupported, run `snmpconfig --show mibCapability` on the switch and enable FE-MIB.

Fabric OS answers a statistic of `connUnitPortStatTable` it does not support with only the high-order bit set (`80 00 00 00 00 00 00 00`). The new counter items turn that into *not supported* instead of a false value.

> **Not verified against a live switch.** The `snmpwalk` of the DS-6620B used to build this template did not cover these objects. They were built from the *Brocade Fabric OS MIB Reference Manual, 9.0.x* and have not been read from a G620 yet. Before relying on them, check that the switch answers these OIDs, and compare *Time at zero transmit BB credit* with `tim_txcrd_z` of `portstatsshow <port>` over the same minute:
>
> ```
> snmpwalk <SNMPv3 options> <switch> 1.3.6.1.3.94.4.5.1.8
> snmpwalk <SNMPv3 options> <switch> 1.3.6.1.4.1.1588.2.1.1.1.27.1.27
> snmpwalk <SNMPv3 options> <switch> 1.3.6.1.2.1.75.1.1.5.1.5
> ```

### Graphs and dashboard

Each port gets a **Buffer credit** graph (time at zero transmit credit on the left axis; transmit-timeout discards and link resets on the right). The template dashboard has a new **FC ports** page with the bandwidth and buffer credit graphs of every discovered port.

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
| Frames dropped on transmit timeout | AVERAGE | ✓ | | FC port traffic discovery |
| High time at zero transmit BB credit | WARNING | ✓ | Frames dropped on transmit timeout | FC port traffic discovery |

**Port is not online** fires on a **state change**: only when the port leaves `online(1)` after having been online, so a port that was never in use raises nothing. Silence individual ports with `{$FC.PORTCONTROL:"<port label>"}=0`.

**High bandwidth usage** in the traffic rule compares against `Speed × {$FC.SPEED.PAYLOAD.RATIO}`, not against Speed itself. The two traffic items count frame octets while `connUnitPortSpeed` reports the raw signalling on the wire; multiplying by `0.8` gives the throughput figure the Fibre Channel standard publishes (16GFC = 1600 MB/s = 12.8 Gbps, 32GFC = 3200 MB/s = 25.6 Gbps). This trigger has no dependency on the port state trigger, because that one belongs to the other discovery rule and Zabbix only allows dependencies within the same rule.

The trigger expression starts with `last(Bits received and sent)>=0`, which is always true once that item has data. It only makes the sum the first item of the trigger. Zabbix resolves `{ITEM.VALUE}`, `{ITEM.LASTVALUE}` and `{ITEM.KEY}` without an index to the first item of the expression, so an action message now shows the traffic of both directions instead of the received traffic alone. The trigger still fires when either direction alone crosses the threshold, and its operational data still lists each direction.

**Frames dropped on transmit timeout** fires when every poll of the last 5 minutes shows Class 3 frames dropped on transmit timeout above `{$FC.C3TXTO.WARN}` — `0` by default, so continuous drops — and recovers once a 5-minute window stays at or below it. **High time at zero transmit BB credit** fires when the port stays above `{$FC.BBCREDIT.ZERO.WARN}` % (default `10`) for 5 minutes and recovers below 80% of it. It depends on the drop trigger, so a port that is already losing frames raises one problem, not two. Both take the port number as context, for example `{$FC.BBCREDIT.ZERO.WARN:"12"}=30` for an ISL where some credit starvation is expected.

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
| `{$FC.BBCREDIT.ZERO.WARN}` | `10` | Threshold of *Time at zero transmit BB credit*, in % of time, held for 5 minutes |
| `{$FC.C3TXTO.WARN}` | `0` | Threshold of Class 3 discards on transmit timeout (frames/second); the trigger needs every poll of 5 minutes above it |

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
