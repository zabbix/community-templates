# Yeastar S300

## Overview

Template autodiscovers trunks via snmp v2c and system information.


 


You only need to add {$SNMP\_COMMUNITY} in hosts macros



## Author

Bogdan Vaschenko

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Trunk Discovery|<p>-</p>|`SNMP agent`|sTrunks<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Wan Status|<p>-</p>|`SNMP agent`|sWanStatus<p>Update: 1m</p>|
|Lan IP address|<p>-</p>|`SNMP agent`|sLanIpaddress<p>Update: 30m</p>|
|Cpu Load|<p>-</p>|`SNMP agent`|avgCpuLoad<p>Update: 30s</p>|
|Wan Subnet Mask|<p>-</p>|`SNMP agent`|sWanSubnetMask<p>Update: 30m</p>|
|Disk Usage|<p>-</p>|`SNMP agent`|sDiskUsage<p>Update: 5m</p>|
|Lan Subnet Mask|<p>-</p>|`SNMP agent`|sLanSubnetMask<p>Update: 30m</p>|
|Firmware Version|<p>-</p>|`SNMP agent`|sFirmwareVersion<p>Update: 5m</p>|
|Memory Usage|<p>-</p>|`SNMP agent`|sMemoryUsage<p>Update: 1m</p>|
|Hardware Version|<p>-</p>|`SNMP agent`|sHardwareVersion<p>Update: 5m</p>|
|Uptime|<p>-</p>|`SNMP agent`|sUptime<p>Update: 1m</p>|
|Serial Number|<p>-</p>|`SNMP agent`|sSerialNumber<p>Update: 5m</p>|
|Lan GateWay|<p>-</p>|`SNMP agent`|sLanGateWay<p>Update: 30m</p>|
|Lan Status|<p>-</p>|`SNMP agent`|sLanStatus<p>Update: 1m</p>|
|Wan IP address|<p>-</p>|`SNMP agent`|sWanIpaddress<p>Update: 30m</p>|
|Wan GateWay|<p>-</p>|`SNMP agent`|sWanGateWay<p>Update: 30m</p>|
|Trunk {#TRUNK_NAME} Status|<p>-</p>|`SNMP agent`|sTrunksStatus[{#TRUNK_INDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOSTNAME} Trunk {#TRUNK_NAME} changed status|<p>-</p>|<p>**Expression**: {Yeastar S300:sTrunksStatus[{#TRUNK_INDEX}].diff()}=1</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} Trunk {#TRUNK_NAME} changed status (LLD)|<p>-</p>|<p>**Expression**: {Yeastar S300:sTrunksStatus[{#TRUNK_INDEX}].diff()}=1</p><p>**Recovery expression**: </p>|high|
