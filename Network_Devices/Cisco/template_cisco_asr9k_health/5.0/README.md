# Cisco ASR 9K Health SNMP

## Description

Template Cisco ASR 9k Health -CPU -Memory -Power Supply -Temperature ( RSP e LC ) -FAN ( FAN and FANTray ) -Power Consumption By: Flavio Gomes Figueira Camacho Junior Require: Firmware / Software .IOS XR 5.3.1 .IOS XR 5.3.4 ValueMap .CISCO-ENTITY-FRU-CONTROL-MIB::PowerOperType .ENTITY-SENSORS-MIB::EntitySensorStatus .CISCO-ENTITY-FRU-CONTROL-MIB::CefcFanTrayStatusEntry .CISCO-ENTITY-SENSOR-MIB::SensorStatus Base: CISCO-MEMORY-POOL-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-MEMORY-POOL-MIB.php CISCO-PROCESS-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-PROCESS-MIB.php ENTITY-MIB http://www.circitor.fr/Mibs/Html/E/ENTITY-MIB.php CISCO-ENTITY-FRU-CONTROL-MIB.mib https://circitor.fr/Mibs/Html/C/CISCO-ENTITY-FRU-CONTROL-MIB.php CISCO-ENTITY-SENSOR-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-ENTITY-SENSOR-MIB.php https://share.zabbix.com/network_devices/cisco/template-cisco-asr-9k External Scripts and Value Mapping on my Github: https://github.com/flaviojunior1995/Zabbix-Templates

## Overview

Template Cisco ASR 9k Health


-CPU


-Memory


-Power Supply


-Temperature ( RSP e LC )


-FAN ( FAN and FANTray )


-Power Consumption


 


By: Flavio Gomes Figueira Camacho Junior


 


Require:


Firmware / Software


.IOS XR 5.3.1


.IOS XR 5.3.4


ValueMap


.CISCO-ENTITY-FRU-CONTROL-MIB::PowerOperType


.CISCO-ENTITY-FRU-CONTROL-MIB::CefcFanTrayStatusEntry


.CISCO-ENTITY-SENSOR-MIB::SensorStatus


.ENTITY-SENSORS-MIB::EntitySensorStatus


 


Base:


CISCO-MEMORY-POOL-MIB.mib 


http://www.circitor.fr/Mibs/Html/C/CISCO-MEMORY-POOL-MIB.php


CISCO-PROCESS-MIB.mib


http://www.circitor.fr/Mibs/Html/C/CISCO-PROCESS-MIB.php


ENTITY-MIB


http://www.circitor.fr/Mibs/Html/E/ENTITY-MIB.php


CISCO-ENTITY-FRU-CONTROL-MIB.mib


https://circitor.fr/Mibs/Html/C/CISCO-ENTITY-FRU-CONTROL-MIB.php


CISCO-ENTITY-SENSOR-MIB.mib


http://www.circitor.fr/Mibs/Html/C/CISCO-ENTITY-SENSOR-MIB.php


https://share.zabbix.com/network\_devices/cisco/template-cisco-asr-9k


 


External Scripts and Value Mapping on my Github:


https://github.com/flaviojunior1995/Zabbix-Templates



## Author

Flavio Camacho Junior

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU_HIGH_ALARM}|<p>% maximum alarm cpu</p>|`80`|Text macro|
|{$CPU_HIGH_WARNING}|<p>% maximum warning cpu</p>|`70`|Text macro|
|{$MEMORY_HIGH_ALARM}|<p>% maximum alarm memory</p>|`80`|Text macro|
|{$MEMORY_HIGH_WARNING}|<p>% maximum warning memory</p>|`70`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|FAN Sensor Discovery|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName["FAN"]<p>Update: 1h</p>|
|Power Supply Current (A) Discovery|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName["Power Supply Current"]<p>Update: 1h</p>|
|Power Supply Voltage (V) Discovery|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName["Power Supply Voltage"]<p>Update: 1h</p>|
|Power Supply Sensors Discovery|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName["Power Supply"]<p>Update: 1h</p>|
|CPU Discovery|<p>CISCO-PROCESS-MIB::cpmCPUTotalPhysicalIndex The entPhysicalIndex of the physical entity for which the CPU statistics in this entry are maintained. The physical entity can be a CPU chip, a group of CPUs, a CPU card etc. The exact type of this entity is described by its entPhysicalVendorType value. If the CPU statistics in this entry correspond to more than one physical entity (or to no physical entity), or if the entPhysicalTable is not supported on the SNMP agent, the value of this object must be zero.</p>|`SNMP agent`|cpmCPUTotalPhysicalIndex["CPU"]<p>Update: 1h</p>|
|Temperature RSP Discovery|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName["RSP"]<p>Update: 1h</p>|
|Memory Pool Discovery|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolName A textual name assigned to the memory pool.</p>|`SNMP agent`|ciscoMemoryPoolName["Memory"]<p>Update: 1h</p>|
|FAN Tray Sensor Discovery|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName["FAN Tray"]<p>Update: 1h</p>|
|Temperature LC Discovery|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName["LC"]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Power Consumption|<p>-</p>|`Calculated`|powerConsumption<p>Update: 1m</p>|
|Status of FAN Sensor "{#SNMPVALUE}"/{#SNMPINDEX}|<p>CISCO-ENTITY-SENSOR-MIB::entSensorStatus This variable indicates the present operational status of the sensor.</p>|`SNMP agent`|entSensorStatus["{#SNMPVALUE}",FAN,{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Speed of FAN Sensor "{#SNMPVALUE}"/{#SNMPINDEX}|<p>CISCO-ENTITY-SENSOR-MIB::entSensorValue This variable reports the most recent measurement seen by the sensor.</p>|`SNMP agent`|entSensorValue["{#SNMPVALUE}",FAN,{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|"$1"|<p>-</p>|`SNMP agent`|entPhysicalContainedInCurrent["{#SNMPVALUE}"]<p>Update: 1m</p><p>LLD</p>|
|"$1"|<p>-</p>|`SNMP agent`|entPhysicalContainedInVoltage["{#SNMPVALUE}"]<p>Update: 1m</p><p>LLD</p>|
|Current Supplied by PowerSupply "$1"|<p>CISCO-ENTITY-FRU-CONTROL-MIB::cefcFRUCurrent Current supplied by the FRU (positive values) or current required to operate the FRU (negative values).</p>|`SNMP agent`|cefcFRUCurrent["{#SNMPVALUE}","Power Supply"]<p>Update: 30m</p><p>LLD</p>|
|Operational Status of PowerSupply "$1"|<p>CISCO-ENTITY-FRU-CONTROL-MIB::cefcFRUPowerOperStatus Operational FRU power state.</p>|`SNMP agent`|cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"]<p>Update: 1m</p><p>LLD</p>|
|CPU #$1 Usage 1min Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal1minRev The overall CPU busy percentage in the last 1 minute period. This object deprecates the object cpmCPUTotal1min and increases the value range to (0..100).</p>|`SNMP agent`|cpmCPUTotal1minRev["{#SNMPINDEX}"]<p>Update: 1m</p><p>LLD</p>|
|CPU #$1 Usage 5min Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal5minRev The overall CPU busy percentage in the last 5 minute period. This object deprecates the object cpmCPUTotal5min and increases the value range to (0..100).</p>|`SNMP agent`|cpmCPUTotal5minRev["{#SNMPINDEX}"]<p>Update: 5m</p><p>LLD</p>|
|Status of Temperature Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorStatus This variable indicates the present operational status of the sensor.</p>|`SNMP agent`|entSensorStatus["{#SNMPVALUE}","Temperature RSP"]<p>Update: 1m</p><p>LLD</p>|
|Thresholds::"$1" | Temperature Alarm|<p>-</p>|`SNMP agent`|entSensorThresholdValue["{#SNMPVALUE}","Temperature RSP","Alarm"]<p>Update: 1h</p><p>LLD</p>|
|Temperature on Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorValue This variable reports the most recent measurement seen by the sensor.</p>|`SNMP agent`|entSensorValue["{#SNMPVALUE}","Temperature RSP"]<p>Update: 1m</p><p>LLD</p>|
|Free memory on Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolFree Indicates the number of bytes from the memory pool that are currently unused on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolFree["{#SNMPVALUE}"]<p>Update: 5m</p><p>LLD</p>|
|Total Memory Pool "$1"|<p>-</p>|`Calculated`|ciscoMemoryPoolTotal["{#SNMPVALUE}"]<p>Update: 1h</p><p>LLD</p>|
|Used memory on Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolUsed Indicates the number of bytes from the memory pool that are currently in use by applications on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolUsed["{#SNMPVALUE}"]<p>Update: 5m</p><p>LLD</p>|
|Utilization on Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolUtilization5Min This is the memory pool utilization for 5 minutes.</p>|`SNMP agent`|ciscoMemoryPoolUtilization5Min["{#SNMPVALUE}"]<p>Update: 5m</p><p>LLD</p>|
|Operational Status of "$1"|<p>CISCO-ENTITY-FRU-CONTROL-MIB::cefcFanTrayOperStatus The operational state of the fan or fan tray.</p>|`SNMP agent`|cefcFanTrayOperStatus["{#SNMPVALUE}"]<p>Update: 1m</p><p>LLD</p>|
|Status of Temperature Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorStatus This variable indicates the present operational status of the sensor.</p>|`SNMP agent`|entSensorStatus["{#SNMPVALUE}","Temperature LC"]<p>Update: 1m</p><p>LLD</p>|
|Thresholds::"$1" | Temperature Alarm|<p>-</p>|`SNMP agent`|entSensorThresholdValue["{#SNMPVALUE}","Temperature LC","Alarm"]<p>Update: 1h</p><p>LLD</p>|
|Temperature on Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorValue This variable reports the most recent measurement seen by the sensor.</p>|`SNMP agent`|entSensorValue["{#SNMPVALUE}","Temperature LC"]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|High memory utilizarion alarm on Pool "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: ( {Cisco ASR 9K Health SNMP:ciscoMemoryPoolUsed["{#SNMPVALUE}"].last()} * 100 ) / {Cisco ASR 9K Health SNMP:ciscoMemoryPoolTotal["{#SNMPVALUE}"].last()} > 80</p><p>**Recovery expression**: </p>|high|
|High utilization of Memory Pool "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:ciscoMemoryPoolUtilization5Min["{#SNMPVALUE}"].last()} > 70</p><p>**Recovery expression**: </p>|average|
|High CPU Alarm #{#SNMPINDEX} 1min Usage|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cpmCPUTotal1minRev["{#SNMPINDEX}"].last()}>80</p><p>**Recovery expression**: </p>|high|
|High CPU Warning  #{#SNMPINDEX} 1min Usage|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cpmCPUTotal1minRev["{#SNMPINDEX}"].last()}>70</p><p>**Recovery expression**: </p>|average|
|High CPU Alarm #{#SNMPINDEX} 5min Usage|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cpmCPUTotal5minRev["{#SNMPINDEX}"].last()}>80</p><p>**Recovery expression**: </p>|high|
|High CPU Warning #{#SNMPINDEX} 5min Usage|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cpmCPUTotal5minRev["{#SNMPINDEX}"].last()}>70</p><p>**Recovery expression**: </p>|average|
|FAN Sensor "{#SNMPVALUE}"/{#SNMPINDEX} is nonoperational|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}",FAN,{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|high|
|FAN Sensor "{#SNMPVALUE}"/{#SNMPINDEX} is unavailable|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}",FAN,{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Status of "{#SNMPVALUE}" is in partial failure|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFanTrayOperStatus["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|average|
|Status of "{#SNMPVALUE}" is powered down|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFanTrayOperStatus["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|high|
|Status of "{#SNMPVALUE}" is unknown|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFanTrayOperStatus["{#SNMPVALUE}"].last()}=1</p><p>**Recovery expression**: </p>|information|
|High Temperature Alarm "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorValue["{#SNMPVALUE}","Temperature LC"].last()}>{Cisco ASR 9K Health SNMP:entSensorThresholdValue["{#SNMPVALUE}","Temperature LC","Alarm"].last()}</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is nonoperational|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}","Temperature LC"].last()}=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is unavailable|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}","Temperature LC"].last()}=2</p><p>**Recovery expression**: </p>|average|
|Connector rating exceeded on Power Supply "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=11</p><p>**Recovery expression**: </p>|average|
|Cooling capacity is insufficient on Power Supply "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=10</p><p>**Recovery expression**: </p>|high|
|FAN failed on Power Supply "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=9</p><p>**Recovery expression**: </p>|warning|
|FAN problem on Power Supply "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=7</p><p>**Recovery expression**: </p>|average|
|Power problem on Power Supply "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=5</p><p>**Recovery expression**: </p>|average|
|Power Supply "{#SNMPVALUE}" is failed|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=8 and {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=12</p><p>**Recovery expression**: </p>|high|
|Power Supply "{#SNMPVALUE}" is powered off|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=1</p><p>**Recovery expression**: </p>|warning|
|System power is insufficient on Power Supply "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=4</p><p>**Recovery expression**: </p>|high|
|Temperature problem on Power Supply "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=6</p><p>**Recovery expression**: </p>|high|
|High Temperature Alarm "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorValue["{#SNMPVALUE}","Temperature RSP"].last()}>{Cisco ASR 9K Health SNMP:entSensorThresholdValue["{#SNMPVALUE}","Temperature RSP","Alarm"].last()}</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is nonoperational|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}","Temperature RSP"].last()}=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is unavailable|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}","Temperature RSP"].last()}=2</p><p>**Recovery expression**: </p>|average|
|FAN Sensor "{#SNMPVALUE}"/{#SNMPINDEX} is nonoperational (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}",FAN,{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|high|
|FAN Sensor "{#SNMPVALUE}"/{#SNMPINDEX} is unavailable (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}",FAN,{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Connector rating exceeded on Power Supply "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=11</p><p>**Recovery expression**: </p>|average|
|Cooling capacity is insufficient on Power Supply "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=10</p><p>**Recovery expression**: </p>|high|
|FAN failed on Power Supply "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=9</p><p>**Recovery expression**: </p>|warning|
|FAN problem on Power Supply "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=7</p><p>**Recovery expression**: </p>|average|
|Power problem on Power Supply "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=5</p><p>**Recovery expression**: </p>|average|
|Power Supply "{#SNMPVALUE}" is failed (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=8 and {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=12</p><p>**Recovery expression**: </p>|high|
|Power Supply "{#SNMPVALUE}" is powered off (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=1</p><p>**Recovery expression**: </p>|warning|
|System power is insufficient on Power Supply "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=4</p><p>**Recovery expression**: </p>|high|
|Temperature problem on Power Supply "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFRUPowerOperStatus["{#SNMPVALUE}","Power Supply"].last()}=6</p><p>**Recovery expression**: </p>|high|
|High CPU Alarm #{#SNMPINDEX} 1min Usage (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cpmCPUTotal1minRev["{#SNMPINDEX}"].last()}>80</p><p>**Recovery expression**: </p>|high|
|High CPU Warning  #{#SNMPINDEX} 1min Usage (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cpmCPUTotal1minRev["{#SNMPINDEX}"].last()}>70</p><p>**Recovery expression**: </p>|average|
|High CPU Alarm #{#SNMPINDEX} 5min Usage (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cpmCPUTotal5minRev["{#SNMPINDEX}"].last()}>80</p><p>**Recovery expression**: </p>|high|
|High CPU Warning #{#SNMPINDEX} 5min Usage (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cpmCPUTotal5minRev["{#SNMPINDEX}"].last()}>70</p><p>**Recovery expression**: </p>|average|
|High Temperature Alarm "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorValue["{#SNMPVALUE}","Temperature RSP"].last()}>{Cisco ASR 9K Health SNMP:entSensorThresholdValue["{#SNMPVALUE}","Temperature RSP","Alarm"].last()}</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is nonoperational (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}","Temperature RSP"].last()}=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is unavailable (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}","Temperature RSP"].last()}=2</p><p>**Recovery expression**: </p>|average|
|High memory utilizarion alarm on Pool "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: ( {Cisco ASR 9K Health SNMP:ciscoMemoryPoolUsed["{#SNMPVALUE}"].last()} * 100 ) / {Cisco ASR 9K Health SNMP:ciscoMemoryPoolTotal["{#SNMPVALUE}"].last()} > 80</p><p>**Recovery expression**: </p>|high|
|High utilization of Memory Pool "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:ciscoMemoryPoolUtilization5Min["{#SNMPVALUE}"].last()} > 70</p><p>**Recovery expression**: </p>|average|
|Status of "{#SNMPVALUE}" is in partial failure (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFanTrayOperStatus["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|average|
|Status of "{#SNMPVALUE}" is powered down (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFanTrayOperStatus["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|high|
|Status of "{#SNMPVALUE}" is unknown (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:cefcFanTrayOperStatus["{#SNMPVALUE}"].last()}=1</p><p>**Recovery expression**: </p>|information|
|High Temperature Alarm "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorValue["{#SNMPVALUE}","Temperature LC"].last()}>{Cisco ASR 9K Health SNMP:entSensorThresholdValue["{#SNMPVALUE}","Temperature LC","Alarm"].last()}</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is nonoperational (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}","Temperature LC"].last()}=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is unavailable (LLD)|<p>-</p>|<p>**Expression**: {Cisco ASR 9K Health SNMP:entSensorStatus["{#SNMPVALUE}","Temperature LC"].last()}=2</p><p>**Recovery expression**: </p>|average|
