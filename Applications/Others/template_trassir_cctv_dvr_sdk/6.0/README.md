# Trassir-server

## Overview

Template for Trassir CCTV DVR server.


This template allows to check DVR server related metrics via SDK web connection.


You need to provide global or inside host macros:


* {$TRASSIR\_SDK\_PORT} - web server port on remote host, usually 8080,
* {$TRASSIR\_SDK\_PASS} - password to SDK,
* <span style="font-size: 11pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: nor


## Author

vanomel

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Trassir archive main days depth|<p>Текущая глубина архива основного потока, в днях</p>|`Dependent item`|trassirdisksstatmaindays<p>Update: 0</p>|
|Trassir network status|<p>Наличие ошибок в сетевых подключениях к другим серверам</p>|`Dependent item`|trassirnetwork<p>Update: 0</p>|
|Trassir disks status|<p>Наличие ошибок при работе дисков сервера</p>|`Dependent item`|trassirdisks<p>Update: 0</p>|
|Trassir server uptime|<p>Время работы сервера, в сек</p>|`Dependent item`|trassiruptime<p>Update: 0</p>|
|Trassir server health string|<p>-</p>|`HTTP agent`|trassirhealthjson<p>Update: 60</p>|
|Trassir archive privilege days depth|<p>Текущая глубина архива привилегированных каналов, в днях</p>|`Dependent item`|trassirdisksstatprivdays<p>Update: 0</p>|
|Trassir channels total|<p>Общее количество подключенных камер</p>|`Dependent item`|trassirchannelstotal<p>Update: 0</p>|
|Trassir database status|<p>Наличие ошибок при подключении к базе данных сервера</p>|`Dependent item`|trassirdatabase<p>Update: 0</p>|
|Trassir server cpu load|<p>Текущая загрузка центрального процессора сервера, в %</p>|`Dependent item`|trassircpuload<p>Update: 0</p>|
|Trassir automation status|<p>Наличие ошибок при выполнении скриптов на данном сервере</p>|`Dependent item`|trassirautomation<p>Update: 0</p>|
|Trassir archive sub days depth|<p>Текущая глубина архива дополнительного потока, в днях</p>|`Dependent item`|trassirdisksstatsubsdays<p>Update: 0</p>|
|Trassir channels online|<p>Количество камер, работающих без ошибок</p>|`Dependent item`|trassirchannelsonline<p>Update: 0</p>|
|Trassir SDK connection status|<p>Статус подключения к trassir SDK</p>|`Dependent item`|trassirsdkstatus<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

