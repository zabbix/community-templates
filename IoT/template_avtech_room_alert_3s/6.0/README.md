# RoomAlert 3S

## Overview

Zabbix template for the AVTECH Room Alert 3S environment monitor. This template can be used to monitor the temperature reading from the device's internal thermometer.


To use, create a new host with an SNMP Interface pointing at the IP address of the Room Alert 3S. This interface **must be set to SNMPv1** otherwise it will not be able to read the temperature.


Includes a 'high' alert trigger for temperatures in excess of 25°C and a 'critical' alert trigger for temperatures in excess of 30°C.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Temperature Celcius|<p>Temperature reading from the internal thermometer</p>|`SNMP agent`|temperatureCelcius<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

