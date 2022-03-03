# SNMPv2 LM-SENSORS

## Description

Template for LM-SENSORS mib, works for any net-snmp based machine.

## Overview

CPU Temperature


FAN rpm


PSU Voltage


Others Temperatures


 


requires "net-snmp" and "lm-sensors"


 


Tested on FreeNAS and Debian should work on any Linux and FreeBSD system


 


[Based on the Template of Tim Rightnour](cat-server-hardware/lm-sensors-snmp "Based on the Template of Tim Rightnour")



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU_HIGH}|<p>High cpu temp for alert</p>|`60.0`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|FAN Discovery|<p>Discover Fan entities in LM Sensors</p>|`SNMP agent`|lmsensors.fan<p>Update: 1h</p>|
|CPU Temperature Discovery|<p>Discover CPU temperature entities in LM Sensors</p>|`SNMP agent`|lmsensors.cpu<p>Update: 1h</p>|
|Temperature Discovery|<p>Discover non-CPU temperature entities in LM Sensors</p>|`SNMP agent`|lmsensors<p>Update: 1h</p>|
|PSU Voltages Discovery|<p>Discover PSU Voltages in LM Sensors</p>|`SNMP agent`|lmsensors.volt<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|FAN Speed {#SNMPVALUE}|<p>-</p>|`SNMP agent`|lmsensors.fan[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|CPU Temperature {#SNMPVALUE}|<p>-</p>|`SNMP agent`|lmsensors.cpu[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Temperature Sensor {#SNMPVALUE}|<p>-</p>|`SNMP agent`|lmTempSensorsValue[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|PSU Voltage {#SNMPVALUE}|<p>-</p>|`SNMP agent`|lmsensors.volt[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CPU {#SENSOR_NAME} high temp|<p>CPU temperature is higher than {$CPU_HIGH} currently {ITEM.VALUE}</p>|<p>**Expression**: last(/SNMPv2 LM-SENSORS/lmsensors.cpu[{#SNMPVALUE}])>60.0</p><p>**Recovery expression**: </p>|warning|
|CPU {#SENSOR_NAME} high temp (LLD)|<p>CPU temperature is higher than {$CPU_HIGH} currently {ITEM.VALUE}</p>|<p>**Expression**: last(/SNMPv2 LM-SENSORS/lmsensors.cpu[{#SNMPVALUE}])>60.0</p><p>**Recovery expression**: </p>|warning|
