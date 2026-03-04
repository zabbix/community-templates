# Monitoring UPS

## Overview

Hi


Here is a template for Socomec UPS. 


It is made mostly with traps. 


Triggers are included. 


 


Do not hesitate to ask me questions if you have some.


Thanks.



## Author

Vincent MATIAS

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|UPS trap fallback|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|{HOST.NAME} : Power restored|<p>INFORMATION: Input power has been restored.</p>|`SNMP trap`|snmptrap["upsTrapPowerRestored"]<p>Update: 0</p>|
|{HOST.NAME} imminent stop|<p>SEVERE: The UPS is near to switch off the output power.</p>|`SNMP trap`|snmptrap["upsTrapImminentStop"]<p>Update: 0</p>|
|{HOST.NAME} alarm entry removed|<p>This trap is sent each time an alarm is removed from the alarm table. It is sent on the removal of all alarms except for upsAlarmTestInProgress.</p>|`SNMP trap`|snmptrap["upsTrapAlarmEntryRemoved"]<p>Update: 0</p>|
|{HOST.NAME} output is on Battery|<p>The UPS is operating on battery power. This trap is persistent and is resent at one minute intervals until the UPS either turns off or is no longer running on battery.</p>|`SNMP trap`|snmptrap["upsTrapOnBattery"]<p>Update: 0</p>|
|{HOST.NAME} status is normal|<p>INFORMATION: The UPS status is normal.</p>|`SNMP trap`|snmptrap["upsTrapUpsNormal"]<p>Update: 0</p>|
|{HOST.NAME} battery low|<p>SEVERE: Battery is near to be discharged.</p>|`SNMP trap`|snmptrap["upsTrapBatteryLow"]<p>Update: 0</p>|
|{HOST.NAME} test completed|<p>This trap is sent upon completion of a UPS diagnostic test.</p>|`SNMP trap`|snmptrap["upsTrapTestCompleted"]<p>Update: 0</p>|
|{HOST.NAME} battery test failed|<p>SEVERE: UPS failed the last test of battery.</p>|`SNMP trap`|snmptrap["upsTrapBattTestFailed"]<p>Update: 0</p>|
|{HOST.NAME} overloading|<p>SEVERE: The UPS has sensed a load greater than 100 percent of its rated capacity.</p>|`SNMP trap`|snmptrap["upsTrapOverload"]<p>Update: 0</p>|
|{HOST.NAME} alarm entry added|<p>This trap is sent each time an alarm is inserted into to the alarm table. It is sent on the insertion of all alarms except for upsAlarmOnBattery and upsAlarmTestInProgress.</p>|`SNMP trap`|snmptrap["upsTrapAlarmEntryAdded"]<p>Update: 0</p>|
|{HOST.NAME} output is on mains|<p>SEVERE: The UPS output is on mains.</p>|`SNMP trap`|snmptrap["upsTrapOnMains"]<p>Update: 0</p>|
|{HOST.NAME} turned off|<p>WARNING: The UPS has been turned off by the management station.</p>|`SNMP trap`|snmptrap["upsTurnedOff"]<p>Update: 0</p>|
|{HOST.NAME} status|<p>-</p>|`SNMP agent`|upsIdentModel.0<p>Update: 1m</p>|
|{HOST.NAME} temperature higher than its limit|<p>SEVERE: The UPS has sensed a temperature greater than its limit.</p>|`SNMP trap`|snmptrap["upsTrapOverTemperature"]<p>Update: 0</p>|
|{HOST.NAME} est sur batterie|<p>WARNING: The UPS has switched to battery backup power.</p>|`SNMP trap`|snmptrap["upsTrapOnBatteryPower"]<p>Update: 0</p>|
|{HOST.NAME} redundancy lost|<p>SEVERE: Redoundancy is lost.</p>|`SNMP trap`|snmptrap["upsTrapRedoundancyLost"]<p>Update: 0</p>|
|{HOST.NAME} ping|<p>-</p>|`Simple check`|icmpping[]<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

