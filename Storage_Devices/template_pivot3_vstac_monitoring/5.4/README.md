# SNMP Pivot3

## Overview

Created this template to help monitor our physical drives, temperature, and system for Pivot3 vSTAC Watch.


- Drive status


- Temperature


- Fans


- Power supply


- Nodes


You'll need to enable SNMP via the vSTAC Manager Suite, for this to work.


Created and used on Zabbix 3.4.10 but I'm positive this can be used in older version as well.



## Author

ScriptByScript

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fan Status|<p>-</p>|`SNMP agent`|fanStatus<p>Update: 1h</p>|
|Drive Status - F11|<p>-</p>|`SNMP agent`|driveStatusf11<p>Update: 15m</p>|
|Drive Status - F08|<p>-</p>|`SNMP agent`|driveStatusf08<p>Update: 15m</p>|
|Temperature Status|<p>-</p>|`SNMP agent`|temperatureStatus<p>Update: 1h</p>|
|Drive Status - F03|<p>-</p>|`SNMP agent`|driveStatusf03<p>Update: 15m</p>|
|Drive Status - F01|<p>-</p>|`SNMP agent`|driveStatusf01<p>Update: 15m</p>|
|Drive Status - F09|<p>-</p>|`SNMP agent`|driveStatusf09<p>Update: 15m</p>|
|Drive Status - R13 - Cache|<p>-</p>|`SNMP agent`|driveStatusr13<p>Update: 15m</p>|
|Drive Status - F00|<p>-</p>|`SNMP agent`|driveStatusf00<p>Update: 15m</p>|
|Drive Status - R12 - Cache|<p>-</p>|`SNMP agent`|driveStatusr12<p>Update: 15m</p>|
|Drive Status - F05|<p>-</p>|`SNMP agent`|driveStatusf05<p>Update: 15m</p>|
|Drive Status - F02|<p>-</p>|`SNMP agent`|driveStatusf02<p>Update: 15m</p>|
|Drive Status - F06|<p>-</p>|`SNMP agent`|driveStatusf06<p>Update: 15m</p>|
|Drive Status - F04|<p>-</p>|`SNMP agent`|driveStatusf04<p>Update: 15m</p>|
|Drive Status - F07|<p>-</p>|`SNMP agent`|driveStatusf07<p>Update: 15m</p>|
|Drive Status - F10|<p>-</p>|`SNMP agent`|driveStatusf10<p>Update: 15m</p>|
|Node State|<p>-</p>|`SNMP agent`|state<p>Update: 1h</p>|
|Power Supply Status|<p>-</p>|`SNMP agent`|powerSupplyStatus<p>Update: 1h</p>|


## Triggers

There are no triggers in this template.

