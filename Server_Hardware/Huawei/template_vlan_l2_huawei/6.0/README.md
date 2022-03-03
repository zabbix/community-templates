# VLAN L2 Huawei

## Overview

Necessário configuração na vlan.


 


vlan 


 description 


 statistic enable



## Author

carlosviatroski

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VLAN L2 - Traffic Discovery|<p>-</p>|`SNMP agent`|vlan.traffic.discovery<p>Update: 5m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VLAN {#SNMPINDEX} - {#NOMEVLAN} - Incoming Traffic|<p>-</p>|`SNMP agent`|incoming.traffic[vlan.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|VLAN {#SNMPINDEX} - {#NOMEVLAN} - Outgoing Traffic|<p>-</p>|`SNMP agent`|outgoing.traffic[vlan.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

