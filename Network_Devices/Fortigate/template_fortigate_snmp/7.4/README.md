# SNMP Fortinet Devices for Zabbix 7.4

## Overview

Fortigate monitoring through SNMP, adapted from the [6.0 template](../6.0/template_fortigate_snmp.yaml).

Original author: Andrea Durante, based on the template by Leonardo Nascimento da Silva.

This extends the existing community template with network bandwidth usage per standalone device or HA member and the one-minute average session setup rate. Existing items retain their polling intervals, preprocessing, trigger expressions and thresholds from 6.0. This adaptation has not been imported into a running Zabbix instance or tested against a live Fortigate.

## Setup

1. Enable SNMP on the Fortigate interface reachable by the assigned Zabbix server/proxy. Configure the SNMP community and permit queries from that server/proxy address.
2. Allow UDP port **161** between the polling server/proxy and Fortigate.
3. In **Data collection → Templates → Import**, import `template_fortigate_snmp.yaml` from the `7.4` directory.
4. Add an **SNMP interface** to the host using the Fortigate IP/DNS address, port **161**, **SNMPv2**, and the correct community. If the community field uses `{$SNMP_COMMUNITY}`, define that macro on the host.
5. Link **SNMP Fortinet Devices**. No Zabbix agent, external script, linked template or value-map import is required.
6. Interface prototypes retain symbolic `IF-MIB` OIDs. Install and enable IF-MIB for Net-SNMP on the assigned server/proxy and ensure its Zabbix service can resolve these names.
7. Check **Monitoring → Latest data**. Network interface discovery runs every five minutes; use **Execute now** on the discovery rule to run it sooner.

SNMPv3 may instead be configured on the host interface with matching device credentials. To populate firmware and serial-number inventory fields automatically, enable automatic inventory on the host.

Test from the assigned server/proxy, replacing the example values:

```sh
snmpget -v2c -c '<community>' <fortigate-ip> .1.3.6.1.4.1.12356.101.4.1.1.0
snmpwalk -v2c -c '<community>' <fortigate-ip> .1.3.6.1.2.1.31.1.1.1.1
snmptranslate -On IF-MIB::ifHCOutOctets
snmptranslate -On IF-MIB::ifHighSpeed
snmptranslate -On IF-MIB::ifInOctets
```

## Changes for 7.4

- Uses export version `7.4` and `template_groups`; removes the obsolete export `date`.
- Preserves template name, UUIDs, item keys, OIDs, polling intervals, preprocessing, trigger expressions, inventory mappings and graphs from 6.0.
- Explicitly preserves the old 90-day history default for regular items and the 30-day lost-resource deletion period with `DISABLE_NEVER` for interface discovery.
- Uses `{HOST.NAME}` in trigger names and `{#SNMPVALUE}` in discovered item names instead of legacy `{HOSTNAME}` and `$1` placeholders.
- Adds member discovery, a network bandwidth usage item and a graph prototype using `fgHaStatsNetUsage`.
- Adds `fgSysSesRate1` as **Current session rate (1m average)** with a dedicated graph.
- Provides current setup instructions and documents inherited limitations.

See the [Zabbix 7.4 export/import format](https://www.zabbix.com/documentation/7.4/en/manual/xml_export_import/templates). The 7.0 and 7.4 variants have the same monitoring configuration. They retain the same template identity: import the version matching your Zabbix installation. Importing with **Update existing** updates an existing **SNMP Fortinet Devices** template; review the import comparison before applying it.

## Items collected

| Name | Key | Interval |
|---|---|---|
| Current session rate (1m average) | `fortinetCurrentSessionRate` | 30 seconds |
| Current connections | `fortinetCurrentConnections` | 60 seconds |
| Current CPU Util | `fortinetCurrentCPUUtil` | 60 seconds |
| Current RAM Usage | `fortinetCurrentRAMUtil` | 60 seconds |
| Total storage space | `fortinetTotalStorage` | 3600 seconds |
| Fortinet Uptime | `fortinetUpTime` | 30 seconds |
| Used storage space | `fortinetUsedStorage` | 60 seconds |
| Fortinet Used Storage % | `fortinetUsedStorage-percent` | 60 seconds |
| Firmware Version | `SysmFirmwareVersion` | 3600 seconds |
| Serial Number | `SysmSerialNumber` | 3600 seconds |

## Network discovery

The **Network Interfaces** rule (`ifname`) discovers interface names using IF-MIB every 300 seconds and creates:

| Item | Key | Interval |
|---|---|---|
| Upload | `ifHCOutOctets[{#SNMPVALUE}]` | 30 seconds |
| Link speed | `ifHighSpeed[{#SNMPVALUE}]` | 300 seconds |
| Download | `ifInOctets[{#SNMPVALUE}]` | 30 seconds |

Includes one network traffic graph prototype per interface and five regular graphs: CPU, current connections, disk use, RAM and current session rate (1m average).

## Device and HA member bandwidth usage

The **Fortigate members** discovery rule (`fortinetHaMemberDiscovery`) polls `fgHaStatsSerial` every five minutes and creates one bandwidth usage item and graph per returned member. The Fortinet MIB specifies that this table is also available in standalone mode. Members are labelled by serial number; polling uses the discovered SNMP index, not a fixed `.1` index.

| Setting | Value |
|---|---|
| Discovery OID | `1.3.6.1.4.1.12356.101.13.2.1.1.2` (`fgHaStatsSerial`) |
| Item key | `fgHaStatsNetUsage[{#SNMPINDEX}]` |
| Item OID | `1.3.6.1.4.1.12356.101.13.2.1.1.5.{#SNMPINDEX}` |
| Polling interval | 30 seconds |
| Source type and unit | Gauge32, kbps |
| Preprocessing | Multiply by 1000; no change-per-second step |
| Display unit | `bps` (automatically scaled to Kbps/Mbps/Gbps) |
| Retention | History 90 days; trends 365 days |

After importing with **Update existing** and **Create new**, execute **Fortigate members** discovery, then find **Network bandwidth usage** under **Monitoring → Latest data** or open the corresponding member graph. No threshold trigger is added, since this MIB does not provide the device's maximum throughput capacity.

Verify the table from the assigned server/proxy:

```sh
snmpwalk -v2c -c '<community>' <fortigate-ip> 1.3.6.1.4.1.12356.101.13.2.1.1.2
snmpwalk -v2c -c '<community>' <fortigate-ip> 1.3.6.1.4.1.12356.101.13.2.1.1.5
```

For example, a reported value of `125000` kbps is stored as `125000000` bps (125 Mbps). Numeric OIDs do not require the Fortinet MIB to be installed on the polling server/proxy. If discovery returns no members, verify table availability and SNMP permissions on the target device.

The MIB defines this as network bandwidth usage of the member, but does not specify how directions are aggregated or the averaging interval. Do not treat it as measured maximum firewall capacity or assume it equals the interface graphs or GUI dashboard. Members are shown separately; their readings are not summed across HA nodes.

## Current session rate

**Current session rate (1m average)** monitors `fgSysSesRate1`, defined in the Fortinet MIB as the average session setup rate over the past minute. It is a rate of session creation, distinct from the number of active sessions. The item and its graph use the same name.

| Setting | Value |
|---|---|
| Item key | `fortinetCurrentSessionRate` |
| Numeric OID | `1.3.6.1.4.1.12356.101.4.1.11.0` |
| Source type | Gauge32 |
| Units | sessions/s (exported as `!sessions/s` to prevent automatic unit prefixes) |
| Polling interval | 30 seconds |
| Averaging window | Previous minute, calculated by the device |
| Preprocessing | None; the device already reports a rate |
| Retention | History 90 days; trends 365 days |

Import with **Update existing** and **Create new**, then look for the item in **Monitoring → Latest data**. This is a regular item and requires no discovery. No alert threshold is assumed because acceptable session rates depend on the device and workload.

```sh
snmpget -v2c -c '<community>' <fortigate-ip> 1.3.6.1.4.1.12356.101.4.1.11.0
```

A returned value of `250` means an average of 250 new sessions per second over the past minute. The MIB also defines 10-, 30- and 60-minute averages and separate IPv6 rate objects; this item specifically polls `fgSysSesRate1` and does not combine it with the IPv6 objects. Verify OID availability on the target FortiOS version. The existing **Current connections** item remains separate and retains its documented preprocessing limitation.

## Triggers

| Trigger | Inherited condition |
|---|---|
| CPU usage | Average of the last five processed samples exceeds 95 |
| Memory usage | Average of the last five samples exceeds 100% |
| Reboot | Uptime is lower than the tenth most recent sample |

## Inherited limitations

- CPU uses `CHANGE_PER_SECOND` followed by multiplication by 100; the stored result is a transformed rate, not the raw CPU percentage. Review this preprocessing before relying on the CPU graph or alert.
- Current connections uses `CHANGE_PER_SECOND` with units `KC`; it does not store the raw session count.
- The RAM trigger threshold is above 100%, so normal percentage readings will not trigger it. Adjust it to your operational threshold.
- Download uses the 32-bit `ifInOctets` counter, while upload uses 64-bit `ifHCOutOctets`. Counter wrap can affect download readings on busy interfaces.
- Link speed retains the raw `ifHighSpeed` value in millions of bits per second, without a display unit or multiplier.
- Used storage percentage divides by total storage; a device returning zero or lacking storage OIDs can produce an unsupported item.
- Interface keys use interface names; a rename changes the discovered item identity.
