# AvTech RoomAlert 3S

## Overview

Zabbix template for the AvTech Room Alert 3S environment monitor. This template can be used to monitor the temperature reading from the device's internal thermometer.


To use, create a new host with an SNMP Interface pointing at the IP address of the Room Alert 3S. This interface may be set to SNMPv1 or SNMPv2. This template has not been tested with SNMPv3 enabled on the device.


Includes an 'average' alert trigger for temperatures in excess of 77°F and a 'high' alert trigger for temperatures in excess of 86°F.



## Macros used

There are no unique macros in this template.

## Template links

- Template Net Network Generic Device SNMP

## Discovery rules

There are no discovery rules in this template.

## Items collected

| Name                                 | Description                                                | Type         | Key and additional info                                 |
|--------------------------------------|------------------------------------------------------------|--------------|---------------------------------------------------------|
| Internal Sensor: Temperature C       | <p>Temperature reading from the internal thermometer</p>   | `SNMP agent` | temp.celsius[Internal Sensor]<p>Update: 1m</p>          |
| Internal Sensor: Temperature F       | <p>Temperature reading from the internal thermometer</p>   | `SNMP agent` | temp.fahrenheit[Internal Sensor]<p>Update: 1m</p>       |
| External Sensor: Temperature C       | <p>Temperature reading from the sensor</p>                 | `SNMP agent` | temp.celsius[External Sensor]<p>Update: 1m</p>          |
| External Sensor: Temperature F       | <p>Temperature reading from the sensor</p>                 | `SNMP agent` | temp.fahrenheit[External Sensor]<p>Update: 1m</p>       |
| External Sensor: Heat Index C        | <p>Heat index reading from the sensor</p>                  | `SNMP agent` | heat_index.celsius[External Sensor]<p>Update: 1m</p>    |
| External Sensor: Heat Index F        | <p>Heat index reading from the sensor</p>                  | `SNMP agent` | heat_index.fahrenheit[External Sensor]<p>Update: 1m</p> |
| External Sensor: Dew Point C         | <p>Dew point reading from the sensor</p>                   | `SNMP agent` | dew_point.celsius[External Sensor]<p>Update: 1m</p>     |
| External Sensor: Dew Point F         | <p>Dew point reading from the sensor</p>                   | `SNMP agent` | dew_point.fahrenheit[External Sensor]<p>Update: 1m</p>  |
| External Sensor: Relative Humidity % | <p>Current % relative humidity reading from the sensor</p> | `SNMP agent` | humidity[External Sensor]<p>Update: 1m</p>              |



## Triggers

| Name                                     | Description                                                        | Severity  |
|------------------------------------------|--------------------------------------------------------------------|-----------|
| Temperature Warning - Over 77ºF          | Alerts when temperature exceeds 77 degrees F. Resolves when below. | Average   |
| Critical Temperature Reading - Over 86ºF | Alerts when temperature exceeds 86 degrees F. Resolves when below. | High      |
| Humidity Warning - Over 50%              | Alerts when humidity exceeds 50%. Resolves when below.             | Average   |

