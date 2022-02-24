# Module ICMP ping from the Zabbix Windows agent

## Description

Oleg Kostikov aka Semiadmin Module for ICMP ping test from the Zabbix Windows agent. Put the comma-separated target list in user macro {$PING_LIST} at the template or host level and run the "get ICMP ping list" item. List example: 8.8.8.8,www.ya.ru,10.10.10.10

## Overview

 


 


 


 


 


 


 





Zabbix template for the ICMP ping test from the Zabbix Windows agent without any external scripts or user parameters.
Edit


 



 


 


 


 Put the comma-separated target list into user macro {$PING\_LIST}


at the template or host level and run the "get ICMP ping list" item.


List example:


8.8.8.8,www.ya.ru,10.10.10.10



## Author

Oleg Kostikov

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PING_LIST}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ICMP ping discovery|<p>-</p>|`Dependent item`|icmpping.discovery<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|get ICMP ping list|<p>Dummy item for addresses LLD from {$PING_LIST} user macro</p>|`Simple check`|icmpping[localhost]<p>Update: 1d</p>|
|get icmp ping {#ADDR}|<p>-</p>|`Zabbix agent`|wmi.getall[root\cimv2,"SELECT PrimaryAddressResolutionStatus, StatusCode, ResponseTime FROM Win32_PingStatus WHERE Address='{#ADDR}' AND Timeout=2000"]<p>Update: 1m</p><p>LLD</p>|
|ping status {#ADDR}|<p>-</p>|`Dependent item`|ping.status[{#ADDR}]<p>Update: 0</p><p>LLD</p>|
|resolution status {#ADDR}|<p>-</p>|`Dependent item`|resolution.status[{#ADDR}]<p>Update: 0</p><p>LLD</p>|
|response time {#ADDR}|<p>-</p>|`Dependent item`|response.time[{#ADDR}]<p>Update: 0</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

