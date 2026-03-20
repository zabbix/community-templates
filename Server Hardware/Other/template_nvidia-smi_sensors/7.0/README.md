# NVidia Sensors

## Overview

This template integrates NVidia SMI for a single graphics card with Zabbix.

The template adds monitoring of:

* GPU Utilisation
* GPU Power Consumption
* GPU Memory (Used, Free, Total)
* GPU Temperature
* GPU Fan Speed

The following agent parameters can be used to add the metrics into Zabbix.

UserParameter=gpu.temp,nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits -i 0  
UserParameter=gpu.memtotal,nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits -i 0  
UserParameter=gpu.used,nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits -i 0   
UserParameter=gpu.free,nvidia-smi --query-gpu=memory.free --format=csv,noheader,nounits -i 0   
UserParameter=gpu.fanspeed,nvidia-smi --query-gpu=fan.speed --format=csv,noheader,nounits -i 0   
UserParameter=gpu.utilisation,nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i 0   
UserParameter=gpu.power,nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits -i 0

## Author

Richard Kavanagh
Updated & prettyfied by Tom Stocker, tom.stocker@id.ethz.ch

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
|GPU Total Memory|<p>-</p>|`Zabbix agent`|gpu.memtotal<p>Update: 30</p>|
|GPU Temperature|<p>-</p>|`Zabbix agent`|gpu.temp<p>Update: 30</p>|
|GPU Used Memory|<p>-</p>|`Zabbix agent`|gpu.used<p>Update: 30</p>|
|GPU Fan Speed|<p>-</p>|`Zabbix agent`|gpu.fanspeed<p>Update: 30</p>|


## Triggers

GPU Temperature over 95c {HOSTNAME}
last(/NVidia Sensors/gpu.temp,#2)>95

## Notes about GRID driver for virtual GPUs, or directly import template_nvidia-smi_integration_v7_vGPU.yaml where those are already removed

You may want to disable those items. as you won't see any output:

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPU Power|<p>-</p>|`Zabbix agent`|gpu.power<p>Update: 30</p>|
|GPU Temperature|<p>-</p>|`Zabbix agent`|gpu.temp<p>Update: 30</p>|
|GPU Fan Speed|<p>-</p>|`Zabbix agent`|gpu.fanspeed<p>Update: 30</p>|
