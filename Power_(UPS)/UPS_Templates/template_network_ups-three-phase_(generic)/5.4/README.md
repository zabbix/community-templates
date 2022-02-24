# UPS TRIPH - diogont

## Overview

Template made based on [Phillip Hernandez](owner/samwiseg0) template: https://share.zabbix.com/power-ups/apc/apc-ups


All OID's were changed to match general MIB for UPS.


New graphs were also added.


25 Items


8 Triggers


8 Graphs


 


I also have a template for non three-phase ups, feel free to check: [https://share.zabbix.com/power-ups/network-ups-generic](power-ups/network-ups-generic)



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
|UPS battery temperature|<p>-</p>|`SNMP agent`|upsAdvBatteryTemperature<p>Update: 60</p>|
|UPS output current L2|<p>-</p>|`SNMP agent`|upsAdvOutputCurrent2<p>Update: 60</p>|
|UPS output power L1|<p>-</p>|`SNMP agent`|upsAdvOutputPower1<p>Update: 60</p>|
|UPS input voltage L3|<p>-</p>|`SNMP agent`|upsAdvInputVoltage3<p>Update: 60</p>|
|UPS output current L1|<p>-</p>|`SNMP agent`|upsAdvOutputCurrent1<p>Update: 60</p>|
|UPS output voltage L2|<p>-</p>|`SNMP agent`|upsAdvOutputVoltage2<p>Update: 60</p>|
|UPS output voltage L3|<p>-</p>|`SNMP agent`|upsAdvOutputVoltage3<p>Update: 60</p>|
|UPS battery status|<p>-</p>|`SNMP agent`|upsBasicBatteryStatus<p>Update: 60</p>|
|UPS output voltage L1|<p>-</p>|`SNMP agent`|upsAdvOutputVoltage1<p>Update: 60</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|UPS input voltage L2|<p>-</p>|`SNMP agent`|upsAdvInputVoltage2<p>Update: 60</p>|
|UPS output power L3|<p>-</p>|`SNMP agent`|upsAdvOutputPower3<p>Update: 60</p>|
|UPS output load (%)|<p>-</p>|`SNMP agent`|upsAdvOutputLoad<p>Update: 60</p>|
|Device Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 60</p>|
|UPS output current L3|<p>-</p>|`SNMP agent`|upsAdvOutputCurrent3<p>Update: 60</p>|
|UPS input voltage L1|<p>-</p>|`SNMP agent`|upsAdvInputVoltage1<p>Update: 60</p>|
|Software version (full)|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 60</p>|
|Device Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 60</p>|
|UPS time on battery|<p>-</p>|`SNMP agent`|upsBasicBatteryTimeOnBattery<p>Update: 60</p>|
|UPS battery capacity (%)|<p>-</p>|`SNMP agent`|upsAdvBatteryCapacity<p>Update: 60</p>|
|UPS output power L2|<p>-</p>|`SNMP agent`|upsAdvOutputPower2<p>Update: 60</p>|
|Contact|<p>-</p>|`SNMP agent`|sysContact<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

