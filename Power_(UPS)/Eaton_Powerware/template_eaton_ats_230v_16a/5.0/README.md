# SNMP Eaton ATS

## Overview

Template for Switching Power Distribution Unit with environmental sensor.


Includes triggers for:


* Self Test Status
* Power source changed
* power source shortcircuit
* Power souirce status source 1 and 2
* Humidity high
* Temperature high


As this unit is often applied in small business environment, the environmental sensor is excellent to check whether the AC is funtioning normally.


You might need to adjust for Fahrenheit. 



## Author

Maurice Flier

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PowerInputFrequency2|<p>-</p>|`SNMP agent`|PowerInputFrequency2<p>Update: 900</p>|
|PowerStatusInputVoltage2|<p>-</p>|`SNMP agent`|PowerStatusInputVoltage2<p>Update: 30</p>|
|DeviceStatusOperationMode|<p>-</p>|`SNMP agent`|DeviceStatusOperationMode<p>Update: 5</p>|
|DeviceStatusInternalFailure|<p>-</p>|`SNMP agent`|DeviceStatusInternalFailure<p>Update: 30</p>|
|DeviceStatusOverload|<p>-</p>|`SNMP agent`|DeviceStatusOverload<p>Update: 30</p>|
|PowerStatusInputInternalFailure1|<p>-</p>|`SNMP agent`|PowerStatusInputInternalFailure1<p>Update: 30</p>|
|EnvHumLowerLimit|<p>-</p>|`SNMP agent`|EnvHumLowerLimit<p>Update: 3600</p>|
|PowerInputFrequency1|<p>-</p>|`SNMP agent`|PowerInputFrequency1<p>Update: 900</p>|
|EnvTemp|<p>-</p>|`SNMP agent`|EnvTemp<p>Update: 15</p>|
|DeviceStatusShortCircuit|<p>-</p>|`SNMP agent`|DeviceStatusShortCircuit<p>Update: 30</p>|
|PowerStatusInputGood2|<p>-</p>|`SNMP agent`|PowerStatusInputGood2<p>Update: 30</p>|
|PowerOutputVoltage|<p>-</p>|`SNMP agent`|PowerOutputVoltage<p>Update: 15</p>|
|DeviceStatusOverTemperature|<p>-</p>|`SNMP agent`|DeviceStatusOverTemperature<p>Update: 30</p>|
|PowerStatusInputDephasing|<p>-</p>|`SNMP agent`|PowerStatusInputDephasing<p>Update: 30</p>|
|PowerStatusInputFrequency1|<p>-</p>|`SNMP agent`|PowerStatusInputFrequency1<p>Update: 30</p>|
|PowerStatusInputUsed2|<p>-</p>|`SNMP agent`|PowerStatusInputUsed2<p>Update: 30</p>|
|PowerInputVoltage2|<p>-</p>|`SNMP agent`|PowerInputVoltage2<p>Update: 15</p>|
|PowerStatusInputVoltage1|<p>-</p>|`SNMP agent`|PowerStatusInputVoltage1<p>Update: 30</p>|
|EnvHumUpperLimit|<p>-</p>|`SNMP agent`|EnvHumUpperLimit<p>Update: 3600</p>|
|PowerInputVoltage1|<p>-</p>|`SNMP agent`|PowerInputVoltage1<p>Update: 15</p>|
|EnvTempLowerLimit|<p>-</p>|`SNMP agent`|EnvTempLowerLimit<p>Update: 3600</p>|
|PowerStatusInputGood1|<p>-</p>|`SNMP agent`|PowerStatusInputGood1<p>Update: 30</p>|
|PowerInputIndex1|<p>-</p>|`SNMP agent`|PowerInputIndex1<p>Update: 900</p>|
|PowerInputIndex2|<p>-</p>|`SNMP agent`|PowerInputIndex2<p>Update: 900</p>|
|DeviceStatusOutput|<p>-</p>|`SNMP agent`|DeviceStatusOutput<p>Update: 30</p>|
|PowerStatusInputFrequency2|<p>-</p>|`SNMP agent`|PowerStatusInputFrequency2<p>Update: 30</p>|
|EnvTempUpperLimit|<p>-</p>|`SNMP agent`|EnvTempUpperLimit<p>Update: 3600</p>|
|EnvHum|<p>-</p>|`SNMP agent`|EnvHum<p>Update: 15</p>|
|PowerStatusInputUsed1|<p>-</p>|`SNMP agent`|PowerStatusInputUsed1<p>Update: 30</p>|
|PowerStatusInputInternalFailure2|<p>-</p>|`SNMP agent`|PowerStatusInputInternalFailure2<p>Update: 30</p>|
|PowerOutputCurrent|<p>-</p>|`SNMP agent`|PowerOutputCurrent<p>Update: 15</p>|
|DeviceStatusTransferTest|<p>-</p>|`SNMP agent`|DeviceStatusTransferTest<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

