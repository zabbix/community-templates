# ADVA FSP 150-XG108 Monitoring Template for Zabbix 7.4

[![Zabbix Version](https://img.shields.io/badge/Zabbix-7.4-red.svg)](https://www.zabbix.com/)
[![Protocol](https://img.shields.io/badge/SNMP-v2c%20%2B%20traps-blue.svg)](https://www.zabbix.com/documentation/7.4/en/manual/config/items/itemtypes/snmp)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

**Author:** `://echo@dla.network [oZark oRChes✝ra✝'d]` | [![GitHub](https://img.shields.io/badge/GitHub-DLA--neTWorK-blue?logo=github)](https://github.com/DLA-neTWorK)

**Version:** 1.0.0

## Overview

Standalone monitoring template for the **ADVA FSP 150-XG108** carrier Ethernet demarcation device, built for Zabbix 7.4. It combines SNMPv2c polling with SNMP trap reception to cover device reachability, chassis card health, physical service-port state and traffic, and dying-gasp/power-failure notifications.

The template is **self-contained**: ICMP availability, standard SNMP system polling, SNMP availability, trap collection, triggers, dependencies, macros, value maps, and dashboards are all included. It does not link `Generic SNMP` or any other baseline template.

Verified against a device reporting sysObjectID `1.3.6.1.4.1.2544.1.12.1.1.50`.

### Key Features

- ✅ **Self-contained baseline** - ICMP, SNMP system tree, and SNMP availability included; no template linkage required
- ✅ **Chassis card discovery** - Per-card administrative state, operational state, temperature, voltage, and dying-gasp configuration from the ADVA enterprise MIB
- ✅ **Filtered service-port discovery** - Macro-driven IF-MIB/IF-X-MIB discovery scoped to real customer/network ports, not DCN or placeholder interfaces
- ✅ **64-bit traffic counters** - `ifHCInOctets`/`ifHCOutOctets` with per-interface error, discard, speed, and utilization telemetry
- ✅ **Dying-gasp trap capture** - Text-matched power-event notifications plus a fallback stream for unmatched traps
- ✅ **Conservative alerting posture** - Only reachability and SNMP-collection triggers are enabled by default; device-specific triggers ship disabled for operator review
- ✅ **Dependency-aware triggers** - SNMP and interface alarms are suppressed by the ICMP root-cause trigger
- ✅ **Ready-made dashboards** - Two template dashboards covering general health and interface/card statistics

---

## Monitoring Capabilities

### Device-level polling

| Metric | Item key | Source OID |
|--------|----------|------------|
| ICMP ping | `icmpping` | Simple check |
| ICMP loss | `icmppingloss` | Simple check |
| ICMP response time | `icmppingsec` | Simple check |
| System description | `system.descr[sysDescr.0]` | `1.3.6.1.2.1.1.1.0` |
| System name | `system.name` | `1.3.6.1.2.1.1.5.0` |
| System object ID | `system.objectid[sysObjectID.0]` | `1.3.6.1.2.1.1.2.0` |
| Uptime | `system.net.uptime[sysUpTime.0]` | `1.3.6.1.2.1.1.3.0` |
| SNMP agent availability | `zabbix[host,snmp,available]` | Zabbix internal |
| Dying gasp / power failure trap | `snmptrap["(?i)(dying[ -]?gasp\|power[ -]?(fail\|loss))"]` | SNMP trap |
| SNMP traps (fallback) | `snmptrap.fallback` | SNMP trap |

### Physical service interface discovery

LLD rule `adva.net.if.discovery` (every 1h) walks IF-MIB/IF-X-MIB and creates **8 item prototypes** plus a traffic graph per discovered port:

| Metric | Item key | OID |
|--------|----------|-----|
| Administrative status | `adva.net.if.admin[ifAdminStatus.{#SNMPINDEX}]` | `1.3.6.1.2.1.2.2.1.7` |
| Operational status | `adva.net.if.oper[ifOperStatus.{#SNMPINDEX}]` | `1.3.6.1.2.1.2.2.1.8` |
| Bits received | `adva.net.if.in[ifHCInOctets.{#SNMPINDEX}]` | `1.3.6.1.2.1.31.1.1.1.6` |
| Bits sent | `adva.net.if.out[ifHCOutOctets.{#SNMPINDEX}]` | `1.3.6.1.2.1.31.1.1.1.10` |
| Inbound errors | `adva.net.if.in.errors[ifInErrors.{#SNMPINDEX}]` | `1.3.6.1.2.1.2.2.1.14` |
| Inbound discards | `adva.net.if.in.discards[ifInDiscards.{#SNMPINDEX}]` | `1.3.6.1.2.1.2.2.1.13` |
| Outbound discards | `adva.net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]` | `1.3.6.1.2.1.2.2.1.19` |
| Speed | `adva.net.if.speed[ifHighSpeed.{#SNMPINDEX}]` | `1.3.6.1.2.1.31.1.1.1.15` |

Discovery defaults select administratively up Ethernet (`ifType` 6) ports whose name and description match ADVA NETWORK/ACCESS service-port patterns. Operationally down ports are deliberately retained so link failures stay visible.

### XG108 card discovery

LLD rule `adva.xg108.card.discovery` (every 1h) walks the ADVA enterprise entity table `1.3.6.1.4.1.2544.1.12.3.1.106.1` and creates **5 item prototypes** plus temperature and voltage graphs per card:

| Metric | Item key | OID suffix |
|--------|----------|------------|
| Administrative state | `adva.xg108.card.admin_state[{#SNMPINDEX}]` | `.2` |
| Operational state | `adva.xg108.card.operational_state[{#SNMPINDEX}]` | `.3` |
| Voltage | `adva.xg108.card.voltage[{#SNMPINDEX}]` | `.5` |
| Temperature | `adva.xg108.card.temperature[{#SNMPINDEX}]` | `.6` |
| Dying-gasp notification state | `adva.xg108.dying_gasp.enabled[{#SNMPINDEX}]` | `.7` |

Card rows are discovered dynamically rather than assuming a fixed network-element, shelf, or slot suffix, so the template follows XG108 variants and inventory layouts.

---

## Trigger Summary

**10 triggers total. 4 are enabled by default; 6 ship disabled** so the template is safe to link before device-specific behaviour has been proven in your environment.

### Enabled by default

| Severity | Trigger | Recovery | Dependency |
|----------|---------|----------|------------|
| **HIGH** | `ADVA CPE: Unavailable by ICMP` | 3 successful ICMP checks | Root cause |
| **WARNING** | `ADVA CPE: High ICMP packet loss` | 5-minute loss below threshold | ICMP unavailable |
| **WARNING** | `ADVA CPE: High ICMP response time` | 5-minute average below threshold | ICMP loss, ICMP unavailable |
| **WARNING** | `ADVA CPE: No SNMP data collection` | SNMP polling resumes | ICMP unavailable |

### Disabled by default — enable after review

| Severity | Trigger | Why it ships disabled |
|----------|---------|-----------------------|
| **DISASTER** | `ADVA CPE: Dying gasp or power failure notification received` | Enable once the notification OID and trap routing are proven in your environment |
| **HIGH** | `ADVA CPE: Interface {#IFNAME} is down` | Enable after confirming discovery scope matches your service ports |
| **HIGH** | `ADVA CPE: XG108 card {#ADVA.CARD.ENTITYINDEX} is in outage state` | Evaluates only when administrative state is `in-service(1)` |
| **WARNING** | `ADVA CPE: Device has restarted` | Enable when uptime-based alerting is wanted |
| **WARNING** | `ADVA CPE: Interface {#IFNAME} inbound error rate is high` | Tune `{$IF.ERRORS.WARN}` to the circuit first |
| **WARNING** | `ADVA CPE: Interface {#IFNAME} utilization is high` | Tune `{$IF.UTIL.MAX}` to the service profile first |

The dying-gasp trigger is intentionally **independent of ICMP**, because the trap is often the last evidence received before polling stops. It recovers after ten minutes without another matching trap and allows manual close.

---

## Installation Guide

### Prerequisites

- ✅ Zabbix server/proxy and frontend **7.4** or later
- ✅ SNMPv2c enabled on the FSP 150-XG108
- ✅ One SNMP host interface reaching the device on **UDP 161**
- ✅ A working Zabbix SNMP trap receiver on **UDP 162**, with the device configured to send notifications to it
- ✅ ICMP echo permitted from the Zabbix server/proxy (`fping`)

### Step 1: Import the template

1. Download `template_adva_fsp150_xg108_by_snmp.yaml`
2. Zabbix web interface -> **Data collection** -> **Templates** -> **Import**
3. Select the YAML file and complete import
4. Verify template name: **ADVA FSP 150-XG108 by SNMP** in group **Templates/Network devices**

### Step 2: Create the host

1. **Data collection** -> **Hosts** -> **Create host**
2. **Interfaces:** add an **SNMP** interface with the device management address on UDP 161, SNMP version **v2c**
3. **Templates:** link `ADVA FSP 150-XG108 by SNMP`

### Step 3: Set the SNMP community

The template deliberately **does not define a community value**. Set `{$SNMP_COMMUNITY}` as a **secret** host or host-group macro on your own installation.

> Never commit a real SNMP community to a template export, a README, or an issue report.

### Step 4: Configure trap forwarding

1. Point the device's SNMPv2c notification target at the Zabbix trap receiver on UDP 162
2. Confirm the receiver is listening and Zabbix trap processing is enabled
3. Verify firewall policy permits UDP 162 from the device management network

### Step 5: Validate and enable

1. **Monitoring** -> **Latest data**: confirm ICMP and SNMP system items populate
2. Confirm both discovery rules create the expected ports and cards
3. Confirm unmatched notifications land in `snmptrap.fallback`
4. Review thresholds, then enable the disabled triggers you want

---

## Zabbix Configuration

### Discovery filter macros

| Macro | Default | Purpose |
|-------|---------|---------|
| `{$ADVA.IFADMINSTATUS.MATCHES}` | `^1$` | Discover administratively up ports |
| `{$ADVA.IFADMINSTATUS.NOT_MATCHES}` | `^$` | Optional admin-state exclusion |
| `{$ADVA.IFDESCR.MATCHES}` | `^ETHERNET (NETWORK\|ACCESS) PORT$` | ADVA service-port descriptions |
| `{$ADVA.IFDESCR.NOT_MATCHES}` | `^$` | Optional description exclusion |
| `{$ADVA.IFNAME.MATCHES}` | `^(NETWORK\|ACCESS) PORT-` | Physical service-port names |
| `{$ADVA.IFNAME.NOT_MATCHES}` | `^$` | Optional name exclusion |
| `{$ADVA.IFOPERSTATUS.MATCHES}` | `^.*$` | Keep down ports discoverable |
| `{$ADVA.IFOPERSTATUS.NOT_MATCHES}` | `^6$` | Exclude `notPresent(6)` |
| `{$ADVA.IFTYPE.MATCHES}` | `^6$` | Ethernet CSMA/CD only |
| `{$ADVA.IFTYPE.NOT_MATCHES}` | `^$` | Optional type exclusion |

### Threshold macros

| Macro | Default | Purpose |
|-------|---------|---------|
| `{$ICMP_LOSS_WARN}` | `20` | Sustained ICMP loss warning, percent over 5 minutes |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | 5-minute average response-time warning, seconds |
| `{$IF.ERRORS.WARN}` | `1` | Inbound error rate warning, errors/second over 5 minutes |
| `{$IF.UTIL.MAX}` | `90` | Interface utilization warning, percent over 15 minutes |
| `{$IFCONTROL}` | `1` | Set to `0` (with interface context) to except a port from link alerting |
| `{$SNMP.TIMEOUT}` | `5m` | How long SNMP must be unavailable before alerting |

`{$IF.ERRORS.WARN}`, `{$IF.UTIL.MAX}`, and `{$IFCONTROL}` accept a **macro context** of `{#IFNAME}` for per-interface exceptions, for example `{$IFCONTROL:"NETWORK PORT-1-1-1-1"}`.

### Value maps

`ADVA administrative state`, `ADVA operational state`, `IF-MIB interface status`, `Service state`, `SNMP availability`, and `SNMP TruthValue`.

### Dashboards

| Dashboard | Pages | Content |
|-----------|-------|---------|
| `ADVA CPE: General` | 1 | Availability, ICMP loss, response time, device identity |
| `ADVA CPE: Statistics` | 2 | Interface traffic/errors and card temperature/voltage |

### Object counts

| Object type | Count |
|-------------|-------|
| Items | 10 |
| Discovery rules | 2 |
| Item prototypes | 13 |
| Graph prototypes | 3 |
| Triggers and trigger prototypes | 10 (4 enabled) |
| Value maps | 6 |
| Dashboards | 2 |
| Macros | 16 |

---

## Troubleshooting

### Standard SNMP data is unavailable

1. Confirm the SNMP interface address and UDP 161 reachability
2. Verify SNMPv2c is enabled on the device
3. Confirm `{$SNMP_COMMUNITY}` is set at host or host-group level
4. Review the SNMP error text on the item and the Zabbix server/proxy log

### No interfaces discovered

**Symptom:** `adva.net.if.discovery` returns nothing, or the wrong ports appear.

The default filters are tuned to ADVA `NETWORK PORT-` / `ACCESS PORT-` naming. Check the raw values of `ifName`, `ifDescr`, and `ifType` on the device with `snmpwalk`, then relax `{$ADVA.IFNAME.MATCHES}` and `{$ADVA.IFDESCR.MATCHES}` accordingly.

### No cards discovered

**Symptom:** `adva.xg108.card.discovery` returns nothing.

Walk `1.3.6.1.4.1.2544.1.12.3.1.106.1.1` directly. If the table is empty, the firmware exposes a different entity layout and the OID branch needs adjusting for that variant.

### Traps are unavailable

1. Confirm the device trap target uses the receiver address and UDP 162
2. Confirm the trap receiver is listening and Zabbix trap processing is enabled
3. Review `snmptrap.fallback` for unmatched ADVA notifications
4. Verify firewall policy permits UDP 162 from the device management network

### False positive power-trap match

Review the complete formatted notification in item history. Tighten the regular expression using the confirmed enterprise notification OID rather than adding site-specific text.

---

## Known Limitations

- The exact enterprise notification OID for an XG108 dying-gasp event has not been captured from a controlled or real event. The trap item currently matches **formatted notification text**. Before treating this as OID-validated, capture a representative trap from `snmptrap.fallback`, confirm the enterprise OID and varbinds, and add the OID to the item expression.
- Routing-protocol monitoring (OSPF, BGP) is intentionally out of scope.
- Discovery filter defaults reflect one verified XG108 naming layout; other firmware revisions may need filter changes.

---

## Version History

### v1.0.0 - Initial release

- ✅ Standalone Zabbix 7.4 template with no external template linkage
- ✅ ICMP, SNMP system tree, SNMP availability, and trap collection
- ✅ Physical service-interface discovery with 64-bit traffic counters
- ✅ XG108 card discovery with temperature, voltage, and state telemetry
- ✅ Dying-gasp and power-failure trap matching with timed recovery and manual close
- ✅ Two dashboards, six value maps, and dependency-aware triggers
- ✅ Verified device identity and SNMPv2c polling against sysObjectID `1.3.6.1.4.1.2544.1.12.1.1.50`

---

## Support & Resources

### Template Maintainer

**Author:** `://echo@dla.network [oZark oRChes✝ra✝'d]` | [![GitHub](https://img.shields.io/badge/GitHub-DLA--neTWorK-blue?logo=github)](https://github.com/DLA-neTWorK)

When reporting an issue, include the Zabbix version, ADVA firmware version, sanitized item error, and a redacted trap sample. **Remove communities, addresses, customer names, and device identifiers before sharing.**

### Zabbix Resources

- [Zabbix 7.4 Documentation](https://www.zabbix.com/documentation/7.4/)
- [SNMP agent items](https://www.zabbix.com/documentation/7.4/en/manual/config/items/itemtypes/snmp)
- [SNMP trap monitoring](https://www.zabbix.com/documentation/7.4/en/manual/config/items/itemtypes/snmptrap)
- [Low-level discovery](https://www.zabbix.com/documentation/7.4/en/manual/discovery/low_level_discovery)
- [Zabbix template guidelines](https://www.zabbix.com/documentation/guidelines/en/template_guidelines)

---

## Quick Reference

| Property | Value |
|----------|-------|
| **Template Name** | ADVA FSP 150-XG108 by SNMP |
| **Template Group** | Templates/Network devices |
| **Zabbix Version** | 7.4+ |
| **Monitoring Type** | SNMPv2c polling + SNMP traps |
| **Device sysObjectID** | `1.3.6.1.4.1.2544.1.12.1.1.50` |
| **Required host macro** | `{$SNMP_COMMUNITY}` (secret) |
| **Template linkage** | None - standalone |

---

## License & Attribution

**License:** MIT

**Attribution:** Please retain author attribution when sharing or modifying.

This template contains no ADVA firmware, MIB source, third-party code, credentials, management addresses, proxy names, SNMP communities, or customer identifiers.
