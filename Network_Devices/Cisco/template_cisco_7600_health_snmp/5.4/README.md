# Cisco 7600 Health SNMP

## Description

Template Cisco 7600 Health -CPU -Memory -PowerSupply -PowerConsumption -Temperature -FAN -CEF By: Flavio Gomes Figueira Camacho Junior Require: Firmware / Software .IOS rp-ADVENTERPRISEK9-M 15.2(4)S4 ValueMaps .CISCO-ENVMON-MIB::CiscoEnvMonState .ENTITY-SENSORS-MIB::EntitySensorStatus .CISCO-CEF-TC-MIB::CefFailureReason Base: CISCO-ENVMON-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-ENVMON-MIB.php CISCO-MEMORY-POOL-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-MEMORY-POOL-MIB.php CISCO-PROCESS-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-PROCESS-MIB.php ENTITY-MIB.mib http://www.circitor.fr/Mibs/Html/E/ENTITY-MIB.php CISCO-ENTITY-SENSOR-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-ENTITY-SENSOR-MIB.php CISCO-ENTITY-FRU-CONTROL-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-ENTITY-FRU-CONTROL-MIB.php CISCO-CEF-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-CEF-MIB.php https://share.zabbix.com/network_devices/cisco/template-cisco-7600 External Scripts and Value Mapping on my Github: https://github.com/flaviojunior1995/Zabbix-Templates

## Overview

Template Cisco 7600 Health 


-CPU


-Memory


-PowerSupply


-PowerConsumption


-Temperature


-FAN


-CEF


 


By: Flavio Gomes Figueira Camacho Junior


 


Require:


Firmware / Software


.IOS rp-ADVENTERPRISEK9-M 15.2(4)S4 


 


ValueMaps


.CISCO-ENVMON-MIB::CiscoEnvMonState


.ENTITY-SENSORS-MIB::EntitySensorStatus


.CISCO-CEF-TC-MIB::CefFailureReason


 


Base:


CISCO-ENVMON-MIB.mib 


http://www.circitor.fr/Mibs/Html/C/CISCO-ENVMON-MIB.php


CISCO-MEMORY-POOL-MIB.mib


http://www.circitor.fr/Mibs/Html/C/CISCO-MEMORY-POOL-MIB.php


CISCO-PROCESS-MIB.mib


http://www.circitor.fr/Mibs/Html/C/CISCO-PROCESS-MIB.php


ENTITY-MIB.mib


http://www.circitor.fr/Mibs/Html/E/ENTITY-MIB.php


CISCO-ENTITY-SENSOR-MIB.mib


http://www.circitor.fr/Mibs/Html/C/CISCO-ENTITY-SENSOR-MIB.php


CISCO-ENTITY-FRU-CONTROL-MIB.mib


http://www.circitor.fr/Mibs/Html/C/CISCO-ENTITY-FRU-CONTROL-MIB.php


CISCO-CEF-MIB.mib


http://www.circitor.fr/Mibs/Html/C/CISCO-CEF-MIB.php


https://share.zabbix.com/network\_devices/cisco/template-cisco-7600


 


External Scripts and Value Mapping on my Github:


https://github.com/flaviojunior1995/Zabbix-Templates



## Author

Flavio Camacho Junior

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CEF_TOTAL_MEMORY}|<p>total memory CEF</p>|`3678072`|Text macro|
|{$CPU_HIGH_ALARM}|<p>% cpu waning</p>|`90`|Text macro|
|{$CPU_HIGH_WARNING}|<p>% cpu alarm</p>|`70`|Text macro|
|{$MEMORY_HIGH_ALARM}|<p>% memory alarm</p>|`80`|Text macro|
|{$MEMORY_HIGH_WARNING}|<p>% memoty warning</p>|`70`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Temperature Sensors Discovery|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName["Temperature"]<p>Update: 1h</p>|
|CEF Discovery|<p>-</p>|`SNMP agent`|cefResourceFailureReason["CEF"]<p>Update: 1h</p>|
|FAN Discovery|<p>CISCO-ENVMON-MIB The table of fan status maintained by the environmental monitor.</p>|`SNMP agent`|ciscoEnvMonFanStatusDescr["FAN"]<p>Update: 1h</p>|
|Memory Pool Discovery|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolName A textual name assigned to the memory pool.</p>|`SNMP agent`|ciscoMemoryPoolName["Memory"]<p>Update: 1h</p>|
|Power Supply Discovery|<p>CISCO-ENVMON-MIB::ciscoEnvMonSupplyStatusDescr Textual description of the power supply being instrumented.</p>|`SNMP agent`|ciscoEnvMonSupplyStatusDescr["Power Supply"]<p>Update: 1h</p>|
|CPU Discovery|<p>CISCO-PROCESS-MIB::cpmCPUTotalPhysicalIndex The entPhysicalIndex of the physical entity for which the CPU statistics in this entry are maintained. The physical entity can be a CPU chip, a group of CPUs, a CPU card etc. The exact type of this entity is described by its entPhysicalVendorType value. If the CPU statistics in this entry correspond to more than one physical entity (or to no physical entity), or if the entPhysicalTable is not supported on the SNMP agent, the value of this object must be zero.</p>|`SNMP agent`|cpmCPUTotalPhysicalIndex["CPU"]<p>Update: 1h</p>|
|Power Comsumption Discovery|<p>CISCO-ENTITY-FRU-CONTROL-MIB</p>|`SNMP agent`|cefcConnectorRating["Power Consumption"]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status Temperature Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorStatus This variable indicates the present operational status of the sensor.</p>|`SNMP agent`|entSensorStatus["{#SNMPVALUE}"]<p>Update: 1m</p><p>LLD</p>|
|Thresholds::"$1" | Temperature Alarm|<p>CISCO-ENTITY-SENSOR-MIB::entSensorThresholdValue This variable indicates the value of the threshold.</p>|`SNMP agent`|entSensorThresholdValue["{#SNMPVALUE}","Alarm"]<p>Update: 1h</p><p>LLD</p>|
|Thresholds::"$1" | Temperature Warning|<p>CISCO-ENTITY-SENSOR-MIB::entSensorThresholdValue This variable indicates the value of the threshold.</p>|`SNMP agent`|entSensorThresholdValue["{#SNMPVALUE}","Warning"]<p>Update: 1h</p><p>LLD</p>|
|Temperature on Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorValue This variable reports the most recent measurement seen by the sensor.</p>|`SNMP agent`|entSensorValue["{#SNMPVALUE}"]<p>Update: 1m</p><p>LLD</p>|
|CEF Failure Reason "$1"|<p>-</p>|`SNMP agent`|cefResourceFailureReason["{#SNMPINDEX}"]<p>Update: 1m</p><p>LLD</p>|
|CEF Memory Used "$1"|<p>-</p>|`SNMP agent`|cefResourceMemoryUsed["{#SNMPINDEX}"]<p>Update: 1m</p><p>LLD</p>|
|"{#SNMPVALUE}": Fan status|<p>MIB: CISCO-ENVMON-MIB</p>|`SNMP agent`|ciscoEnvMonFanState["{#SNMPINDEX}"]<p>Update: 1m</p><p>LLD</p>|
|Free memory on Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolFree Indicates the number of bytes from the memory pool that are currently unused on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolFree["{#SNMPVALUE}"]<p>Update: 5m</p><p>LLD</p>|
|Total Memory Pool "$1"|<p>-</p>|`Calculated`|ciscoMemoryPoolTotal["{#SNMPVALUE}"]<p>Update: 1h</p><p>LLD</p>|
|Used memory on Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolUsed Indicates the number of bytes from the memory pool that are currently in use by applications on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolUsed["{#SNMPVALUE}"]<p>Update: 5m</p><p>LLD</p>|
|Status "$1"|<p>CISCO-ENVMON-MIB::ciscoEnvMonSupplyState The current state of the power supply being instrumented.</p>|`SNMP agent`|ciscoEnvMonSupplyState["{#SNMPVALUE}"]<p>Update: 1m</p><p>LLD</p>|
|CPU #"$1" Usage 1min Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal1minRev The overall CPU busy percentage in the last 1 minute period. This object deprecates the object cpmCPUTotal1min and increases the value range to (0..100).</p>|`SNMP agent`|cpmCPUTotal1minRev["{#SNMPINDEX}"]<p>Update: 1m</p><p>LLD</p>|
|CPU #"$1" Usage 5min Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal5minRev The overall CPU busy percentage in the last 5 minute period. This object deprecates the object cpmCPUTotal5min and increases the value range to (0..100).</p>|`SNMP agent`|cpmCPUTotal5minRev["{#SNMPINDEX}"]<p>Update: 5m</p><p>LLD</p>|
|Module "$1" Voltage (V)|<p>-</p>|`SNMP agent`|cefcConnectorRating["{#SNMPINDEX}"]<p>Update: 5m</p><p>LLD</p>|
|Module "$1" Current (A)|<p>-</p>|`SNMP agent`|cefcModulePowerConsumptionTable["{#SNMPINDEX}"]<p>Update: 5m</p><p>LLD</p>|
|Module "$1" Power (W)|<p>-</p>|`Calculated`|moduleComsumption["{#SNMPINDEX}"]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CEF Failure|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cefResourceFailureReason["{#SNMPINDEX}"])<>1</p><p>**Recovery expression**: </p>|disaster|
|CEF high memory utilization|<p>-</p>|<p>**Expression**: 3678072 * 100 / last(/Cisco 7600 Health SNMP/cefResourceMemoryUsed["{#SNMPINDEX}"]) > 90</p><p>**Recovery expression**: </p>|high|
|"{#SNMPVALUE}": Fan is in critical state|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=3</p><p>**Recovery expression**: </p>|high|
|"{#SNMPVALUE}": Fan is in warning state|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=2</p><p>**Recovery expression**: </p>|warning|
|"{#SNMPVALUE}": Fan is notFunctioning|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=6</p><p>**Recovery expression**: </p>|warning|
|"{#SNMPVALUE}": Fan is notPresent|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=5</p><p>**Recovery expression**: </p>|warning|
|"{#SNMPVALUE}": Fan is shutdown|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=4</p><p>**Recovery expression**: </p>|information|
|Status "{#SNMPVALUE}" is critical|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonSupplyState["{#SNMPVALUE}"])=3</p><p>**Recovery expression**: </p>|high|
|Status "{#SNMPVALUE}" is non-operable|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonSupplyState["{#SNMPVALUE}"])=2</p><p>**Recovery expression**: </p>|warning|
|Status "{#SNMPVALUE}" is not functioning|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonSupplyState["{#SNMPVALUE}"])=6</p><p>**Recovery expression**: </p>|average|
|Status "{#SNMPVALUE}" is shutdown|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonSupplyState["{#SNMPVALUE}"])=4</p><p>**Recovery expression**: </p>|average|
|High memory utilizarion alarm on Pool "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: (last(/Cisco 7600 Health SNMP/ciscoMemoryPoolUsed["{#SNMPVALUE}"])*100 ) / last(/Cisco 7600 Health SNMP/ciscoMemoryPoolTotal["{#SNMPVALUE}"]) > 80</p><p>**Recovery expression**: </p>|high|
|High memory utilizarion warning on Pool "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: (last(/Cisco 7600 Health SNMP/ciscoMemoryPoolUsed["{#SNMPVALUE}"])*100 ) / last(/Cisco 7600 Health SNMP/ciscoMemoryPoolTotal["{#SNMPVALUE}"]) > 70</p><p>**Recovery expression**: </p>|average|
|High CPU Alarm #"{#SNMPINDEX}" 1min Usage|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cpmCPUTotal1minRev["{#SNMPINDEX}"])>90</p><p>**Recovery expression**: </p>|high|
|High CPU Warning #"{#SNMPINDEX}" 1min Usage|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cpmCPUTotal1minRev["{#SNMPINDEX}"])>70</p><p>**Recovery expression**: </p>|average|
|High CPU Alarm #"{#SNMPINDEX}" 5min Usage|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cpmCPUTotal5minRev["{#SNMPINDEX}"])>90</p><p>**Recovery expression**: </p>|high|
|High CPU Warning #"{#SNMPINDEX}" 5min Usage|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cpmCPUTotal5minRev["{#SNMPINDEX}"])>70</p><p>**Recovery expression**: </p>|average|
|High Temperature Alarm "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/entSensorValue["{#SNMPVALUE}"])>last(/Cisco 7600 Health SNMP/entSensorThresholdValue["{#SNMPVALUE}","Alarm"])</p><p>**Recovery expression**: </p>|high|
|High Temperature Warning "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/entSensorValue["{#SNMPVALUE}"])>last(/Cisco 7600 Health SNMP/entSensorThresholdValue["{#SNMPVALUE}","Warning"])</p><p>**Recovery expression**: </p>|average|
|Temperature Sensor "{#SNMPVALUE}" is nonoperational|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/entSensorStatus["{#SNMPVALUE}"])=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is unavailable|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/entSensorStatus["{#SNMPVALUE}"])=2</p><p>**Recovery expression**: </p>|average|
|High Temperature Alarm "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/entSensorValue["{#SNMPVALUE}"])>last(/Cisco 7600 Health SNMP/entSensorThresholdValue["{#SNMPVALUE}","Alarm"])</p><p>**Recovery expression**: </p>|high|
|High Temperature Warning "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/entSensorValue["{#SNMPVALUE}"])>last(/Cisco 7600 Health SNMP/entSensorThresholdValue["{#SNMPVALUE}","Warning"])</p><p>**Recovery expression**: </p>|average|
|Temperature Sensor "{#SNMPVALUE}" is nonoperational (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/entSensorStatus["{#SNMPVALUE}"])=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is unavailable (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/entSensorStatus["{#SNMPVALUE}"])=2</p><p>**Recovery expression**: </p>|average|
|CEF Failure (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cefResourceFailureReason["{#SNMPINDEX}"])<>1</p><p>**Recovery expression**: </p>|disaster|
|CEF high memory utilization (LLD)|<p>-</p>|<p>**Expression**: 3678072 * 100 / last(/Cisco 7600 Health SNMP/cefResourceMemoryUsed["{#SNMPINDEX}"]) > 90</p><p>**Recovery expression**: </p>|high|
|"{#SNMPVALUE}": Fan is in critical state (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=3</p><p>**Recovery expression**: </p>|high|
|"{#SNMPVALUE}": Fan is in warning state (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=2</p><p>**Recovery expression**: </p>|warning|
|"{#SNMPVALUE}": Fan is notFunctioning (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=6</p><p>**Recovery expression**: </p>|warning|
|"{#SNMPVALUE}": Fan is notPresent (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=5</p><p>**Recovery expression**: </p>|warning|
|"{#SNMPVALUE}": Fan is shutdown (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonFanState["{#SNMPINDEX}"])=4</p><p>**Recovery expression**: </p>|information|
|High memory utilizarion alarm on Pool "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: (last(/Cisco 7600 Health SNMP/ciscoMemoryPoolUsed["{#SNMPVALUE}"])*100 ) / last(/Cisco 7600 Health SNMP/ciscoMemoryPoolTotal["{#SNMPVALUE}"]) > 80</p><p>**Recovery expression**: </p>|high|
|High memory utilizarion warning on Pool "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: (last(/Cisco 7600 Health SNMP/ciscoMemoryPoolUsed["{#SNMPVALUE}"])*100 ) / last(/Cisco 7600 Health SNMP/ciscoMemoryPoolTotal["{#SNMPVALUE}"]) > 70</p><p>**Recovery expression**: </p>|average|
|Status "{#SNMPVALUE}" is critical (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonSupplyState["{#SNMPVALUE}"])=3</p><p>**Recovery expression**: </p>|high|
|Status "{#SNMPVALUE}" is non-operable (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonSupplyState["{#SNMPVALUE}"])=2</p><p>**Recovery expression**: </p>|warning|
|Status "{#SNMPVALUE}" is not functioning (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonSupplyState["{#SNMPVALUE}"])=6</p><p>**Recovery expression**: </p>|average|
|Status "{#SNMPVALUE}" is shutdown (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/ciscoEnvMonSupplyState["{#SNMPVALUE}"])=4</p><p>**Recovery expression**: </p>|average|
|High CPU Alarm #"{#SNMPINDEX}" 1min Usage (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cpmCPUTotal1minRev["{#SNMPINDEX}"])>90</p><p>**Recovery expression**: </p>|high|
|High CPU Warning #"{#SNMPINDEX}" 1min Usage (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cpmCPUTotal1minRev["{#SNMPINDEX}"])>70</p><p>**Recovery expression**: </p>|average|
|High CPU Alarm #"{#SNMPINDEX}" 5min Usage (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cpmCPUTotal5minRev["{#SNMPINDEX}"])>90</p><p>**Recovery expression**: </p>|high|
|High CPU Warning #"{#SNMPINDEX}" 5min Usage (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco 7600 Health SNMP/cpmCPUTotal5minRev["{#SNMPINDEX}"])>70</p><p>**Recovery expression**: </p>|average|
