# App IIS Service_RUS

## Overview

16 Items, 4 Triggers 5 Graphs and 2 Screens built for IIS 7.5, 8.0, 8.5 and 10 Services, Ports and Performance Counters. Developed through "Template Windows 2008 R2 IIS Server\_RUS" for RUSSIAN Location



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IIS Web Service Текущее количество кэшированных метаданных|<p>Current number of metadata information blocks currently in the user-mode cache.</p>|`Zabbix agent`|perf_counter["\Кэш веб-службы\Текущее количество кэшированных метаданных",300]<p>Update: 30</p>|
|IIS Web Service Процент попаданий в кэше URI|<p>The ratio of user-mode URI Cache Hits to total cache requests (since service startup)</p>|`Zabbix agent`|perf_counter["\Кэш веб-службы\Процент попаданий в кэше URI",300]<p>Update: 30</p>|
|IIS Web Service Процент попаданий в кэш файлов|<p>The ratio of user-mode file cache hits to total cache requests (since service startup). Note: This value might be low if the Kernel URI cache hits percentage is high.</p>|`Zabbix agent`|perf_counter["\Кэш веб-службы\Процент попаданий в кэш файлов",300]<p>Update: 30</p>|
|IIS Web Service Количество запросов GET в секунду|<p>Total number of HTTP GET requests received by WWW service</p>|`Zabbix agent`|perf_counter["\Веб-служба(*)\Количество запросов GET в секунду",300]<p>Update: 30</p>|
|IIS Web Service Текущее количество кэшированных блоков URI|<p>URI information blocks currently in the user-mode cache</p>|`Zabbix agent`|perf_counter["\Кэш веб-службы\Текущее количество кэшированных блоков URI",300]<p>Update: 30</p>|
|IIS Admin Service NOT USE Windows 2008|<p>IIS Admin Service</p>|`Zabbix agent`|service_state[IISAdmin]<p>Update: 30</p>|
|IIS Web Service Максимальное количество подключений|<p>Current number of connections to the service</p>|`Zabbix agent`|perf_counter["\Веб-служба(*)\Максимальное количество подключений",300]<p>Update: 30</p>|
|IIS Web Service Количество запросов POST в секунду|<p>Number of HTTP requests using POST method</p>|`Zabbix agent`|perf_counter["\Веб-служба(*)\Количество запросов POST в секунду",300]<p>Update: 30</p>|
|IIS Web Service Количество попаданий в кэше метаданных|<p>The ratio of user-mode metadata cache hits to total cache requests (since service startup)</p>|`Zabbix agent`|perf_counter["\Кэш веб-службы\Количество попаданий в кэше метаданных",300]<p>Update: 30</p>|
|IIS Web Service Количество попаданий в кэш файлов|<p>Current number of files whose content is in the user-mode cache</p>|`Zabbix agent`|perf_counter["\Кэш веб-службы\Количество попаданий в кэш файлов",300]<p>Update: 30</p>|
|IIS Web Service Количество полученных байтов в секунду|<p>Rate of total bytes transferred by service (received)</p>|`Zabbix agent`|perf_counter["\Веб-служба(*)\Количество полученных байтов в секунду",300]<p>Update: 15</p>|
|IIS Web Service Всего кэшированных блоков URI|<p>URI information blocks currently in the user-mode cache</p>|`Zabbix agent`|perf_counter["\Кэш веб-службы\Всего кэшированных блоков URI",300]<p>Update: 30</p>|
|IIS Web Service Количество текущих подключений|<p>Current number of connections to the service</p>|`Zabbix agent`|perf_counter["\Веб-служба(*)\Количество текущих подключений",300]<p>Update: 30</p>|
|IIS Web Service Количество отправленных байтов в секунду|<p>Rate of total bytes transferred by service (sent)</p>|`Zabbix agent`|perf_counter["\Веб-служба(*)\Количество отправленных байтов в секунду",300]<p>Update: 30</p>|
|IIS Service порт 443 (HTTPS)|<p>-</p>|`Zabbix agent`|net.tcp.listen[443]<p>Update: 30</p>|
|IIS Web Service Всего байтов в секунду|<p>Rate of total bytes transferred by service (sum of bytes sent and received)</p>|`Zabbix agent`|perf_counter["\Веб-служба(*)\Всего байтов в секунду",300]<p>Update: 30</p>|
|Служба веб-публикаций IIS World Side Web|<p>World Wide Web Publishing Service</p>|`Zabbix agent`|service_state[W3SVC]<p>Update: 30</p>|
|IIS Service порт 80 (HTTP)|<p>-</p>|`Zabbix agent`|net.tcp.listen[80]<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

