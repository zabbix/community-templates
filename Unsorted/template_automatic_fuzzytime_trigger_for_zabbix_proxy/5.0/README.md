# Auto fuzzytime trigger for Zabbix proxy

## Overview

The solution is based on Zabbix API.


And native HTTP agent will discover all proxies and create lastaccess item per each proxy + fuzzytime trigger.


In order to run this solution, you have to have an active session-id in a global level. Please see:


[https://share.zabbix.com/zabbix-tools-and-utilities/maintain-zabbix-api-session-id-in-a-global-level](zabbix-tools-and-utilities/maintain-zabbix-api-session-id-in-a-global-level)


<https://youtu.be/MjQJ0g0AaYI>


 



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PROXYFUZZYTIME}|<p>-</p>|`3m`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discover all proxies|<p>-</p>|`HTTP agent`|get.proxy.list<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Last access for {#PROXYNAME}|<p>-</p>|`Zabbix internal`|zabbix[proxy,{#PROXYNAME},lastaccess]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#PROXYNAME} is not reachable for {$PROXYFUZZYTIME}|<p>-</p>|<p>**Expression**: {Auto fuzzytime trigger for Zabbix proxy:zabbix[proxy,{#PROXYNAME},lastaccess].fuzzytime(3m)}=0</p><p>**Recovery expression**: </p>|high|
|{#PROXYNAME} is not reachable for {$PROXYFUZZYTIME} (LLD)|<p>-</p>|<p>**Expression**: {Auto fuzzytime trigger for Zabbix proxy:zabbix[proxy,{#PROXYNAME},lastaccess].fuzzytime(3m)}=0</p><p>**Recovery expression**: </p>|high|
