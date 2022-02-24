# Unifi Switch 16 POE-150W Temperature

## Overview

Adds 2 temperature sensors and 4 PoE temperature sensors for rackmountable Unifi Switches.


Tested with Unif Switch 16 POE-150W.


Information at 70°C and Warning at 90°C just like Unifi specifies in console output. The temperatures are the ones you can see in the screenshot.



## Author

frauhottelmann

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Temperature PoE 3|<p>Sensor PoE-03</p>|`SNMP agent`|system.temperature.poe3<p>Update: 30s</p>|
|Temperature PoE 2|<p>Sensor PoE-02</p>|`SNMP agent`|system.temperature.poe2<p>Update: 30s</p>|
|Temperature PoE 4|<p>Sensor PoE-04</p>|`SNMP agent`|system.temperature.poe4<p>Update: 30s</p>|
|Temperature 2|<p>Sensor TEMP-2</p>|`SNMP agent`|system.temperature.2<p>Update: 30s</p>|
|Temperature PoE 1|<p>Sensor PoE-01</p>|`SNMP agent`|system.temperature.poe1<p>Update: 30s</p>|
|Temperature 1|<p>Sensor TEMP-1</p>|`SNMP agent`|system.temperature.1<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

