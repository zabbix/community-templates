# App Logstash

## Overview

This method uses python protobix library, and check metrics from logstash JSON file.


More informations and download script on: https://github.com/fredprod/logstash-zabbix



## Author

fredprod

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ZBX_TPL_VERSION}|<p>-</p>|`0.0.1`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Logstash discovery|<p>-</p>|`Zabbix trapper`|logstash.node.discovery<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Logstash JVM Mem pools young used|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.young.used_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem pools young max|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.young.max_in_bytes<p>Update: 0</p>|
|Logstash Pipeline Events duration|<p>-</p>|`Zabbix trapper`|logstash.pipeline.events.duration_in_millis<p>Update: 0</p>|
|Logstash discovery|<p>-</p>|`Zabbix agent (active)`|logstash.discovery<p>Update: 1h</p>|
|Logstash JVM Mem pools young peak max|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.young.peak_max_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem heap committed|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.heap_committed_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem pools old max|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.old.max_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem pools young committed|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.young.committed_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem pools survivor peak max|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.survivor.peak_max_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem pools survivor used|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.survivor.used_in_bytes<p>Update: 0</p>|
|Logstash Process Max File descriptors|<p>-</p>|`Zabbix trapper`|logstash.process.max_file_descriptors<p>Update: 0</p>|
|Logstash JVM gc collectors old collection count|<p>-</p>|`Zabbix trapper`|logstash.jvm.gc.collectors.old.collection_count<p>Update: 0</p>|
|Logstash Mem Total Virtual|<p>-</p>|`Zabbix trapper`|logstash.process.mem.total_virtual_in_bytes<p>Update: 0</p>|
|Logstash zabbix script version|<p>-</p>|`Zabbix trapper`|logstash.zbx_version<p>Update: 0</p>|
|Logstash JVM gc collectors young collection count|<p>-</p>|`Zabbix trapper`|logstash.jvm.gc.collectors.young.collection_count<p>Update: 0</p>|
|Logstash JVM Mem pools young peak used|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.young.peak_used_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem non heap committed|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.non_heap_committed_in_bytes<p>Update: 0</p>|
|Logstash JVM uptime|<p>-</p>|`Zabbix trapper`|logstash.jvm.uptime_in_millis<p>Update: 0</p>|
|Logstash JVM gc collectors young collection time|<p>-</p>|`Zabbix trapper`|logstash.jvm.gc.collectors.young.collection_time_in_millis<p>Update: 0</p>|
|Logstash Process CPU Total in ms|<p>-</p>|`Zabbix trapper`|logstash.process.cpu.total_in_millis<p>Update: 0</p>|
|Logstash check|<p>-</p>|`Zabbix agent (active)`|logstash.check<p>Update: 1m</p>|
|Logstash JVM Threads count|<p>-</p>|`Zabbix trapper`|logstash.jvm.threads.count<p>Update: 0</p>|
|Logstash Process CPU load 5|<p>-</p>|`Zabbix trapper`|logstash.process.cpu.load_average.5m<p>Update: 0</p>|
|Logstash JVM gc collectors old collection time|<p>-</p>|`Zabbix trapper`|logstash.jvm.gc.collectors.old.collection_time_in_millis<p>Update: 0</p>|
|Logstash JVM Mem non heap used|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.non_heap_used_in_bytes<p>Update: 0</p>|
|Logstash Process Open File descriptors|<p>-</p>|`Zabbix trapper`|logstash.process.open_file_descriptors<p>Update: 0</p>|
|Logstash Process CPU load 15|<p>-</p>|`Zabbix trapper`|logstash.process.cpu.load_average.15m<p>Update: 0</p>|
|Logstash JVM Threads peak count|<p>-</p>|`Zabbix trapper`|logstash.jvm.threads.peak_count<p>Update: 0</p>|
|Logstash JVM Mem pools old committed|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.old.committed_in_bytes<p>Update: 0</p>|
|Logstash Pipeline Events filtered|<p>-</p>|`Zabbix trapper`|logstash.pipeline.events.filtered<p>Update: 0</p>|
|Logstash JVM Mem pools survivor max|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.survivor.max_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem heap max|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.heap_max_in_bytes<p>Update: 0</p>|
|Logstash Process CPU|<p>-</p>|`Zabbix trapper`|logstash.process.cpu.percent<p>Update: 0</p>|
|Logstash Process CPU load 1|<p>-</p>|`Zabbix trapper`|logstash.process.cpu.load_average.1m<p>Update: 0</p>|
|Logstash Process Peak File descriptors|<p>-</p>|`Zabbix trapper`|logstash.process.peak_open_file_descriptors<p>Update: 0</p>|
|Logstash JVM Mem heap used|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.heap_used_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem pools old peak max|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.old.peak_max_in_bytes<p>Update: 0</p>|
|Logstash Pipeline Events out|<p>-</p>|`Zabbix trapper`|logstash.pipeline.events.out<p>Update: 0</p>|
|Logstash JVM Percent Mem heap used|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.heap_used_percent<p>Update: 0</p>|
|Logstash JVM Mem pools old peak used|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.old.peak_used_in_bytes<p>Update: 0</p>|
|Logstash Pipeline Events in|<p>-</p>|`Zabbix trapper`|logstash.pipeline.events.in<p>Update: 0</p>|
|Logstash JVM Mem pools survivor peak used|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.survivor.peak_used_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem pools survivor committed|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.survivor.committed_in_bytes<p>Update: 0</p>|
|Logstash JVM Mem pools old used|<p>-</p>|`Zabbix trapper`|logstash.jvm.mem.pools.old.used_in_bytes<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

