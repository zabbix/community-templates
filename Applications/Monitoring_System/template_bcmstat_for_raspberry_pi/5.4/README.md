# App bcmstat

## Description

Monitoring bcmstat 0.5.4 or greater. https://github.com/MilhouseVH/bcmstat

## Overview

The Git repo can be found [here](https://gitlab.com/i.am.stack/zabbix_bcmstat_raspberrypi).


This template will monitor Raspberry Pi's (only tested RPI4) via SSH using the bcmstat utility which must be v0.5.4 or better. 



## Author

~Stack~

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template App SSH Service|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU3 % used|<p>-</p>|`Dependent item`|cpu3<p>Update: 0</p>|
|GPU Memory Free|<p>-</p>|`Dependent item`|gpumem<p>Update: 0</p>|
|Core Temp|<p>-</p>|`Dependent item`|CoreTemp<p>Update: 0</p>|
|H264 Speed|<p>-</p>|`Dependent item`|H264Mhz<p>Update: 0</p>|
|GPU Speed|<p>-</p>|`Dependent item`|GPUMhz<p>Update: 0</p>|
|CPU Memory Free|<p>-</p>|`Dependent item`|cpumem<p>Update: 0</p>|
|TX Bytes per second|<p>-</p>|`Dependent item`|txbps<p>Update: 0</p>|
|CPU2 % used|<p>-</p>|`Dependent item`|cpu2<p>Update: 0</p>|
|RX Bytes per second|<p>-</p>|`Dependent item`|rxbps<p>Update: 0</p>|
|CPU0 % used|<p>-</p>|`Dependent item`|cpu0<p>Update: 0</p>|
|IRQ per second|<p>Interrupt requests per second</p>|`Dependent item`|IRQs<p>Update: 0</p>|
|CPU Speed|<p>-</p>|`Dependent item`|CPUMHz<p>Update: 0</p>|
|bcmstat|<p>Absolutely requires bcmstat.sh v0.5.4+. Anything before this doesn't have the J option and my workaround was crazy janky.</p>|`SSH agent`|ssh.run[bcmstat_{HOST.NAME}]<p>Update: 8s</p>|
|CPU1 % used|<p>-</p>|`Dependent item`|cpu1<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

