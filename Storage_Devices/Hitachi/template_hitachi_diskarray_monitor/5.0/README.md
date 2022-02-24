# Hitachi DiskArray Monitor

## Description

Hitachi_DiskArray_monitor_template Known Issues: device : G200，G400，G800

## Overview

Monitor Template of Hitachi DiskArray


Suitable for G200, G400, G800


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
|DKC Discovery|<p>-</p>|`SNMP agent`|DKCDiscovery<p>Update: 12h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DKC Battery Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKCBatteryCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKC Cache Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKCCacheCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKC Environment Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKCEnvironmentCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKC Fan Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKCFanCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKC Internal Bus Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKCInternalBusCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKC Power Supply Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKCPowerSupplyCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKC Processor Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKCProcessorCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKC Shared Memory Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKCSharedMemoryCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKU Drive Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKUDriveCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKU Environment Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKUEnvironmentCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKU Fan Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKUFanCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|DKU Power Supply Condition {#SNMPVALUE}|<p>-</p>|`SNMP agent`|DKUPowerSupplyCondition.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|DKC Battery Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCBatteryCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Cache Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCCacheCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Environment Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCEnvironmentCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Fan Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCFanCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Internal Bus Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCInternalBusCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Power Supply Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCPowerSupplyCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Processor Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCProcessorCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Shared Memory Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCSharedMemoryCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKU Drive Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKUDriveCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKU Environment Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKUEnvironmentCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKU Fan Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKUFanCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKU Power Supply Abnormal|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKUPowerSupplyCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Battery Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCBatteryCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Cache Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCCacheCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Environment Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCEnvironmentCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Fan Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCFanCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Internal Bus Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCInternalBusCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Power Supply Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCPowerSupplyCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Processor Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCProcessorCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKC Shared Memory Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKCSharedMemoryCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKU Drive Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKUDriveCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKU Environment Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKUEnvironmentCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKU Fan Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKUFanCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|DKU Power Supply Abnormal (LLD)|<p>-</p>|<p>**Expression**: {Hitachi_DiskArray_monitor:DKUPowerSupplyCondition.[{#SNMPINDEX}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
