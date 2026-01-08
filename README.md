# IBM TS4300 Tape Library - SNMPv2

## Description

This template monitors the **IBM TS4300 Tape Library** using SNMP Agent.
It was developed and tested on Zabbix 7.0.

It utilizes low-level discovery (LLD) to automatically detect:
* **LTO Drives:** Monitoring operational status and cleaning requests.

## Requirements

* Zabbix 7.0 or newer.
* SNMP enabled on the IBM TS4300 Library (default port 161).
* SNMP Community configured (default macro: `{$SNMP_COMMUNITY}`).

## Discovery Rules

| Name | Description |
| - | - |
| **LTO Drive Discovery** | Discovers tape drives installed in the library via OID `.1.3.6.1.4.1.14851.3.1.6.2.1.1` |

## Items Collected

| Name | Description | OID |
| - | - | - |
| **Global Health Status** | Overall chassis status (OK, Degraded, Failed). | `.1.3.6.1.4.1.14851.3.1.4.10.1.10.1` |
| **Total Media Count** | Total number of physical tapes detected. | `.1.3.6.1.4.1.14851.3.1.13.2.0` |
| **Active Alerts Count** | Number of active critical/warning alerts on the library panel. | `.1.3.6.1.4.1.14851.3.1.10.10.0` |
| **Drive Status** | Operational status of each specific drive (LLD). | `.1.3.6.1.4.1.14851.3.1.6.2.1.11.X` |
| **Cleaning Request** | Boolean flag if a drive needs cleaning (LLD). | `.1.3.6.1.4.1.14851.3.1.6.2.1.6.X` |

## Triggers

* **High Severity:** Global Health is not OK.
* **Warning:** There are active alerts on the device panel.
* **Average:** Specific LTO Drive is in Error or Failed state.

## Installation

1.  Import the `template_ibm_ts4300_snmp.xml` file into Zabbix.
2.  Assign the template to the Host.
3.  Set the `{$SNMP_COMMUNITY}` macro on the host level (default: public).

## Feedback

If you find any issues, please create an issue in the repository.

---
*Author: Zabbix Community*