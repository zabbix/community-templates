# Canon MF750C Series SNMP

## Overview


Считывает уровни по тонеру, счетчики.


## Author

Dmitry Mishin

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Toner and Supplies Discovery|<p>-</p>|`SNMP agent`|toner.discovery<p>discovery<p>[{#TONER_INDEX},1.3.6.1.2.1.43.11.1.1.3.1,<p>{#TONER_NAME},1.3.6.1.2.1.43.11.1.1.6.1,<p>{#TONER_COLOR},1.3.6.1.2.1.43.12.1.1.4.1]<p>Update: 1h</p>|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ICMP packet loss (%)|<p>-</p>|`Simple check`|icmppingloss<p>Update: 3m</p>|
|ICMP ping|<p>-</p>|`Simple check`|icmpping<p>Update: 1m</p>|
|ICMP ping response time (ms)|<p>-</p>|`Simple check`|icmppingsec<p>Update: 1m</p>|
|Printer cover status|<p>prtCoverStatus: 3=coverClosed, 4=coverOpen, 5=interlockClosed, 6=interlockOpen</p>|`SNMP agent`|printer.cover.status<p>1.3.6.1.2.1.43.6.1.1.3.1.1<p>Update: 1m</p>|
|Printer operational status (Printer MIB)|<p>sleep, idle, processing</p>|`SNMP agent`|printer.state.text<p>1.3.6.1.2.1.43.16.5.1.2.1.1<p>Update: 3m</p>|
|Printer status|<p>1=unknown, 2=running, 3=warning, 4=testing, 5=down</p>|`SNMP agent`|printer.status<p>1.3.6.1.2.1.25.3.2.1.5.1<p>Update: 3m</p>|
|System description|<p>-</p>|`SNMP agent`|system.descr<p>1.3.6.1.2.1.1.1.0<p>Update: 1h</p>|
|System name|<p>-</p>|`SNMP agent`|system.name<p>1.3.6.1.2.1.1.5.0<p>Update: 1h</p>|
|Total pages printed|<p>-</p>|`SNMP agent`|printer.pages.total<p>1.3.6.1.2.1.43.10.2.1.4.1.1<p>Update: 15m</p>|
|Uptime|<p>sysUpTime</p>|`SNMP agent`|system.uptime<p>1.3.6.1.2.1.1.3.0<p>Update: 5m</p>|
|Toner % {#NAME}|<p>-</p>|`SNMP agent`|toner.level[{#TONER_COLOR}]<p>1.3.6.1.2.1.43.11.1.1.9.1.{#TONER_INDEX}<p>Update: 5m</p>|
|Toner capacity {#NAME}|<p>-</p>|`SNMP agent`|toner.max[{#TONER_COLOR}]<p>1.3.6.1.2.1.43.11.1.1.8.1.{#TONER_INDEX}<p>Update: 1h</p>|


## Triggers

|Name|Description|Expression|Default status|
|----|-----------|----|----|
|Printer cover is open|-|last(/Canon MF750C Series SNMP/printer.cover.status)=3|Enabled|
|Printer is not in operational state}|Dependencies: Canon MF750C Series SNMP: {HOST.NAME} is unavailable (ICMP)|last(/Canon MF750C Series SNMP/printer.status)<>2|Enabled|
|{HOST.NAME}: High packet loss (> 20%)|Dependencies: Canon MF750C Series SNMP: {HOST.NAME} is unavailable (ICMP)|min(/Canon MF750C Series SNMP/icmppingloss,5m)>20|Enabled|
|{HOST.NAME}: No SNMP response|Dependencies: Canon MF750C Series SNMP: {HOST.NAME} is unavailable (ICMP)|nodata(/Canon MF750C Series SNMP/system.uptime,10m)=1|Enabled|
|{HOST.NAME} is unavailable (ICMP)|-|max(/Canon MF750C Series SNMP/icmpping,3m)=0|Enabled|
|Toner [{#TONER_NAME}] is low (< 10%)|Dependencies: Canon MF750C Series SNMP: Toner [{#TONER_NAME}] is low (< 20%)|last(/Canon MF750C Series SNMP/toner.level[{#TONER_COLOR}])<10|Enabled|
|Toner [{#TONER_NAME}] is low (< 20%)|-|last(/Canon MF750C Series SNMP/toner.level[{#TONER_COLOR}])<20|Enabled|
|Toner [{#TONER_NAME}] is low (= 0%)|Dependencies: Canon MF750C Series SNMP: Toner [{#TONER_NAME}] is low (< 10%)|last(/Canon MF750C Series SNMP/toner.level[{#TONER_COLOR}])=0|Enabled|

