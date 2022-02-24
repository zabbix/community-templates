# UPS - diogont

## Overview

Full clone of Template UPS - diogont (thanks Diogo Teixeira). Above you view the main changes for this template:


For the metrics. We included the measurements 2 and 3:


* UPS input current
* UPS input frequency
* UPS input power
* UPS input voltage
* UPS output current
* UPS output frequency
* UPS output load
* UPS output power
* UPS output voltage


 


**Pay attention**


For triggers in my case 38 has disabled. we added this SNMP Check connect what check if the UPS have snmp connectivity. If past ten minute without data



## Author

Marcos Sousa

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|UPS input power 2|<p>-</p>|`SNMP agent`|upsAdvInputPower2<p>Update: 1m</p>|
|UPS input current 2|<p>-</p>|`SNMP agent`|upsAdvInputCurrent2<p>Update: 1m</p>|
|UPS input power 1|<p>-</p>|`SNMP agent`|upsAdvInputPower1<p>Update: 1m</p>|
|UPS battery capacity (%)|<p>-</p>|`SNMP agent`|upsAdvBatteryCapacity<p>Update: 1m</p>|
|Device Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 1m</p>|
|UPS output load 2 (%)|<p>-</p>|`SNMP agent`|upsAdvOutputLoad2<p>Update: 1m</p>|
|UPS output load 3 (%)|<p>-</p>|`SNMP agent`|upsAdvOutputLoad3<p>Update: 1m</p>|
|UPS output voltage 3|<p>-</p>|`SNMP agent`|upsAdvOutputVoltage3<p>Update: 1m</p>|
|UPS output current 2|<p>-</p>|`SNMP agent`|upsAdvOutputCurrent2<p>Update: 1m</p>|
|UPS input frequency 2|<p>-</p>|`SNMP agent`|upsAdvInputFrequency2<p>Update: 1m</p>|
|UPS input voltage 3|<p>-</p>|`SNMP agent`|upsAdvInputVoltage3<p>Update: 1m</p>|
|UPS input frequency 1|<p>-</p>|`SNMP agent`|upsAdvInputFrequency1<p>Update: 1m</p>|
|UPS input current 3|<p>-</p>|`SNMP agent`|upsAdvInputCurrent3<p>Update: 1m</p>|
|Contact|<p>-</p>|`SNMP agent`|sysContact<p>Update: 1m</p>|
|UPS output power 3|<p>-</p>|`SNMP agent`|upsAdvOutputPower3<p>Update: 1m</p>|
|UPS output frequency|<p>-</p>|`SNMP agent`|upsAdvOutputFrequency<p>Update: 1m</p>|
|UPS Alarm Input Bad|<p>-</p>|`SNMP agent`|upsAlarmInputBad<p>Update: 1m</p>|
|UPS output current 1|<p>-</p>|`SNMP agent`|upsAdvOutputCurrent1<p>Update: 1m</p>|
|Software version (full)|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 1m</p>|
|UPS input voltage 1|<p>-</p>|`SNMP agent`|upsAdvInputVoltage1<p>Update: 1m</p>|
|UPS output current 3|<p>-</p>|`SNMP agent`|upsAdvOutputCurrent3<p>Update: 1m</p>|
|UPS input voltage 2|<p>-</p>|`SNMP agent`|upsAdvInputVoltage2<p>Update: 1m</p>|
|UPS Alarm Output Overload|<p>-</p>|`SNMP agent`|upsAlarmOutputOverload<p>Update: 1m</p>|
|UPS output voltage 2|<p>-</p>|`SNMP agent`|upsAdvOutputVoltage2<p>Update: 1m</p>|
|UPS output power 1|<p>-</p>|`SNMP agent`|upsAdvOutputPower1<p>Update: 1m</p>|
|Device Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 1m</p>|
|UPS run time remaining|<p>-</p>|`SNMP agent`|upsAdvRunTimeRemaining<p>Update: 1m</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 1m</p>|
|UPS input frequency 3|<p>-</p>|`SNMP agent`|upsAdvInputFrequency3<p>Update: 1m</p>|
|UPS battery status|<p>-</p>|`SNMP agent`|upsBasicBatteryStatus<p>Update: 1m</p>|
|UPS time on battery|<p>-</p>|`SNMP agent`|upsBasicBatteryTimeOnBattery<p>Update: 1m</p>|
|UPS battery temperature|<p>-</p>|`SNMP agent`|upsAdvBatteryTemperature<p>Update: 1m</p>|
|UPS output voltage 1|<p>-</p>|`SNMP agent`|upsAdvOutputVoltage1<p>Update: 1m</p>|
|UPS output load 1 (%)|<p>-</p>|`SNMP agent`|upsAdvOutputLoad1<p>Update: 1m</p>|
|UPS input power 3|<p>-</p>|`SNMP agent`|upsAdvInputPower3<p>Update: 1m</p>|
|UPS input current 1|<p>-</p>|`SNMP agent`|upsAdvInputCurrent1<p>Update: 1m</p>|
|UPS output power 2|<p>-</p>|`SNMP agent`|upsAdvOutputPower2<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

