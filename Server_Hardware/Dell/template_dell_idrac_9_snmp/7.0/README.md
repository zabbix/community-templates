# SNMP-iDRAC-9 for Zabbix 7.0

## Overview

Dell PowerEdge iDRAC 9 monitoring through SNMP, adapted from the [6.0 template](../6.0/template_dell_idrac_9_snmp.yaml).

Original author: [Lucas Afonso Kremer](https://www.linkedin.com/in/lucasafonsokremer), based on @endersonmaia's iDRAC 7 template.

The original author reported testing on PowerEdge R440 with iDRAC firmware 3.21.21.21. This 7.0 adaptation has not been tested against live hardware or imported into a running Zabbix instance.

## Setup

1. Enable the SNMP agent on iDRAC and configure its read-only community. Allow UDP port 161 from the assigned Zabbix server/proxy to iDRAC.
2. Ensure the standard **ICMP Ping** template exists in Zabbix (import the official Zabbix 7.0 template first if missing). Open **Data collection → Templates → Import** and import `template_dell_idrac_9_snmp.yaml` with **Template linkage → Create new** enabled.
3. Add an **SNMP interface** to the host using the iDRAC address, port **161**, **SNMPv2**, and the correct community. If the community field uses `{$SNMP_COMMUNITY}`, define that macro on the host.
4. Link **SNMP-iDRAC-9**. The linked **ICMP Ping** template automatically adds ping availability, packet loss and response time monitoring. No Zabbix agent, custom script or separate value-map import is required.
5. Check **Monitoring → Latest data**. Use **Execute now** on discovery rules to discover components sooner.

Test from the assigned Zabbix server/proxy, replacing the example values:

```sh
snmpget -v2c -c '<community>' <idrac-ip> 1.3.6.1.4.1.674.10892.5.2.1.0
snmpwalk -v2c -c '<community>' <idrac-ip> 1.3.6.1.4.1.674.10892.5.4.700
```

SNMPv3 can instead be configured on the host interface if enabled on the device. Numeric OIDs are used, so Dell MIB files need not be installed on Zabbix.

## Changes for 7.0

- Uses export version `7.0` and `template_groups`; removes the obsolete export `date`.
- Preserves the template name, UUIDs, item keys, OIDs, polling intervals, triggers, graphs and value maps from 6.0.
- Explicitly preserves the old 90-day history default for regular items that omitted it, and the 30-day lost-resource deletion period with `DISABLE_NEVER` for discovery rules.
- Updates setup instructions for host SNMP credentials and bundled value maps.

Conversion follows the [Zabbix 7.0 export format](https://www.zabbix.com/documentation/7.0/en/manual/xml_export_import/templates) and the official import converters. If **SNMP-iDRAC-9** already exists, importing with **Update existing** updates that template; review the import comparison before applying it.

## Monitoring coverage

21 regular items, 9 discovery rules, 41 item prototypes, 10 triggers, 15 trigger prototypes, 2 graph prototypes and 8 bundled value maps, plus monitoring inherited from **ICMP Ping**.

| Discovery rule | Key | Item prototypes |
|---|---|---|
| Disk Enumeration | `DiskEnumeration` | 10 |
| Fan Enumeration | `FanEnumeration` | 2 |
| Memory Enumeration | `MemoryEnum` | 6 |
| Network Enumeration | `NetworkEnum` | 5 |
| Power Supply Enumeration | `PowerSupplies` | 5 |
| Processor Enumeration | `ProcEnum` | 1 |
| Temperature Enumeration | `TempEnum` | 6 |
| Voltage Table Enumeration | `VoltageTable` | 1 |
| Disk Volume Enumeration | `VolumeEnum` | 5 |

Regular items cover system health, power state, BIOS, iDRAC firmware, model and asset information, RAID controller health, storage health, CMOS battery, power and voltage status. Graph prototypes cover fan speed and temperature.

## Operational notes

- ICMP checks run from the assigned Zabbix server/proxy and require a working `fping` installation and ICMP access to the monitored address. For a dedicated iDRAC host with only an SNMP interface, ping uses that interface's address; verify the ICMP item interface if the host has multiple interface types.
- Discovery runs once per day, except the inherited memory discovery schedule `1d;50s/1-7,00:00-24:00`, which effectively runs every 50 seconds.
- Hardware alerts retain the original Dell status checks and power-state conditions. The no-data trigger fires after 10 minutes without overall system status data.
- BIOS version changes raise a Warning with the previous and current versions recorded in the event name. Detection follows the daily polling interval and requires two collected values. The problem resolves on the next unchanged sample or can be closed manually after review.
- Available sensors and storage OIDs depend on hardware and firmware. Investigate unsupported items with `snmpget`/`snmpwalk` from the assigned server/proxy.
- RAID controller items retain the original fixed controller index; multiple RAID controllers are not discovered.
- Temperature thresholds come from iDRAC. Verify that each sensor supplies valid thresholds.
