# H3C RackServer Monitor

## Description

H3C_RackServer_monitor_template Known Issues: device : UIS-Cell-3030-G3,UniServer-R4900

## Overview

Monitor Template of H3C RackServer .


Suitable for UIS-Cell-3030-G3,UniServer-R4900.


Include health status of CPU, disk, entity, fan, memory, PCIE, power.


Repalce <span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-image: initial; background-posit



## Author

zhangzhefeng

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CLOUD_SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory Discovery|<p>-</p>|`SNMP agent`|MemoryDiscovery<p>Update: 1h</p>|
|CPU Discovery|<p>-</p>|`SNMP agent`|CPUDiscovery<p>Update: 1h</p>|
|PCIE Discovery|<p>-</p>|`SNMP agent`|NetCardDiscovery<p>Update: 1h</p>|
|Disk Discovery|<p>-</p>|`SNMP agent`|DisckDiscovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Entity Health Status|<p>-</p>|`SNMP agent`|hh3cEntityHealthStatus<p>Update: 10m</p>|
|Fan Health Status|<p>-</p>|`SNMP agent`|hh3cFanHealthStatus<p>Update: 10m</p>|
|Power Health Status|<p>-</p>|`SNMP agent`|hh3cPwrHealthStatus<p>Update: 10m</p>|
|Memory  Status {#SNMPVALUE}|<p>-</p>|`SNMP agent`|MemoryStatus.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|CPU Status [{#SNMPVALUE}]|<p>-</p>|`SNMP agent`|CPUStatus.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|PCIE Status Slot[{#SNMPVALUE}]|<p>-</p>|`SNMP agent`|NetCardStatus.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Disk Status [{#SNMPVALUE}]|<p>-</p>|`SNMP agent`|DiskStatus.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CPU Abnormal|<p>-</p>|<p>**Expression**: last(/H3C_RackServer_monitor/CPUStatus.[{#SNMPINDEX}],#1)=0</p><p>**Recovery expression**: </p>|high|
|Disk Abnormal|<p>-</p>|<p>**Expression**: find(/H3C_RackServer_monitor/DiskStatus.[{#SNMPINDEX}],#1,"iregexp","FAILED")=1</p><p>**Recovery expression**: </p>|high|
|Memory  Abnormal|<p>-</p>|<p>**Expression**: last(/H3C_RackServer_monitor/MemoryStatus.[{#SNMPINDEX}],#1)=2</p><p>**Recovery expression**: </p>|high|
|PCIE Abnormal|<p>-</p>|<p>**Expression**: last(/H3C_RackServer_monitor/NetCardStatus.[{#SNMPINDEX}],#1)=1</p><p>**Recovery expression**: </p>|high|
|Memory  Abnormal (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_RackServer_monitor/MemoryStatus.[{#SNMPINDEX}],#1)=2</p><p>**Recovery expression**: </p>|high|
|CPU Abnormal (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_RackServer_monitor/CPUStatus.[{#SNMPINDEX}],#1)=0</p><p>**Recovery expression**: </p>|high|
|PCIE Abnormal (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_RackServer_monitor/NetCardStatus.[{#SNMPINDEX}],#1)=1</p><p>**Recovery expression**: </p>|high|
|Disk Abnormal (LLD)|<p>-</p>|<p>**Expression**: find(/H3C_RackServer_monitor/DiskStatus.[{#SNMPINDEX}],#1,"iregexp","FAILED")=1</p><p>**Recovery expression**: </p>|high|
