# Monitoring MCS

## Overview

Hi


Here is a template for HP MCS


Mostly traps.


Triggers included.


 


Thanks



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`sig1read`|Text macro|
|{$TEMP.CRITICAL}|<p>-</p>|`32`|Text macro|
|{$TEMP.WARNING}|<p>-</p>|`28`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{HOST.NAME} alarmWaterCoolUnit|<p>-</p>|`SNMP trap`|snmptrap["alarmWaterCoolUnit"]<p>Update: 0</p>|
|{HOST.NAME} Status check|<p>-</p>|`SNMP agent`|cpqWcrmMibCondition.0<p>Update: 1m</p>|
|{HOST.NAME} ping|<p>-</p>|`Simple check`|icmpping[]<p>Update: 30s</p>|
|{HOST.NAME} alarmSensorWaterCoolUnit|<p>-</p>|`SNMP trap`|snmptrap["alarmSensorWaterCoolUnit"]<p>Update: 0</p>|
|{HOST.NAME} Room temperature|<p>-</p>|`SNMP agent`|waterCoolUnitSensorValue.1<p>Update: 5m</p>|
|{HOST.NAME} alarmInternal|<p>-</p>|`SNMP trap`|snmptrap["alarmInternal"]<p>Update: 0</p>|
|{HOST.NAME} alarmSensorInternal|<p>-</p>|`SNMP trap`|snmptrap["alarmSensorInternal"]<p>Update: 0</p>|
|MCS trap fallback|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

