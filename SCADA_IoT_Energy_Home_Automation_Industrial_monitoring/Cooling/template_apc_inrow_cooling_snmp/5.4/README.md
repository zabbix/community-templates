# APC InRow Cooling

## Overview

This template is for use with APC InRow Cooling Units. There are 4 Applications, 25 Items, 6 Triggers, and 3 Graphs.


* Applications:
	+ Information
	+ Return Side
	+ Supply Side
	+ Thresholds
* Items:
	+ Airflow
	+ Condensate Pump Run hours
	+ Cooling Demand Power
	+ Cooling output Power
	+ Cool Set Point
	+ Dehumidify/Output
	+ Dew Point
	+ Discharge Pressure
	+ Fan Speed
	+ Humidifier Run Hours
	+ Humidify Output
	+ Operating Mode
	+ Return Side:
		- Air Temo
		- Sire Temp Threshold
		- Humudty
		- Humidity High and Low Thresholds
	+ Suction Pressure
	+ Suction Temp
	+ Supply Side:
		- Set Point
		- Air Temp
		- Air Temp Threshold
		- Humidity
	+ System Name
	+ System Up Time
* Triggers
	+ Return Humidity High and Low
	+ Return Temp Critical and High
	+ Supply Temp High


 


The Triggers are formed using the thresholds set by the APC InRow cooling system setup. The values are pulled from the MIB and stored as Item. This was more efficient when developing the triggers for use with multiple Cooling Units. 


All the Intervals and History values can be changed per your desired use. Thank you for downloading and using this template.


 



## Author

Chad Hoye

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Cool Set Point|<p>-</p>|`SNMP agent`|coolingUnitConfigurationAnalogValue.1.9<p>Update: 1d</p>|
|Humidifier Run Hrs|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.38<p>Update: 1h</p>|
|Return Humidity High Threshold|<p>-</p>|`SNMP agent`|coolingUnitConfigurationAnalogValue.1.8<p>Update: 1d</p>|
|Supply Air Temp Threshold|<p>-</p>|`SNMP agent`|coolingUnitConfigurationAnalogValue.1.3<p>Update: 1d</p>|
|Cooling Demand Power|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.12<p>Update: 30s</p>|
|Condensate Pump Run Hrs|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.39<p>Update: 1h</p>|
|Humidify Output|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.18<p>Update: 10s</p>|
|Dew Point|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.49<p>Update: 10s</p>|
|Operating Mode|<p>-</p>|`SNMP agent`|coolingUnitStatusDiscreteIntegerAsString.1.2<p>Update: 1h</p>|
|Fan Speed|<p>-</p>|`SNMP agent`|coolingUnitConfigurationAnalogDescription.1.5<p>Update: 10s</p>|
|System Up Time|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 1h</p>|
|Suction Temp|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.21<p>Update: 10s</p>|
|Discharge Pressure|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.24<p>Update: 10s</p>|
|Return  Air Temp Threshold|<p>-</p>|`SNMP agent`|coolingUnitConfigurationAnalogValue.1.5<p>Update: 1d</p>|
|Dehumidify Output|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.16<p>Update: 10s</p>|
|Airflow|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.3<p>Update: 10s</p>|
|Supply Air Set Point|<p>-</p>|`SNMP agent`|coolingUnitConfigurationAnalogValue.1.12<p>Update: 10s</p>|
|Suction Pressure|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.22<p>Update: 10s</p>|
|Return Humidity|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.11<p>Update: 10s</p>|
|System Name|<p>-</p>|`SNMP agent`|sysName.0<p>Update: 1d</p>|
|Return Humidity Low Threshold|<p>-</p>|`SNMP agent`|coolingUnitConfigurationAnalogValue.1.7<p>Update: 1d</p>|
|Supply Air Temp|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.6<p>Update: 10s</p>|
|Return Air Temp|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.8<p>Update: 10s</p>|
|Supply Humidity|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.10<p>Update: 10s</p>|
|Cooling Output Power|<p>-</p>|`SNMP agent`|coolingUnitStatusAnalogValue.1.13<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

