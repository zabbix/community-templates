# SNMP Minuteman UPS

## Overview

Basic SNMP v1 monitoring template for the Minuteman UPS 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Battery Status|<p>-</p>|`SNMP agent`|upsBasicBatteryStatus<p>Update: 30</p>|
|Time On Battery|<p>-</p>|`SNMP agent`|upsBasicBatteryTimeOnBattery<p>Update: 30</p>|
|Ident|<p>-</p>|`SNMP agent`|upsBasicIdentName<p>Update: 86400</p>|
|Battery Charge|<p>-</p>|`SNMP agent`|upsBatteryCharge<p>Update: 30</p>|
|Model Ident|<p>-</p>|`SNMP agent`|upsBasicIdentModel<p>Update: 86400</p>|
|Battery Temperature|<p>-</p>|`SNMP agent`|upsAdvBatteryTemperature<p>Update: 30</p>|
|Battery Output Status|<p>-</p>|`SNMP agent`|upsBasicOutputStatus<p>Update: 60</p>|
|Input Freq|<p>Input frequency at CPS</p>|`SNMP agent`|upsInputFreq<p>Update: 30</p>|
|Input Voltage|<p>-</p>|`SNMP agent`|upsInputVoltage<p>Update: 30</p>|
|Battery Test Results|<p>-</p>|`SNMP agent`|upsAdvReplaceBatteryIndicator<p>Update: 600</p>|
|Runtime Remaining|<p>-</p>|`SNMP agent`|upsRuntimeRemaining<p>Update: 30s</p>|
|Output Load (%)|<p>-</p>|`SNMP agent`|upsAdvOutputLoad<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

