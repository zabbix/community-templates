# RICOH Aficio MP C3300/3001

## Overview

RICOH Aficio MP C3300 or 3001 print / copy / scan one machine input tray, toner status monitor zabbix3.2 template.



## Author

ZhouJianChang

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|系统版本|<p>-</p>|`SNMP agent`|system.version<p>Update: 3600</p>|
|设备型号|<p>-</p>|`SNMP agent`|print.unit.type<p>Update: 3600</p>|
|品红色碳粉余量|<p>返回值范围0-100（类似百分比），0表示碳粉用尽，100表示碳粉余量充足。</p>|`SNMP agent`|prints.toner.status[magenta]<p>Update: 180</p>|
|黄色碳粉余量|<p>返回值范围0-100（类似百分比），0表示碳粉用尽，100表示碳粉余量充足。</p>|`SNMP agent`|prints.toner.status[yellow]<p>Update: 180</p>|
|在线状态|<p>-</p>|`Simple check`|icmpping<p>Update: 60</p>|
|1#输入纸盘打印纸余量|<p>返回值为0表示余量充足，返回值为9表示纸张已用尽。</p>|`SNMP agent`|printer.tray.status[1]<p>Update: 180</p>|
|手送台输入纸盘打印纸余量|<p>返回值为0表示余量充足，返回值为9表示纸张已用尽。</p>|`SNMP agent`|printer.tray.status[3]<p>Update: 180</p>|
|黑色碳粉余量|<p>返回值范围0-100（类似百分比），0表示碳粉用尽，100表示碳粉余量充足。</p>|`SNMP agent`|prints.toner.status[black]<p>Update: 180</p>|
|2#输入纸盘打印纸余量|<p>返回值为0表示余量充足，返回值为9表示纸张已用尽。</p>|`SNMP agent`|printer.tray.status[2]<p>Update: 180</p>|
|青色碳粉余量|<p>返回值范围0-100（类似百分比），0表示碳粉用尽，100表示碳粉余量充足。</p>|`SNMP agent`|prints.toner.status[cyan]<p>Update: 180</p>|
|设备序列号|<p>-</p>|`SNMP agent`|print.serial<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

