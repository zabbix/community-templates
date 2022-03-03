# App Speedtest LAN

## Overview

Monitoring the LAN speedtest by iperf on different server


It need the script here https://git.cdp.li/polcape/zabbix/tree/master/zabbix-speedtest-lan



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery LAN Server|<p>-</p>|`Zabbix agent`|speedtest-lan.discovery<p>Update: 500s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Speedtest {#IPERFNAME} - Download|<p>-</p>|`Zabbix agent`|speedtest-lan.download.server[{#IPERFID}]<p>Update: 600s</p><p>LLD</p>|
|Speedtest {#IPERFNAME} - Ping|<p>-</p>|`Zabbix agent`|speedtest-lan.ping.server[{#IPERFID}]<p>Update: 600s</p><p>LLD</p>|
|Speedtest {#IPERFNAME} - Upload|<p>-</p>|`Zabbix agent`|speedtest-lan.upload.server[{#IPERFID}]<p>Update: 600s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.HOST} Download {#IPERFNAME} speed < {#IPERF_TR_DL}Mb/s|<p>-</p>|<p>**Expression**: avg(/App Speedtest LAN/speedtest-lan.download.server[{#IPERFID}],#3)<{#IPERF_TR_DL}</p><p>**Recovery expression**: </p>|warning|
|{HOST.HOST} Upload {#IPERFNAME} speed < {#IPERF_TR_UL}Mb/s|<p>-</p>|<p>**Expression**: avg(/App Speedtest LAN/speedtest-lan.upload.server[{#IPERFID}],#3)<{#IPERF_TR_UL}</p><p>**Recovery expression**: </p>|warning|
|{HOST.HOST} Download {#IPERFNAME} speed < {#IPERF_TR_DL}Mb/s (LLD)|<p>-</p>|<p>**Expression**: avg(/App Speedtest LAN/speedtest-lan.download.server[{#IPERFID}],#3)<{#IPERF_TR_DL}</p><p>**Recovery expression**: </p>|warning|
|{HOST.HOST} Upload {#IPERFNAME} speed < {#IPERF_TR_UL}Mb/s (LLD)|<p>-</p>|<p>**Expression**: avg(/App Speedtest LAN/speedtest-lan.upload.server[{#IPERFID}],#3)<{#IPERF_TR_UL}</p><p>**Recovery expression**: </p>|warning|
