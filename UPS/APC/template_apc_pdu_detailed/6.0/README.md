# APC PDU

## Overview

I have created a very detailed template for a Rack Mounted APC PDU. I spent a considerable amount of time digging through the MIB to obtain all the correct OID numbers pertaining to each Item for the PDU to use with SNMP. The template includes:


* 7 Applications:
	+ Enviornment
	+ Information
	+ Outlets
	+ Peaks
	+ Phases
	+ Power
	+ Thresholds
* 39 Items for monitoring that range from:
	+ 7 Items for each phase totaling 21 items
		- Load
		- Overload Thresholds
		- Current
		- Power
		- Voltage
	+ Firmware Rev
	+ Total Power
	+ Peak Power
	+ Load State
	+ Rack Temp/Humidity (if the sensors are present)
* 13 Triggers
	+ Individual triggers for each phase
		- Voltage High and Low
	+ Load State Changes
	+ Power Trigger
	+ Near overload and Overload Triggers
* 3 Default Graphs
	+ Current Usage
	+ Phase Power Status
	+ Temp/Humid (If sensors are present)


 


I hope you enjoy using this template as much as I have. You can tweak the Interval and History settings within each item per your needs. I have also included HOSTNAME calls in each Trigger to Identify the host that is causing the Trigger.



## Author

Chad Hoye

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Outlets|<p>-</p>|`SNMP agent`|rPDU2Outlet<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Power Supply Alarm|<p>Indicates a power supply alarm is active when value equals alarm (2)</p>|`SNMP agent`|rPDU2DeviceStatusPowerSupplyAlarm.1<p>Update: 10s</p>|
|Phase 2 Peak Current|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusPeakCurrent.2<p>Update: 10s</p>|
|Rack Inlet Humidity|<p>The Relative Humidity entering the rack</p>|`SNMP agent`|rPDU2SensorTempHumidityStatusRelativeHumidity.1<p>Update: 10s</p>|
|Phase 2 Low Load Threshold|<p>-</p>|`SNMP agent`|rPDULoadPhaseConfigLowLoadThreshold.2<p>Update: 12h</p>|
|Peak Power Timestamp|<p>-</p>|`SNMP agent`|rPDU2DeviceStatusPeakPowerTimestamp.1<p>Update: 1h</p>|
|Power Near Overload Threshold|<p>User-defined near power overload threshold, measured in tenths of kilowatts. Models that do not support this feature will respond to this OID with a value of -1.</p>|`SNMP agent`|rPDU2DeviceConfigNearOverloadPowerThreshold.1<p>Update: 12h</p>|
|Load State|<p>Indicates the present load status of the Rack PDU.</p>|`SNMP agent`|rPDU2DeviceStatusLoadState.1<p>Update: 10s</p>|
|Serial Number|<p>-</p>|`SNMP agent`|rPDU2IdentSerialNumber.1<p>Update: 12h</p>|
|Phase 3 Overload Threshold|<p>-</p>|`SNMP agent`|rPDULoadPhaseConfigOverloadThreshold.3<p>Update: 12h</p>|
|Max Phase Current Rating|<p>The maximum current rating, measured in Amps, for the Rack PDU</p>|`SNMP agent`|rPDU2DevicePropertiesMaxPhaseCurrentRating.1<p>Update: 1h</p>|
|Phase 3 Peak Current|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusPeakCurrent.3<p>Update: 10s</p>|
|Peak Power|<p>The peak power consumption of the Rack PDU load in hundredths of kilowatts.</p>|`SNMP agent`|rPDU2DeviceStatusPeakPower.1<p>Update: 10s</p>|
|Phase 1 Voltage|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusVoltage.1<p>Update: 10s</p>|
|Phase 3 Power|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusPower.3<p>Update: 10s</p>|
|Power Consumption|<p>The power consumption of the Rack PDU load in hundredths of kilowatts. Models that do not support this feature will respond to this OID with a value of -1.</p>|`SNMP agent`|rPDU2DeviceStatusPower.1<p>Update: 10s</p>|
|Phase 1 Power|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusPower.1<p>Update: 10s</p>|
|Phase 3 Load|<p>-</p>|`SNMP agent`|rPDULoadStatusLoad.3<p>Update: 10s</p>|
|Phase 2 Overload Threshold|<p>-</p>|`SNMP agent`|rPDULoadPhaseConfigOverloadThreshold.2<p>Update: 12h</p>|
|Phase 2 Near Overload Threshold|<p>-</p>|`SNMP agent`|rPDULoadPhaseConfigNearOverloadThreshold.2<p>Update: 12h</p>|
|Firmware Rev|<p>-</p>|`SNMP agent`|rPDU2IdentFirmwareRev.1<p>Update: 12h</p>|
|Phase 2 Voltage|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusVoltage.2<p>Update: 10s</p>|
|Phase 2 Load|<p>-</p>|`SNMP agent`|rPDULoadStatusLoad.2<p>Update: 10s</p>|
|Phase 2 Power|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusPower.2<p>Update: 10s</p>|
|Phase 1 Overload Threshold|<p>-</p>|`SNMP agent`|rPDULoadPhaseConfigOverloadThreshold.1<p>Update: 12h</p>|
|System Up Time|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 1h</p>|
|Phase 1 Near Overload Threshold|<p>-</p>|`SNMP agent`|rPDULoadPhaseConfigNearOverloadThreshold.1<p>Update: 12h</p>|
|Phase 3 Near Overload Threshold|<p>-</p>|`SNMP agent`|rPDULoadPhaseConfigNearOverloadThreshold.3<p>Update: 12h</p>|
|Phase 3 Low Load Threshold|<p>-</p>|`SNMP agent`|rPDULoadPhaseConfigLowLoadThreshold.3<p>Update: 12h</p>|
|Location|<p>-</p>|`SNMP agent`|rPDU2IdentLocation.1<p>Update: 1h</p>|
|Phase 3 Voltage|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusVoltage.3<p>Update: 10s</p>|
|Phase 1 Low Load Threshold|<p>-</p>|`SNMP agent`|rPDULoadPhaseConfigLowLoadThreshold.1<p>Update: 12h</p>|
|Phase 1 Load|<p>-</p>|`SNMP agent`|rPDULoadStatusLoad.1<p>Update: 10s</p>|
|Model Number|<p>-</p>|`SNMP agent`|rPDU2IdentModelNumber.1<p>Update: 12h</p>|
|Phase Status Peak Current Timestamp|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusPeakCurrentTimestamp.1<p>Update: 1h</p>|
|Identification Name|<p>-</p>|`SNMP agent`|rPDU2IdentName.1<p>Update: 1h</p>|
|Phase 1 Peak Current|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusPeakCurrent.1<p>Update: 12h</p>|
|Power Overload Threshold|<p>User-defined near power overload threshold, measured in tenths of kilowatts. Models that do not support this feature will respond to this OID with a value of -1.</p>|`SNMP agent`|rPDU2DeviceConfigOverloadPowerThreshold.1<p>Update: 12h</p>|
|Total Energy|<p>A user re-settable energy meter measuring Rack PDU load energy consumption in tenths of kilowatt-hours.</p>|`SNMP agent`|rPDU2DeviceStatusEnergy.1<p>Update: 1h</p>|
|Rack Inlet Temp|<p>Temperature of Air entering Rack</p>|`SNMP agent`|rPDU2SensorTempHumidityStatusTempF.1<p>Update: 10s</p>|
|Outlet $1 Name|<p>-</p>|`SNMP agent`|rPDU2OutletSwitchedConfigName[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Outlet $1 Bank|<p>-</p>|`SNMP agent`|rPDU2OutletSwitchedPropertiesBank[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Outlet $1 State|<p>-</p>|`SNMP agent`|rPDU2OutletSwitchedStatusState[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Outlet {#SNMPVALUE} State Change|<p>-</p>|<p>**Expression**: (last(/APC PDU/rPDU2OutletSwitchedStatusState[{#SNMPINDEX}],#1)<>last(/APC PDU/rPDU2OutletSwitchedStatusState[{#SNMPINDEX}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Outlet {#SNMPVALUE} State Change (LLD)|<p>-</p>|<p>**Expression**: (last(/APC PDU/rPDU2OutletSwitchedStatusState[{#SNMPINDEX}],#1)<>last(/APC PDU/rPDU2OutletSwitchedStatusState[{#SNMPINDEX}],#2))=1</p><p>**Recovery expression**: </p>|information|
