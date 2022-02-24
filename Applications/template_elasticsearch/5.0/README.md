# App Elasticsearch Cluster new

## Overview

**ElasticSearch Zabbix monitoring**
===================================


#### Script-free Zabbix ES monitoring


 


This template monitores all ES cluster using Zabbix 4.x HTTP Agent resource.


This allows check ES being OnPremise or PAAS (AWS Elasticsearch, for example) without additional scripts.


 


### Requisites:


* ES available for Zabbix server or a Zabbix proxy. That's all.
* ES Endpoints can be adjusted on template macro.


 


### **Discovers:**


* ES Indexes discovery  
ES Node discovery


### **Monitored Items:**


* Shards
* Cluster Rate
* Cluster Latency
* Cluster Health
* JVM Stats
* Disk Status
* Snapshot status
* ES Port
* Memory
* Documents (searchable, deleted)


 


 


 


 


 


 



## Author

Rickk Barbosa (https://github.com/rickkbarbosa)

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ELASTICSEARCH_HEAPMEM_P2}|<p>-</p>|`75`|Text macro|
|{$ELASTICSEARCH_HOST}|<p>-</p>|`localhost`|Text macro|
|{$ELASTICSEARCH_PORT}|<p>-</p>|`9200`|Text macro|
|{$ELASTICSEARCH_PROTOCOL}|<p>-</p>|`http`|Text macro|
|{$ELASTICSEARCH_SNAPSHOT}|<p>-</p>|`cs-automated-enc`|Text macro|
|{$ELASTICSEARCH_SNAPSHOTP_DAYS}|<p>-</p>|`3`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ES Indexes discovery|<p>https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-indices.html</p>|`HTTP agent`|elasticsearch.discovery.indexes<p>Update: 1m</p>|
|ES Node discovery|<p>https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-nodes.html</p>|`HTTP agent`|elasticsearch.discovery.nodes<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Elasticsearch - Search rate|<p>Search operations per minute.</p>|`Dependent item`|elasticsearch.performance[search]<p>Update: 0</p>|
|Number of nodes|<p>-</p>|`Dependent item`|elasticsearch.cluster[number_of_nodes]<p>Update: 0</p>|
|Searchable documents|<p>Total Number of Records</p>|`Dependent item`|elasticsearch.records<p>Update: 0</p>|
|Elasticsearch - Indexing latency (ms)|<p>Average time that it takes a shard to complete and indexing operation</p>|`Dependent item`|elasticsearch.performance[latency,index]<p>Update: 0</p>|
|Elasticsearch Indices Global Status|<p>Indices level stats provide statistics on different operations happening on an index. The API provides statistics on the index level scope (though most stats can also be retrieved using node level scope). Base for key performance indicator https://www.elastic.co/guide/en/elasticsearch/reference/6.4/indices-stats.html</p>|`HTTP agent`|elasticsearch.indices[all,stats]<p>Update: 1m</p>|
|Elasticsearch JVM Heap (Used, Percent)|<p>https://www.elastic.co/guide/en/elasticsearch/reference/current/heap-size.html</p>|`Calculated`|elasticsearch.jvm[heap,usedp]<p>Update: 5m</p>|
|Elasticsearch Cluster UUID|<p>-</p>|`Dependent item`|elasticsearch.cluster[uuid]<p>Update: 0</p>|
|Elasticsearch Disk Volume|<p>-</p>|`HTTP agent`|elasticsearch.disk[all]<p>Update: 10m</p>|
|Elasticsearch Well-done Snapshots in last {$ELASTICSEARCH_SNAPSHOTP_DAYS} days|<p>Total snapshots in the last {$ELASTICSEARCH_SNAPSHOTP_DAYS} days that has been succeed</p>|`Dependent item`|elasticsearch.snapshots[ok]<p>Update: 0</p>|
|Elasticsearch JVM Heap (Used, bytes)|<p>https://www.elastic.co/guide/en/elasticsearch/reference/current/heap-size.html</p>|`Dependent item`|elasticsearch.jvm[heap,used]<p>Update: 0</p>|
|Elasticsearch port listen|<p>-</p>|`Simple check`|net.tcp.service[tcp,{$ELASTICSEARCH_HOST},{$ELASTICSEARCH_PORT}]<p>Update: 1m</p>|
|Elasticsearch - Number of active primary shards|<p>-</p>|`Dependent item`|elasticsearch.cluster[active_primary_shards]<p>Update: 0</p>|
|Elasticsearch Cluster Health|<p>-</p>|`HTTP agent`|elasticsearch.cluster[all,health]<p>Update: 1m</p>|
|Elasticsearch Memory Free (%)|<p>Free memory in cluster (in percent)</p>|`Calculated`|elasticsearch.memory[free,cluster,percentage]<p>Update: 5m</p>|
|Elasticsearch - Search latency (ms)|<p>Average time that takes a shard to complete a search operation</p>|`Dependent item`|elasticsearch.performance[latency,search]<p>Update: 0</p>|
|ES Snapshot Status|<p>A snapshot is a backup taken from a running Elasticsearch cluster. This presents how many snapshots exists in the last 3 days and how many has been succeed. https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-snapshots.html</p>|`HTTP agent`|elasticsearch.snapshots[stats]<p>Update: 1h</p>|
|Elasticsearch - Cluster Status|<p>-</p>|`Dependent item`|elasticsearch.cluster[status]<p>Update: 0</p>|
|Elasticsearch Disk Free (%)|<p>Free disk volume (in percent)</p>|`Calculated`|elasticsearch.disk[free,percent]<p>Update: 5m</p>|
|Elasticsearch Disk Volume Total|<p>-</p>|`Dependent item`|elasticsearch.disk[total]<p>Update: 0</p>|
|Elasticsearch Disk Volume Free|<p>-</p>|`Dependent item`|elasticsearch.disk[free]<p>Update: 0</p>|
|Elasticsearch CPU Usage|<p>CPU Usage in percent on Cluster. It checks all node.</p>|`Dependent item`|elasticsearch.cpu<p>Update: 0</p>|
|Elasticsearch Memory (Cluster)|<p>Total memory (sum of all nodes)</p>|`Dependent item`|elasticsearch.memory[total,cluster]<p>Update: 0</p>|
|Elasticsearch - Cluster Name|<p>-</p>|`Dependent item`|elasticsearch.cluster[name]<p>Update: 0</p>|
|Elasticsearch - Number of active shards|<p>-</p>|`Dependent item`|elasticsearch.cluster[active_shards]<p>Update: 0</p>|
|Elasticsearch - Number of initializing shards|<p>-</p>|`Dependent item`|elasticsearch.cluster[initializing_shards]<p>Update: 0</p>|
|Elasticsearch Cluster Global Status|<p>-</p>|`HTTP agent`|elasticsearch.cluster[all,stats]<p>Update: 1m</p>|
|Elasticsearch Memory (Average per Node)|<p>Total memory (sum of all nodes)</p>|`Calculated`|elasticsearch.cluster.memory[total,pernode]<p>Update: 5m</p>|
|Elasticsearch - Number of data nodes|<p>-</p>|`Dependent item`|elasticsearch.cluster[cluster,number_of_data_nodes]<p>Update: 0</p>|
|Elasticsearch - Number of relocating shards|<p>-</p>|`Dependent item`|elasticsearch.cluster[relocating_shards]<p>Update: 0</p>|
|Elasticsearch JVM Heap (Max)|<p>https://www.elastic.co/guide/en/elasticsearch/reference/current/heap-size.html</p>|`Dependent item`|elasticsearch.jvm[heap,max]<p>Update: 0</p>|
|Deleted documents|<p>Total Number of Records marked for deletion</p>|`Dependent item`|elasticsearch.deleted<p>Update: 0</p>|
|Elasticsearch - Indexing rate|<p>Number of index operations per minute.</p>|`Dependent item`|elasticsearch.performance[index]<p>Update: 0</p>|
|Elasticsearch JVM Version|<p>-</p>|`Dependent item`|elasticsearch.jvm[version]<p>Update: 0</p>|
|Master instance connection status|<p>Master instance connection status. Indicates whether data nodes can reach the master node. Failures are usually the result of a network connectivity problem.</p>|`Dependent item`|elasticsearch.cluster[discovered_master]<p>Update: 0</p>|
|Elasticsearch Snapshots in last {$ELASTICSEARCH_SNAPSHOTP_DAYS} days|<p>Total snapshots in the last 3 days</p>|`Dependent item`|elasticsearch.snapshots[total]<p>Update: 0</p>|
|Elasticsearch - Number of unassigned shards|<p>-</p>|`Dependent item`|elasticsearch.cluster[unassigned_shards]<p>Update: 0</p>|
|Elasticsearch - Cluster Size|<p>Total cluster size in bytes</p>|`Dependent item`|elasticsearch.cluster[size]<p>Update: 0</p>|
|Elasticsearch version|<p>-</p>|`Dependent item`|elasticsearch.version<p>Update: 0</p>|
|Elasticsearch Memory Free|<p>Free memory on cluster (sum of all nodes)</p>|`Dependent item`|elasticsearch.memory[free,cluster]<p>Update: 0</p>|
|Elasticsearch index full info [ {#ELASTICSEARCH_INDEX} ]|<p>-</p>|`HTTP agent`|elasticsearch.index[all,{#ELASTICSEARCH_INDEX}]<p>Update: 1m</p><p>LLD</p>|
|Elasticsearch index documents [ {#ELASTICSEARCH_INDEX} ]|<p>-</p>|`Dependent item`|elasticsearch.index[documents,{#ELASTICSEARCH_INDEX}]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch index documents deleted [ {#ELASTICSEARCH_INDEX} ]|<p>-</p>|`Dependent item`|elasticsearch.index[documentsdeleted,{#ELASTICSEARCH_INDEX}]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch index health [ {#ELASTICSEARCH_INDEX} ]|<p>-</p>|`Dependent item`|elasticsearch.index[health,{#ELASTICSEARCH_INDEX}]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch index latency [ {#ELASTICSEARCH_INDEX} ]  (ms)|<p>Average time that takes a shard to complete a search operation. Specific for a index.</p>|`Dependent item`|elasticsearch.index[latency,{#ELASTICSEARCH_INDEX}]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch queries [ {#ELASTICSEARCH_INDEX} ]|<p>Number of queries on this index</p>|`Dependent item`|elasticsearch.index[queries,{#ELASTICSEARCH_INDEX}]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch index query latency [ {#ELASTICSEARCH_INDEX} ]|<p>Search time in this index</p>|`Dependent item`|elasticsearch.index[querylatency,{#ELASTICSEARCH_INDEX}]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch index size [ {#ELASTICSEARCH_INDEX} ]|<p>-</p>|`Dependent item`|elasticsearch.index[size,{#ELASTICSEARCH_INDEX}]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch full allocation info [ {#ELASTICSEARCH_NODE} ]|<p>Provides a snapshot of the number of shards allocated to each data node and their disk space. https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-allocation.html</p>|`HTTP agent`|elasticsearch.node.disk[all,{#ELASTICSEARCH_NODE}]<p>Update: 1m</p><p>LLD</p>|
|Elasticsearch node [ {#ELASTICSEARCH_NODE} ] is master?|<p>Get information about master node. https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-master.html</p>|`HTTP agent`|elasticsearch.node.master[{#ELASTICSEARCH_NODE}]<p>Update: 1m</p><p>LLD</p>|
|Elasticsearch full stats for node [ {#ELASTICSEARCH_NODE} ]|<p>Full stats for specific node as seen on https://www.elastic.co/guide/en/elasticsearch/reference/6.2/cluster-nodes-stats.html</p>|`HTTP agent`|elasticsearch.node.query_cache[all,{#ELASTICSEARCH_NODE}]<p>Update: 1m</p><p>LLD</p>|
|Elasticsearch CPU Load (1min)  [ {#ELASTICSEARCH_NODE} ]|<p>-</p>|`Dependent item`|elasticsearch.node[cpu1m,{#ELASTICSEARCH_NODE}]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch Storage Total [ {#ELASTICSEARCH_NODE} ]|<p>https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-allocation.html</p>|`Dependent item`|elasticsearch.node[disk,{#ELASTICSEARCH_NODE},total]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch Storage Used (in %) [ {#ELASTICSEARCH_NODE} ]|<p>https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-allocation.html</p>|`Dependent item`|elasticsearch.node[disk,{#ELASTICSEARCH_NODE},usedp]<p>Update: 0</p><p>LLD</p>|
|Elasticsearch Storage Used [ {#ELASTICSEARCH_NODE} ]|<p>https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-allocation.html</p>|`Dependent item`|elasticsearch.node[disk,{#ELASTICSEARCH_NODE},used]<p>Update: 0</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

