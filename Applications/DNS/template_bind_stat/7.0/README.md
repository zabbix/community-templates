# DNS bind statistics

## Overview

here we got a lot of statistics from bind9 with some important triggers, everything works with LLD. No extra scripts are required

## Setup
### Debian
just add this to you `/etc/bind/named.conf` file

```
// for monitoring
statistics-channels {
    inet <DNSSERVER-IP> port 8653 allow { <ZABBIXSERVER-IP>; };
};

```

## Author

Stefan Krüger

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
| {$BIND9_STAT_PORT}|http port for bind statistics|`8653`|Text macro|
| {$BIND9.V4QUERIES.STATUS.WARN} | if the queries goes down by 80% |`0.2`|Text macro|
| {$BIND9.SERVFAIL.STATUS.CRIT} | problems to answer queries|`5`|Text macro|
| {$BIND9.RECUSED.STATUS.WARN} | to high unusual recursion rate|`50`|Text macro|
| {$BIND9.RECUSED.STATUS.OK} | to high unusual recursion rate|`1`|Text macro|
| {$BIND9.QRYDROPPED.STATUS.WARN} | dropped queries|`0`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|rcode discovery|<p>-</p>|`depnedent item`|{$bind9.rcode.discover}|
|qtypes discovery|<p>-</p>|`depnedent item`|{$bind9.rcode.discover}|
|sockstats discovery|<p>-</p>|`depnedent item`|{$bind9.rcode.discover}|
|nsstats discovery|<p>-</p>|`depnedent item`|{$bind9.rcode.discover}|


## Items collected
There are more than 100items colleted via LLD
The important items are:

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|bind9 stats|collect data from bind9|`http agent`|bind9.stats|
|bind9: IPv4 queries per second|<p>-</p>|`depnedent item`|bind9.nsstats.v4queries|
|bind9: Queries dropped per second|<p>-</p>|`depnedent item`|bind9.nsstats.QryDropped|
|bind9: recused Queries per second|<p>-</p>|`depnedent item`|bind9.nsstats.recursed|
|bind9: SERVFAIL Queries per second|<p>-</p>|`depnedent item`|bind9.nsstats.SERVFAIL|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BIND: High rate of dropped queries on {HOST.NAME}|<p>-</p>|avg(/bind9 by HTTP-JSON/bind9.nsstats.QryDropped,5m)>{$BIND9.QRYDROPPED.STATUS.WARN} | high|
|BIND: High rate of SERVFAILs on {HOST.NAME}|<p>-</p>| avg(/bind9 by HTTP-JSON/bind9.nsstats.SERVFAIL,5m)>{$BIND9.SERVFAIL.STATUS.CRIT} | high|
|BIND: Unusual recursion rate on {HOST.NAME}|<p>-</p>|avg(/bind9 by HTTP-JSON/bind9.nsstats.recused,10m)>{$BIND9.RECUSED.STATUS.WARN} or avg(/bind9 by HTTP-JSON/bind9.nsstats.recused,10m)>{$BIND9.RECUSED.STATUS.OK}| warning|
|Failed to get bind9 data for 10m |<p>-</p>|nodata(/bind9 by HTTP-JSON/bind9.stats,10m)=1 | Warning|
|BIND: IPv4 query rate dropped significantly over 5m on {HOST.NAME} |<p>-</p>|(avg(/bind9 by HTTP-JSON/bind9.nsstats.v4queries,5m)/avg(/bind9 by HTTP-JSON/bind9.nsstats.v4queries,30m))<{$BIND9.V4QUERIES.STATUS.WARN} and avg(/bind9 by HTTP-JSON/bind9.nsstats.v4queries,5m)>0| high|

