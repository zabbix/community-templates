# APCUPSd

## Description

Шаблон APCUPSd

## Overview

Monitoring APC UPS (without SNMP) through APCUPSd.


Russian language.


Мониторинг ИБП APC (без SNMP) через APCUPSd.


На русском языке.


Переменные:


* Имя
* Текущий статус
* Уровень заряда батареи
* Внутренняя температура
* Напряжение на входе
* Уровень нагрузки
* Уровень чувствительности
* Количество переходов на питание от батареи с момента запуска apcupsd


[Примеры настройки Zabbix agent](https://wiki.yola.ru/apcupsd#zabbix)



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Температура ИБП|<p>Внутренняя температура ИБП</p>|`Zabbix agent`|ITEMP<p>Update: 3600</p>|
|Уровень нагрузки ИБП|<p>-</p>|`Zabbix agent`|LOADPCT<p>Update: 3600</p>|
|Количество переходов на питание от батареи с момента запуска apcupsd|<p>-</p>|`Zabbix agent`|NUMXFERS<p>Update: 3600</p>|
|Текущий статус ИБП|<p>-</p>|`Zabbix agent`|STATUS<p>Update: 3600</p>|
|Напряжение на входе ИБП|<p>-</p>|`Zabbix agent`|LINEV<p>Update: 600</p>|
|Уровень чувствительности ИБП|<p>-</p>|`Zabbix agent`|SENSE<p>Update: 3600</p>|
|Уровень заряда батареи|<p>-</p>|`Zabbix agent`|BCHARGE<p>Update: 3600</p>|
|Имя ИБП|<p>Имя ИБП</p>|`Zabbix agent`|UPSNAME<p>Update: 3600</p>|
|Текущий статус ИБП 2|<p>-</p>|`Zabbix agent`|STATUS_2<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

