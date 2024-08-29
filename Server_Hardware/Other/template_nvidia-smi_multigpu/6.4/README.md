# NVidia MultiGPU

## Overview

This template is for Zabbix to monitor multiple NVidia GPUs

This template uses two user parameters. One to search for graphic cards and one to retrieve metrics from each card

### Features

* Low-level discovery of all the graphics NVidia cards
* Prototype items and triggers for the most important parameters
* General status panel

### Installation

* Upload the nvidia_gpus.conf user settings file to the directory according to your agent settings
* Restart the zabbix-agent
* Import template zbx_NVidia_GPUs.yaml and link this template to the monitored host

This template is set up and tested on a server with nine NVidia graphics cards. Comments, suggestions and help to improve this template are welcome

## Author

Vladimir Eliseev

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPU Card|<p>GPU detection</p>|`Dependent item`|gpu.id|

## Items collected

Common Items
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPU Discovery|<p>GPU detection data</p>|`Zabbix agent`|gpu.discovery<p>Update: 1h</p>|
|GPU Count|<p>Number of GPUs detected</p>|`Dependent item`|gpu.count|
|GPU Driver Version|<p>GPU driver version</p>|`Dependent item`|gpu.driver_version|
|GPU Power Total|<p>Power consumption of all GPUs</p>|`Calculated item`|gpu.power_total<p>Update: 1m</p>|
|GPUs Maximum Temperature|<p>Temperature of the hottest GPU</p>|`Calculated item`|gpu.temp_max<p>Update: 1m</p>|
|GPU Utilization Total|<p>Total GPU utilisation</p>|`Calculated item`|gpu.utilization_total<p>Update: 1m</p>|

Item prototypes for each GPU found
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|GPU {#GPUID} Data|<p>Data collection</p>|`Zabbix agent`|gpu.card[{#GPUID}]<p>Update: 1m</p>|
|GPU {#GPUID} Power - {#NAME}|<p>Power consumption of the GPU</p>|`Dependent items`|gpu.power.[{#GPUID}]|
|GPU {#GPUID} Memory Total - {#NAME}|<p>GPU memory capacity</p>|`Dependent items`|gpu.mtotal.[{#GPUID}]|
|GPU {#GPUID} Memory Used - {#NAME}|<p>The amount of GPU memory used</p>|`Dependent items`|gpu.mused.[{#GPUID}]|
|GPU {#GPUID} Utilization - {#NAME}|<p>GPU utilisation</p>|`Dependent items`|gpu.utilization.[{#GPUID}]|
|GPU {#GPUID} Temperature - {#NAME}|<p>GPU Temperature</p>|`Dependent items`|gpu.temperature.[{#GPUID}]|
|GPU {#GPUID} Fan Speed - {#NAME}|<p>GPU Fan Speed</p>|`Dependent items`|gpu.fan.[{#GPUID}]|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|GPU {#GPUID} Temperature is extremely high|The temperature of the GPU is very high. Possibility of failure|last(/Nvidia Multi-GPU/gpu.temperature.[{#GPUID}])>=85|`High`|
|GPU {#GPUID} Temperature is high|Temperature of the graphics processor is high|<p>last(/Nvidia Multi-GPU/gpu.temperature.[{#GPUID}])>=80</p><p>**Dependencies**: GPU {#GPUID} Temperature is extremely high</p>|`Average`|
|Problem with the fan|Fan does not spin when GPU is hot|last(/Nvidia Multi-GPU/gpu.fan.[{#GPUID}])=0 and last(/Nvidia Multi-GPU/gpu.temperature.[{#GPUID}])>70|`High`|
|Error receiving data for GPU {#GPUID}|Problem with data retrieval|nodata(/Nvidia Multi-GPU/gpu.utilization.[{#GPUID}],3m)=1|`Disaster`|
