# Groove-G30 Infinera

## Overview

Tested from zabbix 4.0.14 Server Ubuntu 18.04 LTSIt uses SNMPv2Add Coriant-groove.mib for OID in textual-convention on **/usr/share/snmp/mibs** after add files restart service snmpd **Features:** 
* ochOsPreFecBer
* OmsTX-RX Optical Power
* Port Tx Rx Optical Power
* Osnr-Table
* Q-Factor-Table
* Shelf-Temperature
* Graph based in items discovery


**Requirements:**
* Coriant-groove.mib




## Author

Guerlielton

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Port Tx Rx Optical Power|<p>portName {#MACRO1} portRxOpticalPower {#MACRO2} portTxOpticalPower {#MACRO3}</p>|`SNMP agent`|Port-Tx-Rx<p>Update: 30s</p>|
|OmsTX-RX Optical Power|<p>omsAliasName {#MACRO1} omsTxOpticalPower {#MACRO2} omsRxOpticalPower {#MACRO3}</p>|`SNMP agent`|OmsTX-RX<p>Update: 30s</p>|
|Groove-ochOsPreFecBer|<p>-</p>|`SNMP agent`|ochOsPreFecBer<p>Update: 30s</p>|
|Groove-Shelf-Temperature|<p>#MACRO1 : shelfInletTemperature #MACRO2 : shelfOutletTemperature</p>|`SNMP agent`|Shelf-Temperature<p>Update: 30s</p>|
|Groove-Q-Factor-Table|<p>qFactorInstant {#MACRO1} qFactorAvg {#MACRO2} qFactorMin {#MACRO3} qFactorMax {#MACRO4}</p>|`SNMP agent`|qFactorEntry<p>Update: 30s</p>|
|Groove-Osnr-Table|<p>osnrInstant - {#MACRO1} osnrAvg - {#MACRO2} osnrMin - {#MACRO3} osnrMax - {#MACRO4}</p>|`SNMP agent`|osnrTable<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Groove-Port-RxOpticalPower: {#MACRO2}|<p>-</p>|`SNMP agent`|PortRxOpticalPower[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-Port-TxOpticalPower: {#MACRO3}|<p>-</p>|`SNMP agent`|PortTxOpticalPower[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-omsRxOpticalPower: {#MACRO3}|<p>-</p>|`SNMP agent`|omsRxOpticalPower[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-omsTxOpticalPower: {#MACRO2}|<p>-</p>|`SNMP agent`|omsTxOpticalPower[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-ochOsPreFecBer - {#MACRO1}|<p>-</p>|`SNMP agent`|ochOsPreFecBer[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Temperature: {#MACRO1}|<p>-</p>|`SNMP agent`|shelfInletTemperature[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Temperature: {#MACRO2}|<p>-</p>|`SNMP agent`|shelfOutletTemperature[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-qFactorAvg|<p>-</p>|`SNMP agent`|qFactorAvg[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-qFactorInstant|<p>-</p>|`SNMP agent`|qFactorInstant[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-qFactorMax|<p>-</p>|`SNMP agent`|qFactorMax[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-qFactorMin|<p>-</p>|`SNMP agent`|qFactorMin[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-osnrAvg: {#MACRO2}|<p>-</p>|`SNMP agent`|osnrAvg[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-osnrInstant: {#MACRO1}|<p>-</p>|`SNMP agent`|osnrInstant[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-osnrMax: {#MACRO4}|<p>-</p>|`SNMP agent`|osnrMax[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Groove-osnrMin: {#MACRO3}|<p>-</p>|`SNMP agent`|osnrMin[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

