# Brother Printers

## Overview

На базе шаблона на испанском сделал этот шаблон.


Под указанный принтер - работает. Уровни тонера и Кита. Графики.


Вопросы на 2135850@211.ru



## Author

Sergey Sidenko

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Consumables|<p>-</p>|`SNMP agent`|consumablesID<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Распечатано страниц|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.43.10.2.1.4.1.1<p>Update: 1h</p>|
|System object ID|<p>MIB: SNMPv2-MIB The vendor's authoritative identification of the network management subsystem contained in the entity. This value is allocated within the SMI enterprises subtree (1.3.6.1.4.1) and provides an easy and unambiguous means for determining`what kind of box' is being managed. For example, if vendor`Flintstones, Inc.' was assigned the subtree1.3.6.1.4.1.4242, it could assign the identifier 1.3.6.1.4.1.4242.1.1 to its `Fred Router'.</p>|`SNMP agent`|system.objectid<p>Update: 3h</p>|
|Print Spooler Check|<p>-</p>|`Simple check`|net.tcp.service[tcp,,515]<p>Update: 30</p>|
|Device description|<p>MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.descr<p>Update: 3h</p>|
|HTTP Check|<p>-</p>|`Simple check`|net.tcp.service[http]<p>Update: 30</p>|
|Device contact details|<p>MIB: SNMPv2-MIB The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|system.contact<p>Update: 3h</p>|
|Остаток ресурса DRUM UNIT (страниц)|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.43.11.1.1.9.1.2<p>Update: 3h</p>|
|Device model|<p>-</p>|`SNMP agent`|system.model<p>Update: 3h</p>|
|Device name|<p>MIB: SNMPv2-MIB An administratively-assigned name for this managed node.By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.name<p>Update: 3h</p>|
|Device location|<p>MIB: SNMPv2-MIB The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.location<p>Update: 3h</p>|
|Device SN|<p>-</p>|`SNMP agent`|system.sn<p>Update: 3h</p>|
|Device IP adress|<p>-</p>|`SNMP agent`|system.ip<p>Update: 3h</p>|
|prtMarkerSuppliesLevel %|<p>-</p>|`Calculated`|prtMarkerSuppliesLevel-percent<p>Update: 1h</p>|
|JetDirect Check|<p>-</p>|`Simple check`|net.tcp.service[tcp,,9100]<p>Update: 30</p>|
|Device uptime|<p>MIB: SNMPv2-MIB The time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|system.uptime[sysUpTime]<p>Update: 1m</p>|
|prtMarkerSuppliesLevel|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevel<p>Update: 1h</p>|
|prtMarkerSuppliesLevelMax|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevelMax<p>Update: 3h</p>|
|SNMP availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 1m</p>|
|$1 Current Capacity|<p>-</p>|`SNMP agent`|ConsumableCurrentCapacity[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|$1 Max Capacity|<p>-</p>|`SNMP agent`|ConsumableMaxCapacity[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|$1 Calculated Capacity (current/max)|<p>Depending on the consumable (toner vs drum/belt) this calculation will return a particular percentage. Drum Units & Belt Units return integer values that can be used in calculations to determine a percentage of how much of the unit is remaining. Max "status" is stored in the MIB and is used in the calculation. Toner consumables return the follow codes: -3 = Level Okay -2 = Low Warning (equivalent to “max status”) 0 = Critical/empty Toner possibilities for calculations of current / max * 100 -3 / -2 * 100 = 150% -2 / -2 * 100 = 100% 0 / -2 * 100 = 0% The calculations above are used in the triggers to make it very straight forward on determining if a toner is low or not.</p>|`Calculated`|CosumableCalculated[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOSTNAME} {#SNMPVALUE} - Critical: {ITEM.LASTVALUE}|<p>Checks if at "critical" level for Toners (code = 0) or drum/belt (<10%)</p>|<p>**Expression**: last(/Brother Printers/CosumableCalculated[{#SNMPVALUE}])<10 or last(/Brother Printers/ConsumableCurrentCapacity[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - Low Warning: {ITEM.LASTVALUE}|<p>Checks if at "warning" level for Toners (code = -2) or drum/belt (>10% & <30%)</p>|<p>**Expression**: last(/Brother Printers/CosumableCalculated[{#SNMPVALUE}])>10 and last(/Brother Printers/CosumableCalculated[{#SNMPVALUE}])<30 or last(/Brother Printers/ConsumableCurrentCapacity[{#SNMPVALUE}]) = -2</p><p>**Recovery expression**: </p>|warning|
|{HOSTNAME} {#SNMPVALUE} - Critical: {ITEM.LASTVALUE} (LLD)|<p>Checks if at "critical" level for Toners (code = 0) or drum/belt (<10%)</p>|<p>**Expression**: last(/Brother Printers/CosumableCalculated[{#SNMPVALUE}])<10 or last(/Brother Printers/ConsumableCurrentCapacity[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|high|
|{HOSTNAME} {#SNMPVALUE} - Low Warning: {ITEM.LASTVALUE} (LLD)|<p>Checks if at "warning" level for Toners (code = -2) or drum/belt (>10% & <30%)</p>|<p>**Expression**: last(/Brother Printers/CosumableCalculated[{#SNMPVALUE}])>10 and last(/Brother Printers/CosumableCalculated[{#SNMPVALUE}])<30 or last(/Brother Printers/ConsumableCurrentCapacity[{#SNMPVALUE}]) = -2</p><p>**Recovery expression**: </p>|warning|
