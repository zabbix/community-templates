# Cisco IE1000 by SNMP

## Overview

This template monitors Cisco Industrial Ethernet 1000 Series switches through
SNMP. It uses Cisco IE1000 private MIB objects for platform, temperature, power,
status, and PoE data, and IF-MIB objects for interface discovery and traffic.

The template was exported from and prepared for Zabbix 7.0.

## Requirements

- Zabbix 7.0 or later
- An SNMP interface configured on the monitored host
- SNMP access to the Cisco IE1000 switch

No external scripts are required.

## Tested versions

| Component | Version |
| --- | --- |
| Zabbix | 7.0.26 |
| Switch | Cisco IE-1000-4P2S-LM |
| IE1000 software | saturn-3.05.03 / 1.8.2 |

A clean import was also verified on Zabbix 7.0.32.

Standard ENTITY-SENSOR-MIB and CISCO-ENTITY-SENSOR-MIB were not available on
the tested switch. The temperature items therefore use CIE1000-SYSUTIL-MIB.

## Installation

1. Import `template_cisco_ie1000_by_snmp.yaml` in **Data collection >
   Templates**.
2. Create or select the Cisco IE1000 host and configure its SNMP interface.
3. Link the `Cisco IE1000 by SNMP` template to the host.
4. Adjust interface discovery macros if required.

## Monitored data

- Board inventory and serial numbers
- CPU load
- Board and junction temperatures, thresholds, and alarm states
- Main and redundant power supply states
- System, alarm, PoE, and power status text
- PoE switch budget and per-port state, power, current, and PD class
- Interface status, type, speed, traffic, errors, and discards

The template contains 28 direct items, two low-level discovery rules, 15 item
prototypes, seven direct triggers, two trigger prototypes, and five value maps.

PoE PD class can return `-1` when no usable class or powered device is detected.
The item prototype uses Numeric (float) so that this valid device response is
stored instead of becoming unsupported.

## Discovery macros

| Macro | Default | Purpose |
| --- | --- | --- |
| `{$IFCONTROL}` | `1` | Enables link-down trigger prototypes |
| `{$NET.IF.IFADMINSTATUS.MATCHES}` | `^.*` | Includes matching administrative states |
| `{$NET.IF.IFADMINSTATUS.NOT_MATCHES}` | `^2$` | Excludes administratively down interfaces |
| `{$NET.IF.IFALIAS.MATCHES}` | `.*` | Includes matching interface aliases |
| `{$NET.IF.IFALIAS.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Excludes matching interface aliases |
| `{$NET.IF.IFDESCR.MATCHES}` | `.*` | Includes matching interface descriptions |
| `{$NET.IF.IFDESCR.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Excludes matching interface descriptions |
| `{$NET.IF.IFNAME.MATCHES}` | `^.*$` | Includes matching interface names |
| `{$NET.IF.IFNAME.NOT_MATCHES}` | See template | Excludes loopback, null, virtual, and container interfaces |
| `{$NET.IF.IFOPERSTATUS.MATCHES}` | `^.*$` | Includes matching operational states |
| `{$NET.IF.IFOPERSTATUS.NOT_MATCHES}` | `^6$` | Excludes interfaces in `notPresent` state |
| `{$NET.IF.IFTYPE.MATCHES}` | `.*` | Includes matching interface types |
| `{$NET.IF.IFTYPE.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Excludes matching interface types |

## Known limitations

- The template has been validated on the model and software listed above.
  Private MIB availability and returned values may differ on other IE1000
  models or releases.
- The template polls the 32-bit IF-MIB octet counters every three minutes. A
  saturated Gigabit uplink can wrap its counter in about 34 seconds, so its
  traffic rate can be underreported or missing. Zabbix discards the rate sample
  when the current counter is lower than the previous reading.

## Author

[hshimomura](https://github.com/hshimomura)
