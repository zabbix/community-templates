# Siemens HiPATH

## Overview

This template permit to monitor basic OID of Siemens Hipath MIB and all ports of an HiPath system



## Author

Matteo Lobbiani

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Devices|<p>-</p>|`SNMP agent`|h150ePort<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|sys hardware version|<p>-</p>|`SNMP agent`|hwVersion<p>Update: 3600</p>|
|h150e sys state|<p>The actual error state of the device. Contains the highest severity level of the recent error events. This object is updated automatically, but it can also be modified manually.</p>|`SNMP agent`|sysState<p>Update: 30</p>|
|sys software version|<p>Contains the version string of the system software.</p>|`SNMP agent`|sysVersion<p>Update: 3600</p>|
|h150e load level|<p>The actual CPU load level (per cent).</p>|`SNMP agent`|loadLevel<p>Update: 30</p>|
|Lock State of device $1|<p>-</p>|`SNMP agent`|Lock[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|State of device $1|<p>-</p>|`SNMP agent`|State[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Type of device $1|<p>-</p>|`SNMP agent`|Type[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Lock status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/Siemens HiPATH/Lock[{#SNMPVALUE}],#1)<>last(/Siemens HiPATH/Lock[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|warning|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/Siemens HiPATH/State[{#SNMPVALUE}],#1)<>last(/Siemens HiPATH/State[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Lock status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/Siemens HiPATH/Lock[{#SNMPVALUE}],#1)<>last(/Siemens HiPATH/Lock[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|warning|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/Siemens HiPATH/State[{#SNMPVALUE}],#1)<>last(/Siemens HiPATH/State[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
