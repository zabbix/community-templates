# Template_A10_AX_Series

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Power Supply Discovery|<p>A10-AX-MIB::axPowerSupplyName The pwer supply name.</p>|`SNMP agent`|axPowerSupplyName<p>Update: 300</p>|
|FAN Discovery|<p>A10-AX-MIB::axFanName The system fan name.</p>|`SNMP agent`|axFanName<p>Update: 300</p>|
|Power Supply Voltage Discovery|<p>A10-AX-MIB::axPowerSupplyVoltageDescription The description of the system power supply voltage.</p>|`SNMP agent`|axPowerSupplyVoltageDescription<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Total Disk Space|<p>A10-AX-MIB::axSysDiskTotalSpace The total space of the disk in MB.</p>|`SNMP agent`|axSysDiskTotalSpace<p>Update: 3600</p>|
|Speed of FAN #3|<p>A10-AX-MIB::axSysHwFan3Speed The fan3's speed</p>|`SNMP agent`|axSysHwFan3Speed<p>Update: 300</p>|
|CPU Usage (5 sec)|<p>A10-AX-MIB::axSysAverageCpuUsage The average CPU usage in last 5 seconds.</p>|`SNMP agent`|axSysAverageCpuUsage<p>Update: 60</p>|
|System Temperature|<p>A10-AX-MIB::axSysHwPhySystemTemp The physical system temperature in Celsius.</p>|`SNMP agent`|axSysHwPhySystemTemp<p>Update: 60</p>|
|Speed of FAN #2|<p>A10-AX-MIB::axSysHwFan2Speed The fan2's speed.</p>|`SNMP agent`|axSysHwFan2Speed<p>Update: 300</p>|
|Total memory|<p>A10-AX-MIB::axSysMemoryTotal The total memory(KB).</p>|`SNMP agent`|axSysMemoryTotal<p>Update: 3600</p>|
|Speed of FAN #1|<p>A10-AX-MIB::axSysHwFan1Speed The fan1's speed.</p>|`SNMP agent`|axSysHwFan1Speed<p>Update: 300</p>|
|Used memory|<p>A10-AX-MIB::axSysMemoryUsage The usage memory(KB).</p>|`SNMP agent`|axSysMemoryUsage<p>Update: 300</p>|
|Data CPU Usage (5 sec)|<p>A10-AX-MIB::axSysAverageDataCpuUsage The average data CPU usage in last 5 seconds.</p>|`SNMP agent`|axSysAverageDataCpuUsage<p>Update: 60</p>|
|Serial Number|<p>A10-AX-MIB::axSysSerialNumber The system serial number.</p>|`SNMP agent`|axSysSerialNumber<p>Update: 86400</p>|
|Status of Right or Upper Power Supply|<p>A10-AX-MIB::axSysUpperOrRightPowerSupplyStatus The upper/right power supply status.</p>|`SNMP agent`|axSysUpperOrRightPowerSupplyStatus<p>Update: 60</p>|
|Firmware Version|<p>A10-AX-MIB::axSysFirmwareVersion The system firmware version.</p>|`SNMP agent`|axSysFirmwareVersion<p>Update: 86400</p>|
|Free Disk Space|<p>A10-AX-MIB::axSysDiskFreeSpace The free space of the disk in MB.</p>|`SNMP agent`|axSysDiskFreeSpace<p>Update: 300</p>|
|Status of Left or Lower Power Supply|<p>A10-AX-MIB::axSysLowerOrLeftPowerSupplyStatus The lower/left power supply status.</p>|`SNMP agent`|axSysLowerOrLeftPowerSupplyStatus<p>Update: 60</p>|
|Control CPU Usage (5 sec)|<p>A10-AX-MIB::axSysAverageControlCpuUsage The average control CPU usage in last 5 seconds.</p>|`SNMP agent`|axSysAverageControlCpuUsage<p>Update: 60</p>|
|Status of Power Supply "$1"|<p>A10-AX-MIB::axPowerSupplyStatus The power supply status.</p>|`SNMP agent`|axPowerSupplyStatus["{#SNMPVALUE}"]<p>Update: 30</p><p>LLD</p>|
|Speed of FAN "$1"|<p>A10-AX-MIB::axFanSpeed The fan speed.</p>|`SNMP agent`|axFanSpeed["{#SNMPVALUE}"]<p>Update: 300</p><p>LLD</p>|
|Status of "$1" FAN|<p>A10-AX-MIB::axFanStatus Fan status: 0: Failed, 4: OK-fixed/high, 5: OK-low/med, 6: OK-med/med, 7: OK-med/high, -2: not ready, -1: unknown.</p>|`SNMP agent`|axFanStatus["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Status of Power Supply Voltage "$1"|<p>A10-AX-MIB::axPowerSupplyVoltageStatus The status of the indexed system power supply voltage. This is only supported for the platform where the sensor data is available.</p>|`SNMP agent`|axPowerSupplyVoltageStatus["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|FAN "{#SNMPVALUE}" is failed|<p>-</p>|<p>**Expression**: {Template_A10_AX_Series:axFanStatus["{#SNMPVALUE}"].last()}=0</p><p>**Recovery expression**: </p>|high|
|Power Supply "{#SNMPVALUE}" is absent|<p>-</p>|<p>**Expression**: {Template_A10_AX_Series:axPowerSupplyStatus["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Power Supply "{#SNMPVALUE}" is off|<p>-</p>|<p>**Expression**: {Template_A10_AX_Series:axPowerSupplyStatus["{#SNMPVALUE}"].last()}=0</p><p>**Recovery expression**: </p>|warning|
|Power Supply Voltage "{#SNMPVALUE}" is invalid|<p>-</p>|<p>**Expression**: {Template_A10_AX_Series:axPowerSupplyVoltageStatus["{#SNMPVALUE}"].last()}=0</p><p>**Recovery expression**: </p>|average|
|Power Supply "{#SNMPVALUE}" is absent (LLD)|<p>-</p>|<p>**Expression**: {Template_A10_AX_Series:axPowerSupplyStatus["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Power Supply "{#SNMPVALUE}" is off (LLD)|<p>-</p>|<p>**Expression**: {Template_A10_AX_Series:axPowerSupplyStatus["{#SNMPVALUE}"].last()}=0</p><p>**Recovery expression**: </p>|warning|
|FAN "{#SNMPVALUE}" is failed (LLD)|<p>-</p>|<p>**Expression**: {Template_A10_AX_Series:axFanStatus["{#SNMPVALUE}"].last()}=0</p><p>**Recovery expression**: </p>|high|
|Power Supply Voltage "{#SNMPVALUE}" is invalid (LLD)|<p>-</p>|<p>**Expression**: {Template_A10_AX_Series:axPowerSupplyVoltageStatus["{#SNMPVALUE}"].last()}=0</p><p>**Recovery expression**: </p>|average|
