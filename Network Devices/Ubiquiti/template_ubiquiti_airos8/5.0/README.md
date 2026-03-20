# AirOS8

## Overview

Version 1.0


This is a template which I use to monitor a point to point Ubiquiti link with two IS‑5AC devices; that's what I test with.  
I would think it should work with other AirOS8 devices as well. Perhaps not very well suited for "normal" access points as it creates a graph for every station connected.


It discovers the remote station and greates a graph to show noise floor, signal level, RX/TX capacity and the latency.


The only trigger in there is when the connection resets; none on disconnect.



## Author

Olivier

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Station List|<p>-</p>|`SNMP agent`|ubntStaName<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Station Connection Time $1|<p>-</p>|`SNMP agent`|ubntStaConnTime[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Station MAC Address $1|<p>-</p>|`SNMP agent`|ubntStaMac[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Station Name $1|<p>-</p>|`SNMP agent`|ubntStaName[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Station Noise Floor $1|<p>-</p>|`SNMP agent`|ubntStaNoiseFloor[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Station  Rx Capacity $1|<p>-</p>|`SNMP agent`|ubntStaRxCapacity[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Station Signal Strength $1|<p>-</p>|`SNMP agent`|ubntStaSignal[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Station Tx Capacity $1|<p>-</p>|`SNMP agent`|ubntStaTxCapacity[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Station  Tx Latency $1|<p>-</p>|`SNMP agent`|ubntStaTxLatency[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Connection {#SNMPVALUE} was restarted|<p>-</p>|<p>**Expression**: {AirOS8:ubntStaConnTime[{#SNMPVALUE}].change(0)}<0</p><p>**Recovery expression**: </p>|information|
|Connection {#SNMPVALUE} was restarted (LLD)|<p>-</p>|<p>**Expression**: {AirOS8:ubntStaConnTime[{#SNMPVALUE}].change(0)}<0</p><p>**Recovery expression**: </p>|information|
