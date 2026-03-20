# Domination

## Overview

Шаблон для видео наблюдения на базе Domination.



## Author

Egor Elcov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DnDiskNum|<p>-</p>|`SNMP agent`|DnDiskNum<p>Update: 5m</p>|
|DnCamNo|<p>-</p>|`SNMP agent`|DnCamNo<p>Update: 5m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Кол-во подключенных пользователей|<p>Количество соединений (клиентов, пользователей), подключенных к видеосерверу.</p>|`SNMP agent`|DnREALCLIENTS<p>Update: 30s</p>|
|Порт Видеосервера|<p>-</p>|`SNMP agent`|DnPort<p>Update: 24h</p>|
|Серийный номер видеосервера|<p>-</p>|`SNMP agent`|DnSerial<p>Update: 24h</p>|
|Число потерянных кадров|<p>Число потерянных кадров от камер, которое не успевают записывать HDD видеосервера.</p>|`SNMP agent`|DnStorageDroppedFrames<p>Update: 30s</p>|
|Исходящий трафик|<p>-</p>|`SNMP agent`|Dn_TX_SPEED<p>Update: 30s</p>|
|IP-адрес видеосервера|<p>-</p>|`SNMP agent`|DnIP<p>Update: 10m</p>|
|Скорость записи на HDD|<p>Скорость записи (Кбайт/сек) на HDD. При включенной функции "зеркалирования" архива значение удваивается.</p>|`SNMP agent`|DnRECORD_SPEED<p>Update: 30s</p>|
|Нагрузка процессора .|<p>Нагрузка (%) процессора видеосервера.</p>|`SNMP agent`|DnCPU_LOAD<p>Update: 1m</p>|
|Количество архивных подключений|<p>Количество архивных подключений к серверу.</p>|`SNMP agent`|DnPLAYERCONNECTIONS<p>Update: 30s</p>|
|Количество неисправных HDD|<p>-</p>|`SNMP agent`|DnDiskFailedNum<p>Update: 10m</p>|
|Входящий трафик|<p>-</p>|`SNMP agent`|Dn_RX_SPEED<p>Update: 30s</p>|
|Свободное место HDD $1|<p>-</p>|`SNMP agent`|DnDiskFreeSpace[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Жесткий диск $1|<p>-</p>|`SNMP agent`|DnDiskIndex[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Модель и SN HDD $1|<p>-</p>|`SNMP agent`|DnDiskSerial[{#SNMPINDEX}]<p>Update: 24h</p><p>LLD</p>|
|Статус HDD $1|<p>-</p>|`SNMP agent`|DnDiskStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Объем HDD $1|<p>-</p>|`SNMP agent`|DnDiskTotalSpace[{#SNMPINDEX}]<p>Update: 24h</p><p>LLD</p>|
|IP-адрес камеры $1|<p>-</p>|`SNMP agent`|CamIPAddress.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Состояние камеры $1|<p>-</p>|`SNMP agent`|DnCamConnected.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Состояние канала $1|<p>-</p>|`SNMP agent`|DnCamEnabled.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Количество FPS 1-го потока камеры $1|<p>-</p>|`SNMP agent`|DnCamFramerate.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Статус второго потока Камера $1|<p>-</p>|`SNMP agent`|DnCamHasSubstream.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

