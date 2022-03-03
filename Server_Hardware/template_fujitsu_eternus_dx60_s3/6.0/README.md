# Module Generic SNMPv2 to Fuji Eternus

## Description

Template Module Generic version: 0.15 MIBs used: SNMPv2-MIB

## Overview


Based on the template: [Template Module ICMP Ping](https://z.serahost.net/templates.php?form=update&templateid=10186)


And [Alexander Lesovoy](owner/spacert) Fujitsu Eternus DX 200


Thanks!




## Author

Serpentarius Software

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|
|{$SNMP_TIMEOUT}|<p>-</p>|`3m`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disks|<p>Discover raid group and status<</p>|`SNMP agent`|snmp.discovery.disks<p>Update: 30s</p>|
|RAID Group|<p>Discover raid group and status</p>|`SNMP agent`|snmp.discovery.raid.group<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|SNMP traps (fallback)|<p>Item is used to collect all SNMP traps unmatched by other snmptrap items</p>|`SNMP trap`|snmptrap.fallback<p>Update: 5m</p>|
|Overall system status|<p>INTEGER {unknown(1), unused(2), ok(3), warning(4) failed(5) } KIHAGYTAM: <preprocessing> <step> <type>DISCARD_UNCHANGED_HEARTBEAT</type> <params>1800</params> </step> </preprocessing></p>|`SNMP agent`|unit.status<p>Update: 30s</p>|
|Device location|<p>MIB: SNMPv2-MIB The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.location<p>Update: 1h</p>|
|System object ID|<p>MIB: SNMPv2-MIB The vendor's authoritative identification of the network management subsystem contained in the entity. This value is allocated within the SMI enterprises subtree (1.3.6.1.4.1) and provides an easy and unambiguous means for determining`what kind of box' is being managed. For example, if vendor`Flintstones, Inc.' was assigned the subtree1.3.6.1.4.1.4242, it could assign the identifier 1.3.6.1.4.1.4242.1.1 to its `Fred Router'.</p>|`SNMP agent`|system.objectid<p>Update: 1h</p>|
|Maximum temperature in the last hour|<p>The maximum temperature is shown during one hour in the past. kihagytam: <preprocessing> <step> <type>DISCARD_UNCHANGED_HEARTBEAT</type> <params>1800</params> </step> </preprocessing></p>|`SNMP agent`|unit.temperature<p>Update: 30s</p>|
|Device name|<p>MIB: SNMPv2-MIB An administratively-assigned name for this managed node.By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.name<p>Update: 1h</p>|
|SNMP availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 1m</p>|
|Device uptime|<p>MIB: SNMPv2-MIB The time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|system.uptime[sysUpTime]<p>Update: 30s</p>|
|Device description|<p>MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.descr<p>Update: 1h</p>|
|Device contact details|<p>MIB: SNMPv2-MIB The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|system.contact<p>Update: 1h</p>|
|Machine Pool Used Status|<p>This is a summary of the pool used status. Syntax INTEGER {normal(1), attention(2), warning(3) KIHAGYTAM: <preprocessing> <step> <type>DISCARD_UNCHANGED_HEARTBEAT</type> <params>1800</params> </step> </preprocessing></p>|`SNMP agent`|fjdaryMgtMachinePoolUsedStatus<p>Update: 30s</p>|
|Maximum temperature enclosure in the last hour|<p>The maximum temperature is shown during one hour in the past. kihagytam: <preprocessing> <step> <type>DISCARD_UNCHANGED_HEARTBEAT</type> <params>1800</params> </step> </preprocessing></p>|`SNMP agent`|unit.temperature.enclosur<p>Update: 30s</p>|
|Disk №{#SNMPINDEX} - Status|<p>-</p>|`SNMP agent`|disk.status.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|RAID №{#RAID_GROUP} - Capacity|<p>-</p>|`SNMP agent`|raid.group.capacity.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|RAID №{#RAID_GROUP} - Level|<p>-</p>|`SNMP agent`|raid.group.level.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|RAID №{#RAID_GROUP} - Status|<p>-</p>|`SNMP agent`|raid.group.status.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} -> Disk №{#SNMPINDEX} not ok|<p>-</p>|<p>**Expression**: (max(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)<1 or min(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)>1) and (max(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)<5 or min(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)>5) and (max(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)<65 or min(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)>65)</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> RAID №{#RAID_GROUP} is not ok|<p>-</p>|<p>**Expression**: max(/Module Generic SNMPv2 to Fuji Eternus/raid.group.status.[{#SNMPINDEX}],15s)<2 or min(/Module Generic SNMPv2 to Fuji Eternus/raid.group.status.[{#SNMPINDEX}],15s)>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Disk №{#SNMPINDEX} not ok (LLD)|<p>-</p>|<p>**Expression**: (max(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)<1 or min(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)>1) and (max(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)<5 or min(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)>5) and (max(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)<65 or min(/Module Generic SNMPv2 to Fuji Eternus/disk.status.[{#SNMPINDEX}],15m)>65)</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> RAID №{#RAID_GROUP} is not ok (LLD)|<p>-</p>|<p>**Expression**: max(/Module Generic SNMPv2 to Fuji Eternus/raid.group.status.[{#SNMPINDEX}],15s)<2 or min(/Module Generic SNMPv2 to Fuji Eternus/raid.group.status.[{#SNMPINDEX}],15s)>2</p><p>**Recovery expression**: </p>|high|
