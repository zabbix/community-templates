# App Solr

## Description

Template for monitoring Solr using json statistics. http://{USERNAME}@{PASSWORD}:{HOST.CONN}/solr/admin/metrics

## Overview

**Zabbix Template Solr statistics**
-----------------------------------


 Template for monitoring Solr using JSON statistics.


 


**Versions**
------------


 I tested this using zabbix 5.0.9 and Solr 8.6.3, but maybe it works with different versions.


 


**Requirements**
----------------


 Zabbix version > 5.0 because template is using HTTP agent, Dependent items and JSON Path. You need to setup user and password for accessing Solr statistics JSON:


* [http://{USERNAME}:{PASSWORD}@{HOST.CONN}/solr/admin/metrics](http://{USERNAME}@{PASSWORD}{HOST.CONN})


 


**Installation**
----------------


* Download Zabbix template
* Import the template on Zabbix
* Create host on Zabbix and apply the template (I have configured to connect to DNS name, because it will be used in {HOST.CONN})
* On host configuration, modify macros {$SOLR\_USERNAME} and {$SOLR\_PASSWORD} with the information you created.
* You can change macros {$PROTOCOL}, {$URI} from host and/or template to your environment


## Author

Felipe de Moura Vieira

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PROTOCOL}|<p>-</p>|`http`|Text macro|
|{$SOLR_PASSWORD}|<p>-</p>|`NEWPASS`|Text macro|
|{$SOLR_USERNAME}|<p>-</p>|`NEWUSER`|Text macro|
|{$URI}|<p>-</p>|`/solr/admin/metrics`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Solr: Core Discovery|<p>Discovers core List</p>|`HTTP agent`|solr.core.discovery<p>Update: 60m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Solr: JVM Threads Terminated Count|<p>-</p>|`Dependent item`|solr.jvm.threads.terminated.count<p>Update: 0</p>|
|Solr: JVM memory total used|<p>-</p>|`Dependent item`|solr.jvm.memory.total.used<p>Update: 0</p>|
|Solr: JVM OS open file descriptors|<p>-</p>|`Dependent item`|solr.jvm.os.openFileDescriptorCount<p>Update: 0</p>|
|Solr: JVM Threads Waiting Count|<p>-</p>|`Dependent item`|solr.jvm.threads.waiting.count<p>Update: 0</p>|
|Solr: JVM Threads Blocked Count|<p>-</p>|`Dependent item`|solr.jvm.threads.blocked.count<p>Update: 0</p>|
|Solr: JVM metrics get status|<p>-</p>|`HTTP agent`|solr.jvm.getStatus<p>Update: 5m</p>|
|Solr: JVM Threads Runnable Count|<p>-</p>|`Dependent item`|solr.jvm.threads.runnable.count<p>Update: 0</p>|
|Solr: JVM memory total commited|<p>-</p>|`Dependent item`|solr.jvm.memory.total.committed<p>Update: 0</p>|
|Solr: Java process number|<p>-</p>|`Zabbix agent`|proc.num[java,,,start.jar]<p>Update: 180</p>|
|Solr: JVM memory total max|<p>-</p>|`Dependent item`|solr.jvm.memory.total.max<p>Update: 0</p>|
|Solr: JVM OS Process CPU Load|<p>-</p>|`Dependent item`|solr.jvm.os.processCpuLoad<p>Update: 0</p>|
|Solr: JVM Threads Deadlock Count|<p>-</p>|`Dependent item`|solr.jvm.threads.deadlock.count<p>Update: 0</p>|
|Solr: JVM memory heap used|<p>-</p>|`Dependent item`|solr.jvm.memory.heap.used<p>Update: 0</p>|
|Solr: JVM memory non-heap commited|<p>-</p>|`Dependent item`|solr.jvm.memory.non-heap.committed<p>Update: 0</p>|
|Solr: JVM memory non-heap max|<p>-</p>|`Dependent item`|solr.jvm.memory.non-heap.max<p>Update: 0</p>|
|Solr: JVM memory non-heap usage|<p>-</p>|`Dependent item`|solr.jvm.memory.non-heap.usage<p>Update: 0</p>|
|Solr: JVM memory heap usage|<p>-</p>|`Dependent item`|solr.jvm.memory.heap.usage<p>Update: 0</p>|
|Solr: JVM Threads Daemon Count|<p>-</p>|`Dependent item`|solr.jvm.threads.daemon.count<p>Update: 0</p>|
|Solr: JVM Threads Count|<p>-</p>|`Dependent item`|solr.jvm.threads.count<p>Update: 0</p>|
|Solr: JVM memory heap max|<p>-</p>|`Dependent item`|solr.jvm.memory.heap.max<p>Update: 0</p>|
|Solr: JVM memory non-heap used|<p>-</p>|`Dependent item`|solr.jvm.memory.non-heap.used<p>Update: 0</p>|
|Solr: JVM memory heap commited|<p>-</p>|`Dependent item`|solr.jvm.memory.heap.committed<p>Update: 0</p>|
|Solr: JVM OS max file descriptors|<p>-</p>|`Dependent item`|solr.jvm.os.maxFileDescriptorCount<p>Update: 0</p>|
|Solr: Core "{#CORENAME}" metrics get status|<p>-</p>|`HTTP agent`|solr.core.getStatus[{#CORENAME}]<p>Update: 5m</p><p>LLD</p>|
|Solr: Core {#CORENAME} document cache - evictions|<p>-</p>|`Dependent item`|solr.core.documentCache.evictions[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} searcher - numDocs|<p>Document count</p>|`Dependent item`|solr.core.searcher.numDocs[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} select - requestTimes.median|<p>-</p>|`Dependent item`|solr.core.select.requestTimes.median_ms[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} select - requestTimes.meanRate|<p>-</p>|`Dependent item`|solr.core.select.requestTimes.meanRate[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} select - requestTimes/sec|<p>-</p>|`Dependent item`|solr.core.select.requestTimes.count[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} select - requestTimes.5minRate|<p>-</p>|`Dependent item`|solr.core.select.requestTimes.5minRate[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} select - requests/sec|<p>-</p>|`Dependent item`|solr.core.select.requests[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} select - errors/sec|<p>-</p>|`Dependent item`|solr.core.select.errors.count[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} index - size|<p>-</p>|`Dependent item`|solr.core.index.size[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} query result cache - hits/sec|<p>-</p>|`Dependent item`|solr.core.queryResultCache.hits[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} document cache - hitratio|<p>-</p>|`Dependent item`|solr.core.documentCache.hitratio[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} filter cache - inserts/sec|<p>-</p>|`Dependent item`|solr.core.filterCache.inserts[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} filter cache - hits/sec|<p>-</p>|`Dependent item`|solr.core.filterCache.hits[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} filter cache - hitratio|<p>-</p>|`Dependent item`|solr.core.filterCache.hitratio[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} filter cache - evictions|<p>-</p>|`Dependent item`|solr.core.filterCache.evictions[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} document cache - inserts/sec|<p>-</p>|`Dependent item`|solr.core.documentCache.inserts[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} document cache - hits/sec|<p>-</p>|`Dependent item`|solr.core.documentCache.hits[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|
|Solr: Core {#CORENAME} select - timeouts/sec|<p>-</p>|`Dependent item`|solr.core.select.timeouts.count[{#CORENAME}]<p>Update: 0</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

