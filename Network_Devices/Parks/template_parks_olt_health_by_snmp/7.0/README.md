# Parks OLT Health by SNMP

## Overview

Basic health template for PARKS Fiberlink OLTs (tested on PARKS Fiberlink 30028 - firmware 6.2.0).

It monitors:

- CPU utilization
- Memory (total / used / utilization)
- Internal unit temperature
- SFP GPON temperature (per port, via low-level discovery)
- Device uptime

OIDs were taken from the vendor Generic SNMP Parks MIB. The SFP temperature table
(`.1.3.6.1.4.1.3893.1.21.1.1.1.14`, `pkSfpDiagTemperature`) is indexed by port, so it is
collected through an LLD rule instead of fixed per-port items.

## Requirements

- Zabbix version: 7.0
- SNMPv2 interface on the host, with a valid read community.

## Setup

1. Import the template into Zabbix (*Data collection* → *Templates* → *Import*).
2. Link the template to a host that has an **SNMPv2 interface** configured.
3. Set the read community on the host (macro `{$SNMP_COMMUNITY}`).
4. Adjust the threshold macros below if the defaults do not fit your deployment.

## Author

Josivan Pigozzo (RouterX) — https://github.com/JosivanPigozzo

## Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$OLT.CPU.UTIL.WARN}|CPU utilization warning threshold, in %.|`55`|
|{$OLT.CPU.UTIL.CRIT}|CPU utilization critical threshold, in %.|`80`|
|{$OLT.MEMORY.UTIL.MAX}|Memory utilization warning threshold, in %.|`90`|
|{$OLT.TEMP.HIGH}|Internal temperature warning threshold, in °C.|`60`|
|{$OLT.TEMP.CRIT}|Internal temperature critical threshold, in °C (fires above this value).|`80`|
|{$OLT.TEMP.CRIT.RESET}|Internal temperature at which the critical problem recovers, in °C (hysteresis).|`79`|
|{$OLT.SFP.TEMP.HIGH}|SFP GPON temperature warning threshold, in °C.|`70`|

## Items collected

|Name|Key|Type|
|----|---|----|
|CPU utilization|`olt.cpu.utilization`|SNMP agent|
|Memory total|`olt.memory.total`|SNMP agent|
|Memory used|`olt.memory.used`|SNMP agent|
|Memory utilization|`olt.memory.utilization`|Calculated|
|Temperature internal unit|`olt.temperature.internal`|SNMP agent|
|Uptime|`olt.uptime`|SNMP agent|

## Discovery rules

|Name|Key|Description|
|----|---|-----------|
|SFP GPON temperature discovery|`olt.sfp.temp.discovery`|Discovers GPON SFP indexes exposing a temperature reading (`pkSfpDiagTemperature`) and creates a per-port temperature item and trigger.|

## Triggers

|Name|Severity|Expression|
|----|--------|----------|
|OLT: High CPU utilization|Warning|CPU over `{$OLT.CPU.UTIL.WARN}`% for 5m|
|OLT: Critical CPU utilization|High|CPU over `{$OLT.CPU.UTIL.CRIT}`% for 5m|
|OLT: High memory utilization|Average|Memory over `{$OLT.MEMORY.UTIL.MAX}`% for 5m|
|OLT: High internal temperature|High|Internal temperature over `{$OLT.TEMP.HIGH}`°C for 5m|
|OLT: Critical internal temperature|Disaster|Internal temperature over `{$OLT.TEMP.CRIT}`°C, recovers below `{$OLT.TEMP.CRIT.RESET}`°C (hysteresis)|
|OLT: High temperature on SFP GPON {#SNMPINDEX}|High|SFP GPON temperature over `{$OLT.SFP.TEMP.HIGH}`°C|
|OLT: Has been restarted|Warning|Uptime < 10m|

## License

This template is distributed under the MIT License, in accordance with the Zabbix
community-templates repository policy.
