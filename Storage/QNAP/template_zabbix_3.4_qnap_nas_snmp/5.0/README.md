# Template SNMP QNAP NAS

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HD_TEMPERATURE_ALARM}|<p>-</p>|`51`|Text macro|
|{$HD_TEMPERATURE_WARNING}|<p>-</p>|`45`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System fans discovery|<p>-</p>|`SNMP agent`|sysFans.discovery<p>Update: 3600</p>|
|Network interfaces discovery|<p>-</p>|`SNMP agent`|netIfs.discovery<p>Update: 3600</p>|
|Volumes discovery|<p>-</p>|`SNMP agent`|sysVolumes.discovery<p>Update: 3600</p>|
|Hard disks discovery|<p>-</p>|`SNMP agent`|sysHDs.discovery<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System uptime|<p>-</p>|`SNMP agent`|system.uptime[sysUpTime]<p>Update: 30s</p>|
|Device hardware revision|<p>-</p>|`SNMP agent`|PhysicalHardwareRev<p>Update: 10800</p>|
|Device vendor name|<p>-</p>|`SNMP agent`|sysPhysicalMfgName<p>Update: 3600</p>|
|Device software revision|<p>-</p>|`SNMP agent`|PhysicalSoftwareRev<p>Update: 3600</p>|
|CPU temperature|<p>CPU temperature in centigrade</p>|`SNMP agent`|CPU-TemperatureEX<p>Update: 60</p>|
|System free memory|<p>-</p>|`SNMP agent`|SystemFreeMemEX<p>Update: 60</p>|
|System free memory (%)|<p>-</p>|`Calculated`|SystemPFreeMemEX<p>Update: 60</p>|
|System temperature|<p>System temperature in centigrade</p>|`SNMP agent`|SystemTemperatureEX<p>Update: 60</p>|
|System total memory|<p>-</p>|`SNMP agent`|SystemTotalMemEX<p>Update: 10800</p>|
|Device firmware revision|<p>-</p>|`SNMP agent`|PhysicalFirmwareRev<p>Update: 3600</p>|
|Device model name|<p>-</p>|`SNMP agent`|ModelNameEX<p>Update: 10800</p>|
|CPU usage|<p>System CPU usage</p>|`SNMP agent`|SystemCPU-UsageEX<p>Update: 60</p>|
|Device system name|<p>Host name</p>|`SNMP agent`|HostNameEX<p>Update: 3600</p>|
|Speed of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SysFanSpeedEX[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Error $2 on $1|<p>-</p>|`SNMP agent`|net.if.err[{#SNMPVALUE},bps]<p>Update: 60</p><p>LLD</p>|
|Recived $2 on $1|<p>-</p>|`SNMP agent`|net.if.in[{#SNMPVALUE}, bps]<p>Update: 60</p><p>LLD</p>|
|Sent $2 on $1|<p>-</p>|`SNMP agent`|net.if.out[{#SNMPVALUE}, bps]<p>Update: 60</p><p>LLD</p>|
|Free size of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SysVolumeFreeSizeEX[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Free size of {#SNMPVALUE} (%)|<p>-</p>|`Calculated`|SysVolumePFreeSizeEX[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Status of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SysVolumeStatusEX[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Total size of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SysVolumeTotalSizeEX[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Capacity of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|HdCapacityEX[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Model of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|HdModelEX[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|S.M.A.R.T. info of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|HdSmartInfoEX[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Status of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|HdStatusEX[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Temperature of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|HdTemperatureEX[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|SMART state of {#SNMPVALUE} on {HOST.NAME} is ABNORMAL|<p>Abnormal 1. Any SMART value is equal or less than trhreshold. 2. Hard Disk temperature is higher than 65 degree C. -------- QNAP Knowledgebase</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdSmartInfoEX[{#SNMPINDEX}].iregexp(abnormal)}=1</p><p>**Recovery expression**: </p>|average|
|SMART state of {#SNMPVALUE} on {HOST.NAME} is not GOOD ({ITEM.VALUE1})|<p>Normal 1. Any Smart value is equal or less than threhold + (initial_SMART_value - threhold)/2. For example, if the initial SMART value is 100, the current value is 50, the threshold is 20, then the Smart value, 50, is less than 20+(100-20)/2. Thus, the health level would be Normal. 2. Any SMART test(Rapid or Complete) result of last 20 times is abnormal. 3. Hard Disk temperature is between 55 to 65 degree C. -------- QNAP Knowledgebase</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdSmartInfoEX[{#SNMPINDEX}].iregexp(normal)}=1</p><p>**Recovery expression**: </p>|warning|
|State of {#SNMPVALUE} on {HOST.NAME} is "Invalid"|<p>State "Invalid"</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdStatusEX[{#SNMPINDEX}].last(0)}=-6</p><p>**Recovery expression**: </p>|warning|
|State of {#SNMPVALUE} on {HOST.NAME} is "noDisk"|<p>State "noDisk"</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdStatusEX[{#SNMPINDEX}].last(0)}=-5</p><p>**Recovery expression**: </p>|information|
|State of {#SNMPVALUE} on {HOST.NAME} is "rwError"|<p>State "rwError"</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdStatusEX[{#SNMPINDEX}].last(0)}=-9</p><p>**Recovery expression**: </p>|warning|
|State of {#SNMPVALUE} on {HOST.NAME} is not "Ready" ({ITEM.VALUE1})|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdStatusEX[{#SNMPINDEX}].last(0)}<>0</p><p>**Recovery expression**: </p>|information|
|Temperature of {#SNMPVALUE} on {HOST.NAME} is over {$HD_TEMPERATURE_ALARM} for 2 min|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdTemperatureEX[{#SNMPINDEX}].min(2m)}>51</p><p>**Recovery expression**: </p>|high|
|Temperature of {#SNMPVALUE} on {HOST.NAME} is over {$HD_TEMPERATURE_WARNING} for 2min|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdTemperatureEX[{#SNMPINDEX}].min(2m)}>45</p><p>**Recovery expression**: </p>|information|
|{#SNMPVALUE} fan on {HOST.NAME} possibly is stopped|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:SysFanSpeedEX[{#SNMPINDEX}].max(60)}=0</p><p>**Recovery expression**: </p>|warning|
|Free space is less than 20% on volume {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:SysVolumePFreeSizeEX[{#SNMPINDEX}].last(0)}<20</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} fan on {HOST.NAME} possibly is stopped (LLD)|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:SysFanSpeedEX[{#SNMPINDEX}].max(60)}=0</p><p>**Recovery expression**: </p>|warning|
|Free space is less than 20% on volume {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:SysVolumePFreeSizeEX[{#SNMPINDEX}].last(0)}<20</p><p>**Recovery expression**: </p>|warning|
|SMART state of {#SNMPVALUE} on {HOST.NAME} is ABNORMAL (LLD)|<p>Abnormal 1. Any SMART value is equal or less than trhreshold. 2. Hard Disk temperature is higher than 65 degree C. -------- QNAP Knowledgebase</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdSmartInfoEX[{#SNMPINDEX}].iregexp(abnormal)}=1</p><p>**Recovery expression**: </p>|average|
|SMART state of {#SNMPVALUE} on {HOST.NAME} is not GOOD ({ITEM.VALUE1}) (LLD)|<p>Normal 1. Any Smart value is equal or less than threhold + (initial_SMART_value - threhold)/2. For example, if the initial SMART value is 100, the current value is 50, the threshold is 20, then the Smart value, 50, is less than 20+(100-20)/2. Thus, the health level would be Normal. 2. Any SMART test(Rapid or Complete) result of last 20 times is abnormal. 3. Hard Disk temperature is between 55 to 65 degree C. -------- QNAP Knowledgebase</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdSmartInfoEX[{#SNMPINDEX}].iregexp(normal)}=1</p><p>**Recovery expression**: </p>|warning|
|State of {#SNMPVALUE} on {HOST.NAME} is "Invalid" (LLD)|<p>State "Invalid"</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdStatusEX[{#SNMPINDEX}].last(0)}=-6</p><p>**Recovery expression**: </p>|warning|
|State of {#SNMPVALUE} on {HOST.NAME} is "noDisk" (LLD)|<p>State "noDisk"</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdStatusEX[{#SNMPINDEX}].last(0)}=-5</p><p>**Recovery expression**: </p>|information|
|State of {#SNMPVALUE} on {HOST.NAME} is "rwError" (LLD)|<p>State "rwError"</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdStatusEX[{#SNMPINDEX}].last(0)}=-9</p><p>**Recovery expression**: </p>|warning|
|State of {#SNMPVALUE} on {HOST.NAME} is not "Ready" ({ITEM.VALUE1}) (LLD)|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdStatusEX[{#SNMPINDEX}].last(0)}<>0</p><p>**Recovery expression**: </p>|information|
|Temperature of {#SNMPVALUE} on {HOST.NAME} is over {$HD_TEMPERATURE_ALARM} for 2 min (LLD)|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdTemperatureEX[{#SNMPINDEX}].min(2m)}>51</p><p>**Recovery expression**: </p>|high|
|Temperature of {#SNMPVALUE} on {HOST.NAME} is over {$HD_TEMPERATURE_WARNING} for 2min (LLD)|<p>-</p>|<p>**Expression**: {Template SNMP QNAP NAS:HdTemperatureEX[{#SNMPINDEX}].min(2m)}>45</p><p>**Recovery expression**: </p>|information|
