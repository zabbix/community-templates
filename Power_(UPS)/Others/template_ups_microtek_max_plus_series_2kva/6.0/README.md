# UPS Microtek MAX plus SERIES 2kVA

## Description

Created 21 Apr 2020 by Charles for Aurinoco by full clone of Template UPS - diogont (thanks Diogo Teixeira) then: . Added macros: .. {$UPS_BATTERY_VOLTAGE_LOW} .. {$UPS_BATTERY_VOLTAGE_VERY_LOW} . Deleted unpopulated and incredible items: .. UPS battery capacity (%) .. UPS battery temperature .. UPS input current .. UPS input power .. UPS run time remaining .. UPS time on battery . Fixed item: UPS battery voltage . Added triggers for: .. UPS battery voltage low .. UPS battery voltage very low

## Overview

### Introduction


Template for Microtek MAX + SERIES 2kVA


Created 20 Apr 2020 by Charles for Aurinoco by full clone of Template UPS - diogont (thanks Diogo Teixeira) then:


* Deleted unpopulated and incredible items
	+ UPS battery capacity (%)
	+ UPS battery temperature
	+ UPS input current
	+ UPS input power
	+ UPS run time remaining
	+ UPS time on battery
* Fixed: UPS battery voltage


Updated 27 Jun 2020: triggers made dependent on "not link down"


Updated 3 Sep 2020: Mikrotek changed to Microtek


### Installation


Administration > General > Macros: SNMP\_COMMUNITY


Download the file (link below).


Configuration > Templates > Import > browse to the downloaded file > Import


Configure a host > Templates > Link new templates > search for Template UPS Microtek MAX plus SERIES 2kVA > Add


### Bugs


* None identified


### License


This template is distributed under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.


### Copyright


Copyright (c) Charles Michael Atkinson


### Authors


Charles M Atkinson (c |at| charlesmatkinson |dot| org)



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$UPS_BATT_VOLT_LOW}|<p>95.8% of 72</p>|`69`|Text macro|
|{$UPS_BATT_VOLT_VERY_LOW}|<p>91.7% of 72</p>|`66`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|UPS output frequency|<p>-</p>|`SNMP agent`|upsAdvOutputFrequency<p>Update: 60</p>|
|UPS output voltage|<p>-</p>|`SNMP agent`|upsAdvOutputVoltage<p>Update: 60</p>|
|Device Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 24h</p>|
|UPS output power|<p>-</p>|`SNMP agent`|upsAdvOutputPower<p>Update: 60</p>|
|Software version (full)|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 60</p>|
|UPS battery status|<p>-</p>|`SNMP agent`|upsBasicBatteryStatus<p>Update: 300</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|UPS output current|<p>-</p>|`SNMP agent`|upsAdvOutputCurrent<p>Update: 60</p>|
|Contact|<p>-</p>|`SNMP agent`|sysContact<p>Update: 24h</p>|
|UPS battery voltage|<p>-</p>|`SNMP agent`|upsBasicBatteryVoltage<p>Update: 60</p>|
|Device Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 24h</p>|
|UPS output load (%)|<p>-</p>|`SNMP agent`|upsAdvOutputLoad<p>Update: 60</p>|
|UPS input voltage|<p>-</p>|`SNMP agent`|upsAdvInputVoltage<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

