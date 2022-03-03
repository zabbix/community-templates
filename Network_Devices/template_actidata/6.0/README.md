# Actidata NV1 SNMPv1

## Description

Шаблон для Контроллера температуры и влажности Actidata NV1

## Overview

Шаблон для Контроллера температуры и влажности Actidata NV1, SNMP v1.


В шаблон включен график для 4 сенсоров, 8 триггеров и 8 макросов.  



Значения макросов подбирайте сами.  



 



## Author

Raveren

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HIGH_EXT1_SENSOR_TEMP}|<p>-</p>|`33`|Text macro|
|{$HIGH_EXT2_SENSOR_TEMP}|<p>-</p>|`35`|Text macro|
|{$HIGH_HUMIDITY_SENSOR}|<p>-</p>|`65`|Text macro|
|{$HIGH_INT_SENSOR_TEMP}|<p>-</p>|`42`|Text macro|
|{$WARN_EXT1_SENSOR_TEMP}|<p>-</p>|`28`|Text macro|
|{$WARN_EXT2_SENSOR_TEMP}|<p>-</p>|`30`|Text macro|
|{$WARN_HUMIDITY_SENSOR}|<p>-</p>|`50`|Text macro|
|{$WARN_INT_SENSOR_TEMP}|<p>-</p>|`37`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|External temperature sensor 1|<p>-</p>|`SNMP agent`|nv1.sensor.ets1<p>Update: 300s</p>|
|Internal temperature sensor|<p>-</p>|`SNMP agent`|nv1.sensor.its<p>Update: 300s</p>|
|External temperature sensor 2|<p>-</p>|`SNMP agent`|nv1.sensor.ets2<p>Update: 300s</p>|
|External humidity sensor|<p>-</p>|`SNMP agent`|nv1.sensor.ehs<p>Update: 300s</p>|


## Triggers

There are no triggers in this template.

