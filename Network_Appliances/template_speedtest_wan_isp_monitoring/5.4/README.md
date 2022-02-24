# App Speedtest WAN

## Overview

Monitoring the speedtest by different ISP server on different part of world


It need the script here https://git.cdp.li/polcape/zabbix/tree/master/zabbix-speedtest



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery ISP Server|<p>-</p>|`Zabbix agent`|speedtest.discovery<p>Update: 500s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Speedtest Best server - Download|<p>-</p>|`Zabbix agent`|speedtest.download<p>Update: 1200s</p>|
|Speedtest Best server - Upload|<p>-</p>|`Zabbix agent`|speedtest.upload<p>Update: 1200s</p>|
|Speedtest Best server - Ping|<p>-</p>|`Zabbix agent`|speedtest.ping<p>Update: 1200s</p>|
|Speedtest {#SERVERNAME} - Download|<p>-</p>|`Zabbix agent`|speedtest.download.server[{#SERVERID}]<p>Update: 1200s</p><p>LLD</p>|
|Speedtest {#SERVERNAME} - Ping|<p>-</p>|`Zabbix agent`|speedtest.ping.server[{#SERVERID}]<p>Update: 1200s</p><p>LLD</p>|
|Speedtest {#SERVERNAME} - Upload|<p>-</p>|`Zabbix agent`|speedtest.upload.server[{#SERVERID}]<p>Update: 1200s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.HOST} Download {#SERVERNAME} speed < {#SERVER_TR_DL}Mb/s|<p>-</p>|<p>**Expression**: avg(/App Speedtest WAN/speedtest.download.server[{#SERVERID}],#3)<{#SERVER_TR_DL}</p><p>**Recovery expression**: </p>|warning|
|{HOST.HOST} Upload {#SERVERNAME} speed < {#SERVER_TR_UL}Mb/s|<p>-</p>|<p>**Expression**: avg(/App Speedtest WAN/speedtest.upload.server[{#SERVERID}],#3)<{#SERVER_TR_UL}</p><p>**Recovery expression**: </p>|warning|
|{HOST.HOST} Download {#SERVERNAME} speed < {#SERVER_TR_DL}Mb/s (LLD)|<p>-</p>|<p>**Expression**: avg(/App Speedtest WAN/speedtest.download.server[{#SERVERID}],#3)<{#SERVER_TR_DL}</p><p>**Recovery expression**: </p>|warning|
|{HOST.HOST} Upload {#SERVERNAME} speed < {#SERVER_TR_UL}Mb/s (LLD)|<p>-</p>|<p>**Expression**: avg(/App Speedtest WAN/speedtest.upload.server[{#SERVERID}],#3)<{#SERVER_TR_UL}</p><p>**Recovery expression**: </p>|warning|
