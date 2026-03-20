# D-Link DGS 1100

## Overview

 Template for D'Link DGS 1100 SNMPv2, Includes discovery(items, graphs, triggers)


 

## Author

Mew

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interface Discovery|<p>-</p>|`SNMP agent`|net.if.discovery<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Desctiption|<p>-</p>|`SNMP agent`|SYSDescr<p>Update: 24h</p>|
|Location|<p>-</p>|`SNMP agent`|SYSLocation<p>Update: 24h</p>|
|Uptime|<p>-</p>|`SNMP agent`|SYSUptime<p>Update: 1m</p>|
|Interface {#IFDESCR} Inbound packets discarded|<p>-</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFDESCR}: Inbound packets with errors|<p>-</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Bits received: {#IFDESCR}|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFDESCR}: Outbound packets discarded|<p>-</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFDESCR}: Outbound packets with errors|<p>-</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Bits sent: {#IFDESCR}|<p>-</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFDESCR}: Speed|<p>-</p>|`SNMP agent`|net.if.speed[ifSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFDESCR}: Operational status|<p>-</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFDESCR}: Interface description|<p>-</p>|`SNMP agent`|net.if.type[ifDescr.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Interface {#IFDESCR}: Interface last change|<p>-</p>|`SNMP agent`|net.if.type[ifLastChange.{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Interface {#IFDESCR}: Interface MAC address|<p>-</p>|`SNMP agent`|net.if.type[ifPhysAddress.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Interface {#IFDESCR}: Interface type|<p>-</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFDESCR}: Link down|<p>-</p>|<p>**Expression**: {D-Link DGS 1100:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {D-Link DGS 1100:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: {D-Link DGS 1100:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|average|
|Interface {#IFDESCR}: Link down (LLD)|<p>-</p>|<p>**Expression**: {D-Link DGS 1100:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {D-Link DGS 1100:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: {D-Link DGS 1100:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|average|
