# OKTA AD Agent Healthcheck

## Overview

Easy to use, just add the template in and link it



## Author

Bilal Habib

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ITEM.STATE}|<p>AD Agent Status</p>|`1`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Service Discovery|<p>-</p>|`Zabbix agent (active)`|service.discovery<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OKTA AD Agent|<p>OKTA AD Agent status is service.info[Okta Active Directory Service]</p>|`Zabbix agent`|service.info[Okta Active Directory Service]<p>Update: 30s</p>|
|service.info[{#SERVICE.NAME},state]|<p>-</p>|`Zabbix agent`|service.info[service,<param>]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

