# SNMP Arista BGP4

## Overview

Minimalistic template with SNMPv2 discovery


Alerting on BGP session Admin UP and Oper not Estab.


Collects AdminStatus, OperStatus, Recieved/Accepted/Announced Prefixes.


SNMPv2 Community via {$SNMP\_COMMUNITY} Macro



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Arista BGP4|<p>-</p>|`SNMP agent`|arista-snmp-discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Administrative status $2|<p>-</p>|`SNMP agent`|arista-bgp-adminstatus[{#ASNUM}, {#PEERNAME}]<p>Update: 1m</p><p>LLD</p>|
|Oper status $2|<p>-</p>|`SNMP agent`|arista-bgp-operstatus[{#ASNUM}, {#PEERNAME}]<p>Update: 1m</p><p>LLD</p>|
|Peer accepted Prefixes $2|<p>-</p>|`SNMP agent`|arista-bgp-prf-acc[{#ASNUM}, {#PEERNAME}]<p>Update: 5m</p><p>LLD</p>|
|Peer recieved Prefixes $2|<p>-</p>|`SNMP agent`|arista-bgp-prf-rcv[{#ASNUM}, {#PEERNAME}]<p>Update: 5m</p><p>LLD</p>|
|Peer announced Prefixes $2|<p>-</p>|`SNMP agent`|arista-bgp-prf-snd[{#ASNUM}, {#PEERNAME}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BGP status not "Established" for {#ASNUM}, {#PEERNAME}|<p>-</p>|<p>**Expression**: {SNMP Arista BGP4:arista-bgp-operstatus[{#ASNUM}, {#PEERNAME}].last()}<>6 and {SNMP Arista BGP4:arista-bgp-adminstatus[{#ASNUM}, {#PEERNAME}].last()}=2</p><p>**Recovery expression**: </p>|disaster|
|BGP status not "Established" for {#ASNUM}, {#PEERNAME} (LLD)|<p>-</p>|<p>**Expression**: {SNMP Arista BGP4:arista-bgp-operstatus[{#ASNUM}, {#PEERNAME}].last()}<>6 and {SNMP Arista BGP4:arista-bgp-adminstatus[{#ASNUM}, {#PEERNAME}].last()}=2</p><p>**Recovery expression**: </p>|disaster|
