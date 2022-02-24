# Module Generic SNMPv2 to Fuji IRMC

## Description

Template Module Generic version: 0.15 MIBs used: SNMPv2-MIB

## Overview

Based on the template: [Template Module ICMP Ping](https://z.serahost.net/templates.php?form=update&templateid=10186)


And [Alexander Lesovoy](owner/spacert) Fujitsu RX2540 SNMP V2


Thanks!



## Author

Serpentarius Software

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_TIMEOUT}|<p>-</p>|`3m`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PSU Status|<p>-</p>|`SNMP agent`|snmp.discovery.psu<p>Update: 15m</p>|
|Temperature|<p>-</p>|`SNMP agent`|snmp.discovery.temp<p>Update: 15m</p>|
|Components status|<p>-</p>|`SNMP agent`|components.status.discovery<p>Update: 15m</p>|
|Fans Status|<p>-</p>|`SNMP agent`|snmp.discovery.fans<p>Update: 15m</p>|
|Voltage|<p>-</p>|`SNMP agent`|snmp.discovery.vsensors<p>Update: 15m</p>|
|Components errors|<p>-</p>|`SNMP agent`|components.errors.discovery<p>Update: 15m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device contact details|<p>MIB: SNMPv2-MIB The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|system.contact<p>Update: 1h</p>|
|Device uptime|<p>MIB: SNMPv2-MIB The time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|system.uptime[sysUpTime]<p>Update: 30s</p>|
|Device location|<p>MIB: SNMPv2-MIB The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.location<p>Update: 1h</p>|
|Device name|<p>MIB: SNMPv2-MIB An administratively-assigned name for this managed node.By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.name<p>Update: 1h</p>|
|Device description|<p>MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.descr<p>Update: 1h</p>|
|SNMP traps (fallback)|<p>Item is used to collect all SNMP traps unmatched by other snmptrap items</p>|`SNMP trap`|snmptrap.fallback<p>Update: 5m</p>|
|System object ID|<p>MIB: SNMPv2-MIB The vendor's authoritative identification of the network management subsystem contained in the entity. This value is allocated within the SMI enterprises subtree (1.3.6.1.4.1) and provides an easy and unambiguous means for determining`what kind of box' is being managed. For example, if vendor`Flintstones, Inc.' was assigned the subtree1.3.6.1.4.1.4242, it could assign the identifier 1.3.6.1.4.1.4242.1.1 to its `Fred Router'.</p>|`SNMP agent`|system.objectid<p>Update: 1h</p>|
|SNMP availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 1m</p>|
|{#PSU} - Status|<p>-</p>|`SNMP agent`|psu.status.[{#PSU}]<p>Update: 30s</p><p>LLD</p>|
|{#SENSOR} - Temperature|<p>-</p>|`SNMP agent`|sensor.temp.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Component {#NAME} - Status|<p>-</p>|`SNMP agent`|component.status.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#FAN} - Speed|<p>-</p>|`SNMP agent`|fan.speed.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#FAN} - Status|<p>-</p>|`SNMP agent`|fan.status.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#VSENSOR} - Status|<p>-</p>|`SNMP agent`|voltage.sensor.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Components {#NAME} - Errors|<p>-</p>|`SNMP agent`|component.errors.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} -> Component {#NAME} Errors: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:component.errors.[{#SNMPINDEX}].min(15)}>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> {#NAME} status is fail|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:component.status.[{#SNMPINDEX}].last()}<>1 and {Module Generic SNMPv2 to Fuji IRMC:component.status.[{#SNMPINDEX}].last()}<>6</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> {#FAN} Speed: {ITEM.LASTVALUE}, threshold: {$FAN_SPEED_LIMIT}|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:fan.speed.[{#SNMPINDEX}].max(5)}<{$FAN_SPEED_LIMIT}</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} ->{#FAN} Status not ok|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:fan.status.[{#SNMPINDEX}].last()}<>3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> {#PSU} not ok|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:psu.status.[{#PSU}].last()}<>3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Temperature {#SENSOR}: {ITEM.LASTVALUE}, threshold: {#WARN_TEMP}|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:sensor.temp.[{#SNMPINDEX}].last()}>{#WARN_TEMP}</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> {#VSENSOR} status not ok|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:voltage.sensor.[{#SNMPINDEX}].last()}<>3 and {Module Generic SNMPv2 to Fuji IRMC:voltage.sensor.[{#SNMPINDEX}].last()}<>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> {#PSU} not ok (LLD)|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:psu.status.[{#PSU}].last()}<>3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Temperature {#SENSOR}: {ITEM.LASTVALUE}, threshold: {#WARN_TEMP} (LLD)|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:sensor.temp.[{#SNMPINDEX}].last()}>{#WARN_TEMP}</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> {#NAME} status is fail (LLD)|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:component.status.[{#SNMPINDEX}].last()}<>1 and {Module Generic SNMPv2 to Fuji IRMC:component.status.[{#SNMPINDEX}].last()}<>6</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> {#FAN} Speed: {ITEM.LASTVALUE}, threshold: {$FAN_SPEED_LIMIT} (LLD)|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:fan.speed.[{#SNMPINDEX}].max(5)}<{$FAN_SPEED_LIMIT}</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} ->{#FAN} Status not ok (LLD)|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:fan.status.[{#SNMPINDEX}].last()}<>3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> {#VSENSOR} status not ok (LLD)|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:voltage.sensor.[{#SNMPINDEX}].last()}<>3 and {Module Generic SNMPv2 to Fuji IRMC:voltage.sensor.[{#SNMPINDEX}].last()}<>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Component {#NAME} Errors: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Module Generic SNMPv2 to Fuji IRMC:component.errors.[{#SNMPINDEX}].min(15)}>1</p><p>**Recovery expression**: </p>|high|
