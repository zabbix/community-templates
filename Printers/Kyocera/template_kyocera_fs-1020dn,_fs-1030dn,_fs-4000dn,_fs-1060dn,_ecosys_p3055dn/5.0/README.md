# Принтеры Kyocera

## Description

Для принтеров FS-1020DN, FS-1030DN, FS-4000DN, FS-1060DN

## Overview

Russian language. Tested on:


* FS-1020DN
* FS-1030DN
* FS-4000DN
* FS-1060DN
* ECOSYS P3055dn


На русском языке.


Список переменных:


* Имя
* Модель
* Серийный номер
* Местоположение
* Контактная информация
* MAC адрес
* Сетевой интерфейс
* Общее количество отпечатанных страниц
* Код ошибки
* Строка состояния 1
* Строка состояния 2
* Тип картриджа
* Количество тонера
* Тонер: максимальное кол-во
* Тонер: текущее кол-во
* Время работы с момента последнего включения


## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|KyoceraPrint|<p>-</p>|`SNMP agent`|KyoceraPrint<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Время работы|<p>Время работы с момента последнего включения</p>|`SNMP agent`|UpTime<p>Update: 60</p>|
|Строка состояния1|<p>-</p>|`SNMP agent`|StatusStr1<p>Update: 3600</p>|
|Сетевой интерфейс|<p>-</p>|`SNMP agent`|NetworkInterface<p>Update: 3600</p>|
|Отпечатанно страниц|<p>Общее количество отпечатанных страниц</p>|`SNMP agent`|PageCounter<p>Update: 60</p>|
|Местоположение|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|Контактная информация|<p>snmp/snmp.htm</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|Тонер: максимальное кол-во|<p>-</p>|`SNMP agent`|TonerMax<p>Update: 60</p>|
|Тип картриджа|<p>-</p>|`SNMP agent`|TonerBox<p>Update: 3600</p>|
|Имя|<p>snmp/snmp.htm</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Серийный номер|<p>-</p>|`SNMP agent`|SerialNumber<p>Update: 3600</p>|
|MAC адрес|<p>-</p>|`SNMP agent`|MAC<p>Update: 3600</p>|
|Тонер: текущее кол-во|<p>-</p>|`SNMP agent`|TonerCurrent<p>Update: 60</p>|
|Количество тонера|<p>-</p>|`Calculated`|Persent<p>Update: 60</p>|
|Строка состояния2|<p>-</p>|`SNMP agent`|StatusStr2<p>Update: 3600</p>|
|Код ошибки|<p>-</p>|`SNMP agent`|ErrorCode<p>Update: 60</p>|
|Модель|<p>-</p>|`SNMP agent`|ModelName<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

