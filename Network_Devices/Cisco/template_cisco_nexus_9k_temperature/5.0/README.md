# Cisco Nexus 9000 Temperature Check


## Overview

Check temperature sensors on a Cisco Nexus 9000 switch and alert when out of range


## Author

John W Kerns (https://github.com/PackeTsar)


## Macros used

There are no macros in this template.


## Template links
- [zabbix_template_cisco_nexus_9k_temperature.xml](zabbix_template_cisco_nexus_9k_temperature.xml)


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
| Temperature Sensors | Enumerate temperature sensors on switch an create a prototype for each | `SNMP Agent` | temp.sensors       Update: 24h |


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
| {#SENSORNAME} Temperature Warning Threshold | Warning temperature threshold for this sensor position | `SNMP Agent` | temp.warning[{#SNMPINDEX}]       Update: 24h |
| {#SENSORNAME} Temperature Critical Threshold | Critical temperature threshold for this sensor position | `SNMP Agent` | temp.critical[{#SNMPINDEX}]       Update: 24h |
| {#SENSORNAME} Temperature Sensor | Actual temperature reading from this sensor | `SNMP Agent` | temp.sensors[{#SNMPINDEX}] |


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
| {#SENSORNAME} Temperature Warning | Temperature is above warning threshold | `{Template Cisco Nexus 9000 Temperature:temp.sensors[{#SNMPINDEX}].last()}&gt;={Template Cisco Nexus 9000 Temperature:temp.warning[{#SNMPINDEX}].last()}` | Warning |
| {#SENSORNAME} Temperature Critical | Temperature is above critical threshold | `{Template Cisco Nexus 9000 Temperature:temp.sensors[{#SNMPINDEX}].last()}&gt;={Template Cisco Nexus 9000 Temperature:temp.critical[{#SNMPINDEX}].last()}` | High |
