# App Lighttpd by Zabbix Agent

## Overview

A very simple Zabbix Agent template for monitoring Lighttpd using the ModStatus module.



## Author

Dave Humphrey (dave@uesp.net)

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$LIGHTTPD.PROCESS_NAME}|<p>Lighttpd server process name</p>|`lighttpd`|Text macro|
|{$LIGHTTPD.RESPONSE_TIME.MAX.WARN}|<p>Maximum Lighttpd response time in seconds for trigger expression</p>|`10`|Text macro|
|{$LIGHTTPD.STATUS.HOST}|<p>Hostname or IP address of the Lighttpd status page</p>|`127.0.0.1`|Text macro|
|{$LIGHTTPD.STATUS.PATH}|<p>The URL path to the Lighttpd stats page</p>|`server-status?json`|Text macro|
|{$LIGHTTPD.STATUS.PORT}|<p>The port of the Lighttpd status page</p>|`80`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Lighttpd: Total Requests|<p>Total requests since server started</p>|`Dependent item`|lighttpd.requests.total<p>Update: 0</p>|
|Lighttpd: Requets per second|<p>Calculated as change rate for 'RequestsTotal' stat.</p>|`Dependent item`|lighttpd.requests.rate<p>Update: 0</p>|
|Lighttpd: Uptime|<p>Service uptime in seconds</p>|`Dependent item`|lighttpd.uptime<p>Update: 0</p>|
|Lighttpd: Service response time|<p>-</p>|`Zabbix agent`|net.tcp.service.perf[http,"{$LIGHTTPD.STATUS.HOST}","{$LIGHTTPD.STATUS.PORT}"]<p>Update: 1m</p>|
|Lighttpd: Bytes per second|<p>Calculated as change rate for 'TrafficTotal' stat.</p>|`Dependent item`|lighttpd.bytes.rate<p>Update: 0</p>|
|Lighttpd: Number of processes running|<p>-</p>|`Zabbix agent`|proc.num["{$LIGHTTPD.PROCESS_NAME}"]<p>Update: 1m</p>|
|Lighttpd: Traffic Average 5 sec|<p>Average traffic rate in the last 5 sec as recorded by Lighttpd.</p>|`Dependent item`|lighttpd.traffic.average5s<p>Update: 0</p>|
|Lighttpd: CPU utilization|<p>Process CPU utilization percentage.</p>|`Zabbix agent`|proc.cpu.util["{$LIGHTTPD.PROCESS_NAME}"]<p>Update: 1m</p>|
|Lighttpd: Request Rate 5 sec|<p>Average request rate in the last 5 sec as recorded by Lighttpd.</p>|`Dependent item`|lighttpd.requests.average5s<p>Update: 0</p>|
|Lighttpd: Get status|<p>Getting data from a machine-readable version of the Lighttpd status page. https://redmine.lighttpd.net/projects/lighttpd/wiki/Docs_ModStatus</p>|`Zabbix agent`|web.page.get["{$LIGHTTPD.STATUS.HOST}","{$LIGHTTPD.STATUS.PATH}","{$LIGHTTPD.STATUS.PORT}"]<p>Update: 1m</p>|
|Lighttpd: Idle Servers|<p>Current number of Lighttpd threads that are idle and waiting for a request</p>|`Dependent item`|lighttpd.servers.idle<p>Update: 0</p>|
|Lighttpd: Memory usage (vsize)|<p>Virtual memory size used by process in bytes.</p>|`Zabbix agent`|proc.mem["{$LIGHTTPD.PROCESS_NAME}",,,,vsize]<p>Update: 1m</p>|
|Lighttpd: Memory usage (rss)|<p>Resident set size memory used by process in bytes.</p>|`Zabbix agent`|proc.mem["{$LIGHTTPD.PROCESS_NAME}",,,,rss]<p>Update: 1m</p>|
|Lighttpd: Total bytes|<p>Total bytes served since restart</p>|`Dependent item`|lighttpd.bytes<p>Update: 0</p>|
|Lighttpd: Service ping|<p>-</p>|`Zabbix agent`|net.tcp.service[http,"{$LIGHTTPD.STATUS.HOST}","{$LIGHTTPD.STATUS.PORT}"]<p>Update: 1m</p>|
|Lighttpd: Busy servers|<p>Number of Lighttpd threads currently serving requests.</p>|`Dependent item`|lighttpd.servers.busy<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

