# Принтеры Киосера v2

## Overview

В данном шаблоне собраны:


1. MAC устройства
2. Версия ПО
3. Код ошибки
4. Модель устройства
5. Поддержка сканирования
6. Расположение
7. Серийный номер
8. Статус устройства
9. Ресурс страниц у картриджа
10. Какая модель картриджа у устройства


Счетчики:


1. Uptime
2. Всего отсканировано / копировано страниц
3. Отпечатано страниц А4
4. Всего отпечатано
5. Отсканировано страниц
6. Сколько бумаги помещается в лоток
7. Откопировано страниц


Триггеры:


<ol style="box-sizing: border-box; padding-left: 2em; margin-top: 0px; margin-bottom: 16px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI 

## Author

Alexei Lipton

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Kyocera Detect|<p>-</p>|`SNMP agent`|find.device<p>Update: 15</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Код ошибки|<p>-</p>|`SNMP agent`|error.device<p>Update: 10</p>|
|Страниц откопировано|<p>-</p>|`SNMP agent`|copy.device<p>Update: 1800</p>|
|Ресурс картриджа|<p>-</p>|`SNMP agent`|tonerboxpages.device<p>Update: 86400</p>|
|Расположение|<p>-</p>|`SNMP agent`|whereis.device<p>Update: 86400</p>|
|Сколько бумаги помещается в лоток|<p>-</p>|`SNMP agent`|paper.device<p>Update: 86400</p>|
|Модель|<p>-</p>|`SNMP agent`|model.device<p>Update: 86400</p>|
|Остаток тонера в картридже|<p>-</p>|`SNMP agent`|tonergramms.device<p>Update: 60</p>|
|Статус принтера|<p>-</p>|`SNMP agent`|status.device<p>Update: 10</p>|
|MAC Address|<p>-</p>|`SNMP agent`|mac.device<p>Update: 86400</p>|
|Время Uptime|<p>-</p>|`SNMP agent`|uptime.device<p>Update: 60</p>|
|Отпечатано страниц А4|<p>-</p>|`SNMP agent`|a4.device<p>Update: 1800</p>|
|Серийный номер|<p>-</p>|`SNMP agent`|sn.device<p>Update: 86400</p>|
|Поддержка сканирования|<p>-</p>|`SNMP agent`|scaner.device<p>Update: 86400</p>|
|Отпечатано страниц всего|<p>-</p>|`SNMP agent`|a4total.device<p>Update: 1800</p>|
|Всего отсканировано и копировано страниц|<p>-</p>|`SNMP agent`|scantotal.device<p>Update: 3600</p>|
|Отсканировано страниц|<p>-</p>|`SNMP agent`|scan.device<p>Update: 1800</p>|
|Версия программного обеспеченгия|<p>-</p>|`SNMP agent`|firmware.device<p>Update: 86400</p>|
|Модель картриджа|<p>-</p>|`SNMP agent`|tonerbox.device<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

