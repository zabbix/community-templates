# Kyocera Printers

## Overview

Zabbix template for Kyocera CS-6115ci - CS7051ci printers.



## Author

Aniefiok Umoh

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|KyoceraPrint|<p>-</p>|`SNMP agent`|KyoceraPrint<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MAC|<p>-</p>|`SNMP agent`|MAC<p>Update: 17280</p>|
|Contact Information|<p>snmp/snmp.htm</p>|`SNMP agent`|sysContact<p>Update: 1800</p>|
|Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 17280</p>|
|Model Name|<p>-</p>|`SNMP agent`|ModelName<p>Update: 3600</p>|
|Toner: the maximum number of Magenta|<p>-</p>|`SNMP agent`|MagentaTonerMax<p>Update: 1800</p>|
|Type of cartridge|<p>-</p>|`SNMP agent`|TonerBox<p>Update: 1800</p>|
|Toner: the maximum number of Yellow|<p>-</p>|`SNMP agent`|YellowTonerMax<p>Update: 1800</p>|
|Name|<p>snmp/snmp.htm</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Network Interface|<p>-</p>|`SNMP agent`|NetworkInterface<p>Update: 3600</p>|
|Working hours|<p>Время работы с момента последнего включения</p>|`SNMP agent`|UpTime<p>Update: 1800</p>|
|Status bar 2|<p>-</p>|`SNMP agent`|StatusStr2<p>Update: 17280</p>|
|PageCounter|<p>The total number of pages printed</p>|`SNMP agent`|PageCounter<p>Update: 1800</p>|
|Toner: the maximum number of Black|<p>-</p>|`SNMP agent`|BlackTonerMax<p>Update: 1800</p>|
|Cyan Toner: current count|<p>-</p>|`SNMP agent`|CyanTonerCurrent<p>Update: 1800</p>|
|Amount of toner: Yellow|<p>-</p>|`Calculated`|PersentYellow<p>Update: 1800</p>|
|Magenta Toner: current count|<p>-</p>|`SNMP agent`|MagentaTonerCurrent<p>Update: 1800</p>|
|Black Toner: current count|<p>-</p>|`SNMP agent`|BlackTonerCurrent<p>Update: 1800</p>|
|Amount of toner: Magenta|<p>-</p>|`Calculated`|PersentMagenta<p>Update: 1800</p>|
|Status bar1|<p>-</p>|`SNMP agent`|StatusStr1<p>Update: 17280</p>|
|Toner: the maximum number of Cyan|<p>-</p>|`SNMP agent`|CyanTonerMax<p>Update: 1800</p>|
|Amount of toner: Cyan|<p>-</p>|`Calculated`|PersentCyan<p>Update: 1800</p>|
|Error code|<p>-</p>|`SNMP agent`|ErrorCode<p>Update: 1800</p>|
|Serial Number|<p>-</p>|`SNMP agent`|SerialNumber<p>Update: 17280</p>|
|Amount of toner: Black|<p>-</p>|`Calculated`|Persentblack<p>Update: 1800</p>|
|Yellow Toner: current count|<p>-</p>|`SNMP agent`|YellowTonerCurrent<p>Update: 1800</p>|


## Triggers

There are no triggers in this template.

