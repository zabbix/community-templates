# NVidia MultiGPU

## Overview

This template is for Zabbix to monitor multiple NVidia GPUs

This template uses only one user parameter, receives all parameters in one request and requires no additional scripts

### Features

* Low-level discovery of all the graphics Nvidia cards
* Prototype items and triggers for the most important parameters
* General status panel

### Installation

* Upload the nvidia_gpus.conf user settings file to the directory according to your agent settings
* Restart the zabbix-agent
* Import template zbx_NVidia_GPUs.yaml and link this template to the monitored host

This template is set up and tested on a server with nine Nvidia graphics cards. Comments, suggestions and help to improve this template are welcome

## Author

Vladimir Eliseev

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPU Data|<p>Data collection by GPUs</p>|`SNMP agent`|gpu.data<p>Update: 1m</p>|

## Items collected

Common Items
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPU Count|<p>Number of GPUs detected</p>|`Dependent items`|gpu.count|
|GPU Driver Version|<p>GPU driver version</p>|`Dependent items`|gpu.driver_version|
|GPU Power Total|<p>Power consumption of all GPUs</p>|`Dependent items`|gpu.power_total|
|GPUs Maximum Temperature|<p>Temperature of the hottest GPU</p>|`Dependent items`|gpu.temp_max|
|GPU Utilization Total|<p>Total GPU utilisation</p>|`Dependent items`|gpu.utilization_total|

Items for each GPU found
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPU Power|Power consumption of the GPU|`Dependent items`|gpu.power|
|GPU Total Memory|GPU memory capacity|`Dependent items`|gpu.mtotal|
|GPU Used Memory|The amount of GPU memory used|`Dependent items`|gpu.mused|
|GPU Free Memory|Amount of free GPU memory|`Dependent items`|gpu.mfree|
|GPU Utilisation|GPU utilisation|`Dependent items`|gpu.utilization|
|GPU Temperature|GPU Temperature|`Dependent items`|gpu.temperature|
|GPU Fan Speed|GPU Fan Speed|`Dependent items`|gpu.fan|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Driver version changed|The driver version has changed|<p>change(/Nvidia Multi-GPU/gpu.driver_version)<>0</p>|`Information`|
|GPU {#ID} Temperature is extremely high|The temperature of the GPU is very high. Possibility of failure|last(/Nvidia Multi-GPU/gpu.temperature.[{#ID}])>=80|`Disaster`|
|GPU {#ID} Temperature is high|Temperature of the graphics processor is high|<p>last(/Nvidia Multi-GPU/gpu.temperature.[{#ID}])>=65</p><p>**Dependencies**: GPU {#ID} Temperature is extremely high</p>|`Average`|
|Problem with the fan|Fan does not spin when GPU is hot|last(/Nvidia Multi-GPU/gpu.fan.[{#ID}])=0 and last(/Nvidia Multi-GPU/gpu.temperature.[{#ID}])>60|`Disaster`|
