# UPS RFC 1628 SNMP

## Overview

There is a UPS SNMP template for UPS with rfc-1628 support. Tested with:


* APC SURTD3000XLI with APC Network Management Card 2 (AP9630)
* APC SRT3000RMXLI with APC Network Management Card 2 (AP9630)
* EATON (PowerWare) 9125-6000g with ConnectUPS Web/SNMP Card.


## Author

Sergey Morozov

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|
|Template Module Generic SNMP|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Output line|<p>-</p>|`SNMP agent`|ups.line.output<p>Update: 1h</p>|
|Input line|<p>-</p>|`SNMP agent`|ups.line.input<p>Update: 1h</p>|
|Bypass|<p>-</p>|`SNMP agent`|ups.bypass<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|UPS battery status|<p>-</p>|`SNMP agent`|ups.battery.status<p>Update: 1m</p>|
|UPS output frequency|<p>-</p>|`SNMP agent`|ups.line.output.frequency<p>Update: 1m</p>|
|UPS model name|<p>-</p>|`SNMP agent`|ups.ident.model<p>Update: 1d</p>|
|UPS attached devices|<p>-</p>|`SNMP agent`|ups.ident.attachedDevices<p>Update: 1d</p>|
|UPS estimated charge remaining|<p>-</p>|`SNMP agent`|ups.battery.estimatedChargeRemaining<p>Update: 1m</p>|
|UPS battery temperature|<p>-</p>|`SNMP agent`|ups.battery.temperature<p>Update: 1m</p>|
|UPS output source|<p>-</p>|`SNMP agent`|ups.line.output.source<p>Update: 1m</p>|
|UPS battery current|<p>-</p>|`SNMP agent`|ups.battery.current<p>Update: 1m</p>|
|UPS input line bads|<p>-</p>|`SNMP agent`|ups.line.input.Bads<p>Update: 1m</p>|
|UPS manufacturer|<p>-</p>|`SNMP agent`|ups.ident.manufacturer<p>Update: 1d</p>|
|UPS battery voltage|<p>-</p>|`SNMP agent`|ups.battery.voltage<p>Update: 1m</p>|
|UPS bypass frequency|<p>-</p>|`SNMP agent`|ups.bypass.frequency<p>Update: 1m</p>|
|UPS agent software version|<p>-</p>|`SNMP agent`|ups.ident.agentSoftwareVersion<p>Update: 1d</p>|
|UPS name|<p>-</p>|`SNMP agent`|ups.ident.name<p>Update: 1d</p>|
|UPS output current {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.line.output.current[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS output percent load {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.line.output.percentload[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS output power {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.line.output.power[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS output voltage {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.line.output.voltage[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS input current {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.line.input.current[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS input frequency {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.line.input.frequency[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS input true power {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.line.input.truePower[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS input voltage {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.line.input.voltage[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS bypass current {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.bypass.current[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS bypass power {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.bypass.power[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|UPS bypass voltage {#SNMPINDEX}|<p>-</p>|`SNMP agent`|ups.bypass.voltage[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

