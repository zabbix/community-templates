# App Kafka

## Overview

This template will use JMX discovery to get metrics about resource usage, topics stats and much more from a Kafka node.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Under Replicated partitions|<p>-</p>|`JMX agent`|jmx.discovery[beans,"kafka.cluster:type=Partition,name=UnderReplicated,topic=*,partition=*"]<p>Update: 30s</p>|
|Lag in messages per follower Discovery|<p>-</p>|`JMX agent`|jmx.discovery[beans,"kafka.server:type=FetcherLagMetrics,name=ConsumerLag,*"]<p>Update: 30s</p>|
|Request rate Produce Version discovery|<p>-</p>|`JMX agent`|jmx.discovery[beans,"kafka.network:type=RequestMetrics,name=RequestsPerSec,request=Produce,version=*"]<p>Update: 30s</p>|
|Topic Discovery|<p>-</p>|`JMX agent`|jmx.discovery[beans,"kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec,topic=*"]<p>Update: 60s</p>|
|Request rate Fetch Follower Version discovery|<p>-</p>|`JMX agent`|jmx.discovery[beans,"kafka.network:type=RequestMetrics,name=RequestsPerSec,request=FetchFollower,version=*"]<p>Update: 30s</p>|
|Request rate Fetch Consumer Version discovery|<p>-</p>|`JMX agent`|jmx.discovery[beans,"kafka.network:type=RequestMetrics,name=RequestsPerSec,request=FetchConsumer,version=*"]<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Time to send the response Produce|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=ResponseSendTimeMs,request=Produce","Count"]<p>Update: 60s</p>|
|Time the request waiting in the request queue Fetch-Follower|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=RequestQueueTimeMs,request=FetchFollower","Count"]<p>Update: 60s</p>|
|Unclean leader election rate|<p>-</p>|`JMX agent`|jmx["kafka.controller:type=ControllerStats,name=UncleanLeaderElectionsPerSec","Count"]<p>Update: 60s</p>|
|Max lag in messages btw follower and leader replicas|<p>-</p>|`JMX agent`|jmx["kafka.server:type=ReplicaFetcherManager,name=MaxLag,clientId=Replica","Value"]<p>Update: 60s</p>|
|Time the request waiting in the request queue Fetch-Consumer|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=RequestQueueTimeMs,request=FetchConsumer","Count"]<p>Update: 60s</p>|
|The average fraction of time the network processors are idle|<p>-</p>|`JMX agent`|jmx["kafka.network:type=SocketServer,name=NetworkProcessorAvgIdlePercent","Value"]<p>Update: 60s</p>|
|The average fraction of time the request handler threads are idle FifteenMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=KafkaRequestHandlerPool,name=RequestHandlerAvgIdlePercent","FifteenMinuteRate"]<p>Update: 60s</p>|
|Byte in rate to other brokers FifteenMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=ReplicationBytesInPerSec","FifteenMinuteRate"]<p>Update: 60s</p>|
|LogFlushStats 95thPercentile|<p>-</p>|`JMX agent`|jmx["kafka.log:type=LogFlushStats,name=LogFlushRateAndTimeMs","95thPercentile"]<p>Update: 60s</p>|
|Request total time Produce|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=TotalTimeMs,request=Produce","Count"]<p>Update: 60s</p>|
|Request total time Fetch-Consumer|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=TotalTimeMs,request=FetchConsumer","Count"]<p>Update: 60s</p>|
|LogFlushStats Count|<p>-</p>|`JMX agent`|jmx["kafka.log:type=LogFlushStats,name=LogFlushRateAndTimeMs","Count"]<p>Update: 60s</p>|
|Byte in rate to other brokers MeanRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=ReplicationBytesInPerSec","MeanRate"]<p>Update: 60s</p>|
|Is controller active on broker|<p>-</p>|`JMX agent`|jmx["kafka.controller:type=KafkaController,name=ActiveControllerCount","Value"]<p>Update: 60s</p>|
|LogFlushStats 50thPercentile|<p>-</p>|`JMX agent`|jmx["kafka.log:type=LogFlushStats,name=LogFlushRateAndTimeMs","50thPercentile"]<p>Update: 60s</p>|
|Time the request waits for the follower Fetch-Consumer|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=RemoteTimeMs,request=FetchConsumer","Count"]<p>Update: 60s</p>|
|Byte out rate to other brokers OneMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=ReplicationBytesOutPerSec","OneMinuteRate"]<p>Update: 60s</p>|
|Bytes Out Per Sec FiveMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec","FiveMinuteRate"]<p>Update: 60s</p>|
|ISR expansion rate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=ReplicaManager,name=IsrExpandsPerSec","Count"]<p>Update: 60s</p>|
|Bytes In Per Sec MeanRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec","MeanRate"]<p>Update: 60s</p>|
|Time the request being processed at the leader Fetch-Consumer|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=LocalTimeMs,request=FetchConsumer","Count"]<p>Update: 60s</p>|
|ISR shrink rate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=ReplicaManager,name=IsrShrinksPerSec","Count"]<p>Update: 60s</p>|
|LogFlushStats 75thPercentile|<p>-</p>|`JMX agent`|jmx["kafka.log:type=LogFlushStats,name=LogFlushRateAndTimeMs","75thPercentile"]<p>Update: 60s</p>|
|Time to send the response Fetch-Consumer|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=ResponseSendTimeMs,request=FetchConsumer","Count"]<p>Update: 60s</p>|
|Peak threads|<p>-</p>|`JMX agent`|jmx[java.lang:type=Threading,PeakThreadCount]<p>Update: 60s</p>|
|Leader replica counts|<p>-</p>|`JMX agent`|jmx["kafka.server:type=ReplicaManager,name=LeaderCount","Value"]<p>Update: 60s</p>|
|Daemon threads|<p>-</p>|`JMX agent`|jmx[java.lang:type=Threading,DaemonThreadCount]<p>Update: 60s</p>|
|Time the request waits for the follower Produce|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=RemoteTimeMs,request=Produce","Count"]<p>Update: 60s</p>|
|HeapMemoryUsage|<p>-</p>|`JMX agent`|jmx[java.lang:type=Memory,HeapMemoryUsage.used]<p>Update: 60s</p>|
|Bytes Out Per Sec OneMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec","OneMinuteRate"]<p>Update: 60s</p>|
|Partition Count|<p>-</p>|`JMX agent`|jmx["kafka.server:type=ReplicaManager,name=PartitionCount","Value"]<p>Update: 60s</p>|
|Time the request being processed at the leader Produce|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=LocalTimeMs,request=Produce","Count"]<p>Update: 60s</p>|
|G1 Young Generation Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=G1 Young Generation","CollectionCount"]<p>Update: 60s</p>|
|G1 Old Generation Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=G1 Old Generation","CollectionCount"]<p>Update: 60s</p>|
|# of under replicated partitions (|ISR| < |all replicas|)|<p>-</p>|`JMX agent`|jmx["kafka.server:type=ReplicaManager,name=UnderReplicatedPartitions","Value"]<p>Update: 60s</p>|
|Messages In Per Sec MeanRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec","MeanRate"]<p>Update: 60s</p>|
|Byte in rate to other brokers FiveMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=ReplicationBytesInPerSec","FiveMinuteRate"]<p>Update: 60s</p>|
|The average fraction of time the request handler threads are idle OneMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=KafkaRequestHandlerPool,name=RequestHandlerAvgIdlePercent","OneMinuteRate"]<p>Update: 60s</p>|
|The average fraction of time the request handler threads are idle FiveMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=KafkaRequestHandlerPool,name=RequestHandlerAvgIdlePercent","FiveMinuteRate"]<p>Update: 60s</p>|
|Request total time Fetch-Follower|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=TotalTimeMs,request=FetchFollower","Count"]<p>Update: 60s</p>|
|Bytes Out Per Sec MeanRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec","MeanRate"]<p>Update: 60s</p>|
|Bytes Out Per Sec FifteenMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec","FifteenMinuteRate"]<p>Update: 60s</p>|
|Leader election rate|<p>-</p>|`JMX agent`|jmx["kafka.controller:type=ControllerStats,name=LeaderElectionRateAndTimeMs","Count"]<p>Update: 60s</p>|
|Time the request waiting in the request queue Produce|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=RequestQueueTimeMs,request=Produce","Count"]<p>Update: 60s</p>|
|Byte out rate to other brokers MeanRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=ReplicationBytesOutPerSec","MeanRate"]<p>Update: 60s</p>|
|Messages In Per Sec FifteenMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec","FifteenMinuteRate"]<p>Update: 60s</p>|
|Messages In Per Sec OneMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec","OneMinuteRate"]<p>Update: 60s</p>|
|Time the request being processed at the leader Fetch-Follower|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=LocalTimeMs,request=FetchFollower","Count"]<p>Update: 60s</p>|
|Bytes In Per Sec FiveMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec","FiveMinuteRate"]<p>Update: 60s</p>|
|Byte in rate to other brokers OneMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=ReplicationBytesInPerSec","OneMinuteRate"]<p>Update: 60s</p>|
|NonHeapMemoryUsage|<p>-</p>|`JMX agent`|jmx[java.lang:type=Memory,NonHeapMemoryUsage.used]<p>Update: 60s</p>|
|Live threads|<p>-</p>|`JMX agent`|jmx[java.lang:type=Threading,ThreadCount]<p>Update: 60s</p>|
|Time the request waits for the follower Fetch-Follower|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=RemoteTimeMs,request=FetchFollower","Count"]<p>Update: 60s</p>|
|Bytes In Per Sec FifteenMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec","FifteenMinuteRate"]<p>Update: 60s</p>|
|Bytes In Per Sec OneMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec","OneMinuteRate"]<p>Update: 60s</p>|
|Open File Descriptor Count|<p>-</p>|`JMX agent`|jmx[java.lang:type=OperatingSystem,OpenFileDescriptorCount]<p>Update: 60s</p>|
|Messages In Per Sec FiveMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec","FiveMinuteRate"]<p>Update: 60s</p>|
|Byte out rate to other brokers FiveMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=ReplicationBytesOutPerSec","FiveMinuteRate"]<p>Update: 60s</p>|
|Byte out rate to other brokers FifteenMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=ReplicationBytesOutPerSec","FifteenMinuteRate"]<p>Update: 60s</p>|
|Time to send the response Fetch-Follower|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=ResponseSendTimeMs,request=FetchFollower","Count"]<p>Update: 60s</p>|
|{#JMXTOPIC} under replicated partition {#JMXPARTITION}|<p>-</p>|`JMX agent`|jmx["kafka.cluster:type=Partition,name=UnderReplicated,topic={#JMXTOPIC},partition={#JMXPARTITION}","Value"]<p>Update: 30s</p><p>LLD</p>|
|Lag in messages per follower: node {#JMXCLIENTID} {#JMXTOPIC} {#JMXPARTITION}|<p>-</p>|`JMX agent`|jmx["kafka.server:type=FetcherLagMetrics,name=ConsumerLag,clientId={#JMXCLIENTID},topic={#JMXTOPIC},partition={#JMXPARTITION}","Value"]<p>Update: 60s</p><p>LLD</p>|
|Request rate Produce v{#JMXVERSION}|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=RequestsPerSec,request=Produce,version={#JMXVERSION}","Count"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} BytesInPerSec FifteenMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec,topic={#JMXTOPIC}","FifteenMinuteRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} BytesInPerSec FiveMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec,topic={#JMXTOPIC}","FiveMinuteRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} BytesInPerSec MeanRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec,topic={#JMXTOPIC}","MeanRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} BytesInPerSec OneMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec,topic={#JMXTOPIC}","OneMinuteRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} BytesOutPerSec FifteenMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec,topic={#JMXTOPIC}","FifteenMinuteRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} BytesOutPerSec FiveMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec,topic={#JMXTOPIC}","FiveMinuteRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} BytesOutPerSec MeanRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec,topic={#JMXTOPIC}","MeanRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} BytesOutPerSec OneMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec,topic={#JMXTOPIC}","OneMinuteRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} MessagesInPerSec FifteenMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec,topic={#JMXTOPIC}","FifteenMinuteRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} MessagesInPerSec FiveMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec,topic={#JMXTOPIC}","FiveMinuteRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} MessagesInPerSec MeanRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec,topic={#JMXTOPIC}","MeanRate"]<p>Update: 60s</p><p>LLD</p>|
|{#JMXTOPIC} MessagesInPerSec OneMinuteRate|<p>-</p>|`JMX agent`|jmx["kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec,topic={#JMXTOPIC}","OneMinuteRate"]<p>Update: 60s</p><p>LLD</p>|
|Request rate Fetch Follower v{#JMXVERSION}|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=RequestsPerSec,request=FetchFollower,version={#JMXVERSION}","Count"]<p>Update: 60s</p><p>LLD</p>|
|Request rate Fetch Consumer v{#JMXVERSION}|<p>-</p>|`JMX agent`|jmx["kafka.network:type=RequestMetrics,name=RequestsPerSec,request=FetchConsumer,version={#JMXVERSION}","Count"]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#JMXTOPIC} hash under replicated partition {#JMXPARTITION}|<p>-</p>|<p>**Expression**: last(/App Kafka/jmx["kafka.cluster:type=Partition,name=UnderReplicated,topic={#JMXTOPIC},partition={#JMXPARTITION}","Value"])=1</p><p>**Recovery expression**: </p>|average|
|{#JMXTOPIC} hash under replicated partition {#JMXPARTITION} (LLD)|<p>-</p>|<p>**Expression**: last(/App Kafka/jmx["kafka.cluster:type=Partition,name=UnderReplicated,topic={#JMXTOPIC},partition={#JMXPARTITION}","Value"])=1</p><p>**Recovery expression**: </p>|average|
