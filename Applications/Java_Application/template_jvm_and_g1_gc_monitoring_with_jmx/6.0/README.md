# JVM Generic

## Overview

This is a modification of [official template for generic java applications, customized for G1 GC. (and includes better graphs)


<https://github.com/tahajahangir/zabbix-jvm-template>



## Author

Taha Jahangir

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|mp PS Perm Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Perm Gen",Usage.max]<p>Update: 3600</p>|
|mem Non-Heap Memory used|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",NonHeapMemoryUsage.used]<p>Update: 20</p>|
|th Daemon Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",DaemonThreadCount]<p>Update: 60</p>|
|cl Loaded Class Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=ClassLoading",LoadedClassCount]<p>Update: 60</p>|
|mem Non-Heap Memory committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",NonHeapMemoryUsage.committed]<p>Update: 60</p>|
|mp CMS Perm Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Perm Gen",Usage.committed]<p>Update: 60</p>|
|mem Heap Memory committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",HeapMemoryUsage.committed]<p>Update: 60</p>|
|mp Perm Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Perm Gen",Usage.max]<p>Update: 3600</p>|
|mp Code Cache used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Code Cache",Usage.used]<p>Update: 20</p>|
|gc Copy number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=Copy",CollectionCount]<p>Update: 20</p>|
|mem Object Pending Finalization Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",ObjectPendingFinalizationCount]<p>Update: 60</p>|
|gc MarkSweepCompact number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=MarkSweepCompact",CollectionCount]<p>Update: 20</p>|
|mp Tenured Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Tenured Gen",Usage.committed]<p>Update: 60</p>|
|mp G1 Survivor Space committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=G1 Survivor Space",Usage.committed]<p>Update: 60</p>|
|gc G1 Young collection count|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=G1 Young Generation",CollectionCount]<p>Update: 20</p>|
|mp CMS Old Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Old Gen",Usage.committed]<p>Update: 60</p>|
|mem Heap Memory max|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",HeapMemoryUsage.max]<p>Update: 3600</p>|
|gc PS Scavenge accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=PS Scavenge",CollectionTime]<p>Update: 20</p>|
|gc ConcurrentMarkSweep number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=ConcurrentMarkSweep",CollectionCount]<p>Update: 20</p>|
|gc PS MarkSweep number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=PS MarkSweep",CollectionCount]<p>Update: 20</p>|
|gc MarkSweepCompact accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=MarkSweepCompact",CollectionTime]<p>Update: 20</p>|
|mp G1 Eden Space used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=G1 Eden Space",Usage.used]<p>Update: 20</p>|
|os Open File Descriptor Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=OperatingSystem",OpenFileDescriptorCount]<p>Update: 60</p>|
|mp CMS Perm Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Perm Gen",Usage.max]<p>Update: 3600</p>|
|mp G1 Survivor Space used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=G1 Survivor Space",Usage.used]<p>Update: 20</p>|
|mp Tenured Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Tenured Gen",Usage.used]<p>Update: 20</p>|
|mp CMS Perm Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Perm Gen",Usage.used]<p>Update: 20</p>|
|th Total Started Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",TotalStartedThreadCount]<p>Update: 60</p>|
|os Max File Descriptor Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=OperatingSystem",MaxFileDescriptorCount]<p>Update: 3600</p>|
|gc G1 Young collection time|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=G1 Young Generation",CollectionTime]<p>Update: 20</p>|
|gc ConcurrentMarkSweep accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=ConcurrentMarkSweep",CollectionTime]<p>Update: 20</p>|
|th Peak Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",PeakThreadCount]<p>Update: 60</p>|
|cl Total Loaded Class Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=ClassLoading",TotalLoadedClassCount]<p>Update: 60</p>|
|mp CMS Old Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Old Gen",Usage.max]<p>Update: 3600</p>|
|gc ParNew number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=ParNew",CollectionCount]<p>Update: 20</p>|
|mp Code Cache committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Code Cache",Usage.committed]<p>Update: 60</p>|
|gc Copy accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=Copy",CollectionTime]<p>Update: 20</p>|
|comp Accumulated time spent in compilation|<p>-</p>|`JMX agent`|jmx["java.lang:type=Compilation",TotalCompilationTime]<p>Update: 60</p>|
|gc PS MarkSweep accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=PS MarkSweep",CollectionTime]<p>Update: 20</p>|
|cl Unloaded Class Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=ClassLoading",UnloadedClassCount]<p>Update: 60</p>|
|th Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",ThreadCount]<p>Update: 60</p>|
|mp PS Perm Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Perm Gen",Usage.committed]<p>Update: 60</p>|
|os Process CPU Load|<p>-</p>|`JMX agent`|jmx["java.lang:type=OperatingSystem",ProcessCpuLoad]<p>Update: 60</p>|
|mp PS Perm Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Perm Gen",Usage.used]<p>Update: 20</p>|
|mp G1 Eden Space committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=G1 Eden Space",Usage.committed]<p>Update: 60</p>|
|mp G1 Old Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=G1 Old Gen",Usage.committed]<p>Update: 60</p>|
|mp Tenured Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Tenured Gen",Usage.max]<p>Update: 3600</p>|
|comp Name of the current JIT compiler|<p>-</p>|`JMX agent`|jmx["java.lang:type=Compilation",Name]<p>Update: 3600</p>|
|mp Perm Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Perm Gen",Usage.used]<p>Update: 20</p>|
|mp Perm Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Perm Gen",Usage.committed]<p>Update: 60</p>|
|mp G1 Old Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=G1 Old Gen",Usage.used]<p>Update: 20</p>|
|jvm Name|<p>-</p>|`JMX agent`|jmx["java.lang:type=Runtime",VmName]<p>Update: 3600</p>|
|mp PS Old Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Old Gen",Usage.committed]<p>Update: 60</p>|
|gc ParNew accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=ParNew",CollectionTime]<p>Update: 20</p>|
|mp CMS Old Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Old Gen",Usage.used]<p>Update: 20</p>|
|gc G1 Old collection count|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=G1 Old Generation",CollectionCount]<p>Update: 20</p>|
|mem Heap Memory used|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",HeapMemoryUsage.used]<p>Update: 20</p>|
|mp PS Old Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Old Gen",Usage.max]<p>Update: 3600</p>|
|mem Non-Heap Memory max|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",NonHeapMemoryUsage.max]<p>Update: 3600</p>|
|mp Code Cache max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Code Cache",Usage.max]<p>Update: 3600</p>|
|jvm Version|<p>-</p>|`JMX agent`|jmx["java.lang:type=Runtime",VmVersion]<p>Update: 3600</p>|
|jvm Uptime|<p>-</p>|`JMX agent`|jmx["java.lang:type=Runtime",Uptime]<p>Update: 60</p>|
|gc G1 Old collection time|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=G1 Old Generation",CollectionTime]<p>Update: 20</p>|
|mp PS Old Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Old Gen",Usage.used]<p>Update: 20</p>|


## Triggers

There are no triggers in this template.

