# DmOS - Hardware Monitor

## Description

Monitor de objetos da MIB DMOS-HW-MONITOR-MIB para monitoramento do hardware dos devices.

## Overview

Platforms DM4050 and DM4610.


SNMP - Sensors Temperature  
SNMP - FAN Control, FAN Speed



## Author

Guilherme Zamora Rodrigues

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPON PHY/SFP Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.1.7.83.69.78.83.79.82.51<p>Update: 300</p>|
|DM4050 - PSU1 Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.1.PSU1<p>Update: 300</p>|
|DM4050 - FAN3 Control|<p>-</p>|`SNMP agent`|fanControl.1.1.3<p>Update: 300</p>|
|DM4610 - FAN1 Control|<p>-</p>|`SNMP agent`|fanControl.1.FAN.1.49<p>Update: 300</p>|
|Switch Fabric Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.1.7.83.69.78.83.79.82.50<p>Update: 300</p>|
|DM4050 - FAN1 Control|<p>-</p>|`SNMP agent`|fanControl.1.1.1<p>Update: 300</p>|
|CPU Core Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.1.7.83.69.78.83.79.82.53<p>Update: 300</p>|
|DM4050 - CPU Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.1.SENSOR2<p>Update: 300</p>|
|DM4050 - FAN3 Speed|<p>-</p>|`SNMP agent`|fanSpeed.1.1.3<p>Update: 300</p>|
|DM4050 - FAN1 Speed|<p>-</p>|`SNMP agent`|fanSpeed.1.1.1<p>Update: 300</p>|
|PSU1 Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.PSU1.7.83.69.78.83.79.82.49<p>Update: 300</p>|
|DM4610 - FAN2 Control|<p>-</p>|`SNMP agent`|fanControl.1.FAN.1.50<p>Update: 300</p>|
|DM4610 - FAN3 Control|<p>-</p>|`SNMP agent`|fanControl.1.FAN.1.51<p>Update: 300</p>|
|CPU Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.1.7.83.69.78.83.79.82.52<p>Update: 300</p>|
|DM4610 - FAN2 Speed|<p>-</p>|`SNMP agent`|fanSpeed.1.50<p>Update: 300</p>|
|Card Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.1.7.83.69.78.83.79.82.49<p>Update: 300</p>|
|PSU2 Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.PSU2.7.83.69.78.83.79.82.49<p>Update: 300</p>|
|DM4050 - FAN2 Speed|<p>-</p>|`SNMP agent`|fanSpeed.1.1.2<p>Update: 300</p>|
|DM4610 - FAN1 Speed|<p>-</p>|`SNMP agent`|fanSpeed.1.49<p>Update: 300</p>|
|DM4050 - FAN2 Control|<p>-</p>|`SNMP agent`|fanControl.1.1.2<p>Update: 300</p>|
|DM4610 - FAN3 Speed|<p>-</p>|`SNMP agent`|fanSpeed.1.51<p>Update: 300</p>|
|DM4050 - CPU Core Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.CPUCore<p>Update: 300</p>|
|DM4050 - Switch Fabric Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature.1.1.SENSOR1<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

