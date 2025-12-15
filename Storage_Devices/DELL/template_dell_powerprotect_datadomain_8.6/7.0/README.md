This template is for Zabbix version: 7.0

# Zabbix Template: DELL PowerProtect DataDomain by SNMP

## Overview

This Zabbix template provides comprehensive monitoring for **Dell PowerProtect Data Domain** (formerly EMC Data Domain) appliances via SNMP.

## Requirements:
Zabbix version: 7.0 and higher.

## Configuration

Zabbix should be configured according to the instructions in the [Templates out of the box](https://www.zabbix.com/documentation/7.4/en/manual/config/templates_out_of_the_box) section.

## Setup
1. Create a host for DataDomain with management IP as SNMP interface.
2. Link the template to the host.
3. Customize macro values if needed.

## Macros used
These macros allow customization of thresholds and discovery filters. You can override them at the host or linked template level in Zabbix.

| Name | Description | Default Value |
|------|-------------|---------------|
| `{$DISK.STATUS.CRIT:"absent"}` | <p>The critical value of the Disk state for trigger expression.</p> | `3` |
| `{$DISK.STATUS.CRIT:"failed"}` | <p>The critical value of the Disk state for trigger expression.</p> | `4` |
| `{$DISK.STATUS.CRIT:"unknown"}` | <p>The critical value of the Disk state for trigger expression.</p> | `2` |
| `{$DISK.STATUS.INFO:"copyReconstruction"}` | <p>The informational value of the Disk state for trigger expression.</p> | `9` |
| `{$DISK.STATUS.INFO:"raidReconstruction"}` | <p>The informational value of the Disk state for trigger expression.</p> | `8` |
| `{$FAN.STATUS.CRIT:"fail"}` | <p>The critical value of the FAN sensor for trigger expression.</p> | `2` |
| `{$FAN.STATUS.CRIT:"notfound"}` | <p>The critical value of the FAN sensor for trigger expression.</p> | `0` |
| `{$FS.SPACE.CRIT}` | <p>The critical value of the Filesystem space used (in %) for trigger expression.</p> | `95` |
| `{$FS.SPACE.TIME}` | <p>The time during which Filesystem space usage may exceed the threshold.</p> | `10m` |
| `{$FS.SPACE.WARN}` | <p>The warning value of the Filesystem space used (in %) for trigger expression.</p> | `85` |
| `{$NET.IF.IFADMINSTATUS.MATCHES}` | <p>Ignore notPresent(6)</p> | `^.*` |
| `{$NET.IF.IFADMINSTATUS.NOT_MATCHES}` | <p>Ignore down(2) administrative status</p> | `^2$` |
| `{$NET.IF.IFALIAS.MATCHES}` |  | `.*` |
| `{$NET.IF.IFALIAS.NOT_MATCHES}` |  | `CHANGE_IF_NEEDED` |
| `{$NET.IF.IFDESCR.MATCHES}` |  | `.*` |
| `{$NET.IF.IFDESCR.NOT_MATCHES}` |  | `CHANGE_IF_NEEDED` |
| `{$NET.IF.IFNAME.MATCHES}` |  | `^.*$` |
| `{$NET.IF.IFNAME.NOT_MATCHES}` | <p>Filter out loopbacks, nulls, docker veth links and docker0 bridge by default</p> | `(^Software Loopback Interface|^NULL[0-9.]*$|^[Ll]o[0-9.]*$|^[Ss]ystem$|^Nu[0-9.]*$|^veth[0-9a-z]+$|docker[0-9]+|br-[a-z0-9]{12})` |
| `{$NET.IF.IFOPERSTATUS.MATCHES}` |  | `^.*$` |
| `{$NET.IF.IFOPERSTATUS.NOT_MATCHES}` | <p>Ignore notPresent(6)</p> | `^6$` |
| `{$NET.IF.IFTYPE.MATCHES}` |  | `.*` |
| `{$NET.IF.IFTYPE.NOT_MATCHES}` |  | `CHANGE_IF_NEEDED` |
| `{$NVRAM.BATTERY.CHARGE.WARN}` | <p>The warning value of the nvram battery for trigger expression.</p> | `50` |
| `{$NVRAM.BATTERY.STATUS.CRIT}` | <p>The critical status of the nvram battery for trigger expression.</p> | `2` |
| `{$NVRAM.BATTERY.STATUS.OK}` | <p>The OK status of the nvram battery for trigger expression.</p> | `0` |
| `{$NVRAM.BATTERY.STATUS.WARN:"disabled"}` | <p>The WARN status of the nvram battery for trigger expression.</p> | `1` |
| `{$NVRAM.BATTERY.STATUS.WARN:"softdisabled"}` | <p>The WARN status of the nvram battery for trigger expression.</p> | `3` |
| `{$PSU.STATUS.CRIT:"acnone"}` | <p>The critical value of the PSU sensor for trigger expression.</p> | `4` |
| `{$PSU.STATUS.CRIT:"failed"}` | <p>The critical value of the PSU sensor for trigger expression.</p> | `2` |
| `{$PSU.STATUS.CRIT:"faulty"}` | <p>The critical value of the PSU sensor for trigger expression.</p> | `3` |
| `{$PSU.STATUS.WARN:"absent"}` | <p>The warning value of the PSU sensor for trigger expression.</p> | `0` |
| `{$PSU.STATUS.WARN:"unknown"}` | <p>The warning value of the PSU sensor for trigger expression.</p> | `99` |
| `{$TEMP.SENSOR.ENCLOSURE.MATCHES}` | <p>Filter for discovering a temperature sensor by enclosure ID.</p> | `.*` |
| `{$TEMP.SENSOR.ENCLOSURE.NOT_MATCHES}` | <p>Filter for discovering a temperature sensor by enclosure ID.</p> | `CHANGE_IF_NEEDED` |
| `{$TEMP.SENSOR.STATUS.CRIT:"failed"}` | <p>The critical value of the Temp Sensor state for trigger expression.</p> | `0` |
| `{$TEMP.SENSOR.STATUS.CRIT:"overheatCritical"}` | <p>The critical value of the Temp Sensor state for trigger expression.</p> | `4` |
| `{$TEMP.SENSOR.STATUS.OK}` | <p>The OK status of the Temp Sensor for trigger expression.</p> | `1` |


### Static Items

| Name | Description | Type | Key | Additional Info |
|------|-------------|------|-----|-----------------|
| DataDomain: DDBoost Backup Connections | DATA-DOMAIN-MIB::ddboostStatsBackupConn<br>Number of Backup connections. | SNMP agent | dell.dd.boost.backup.con[ddboostStatsBackupConn] | Units: none<br>Tag: component=charts |
| DataDomain: DDBoost Restore Connections | DATA-DOMAIN-MIB::ddboostStatsRestoreConn<br>Number of Restore connections. | SNMP agent | dell.dd.boost.restore.con[ddboostStatsRestoreConn] | Units: none<br>Tag: component=charts |
| DataDomain: File System Status Message | DATA-DOMAIN-MIB::fileSystemStatusMessage | SNMP agent | dell.dd.fs.status.message | Value type: Text<br>Discard unchanged (1d)<br>Tag: component=filesystem |
| DataDomain: File System Status | DATA-DOMAIN-MIB::fileSystemStatus | SNMP agent | dell.dd.fs.status[fileSystemStatus] | Valuemap: DATA-DOMAIN-MIB::fileSystemStatus<br>Discard unchanged (1d)<br>Tag: component=filesystem |
| DataDomain: CIFS operations rate | DATA-DOMAIN-MIB::cifsOpsPerSecond<br>Number of CIFS Operations performed per second. | SNMP agent | dell.dd.sys.cifs.ops[cifsOpsPerSecond] | Units: ops<br>Tag: component=charts |
| DataDomain: Cpu Average Busy | DATA-DOMAIN-MIB::cpuAvgPercentageBusy<br>CPU average percentage busy. | SNMP agent | dell.dd.sys.cpu.avg.busy[cpuAvgPercentageBusy] | Units: %<br>Tag: component=charts |
| DataDomain: Cpu Max Busy | DATA-DOMAIN-MIB::cpuMaxPercentageBusy<br>CPU max percentage busy. | SNMP agent | dell.dd.sys.cpu.max.busy[cpuMaxPercentageBusy] | Units: %<br>Tag: component=charts |
| DataDomain: Disk Busy rate | DATA-DOMAIN-MIB::diskBusyPercentage<br>Percentage of Time Disks were busy. | SNMP agent | dell.dd.sys.disk.busy[diskBusyPercentage] | Units: %<br>Tag: component=charts |
| DataDomain: Disk Read rate | DATA-DOMAIN-MIB::diskReadKBytesPerSecond<br>Number of KBytes per second read from disk. | SNMP agent | dell.dd.sys.disk.read[diskReadKBytesPerSecond] | Units: B/s<br>Multiplier: ×1024<br>Tag: component=charts |
| DataDomain: Disk Write rate | DATA-DOMAIN-MIB::diskWriteKBytesPerSecond<br>Number of KBytes per second written to disk. | SNMP agent | dell.dd.sys.disk.write[diskWriteKBytesPerSecond] | Units: B/s<br>Multiplier: ×1024<br>Tag: component=charts |
| DataDomain: Hardware Model | DATA-DOMAIN-MIB::systemModelNumber<br>Model Number of the System | SNMP agent | dell.dd.sys.model[systemModelNumber] | Value type: Char<br>Inventory: MODEL<br>Discard unchanged (1d)<br>Tag: component=system |
| DataDomain: NFS operations rate | DATA-DOMAIN-MIB::nfsOpsPerSecond<br>Number of NFS Operations performed per second. | SNMP agent | dell.dd.sys.nfs.ops[nfsOpsPerSecond] | Units: ops<br>Tag: component=charts |
| DataDomain: System Notes | DATA-DOMAIN-MIB::sysNotes<br>Customer defined notes associated with this DD System | SNMP agent | dell.dd.sys.notes[sysNotes] | Update: 1h<br>Value type: Text<br>Inventory: NOTES<br>Discard unchanged (1d)<br>Tag: component=system |
| DataDomain: Serial Number | DATA-DOMAIN-MIB::systemSerialNumber<br>Serial Number of the System | SNMP agent | dell.dd.sys.serialnumber[systemSerialNumber] | Value type: Char<br>Inventory: SERIALNO_A<br>Discard unchanged (1d)<br>Tag: component=system |
| DataDomain: System Current Time | DATA-DOMAIN-MIB::systemCurrentTime<br>DDR system's current time | SNMP agent | dell.dd.sys.time[systemCurrentTime] | Value type: Char<br>Discard unchanged (1d)<br>Tag: component=system |
| DataDomain: System Version | DATA-DOMAIN-MIB::systemVersion<br>DD version of the system | SNMP agent | dell.dd.sys.version[systemVersion] | Update: 1h<br>Value type: Char<br>Inventory: OS<br>Discard unchanged (1d)<br>Tag: component=system |
| DataDomain: Uptime (hardware) | HOST-RESOURCES-MIB<br>Time since last hardware initialization | SNMP agent | dell.dd.system.hw.uptime[hrSystemUptime.0] | Units: uptime<br>Update: 30s<br>Multiplier: ×0.01<br>Tag: component=system |
| DataDomain: Uptime (network) | SNMPv2-MIB<br>Time since network management portion was re-initialized | SNMP agent | dell.dd.system.net.uptime[sysUpTime.0] | Units: uptime<br>Update: 30s<br>Multiplier: ×0.01<br>Tag: component=system |
| DataDomain: SNMP traps (fallback) | Item is used to collect all SNMP traps unmatched by other snmptrap items | SNMP trap | snmptrap.fallback | Value type: Log<br>Tag: Application=General |
| DataDomain: System contact details | SNMPv2-MIB::sysContact<br>Contact person information | SNMP agent | system.contact[sysContact.0] | Update: 1h<br>Inventory: CONTACT<br>Discard unchanged (1d)<br>Tag: Application=General |
| DataDomain: System location | SNMPv2-MIB::sysLocation<br>Physical location | SNMP agent | system.location[sysLocation.0] | Update: 1h<br>Inventory: LOCATION<br>Discard unchanged (1h)<br>Tag: Application=General |
| DataDomain: System name | SNMPv2-MIB::sysName<br>Administratively-assigned name (usually FQDN) | SNMP agent | system.name | Update: 1h<br>Inventory: NAME<br>Discard unchanged (1h)<br>Tag: Application=General |
| DataDomain: System object ID | SNMPv2-MIB::sysObjectID<br>Vendor's authoritative identification | SNMP agent | system.objectid[sysObjectID.0] | Update: 15m<br>Discard unchanged (1h)<br>Tag: Application=General |
| DataDomain: SNMP agent availability | Internal item checking SNMP availability | Internal | zabbix[host,snmp,available] | Tag: Application=Status |

## Triggers (Static Items)

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| File System Status is not in optimal state | Check File System | last(/DELL PowerProtect DataDomain SNMP/dell.dd.fs.status[fileSystemStatus])<>3 | Warning | Manual close: YES<br>Opdata: Current state: {ITEM.LASTVALUE1}<br>Tag: scope=availability |
| DataDomain: Device has been replaced | Device serial number has changed. Ack to close | last(/DELL PowerProtect DataDomain SNMP/dell.dd.sys.serialnumber[systemSerialNumber],#1)<>last(/DELL PowerProtect DataDomain SNMP/dell.dd.sys.serialnumber[systemSerialNumber],#2) and length(last(/DELL PowerProtect DataDomain SNMP/dell.dd.sys.serialnumber[systemSerialNumber]))>0 | Information | Event name: DataDomain: Device has been replaced (new serial number received)<br>Manual close: YES<br>Tag: scope=notice |
| DataDomain: System Version has changed | System version has changed. Ack to close. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.sys.version[systemVersion],#1)<>last(/DELL PowerProtect DataDomain SNMP/dell.dd.sys.version[systemVersion],#2) and length(last(/DELL PowerProtect DataDomain SNMP/dell.dd.sys.version[systemVersion]))>0 | Information | Opdata: Current value: {ITEM.LASTVALUE1}<br>Manual close: YES<br>Tag: scope=notice |
| DataDomain: System name has changed | The name of the system has changed. Acknowledge to close the problem manually. | last(/DELL PowerProtect DataDomain SNMP/system.name,#1)<>last(/DELL PowerProtect DataDomain SNMP/system.name,#2) and length(last(/DELL PowerProtect DataDomain SNMP/system.name))>0 | Information | Event name: DataDomain: System name has changed (new name: {ITEM.VALUE})<br>Manual close: YES<br>Tags: scope=notice, scope=security |
| DataDomain: No SNMP data collection | SNMP is not available for polling. Please check device connectivity and SNMP settings. | max(/DELL PowerProtect DataDomain SNMP/zabbix[host,snmp,available],{$SNMP.TIMEOUT})=0 | Warning | Opdata: Current state: {ITEM.LASTVALUE1}<br>Tag: scope=availability |
| DataDomain: Host has been restarted | Uptime is less than 10 minutes. | (last(/DELL PowerProtect DataDomain SNMP/dell.dd.system.hw.uptime[hrSystemUptime.0])>0 and last(/DELL PowerProtect DataDomain SNMP/dell.dd.system.hw.uptime[hrSystemUptime.0])<10m) or (last(/DELL PowerProtect DataDomain SNMP/dell.dd.system.hw.uptime[hrSystemUptime.0])=0 and last(/DELL PowerProtect DataDomain SNMP/dell.dd.system.net.uptime[sysUpTime.0])<10m) | Warning | Event name: DataDomain: {HOST.NAME} has been restarted (uptime < 10m)<br>Manual close: YES<br>Tag: scope=notice |

## Discovery Rules

The template uses Low-Level Discovery (LLD) to automatically create items and triggers for dynamic components.

### LLD rule DDBoost Connections discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DDBoost Connections discovery | DATA-DOMAIN-MIB::ddboostInterface | SNMP agent | boost.connections.discovery<br>Update: 1h<br>Status: Disabled<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for DDBoost Connections discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: DDBoost backup connections of {#INTERFACE} | DATA-DOMAIN-MIB::ddboostBackupConnections<br>DDBoost backup connections. | SNMP agent | dell.dd.boost.backup.con[ddboostBackupConnections.{#SNMPINDEX}]<br>Tag: component=charts |
| DataDomain: DDBoost restore connections of {#INTERFACE} | DATA-DOMAIN-MIB::ddboostRestoreConnections<br>DDBoost restore connections. | SNMP agent | dell.dd.boost.restore.con[ddboostRestoreConnections.{#SNMPINDEX}]<br>Tag: component=charts |
| DataDomain: DDBoost total connections of {#INTERFACE} | DATA-DOMAIN-MIB::ddboostTotalConnections<br>DDBoost total connections. | SNMP agent | dell.dd.boost.total.con[ddboostTotalConnections.{#SNMPINDEX}]<br>Tag: component=charts |

(No trigger prototypes)

### LLD rule Disk discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| Disk discovery | DATA-DOMAIN-MIB::diskPropEnclosureID<br>DATA-DOMAIN-MIB::diskPropIndex | SNMP agent | disk.discovery<br>Update: 1h<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for Disk discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: Disk {#DISK_INDEX} of Enclosure {#DISK_ENCLOSUREID} capacity | DATA-DOMAIN-MIB::diskCapacity<br>Capacity of the disk. | SNMP agent | dell.dd.disk.capacity[diskCapacity.{#SNMPINDEX}]<br>Update: 1h<br>Value type: Char<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=disk, disk_enclosure={#DISK_ENCLOSUREID}, enclosure_id={#DISK_ENCLOSUREID} |
| DataDomain: Disk {#DISK_INDEX} of Enclosure {#DISK_ENCLOSUREID} Firmware Version | DATA-DOMAIN-MIB::diskFirmwareVersion<br>Firmware version of the disk. | SNMP agent | dell.dd.disk.fversion[diskFirmwareVersion.{#SNMPINDEX}]<br>Update: 1h<br>Value type: Char<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=disk, disk_enclosure={#DISK_ENCLOSUREID}, enclosure_id={#DISK_ENCLOSUREID} |
| DataDomain: Disk {#DISK_INDEX} of Enclosure {#DISK_ENCLOSUREID} model | DATA-DOMAIN-MIB::diskModel<br>Manufacture and model of the disk. | SNMP agent | dell.dd.disk.model[diskModel.{#SNMPINDEX}]<br>Update: 1h<br>Value type: Char<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=disk, disk_enclosure={#DISK_ENCLOSUREID}, enclosure_id={#DISK_ENCLOSUREID} |
| DataDomain: Disk {#DISK_INDEX} of Enclosure {#DISK_ENCLOSUREID} Serial Number | DATA-DOMAIN-MIB::diskSerialNumber<br>Serial Number of the disk. | SNMP agent | dell.dd.disk.sn[diskSerialNumber.{#SNMPINDEX}]<br>Update: 1h<br>Value type: Char<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=disk, disk_enclosure={#DISK_ENCLOSUREID}, enclosure_id={#DISK_ENCLOSUREID} |
| DataDomain: Disk {#DISK_INDEX} of Enclosure {#DISK_ENCLOSUREID} state | DATA-DOMAIN-MIB::diskPropState<br>Current State of the disk | SNMP agent | dell.dd.disk.state[diskPropState.{#SNMPINDEX}]<br>Valuemap: DATA-DOMAIN-MIB::diskPropState<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=disk, disk_enclosure={#DISK_ENCLOSUREID}, enclosure_id={#DISK_ENCLOSUREID} |

#### Trigger prototypes for Disk discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| Disk {#DISK_INDEX} of Enclosure {#DISK_ENCLOSUREID} is in critical state | Please check the disk state. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.disk.state[diskPropState.{#SNMPINDEX}])={$DISK.STATUS.CRIT:"absent"} or last(/DELL PowerProtect DataDomain SNMP/dell.dd.disk.state[diskPropState.{#SNMPINDEX}])={$DISK.STATUS.CRIT:"failed"} or last(/DELL PowerProtect DataDomain SNMP/dell.dd.disk.state[diskPropState.{#SNMPINDEX}])={$DISK.STATUS.CRIT:"unknown"} | Average | Manual close: YES<br>Tag: scope=availability |
| Disk {#DISK_INDEX} of Enclosure {#DISK_ENCLOSUREID} make reconstruction | Disk change make reconstruction. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.disk.state[diskPropState.{#SNMPINDEX}])={$DISK.STATUS.INFO:"copyReconstruction"} or last(/DELL PowerProtect DataDomain SNMP/dell.dd.disk.state[diskPropState.{#SNMPINDEX}])={$DISK.STATUS.INFO:"raidReconstruction"} | Information | Manual close: YES<br>Tag: scope=notify |

### LLD rule Enclosure Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| Enclosure Discovery | DATA-DOMAIN-MIB::enclosureListNum | SNMP agent | enclosure.discovery<br>Update: 1h<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for Enclosure Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: Enclosure {#ENCLOSURE_NR} capacity | DATA-DOMAIN-MIB::enclosureListCapacity<br>Enclosure capacity. | SNMP agent | dell.dd.enclosure.capacity[enclosureListCapacity.{#SNMPINDEX}]<br>Update: 1d<br>Value type: Char<br>Preprocessing: Discard unchanged with heartbeat 1w<br>Tags: component=enclosure, enclosure_id={#ENCLOSURE_NR} |
| DataDomain: Enclosure {#ENCLOSURE_NR} model | DATA-DOMAIN-MIB::enclosureListModel<br>Enclosure model. | SNMP agent | dell.dd.enclosure.model[enclosureListModel.{#SNMPINDEX}]<br>Update: 1d<br>Value type: Char<br>Preprocessing: Discard unchanged with heartbeat 1w<br>Tags: component=enclosure, enclosure_id={#ENCLOSURE_NR} |
| DataDomain: Enclosure {#ENCLOSURE_NR} Serial Number | DATA-DOMAIN-MIB::enclosureListSerialNum<br>Enclosure Serial Number. | SNMP agent | dell.dd.enclosure.sn[enclosureListSerialNum.{#SNMPINDEX}]<br>Update: 1d<br>Value type: Char<br>Preprocessing: Discard unchanged with heartbeat 1w<br>Tags: component=enclosure, enclosure_id={#ENCLOSURE_NR} |

(No trigger prototypes)

### LLD rule FAN discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| FAN discovery | DATA-DOMAIN-MIB::fanEnclosureID<br>DATA-DOMAIN-MIB::fanDescription | SNMP agent | fan.discovery<br>Update: 1h<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for FAN discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: {#FAN_DESCR} of Enclosure {#FAN_ENCLOSUREID} Speed Level | DATA-DOMAIN-MIB::fanLevel<br>Current run level of fan. | SNMP agent | dell.dd.fan.level[fanLevel.{#SNMPINDEX}]<br>Valuemap: DATA-DOMAIN-MIB::fanLevel<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=fan, enclosure_id={#FAN_ENCLOSUREID}, fan_enclosure={#FAN_ENCLOSUREID} |
| DataDomain: {#FAN_DESCR} of Enclosure {#FAN_ENCLOSUREID} Status | DATA-DOMAIN-MIB::fanStatus<br>Current status of the fan. | SNMP agent | dell.dd.fan.status[fanStatus.{#SNMPINDEX}]<br>Valuemap: DATA-DOMAIN-MIB::fanStatus<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=fan, enclosure_id={#FAN_ENCLOSUREID}, fan_enclosure={#FAN_ENCLOSUREID} |

#### Trigger prototypes for FAN discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| {#FAN_DESCR} of Enclosure {#FAN_ENCLOSUREID} is in critical state | Please check the fan unit. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.fan.status[fanStatus.{#SNMPINDEX}])={$FAN.STATUS.CRIT:"fail"} or last(/DELL PowerProtect DataDomain SNMP/dell.dd.fan.status[fanStatus.{#SNMPINDEX}])={$FAN.STATUS.CRIT:"notfound"} | Average | Manual close: YES<br>Tag: scope=availability |

### LLD rule FS discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| FS discovery | DATA-DOMAIN-MIB::fileSystemResourceTrapIndex<br>DATA-DOMAIN-MIB::fileSystemResourceName<br>DATA-DOMAIN-MIB::fileSystemResourceTier | SNMP agent | fs.discovery<br>Update: 1h<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for FS discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: {#FS_NAME} of {#FS_TIER} space available | DATA-DOMAIN-MIB::fileSystemSpaceAvail<br>Amount of available space within the file system resource in gigabytes. | SNMP agent | dell.dd.fs.space.avail[fileSystemSpaceAvail.{#SNMPINDEX}]<br>Units: B<br>Preprocessing: Multiplier ×1073741824<br>Tags: component=filesystem, filesystem_name={#FS_NAME}, filesystem_tier={#FS_TIER} |
| DataDomain: {#FS_NAME} of {#FS_TIER} space cleanable | DATA-DOMAIN-MIB::fileSystemSpaceCleanable<br>Amount of cleanable space within the file system resource in gigabytes. | SNMP agent | dell.dd.fs.space.cleanable[fileSystemSpaceCleanable.{#SNMPINDEX}]<br>Units: B<br>Preprocessing: Multiplier ×1073741824<br>Tags: component=filesystem, filesystem_name={#FS_NAME}, filesystem_tier={#FS_TIER} |
| DataDomain: {#FS_NAME} of {#FS_TIER} space size | DATA-DOMAIN-MIB::fileSystemSpaceSize<br>Size of the file system resource in gigabytes. | SNMP agent | dell.dd.fs.space.size[fileSystemSpaceSize.{#SNMPINDEX}]<br>Units: B<br>Preprocessing: Multiplier ×1073741824<br>Tags: component=filesystem, filesystem_name={#FS_NAME}, filesystem_tier={#FS_TIER} |
| DataDomain: {#FS_NAME} of {#FS_TIER} space used in % | DATA-DOMAIN-MIB::fileSystemPercentUsed<br>Percentage of used space within the file system resource. | SNMP agent | dell.dd.fs.space.used.perc[fileSystemPercentUsed.{#SNMPINDEX}]<br>Units: %<br>Tags: component=filesystem, filesystem_name={#FS_NAME}, filesystem_tier={#FS_TIER} |
| DataDomain: {#FS_NAME} of {#FS_TIER} space used | DATA-DOMAIN-MIB::fileSystemSpaceUsed<br>Amount of used space within the file system resource in gigabytes. | SNMP agent | dell.dd.fs.space.used[fileSystemSpaceUsed.{#SNMPINDEX}]<br>Units: B<br>Preprocessing: Multiplier ×1073741824<br>Tags: component=filesystem, filesystem_name={#FS_NAME}, filesystem_tier={#FS_TIER} |

#### Trigger prototypes for FS discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| PowerProtect DataDomain: {#FS_NAME} of {#FS_TIER} Tier space is low | Current value: {ITEM.LASTVALUE1} | max(/DELL PowerProtect DataDomain SNMP/dell.dd.fs.space.used.perc[fileSystemPercentUsed.{#SNMPINDEX}],{$FS.SPACE.TIME})>{$FS.SPACE.WARN} | Warning | Manual close: YES<br>Dependency: space is too low<br>Tag: scope=availability |
| PowerProtect DataDomain: {#FS_NAME} of {#FS_TIER} Tier space is too low | Current value: {ITEM.LASTVALUE1} | max(/DELL PowerProtect DataDomain SNMP/dell.dd.fs.space.used.perc[fileSystemPercentUsed.{#SNMPINDEX}],{$FS.SPACE.TIME})>{$FS.SPACE.CRIT} | High | Manual close: YES<br>Tag: scope=availability |

### LLD rule Network interfaces discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| Network interfaces discovery | Discovering interfaces from IF-MIB. | SNMP agent | net.if.discovery<br>Update: 1h<br>Lifetime: 30d<br>Enabled lifetime type: Disable never<br>Advanced filter on admin/oper status, alias, descr, name, type |

#### Item prototypes for Network interfaces discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: Interface {#IFNAME}({#IFALIAS}) Inbound packets discarded | IF-MIB::ifInDiscards | SNMP agent | dell.dd.net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<br>Update: 3m<br>Preprocessing: Change per second<br>Tags: component=network, interface={#IFNAME} |
| DataDomain: Interface {#IFNAME}({#IFALIAS}) Inbound packets with errors | IF-MIB::ifInErrors | SNMP agent | dell.dd.net.if.in.errors[ifInErrors.{#SNMPINDEX}]<br>Update: 3m<br>Preprocessing: Change per second<br>Tags: component=network, interface={#IFNAME} |
| DataDomain: Interface {#IFNAME}({#IFALIAS}) bits received | IF-MIB::ifHCInOctets (64-bit) | SNMP agent | dell.dd.net.if.in[ifHCInOctets.{#SNMPINDEX}]<br>Update: 3m<br>Units: bps<br>Preprocessing: Change per second, Multiplier ×8<br>Tags: component=network, interface={#IFNAME} |
| DataDomain: Interface {#IFNAME}({#IFALIAS}) Outbound packets discarded | IF-MIB::ifOutDiscards | SNMP agent | dell.dd.net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<br>Update: 3m<br>Preprocessing: Change per second<br>Tags: component=network, interface={#IFNAME} |
| DataDomain: Interface {#IFNAME}({#IFALIAS}) Outbound packets with errors | IF-MIB::ifOutErrors | SNMP agent | dell.dd.net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<br>Update: 3m<br>Preprocessing: Change per second<br>Tags: component=network, interface={#IFNAME} |
| DataDomain: Interface {#IFNAME}({#IFALIAS}) bits sent | IF-MIB::ifHCOutOctets (64-bit) | SNMP agent | dell.dd.net.if.out[ifHCOutOctets.{#SNMPINDEX}]<br>Update: 3m<br>Units: bps<br>Preprocessing: Change per second, Multiplier ×8<br>Tags: component=network, interface={#IFNAME} |
| DataDomain: Interface {#IFNAME}({#IFALIAS}) Speed | IF-MIB::ifHighSpeed | SNMP agent | dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}]<br>Update: 5m<br>Units: bps<br>Preprocessing: Multiplier ×1000000, Discard unchanged with heartbeat 1h<br>Tags: component=network, interface={#IFNAME} |
| DataDomain: Interface {#IFNAME}({#IFALIAS}) Operational status | IF-MIB::ifOperStatus | SNMP agent | dell.dd.net.if.status[ifOperStatus.{#SNMPINDEX}]<br>Valuemap: IF-MIB::ifOperStatus<br>Tags: component=network, interface={#IFNAME} |
| DataDomain: Interface {#IFNAME}({#IFALIAS}) Interface type | IF-MIB::ifType | SNMP agent | dell.dd.net.if.type[ifType.{#SNMPINDEX}]<br>Update: 3m<br>Valuemap: IF-MIB::ifType<br>Preprocessing: Discard unchanged with heartbeat 1d<br>Tags: component=network, interface={#IFNAME} |

#### Trigger prototypes for Network interfaces discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| Interface {#IFNAME}({#IFALIAS}): Link down | This trigger expression works as follows:<br>1. Can be triggered if operations status is down.<br>2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important.<br>3. diff()=1 - trigger fires only if operational status was up(1) sometime before.<br>WARNING: if closed manually - won't fire again on next poll. | {$IFCONTROL:"{#IFNAME}"}=1 and last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.status[ifOperStatus.{#SNMPINDEX}])=2 and (last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.status[ifOperStatus.{#SNMPINDEX}],#1)<>last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.status[ifOperStatus.{#SNMPINDEX}],#2)) | Average | Recovery expression: last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.status[ifOperStatus.{#SNMPINDEX}])<>2 or {$IFCONTROL:"{#IFNAME}"}=0<br>Manual close: YES<br>Tag: scope=availability |
| Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before | This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close. | change(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}])<0 and last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}])>0 and (last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.type[ifType.{#SNMPINDEX}])=6 or last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.type[ifType.{#SNMPINDEX}])=7 or last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.type[ifType.{#SNMPINDEX}])=11 or last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.type[ifType.{#SNMPINDEX}])=62 or last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.type[ifType.{#SNMPINDEX}])=69 or last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.type[ifType.{#SNMPINDEX}])=117) and (last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.status[ifOperStatus.{#SNMPINDEX}])<>2) | Information | Recovery expression: (change(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}])>0 and last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}],#2)>0) or (last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.status[ifOperStatus.{#SNMPINDEX}])=2)<br>Manual close: YES<br>Dependency: Interface {#IFNAME}({#IFALIAS}): Link down<br>Tag: scope=performance |
| Interface {#IFNAME}({#IFALIAS}): High bandwidth usage | The network interface utilization is close to its estimated maximum bandwidth. | (avg(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.in[ifHCInOctets.{#SNMPINDEX}],15m)>({$IF.UTIL.MAX:"{#IFNAME}"}/100)*last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}]) or avg(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.out[ifHCOutOctets.{#SNMPINDEX}],15m)>({$IF.UTIL.MAX:"{#IFNAME}"}/100)*last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}])) and last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}])>0 | Warning | Recovery expression: avg(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.in[ifHCInOctets.{#SNMPINDEX}],15m)<(({$IF.UTIL.MAX:"{#IFNAME}"}-3)/100)*last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}]) and avg(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.out[ifHCOutOctets.{#SNMPINDEX}],15m)<(({$IF.UTIL.MAX:"{#IFNAME}"}-3)/100)*last(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.speed[ifHighSpeed.{#SNMPINDEX}])<br>Manual close: YES<br>Dependency: Interface {#IFNAME}({#IFALIAS}): Link down<br>Tag: scope=performance |
| Interface {#IFNAME}({#IFALIAS}): High error rate | Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold | min(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.in.errors[ifInErrors.{#SNMPINDEX}],5m)>{$IF.ERRORS.WARN:"{#IFNAME}"} or min(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.out.errors[ifOutErrors.{#SNMPINDEX}],5m)>{$IF.ERRORS.WARN:"{#IFNAME}"} | Warning | Recovery expression: max(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.in.errors[ifInErrors.{#SNMPINDEX}],5m)<{$IF.ERRORS.WARN:"{#IFNAME}"}*0.8 and max(/DELL PowerProtect DataDomain SNMP/dell.dd.net.if.out.errors[ifOutErrors.{#SNMPINDEX}],5m)<{$IF.ERRORS.WARN:"{#IFNAME}"}*0.8<br>Manual close: YES<br>Dependency: Interface {#IFNAME}({#IFALIAS}): Link down<br>Tags: scope=availability, performance |

### LLD rule NVRAM BBU Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| NVRAM BBU Discovery | DATA-DOMAIN-MIB::nvramBatteryIndex | SNMP agent | nvram.bbu.discovery<br>Update: 1h<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for NVRAM BBU Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: Battery Unit {#BBU_INDEX} Charge | DATA-DOMAIN-MIB::nvramBatteryCharge<br>NVRAM Battery charge percentage. | SNMP agent | dell.dd.nvram.bbu.charge[nvramBatteryCharge.{#SNMPINDEX}]<br>Units: %<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: battery_id={#BBU_INDEX}, component=bbu, component=nvram |
| DataDomain: Battery Unit {#BBU_INDEX} Status | DATA-DOMAIN-MIB::nvramBatteryStatus<br>NVRAM Battery Status. | SNMP agent | dell.dd.nvram.bbu.status[nvramBatteryStatus.{#SNMPINDEX}]<br>Valuemap: DATA-DOMAIN-MIB::nvramBatteryStatus<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: battery_id={#BBU_INDEX}, component=bbu, component=nvram |

#### Trigger prototypes for NVRAM BBU Discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| Battery Unit {#BBU_INDEX} have low charge |  | last(/DELL PowerProtect DataDomain SNMP/dell.dd.nvram.bbu.charge[nvramBatteryCharge.{#SNMPINDEX}])<{$NVRAM.BATTERY.CHARGE.WARN} | Warning | Manual close: YES<br>Tag: scope=availability |
| Battery Unit {#BBU_INDEX} is in critical state | Please check the device for faults. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.nvram.bbu.status[nvramBatteryStatus.{#SNMPINDEX}])={$NVRAM.BATTERY.STATUS.CRIT} | Average | Manual close: YES<br>Tag: scope=availability |
| Battery Unit {#BBU_INDEX} is in warning state | Please check the device for faults. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.nvram.bbu.status[nvramBatteryStatus.{#SNMPINDEX}])={$NVRAM.BATTERY.STATUS.WARN:"disabled"} or last(/DELL PowerProtect DataDomain SNMP/dell.dd.nvram.bbu.status[nvramBatteryStatus.{#SNMPINDEX}])={$NVRAM.BATTERY.STATUS.WARN:"softdisabled"} | Warning | Manual close: YES<br>Dependency: Battery Unit {#BBU_INDEX} is in critical state<br>Tag: scope=availability |
| Battery Unit {#BBU_INDEX} is not in optimal state | Please check the device for faults. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.nvram.bbu.status[nvramBatteryStatus.{#SNMPINDEX}])<>{$NVRAM.BATTERY.STATUS.OK} | Warning | Manual close: YES<br>Dependencies: critical state, warning state<br>Tag: scope=availability |

### LLD rule NVRAM Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| NVRAM Discovery | DATA-DOMAIN-MIB::nvramPropertiesIndex | SNMP agent | nvram.discovery<br>Update: 1h<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for NVRAM Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: NVRAM {#NVRAM_INDEX} total memory | DATA-DOMAIN-MIB::nvramHCMemorySize<br>The size of an NVRAM entity's memory in bytes. | SNMP agent | dell.dd.nvram.HCMemorySize[nvramHCMemorySize.{#SNMPINDEX}]<br>Units: B<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=nvram, nvram_id={#NVRAM_INDEX} |
| DataDomain: NVRAM {#NVRAM_INDEX} Memory Errors | DATA-DOMAIN-MIB::nvramMemoryErrorCount<br>Number of Memory Errors Encountered on NVRAM Card. | SNMP agent | dell.dd.nvram.MemoryErrorCount[nvramMemoryErrorCount.{#SNMPINDEX}]<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=nvram, nvram_id={#NVRAM_INDEX} |
| DataDomain: NVRAM {#NVRAM_INDEX} PCI Errors | DATA-DOMAIN-MIB::nvramPCIErrorCount<br>Number of PCI Errors Encountered on NVRAM Card. | SNMP agent | dell.dd.nvram.PCIErrorCount[nvramPCIErrorCount.{#SNMPINDEX}]<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=nvram, nvram_id={#NVRAM_INDEX} |

#### Trigger prototypes for NVRAM Discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| Memory Error on NVRAM {#NVRAM_INDEX} | Please check NVRAM | last(/DELL PowerProtect DataDomain SNMP/dell.dd.nvram.MemoryErrorCount[nvramMemoryErrorCount.{#SNMPINDEX}])<>0 | Average | Manual close: YES<br>Tag: scope=availability |
| PCI Error on NVRAM {#NVRAM_INDEX} | Please check NVRAM | last(/DELL PowerProtect DataDomain SNMP/dell.dd.nvram.PCIErrorCount[nvramPCIErrorCount.{#SNMPINDEX}])<>0 | Average | Manual close: YES<br>Tag: scope=availability |

### LLD rule Ports Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| Ports Discovery | DATA-DOMAIN-MIB::systemPortsPort<br>DATA-DOMAIN-MIB::systemPortsConnectionType<br>DATA-DOMAIN-MIB::systemPortsLinkSpeed | SNMP agent | ports.discovery<br>Update: 1h<br>Filter: {#PORT_LINK} matches .*bps.*<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for Ports Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: {#PORT} ({#PORT_TYPE}) Link Speed | DATA-DOMAIN-MIB::systemPortsLinkSpeed<br>System port link speed. | SNMP agent | dell.dd.port.link.speed[systemPortsLinkSpeed.{#SNMPINDEX}]<br>Value type: Char<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=ports, ports={#PORT_TYPE} |

#### Trigger prototypes for Ports Discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| {#PORT} ({#PORT_TYPE}) Link Speed changed | Please check the port link. | change(/DELL PowerProtect DataDomain SNMP/dell.dd.port.link.speed[systemPortsLinkSpeed.{#SNMPINDEX}])<>0 or length(last(/DELL PowerProtect DataDomain SNMP/dell.dd.port.link.speed[systemPortsLinkSpeed.{#SNMPINDEX}]))=0 | Average | Manual close: YES<br>Tag: scope=availability |

### LLD rule PSU Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| PSU Discovery | DATA-DOMAIN-MIB::powerEnclosureID<br>DATA-DOMAIN-MIB::powerModuleDescription | SNMP agent | psu.discovery<br>Update: 1h<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for PSU Discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: {#PSU_DESCR} of Enclosure {#PSU_ENCLOSUREID} status | DATA-DOMAIN-MIB::powerModuleStatus<br>Current enclosure Power Module status. | SNMP agent | dell.dd.psu.status[powerModuleStatus.{#SNMPINDEX}]<br>Valuemap: DATA-DOMAIN-MIB::powerModuleStatus<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=psu, enclosure_id={#PSU_ENCLOSUREID}, psu_enclosure={#PSU_ENCLOSUREID} |

#### Trigger prototypes for PSU Discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| {#PSU_DESCR} of Enclosure {#PSU_ENCLOSUREID} is in critical state | Please check the power supply unit for errors. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.psu.status[powerModuleStatus.{#SNMPINDEX}])={$PSU.STATUS.CRIT:"acnone"} or last(/DELL PowerProtect DataDomain SNMP/dell.dd.psu.status[powerModuleStatus.{#SNMPINDEX}])={$PSU.STATUS.CRIT:"failed"} or last(/DELL PowerProtect DataDomain SNMP/dell.dd.psu.status[powerModuleStatus.{#SNMPINDEX}])={$PSU.STATUS.CRIT:"faulty"} | Average | Manual close: YES |
| {#PSU_DESCR} of Enclosure {#PSU_ENCLOSUREID} is in warning state | Please check the power supply unit for errors. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.psu.status[powerModuleStatus.{#SNMPINDEX}])={$PSU.STATUS.WARN:"absent"} or last(/DELL PowerProtect DataDomain SNMP/dell.dd.psu.status[powerModuleStatus.{#SNMPINDEX}])={$PSU.STATUS.WARN:"unknown"} | Warning | Manual close: YES |

### LLD rule Temperature discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| Temperature discovery | DATA-DOMAIN-MIB::tempEnclosureID<br>DATA-DOMAIN-MIB::tempSensorDescription | SNMP agent | temperature.discovery<br>Update: 10m<br>Filter on {$TEMP.SENSOR.ENCLOSURE.MATCHES}/NOT_MATCHES<br>Preprocessing: Discard unchanged with heartbeat 6h |

#### Item prototypes for Temperature discovery

| Name | Description | Type | Key and additional info |
|------|-------------|------|-------------------------|
| DataDomain: "{#TEMP_DESCR}" of Enclosure {#TEMP_ENCLOSUREID} status | DATA-DOMAIN-MIB::tempSensorStatus<br>Current status of the sensor. | SNMP agent | dell.dd.temp.status[tempSensorStatus.{#SNMPINDEX}]<br>Valuemap: DATA-DOMAIN-MIB::tempSensorStatus<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=temperature, enclosure_id={#TEMP_ENCLOSUREID}, temp_enclosure={#TEMP_ENCLOSUREID} |
| DataDomain: "{#TEMP_DESCR}" of Enclosure {#TEMP_ENCLOSUREID} value | DATA-DOMAIN-MIB::tempSensorCurrentValue<br>Current Temperature Value of the sensor. | SNMP agent | dell.dd.temp.value[tempSensorCurrentValue.{#SNMPINDEX}]<br>Units: °C<br>Preprocessing: Discard unchanged with heartbeat 6h<br>Tags: component=temperature, enclosure_id={#TEMP_ENCLOSUREID}, temp_enclosure={#TEMP_ENCLOSUREID} |

#### Trigger prototypes for Temperature discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
|------|-------------|------------|----------|---------------------------------|
| "{#TEMP_DESCR}" of Enclosure {#TEMP_ENCLOSUREID} is in critical status | Please check the device for faults. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.temp.status[tempSensorStatus.{#SNMPINDEX}])={$TEMP.SENSOR.STATUS.CRIT:"overheatCritical"} or last(/DELL PowerProtect DataDomain SNMP/dell.dd.temp.status[tempSensorStatus.{#SNMPINDEX}])={$TEMP.SENSOR.STATUS.CRIT:"failed"} | Average | Manual close: YES<br>Tag: scope=availability |
| "{#TEMP_DESCR}" of Enclosure {#TEMP_ENCLOSUREID} is not in optimal status | Please check the device for faults. | last(/DELL PowerProtect DataDomain SNMP/dell.dd.temp.status[tempSensorStatus.{#SNMPINDEX}])<>{$TEMP.SENSOR.STATUS.OK} | Warning | Manual close: YES<br>Dependency: critical status<br>Tag: scope=availability |

