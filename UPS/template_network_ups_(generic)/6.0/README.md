# UPS - diogont

## Overview

Template made based on [Phillip Hernandez](owner/samwiseg0) template: https://share.zabbix.com/power-ups/apc/apc-ups


All OID's were changed to match general MIB for UPS.


New graphs were also added.


21 Items


9 Triggers


7 Graphs


I also have a template made for three-phase UPSs, feel free to check: [https://share.zabbix.com/power-ups/ups-templates/network-ups-three-phase-generic](power-ups/ups-templates/network-ups-three-phase-generic)



## Author

Diogo Teixeira

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
|UPS run time remaining|<p>-</p>|`SNMP agent`|upsAdvRunTimeRemaining<p>Update: 60</p>|
|UPS input current|<p>-</p>|`SNMP agent`|upsAdvInputCurrent<p>Update: 60</p>|
|UPS battery status|<p>-</p>|`SNMP agent`|upsBasicBatteryStatus<p>Update: 60</p>|
|UPS output current|<p>-</p>|`SNMP agent`|upsAdvOutputCurrent<p>Update: 60</p>|
|UPS time on battery|<p>-</p>|`SNMP agent`|upsBasicBatteryTimeOnBattery<p>Update: 60</p>|
|UPS battery capacity (%)|<p>-</p>|`SNMP agent`|upsAdvBatteryCapacity<p>Update: 60</p>|
|UPS output voltage|<p>-</p>|`SNMP agent`|upsAdvOutputVoltage<p>Update: 60</p>|
|UPS output frequency|<p>-</p>|`SNMP agent`|upsAdvOutputFrequency<p>Update: 60</p>|
|Device Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 60</p>|
|UPS input voltage|<p>-</p>|`SNMP agent`|upsAdvInputVoltage<p>Update: 60</p>|
|Contact|<p>-</p>|`SNMP agent`|sysContact<p>Update: 60</p>|
|Software version (full)|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 60</p>|
|UPS output load (%)|<p>-</p>|`SNMP agent`|upsAdvOutputLoad<p>Update: 60</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|UPS battery temperature|<p>-</p>|`SNMP agent`|upsAdvBatteryTemperature<p>Update: 60</p>|
|Device Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 60</p>|
|UPS input power|<p>-</p>|`SNMP agent`|upsAdvInputPower<p>Update: 60</p>|
|UPS output power|<p>-</p>|`SNMP agent`|upsAdvOutputPower<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

