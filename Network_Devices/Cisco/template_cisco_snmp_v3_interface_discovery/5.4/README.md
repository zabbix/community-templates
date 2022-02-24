# CiscoSwitchInterfaceSNMPv3

## Overview

Cisco SNMP v3 Discovery for Interface Monitoring


Template use this macros:  
  
{$SNMP\_SECNAME} security name ( snmpv3 Username )   
{$SNMP\_AUTH} authentication password.  
{$SNMP\_PRIV} private password.


iinclude this data :


Admin status of interface   
Operational status of interface  
Description of interface  
incomming traffic   
Outgoing traffic


 



## Author

Omid Hosseini

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|network interface|<p>-</p>|`SNMP agent`|ifDescr<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of network interfaces|<p>-</p>|`SNMP agent`|ifNumber<p>Update: 1h</p>|
|Admin status of interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Description of interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|incomming traffic on $1|<p>-</p>|`SNMP agent`|ifInOctets.[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Operational status of interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Outgoing traffic on $1|<p>-</p>|`SNMP agent`|ifOutOctets.[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

