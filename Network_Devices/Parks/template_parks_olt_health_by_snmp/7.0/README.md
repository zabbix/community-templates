# Parks OLT Health by SNMP

## Overview

Basic SNMP health template for PARKS Fiberlink OLTs.

Tested on PARKS Fiberlink 30028 with firmware 6.2.0.

## What it monitors

- CPU utilization
- Memory total
- Memory used
- Memory utilization (calculated)
- Internal unit temperature
- GPON SFP temperature per port using low-level discovery
- Uptime

## Triggers

- High and critical CPU utilization
- High memory utilization
- High GPON SFP temperature
- High internal temperature
- Critical internal temperature with hysteresis
- Device restart

## Macros

| Macro | Default | Description |
|---|---:|---|
| `{$OLT.CPU.UTIL.CRIT}` | `80` | Critical CPU utilization threshold in %. |
| `{$OLT.CPU.UTIL.WARN}` | `55` | Warning CPU utilization threshold in %. |
| `{$OLT.MEMORY.UTIL.MAX}` | `90` | Memory utilization warning threshold in %. |
| `{$OLT.SFP.TEMP.HIGH}` | `70` | High GPON SFP temperature threshold in °C. |
| `{$OLT.TEMP.CRIT}` | `80` | Critical internal temperature threshold in °C. |
| `{$OLT.TEMP.CRIT.RESET}` | `79` | Internal temperature threshold for critical trigger recovery. |
| `{$OLT.TEMP.HIGH}` | `60` | High internal temperature warning threshold in °C. |

## Configuration

Configure the SNMP interface on the monitored OLT and provide the appropriate SNMP community or SNMP credentials for the device.

The template has no external template links and can be imported into a clean Zabbix 7.0 installation.

## Notes

The OIDs were extracted from the original 257consultoria templates (Template Module Generic SNMP Parks / Template OLTs Parks V1.0).

The SFP temperature table `.1.3.6.1.4.1.3893.1.21.1.1.1.14` was confirmed to be indexed by port and is collected using low-level discovery instead of fixed GPON SFP temperature items.

## Author

luiz-camillo

## License

MIT License, consistent with the license of the Zabbix Community Templates repository.