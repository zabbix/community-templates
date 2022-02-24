# Eltex TAU SNMPv2

## Overview

First attempt to create a template for TAU-24. On other models it was not tested, but it should work.


Первая попытка создать шаблон для TAU-24. На остальных моделях не тестировалось, но должно работать.



## Author

Oleg

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|fxsPortStateTAU|<p>-</p>|`SNMP agent`|fxsPortState<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device firmware|<p>Version firmware</p>|`SNMP agent`|rndBrgVersion<p>Update: 1h</p>|
|Temperature fxsMonitoringTemp3|<p>-</p>|`SNMP agent`|fxsMonitoringTemp3<p>Update: 5m</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 1h</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 5m</p>|
|Device MAC|<p>MAC adress Device</p>|`SNMP agent`|rlPhdStackMacAddr<p>Update: 1h</p>|
|Temperature fxsMonitoringTemp4|<p>-</p>|`SNMP agent`|fxsMonitoringTemp4<p>Update: 5m</p>|
|ICMP loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 2m</p>|
|ICMP ping|<p>-</p>|`Simple check`|icmpping<p>Update: 1m</p>|
|smgVoip0busyChannels|<p>-</p>|`SNMP agent`|Voip0busyChannels<p>Update: 30s</p>|
|registrationCount|<p>-</p>|`SNMP agent`|registrationCount<p>Update: 30s</p>|
|ICMP response time|<p>-</p>|`Simple check`|icmppingsec<p>Update: 2m</p>|
|Temperature fxsMonitoringTemp2|<p>-</p>|`SNMP agent`|fxsMonitoringTemp2<p>Update: 5m</p>|
|fxsCpuUsage1min|<p>-</p>|`SNMP agent`|fxsCpuUsageLast1Minutes<p>Update: 1m</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 1h</p>|
|activeCallCount|<p>-</p>|`SNMP agent`|activeCallCount<p>Update: 30s</p>|
|Свободное дисковое пространство|<p>-</p>|`SNMP agent`|fxsFreeSpace<p>Update: 30m</p>|
|Temperature fxsMonitoringTemp1|<p>-</p>|`SNMP agent`|fxsMonitoringTemp1<p>Update: 5m</p>|
|Device contact details|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 1h</p>|
|Serial number|<p>Serial number</p>|`SNMP agent`|rlPhdUnitGenParamSerialNum<p>Update: 1h</p>|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 1h</p>|
|Свободная оперативная память|<p>-</p>|`SNMP agent`|fxsFreeRam<p>Update: 1m</p>|
|Статус FXS {#FXSNAME}|<p>-</p>|`SNMP agent`|fxsPort.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

