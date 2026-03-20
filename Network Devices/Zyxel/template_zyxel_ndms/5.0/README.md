# SNMP ZyXEL NDMS

## Overview

A simple template for monitoring Zyxel with NDMS firmware for monitoring network activity. Tested for Keenetic Omni II.  




## Author

Ymnuk

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescr<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System Uptime|<p>-</p>|`SNMP agent`|sysUptime<p>Update: 60</p>|
|System Description|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|System Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|$1 Administration status|<p>-</p>|`SNMP agent`|ifAdminStatus[{#IFDESCR}]<p>Update: 60</p><p>LLD</p>|
|$1 Incoming|<p>-</p>|`SNMP agent`|ifInOctets[{#IFDESCR}]<p>Update: 60</p><p>LLD</p>|
|$1 Operation status|<p>-</p>|`SNMP agent`|ifOperStatus[{#IFDESCR}]<p>Update: 60</p><p>LLD</p>|
|$1 Outgoing|<p>-</p>|`SNMP agent`|ifOutOctets[{#IFDESCR}]<p>Update: 60</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

