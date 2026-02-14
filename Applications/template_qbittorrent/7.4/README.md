# qBittorrent

## Description

Template de monitoramento da API do qBittorrent

## Overview

Template for qBittorrent with full torrent monitoring.


You need change macro "{$URLQBITTORRENT}", set URL on your qBittorrent server with port (if exist).

Template accounts for authorization bypass via whitelisting, since i wasn't able to figure out how to make authorization work.

In the qBittorent you need change in options>web interface to allow IP the zabbix server or proxy.

## Items:

* Global Transfer Info
* Connection Status
* DHT Nodes
* Download/Upload Speed
* Download/Upload Data
* Download/Upload Limits
* Version
* All Torrents Data (master for discovery and dependent items)

## Discovery Items (per torrent):

* Torrent Name and Hash
* State and Progress
* Download/Upload Speed
* Downloaded/Uploaded Data
* Size and Amount Left
* ETA and Ratio
* Number of Seeds/Leechs
* Priority and Category
* Added/Completion timestamps
* Tracker information
* Seeding time


## Author

Antony Peronio (Improved by Zabbix Expert)

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$URLQBITTORRENT}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery Torrents|<p>-</p>|`Dependent item`|torrents.discovery<p>Update: 0</p><p>Master item: torrents.all</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Connection Status|<p>-</p>|`Dependent item`|qbittorrent.connection_status<p>Update: 0</p>|
|DHT Nodes|<p>-</p>|`Dependent item`|qbittorrent.dht_nodes<p>Update: 0</p>|
|Download Speed|<p>-</p>|`Dependent item`|qbittorrent.download<p>Update: 0</p>|
|Download Data|<p>-</p>|`Dependent item`|qbittorrent.dwldata<p>Update: 0</p>|
|Download Limit|<p>-</p>|`Dependent item`|qbittorrent.dwllimit<p>Update: 0</p>|
|Upload Speed|<p>-</p>|`Dependent item`|qbittorrent.upload<p>Update: 0</p>|
|Upload Data|<p>-</p>|`Dependent item`|qbittorrent.upldata<p>Update: 0</p>|
|Upload Limit|<p>-</p>|`Dependent item`|qbittorrent.upllimit<p>Update: 0</p>|
|Version|<p>-</p>|`HTTP agent`|qbittorrent.version<p>Update: 24h</p>|
|qBittorrent all torrents data|<p>-</p>|`HTTP agent`|torrents.all<p>Update: 5m</p>|
|qBittorrent transferInfo|<p>-</p>|`HTTP agent`|transferInfo<p>Update: 1m</p>|


## Triggers

|Name|Description|Expression|Severity|
|----|-----------|----------|--------|
|Torrent {#NAME}: Error state|<p>-</p>|`last(/qBittorrent/torrent.state[{#HASH}])="error" or last(/qBittorrent/torrent.state[{#HASH}])="missingFiles" or last(/qBittorrent/torrent.state[{#HASH}])="unknown"`|High|
|Torrent {#NAME}: Low ratio|<p>-</p>|`last(/qBittorrent/torrent.progress[{#HASH}])=100 and last(/qBittorrent/torrent.ratio[{#HASH}])<1`|Warning|
|Torrent {#NAME}: Stalled download|<p>-</p>|`last(/qBittorrent/torrent.progress[{#HASH}])<100 and last(/qBittorrent/torrent.dlspeed[{#HASH}])=0 and not (last(/qBittorrent/torrent.state[{#HASH}])="pausedUP" or last(/qBittorrent/torrent.state[{#HASH}])="pausedDL" or last(/qBittorrent/torrent.state[{#HASH}])="queuedDL" or last(/qBittorrent/torrent.state[{#HASH}])="checkingDL")`|High|

