# Eltek Flatpack S

## Description

Eltek Flatpack S DC-power system. Template for 2 rectifiers, 1 battery set. No solar power. No wind. No generator. Version 0.3 - Kari Karvonen <kari.karvonen@kasenet.fi> Eltek mibs available ftp://ftp.eltek.com. Ask your dealer or support for username and pass.

## Overview

Basic monitoring template for Eltek Flatpack / SmartPack S. 48VDC power system. 2 inverters. One batttery set. No solar power. No generator.


Template is for Zabbix 4.4.0rc1


Items


Power System Company  
Power System Site  
Power System Model  
Power System Serial Number  
Rectifiers Temperature Value  
Rectifier 1 Input Voltage  
Rectifier 2 Input Voltage  
Rectifier 1 Output Current Value  
Rectifier 2 Output Current Value  
Rectifier 1 Status  
Rectifier 2 Status  
Battery 1 Status  
Battery 1 Temperature Value  
Battery 1 Total Capacity Value  
Battery 1 Voltage Value  
Battery 1 Remaining Capacity Value  
Battery 1 Current Value  
Main Control Unit Temperature Value  
Mains Outage Total  
Mains Voltage Status L1  
Mains Voltage Status L2  
Mains Voltage Value L1  
Mains Voltage Value L2


Triggers


Lost mains power L1  
Lost mains power L2  
Battery high temperature  
Battery low temperature  
Battery 1 low remaining capacity


 



## Author

Kari Karvonen

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$BATTERY_CAPACITY_LOW_CRITICAL}|<p>Amper hours capacity left before alarm</p>|`5`|Text macro|
|{$BATTERY_TEMP_HIGH_CRITICAL}|<p>-</p>|`40`|Text macro|
|{$BATTERY_TEMP_HIGH_WARNING}|<p>-</p>|`25`|Text macro|
|{$BATTERY_TEMP_LOW_CRITICAL}|<p>-</p>|`-20`|Text macro|
|{$BATTERY_TEMP_LOW_WARNING}|<p>-</p>|`0`|Text macro|
|{$SNMP_COMMUNITY}|<p>SNMPv2 read only community</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Rectifier 2 Output Current Value|<p>-</p>|`SNMP agent`|rectifierOutputCurrentValue.2<p>Update: 1m</p>|
|Battery 1 Temperature Value|<p>-</p>|`SNMP agent`|batteryTemperaturesValue.0<p>Update: 1m</p>|
|Battery 1 Voltage Value|<p>-</p>|`SNMP agent`|batteryVoltageValue.0<p>Update: 1m</p>|
|Rectifier 2 Status|<p>error (0) normal (1) minorAlarm (2) majorAlarm (3) disabled (4) disconnected (5) notPresent (6) minorAndMajor (7) majorLow (8) minorLow (9) majorHigh (10) minorHigh (11) event (12) valueVolt (13) valueAmp (14) valueTemp (15) valueUnit (16) valuePerCent (17) critical (18) warning (19)</p>|`SNMP agent`|rectifierStatus.2<p>Update: 1m</p>|
|Battery 1 Status|<p>error (0) normal (1) minorAlarm (2) majorAlarm (3) disabled (4) disconnected (5) notPresent (6) minorAndMajor (7) majorLow (8) minorLow (9) majorHigh (10) minorHigh (11) event (12) valueVolt (13) valueAmp (14) valueTemp (15) valueUnit (16) valuePerCent (17) critical (18) warning (19)</p>|`SNMP agent`|batteryStatus.0<p>Update: 1m</p>|
|Mains Voltage Status L2|<p>error (0) normal (1) minorAlarm (2) majorAlarm (3) disabled (4) disconnected (5) notPresent (6) minorAndMajor (7) majorLow (8) minorLow (9) majorHigh (10) minorHigh (11) event (12) valueVolt (13) valueAmp (14) valueTemp (15) valueUnit (16) valuePerCent (17) critical (18) warning (19)</p>|`SNMP agent`|mainsVoltageStatus.2<p>Update: 1m</p>|
|Load Current Value|<p>-</p>|`SNMP agent`|loadCurrentValue.0<p>Update: 1m</p>|
|Mains Voltage Value L1|<p>-</p>|`SNMP agent`|mainsVoltageValue.1<p>Update: 1m</p>|
|Main Control Unit Temperature Value|<p>-</p>|`SNMP agent`|mainControlUnitTemperatureValue<p>Update: 1m</p>|
|Rectifier 1 Input Voltage|<p>-</p>|`SNMP agent`|rectifierInputVoltageValue.1<p>Update: 1m</p>|
|Load 1 Voltage Value|<p>-</p>|`SNMP agent`|loadVoltageValue.1<p>Update: 1m</p>|
|Power System Model|<p>-</p>|`SNMP agent`|powerSystemModel.0<p>Update: 1h</p>|
|Battery 1 Current Value|<p>-</p>|`SNMP agent`|batteryCurrentsValue.0<p>Update: 1m</p>|
|Load Status|<p>-</p>|`SNMP agent`|loadStatus.0<p>Update: 1m</p>|
|Rectifier 2 Input Voltage|<p>-</p>|`SNMP agent`|rectifierInputVoltageValue.2<p>Update: 1m</p>|
|Mains Outage Total|<p>-</p>|`SNMP agent`|mainsOutageTotal.0<p>Update: 1m</p>|
|Power System Site|<p>-</p>|`SNMP agent`|powerSystemSite.0<p>Update: 1h</p>|
|Power System Serial Number|<p>-</p>|`SNMP agent`|powerSystemSerialNumber.0<p>Update: 1h</p>|
|Rectifier 1 Status|<p>error (0) normal (1) minorAlarm (2) majorAlarm (3) disabled (4) disconnected (5) notPresent (6) minorAndMajor (7) majorLow (8) minorLow (9) majorHigh (10) minorHigh (11) event (12) valueVolt (13) valueAmp (14) valueTemp (15) valueUnit (16) valuePerCent (17) critical (18) warning (19)</p>|`SNMP agent`|rectifierStatus.1<p>Update: 1m</p>|
|Rectifiers Temperature Value|<p>-</p>|`SNMP agent`|rectifiersTemperatureValue.0<p>Update: 1m</p>|
|Battery 1 Total Capacity Value|<p>-</p>|`SNMP agent`|batteryTotalCapacityValue.0<p>Update: 1h</p>|
|Battery 1 Remaining Capacity Value|<p>-</p>|`SNMP agent`|batteryRemainingCapacityValue.0<p>Update: 1m</p>|
|Output power|<p>-</p>|`Calculated`|LoadOutputPower.0<p>Update: 1m</p>|
|Mains Voltage Value L2|<p>-</p>|`SNMP agent`|mainsVoltageValue.2<p>Update: 1m</p>|
|Power System Company|<p>-</p>|`SNMP agent`|powerSystemCompany.0<p>Update: 1h</p>|
|Mains Status|<p>-</p>|`SNMP agent`|mainsStatus.0<p>Update: 1m</p>|
|Power System Status|<p>-</p>|`SNMP agent`|powerSystemStatus.0<p>Update: 1m</p>|
|Mains Voltage Status L1|<p>error (0) normal (1) minorAlarm (2) majorAlarm (3) disabled (4) disconnected (5) notPresent (6) minorAndMajor (7) majorLow (8) minorLow (9) majorHigh (10) minorHigh (11) event (12) valueVolt (13) valueAmp (14) valueTemp (15) valueUnit (16) valuePerCent (17) critical (18) warning (19)</p>|`SNMP agent`|mainsVoltageStatus.1<p>Update: 1m</p>|
|Rectifier 1 Output Current Value|<p>-</p>|`SNMP agent`|rectifierOutputCurrentValue.1<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

