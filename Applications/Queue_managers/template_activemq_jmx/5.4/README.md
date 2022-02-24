# App ActiveMQ JMX

## Overview

You can configure like the image;


![](http://prntscr.com/hk7sbu)



## Author

Armagan Yaman

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$AMQ_BROKER_MEM_USAGE_THRESHOLD}|<p>-</p>|`85`|Text macro|
|{$AMQ_BROKER_STORE_USAGE_THRESHOLD}|<p>-</p>|`85`|Text macro|
|{$AMQ_BROKER_TMP_USAGE_THRESHOLD}|<p>-</p>|`85`|Text macro|
|{$BRKNAME}|<p>-</p>|`none`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AverageEnqueueTime for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Destination,brokerName={$BRKNAME}",AverageEnqueueTime]<p>Update: 300</p>|
|TempPercentUsage for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",TempPercentUsage]<p>Update: 60</p>|
|mem Heap Memory committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",HeapMemoryUsage.committed]<p>Update: 1m</p>|
|MemoryPercentUsage for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",MemoryPercentUsage]<p>Update: 60</p>|
|mem Non-Heap Memory used|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",NonHeapMemoryUsage.used]<p>Update: 1m</p>|
|mem Heap Memory used|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",HeapMemoryUsage.used]<p>Update: 1m</p>|
|EnqueueCount per minute for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Destination,brokerName={$BRKNAME}",EnqueueCount]<p>Update: 30s</p>|
|jvm Uptime|<p>-</p>|`JMX agent`|jmx["java.lang:type=Runtime",Uptime]<p>Update: 1m</p>|
|ExpiredCount per minute for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Destination,brokerName={$BRKNAME}",ExpiredCount]<p>Update: 30s</p>|
|MemoryLimit for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",MemoryLimit]<p>Update: 3600</p>|
|TotalMessageCount per minute for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",TotalMessageCount]<p>Update: 30s</p>|
|os Open File Descriptor Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=OperatingSystem",OpenFileDescriptorCount]<p>Update: 1m</p>|
|mem Non-Heap Memory max|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",NonHeapMemoryUsage.max]<p>Update: 1h</p>|
|QueueSize for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Destination,brokerName={$BRKNAME}",QueueSize]<p>Update: 60</p>|
|TempLimit for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",TempLimit]<p>Update: 3600</p>|
|jvm Version|<p>-</p>|`JMX agent`|jmx["java.lang:type=Runtime",VmVersion]<p>Update: 1h</p>|
|th Daemon Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",DaemonThreadCount]<p>Update: 1m</p>|
|DequeueCount per minute for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Destination,brokerName={$BRKNAME}",DequeueCount]<p>Update: 30s</p>|
|StoreLimit for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",StoreLimit]<p>Update: 3600</p>|
|jvm Name|<p>-</p>|`JMX agent`|jmx["java.lang:type=Runtime",VmName]<p>Update: 1h</p>|
|th Peak Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",PeakThreadCount]<p>Update: 1m</p>|
|Size of {$BRKNAME} Kaha DB|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME},service=PersistenceAdapter,instanceName=KahaDBPersistenceAdapter[/kahadb_Index_/kahadb]",Size]<p>Update: 60</p>|
|TotalEnqueueCount per minute for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",TotalEnqueueCount]<p>Update: 30s</p>|
|th Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",ThreadCount]<p>Update: 1m</p>|
|ProducerCount for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Destination,brokerName={$BRKNAME}",ProducerCount]<p>Update: 60</p>|
|os Max File Descriptor Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=OperatingSystem",MaxFileDescriptorCount]<p>Update: 1h</p>|
|StorePercentUsage for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",StorePercentUsage]<p>Update: 60</p>|
|TotalConsumerCount for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",TotalConsumerCount]<p>Update: 60</p>|
|os Process CPU Load|<p>-</p>|`JMX agent`|jmx["java.lang:type=OperatingSystem",ProcessCpuLoad]<p>Update: 1m</p>|
|ConsumerCount for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Destination,brokerName={$BRKNAME}",ConsumerCount]<p>Update: 60</p>|
|th Total Started Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",TotalStartedThreadCount]<p>Update: 1m</p>|
|TotalDequeueCount per minute for {$BRKNAME}|<p>-</p>|`JMX agent`|jmx["org.apache.activemq:type=Broker,brokerName={$BRKNAME}",TotalDequeueCount]<p>Update: 30s</p>|
|mem Non-Heap Memory committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",NonHeapMemoryUsage.committed]<p>Update: 1m</p>|
|mem Object Pending Finalization Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",ObjectPendingFinalizationCount]<p>Update: 1m</p>|
|mem Heap Memory max|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",HeapMemoryUsage.max]<p>Update: 1h</p>|


## Triggers

There are no triggers in this template.

