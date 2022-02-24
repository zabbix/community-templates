# qBittorrent

## Description

Template de monitoramento da API do qBittorrent

## Overview

Template for qBittorrent.


 


Do you need change macro "{$URLQBITTORRENT}", set de URL on your qBittorrent server with port (if exist).


In the qBittorent do you need change in options>web interface to allow IP the zabbix server or proxy.


 


Itens:


* Conection Status
* DHT Nodes
* Download Data
* Download Limit
* Download Speed
* Upload Data
* Upload Limit
* Upload Speed
* Version


## Author

Antony Peronio

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$URLQBITTORRENT}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery Torrents|<p>-</p>|`HTTP agent`|torrents.discovery<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Conection Status|<p>-</p>|`Dependent item`|qbittorrent.connection_status<p>Update: 0</p>|
|Upload Data|<p>-</p>|`Dependent item`|qbittorrent.upldata<p>Update: 0</p>|
|Upload Limit|<p>-</p>|`Dependent item`|qbittorrent.upllimit<p>Update: 0</p>|
|Version|<p>-</p>|`HTTP agent`|qbittorrent.version<p>Update: 24h</p>|
|Download Limit|<p>-</p>|`Dependent item`|qbittorrent.dwllimit<p>Update: 0</p>|
|Upload Speed|<p>-</p>|`Dependent item`|qbittorrent.upload<p>Update: 0</p>|
|qBittorrent transferInfo|<p>-</p>|`HTTP agent`|transferInfo<p>Update: 1m</p>|
|Download Speed|<p>-</p>|`Dependent item`|qbittorrent.download<p>Update: 0</p>|
|Download Data|<p>-</p>|`Dependent item`|qbittorrent.dwldata<p>Update: 0</p>|
|DHT Nodes|<p>-</p>|`Dependent item`|qbittorrent.dht_nodes<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

