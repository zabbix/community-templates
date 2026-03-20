# HP A5120

## Overview

Template for HP A5120 switch with SNMP v3 authPriv.


Included items:


* CPU usage
* Memory usage
* Temperature
* Fan status
* PSU sensor
* Device name, location, description, contact details
* Discovery rule for CRC errors


no links to other templates, does not include standard interface items (use generic SNMP interface template)


I use SNMP V3 with authPriv security level, SHA authentication protocol, AES privacy protocol.


It is required to fill these variables with correct values using host macros.


* Security name: {$SNMP\_V3\_USER}
* Authentication passphrase: {$SNMP\_V3\_AUTHPASSPHRASE}
* Privacy passphrase: {$SNMP\_V3\_PRIVPASSPHRASE}


 Created on Zabbix 3.0, should work with newer/older versions.



## Author

Jakub Samek

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interface errors|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescription<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU usage|<p>-</p>|`SNMP agent`|switch.cpu<p>Update: 60</p>|
|External Power Supply 1|<p>-</p>|`SNMP agent`|Ext.Power.Supply<p>Update: 60</p>|
|Power Supply Sensor|<p>-</p>|`SNMP agent`|Power.Supply.Sensor<p>Update: 60</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|SysUptime|<p>-</p>|`SNMP agent`|SysUptime<p>Update: 300</p>|
|Internal Power Supply 1|<p>-</p>|`SNMP agent`|Int.Power.Supply1<p>Update: 60</p>|
|Memory usage|<p>-</p>|`SNMP agent`|switch.memory<p>Update: 60</p>|
|Device contact details|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|Fan 1|<p>-</p>|`SNMP agent`|fan1.status<p>Update: 60</p>|
|Switch Temperature|<p>-</p>|`SNMP agent`|switch.temp<p>Update: 60</p>|
|CRC errors on interface $1|<p>-</p>|`SNMP agent`|CRC.Errors[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CRC Errors on on {HOST.NAME} interface {#SNMPVALUE}|<p>A Cyclic Redundancy Check (CRC) are a hash function designed to detect accidental changes to raw computer data. A CRC is a short binary sequence present on each block of data. When a block of data is read or received, the device repeats the calculation to check for a match. If the new CRC does not match the original CRC, then a data error is logged and the device can attempt to correct the data error by re-reading or requesting the block of data.</p>|<p>**Expression**: {HP A5120:CRC.Errors[{#SNMPVALUE}].change()}>1</p><p>**Recovery expression**: </p>|average|
|CRC Errors on on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>A Cyclic Redundancy Check (CRC) are a hash function designed to detect accidental changes to raw computer data. A CRC is a short binary sequence present on each block of data. When a block of data is read or received, the device repeats the calculation to check for a match. If the new CRC does not match the original CRC, then a data error is logged and the device can attempt to correct the data error by re-reading or requesting the block of data.</p>|<p>**Expression**: {HP A5120:CRC.Errors[{#SNMPVALUE}].change()}>1</p><p>**Recovery expression**: </p>|average|
