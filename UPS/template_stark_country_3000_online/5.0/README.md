# Stark-3000-snmp

## Overview

UPS Stark country 3000 online.


<https://en.stark-power.de>


Template based on "Template\_UPS\_Inform-flexipower"



## Author

Sergey Prisada

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Battery charge|<p>An estimate of the battery charge remaining expressed as a percent of full charge.</p>|`SNMP agent`|upsAdvBatteryCapacity<p>Update: 30</p>|
|Battery voltage|<p>-</p>|`SNMP agent`|upsAdvBatteryActualVoltage<p>Update: 180</p>|
|UPS software version|<p>-</p>|`SNMP agent`|upsIdentUPSSoftwareVersion<p>Update: 3600</p>|
|The present bypass frequency|<p>The present bypass frequency.</p>|`SNMP agent`|PresentBypassFrequency<p>Update: 30</p>|
|Load current in procent|<p>The percentage of the UPS power capacity presently being used on this output line, i.e., the greater of the percent load of true power capacity and the percent load of VA.</p>|`SNMP agent`|upsAdvOutputCurrent<p>Update: 30</p>|
|Ups bat est charge remaining|<p>An estimate of the battery charge remaining expressed as a percent of full charge.</p>|`SNMP agent`|oid.companymib.upsbattery.upsbatstatus<p>Update: 30</p>|
|Input frequency|<p>The present bypass frequency.</p>|`SNMP agent`|upsAdvInputFrequency<p>Update: 180</p>|
|Output voltage|<p>The output voltage of the UPS system.</p>|`SNMP agent`|upsAdvOutputVoltage<p>Update: 30</p>|
|Input voltage|<p>The input utility line voltage.</p>|`SNMP agent`|upsAdvInputLineVoltage<p>Update: 30</p>|
|UPS name|<p>-</p>|`SNMP agent`|upsIdentName<p>Update: 3600</p>|
|Output frequency|<p>The current output frequency of the UPS system</p>|`SNMP agent`|upsAdvOutputFrequency<p>Update: 180</p>|
|Battery status|<p>The indication of the capacity remaining in the UPS system's batteries. A value of batteryNormal indicates that the remaining run-time is greater than upsConfigLowBattTime. A value of batteryLow indicates that the remaining battery run-time is less than or equal to upsConfigLowBattTime. A value of batteryDepleted indicates that the UPS will be unable to sustain the present load when and if the utility power is lost (including the possibility that the utility power is mandatoryly absent and the UPS is unable to sustain the output). unknown(1), batteryNormal(2), batteryLow(3), batteryDepleted(4), batteryDischarging(5), batteryFailure(6), batteryReplace(7), batterysilence(8)</p>|`SNMP agent`|upsAdvBatteryReplaceIndicator<p>Update: 180</p>|
|UPS model|<p>-</p>|`SNMP agent`|upsBasicIdentModel<p>Update: 3600</p>|
|Extend work temperature|<p>The ambient temperature at or near the UPS Battery casing.</p>|`SNMP agent`|iemStatusProbeCurrentTemp<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

