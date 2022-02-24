# Eltex SMG SNMPv2

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
|ICMP loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 2m</p>|
|smgFan2|<p>-</p>|`SNMP agent`|smgFan2<p>Update: 1m</p>|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 1h</p>|
|activeCallCount|<p>-</p>|`SNMP agent`|activeCallCount<p>Update: 30s</p>|
|ICMP response time|<p>-</p>|`Simple check`|icmppingsec<p>Update: 2m</p>|
|smgFan3|<p>-</p>|`SNMP agent`|smgFan3<p>Update: 1m</p>|
|smgE1Busy0|<p>-</p>|`SNMP agent`|smgEOneStream0<p>Update: 10s</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 1h</p>|
|smgTemperature1|<p>-</p>|`SNMP agent`|smgTemperature1<p>Update: 30s</p>|
|smgFan0|<p>-</p>|`SNMP agent`|smgFan0<p>Update: 1m</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 1h</p>|
|registrationCount|<p>-</p>|`SNMP agent`|registrationCount<p>Update: 30s</p>|
|smgTemperature2|<p>-</p>|`SNMP agent`|smgTemperature2<p>Update: 30s</p>|
|smgE1Busy1|<p>-</p>|`SNMP agent`|smgEOneStream1<p>Update: 10s</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 5m</p>|
|pmPower1|<p>-</p>|`SNMP agent`|pmPower1<p>Update: 30s</p>|
|smgE1Busy2|<p>-</p>|`SNMP agent`|smgEOneStream2<p>Update: 10s</p>|
|pmPower2|<p>-</p>|`SNMP agent`|pmPower2<p>Update: 30s</p>|
|ICMP ping|<p>-</p>|`Simple check`|icmpping<p>Update: 1m</p>|
|Device contact details|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 1h</p>|
|smgFan1|<p>-</p>|`SNMP agent`|smgFan1<p>Update: 1m</p>|
|smgVoip0busyChannels|<p>-</p>|`SNMP agent`|Voip0busyChannels<p>Update: 30s</p>|
|Статус FXS {#FXSNAME}|<p>-</p>|`SNMP agent`|fxsPort.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

