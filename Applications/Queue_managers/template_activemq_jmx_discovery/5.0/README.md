# JMX ActiveMQ

## Overview

Download and import the Zabbix server.



## Author

Armagan Yaman

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$AMQ_BROKER_MEM_USAGE_THRESHOLD}|<p>-</p>|`85`|Text macro|
|{$AMQ_BROKER_STORE_USAGE_THRESHOLD}|<p>-</p>|`85`|Text macro|
|{$AMQ_BROKER_TMP_USAGE_THRESHOLD}|<p>-</p>|`85`|Text macro|
|{$AMQ_DESTINATION_CONSUMER_COUNT_THRESHOLD_MIN}|<p>-</p>|`0`|Text macro|
|{$AMQ_DESTINATION_PRODUCER_COUNT_THRESHOLD_MIN}|<p>-</p>|`0`|Text macro|
|{$AMQ_DESTINATION_QUEUE_SIZE_THRESHOLD}|<p>-</p>|`10`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ActiveMQ destinations|<p>-</p>|`JMX agent`|jmx.discovery[beans,"org.apache.activemq:type=Destination,destinationName=*"]<p>Update: 3600</p>|
|ActiveMQ brokers|<p>-</p>|`JMX agent`|jmx.discovery[beans,"org.apache.activemq:type=Broker,brokerName=*"]<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AverageEnqueueTime for {#JMXVALUE}|<p>Average time a message has been held this destination</p>|`JMX agent`|jmx["{#JMXOBJ}",AverageEnqueueTime]<p>Update: 300</p><p>LLD</p>|
|ConsumerCount for {#JMXVALUE}|<p>Number of consumers subscribed to this destination.</p>|`JMX agent`|jmx["{#JMXOBJ}",ConsumerCount]<p>Update: 60</p><p>LLD</p>|
|DequeueCount per minute for {#JMXVALUE}|<p>Number of messages per minute that have been acknowledged (and removed from) from the destination.</p>|`JMX agent`|jmx["{#JMXOBJ}",DequeueCount]<p>Update: 30</p><p>LLD</p>|
|EnqueueCount per minute for {#JMXVALUE}|<p>Number of messages per minute that have been sent to the destination.</p>|`JMX agent`|jmx["{#JMXOBJ}",EnqueueCount]<p>Update: 30</p><p>LLD</p>|
|ExpiredCount per minute for {#JMXVALUE}|<p>Number of messages per minute that have been expired.</p>|`JMX agent`|jmx["{#JMXOBJ}",ExpiredCount]<p>Update: 30</p><p>LLD</p>|
|ProducerCount for {#JMXVALUE}|<p>Number of producers publishing to this destination</p>|`JMX agent`|jmx["{#JMXOBJ}",ProducerCount]<p>Update: 60</p><p>LLD</p>|
|QueueSize for {#JMXVALUE}|<p>Number of messages in the destination which are yet to be consumed. Potentially dispatched but unacknowledged.</p>|`JMX agent`|jmx["{#JMXOBJ}",QueueSize]<p>Update: 60</p><p>LLD</p>|
|MemoryLimit for {#JMXVALUE}|<p>-</p>|`JMX agent`|jmx["{#JMXOBJ}",MemoryLimit]<p>Update: 3600</p><p>LLD</p>|
|MemoryPercentUsage for {#JMXVALUE}|<p>-</p>|`JMX agent`|jmx["{#JMXOBJ}",MemoryPercentUsage]<p>Update: 60</p><p>LLD</p>|
|StoreLimit for {#JMXVALUE}|<p>-</p>|`JMX agent`|jmx["{#JMXOBJ}",StoreLimit]<p>Update: 3600</p><p>LLD</p>|
|StorePercentUsage for {#JMXVALUE}|<p>-</p>|`JMX agent`|jmx["{#JMXOBJ}",StorePercentUsage]<p>Update: 60</p><p>LLD</p>|
|TempLimit for {#JMXVALUE}|<p>-</p>|`JMX agent`|jmx["{#JMXOBJ}",TempLimit]<p>Update: 3600</p><p>LLD</p>|
|TempPercentUsage for {#JMXVALUE}|<p>-</p>|`JMX agent`|jmx["{#JMXOBJ}",TempPercentUsage]<p>Update: 60</p><p>LLD</p>|
|TotalConsumerCount for {#JMXVALUE}|<p>-</p>|`JMX agent`|jmx["{#JMXOBJ}",TotalConsumerCount]<p>Update: 60</p><p>LLD</p>|
|TotalDequeueCount per minute for {#JMXVALUE}|<p>-</p>|`JMX agent`|jmx["{#JMXOBJ}",TotalDequeueCount]<p>Update: 30</p><p>LLD</p>|
|TotalEnqueueCount per minute for {#JMXVALUE}|<p>-</p>|`JMX agent`|jmx["{#JMXOBJ}",TotalEnqueueCount]<p>Update: 30</p><p>LLD</p>|
|TotalMessageCount per minute for {#JMXVALUE}|<p>Number of unacknowledged messages on the broker per minute</p>|`JMX agent`|jmx["{#JMXOBJ}",TotalMessageCount]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|MemoryPercentUsage >{$AMQ_BROKER_MEM_USAGE_THRESHOLD}% for broker {#JMXVALUE}|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",MemoryPercentUsage].last(0)}>85</p><p>**Recovery expression**: </p>|high|
|StorePercentUsage >{$AMQ_BROKER_STORE_USAGE_THRESHOLD}% for broker {#JMXVALUE}|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",StorePercentUsage].last(0)}>85</p><p>**Recovery expression**: </p>|high|
|TempPercentUsage >{$AMQ_BROKER_TMP_USAGE_THRESHOLD}% for broker {#JMXVALUE}|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",TempPercentUsage].last(0)}>85</p><p>**Recovery expression**: </p>|high|
|Expired messages in {#JMXVALUE}!|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",ExpiredCount].last(0)}>0</p><p>**Recovery expression**: </p>|high|
|QueueSize >{$AMQ_DESTINATION_QUEUE_SIZE_THRESHOLD} for {#JMXVALUE}|<p>Queue {#JMXVALUE} size threshold exceeded!</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",QueueSize].last(0)}>10</p><p>**Recovery expression**: </p>|high|
|Too few (<{$AMQ_DESTINATION_CONSUMER_COUNT_THRESHOLD_MIN}) consumers for {#JMXVALUE}|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",ConsumerCount].last(0)}<0</p><p>**Recovery expression**: </p>|high|
|Too few (<{$AMQ_DESTINATION_PRODUCER_COUNT_THRESHOLD_MIN}) producers for {#JMXVALUE}|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",ProducerCount].last(0)}<0</p><p>**Recovery expression**: </p>|high|
|Expired messages in {#JMXVALUE}! (LLD)|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",ExpiredCount].last(0)}>0</p><p>**Recovery expression**: </p>|high|
|QueueSize >{$AMQ_DESTINATION_QUEUE_SIZE_THRESHOLD} for {#JMXVALUE} (LLD)|<p>Queue {#JMXVALUE} size threshold exceeded!</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",QueueSize].last(0)}>10</p><p>**Recovery expression**: </p>|high|
|Too few (<{$AMQ_DESTINATION_CONSUMER_COUNT_THRESHOLD_MIN}) consumers for {#JMXVALUE} (LLD)|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",ConsumerCount].last(0)}<0</p><p>**Recovery expression**: </p>|high|
|Too few (<{$AMQ_DESTINATION_PRODUCER_COUNT_THRESHOLD_MIN}) producers for {#JMXVALUE} (LLD)|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",ProducerCount].last(0)}<0</p><p>**Recovery expression**: </p>|high|
|MemoryPercentUsage >{$AMQ_BROKER_MEM_USAGE_THRESHOLD}% for broker {#JMXVALUE} (LLD)|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",MemoryPercentUsage].last(0)}>85</p><p>**Recovery expression**: </p>|high|
|StorePercentUsage >{$AMQ_BROKER_STORE_USAGE_THRESHOLD}% for broker {#JMXVALUE} (LLD)|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",StorePercentUsage].last(0)}>85</p><p>**Recovery expression**: </p>|high|
|TempPercentUsage >{$AMQ_BROKER_TMP_USAGE_THRESHOLD}% for broker {#JMXVALUE} (LLD)|<p>-</p>|<p>**Expression**: {JMX ActiveMQ:jmx["{#JMXOBJ}",TempPercentUsage].last(0)}>85</p><p>**Recovery expression**: </p>|high|
