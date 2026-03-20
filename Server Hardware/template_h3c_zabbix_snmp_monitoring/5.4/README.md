# H3C_basic_monitoring

## Description

H3C server basic monitoring items

## Overview

H3C zabbix基于SNMP的监控模板，适用于HDM版本为B03  
  



H3C ZABBIX monitoring template based on SNMP ,for HDM version B03



## Author

yelin

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`rocommstr`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|h3cHealthInfo_discovery|<p>-</p>|`SNMP agent`|h3cHealthInfo_discovery<p>Update: 30s</p>|
|h3cCPUInfo_discovery|<p>-</p>|`SNMP agent`|h3cCPUInfo_discovery<p>Update: 30s</p>|
|h3cTempInfo_discovery|<p>-</p>|`SNMP agent`|h3cTempInfo_discovery<p>Update: 30s</p>|
|h3cFan_discover|<p>-</p>|`SNMP agent`|h3cFan_discover<p>Update: 30s</p>|
|h3cPowerInfo_discovery|<p>-</p>|`SNMP agent`|h3cPowerInfo_discovery<p>Update: 30s</p>|
|h3cHardDiskInfo_discovery|<p>-</p>|`SNMP agent`|h3cHardDiskInfo_discovery<p>Update: 30s</p>|
|h3cFru_discovery|<p>-</p>|`SNMP agent`|h3cFru_discovery<p>Update: 30s</p>|
|h3cMem_discovery|<p>-</p>|`SNMP agent`|h3cMem_Discovery<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|h3cSrvBiosVersion|<p>-</p>|`SNMP agent`|h3cSrvBiosVersion<p>Update: 60s</p>|
|h3cSrvHdmVersion|<p>-</p>|`SNMP agent`|h3cSrvHdmVersion<p>Update: 60s</p>|
|h3cPowerTotalCost|<p>-</p>|`SNMP agent`|h3cPowerTotalCost<p>Update: 30s</p>|
|h3cOutletTempReading|<p>-</p>|`SNMP agent`|h3cOutletTempReading<p>Update: 30s</p>|
|h3cInletTempReading|<p>-</p>|`SNMP agent`|h3cInletTempReading<p>Update: 30s</p>|
|h3cCPUHealthStatus[{#SNMPINDEX}]|<p>Health status of the CPU overall, normal(0), caution(1), warning(2), critical(3)</p>|`SNMP agent`|h3cCPUHealthStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|h3cDiskHealthStatus[{#SNMPINDEX}]|<p>Health status of the disk overall, normal(0), caution(1), warning(2), critical(3)</p>|`SNMP agent`|h3cDiskHealthStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|h3cEntiretyHealthStatus[{#SNMPINDEX}]|<p>The entirety health status of this machine, normal(0), caution(1), warning(2), critical(3)</p>|`SNMP agent`|h3cEntiretyHealthStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|h3cFanHealthStatus[{#SNMPINDEX}]|<p>Health status of the FAN overall, normal(0), caution(1), warning(2), critical(3)</p>|`SNMP agent`|h3cFanHealthStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|h3cMemHealthStatus[{#SNMPINDEX}]|<p>Health status of the memory overall, normal(0), caution(1), warning(2), critical(3)</p>|`SNMP agent`|h3cMemHealthStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|h3cPwrHealthStatus[{#SNMPINDEX}]|<p>Health status of the power supply overall, normal(0), caution(1), warning(2), critical(3)</p>|`SNMP agent`|h3cPwrHealthStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|h3cTempHealthStatus[{#SNMPINDEX}]|<p>Health status of the temprature overall, normal(0), caution(1), warning(2), critical(3)</p>|`SNMP agent`|h3cTempHealthStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU_[{#SNMPINDEX}]_PresentStatus|<p>The present status of CPU associated with the ID.</p>|`SNMP agent`|CPUPresentStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU_[{#SNMPINDEX}]_Status|<p>The working status of the CPU associated with the ID</p>|`SNMP agent`|CPUStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|TempSensor_[{#SNMPINDEX}]_Reading|<p>Information about temperature reading, the unit is degree C.</p>|`SNMP agent`|TempSensorReading[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|TempSensor_[{#SNMPINDEX}]_Status|<p>-</p>|`SNMP agent`|TempSensorStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|FAN_[{#SNMPINDEX}]_PresentStatus|<p>-</p>|`SNMP agent`|FANPresentStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|FAN_[{#SNMPINDEX}]_Speed|<p>-</p>|`SNMP agent`|FANSpeed[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Power_[{#SNMPINDEX}]_Cost|<p>Information about the cost of power. The unit is watt.</p>|`SNMP agent`|PowerCost[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Power_[{#SNMPINDEX}]_PresnetStatus|<p>The present status of power supply , absence(0), presence(1)</p>|`SNMP agent`|PowerPresnetStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|HardDisk_[{#SNMPINDEX}]_HealthStatus|<p>The hard disk health status</p>|`SNMP agent`|HardDiskHealthStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|HardDisk_[{#SNMPINDEX}]_Location|<p>The location of hard disk</p>|`SNMP agent`|HardDiskStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Fru_[{#SNMPINDEX}]_Name|<p>-</p>|`SNMP agent`|FruName[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Mem_[{#SNMPINDEX}]_Status|<p>-</p>|`SNMP agent`|MemStatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CPUStatus_alarm|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/CPUStatus[{#SNMPINDEX}])=0</p><p>**Recovery expression**: last(/H3C_basic_monitoring/CPUStatus[{#SNMPINDEX}])=1</p>|warning|
|CPU_absense|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/CPUPresentStatus[{#SNMPINDEX}])=0</p><p>**Recovery expression**: last(/H3C_basic_monitoring/CPUPresentStatus[{#SNMPINDEX}])=1</p>|warning|
|FAN_Status_alarm|<p>fan absence</p>|<p>**Expression**: last(/H3C_basic_monitoring/FANPresentStatus[{#SNMPINDEX}])=0</p><p>**Recovery expression**: last(/H3C_basic_monitoring/FANPresentStatus[{#SNMPINDEX}])=1</p>|average|
|HardDiskStatus_major|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/HardDiskHealthStatus[{#SNMPINDEX}])>3</p><p>**Recovery expression**: last(/H3C_basic_monitoring/HardDiskHealthStatus[{#SNMPINDEX}])=2</p>|high|
|HardDiskStatus_minor|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/HardDiskHealthStatus[{#SNMPINDEX}])=3</p><p>**Recovery expression**: last(/H3C_basic_monitoring/HardDiskHealthStatus[{#SNMPINDEX}])=2</p>|warning|
|EntiretyHeathStatus_caution|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=0</p>|warning|
|EntiretyHeathStatus_critical|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=3</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=0</p>|high|
|EntiretyHeathStatus_warning|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=0</p>|average|
|PwrHealthStatus_caution|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cPwrHealthStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cPwrHealthStatus[{#SNMPINDEX}])=0</p>|warning|
|PwrHealthStatus_warning|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cPwrHealthStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cPwrHealthStatus[{#SNMPINDEX}])=0</p>|average|
|MemStatus_alarm|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/MemStatus[{#SNMPINDEX}])>1</p><p>**Recovery expression**: last(/H3C_basic_monitoring/MemStatus[{#SNMPINDEX}])=1</p>|warning|
|PowerPresentStatus_absense|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/PowerPresnetStatus[{#SNMPINDEX}])=0</p><p>**Recovery expression**: last(/H3C_basic_monitoring/PowerPresnetStatus[{#SNMPINDEX}])=1</p>|information|
|TempSensorStatus_alarm|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/TempSensorStatus[{#SNMPINDEX}])>2</p><p>**Recovery expression**: last(/H3C_basic_monitoring/TempSensorStatus[{#SNMPINDEX}])=2</p>|warning|
|EntiretyHeathStatus_caution (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=0</p>|warning|
|EntiretyHeathStatus_critical (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=3</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=0</p>|high|
|EntiretyHeathStatus_warning (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cEntiretyHealthStatus[{#SNMPINDEX}])=0</p>|average|
|PwrHealthStatus_caution (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cPwrHealthStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cPwrHealthStatus[{#SNMPINDEX}])=0</p>|warning|
|PwrHealthStatus_warning (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/h3cPwrHealthStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: last(/H3C_basic_monitoring/h3cPwrHealthStatus[{#SNMPINDEX}])=0</p>|average|
|CPUStatus_alarm (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/CPUStatus[{#SNMPINDEX}])=0</p><p>**Recovery expression**: last(/H3C_basic_monitoring/CPUStatus[{#SNMPINDEX}])=1</p>|warning|
|CPU_absense (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/CPUPresentStatus[{#SNMPINDEX}])=0</p><p>**Recovery expression**: last(/H3C_basic_monitoring/CPUPresentStatus[{#SNMPINDEX}])=1</p>|warning|
|TempSensorStatus_alarm (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/TempSensorStatus[{#SNMPINDEX}])>2</p><p>**Recovery expression**: last(/H3C_basic_monitoring/TempSensorStatus[{#SNMPINDEX}])=2</p>|warning|
|FAN_Status_alarm (LLD)|<p>fan absence</p>|<p>**Expression**: last(/H3C_basic_monitoring/FANPresentStatus[{#SNMPINDEX}])=0</p><p>**Recovery expression**: last(/H3C_basic_monitoring/FANPresentStatus[{#SNMPINDEX}])=1</p>|average|
|PowerPresentStatus_absense (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/PowerPresnetStatus[{#SNMPINDEX}])=0</p><p>**Recovery expression**: last(/H3C_basic_monitoring/PowerPresnetStatus[{#SNMPINDEX}])=1</p>|information|
|HardDiskStatus_major (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/HardDiskHealthStatus[{#SNMPINDEX}])>3</p><p>**Recovery expression**: last(/H3C_basic_monitoring/HardDiskHealthStatus[{#SNMPINDEX}])=2</p>|high|
|HardDiskStatus_minor (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/HardDiskHealthStatus[{#SNMPINDEX}])=3</p><p>**Recovery expression**: last(/H3C_basic_monitoring/HardDiskHealthStatus[{#SNMPINDEX}])=2</p>|warning|
|MemStatus_alarm (LLD)|<p>-</p>|<p>**Expression**: last(/H3C_basic_monitoring/MemStatus[{#SNMPINDEX}])>1</p><p>**Recovery expression**: last(/H3C_basic_monitoring/MemStatus[{#SNMPINDEX}])=1</p>|warning|
