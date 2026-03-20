# Watchguard Firewall

## Overview

An updated Watchguard template that uses the updated SNMP OIDs after the v12.0 update.


 


Template pulls:


Active Connections  
Available Memory  
CPU Utilization  
Device Description  
Device Location  
Device Name  
Device Uptime  
Free Memory  
Total Bytes Received  
Total Bytes Sent  
Total Memory  
Bandwidth Utilization  
Access Rules


 


Discovery Rules:


Access Rules  
Network Interfaces



## Author

klheuser

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`MonitorZabbix`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Access Rules|<p>https://www.watchguard.com/help/docs/fireware/11/en-US/Content/en-US/basicadmin/snmp_mibs_details_c.html</p>|`SNMP agent`|rule[{#SNMPVALUE}]<p>Update: 1d</p>|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescr<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 30</p>|
|Total Bytes Received|<p>-</p>|`SNMP agent`|wgSystemTotalRecvBytes<p>Update: 1m</p>|
|Free Memory|<p>-</p>|`SNMP agent`|memTotalFree<p>Update: 1m</p>|
|Active Connections|<p>-</p>|`SNMP agent`|wgSystemCurrActiveConns<p>Update: 1m</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 30</p>|
|Available Memory|<p>-</p>|`SNMP agent`|memAvailReal<p>Update: 1m</p>|
|CPU Utilization|<p>-</p>|`SNMP agent`|wgSystemCpuUtil1<p>Update: 1m</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 30</p>|
|Total Memory|<p>-</p>|`SNMP agent`|memTotalReal<p>Update: 1h</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 30</p>|
|Total Bytes Sent|<p>-</p>|`SNMP agent`|wgSystemTotalSendBytes<p>Update: 1m</p>|
|Traffic on {#SNMPVALUE}|<p>-</p>|`SNMP agent`|Traffic[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface in 1 second, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface per second , including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Watchguard Firewall:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Watchguard Firewall:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
