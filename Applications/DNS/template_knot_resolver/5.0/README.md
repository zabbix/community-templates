# Knot Resolver Statistics

## Description

Collects statistic values from Knot Resolver

## Overview

Knot Resolver statistics


Requirements
------------


* None


Installation
------------


* Import the template
* If needed, modify *{$KRESD\_STATS\_URL}* macro on the Host (under Inherited and host macros) to the URL of your Knot Resolver statistics service, usually *https://localhost:8453/stats* or *http://localhost:8053/stats*


Tested on Zabbix 4.0.11


Based on template from https://github.com/heximcz/kresd-stats-zabbix



## Author

Václav Nováček

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$KRESD_STATS_URL}|<p>-</p>|`https://localhost:8453/stats`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|stats|<p>-</p>|`HTTP agent`|kresd.stats[stats]<p>Update: 1m</p>|
|answer.1ms|<p>-</p>|`Dependent item`|kresd.stats[answer.1ms]<p>Update: 0</p>|
|answer.tc|<p>-</p>|`Dependent item`|kresd.stats[answer.tc]<p>Update: 0</p>|
|answer.aa|<p>-</p>|`Dependent item`|kresd.stats[answer.aa]<p>Update: 0</p>|
|cache.count|<p>-</p>|`Dependent item`|kresd.stats[cache.count]<p>Update: 0</p>|
|answer.50ms|<p>-</p>|`Dependent item`|kresd.stats[answer.50ms]<p>Update: 0</p>|
|cache.match|<p>-</p>|`Dependent item`|kresd.stats[cache.match]<p>Update: 0</p>|
|answer.servfail|<p>-</p>|`Dependent item`|kresd.stats[answer.servfail]<p>Update: 0</p>|
|answer.1000ms|<p>-</p>|`Dependent item`|kresd.stats[answer.1000ms]<p>Update: 0</p>|
|worker.pagefaults|<p>-</p>|`Dependent item`|kresd.stats[worker.pagefaults]<p>Update: 0</p>|
|answer.ra|<p>-</p>|`Dependent item`|kresd.stats[answer.ra]<p>Update: 0</p>|
|query.edns|<p>-</p>|`Dependent item`|kresd.stats[query.edns]<p>Update: 0</p>|
|answer.nxdomain|<p>-</p>|`Dependent item`|kresd.stats[answer.nxdomain]<p>Update: 0</p>|
|worker.udp|<p>-</p>|`Dependent item`|kresd.stats[worker.udp]<p>Update: 0</p>|
|request.dot|<p>-</p>|`Dependent item`|kresd.stats[request.dot]<p>Update: 0</p>|
|worker.concurrent|<p>-</p>|`Dependent item`|kresd.stats[worker.concurrent]<p>Update: 0</p>|
|answer.cached|<p>-</p>|`Dependent item`|kresd.stats[answer.cached]<p>Update: 0</p>|
|request.doh|<p>-</p>|`Dependent item`|kresd.stats[request.doh]<p>Update: 0</p>|
|query.dnssec|<p>-</p>|`Dependent item`|kresd.stats[query.dnssec]<p>Update: 0</p>|
|answer.cd|<p>-</p>|`Dependent item`|kresd.stats[answer.cd]<p>Update: 0</p>|
|answer.slow|<p>-</p>|`Dependent item`|kresd.stats[answer.slow]<p>Update: 0</p>|
|cache.write|<p>-</p>|`Dependent item`|kresd.stats[cache.write]<p>Update: 0</p>|
|cache.match_miss|<p>-</p>|`Dependent item`|kresd.stats[cache.match_miss]<p>Update: 0</p>|
|cache.open|<p>-</p>|`Dependent item`|kresd.stats[cache.open]<p>Update: 0</p>|
|cache.read_miss|<p>-</p>|`Dependent item`|kresd.stats[cache.read_miss]<p>Update: 0</p>|
|worker.timeout|<p>-</p>|`Dependent item`|kresd.stats[worker.timeout]<p>Update: 0</p>|
|answer.100ms|<p>-</p>|`Dependent item`|kresd.stats[answer.100ms]<p>Update: 0</p>|
|predict.queue|<p>-</p>|`Dependent item`|kresd.stats[predict.queue]<p>Update: 0</p>|
|answer.edns0|<p>-</p>|`Dependent item`|kresd.stats[answer.edns0]<p>Update: 0</p>|
|worker.ipv6|<p>-</p>|`Dependent item`|kresd.stats[worker.ipv6]<p>Update: 0</p>|
|request.tcp|<p>-</p>|`Dependent item`|kresd.stats[request.tcp]<p>Update: 0</p>|
|answer.250ms|<p>-</p>|`Dependent item`|kresd.stats[answer.250ms]<p>Update: 0</p>|
|answer.10ms|<p>-</p>|`Dependent item`|kresd.stats[answer.10ms]<p>Update: 0</p>|
|answer.ad|<p>-</p>|`Dependent item`|kresd.stats[answer.ad]<p>Update: 0</p>|
|answer.1500ms|<p>-</p>|`Dependent item`|kresd.stats[answer.1500ms]<p>Update: 0</p>|
|worker.queries|<p>-</p>|`Dependent item`|kresd.stats[worker.queries]<p>Update: 0</p>|
|worker.systime|<p>-</p>|`Dependent item`|kresd.stats[worker.systime]<p>Update: 0</p>|
|answer.total|<p>-</p>|`Dependent item`|kresd.stats[answer.total]<p>Update: 0</p>|
|predict.learned|<p>-</p>|`Dependent item`|kresd.stats[predict.learned]<p>Update: 0</p>|
|worker.swaps|<p>-</p>|`Dependent item`|kresd.stats[worker.swaps]<p>Update: 0</p>|
|worker.dropped|<p>-</p>|`Dependent item`|kresd.stats[worker.dropped]<p>Update: 0</p>|
|request.total|<p>-</p>|`Dependent item`|kresd.stats[request.total]<p>Update: 0</p>|
|cache.read_leq_miss|<p>-</p>|`Dependent item`|kresd.stats[cache.read_leq_miss]<p>Update: 0</p>|
|cache.clear|<p>-</p>|`Dependent item`|kresd.stats[cache.clear]<p>Update: 0</p>|
|worker.usertime|<p>-</p>|`Dependent item`|kresd.stats[worker.usertime]<p>Update: 0</p>|
|request.udp|<p>-</p>|`Dependent item`|kresd.stats[request.udp]<p>Update: 0</p>|
|worker.ipv4|<p>-</p>|`Dependent item`|kresd.stats[worker.ipv4]<p>Update: 0</p>|
|cache.read|<p>-</p>|`Dependent item`|kresd.stats[cache.read]<p>Update: 0</p>|
|worker.rss|<p>-</p>|`Dependent item`|kresd.stats[worker.rss]<p>Update: 0</p>|
|worker.csw|<p>-</p>|`Dependent item`|kresd.stats[worker.csw]<p>Update: 0</p>|
|request.internal|<p>-</p>|`Dependent item`|kresd.stats[request.internal]<p>Update: 0</p>|
|answer.500ms|<p>-</p>|`Dependent item`|kresd.stats[answer.500ms]<p>Update: 0</p>|
|worker.tcp|<p>-</p>|`Dependent item`|kresd.stats[worker.tcp]<p>Update: 0</p>|
|answer.do|<p>-</p>|`Dependent item`|kresd.stats[answer.do]<p>Update: 0</p>|
|cache.close|<p>-</p>|`Dependent item`|kresd.stats[cache.close]<p>Update: 0</p>|
|cache.read_leq|<p>-</p>|`Dependent item`|kresd.stats[cache.read_leq]<p>Update: 0</p>|
|cache.remove_miss|<p>-</p>|`Dependent item`|kresd.stats[cache.remove_miss]<p>Update: 0</p>|
|cache.commit|<p>-</p>|`Dependent item`|kresd.stats[cache.commit]<p>Update: 0</p>|
|predict.epoch|<p>-</p>|`Dependent item`|kresd.stats[predict.epoch]<p>Update: 0</p>|
|worker.tls|<p>-</p>|`Dependent item`|kresd.stats[worker.tls]<p>Update: 0</p>|
|answer.nodata|<p>-</p>|`Dependent item`|kresd.stats[answer.nodata]<p>Update: 0</p>|
|answer.noerror|<p>-</p>|`Dependent item`|kresd.stats[answer.noerror]<p>Update: 0</p>|
|cache.remove|<p>-</p>|`Dependent item`|kresd.stats[cache.remove]<p>Update: 0</p>|
|answer.rd|<p>-</p>|`Dependent item`|kresd.stats[answer.rd]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

