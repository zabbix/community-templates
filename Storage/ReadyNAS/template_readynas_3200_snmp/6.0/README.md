# SNMP ReadyNas 3200

## Overview

Monitor NETGEAR ReadyNAS 3200 storage devices via SNMP. It monitors these items:


1. Disk info
2. Disk State
3. Disk Temperature
4. Fan RPM
5. Volume Free Space
6. Volume Size
7. VolumeStatus


Disks and volumes are searching by lld.Appropriate triggers for each item are also provided.


I have created and tested this template vs Zabbix 3.2.4. 


<p style="margin: 0px 0px 1.5em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background

## Author

Nikolay Kulikov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery_Disk|<p>-</p>|`SNMP agent`|Disk<p>Update: 600</p>|
|Discovery_Volume|<p>-</p>|`SNMP agent`|Volume<p>Update: 600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPUFAN_RPM|<p>-</p>|`SNMP agent`|cpu_fan_RPM<p>Update: 30</p>|
|Sys2FAN_RPM|<p>-</p>|`SNMP agent`|sys2_fan_RPM<p>Update: 30</p>|
|Sys1FAN_RPM|<p>-</p>|`SNMP agent`|sys1_fan_RPM<p>Update: 30</p>|
|CPU temp|<p>CPU temp</p>|`SNMP agent`|cputemp<p>Update: 30</p>|
|Firmware version|<p>-</p>|`SNMP agent`|nasMgrSoftwareVersion<p>Update: 30</p>|
|Sys temp|<p>CPU temp</p>|`SNMP agent`|systemp<p>Update: 30</p>|
|Sys3FAN_RPM|<p>-</p>|`SNMP agent`|sys3_fan_RPM<p>Update: 30</p>|
|System uptime|<p>-</p>|`SNMP agent`|sysUptime<p>Update: 30</p>|
|[{#SNMPVALUE}]_DiskInfo|<p>-</p>|`SNMP agent`|DiskInfo[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|[{#SNMPVALUE}]_DiskState|<p>-</p>|`SNMP agent`|DiskState[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|[{#SNMPVALUE}]_DiskTemperature|<p>-</p>|`SNMP agent`|DiskTemperature[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|[{#SNMPVALUE}]_VolumeFreeSpace|<p>-</p>|`SNMP agent`|volumeFreeSpace[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|[{#SNMPVALUE}]_VolumeName|<p>-</p>|`SNMP agent`|volumeName[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|[{#SNMPVALUE}]_volumeRAIDLevel|<p>-</p>|`SNMP agent`|volumeRAIDLevel[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|[{#SNMPVALUE}]_VolumeSize|<p>-</p>|`SNMP agent`|volumeSize[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|[{#SNMPVALUE}]_VolumeStatus|<p>-</p>|`SNMP agent`|volumeStatus[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Disk [{#SNMPVALUE}] on {HOST.NAME} is not ok|<p>-</p>|<p>**Expression**: find(/SNMP ReadyNas 3200/DiskState[{#SNMPVALUE}],,"regexp","(ok)")<>1</p><p>**Recovery expression**: </p>|disaster|
|Temperature Disk [{#SNMPVALUE}] is High on {HOST.NAME}|<p>Disk temp is more than 50C</p>|<p>**Expression**: last(/SNMP ReadyNas 3200/DiskTemperature[{#SNMPVALUE}])>122</p><p>**Recovery expression**: </p>|high|
|Volume[{#SNMPVALUE}] on {HOST.NAME} is not ok|<p>-</p>|<p>**Expression**: find(/SNMP ReadyNas 3200/volumeStatus[{#SNMPVALUE}],,"regexp","(ok)")<>1</p><p>**Recovery expression**: </p>|disaster|
|Volume {#SNMPVALUE} - FreeSpace is less than 10% on {HOST.NAME}|<p>-</p>|<p>**Expression**: (last(/SNMP ReadyNas 3200/volumeFreeSpace[{#SNMPVALUE}]) / last(/SNMP ReadyNas 3200/volumeSize[{#SNMPVALUE}]) * 100) < 10</p><p>**Recovery expression**: </p>|high|
|Disk [{#SNMPVALUE}] on {HOST.NAME} is not ok (LLD)|<p>-</p>|<p>**Expression**: find(/SNMP ReadyNas 3200/DiskState[{#SNMPVALUE}],,"regexp","(ok)")<>1</p><p>**Recovery expression**: </p>|disaster|
|Temperature Disk [{#SNMPVALUE}] is High on {HOST.NAME} (LLD)|<p>Disk temp is more than 50C</p>|<p>**Expression**: last(/SNMP ReadyNas 3200/DiskTemperature[{#SNMPVALUE}])>122</p><p>**Recovery expression**: </p>|high|
|Volume[{#SNMPVALUE}] on {HOST.NAME} is not ok (LLD)|<p>-</p>|<p>**Expression**: find(/SNMP ReadyNas 3200/volumeStatus[{#SNMPVALUE}],,"regexp","(ok)")<>1</p><p>**Recovery expression**: </p>|disaster|
|Volume {#SNMPVALUE} - FreeSpace is less than 10% on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: (last(/SNMP ReadyNas 3200/volumeFreeSpace[{#SNMPVALUE}]) / last(/SNMP ReadyNas 3200/volumeSize[{#SNMPVALUE}]) * 100) < 10</p><p>**Recovery expression**: </p>|high|
