# App Varnish by Zabbix agent

## Description

Simple template for the Varnish cache using results from the varnishstat command. Ensure that "EnableRemoteCommands=1" is set in the host's agent config file.

## Overview

Simple template for the Varnish cache using results from the varnishstat command. Ensure that "EnableRemoteCommands=1" is set in the host's agent config file.



## Author

Dave Humphrey (dave@uesp.net)

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$VARNISH.PROCESS_NAME}|<p>Process name of the Varnish server.</p>|`varnishd`|Text macro|
|{$VARNISH.RESPONSE_TIME.MAX.WARN}|<p>Max response time before a warning is given.</p>|`5`|Text macro|
|{$VARNISH.STATUS.HOST}|<p>IP or hostname of the Varnish server.</p>|`127.0.0.1`|Text macro|
|{$VARNISH.STATUS.PORT}|<p>Port of the Varnish server.</p>|`80`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Varnish: Get status|<p>-</p>|`Zabbix agent`|system.run[varnishstat -j]<p>Update: 1m</p>|
|Varnish: Num purges|<p>Number of purge operations executed</p>|`Dependent item`|varnish.objects.purges<p>Update: 0</p>|
|Varnish: Backend failed|<p>Backend connections failed</p>|`Dependent item`|varnish.backend.failed<p>Update: 0</p>|
|Varnish: Threads limited|<p>Threads hit max</p>|`Dependent item`|varnish.threads.limited<p>Update: 0</p>|
|Varnish: Requests per second|<p>-</p>|`Dependent item`|varnish.requests.rate<p>Update: 0</p>|
|Varnish: Bytes per second|<p>Calculated as change rate for 'Total bytes' stat.</p>|`Dependent item`|varnish.bytes.rate<p>Update: 0</p>|
|Varnish: Client requests|<p>Good client requests received</p>|`Dependent item`|varnish.client.requests<p>Update: 0</p>|
|Varnish: Expired objects|<p>Number of expired objects</p>|`Dependent item`|varnish.objects.expired<p>Update: 0</p>|
|Varnish: Cache hit-pass|<p>Cache hits for pass</p>|`Dependent item`|varnish.cache.hitpasses<p>Update: 0</p>|
|Varnish: Backend unhealthy|<p>Backend connections not attempted</p>|`Dependent item`|varnish.backend.unhealthy<p>Update: 0</p>|
|Varnish: Uptime|<p>Service uptime in seconds</p>|`Dependent item`|varnish.uptime<p>Update: 0</p>|
|Varnish: Session dropped|<p>Sessions dropped</p>|`Dependent item`|varnish.session.dropped<p>Update: 0</p>|
|Varnish: Threads failed|<p>Thread creation failure</p>|`Dependent item`|varnish.threads.failed<p>Update: 0</p>|
|Varnish: Total request bytes|<p>Total bytes received</p>|`Dependent item`|varnish.request.bytes<p>Update: 0</p>|
|Varnish: Total response bytes|<p>Total bytes sent</p>|`Dependent item`|varnish.response.bytes<p>Update: 0</p>|
|Varnish: CPU utilization|<p>Process CPU utilization percentage.</p>|`Zabbix agent`|proc.cpu.util["{$VARNISH.PROCESS_NAME}"]<p>Update: 1m</p>|
|Varnish: Cache hits|<p>Cache hits</p>|`Dependent item`|varnish.cache.hits<p>Update: 0</p>|
|Varnish: Service response time|<p>-</p>|`Zabbix agent`|net.tcp.service.perf[http,"{$VARNISH.STATUS.HOST}","{$VARNISH.STATUS.PORT}"]<p>Update: 1m</p>|
|Varnish: Threads created|<p>Threads created</p>|`Dependent item`|varnish.threads.created<p>Update: 0</p>|
|Varnish: Number of processes running|<p>-</p>|`Zabbix agent`|proc.num["{$VARNISH.PROCESS_NAME}"]<p>Update: 1m</p>|
|Varnish: Service ping|<p>-</p>|`Zabbix agent`|net.tcp.service[http,"{$VARNISH.STATUS.HOST}","{$VARNISH.STATUS.PORT}"]<p>Update: 1m</p>|
|Varnish: Cache hit rate|<p>Average hit rate since the cache was started</p>|`Dependent item`|varnish.hitrate<p>Update: 0</p>|
|Varnish: Cache hit rate 5m|<p>Average cache hit rate in the past 5m</p>|`Calculated`|varnish.hitrate5m<p>Update: 1m</p>|
|Varnish: Cache misses|<p>Cache misses</p>|`Dependent item`|varnish.cache.misses<p>Update: 0</p>|
|Varnish: Backend requests|<p>Backend requests made</p>|`Dependent item`|varnish.backend.requests<p>Update: 0</p>|
|Varnish: Backend connections|<p>Backend connections succeeded</p>|`Dependent item`|varnish.backend.connections<p>Update: 0</p>|
|Varnish: Memory usage (vsize)|<p>Virtual memory size used by process in bytes.</p>|`Zabbix agent`|proc.mem["{$VARNISH.PROCESS_NAME}",,,,vsize]<p>Update: 1m</p>|
|Varnish: Memory usage (rss)|<p>Resident set size memory used by process in bytes.</p>|`Zabbix agent`|proc.mem["{$VARNISH.PROCESS_NAME}",,,,rss]<p>Update: 1m</p>|
|Varnish: LRU nuked objects|<p>Number of LRU nuked objects</p>|`Dependent item`|varnish.objects.lrunuked<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

