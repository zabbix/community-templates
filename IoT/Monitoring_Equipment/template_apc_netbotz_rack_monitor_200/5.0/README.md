# SNMP APC NetBotz Rack Monitor 200

## Overview

 LLD of Sensors (Only Temperature and humidity) 


Trigger Prototypes for recommended 45RH% - 55RH% humidity and 20°C - 24°C Temperature


Graph Prototypes for Temperature and Humidity. 


Triggers names contain the last value that cause the trigger so you can see the temp/hum in the alert.


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Internal APC Sensor|<p>-</p>|`SNMP agent`|apc.enviro.sensor<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#SNMPVALUE} Sensor Humidity|<p>-</p>|`SNMP agent`|apc.enviro.sensor.int.hum.["{#SNMPINDEX}"]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} Sensor Temperature|<p>-</p>|`SNMP agent`|apc.enviro.sensor.int.temp.["{#SNMPINDEX}"]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Humidity > 55 RH%|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.hum.["{#SNMPINDEX}"].last()}>55</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Humidity > 60 RH%|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.hum.["{#SNMPINDEX}"].last()}>=60</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Humidiy< 45 RH%|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.hum.["{#SNMPINDEX}"].last()}<45</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Humidty < 40 RH%|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.hum.["{#SNMPINDEX}"].last()}<=40</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature < 15°C|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}<=15</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature < 19°C|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}<=19</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature > 22°C|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}>=22</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature > 24°C|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}>=24</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature > 30°C|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}>=30</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Humidity > 55 RH% (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.hum.["{#SNMPINDEX}"].last()}>55</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Humidity > 60 RH% (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.hum.["{#SNMPINDEX}"].last()}>=60</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Humidiy< 45 RH% (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.hum.["{#SNMPINDEX}"].last()}<45</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Humidty < 40 RH% (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.hum.["{#SNMPINDEX}"].last()}<=40</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature < 15°C (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}<=15</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature < 19°C (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}<=19</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature > 22°C (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}>=22</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature > 24°C (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}>=24</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Temperature > 30°C (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC NetBotz Rack Monitor 200:apc.enviro.sensor.int.temp.["{#SNMPINDEX}"].last()}>=30</p><p>**Recovery expression**: </p>|disaster|
