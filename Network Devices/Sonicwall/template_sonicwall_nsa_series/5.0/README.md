# SNMP Sonicwall 4600

## Overview

This will work on NSA 3x00 and 4x00 series firewalls. Derive form the 3600/400 one that is in Portuguese. This one is in English.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interfaces |<p>-</p>|`SNMP agent`|sonicwallifDescr<p>Update: 90</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Firmware Version|<p>-</p>|`SNMP agent`|SysmFirmwareVersion<p>Update: 3600</p>|
|Current Connections|<p>-</p>|`SNMP agent`|sonicwallCurrentConnections<p>Update: 60</p>|
|Sonicwall Model|<p>-</p>|`SNMP agent`|SysmModel<p>Update: 3600</p>|
|Current RAM Usage|<p>-</p>|`SNMP agent`|sonicwallCurrentRAMUtil<p>Update: 60</p>|
|Sonicwall Serial Number|<p>-</p>|`SNMP agent`|SysmSerialNumber<p>Update: 3600</p>|
|Current CPU Util|<p>-</p>|`SNMP agent`|sonicwallCurrentCPUUtil<p>Update: 60</p>|
|Incoming Traffic on interface $1|<p>-</p>|`SNMP agent`|ifInOctets.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Outgoing Traffic on interface $1|<p>-</p>|`SNMP agent`|ifOutOctets.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

