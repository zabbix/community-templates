# RoomAlert 3E

## Overview

Zabbix template for the AvTech Room Alert 3E environment monitor. This template can be used to monitor the temperature reading from the device's internal thermometer.


To use, create a new host with an SNMP Interface pointing at the IP address of the Room Alert 3E. This interface **must be set to SNMPv1** otherwise it will not be able to read the temperature.


Includes an 'average' alert trigger for temperatures in excess of 25°C and a 'critical' alert trigger for temperatures in excess of 30°C.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

| Name                                 | Description                                                | Type         | Key and additional info                                        |
|--------------------------------------|------------------------------------------------------------|--------------|----------------------------------------------------------------|
| Internal Sensor: Temperature C       | <p>Temperature reading from the internal thermometer</p>   | `SNMP agent` | temp.celsius[Internal Sensor]<p>Update: 1m</p>                 |
| Internal Sensor: Temperature F       | <p>Temperature reading from the internal thermometer</p>   | `SNMP agent` | temp.fahrenheit[Internal Sensor]<p>Update: 1m</p>              |
| External Sensor: Temperature C       | <p>Temperature reading from the sensor</p>                 | `SNMP agent` | temp.celsius[External Sensor]<p>Update: 1m</p>                 |
| External Sensor: Temperature F       | <p>Temperature reading from the sensor</p>                 | `SNMP agent` | temp.fahrenheit[External Sensor]<p>Update: 1m</p>              |



## Triggers

| Name                                     | Description                                                        | Severity  |
|------------------------------------------|--------------------------------------------------------------------|-----------|
| Temperature Warning - Over 77ºF          | Alerts when temperature exceeds 77 degrees F. Resolves when below. | Average   |
| Critical Temperature Reading - Over 86ºF | Alerts when temperature exceeds 86 degrees F. Resolves when below. | High      |
