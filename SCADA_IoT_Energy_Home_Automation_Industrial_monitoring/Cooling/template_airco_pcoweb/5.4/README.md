# Airco pCOWeb

## Overview

Generic template for Airco compute. This compute is used on most air cooling system.


Monitored items (when supported by hardware):


- Common Alarm Active  
- Compressor is Active  
- Humidifier Maintenance Warning  
- Humidity Setpoint  
- Liquid Pressure  
- Number of network interfaces  
- Room Humidity  
- Room Temperature (incoming air flow)  
- Setpoint Cooling Temperature  
- Setpoint Heating Temperature  
- Supply Fan  
- Supply Temperature (outgoing air flow)  
- Unit is Active



## Author

eric_at_2037

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescr<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Humidifier Maintenance Warning|<p>-</p>|`SNMP agent`|airco.hummaint<p>Update: 60</p>|
|Compressor is Active|<p>-</p>|`SNMP agent`|airco.compressoractive<p>Update: 60</p>|
|Setpoint Cooling Temperature|<p>-</p>|`SNMP agent`|airco.setpointcooling<p>Update: 300</p>|
|Room Temperature (incoming air flow)|<p>-</p>|`SNMP agent`|airco.roomtemp<p>Update: 60</p>|
|Common Alarm Active|<p>-</p>|`SNMP agent`|airco.CommonAlarm<p>Update: 60</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|Supply Fan|<p>-</p>|`SNMP agent`|airco.supplyfan<p>Update: 60</p>|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|Liquid Pressure|<p>-</p>|`SNMP agent`|airco.pressure<p>Update: 300</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Humidity Setpoint|<p>-</p>|`SNMP agent`|airco.humsetpoint<p>Update: 300</p>|
|Device contact details|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|Number of network interfaces|<p>The number of network interfaces (regardless of their current state) present on this system.</p>|`SNMP agent`|ifNumber<p>Update: 3600</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|Room Humidity|<p>-</p>|`SNMP agent`|airco.humidity<p>Update: 300</p>|
|Setpoint Heating Temperature|<p>-</p>|`SNMP agent`|airco.setpointheating<p>Update: 300</p>|
|Supply Temperature (outgoing air flow)|<p>-</p>|`SNMP agent`|airco.supplytemp<p>Update: 60</p>|
|CPU Usage|<p>-</p>|`SNMP agent`|airco.cpu<p>Update: 60</p>|
|Unit is Active|<p>-</p>|`SNMP agent`|airco.unitactive<p>Update: 60</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Description of interface $1|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Inbound errors on interface $1|<p>-</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

