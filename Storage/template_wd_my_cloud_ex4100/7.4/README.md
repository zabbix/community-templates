# WD My Cloud EX4100

## Overview

Zabbix SNMP template for the Western Digital WD My Cloud EX4100 NAS device.

Adapted from the community [EX4 template](https://github.com/zabbix/community-templates/tree/main/Storage_Devices/template_wd_my_cloud_ex4).
The key difference is the SNMP OID base path, which reflects a different `submodelID` in the EX4100 MIB:

| Model  | OID base                        |
|--------|---------------------------------|
| EX4    | `.1.3.6.1.4.1.5127.1.1.1.1.1`  |
| EX4100 | `.1.3.6.1.4.1.5127.1.1.1.6.1`  |

MIB reference: <https://downloads.wdc.com/nas/WDMYCLOUDEX4100-MIB.txt>

## Requirements

- Zabbix 7.4 (exported and tested)
- SNMP enabled on the WD My Cloud EX4100

## Setup

1. On the EX4100 web UI, go to **Settings → Network → SNMP** and enable SNMP.
   SNMP v2c with a community string is recommended.
2. In Zabbix, import the template YAML file via **Configuration → Templates → Import**.
3. Assign the template to your EX4100 host.
4. Set the following macros on the host:

| Macro              | Description                          | Example value |
|--------------------|--------------------------------------|---------------|
| `{$SNMP_PORT}`     | UDP port for SNMP                    | `161`         |
| `{$SNMP_COMMUNITY}`| SNMP community string                | `public`      |

> **Note:** This NAS can be slow to respond to SNMP bulk queries. If you experience missing data or timeouts, increase the SNMP timeout on the host or consider disabling bulk requests in the host interface settings.

## Items collected

### System

| Name             | Key               | Update |
|------------------|-------------------|--------|
| Agent Version    | `agentVer`        | 1h     |
| Software version | `softwareVersion` | 1h     |
| Hostname         | `hostName`        | 1h     |
| Temperature      | `temperature`     | 1m     |
| Fan status       | `fanStatus`       | 1m     |
| FTP status       | `ftpServer`       | 1h     |
| Net type         | `netType`         | 1h     |

### Physical Disks (LLD)

| Name                          | Key                        | Update |
|-------------------------------|----------------------------|--------|
| Disk vendor in slot N         | `pd.Vendor[{#SNMPINDEX}]`  | 1h     |
| Disk model in slot N          | `pd.model[{#SNMPINDEX}]`   | 1h     |
| Disk SN in slot N             | `pd.SN[{#SNMPINDEX}]`      | 1h     |
| Disk temperature in slot N    | `pd.temperature[{#SNMPINDEX}]` | 1m |
| Disk capacity in slot N       | `pd.capacity[{#SNMPINDEX}]`| 1h     |

### Logical Disks (LLD)

| Name                              | Key                          | Update |
|-----------------------------------|------------------------------|--------|
| Logical disk {name} size          | `pd.size[{#VOLUMENAME}]`     | 1h     |
| Logical disk {name} free space    | `ld.freespace[{#VOLUMENAME}]`| 1m     |
| Logical disk {name} free percent  | `ld.pfree[{#VOLUMENAME}]`    | 1m     |
| Logical disk {name} FS type       | `ld.fstype[{#VOLUMENAME}]`   | 1h     |
| Logical disk {name} RAID level    | `ld.raid[{#VOLUMENAME}]`     | 1h     |

### UPS (LLD)

| Name                      | Key                            | Update |
|---------------------------|--------------------------------|--------|
| UPS No{N} Mode            | `upsMode[{#SNMPINDEX}]`        | 1h     |
| UPS No{N} Manufacturer    | `upsManufacturer[{#SNMPINDEX}]`| 1h     |
| UPS No{N} Product         | `upsProduct[{#SNMPINDEX}]`     | 1h     |
| UPS No{N} Battery Charge  | `upsBattery[{#SNMPINDEX}]`     | 1m     |
| UPS No{N} Status          | `upsStatus[{#SNMPINDEX}]`      | 1m     |

## Triggers

| Name                                    | Severity | Condition                                      |
|-----------------------------------------|----------|------------------------------------------------|
| High temperature                        | Warning  | Average system temperature over last 5 samples > 60 °C |
| Fan status                              | Warning  | Fan status does not contain "running"          |
| Physical disk N temperature             | Warning  | Average disk temperature over last 5 samples > 55 °C |
| Logical Disk {name} free space less 25% | Warning  | Free space < 25%                               |
| Battery Charge Low                      | Average  | UPS battery charge < 50%                      |
| Battery Charge Critical                 | High     | UPS battery charge < 25%                      |
| Battery Status                          | Warning  | UPS status does not contain "On Line" in last 3 checks |

## Author

Adapted for EX4100 from the original EX4 community template.
