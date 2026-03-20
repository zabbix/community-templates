# Huawei DiskArray Monitor

## Description

Huawei_DiskArray_monitor_template Known Issues: device : OceanStor-2600, OceanStor-5300, OceanStor-5600, OceanStor-6800, OceanStor-Dorado6000

## Overview

Monitor Template of Huawei OceanStor DiskArray.


Suitable for OceanStor-2600, OceanStor-5300, OceanStor-5600, OceanStor-6800, OceanStor-Dorado6000.


Include health status of controller, disk, fan and power.


Repalce macro {$CLOUD\_SNMP\_COMMUNITY} with your snmp community



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
|Power Discovery|<p>-</p>|`SNMP agent`|PowerDiscovery<p>Update: 12h</p>|
|Controller Discovery|<p>-</p>|`SNMP agent`|ControllerDiscovery<p>Update: 12h</p>|
|Disk Discovery|<p>-</p>|`SNMP agent`|DiskDiscovery<p>Update: 12h</p>|
|Fan Discovery|<p>-</p>|`SNMP agent`|FanDiscovery<p>Update: 12h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PowerHealthStatus {#SNMPVALUE}|<p>-</p>|`SNMP agent`|PowerHealthStatus.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|ControllerHealthStatus {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ControllerHealthStatus.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DiskHealthStatus {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DiskHealthStatus.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|FanHealthStatus {#SNMPVALUE}|<p>-</p>|`SNMP agent`|FanHealthStatus.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Controller Abnormal|<p>-</p>|<p>**Expression**: last(/Huawei_DiskArray_monitor/ControllerHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Disk Abnormal|<p>-</p>|<p>**Expression**: last(/Huawei_DiskArray_monitor/DiskHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Fan Abnormal|<p>-</p>|<p>**Expression**: last(/Huawei_DiskArray_monitor/FanHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Power Abnormal|<p>-</p>|<p>**Expression**: last(/Huawei_DiskArray_monitor/PowerHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Power Abnormal (LLD)|<p>-</p>|<p>**Expression**: last(/Huawei_DiskArray_monitor/PowerHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Controller Abnormal (LLD)|<p>-</p>|<p>**Expression**: last(/Huawei_DiskArray_monitor/ControllerHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Disk Abnormal (LLD)|<p>-</p>|<p>**Expression**: last(/Huawei_DiskArray_monitor/DiskHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Fan Abnormal (LLD)|<p>-</p>|<p>**Expression**: last(/Huawei_DiskArray_monitor/FanHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
