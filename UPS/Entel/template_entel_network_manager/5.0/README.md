# ENTEL 1PH UPS

## Overview

Шаблон для подключения платы сетевого управления в составе **однофазных** ИБП российского производителя ЭНТЕЛ.


Шаблон включает в себя 3 группы элементов данных, 12 элементов данных, 10 триггеров и 4 графика и позволяет наблюдать за основными метриками.


**Группа вход:**


1. Напряжение входа
2. Частота входа


**Группа выход:**


1. Режим работы
2. Напряжение выхода
3. Частота выхода
4. Нагрузка (в процентах от номинальной мощности)


**Группа АКБ:**


1. Статус АКБ
2. Температура АКБ
3. Напряжение АКБ
4. Заряд АКБ
5. Расчетное время автономии при текущей нагрузке
6. Текущее время работы от АКБ


 


Для использования шаблона не забудьте установить {$SNMP\_COMMUNITY} для узла сети в соответствии с настройками платы сетевого управления ЭНТЕЛ.



## Author

Matsepura Artem

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Напряжение АКБ|<p>-</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 30</p>|
|Напряжение входа|<p>-</p>|`SNMP agent`|upsInputVoltage<p>Update: 30</p>|
|Заряд АКБ|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 30</p>|
|Напряжение выхода|<p>-</p>|`SNMP agent`|upsOutputVoltage<p>Update: 30</p>|
|Время работы от АКБ|<p>-</p>|`SNMP agent`|upsSecondsOnBattery<p>Update: 30</p>|
|Нагрузка в процентах|<p>-</p>|`SNMP agent`|upsOutputPercentLoad<p>Update: 30</p>|
|Режим работы|<p>-</p>|`SNMP agent`|upsOutputSource<p>Update: 10</p>|
|Температура АКБ|<p>-</p>|`SNMP agent`|upsBatteryTemperature<p>Update: 30</p>|
|Расчетное время автономии|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 30</p>|
|Частота входа|<p>-</p>|`SNMP agent`|upsInputFrequency<p>Update: 30</p>|
|Статус АКБ|<p>-</p>|`SNMP agent`|upsBatteryStatus<p>Update: 30</p>|
|Частота выхода|<p>-</p>|`SNMP agent`|upsOutputFrequency<p>Update: 10</p>|


## Triggers

There are no triggers in this template.

