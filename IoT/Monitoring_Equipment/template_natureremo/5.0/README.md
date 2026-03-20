# NatureRemo

## Overview

Automatically detects Nature Remo with LLD and generates temperature / humidity / illuminance items.


Please put the access token obtained at https://home.nature.global in the host macro {$REMO\_BEARER}.


You can download userparameter\_natureremo.conf and remo-json.sh from the links below.


<https://github.com/nakaring/Zabbix-NatureRemo/blob/master/remo-json.sh>


<https://github.com/nakaring/Zabbix-NatureRemo/blob/master/userparameter_natureremo.conf>


In remo-json.sh, place it in /usr/local/bin (or rewrite the path in userparameter) with permission to execute the zabbix-agent execution user.


 


ZabbixのLLDでNatureRemoを検出して、温湿度と照度を取得します。
----------------------------------------


userparameterで/usr/local/bin/remo-json.shを参照してるので、そのパスに置くか書き換えること。
------------------------------------------------------------------


remo-json.shはZabbix-agent実行ユーザーに実行権限を付けること。
-------------------------------------------



## Author

nakaring

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$REMO_BEARER}|<p>-</p>|`empty`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|NatureRemo Discovery|<p>-</p>|`Zabbix agent (active)`|natureremo.discovery[{$REMO_BEARER}]<p>Update: 10m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#REMONAME} 湿度|<p>-</p>|`Zabbix agent`|natureremo.humi[{#REMONAME}]<p>Update: 30s</p><p>LLD</p>|
|{#REMONAME} 照度|<p>-</p>|`Zabbix agent`|natureremo.illumi[{#REMONAME}]<p>Update: 30s</p><p>LLD</p>|
|{#REMONAME} 室温|<p>-</p>|`Zabbix agent`|natureremo.temp[{#REMONAME}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

