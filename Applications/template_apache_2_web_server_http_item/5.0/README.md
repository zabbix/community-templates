# App Apache2

## Overview

Zabbix template for apache 2 web server without external script. This template have macros for setting URL status page. This template uses only one http item as a master item and other items depend it.


Requirements:


1. Zabbix 4+
2. Enabled mod\_status <https://www.tecmint.com/monitor-apache-web-server-load-and-page-statistics/>


## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$STUB_STATUS_HOST}|<p>-</p>|`localhost`|Text macro|
|{$STUB_STATUS_PATH}|<p>-</p>|`server-status?auto`|Text macro|
|{$STUB_STATUS_PORT}|<p>-</p>|`80`|Text macro|
|{$STUB_STATUS_PROT}|<p>-</p>|`http`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Apache2 server version|<p>-</p>|`Dependent item`|apache2.Version<p>Update: 0</p>|
|Apache2 total accesses|<p>-</p>|`Dependent item`|apache2.Accesses<p>Update: 0</p>|
|Apache2 total requests size|<p>-</p>|`Dependent item`|apache2.kBytes<p>Update: 0</p>|
|Apache2 workers idle|<p>-</p>|`Dependent item`|apache2.IdleWorkers<p>Update: 0</p>|
|Apache2 workers busy|<p>-</p>|`Dependent item`|apache2.BusyWorkers<p>Update: 0</p>|
|Apache2 request size|<p>-</p>|`Dependent item`|apache2.BytesPerReq<p>Update: 0</p>|
|Apache2 server-status|<p>-</p>|`HTTP agent`|apache2.get<p>Update: 1m</p>|
|Apache2 server uptime|<p>-</p>|`Dependent item`|apache2.ServerUptimeSeconds<p>Update: 0</p>|
|Apache2 bytes per second|<p>-</p>|`Dependent item`|apache2.BytesPerSec<p>Update: 0</p>|
|Apache2 requests per second|<p>-</p>|`Dependent item`|apache2.ReqPerSec<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

