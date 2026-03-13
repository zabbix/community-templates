# SNMP APC PDU AP79XX

## Overview

The template is a reworked a version of APC PDU New SNMP Template to suit the needs of our AP7953.


Contains sane triggers, load status, graphs, etc.


The template monitors both load banks, status of the alarms, and changes in the port status (on/off) 



## Author

kos

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Outlets|<p>-</p>|`SNMP agent`|rPDUOutletConfigIndex<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Load State Status Bank B1|<p>-</p>|`SNMP agent`|rPDULoadStatusLoadState.2<p>Update: 30</p>|
|rPDUIdentSerialNumber.0|<p>-</p>|`SNMP agent`|rPDUIdentSerialNumber.0<p>Update: 86400</p>|
|rPDUIdentFirmwareRev.0|<p>-</p>|`SNMP agent`|rPDUIdentFirmwareRev.0<p>Update: 3600</p>|
|Load Bank B1|<p>-</p>|`SNMP agent`|rPDULoadStatusLoad.2<p>Update: 30</p>|
|Load Bank B2|<p>-</p>|`SNMP agent`|rPDULoadStatusLoad.3<p>Update: 30</p>|
|Load State Status Bank B2|<p>-</p>|`SNMP agent`|rPDULoadStatusLoadState.3<p>Update: 30</p>|
|Load State Status Total|<p>-</p>|`SNMP agent`|rPDULoadStatusLoadState.1<p>Update: 30</p>|
|Load Bank Total|<p>-</p>|`SNMP agent`|rPDULoadStatusLoad.1<p>Update: 30</p>|
|rPDUIdentModelNumber.0|<p>-</p>|`SNMP agent`|rPDUIdentModelNumber.0<p>Update: 86400</p>|
|rPDUIdentName.0|<p>-</p>|`SNMP agent`|rPDUIdentName.0<p>Update: 86400</p>|
|Outlet $1 Name|<p>-</p>|`SNMP agent`|rPDUOutletConfigOutletName[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Outlet $1 State Status|<p>-</p>|`SNMP agent`|rPDUOutletStatusOutletState[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Outlet {#SNMPVALUE} State Change|<p>-</p>|<p>**Expression**: {SNMP APC PDU AP79XX:rPDUOutletStatusOutletState[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Outlet {#SNMPVALUE} State Change (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC PDU AP79XX:rPDUOutletStatusOutletState[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
