# Template_Extreme_X450a

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory|<p>EXTREME-SOFTWARE-MONITOR-MIB::extremeMemoryMonitorSystemSlotId Slot Id of the MSM monitored.</p>|`SNMP agent`|extremeMemoryMonitorSystemSlotId<p>Update: 300</p>|
|CPU|<p>EXTREME-SOFTWARE-MONITOR-MIB::extremeCpuMonitorSystemSlotId Slot Id of the system monitored.</p>|`SNMP agent`|extremeCpuMonitorSystemSlotId<p>Update: 300</p>|
|FAN|<p>EXTREME-SYSTEM-MIB::extremeFanEntPhysicalIndex The entity index for this fan entity in the entityPhysicalTable table of the entity MIB.</p>|`SNMP agent`|extremeFanEntPhysicalIndex<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Operational Status of Primary Power Supply|<p>EXTREME-SYSTEM-MIB::extremePrimaryPowerOperational Operational status of internal power supply of a device.</p>|`SNMP agent`|extremePrimaryPowerOperational<p>Update: 60</p>|
|CPU Utilization Threshold|<p>EXTREME-SOFTWARE-MONITOR-MIB::extremeCpuMonitorThreshold Threshold for CPU Aggregation utilization trap</p>|`SNMP agent`|extremeCpuMonitorThreshold<p>Update: 600</p>|
|CPU Utilization|<p>EXTREME-SOFTWARE-MONITOR-MIB::extremeCpuMonitorTotalUtilization Total CPU utlization (percentage) as of last sampling.</p>|`SNMP agent`|extremeCpuMonitorTotalUtilization<p>Update: 60</p>|
|Device Temperature|<p>EXTREME-SYSTEM-MIB::extremeCurrentTemperature Current temperature in degrees celcius measured inside device enclosure.</p>|`SNMP agent`|extremeCurrentTemperature<p>Update: 300</p>|
|Primary Software Revision|<p>EXTREME-SYSTEM-MIB::extremePrimarySoftwareRev The software revision of the primary image stored in this device.</p>|`SNMP agent`|extremePrimarySoftwareRev<p>Update: 86400</p>|
|Status of Redundant Power Supply|<p>EXTREME-SYSTEM-MIB::extremeRedundantPowerAlarm Alarm state of an external redundant power supply to a device. Alarm state indicates either fan failure or overtemperature condition.</p>|`SNMP agent`|extremeRedundantPowerAlarm<p>Update: 60</p>|
|Over Temperature Status|<p>EXTREME-SYSTEM-MIB::extremeOverTemperatureAlarm Alarm status of overtemperature sensor in device enclosure.</p>|`SNMP agent`|extremeOverTemperatureAlarm<p>Update: 60</p>|
|System ID|<p>EXTREME-SYSTEM-MIB::extremeSystemID This represents the System ID of the Summit Switch.</p>|`SNMP agent`|extremeSystemID<p>Update: 86400</p>|
|Operational Status of Redundant Power Supply|<p>EXTREME-SYSTEM-MIB::extremeRedundantPowerStatus Operational status of an external redundant power supply to a device.</p>|`SNMP agent`|extremeRedundantPowerStatus<p>Update: 60</p>|
|Secondary Software Revision|<p>EXTREME-SYSTEM-MIB::extremeSecondarySoftwareRev The software revision of the secondary image stored in this device.</p>|`SNMP agent`|extremeSecondarySoftwareRev<p>Update: 86400</p>|
|Free Memory #$1|<p>EXTREME-SOFTWARE-MONITOR-MIB::extremeMemoryMonitorSystemFree Total amount of free memory in Kbytes in the system.</p>|`SNMP agent`|extremeMemoryMonitorSystemFree[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Total Memory #$1|<p>EXTREME-SOFTWARE-MONITOR-MIB::extremeMemoryMonitorSystemTotal Total amount of DRAM in Kbytes in the system.</p>|`SNMP agent`|extremeMemoryMonitorSystemTotal[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Used Memory #$1|<p>EXTREME-SOFTWARE-MONITOR-MIB::extremeMemoryMonitorSystemUsage Total amount of memory used by system services in Kbytes in the system.</p>|`SNMP agent`|extremeMemoryMonitorSystemUsage[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Used Memory #$1 by Applications|<p>EXTREME-SOFTWARE-MONITOR-MIB::extremeMemoryMonitorUserUsage Total amount of memory used by applications in Kbytes in the system.</p>|`SNMP agent`|extremeMemoryMonitorUserUsage[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|CPU #$1 Utilization (5min)|<p>EXTREME-SOFTWARE-MONITOR-MIB::extremeCpuMonitorSystemUtilization5mins The CPU utilization by system resources. This is the utilization of the system resourcesin the last 5 minutes.</p>|`SNMP agent`|extremeCpuMonitorSystemUtilization5mins[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Status of FAN #$1|<p>EXTREME-SYSTEM-MIB::extremeFanOperational Operational status of a cooling fan.</p>|`SNMP agent`|extremeFanOperational[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|High CPU #{#SNMPVALUE} Usage|<p>-</p>|<p>**Expression**: last(/Template_Extreme_X450a/extremeCpuMonitorSystemUtilization5mins[{#SNMPINDEX}])>=last(/Template_Extreme_X450a/extremeCpuMonitorThreshold)</p><p>**Recovery expression**: </p>|average|
|Status of FAN #{#SNMPVALUE} is failed|<p>-</p>|<p>**Expression**: last(/Template_Extreme_X450a/extremeFanOperational[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|average|
|High Memory #{#SNMPVALUE} Usage|<p>-</p>|<p>**Expression**: last(/Template_Extreme_X450a/extremeMemoryMonitorSystemFree[{#SNMPVALUE}])<=last(/Template_Extreme_X450a/extremeMemoryMonitorSystemTotal[{#SNMPVALUE}])*0.05</p><p>**Recovery expression**: </p>|average|
|High Memory #{#SNMPVALUE} Usage (LLD)|<p>-</p>|<p>**Expression**: last(/Template_Extreme_X450a/extremeMemoryMonitorSystemFree[{#SNMPVALUE}])<=last(/Template_Extreme_X450a/extremeMemoryMonitorSystemTotal[{#SNMPVALUE}])*0.05</p><p>**Recovery expression**: </p>|average|
|High CPU #{#SNMPVALUE} Usage (LLD)|<p>-</p>|<p>**Expression**: last(/Template_Extreme_X450a/extremeCpuMonitorSystemUtilization5mins[{#SNMPINDEX}])>=last(/Template_Extreme_X450a/extremeCpuMonitorThreshold)</p><p>**Recovery expression**: </p>|average|
|Status of FAN #{#SNMPVALUE} is failed (LLD)|<p>-</p>|<p>**Expression**: last(/Template_Extreme_X450a/extremeFanOperational[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|average|
