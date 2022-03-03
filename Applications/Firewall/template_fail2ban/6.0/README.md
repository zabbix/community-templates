# Fail2ban

## Overview

Fail2Ban template for Zabbix
============================


**Features:**


Automatic discovery of jails


Monitor service status


Monitor jails


Jails graph


 


**The installation instruction is in this repository.** [github.com/hermanekt/zabbix-fail2ban-discovery-](cat-app/firewall/fail2ban/visit)



## Author

Tomas Hermanek

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fail2ban discovery|<p>Discovery of jails from fail2ban daemon.</p>|`Zabbix agent`|fail2ban.discovery<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fail2Ban service is running|<p>ping - tests if the server is alive</p>|`Zabbix agent`|proc.num[fail2ban-server]<p>Update: 60</p>|
|Fail2ban $1 banned IPs|<p>-</p>|`Zabbix agent`|fail2ban.status[{#JAIL}]<p>Update: 60</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

