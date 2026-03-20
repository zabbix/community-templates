# DATACOM DM2500

## Overview

For platforms: DM2500-4GT, DM2500-6GT


* SNMP - Discovery - Interfaces
* SNMP - CPU Usage
* SNMP - Memory Usage
* SNMP - Uptime


Linked templates: Template SNMP Interfaces



## Author

Guilherme Zamora Rodrigues

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template SNMP Interfaces|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescr<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DM2500 - memTotalFree|<p>-</p>|`SNMP agent`|memTotalFree.0<p>Update: 30</p>|
|DM2500 - CPU0|<p>-</p>|`SNMP agent`|CPU0<p>Update: 30</p>|
|DM2500 - CPU3|<p>-</p>|`SNMP agent`|CPU3<p>Update: 30</p>|
|DM2500 - CpuUser|<p>-</p>|`SNMP agent`|ssCpuUser.0<p>Update: 30</p>|
|DM2500 - CpuSystem|<p>-</p>|`SNMP agent`|ssCpuSystem.0<p>Update: 30</p>|
|Device uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|DM2500 - CPU2|<p>-</p>|`SNMP agent`|CPU2<p>Update: 30</p>|
|DM2500 - CPU1|<p>-</p>|`SNMP agent`|CPU1<p>Update: 30</p>|
|DM2500 - memCached|<p>-</p>|`SNMP agent`|memCached.0<p>Update: 30</p>|
|DM2500 - memAvailReal|<p>-</p>|`SNMP agent`|memAvailReal.0<p>Update: 30</p>|
|DM2500 - CpuIdle|<p>-</p>|`SNMP agent`|ssCpuIdle.0<p>Update: 30</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Admin status of interface $1|<p>The desired state of the interface.</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Description of interface $1|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/DATACOM DM2500/ifOperStatus[{#SNMPVALUE}],#1)<>last(/DATACOM DM2500/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/DATACOM DM2500/ifOperStatus[{#SNMPVALUE}],#1)<>last(/DATACOM DM2500/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
