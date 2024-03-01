# Sky Control 5500.824

## Description

Sky Control 5500.824 Monitoring System

## Overview

Sky Control 5500.824 template for Zabbix

Water, Humidity, Temperature, Buttons, Actuators discovery


## Author

Konstantin Razmanov

## Macros used

There are no Macros

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Actuators|<p>Actuators discovery</p>|`SNMP agent`|actuator<p>Update: 10m</p>|
|Buttons|<p>Buttons discovery</p>|`SNMP agent`|button<p>Update: 10m</p>|
|Humidity Sensors|<p>Humidity discovery</p>|`SNMP agent`|humidity<p>Update: 10m</p>|
|Temp Sensor|<p>Temperature sensors discovery</p>|`SNMP agent`|temp<p>Update: 10m</p>|
|Water Sensors|<p>Water sensors discovery</p>|`SNMP agent`|water<p>Update: 10m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|SNMP Availability|<p>-</p>|`Internal Zabbix`|zabbix[host,snmp,available]<p>Update: 1m</p>|
|System Name|<p>-</p>|`SNMP agent`|ctlLogicGroupName<p>Update: 5m</p>|
|System Uptime|<p>-</p>|`SNMP agent`|uptime<p>Update: 1m</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|No SNMP data collection|<p>-</p>|<p>**Expression**: last(/Template SkyControl 5500.824/zabbix[host,snmp,available])=0</p><p>**Recovery expression**:last(/Template SkyControl 5500.824/zabbix[host,snmp,available])=1</p>|disaster|
