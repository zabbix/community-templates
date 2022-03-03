# Freeswitch

## Overview

Monitors: service uptime, session rate, active calls, active sessions, peak sessions, peak calls and number of Freeswitch processes. Trigger on too many active calls [ie when you're running out of channels].


Requires the mod\_snmp SNMP subagent to be enabled in Freeswitch+net-snmp.



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$FS_MAX_CALLS}|<p>-</p>|`4`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Freeswitch active sessions|<p>-</p>|`SNMP agent`|enterprises.27880.1.2.3.0<p>Update: 1m</p>|
|Freeswitch service uptime|<p>-</p>|`SNMP agent`|enterprises.27880.1.2.1.0<p>Update: 5m</p>|
|Freeswitch active calls|<p>-</p>|`SNMP agent`|enterprises.27880.1.2.5.0<p>Update: 1m</p>|
|Freeswitch peak sessions|<p>-</p>|`SNMP agent`|enterprises.27880.1.2.10.0<p>Update: 30m</p>|
|Number of freeswitch processes|<p>-</p>|`Zabbix agent`|proc.num[,,,freeswitch]<p>Update: 2m</p>|
|Freeswitch session rate|<p>-</p>|`SNMP agent`|enterprises.27880.1.2.2.0<p>Update: 5m</p>|
|Freeswitch peak sessions per second|<p>-</p>|`SNMP agent`|enterprises.27880.1.2.8.0<p>Update: 30m</p>|


## Triggers

There are no triggers in this template.

