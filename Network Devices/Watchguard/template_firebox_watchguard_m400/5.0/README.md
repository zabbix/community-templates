# Halley Firewall Watchguard M400

## Overview

Template for monitoring Firebox Watchuard M400 Firewall with explanations and advices. The mibs are there: <https://www.watchguard.com/help/docs/wsm/xtm_11/en-us/content/en-us/basicadmin/snmp_about_mibs_c.html>


The content of template: 


6 Applications: CPU, Disk Partitions, General, Interfaces, Memory, Traffic rules


10 SNMPv2 and calculated items


Cached memory, Swap used space, Free physical memory in%, Total physical memory, ping check, Device localtion, uptime, description, name


4 LLD rules for:  
a) Access rules - taken from template M300 on share.zabbix.com (thanks) to discover traffic on access rules with graph


b) Disk partitions - with filter in post processing to discover (/var, /boot, /, and /tmp) - total and used space


c) Network interfaces - discover incoming/outgoing traffic, operational state and inbound/outbound errors on interface (need to enable) + trigger and graph. To not discover no need interface like virtual or loopback create in Administration->General-> Regular expressions a rule to not allow per example virtual interfaces: (?!)Virtual -result FALSE


d) Processors - discover and monitor with trigger the load on processors



## Author

Ticau Tudor

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`MonitorZabbix`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Processors|<p>Discover the processors of the firewall device</p>|`SNMP agent`|hrProcessorLoad<p>Update: 1d</p>|
|Disk partitions|<p>The rule will discover all disk partitions matching the global regexp "Storage devices for SNMP discovery". {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|hrStorageDescr<p>Update: 1d</p>|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescr<p>Update: 1d</p>|
|Access Rules|<p>https://www.watchguard.com/help/docs/fireware/11/en-US/Content/en-US/basicadmin/snmp_mibs_details_c.html</p>|`SNMP agent`|rule[{#SNMPVALUE}]<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 30</p>|
|Free physical memory in %|<p>Free physical memory in percentage. The memory on this device is an CF card</p>|`Calculated`|hrStorageFree.1<p>Update: 30</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 30</p>|
|Swap used space|<p>Swap used space. The memory on this device is an CF card</p>|`SNMP agent`|hrStorageUsed.10<p>Update: 30</p>|
|Cached memory|<p>Cached memory. The memory on this device is an CF card</p>|`SNMP agent`|hrStorageUsed.7<p>Update: 30</p>|
|Used physical memory|<p>Used physical memory. The memory on this device is an CF card</p>|`SNMP agent`|hrStorageUsed.1<p>Update: 30</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 30</p>|
|Total physical memory|<p>Total physical memory. The memory on this device is an CF card</p>|`SNMP agent`|hrStorageSize.1<p>Update: 30</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 30</p>|
|Processor $1 type|<p>Processor type</p>|`SNMP agent`|hrDeviceDescr[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Utilization of processor $1|<p>The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.</p>|`SNMP agent`|hrProcessorLoad[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Description of storage $1|<p>A description of the type and instance of the storage described by this entry.</p>|`SNMP agent`|hrStorageDescr[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Total disk space on $1|<p>total disk space in bytes.</p>|`SNMP agent`|hrStorageSize[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Used disk space on $1|<p>Used disk space in bytes.</p>|`SNMP agent`|hrStorageUsed[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface in 1 second, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface per second , including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Traffic on {#SNMPVALUE}|<p>-</p>|`SNMP agent`|Traffic[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Utilization of processor {#SNMPINDEX} over 70%|<p>CPU on {HOST.NAME} is over 70%</p>|<p>**Expression**: {Halley Firewall Watchguard M400:hrProcessorLoad[{#SNMPINDEX}].last(,300)}>70</p><p>**Recovery expression**: </p>|average|
|Free disk space is less than 20% on volume {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Halley Firewall Watchguard M400:hrStorageUsed[{#SNMPVALUE}].last(0)} / {Halley Firewall Watchguard M400:hrStorageSize[{#SNMPVALUE}].last(0)} > 0.8</p><p>**Recovery expression**: </p>|warning|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Halley Firewall Watchguard M400:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
|Utilization of processor {#SNMPINDEX} over 70% (LLD)|<p>CPU on {HOST.NAME} is over 70%</p>|<p>**Expression**: {Halley Firewall Watchguard M400:hrProcessorLoad[{#SNMPINDEX}].last(,300)}>70</p><p>**Recovery expression**: </p>|average|
|Free disk space is less than 20% on volume {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Halley Firewall Watchguard M400:hrStorageUsed[{#SNMPVALUE}].last(0)} / {Halley Firewall Watchguard M400:hrStorageSize[{#SNMPVALUE}].last(0)} > 0.8</p><p>**Recovery expression**: </p>|warning|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Halley Firewall Watchguard M400:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
