# TP-Link 5428

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interfaces|<p>-</p>|`SNMP agent`|ifDescr<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Switch type|<p>-</p>|`SNMP agent`|swType<p>Update: 3400;wd7h00-01</p>|
|ColdStart detected|<p>-</p>|`SNMP trap`|snmptrap[^.*coldStart.*]<p>Update: 0</p>|
|ping|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|
|System Description|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 3400;wd1h00-01</p>|
|System uptime|<p>-</p>|`SNMP agent`|sysUptime<p>Update: 3600</p>|
|System Name|<p>-</p>|`SNMP agent`|systemName<p>Update: 3600;wd1h00-01</p>|
|SNMP Trap Events|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|Software Version|<p>-</p>|`SNMP agent`|swVersion<p>Update: 3400;wd1h00-01</p>|
|Interface status change|<p>-</p>|`SNMP trap`|snmptrap[@netIF_OperStatChange]<p>Update: 0</p>|
|Incoming traffic on interface $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Operational status of interface $1|<p>-</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>-</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

