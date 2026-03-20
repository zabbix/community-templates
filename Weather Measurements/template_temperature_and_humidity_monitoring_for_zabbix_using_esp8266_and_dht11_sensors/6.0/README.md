# ZBX-ESP-ENV

## Description

Temperature and humidity monitoring for Zabbix using ESP8266 and DHT11 sensors.

## Overview

Using cheap hardware it is possible to monitor basic environment data near by.


What is needed:


* ESP8266 module (I'm using NodeMCU)
* DHT11 sensors (probably up to 8)
* Some jumper wires
* Access to WiFi network reachable by zabbix server or proxy


Installation process is described here: [https://github.com/michalsternadel/zbx-esp-env/blob/master/README.md](https://github.com/michalsternadel/zbx-esp-env/blob/master/README.md "Installation")



## Author

Michał Sternadel

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HISTORYSP}|<p>-</p>|`90d`|Text macro|
|{$INTERVALHTTP}|<p>-</p>|`1m`|Text macro|
|{$INTERVALLLDHTTP}|<p>-</p>|`1h`|Text macro|
|{$LOSTPERIOD}|<p>-</p>|`10m`|Text macro|
|{$TRENDSP}|<p>-</p>|`365d`|Text macro|
|{$UPINTERVALLLD}|<p>-</p>|`5m`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery Sensors|<p>Discovery Data Raw All</p>|`HTTP agent`|discovery.sensors<p>Update: {$INTERVALLLDHTTP}</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#NAME} Humidity|<p>-</p>|`HTTP agent`|sensor.humidity[{#INDEX}]<p>Update: {$UPINTERVALLLD}</p><p>LLD</p>|
|{#NAME} Temperature|<p>-</p>|`HTTP agent`|sensor.temperature[{#INDEX}]<p>Update: {$UPINTERVALLLD}</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#NAME} - The temperature is above the average limit ({#AVERAGE_H})|<p>The temperature readings from sensor {#NAME} is over threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) > {#AVERAGE_H}</p><p>**Recovery expression**: </p>|average|
|{#NAME} - The temperature is above the disaster limit ({#DISASTER_H})|<p>The temperature readings from sensor {#NAME} is over threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) > {#DISASTER_H}</p><p>**Recovery expression**: </p>|disaster|
|{#NAME} - The temperature is above the high limit ({#HIGH_H})|<p>The temperature readings from sensor {#NAME} is over threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) > {#HIGH_H}</p><p>**Recovery expression**: </p>|high|
|{#NAME} - The temperature is below the average limit ({#AVERAGE_L})|<p>The temperature readings from sensor {#NAME} is below threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) < {#AVERAGE_L}</p><p>**Recovery expression**: </p>|average|
|{#NAME} - The temperature is below the disaster limit ({#DISASTER_L})|<p>The temperature readings from sensor {#NAME} is below threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) < {#DISASTER_L}</p><p>**Recovery expression**: </p>|disaster|
|{#NAME} - The temperature is below the high limit ({#HIGH_L})|<p>The temperature readings from sensor {#NAME} is below threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) < {#HIGH_L}</p><p>**Recovery expression**: </p>|high|
|{#NAME} - The temperature is above the average limit ({#AVERAGE_H}) (LLD)|<p>The temperature readings from sensor {#NAME} is over threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) > {#AVERAGE_H}</p><p>**Recovery expression**: </p>|average|
|{#NAME} - The temperature is above the disaster limit ({#DISASTER_H}) (LLD)|<p>The temperature readings from sensor {#NAME} is over threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) > {#DISASTER_H}</p><p>**Recovery expression**: </p>|disaster|
|{#NAME} - The temperature is above the high limit ({#HIGH_H}) (LLD)|<p>The temperature readings from sensor {#NAME} is over threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) > {#HIGH_H}</p><p>**Recovery expression**: </p>|high|
|{#NAME} - The temperature is below the average limit ({#AVERAGE_L}) (LLD)|<p>The temperature readings from sensor {#NAME} is below threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) < {#AVERAGE_L}</p><p>**Recovery expression**: </p>|average|
|{#NAME} - The temperature is below the disaster limit ({#DISASTER_L}) (LLD)|<p>The temperature readings from sensor {#NAME} is below threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) < {#DISASTER_L}</p><p>**Recovery expression**: </p>|disaster|
|{#NAME} - The temperature is below the high limit ({#HIGH_L}) (LLD)|<p>The temperature readings from sensor {#NAME} is below threshold.</p>|<p>**Expression**: last(/ZBX-ESP-ENV/sensor.temperature[{#INDEX}]) < {#HIGH_L}</p><p>**Recovery expression**: </p>|high|
