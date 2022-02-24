# App Nutcracker

## Overview

Template for collecting [nutcracker (twemproxy)](https://github.com/twitter/twemproxy) metrics.


By default template use system.run to collect metrics from <http://localhost:22222> (can be altered via macro) via zabbix-agent, but it can be changed to userparameter or http agent if remote commands are forbidden.


Some of the features:


* Pool and server discovery.
* Single request for LLD and metrics.
* Minimum host dependencies - only curl needed if system.run used. No host dependencies with http agent.
* No host scripts, utilizing Zabbix features: dependent items and JavaScript preprocessing.


## Author

Oleg Morozov aka zigmund

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$NUTCRACKER_URL}|<p>Nutcracker stats URL</p>|`http://localhost:22222`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Server discovery|<p>-</p>|`Dependent item`|nutcracker[stats,server_discovery]<p>Update: 0</p>|
|Pool discovery|<p>-</p>|`Dependent item`|nutcracker[stats,pool_discovery]<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Nutcracker current connections|<p>Number of all active connections (client + server)</p>|`Dependent item`|nutcracker[stats,curr_connections]<p>Update: 0</p>|
|Nutcracker stats|<p>Nutcracker JSON stats</p>|`Zabbix agent (active)`|system.run[curl -s {$NUTCRACKER_URL}]<p>Update: 1m</p>|
|Number of nutcracker processes|<p>-</p>|`Zabbix agent (active)`|proc.num[nutcracker]<p>Update: 1m</p>|
|Nutcracker connections per second|<p>Number of new connections per second</p>|`Dependent item`|nutcracker[stats,total_connections]<p>Update: 0</p>|
|Nutcracker server {#POOL}/{#SERVER} incoming queue requests|<p>Current number of requests in incoming queue</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},in_queue]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} incoming queue bytes|<p>Current number of bytes in incoming queue</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},in_queue_bytes]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} outgoing queue requests|<p>Current number of requests in outgoing queue</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},out_queue]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} outgoing queue bytes|<p>Current number of bytes in outgoing queue</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},out_queue_bytes]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} requests per second|<p>Number of requests per second</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},requests]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} request bytes per second|<p>Number of request bytes per second</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},request_bytes]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} responses per second|<p>Number of responses per second</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},responses]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} response bytes per second|<p>Number of response bytes per second</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},response_bytes]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} connections|<p>Number of active server connections</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},server_connections]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} last ejection timestamp|<p>Last time when server was ejected at</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},server_ejected_at]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} EOF per second|<p>Number of eof on server connections per second</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},server_eof]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} errors per second|<p>Number of errors on server connections per second</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},server_err]<p>Update: 0</p><p>LLD</p>|
|Nutcracker server {#POOL}/{#SERVER} timeouts per second|<p>Number of timeouts on server connections per second</p>|`Dependent item`|nutcracker[stats,servers,{#POOL},{#SERVER},server_timedout]<p>Update: 0</p><p>LLD</p>|
|Nutcracker pool {#POOL} client connections|<p>Number of active client connections</p>|`Dependent item`|nutcracker[stats,pools,{#POOL},client_connections]<p>Update: 0</p><p>LLD</p>|
|Nutcracker pool {#POOL} client EOF per second|<p>Number of eof on client connections per second</p>|`Dependent item`|nutcracker[stats,pools,{#POOL},client_eof]<p>Update: 0</p><p>LLD</p>|
|Nutcracker pool {#POOL} client errors per second|<p>Number of errors on client connections per second</p>|`Dependent item`|nutcracker[stats,pools,{#POOL},client_err]<p>Update: 0</p><p>LLD</p>|
|Nutcracker pool {#POOL} forward errors per second|<p>Number of forwarding errors per second</p>|`Dependent item`|nutcracker[stats,pools,{#POOL},forward_error]<p>Update: 0</p><p>LLD</p>|
|Nutcracker pool {#POOL} fragments per second|<p>Number of fragments created from a multi-vector request per second</p>|`Dependent item`|nutcracker[stats,pools,{#POOL},fragments]<p>Update: 0</p><p>LLD</p>|
|Nutcracker pool {#POOL} server ejects per second|<p>Number of times backend server was ejected per second</p>|`Dependent item`|nutcracker[stats,pools,{#POOL},server_ejects]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Nutcracker pool {#POOL} forward errors|<p>-</p>|<p>**Expression**: last(/App Nutcracker/nutcracker[stats,pools,{#POOL},forward_error])>0</p><p>**Recovery expression**: </p>|average|
|Nutcracker server {#POOL}/{#SERVER} was ejected|<p>-</p>|<p>**Expression**: change(/App Nutcracker/nutcracker[stats,servers,{#POOL},{#SERVER},server_ejected_at])>1</p><p>**Recovery expression**: </p>|average|
|Nutcracker server {#POOL}/{#SERVER} errors|<p>-</p>|<p>**Expression**: last(/App Nutcracker/nutcracker[stats,servers,{#POOL},{#SERVER},server_err])>0</p><p>**Recovery expression**: </p>|average|
|Nutcracker server {#POOL}/{#SERVER} was ejected (LLD)|<p>-</p>|<p>**Expression**: change(/App Nutcracker/nutcracker[stats,servers,{#POOL},{#SERVER},server_ejected_at])>1</p><p>**Recovery expression**: </p>|average|
|Nutcracker server {#POOL}/{#SERVER} errors (LLD)|<p>-</p>|<p>**Expression**: last(/App Nutcracker/nutcracker[stats,servers,{#POOL},{#SERVER},server_err])>0</p><p>**Recovery expression**: </p>|average|
|Nutcracker pool {#POOL} forward errors (LLD)|<p>-</p>|<p>**Expression**: last(/App Nutcracker/nutcracker[stats,pools,{#POOL},forward_error])>0</p><p>**Recovery expression**: </p>|average|
