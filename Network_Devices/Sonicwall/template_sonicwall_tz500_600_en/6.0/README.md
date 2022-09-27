# Sonicwall SNMP - TZ600

## Description

Custom Template for Sonicwall TZ500 and TZ600.

## Overview

Template for Sonicwall TZ500 and TZ600

Performance
Port Traffic Statistics
Triggers for Port Status, Processing, and Memory

## Author

Ruy Mendonça
Translation - Tim Jarosz

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status X10|<p>-</p>|`SNMP agent`|ifOperStatus.11<p>Update: 60</p>|
|X7 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.8<p>Update: 60</p>|
|Status X0|<p>-</p>|`SNMP agent`|ifOperStatus.1<p>Update: 60</p>|
|Firmware Version|<p>-</p>|`SNMP agent`|sonicFirmwareVersion<p>Update: 3600</p>|
|Packet Loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 60</p>|
|Latency|<p>-</p>|`Simple check`|icmppingsec<p>Update: 60</p>|
|Status X4|<p>-</p>|`SNMP agent`|ifOperStatus.5<p>Update: 60</p>|
|Status X1|<p>-</p>|`SNMP agent`|ifOperStatus.2<p>Update: 60</p>|
|X9 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.10<p>Update: 60</p>|
|Status X2|<p>-</p>|`SNMP agent`|ifOperStatus.3<p>Update: 60</p>|
|Availability|<p>-</p>|`Simple check`|icmpping<p>Update: 60</p>|
|X2 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.3<p>Update: 60</p>|
|X5 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.6<p>Update: 60</p>|
|Simultaneous Connections|<p>-</p>|`SNMP agent`|sonicCurrentConnCacheEntries.0<p>Update: 60</p>|
|Status X8|<p>-</p>|`SNMP agent`|ifOperStatus.9<p>Update: 60</p>|
|X10 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.11<p>Update: 60</p>|
|CPU Load|<p>CPU Utilization</p>|`SNMP agent`|sonicCurrentCPUUtil.0<p>Update: 60</p>|
|X8 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.9<p>Update: 60</p>|
|X4 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.5<p>Update: 60</p>|
|X8 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.9<p>Update: 60</p>|
|Status X6|<p>-</p>|`SNMP agent`|ifOperStatus.7<p>Update: 60</p>|
|X6 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.7<p>Update: 60</p>|
|X7 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.8<p>Update: 60</p>|
|X0 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.1<p>Update: 60</p>|
|Serial Number|<p>-</p>|`SNMP agent`|sonicSerialNumber<p>Update: 3600</p>|
|RAM|<p>Memory Utilization</p>|`SNMP agent`|sonicCurrentRAMUtil.0<p>Update: 60</p>|
|Status X7|<p>-</p>|`SNMP agent`|ifOperStatus.8<p>Update: 60</p>|
|Status X3|<p>-</p>|`SNMP agent`|ifOperStatus.4<p>Update: 60</p>|
|Sonicwall Up Time|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 60</p>|
|X1 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 60</p>|
|Model|<p>-</p>|`SNMP agent`|sonicModel<p>Update: 86400</p>|
|X3 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.4<p>Update: 60</p>|
|Status X5|<p>-</p>|`SNMP agent`|ifOperStatus.6<p>Update: 60</p>|
|X5 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.6<p>Update: 60</p>|
|X10 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.11<p>Update: 60</p>|
|X0 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.1<p>Update: 60</p>|
|X2 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.3<p>Update: 60</p>|
|X6 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.7<p>Update: 60</p>|
|Status X9|<p>-</p>|`SNMP agent`|ifOperStatus.10<p>Update: 60</p>|
|X3 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.4<p>Update: 60</p>|
|X9 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.10<p>Update: 60</p>|
|X1 Bytes Out/sec|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 60</p>|
|X4 Bytes In/sec|<p>-</p>|`SNMP agent`|ifInOctets.5<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

