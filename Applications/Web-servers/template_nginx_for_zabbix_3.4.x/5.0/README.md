# App Nginx by Alex Gluck

## Overview

System requirements
-------------------


* Nginx, [http://nginx.org](http://nginx.org/)/, with configured `http\_stub\_status\_module`


Features
--------


Connection Statistics:


* Active
* Reading
* Waiting
* Writing


Request Statistics:


<ul style="padding: 0px 0px 0px 12px; margin: 0px 0px 1.5em 12px; border: 0px; outline: 0px; vertic



## Author

Alex Gluck

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$NGINX_CON_NUM}|<p>-</p>|`2500`|Text macro|
|{$NGINX_HOST}|<p>-</p>|`localhost`|Text macro|
|{$NGINX_PORT}|<p>-</p>|`80`|Text macro|
|{$NGINX_REQ_NUM}|<p>-</p>|`600`|Text macro|
|{$NGINX_STATS_URI}|<p>-</p>|`nginx-stats`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Nginx: requests per sec|<p>-</p>|`Dependent item`|nginx.requests<p>Update: 0</p>|
|Nginx: connections reading|<p>-</p>|`Dependent item`|nginx.reading<p>Update: 0</p>|
|Nginx: Number of processes $1|<p>-</p>|`Zabbix agent`|proc.num[nginx]<p>Update: 60s</p>|
|Nginx: connects active|<p>-</p>|`Dependent item`|nginx.active.connect<p>Update: 0</p>|
|Nginx: connections waiting|<p>-</p>|`Dependent item`|nginx.waiting<p>Update: 0</p>|
|Nginx: connections writing|<p>-</p>|`Dependent item`|nginx.writing<p>Update: 0</p>|
|Nginx: connections accepted per sec|<p>-</p>|`Dependent item`|nginx.accepts<p>Update: 0</p>|
|Get Nginx stat page|<p>-</p>|`Zabbix agent`|web.page.get[{$NGINX_HOST},{$NGINX_STATS_URI},{$NGINX_PORT}]<p>Update: 60s</p>|
|Nginx: connections handled per sec|<p>-</p>|`Dependent item`|nginx.handled<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

