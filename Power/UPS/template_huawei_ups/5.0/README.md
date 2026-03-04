# Huawei UPS

## Overview

**Шаблон на русском для ИБП Huawei 6000KVA**


**Элементы данных:**




 | Ток батарей |
| Статус питания |
| Статус батарей |
| Статус ИБП |
| Оставшаяся емкость аккумуляторов |
|
<td style="height: 15.0pt; border-top-style: initial; border-right-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-left-color: initial; border-image: initial; font-style: inherit; font-variant: inherit; fo



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Входящее напряжение|<p>-</p>|`SNMP agent`|hwUpsInputRowStatus<p>Update: 5s</p>|
|Статус батарей|<p>-</p>|`SNMP agent`|hwUpsBatteryRowStatus<p>Update: 30s</p>|
|Статус ИБП|<p>-</p>|`SNMP agent`|hwUpsCtrlRowStatus<p>Update: 10s</p>|
|Выходящая нагрузка %|<p>-</p>|`SNMP agent`|hwUpsOutputLoadA<p>Update: 10s</p>|
|Выходящий ток|<p>-</p>|`SNMP agent`|hwUpsOutputCurrentA<p>Update: 10s</p>|
|Ток батарей|<p>-</p>|`SNMP agent`|hwUpsBatteryCurrent<p>Update: 30s</p>|
|Выходящее напряжение|<p>-</p>|`SNMP agent`|hwUpsOutputVoltageA<p>Update: 10s</p>|
|Модель|<p>-</p>|`SNMP agent`|hwUpsCtrlModelType<p>Update: 2800s</p>|
|Оставшаяся емкость аккумуляторов|<p>-</p>|`SNMP agent`|hwUpsBatteryCapacityLeft<p>Update: 30s</p>|
|Напряжение батарей|<p>-</p>|`SNMP agent`|hwUpsBatteryVoltage<p>Update: 10s</p>|
|Версия ПО|<p>-</p>|`SNMP agent`|hwUpsDeviceSoftVersion<p>Update: 60m</p>|
|Статус питания|<p>-</p>|`SNMP agent`|hwUpsDevicePowerSupplyMethod<p>Update: 5s</p>|
|Выходящая активная мощность|<p>-</p>|`SNMP agent`|hwUpsOutputActivePowerA<p>Update: 10s</p>|


## Triggers

There are no triggers in this template.

