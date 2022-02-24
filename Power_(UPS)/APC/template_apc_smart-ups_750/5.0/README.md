# APC Smart-UPS

## Overview

This template covers basic monitoring with some triggers.


I use it on a Windows Server 2016 with PowerChute Business Edition installed.


Feel free to modify this template to meet your needs.


Configure PowerChute Business Edition to use SNMP v1 with Community "public".




---


The following applications, triggers and items are configured:


### Applications and Items


Info


* APC Firmware Revision
* APC Modell
* APC Serial Number


Battery


* APC Battery Capacity
* APC Battery Replace Indicator
* APC Battery Status
* APC Battery Temperature
* APC Battery Voltage
* APC Time on Battery
* APC Time on Battery remaining


Input


* APC Input Frequency
* APC Input Phase
* APC Input Voltage


Output


* APC Output Current (Amperes)
* APC Output Frequency
* APC Output Load
* APC Output Phase
* APC Output Status (basic)
* APC Output Voltage


Diagnostics


* Test Last Diagnostics Date
* Test Last Diagnostics Results


### Triggers


* Information UPS Capacity lower than 90 Percent
* Warning UPS Capacity lower than 70 Percent
* Average UPS Capacity lower than 50 Percent
* Average UPS Capacity lower than 30 Percent
* High UPS Capacity lower than 20 Percent
* Disaster UPS Capacity lower than 10 Percent
* Average Test Failed
* Disaster Remaining Time on Battery is lower than 5 Minutes
* High No Power Source
* Warning Load on this APC unit is to high
* Average Input Fequency to low
* Average Input Fequency to high
* Information Frequency is not 50 Hz
* Average Battery should be replaced


## Author

Jonas Zürcher

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|APC Battery Voltage|<p>-</p>|`SNMP agent`|apc_battery.voltage<p>Update: 30s</p>|
|APC Time on Battery|<p>-</p>|`SNMP agent`|apc_battery.time<p>Update: 30s</p>|
|APC Input Phase|<p>-</p>|`SNMP agent`|apc_input.phase<p>Update: 30s</p>|
|APC Input Frequency|<p>-</p>|`SNMP agent`|apc_input.frequency<p>Update: 30s</p>|
|Test Last Diagnostics Results|<p>-</p>|`SNMP agent`|apc_diagnostics.testResults<p>Update: 30s</p>|
|APC Input Voltage|<p>-</p>|`SNMP agent`|apc_input.volt<p>Update: 30s</p>|
|APC Serial Number|<p>-</p>|`SNMP agent`|apc_serial<p>Update: 60s</p>|
|APC Output Current (Amperes)|<p>-</p>|`SNMP agent`|apc_output.amperes<p>Update: 30s</p>|
|APC Battery Capacity|<p>-</p>|`SNMP agent`|apc_battery.capacity<p>Update: 30s</p>|
|APC Output Status (basic)|<p>-</p>|`SNMP agent`|apc_output.status.basic<p>Update: 30s</p>|
|APC Output Load|<p>-</p>|`SNMP agent`|apc_output.load<p>Update: 30s</p>|
|APC Output Phase|<p>-</p>|`SNMP agent`|apc_output.phase<p>Update: 30s</p>|
|APC Output Frequency|<p>-</p>|`SNMP agent`|apc_output.frequency<p>Update: 30s</p>|
|APC Battery Status|<p>-</p>|`SNMP agent`|apc_battery.status<p>Update: 30s</p>|
|APC Output Voltage|<p>-</p>|`SNMP agent`|apc_output.volt<p>Update: 30s</p>|
|APC Battery Replace Indicator|<p>-</p>|`SNMP agent`|apc_battery.replaceIndicator<p>Update: 30s</p>|
|APC Firmware Revision|<p>-</p>|`SNMP agent`|apc_firmware<p>Update: 60s</p>|
|APC Modell|<p>Modell der APC</p>|`SNMP agent`|apc_model<p>Update: 60s</p>|
|APC Time on Battery remaining|<p>-</p>|`SNMP agent`|apc_battery.time.remaining<p>Update: 30s</p>|
|APC Battery Temperature|<p>-</p>|`SNMP agent`|apc_battery.temperature<p>Update: 30s</p>|
|Test Last Diagnostics Date|<p>-</p>|`SNMP agent`|apc_diagnostics.testDate<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

