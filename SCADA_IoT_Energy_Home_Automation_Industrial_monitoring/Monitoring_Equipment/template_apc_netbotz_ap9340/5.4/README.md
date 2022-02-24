# APC Netbotz AP9340

## Description

Retrieves temps and humidity from all the sensors.

## Overview

I made a simple template for the APC Netbotz AP9340, i currently have 2 (RJ45) temperature sensors connected and retrieving the temp and humidity from both.



## Author

petroska

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Sensor 1 Humidity|<p>-</p>|`SNMP agent`|memSensorsHumidity1<p>Update: 30s</p>|
|Sensor 2 Temperature|<p>The sensor's current temperature reading. Units are displayed in the scale shown in the memSensorsStatusSysTempUnits OID (Celsius or Fahrenheit).</p>|`SNMP agent`|memSensorsTemperature2<p>Update: 30s</p>|
|Sensor 1 Temperature|<p>The sensor's current temperature reading. Units are displayed in the scale shown in the memSensorsStatusSysTempUnits OID (Celsius or Fahrenheit).</p>|`SNMP agent`|memSensorsTemperature1<p>Update: 30s</p>|
|Sensor 1 Location|<p>The sensor's current temperature reading. Units are displayed in the scale shown in the memSensorsStatusSysTempUnits OID (Celsius or Fahrenheit).</p>|`SNMP agent`|memSensorsStatusSensorLocation1<p>Update: 3600</p>|
|Sensor 2 Location|<p>The sensor's current temperature reading. Units are displayed in the scale shown in the memSensorsStatusSysTempUnits OID (Celsius or Fahrenheit).</p>|`SNMP agent`|memSensorsStatusSensorLocation2<p>Update: 3600</p>|
|Sensor 1 Name|<p>-</p>|`SNMP agent`|memSensorsStatusSensorName1<p>Update: 3600</p>|
|Sensor 2 Humidity|<p>-</p>|`SNMP agent`|memSensorsHumidity2<p>Update: 30s</p>|
|Sensor 2 Name|<p>-</p>|`SNMP agent`|memSensorsStatusSensorName2<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

