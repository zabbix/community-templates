# MIB Asustor

## Overview

SNMP Template for Asustor Storages.


On the device, download the MIB on the device page, enable SNMP support.


Import template on Zabbix and set host and {$SNMP\_COMMUNITY} Macro.


 


Tested on Zabbix 4.0.17 and with Asustor AS6104T.



## Author

Jonatan Gobbato

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Volume Discovery|<p>-</p>|`SNMP agent`|volume.discovery<p>Update: 5m</p>|
|Disk Discovery|<p>-</p>|`SNMP agent`|disk.discovery<p>Update: 5m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|sysSerialNumber|<p>-</p>|`SNMP agent`|sysSerialNumber<p>Update: 5m</p>|
|hwCPUTemperature|<p>-</p>|`SNMP agent`|hwCPUTemperature<p>Update: 5m</p>|
|sysUptime|<p>-</p>|`SNMP agent`|sysUptime<p>Update: 5m</p>|
|sysADMVersion|<p>-</p>|`SNMP agent`|sysADMVersion<p>Update: 5m</p>|
|hwSysTemperature|<p>-</p>|`SNMP agent`|hwSysTemperature<p>Update: 5m</p>|
|hwmodelName|<p>-</p>|`SNMP agent`|hwmodelName<p>Update: 5m</p>|
|sysUpgradeAvailable|<p>-</p>|`SNMP agent`|sysUpgradeAvailable<p>Update: 5m</p>|
|sysBiosVersion|<p>-</p>|`SNMP agent`|sysBiosVersion<p>Update: 5m</p>|
|Volume {#VOLUMEINDEX} Free Size|<p>-</p>|`SNMP agent`|VolumeFreeSize[{#VOLUMEINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Volume {#VOLUMEINDEX} Name|<p>-</p>|`SNMP agent`|VolumeName[{#VOLUMEINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Volume {#VOLUMEINDEX} RAID|<p>-</p>|`SNMP agent`|VolumeRaid[{#VOLUMEINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Volume {#VOLUMEINDEX} Status|<p>-</p>|`SNMP agent`|VolumeStatus[{#VOLUMEINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Volume {#VOLUMEINDEX} Total Size|<p>-</p>|`SNMP agent`|VolumeTotalSize[{#VOLUMEINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Disk {#DISKINDEX} Model|<p>-</p>|`SNMP agent`|DiskModel[{#DISKINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Disk {#DISKINDEX} Status|<p>-</p>|`SNMP agent`|DiskStatus[{#DISKINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Disk {#DISKINDEX} Temperature|<p>-</p>|`SNMP agent`|DiskTemperature[{#DISKINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Disk {#DISKINDEX} High Temperature|<p>-</p>|<p>**Expression**: {MIB Asustor:DiskTemperature[{#DISKINDEX}].avg(5m)}>=55</p><p>**Recovery expression**: {MIB Asustor:DiskTemperature[{#DISKINDEX}].max(5m)}<50</p>|high|
|Disk {#DISKINDEX} Status is Bad|<p>-</p>|<p>**Expression**: {MIB Asustor:DiskStatus[{#DISKINDEX}].str(Bad)}=1</p><p>**Recovery expression**: </p>|disaster|
|Disk {#DISKINDEX} Status is Dangerous|<p>-</p>|<p>**Expression**: {MIB Asustor:DiskStatus[{#DISKINDEX}].str(Dangerous)}=1</p><p>**Recovery expression**: </p>|high|
|Disk {#DISKINDEX} Status is Risky|<p>-</p>|<p>**Expression**: {MIB Asustor:DiskStatus[{#DISKINDEX}].str(Risky)}=1</p><p>**Recovery expression**: </p>|average|
|Disk {#DISKINDEX} High Temperature (LLD)|<p>-</p>|<p>**Expression**: {MIB Asustor:DiskTemperature[{#DISKINDEX}].avg(5m)}>=55</p><p>**Recovery expression**: {MIB Asustor:DiskTemperature[{#DISKINDEX}].max(5m)}<50</p>|high|
|Disk {#DISKINDEX} Status is Bad (LLD)|<p>-</p>|<p>**Expression**: {MIB Asustor:DiskStatus[{#DISKINDEX}].str(Bad)}=1</p><p>**Recovery expression**: </p>|disaster|
|Disk {#DISKINDEX} Status is Dangerous (LLD)|<p>-</p>|<p>**Expression**: {MIB Asustor:DiskStatus[{#DISKINDEX}].str(Dangerous)}=1</p><p>**Recovery expression**: </p>|high|
|Disk {#DISKINDEX} Status is Risky (LLD)|<p>-</p>|<p>**Expression**: {MIB Asustor:DiskStatus[{#DISKINDEX}].str(Risky)}=1</p><p>**Recovery expression**: </p>|average|
