# NVidia Sensors

## Overview

This template integrates NVidia SMI for a single graphics card with Zabbix for Windows Clients.


The template adds monitoring of:


* GPU Utilisation
* GPU Memory Utilisation
* GPU Power Consumption
* GPU Memory (Used, Free, Total)
* GPU Temperature
* GPU Temperature of machine's shutdown
* GPU Fan Speed

## Author of original

Richard Kavanagh

## Semi Author
Victor Krestov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPU Power|<p>-</p>|`Zabbix agent`|gpu.power<p>Update: 30</p>|
|GPU Free Memory|<p>-</p>|`Zabbix agent`|gpu.free<p>Update: 30</p>|
|GPU Utilisation|<p>-</p>|`Zabbix agent`|gpu.utilisation<p>Update: 30</p>|
|GPU Memory Utilisation|<p>-</p>|`Zabbix agent`|gpu.memutil<p>Update: 30</p>|
|GPU Total Memory|<p>-</p>|`Zabbix agent`|gpu.memtotal<p>Update: 30</p>|
|GPU Temperature|<p>-</p>|`Zabbix agent`|gpu.temp<p>Update: 30</p>|
|GPU Shutdown Temperature|<p>-</p>|`Zabbix agent`|gpu.shutdowntemp<p>Update: 30</p>|
|GPU Used Memory|<p>-</p>|`Zabbix agent`|gpu.used<p>Update: 30</p>|
|GPU Fan Speed|<p>-</p>|`Zabbix agent`|gpu.fanspeed<p>Update: 30</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|GPU Temperature over 95c {HOSTNAME}|<p>-</p>|<p>**Expression**: last(/NVidia Sensors/gpu.temp,#2)>95
