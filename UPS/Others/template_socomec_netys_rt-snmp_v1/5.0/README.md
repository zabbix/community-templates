# SOCOMEC UPS

## Overview

This templase include some info and trigger such as:


- Battery


- Temperature


- Output


- Alarms


 


You just edit the SNMP\_COMMUNITY value into the template



## Author

diablofight89

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`afLpogHP16EW`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Firmware Version|<p>-</p>|`SNMP agent`|upsfirmware.0<p>Update: 1d</p>|
|Alarm - UPS OnBattery Power|<p>"The UPS is drawing power from the batteries. (A019)"</p>|`SNMP agent`|upsAlarmOnBattery<p>Update: 1m</p>|
|Output Load|<p>"Output global Load Rate."</p>|`SNMP agent`|upsOutputLoadRate.0<p>Update: 1m</p>|
|Battery Status|<p>"The present battery status"</p>|`SNMP agent`|upsBatteryStatus.0<p>Update: 1m</p>|
|Ambient Temperature|<p>"The ambient temperature inside the UPS in 0.1 degree"</p>|`SNMP agent`|upsAmbientTemperature.0<p>Update: 1m</p>|
|Battery Time Remaining|<p>"An estimate of the time to battery charge depletion under the present load conditions. Compute when UPS is on battery power"</p>|`SNMP agent`|upsEstimatedMinutesRemaining.0<p>Update: 1m</p>|
|Alarm - UPS Overload|<p>"The output load exceeds the UPS output capacity. (A001)"</p>|`SNMP agent`|upsAlarmOverload.0<p>Update: 1m</p>|
|Battery Percent|<p>"An estimate of the battery charge remaining expressed as a percent of full charge."</p>|`SNMP agent`|upsEstimatedChargeRemaining.0<p>Update: 1m</p>|
|Ping check|<p>-</p>|`Simple check`|icmpping<p>Update: 30s</p>|
|Alarm - UPS OnBypass|<p>"Load supplied by automatic bypass. Load not protected."</p>|`SNMP agent`|upsAlarmOnBypass.0<p>Update: 1m</p>|
|Serial Number|<p>-</p>|`SNMP agent`|upsIdentSerialNumber.0<p>Update: 1d</p>|
|Alarm - UPS LowBattery|<p>"The remaining battery run-time is less than or equal to battery low threshold. (A018)"</p>|`SNMP agent`|upsAlarmLowBattery.0<p>Update: 1m</p>|
|Output Frequency|<p>"The current output frequency of the UPS system in 0.1 of HZ."</p>|`SNMP agent`|upsOutputFrequency.0<p>Update: 1m</p>|
|Alarm Present Quantity|<p>"The present number of active alarm conditions."</p>|`SNMP agent`|upsAlarmsPresent.0<p>Update: 1m</p>|
|Alarm - Battery Temperature|<p>"Battery Temperature Alarm. (A020)"</p>|`SNMP agent`|upsAlarmBatteryTemperature.0<p>Update: 1m</p>|
|Model|<p>-</p>|`SNMP agent`|upsIdentModel.0<p>Update: 1d</p>|
|Input Frequency|<p>"The current input frequency to the UPS system in 0.1 HZ."</p>|`SNMP agent`|upsInputFrequency.0<p>Update: 1m</p>|
|Output Status|<p>"The present source of output power."</p>|`SNMP agent`|upsOutputSource.0<p>Update: 1m</p>|
|Alarm - Fan Fault|<p>"Fans failure. (A054)"</p>|`SNMP agent`|upsAlarmFansFailure.0<p>Update: 1m</p>|
|Battery Voltage|<p>"The magnitude of the present battery voltage in 0.1 Volt DC."</p>|`SNMP agent`|upsBatteryVoltage.0<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

