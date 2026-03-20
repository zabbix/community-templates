# SNMP THECUS NAS

## Overview

Делал под Thecus N8900  



Чтобы нормально получать данные через SNMP ставьте последние прошивки на устройства.  



В принципе моя модель - это linux NAS. Через linux SNMPv2 практически все выдается, но в самой 


морде есть mib-файл, на его основе и сделал данный шаблон.


Вопросы на 2135850@211.ru



## Author

S.V.Sidenko

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HD_TEMPERATURE_ALARM}|<p>-</p>|`51`|Text macro|
|{$HD_TEMPERATURE_WARNING}|<p>-</p>|`40`|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|RAID discovery|<p>-</p>|`SNMP agent`|nasRaid.discovery<p>Update: 1h</p>|
|Hard disks discovery|<p>-</p>|`SNMP agent`|nasDisk.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System fan status|<p>-</p>|`SNMP agent`|systemFanStatus<p>Update: 60</p>|
|System vendor|<p>-</p>|`SNMP agent`|systemVendor<p>Update: 3h</p>|
|System Mini-UPS Status|<p>-</p>|`SNMP agent`|systemMiniUPSStatus<p>Update: 60</p>|
|System temperature|<p>System temperature in centigrade</p>|`SNMP agent`|systemTemperature<p>Update: 60</p>|
|System firmware|<p>-</p>|`SNMP agent`|systemFirmware<p>Update: 3h</p>|
|System status|<p>-</p>|`SNMP agent`|systemStatus<p>Update: 60</p>|
|System model|<p>-</p>|`SNMP agent`|systemModel<p>Update: 3h</p>|
|RAID ID of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|raidID[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|RAID level of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|raidLevel[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|RAID number of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|raidNum[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|RAID size of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|raidSize[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|RAID status of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|raidStatus[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|RAID units of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|raidUnits[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|RAID used percent of {#SNMPVALUE} (%)|<p>-</p>|`SNMP agent`|raidUsedPercentage[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Disk Capacity {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskCapacity[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Disk ID {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskID[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|Model of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskModel[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|Reallocate_Sector_Ct {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskSMARTAttr5[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Power_On_hours{#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskSMARTAttr9[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|End-to-End Error {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskSMARTAttr184[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Temperature of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskSMARTAttr194[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Current__Pending_Sector {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskSMARTAttr197[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|S.M.A.R.T. info of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskSMARTHealthCheck[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Status of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskStatus[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Disk Tray Number {#SNMPVALUE}|<p>-</p>|`SNMP agent`|diskTrayNum[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|State of {#SNMPVALUE} on {HOST.NAME} is "Current Pending Sector"|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/diskSMARTAttr197[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|average|
|State of {#SNMPVALUE} on {HOST.NAME} is "End-to-End Error"|<p>State "noDisk"</p>|<p>**Expression**: last(/SNMP THECUS NAS/diskSMARTAttr184[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|average|
|State of {#SNMPVALUE} on {HOST.NAME} is "Reallocated_Sector_Ct"|<p>State "rwError"</p>|<p>**Expression**: last(/SNMP THECUS NAS/diskSMARTAttr5[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|average|
|State of {#SNMPVALUE} on {HOST.NAME} is not "Ready" ({ITEM.VALUE1})|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/diskStatus[{#SNMPINDEX}])=3</p><p>**Recovery expression**: </p>|high|
|Temperature of {#SNMPVALUE} on {HOST.NAME} is over {$HD_TEMPERATURE_ALARM} for 2 min|<p>-</p>|<p>**Expression**: min(/SNMP THECUS NAS/diskSMARTAttr194[{#SNMPINDEX}],2m)>51</p><p>**Recovery expression**: </p>|high|
|Temperature of {#SNMPVALUE} on {HOST.NAME} is over {$HD_TEMPERATURE_WARNING} for 2min|<p>-</p>|<p>**Expression**: min(/SNMP THECUS NAS/diskSMARTAttr194[{#SNMPINDEX}],2m)>40</p><p>**Recovery expression**: </p>|information|
|Free space is less than 5% on volume {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/raidUsedPercentage[{#SNMPINDEX}])>95</p><p>**Recovery expression**: </p>|high|
|Free space is less than 10% on volume {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/raidUsedPercentage[{#SNMPINDEX}])>90</p><p>**Recovery expression**: </p>|warning|
|Free space is less than 20% on volume {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/raidUsedPercentage[{#SNMPINDEX}])>80</p><p>**Recovery expression**: </p>|information|
|Free space is less than 5% on volume {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/raidUsedPercentage[{#SNMPINDEX}])>95</p><p>**Recovery expression**: </p>|high|
|Free space is less than 10% on volume {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/raidUsedPercentage[{#SNMPINDEX}])>90</p><p>**Recovery expression**: </p>|warning|
|Free space is less than 20% on volume {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/raidUsedPercentage[{#SNMPINDEX}])>80</p><p>**Recovery expression**: </p>|information|
|State of {#SNMPVALUE} on {HOST.NAME} is "Current Pending Sector" (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/diskSMARTAttr197[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|average|
|State of {#SNMPVALUE} on {HOST.NAME} is "End-to-End Error" (LLD)|<p>State "noDisk"</p>|<p>**Expression**: last(/SNMP THECUS NAS/diskSMARTAttr184[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|average|
|State of {#SNMPVALUE} on {HOST.NAME} is "Reallocated_Sector_Ct" (LLD)|<p>State "rwError"</p>|<p>**Expression**: last(/SNMP THECUS NAS/diskSMARTAttr5[{#SNMPINDEX}])>0</p><p>**Recovery expression**: </p>|average|
|State of {#SNMPVALUE} on {HOST.NAME} is not "Ready" ({ITEM.VALUE1}) (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP THECUS NAS/diskStatus[{#SNMPINDEX}])=3</p><p>**Recovery expression**: </p>|high|
|Temperature of {#SNMPVALUE} on {HOST.NAME} is over {$HD_TEMPERATURE_ALARM} for 2 min (LLD)|<p>-</p>|<p>**Expression**: min(/SNMP THECUS NAS/diskSMARTAttr194[{#SNMPINDEX}],2m)>51</p><p>**Recovery expression**: </p>|high|
|Temperature of {#SNMPVALUE} on {HOST.NAME} is over {$HD_TEMPERATURE_WARNING} for 2min (LLD)|<p>-</p>|<p>**Expression**: min(/SNMP THECUS NAS/diskSMARTAttr194[{#SNMPINDEX}],2m)>40</p><p>**Recovery expression**: </p>|information|
