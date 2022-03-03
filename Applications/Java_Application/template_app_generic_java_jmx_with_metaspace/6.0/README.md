# Template App Generic Java JMX

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|cl Loaded Class Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=ClassLoading",LoadedClassCount]<p>Update: 1m</p>|
|mp PS Perm Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Perm Gen",Usage.max]<p>Update: 1h</p>|
|mp Code Cache used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Code Cache",Usage.used]<p>Update: 1m</p>|
|mp Metaspace committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Metaspace",Usage.committed]<p>Update: 1m</p>|
|mp Metaspace max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Metaspace",Usage.max]<p>Update: 1m</p>|
|mp Metaspace used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Metaspace",Usage.used]<p>Update: 1m</p>|
|mp Perm Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Perm Gen",Usage.committed]<p>Update: 1m</p>|
|mp Perm Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Perm Gen",Usage.max]<p>Update: 1h</p>|
|mp Perm Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Perm Gen",Usage.used]<p>Update: 1m</p>|
|mp PS Old Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Old Gen",Usage.committed]<p>Update: 1m</p>|
|mp PS Old Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Old Gen",Usage.max]<p>Update: 1h</p>|
|mp PS Old Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Old Gen",Usage.used]<p>Update: 1m</p>|
|mp PS Perm Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Perm Gen",Usage.committed]<p>Update: 1m</p>|
|mp PS Perm Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=PS Perm Gen",Usage.used]<p>Update: 1m</p>|
|mp Code Cache committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Code Cache",Usage.committed]<p>Update: 1m</p>|
|mp Tenured Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Tenured Gen",Usage.committed]<p>Update: 1m</p>|
|mp Tenured Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Tenured Gen",Usage.max]<p>Update: 1h</p>|
|mp Tenured Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Tenured Gen",Usage.used]<p>Update: 1m</p>|
|os Max File Descriptor Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=OperatingSystem",MaxFileDescriptorCount]<p>Update: 1h</p>|
|os Open File Descriptor Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=OperatingSystem",OpenFileDescriptorCount]<p>Update: 1m</p>|
|os Process CPU Load|<p>-</p>|`JMX agent`|jmx["java.lang:type=OperatingSystem",ProcessCpuLoad]<p>Update: 1m</p>|
|jvm Uptime|<p>-</p>|`JMX agent`|jmx["java.lang:type=Runtime",Uptime]<p>Update: 1m</p>|
|jvm Name|<p>-</p>|`JMX agent`|jmx["java.lang:type=Runtime",VmName]<p>Update: 1h</p>|
|jvm Version|<p>-</p>|`JMX agent`|jmx["java.lang:type=Runtime",VmVersion]<p>Update: 1h</p>|
|th Daemon Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",DaemonThreadCount]<p>Update: 1m</p>|
|th Peak Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",PeakThreadCount]<p>Update: 1m</p>|
|th Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",ThreadCount]<p>Update: 1m</p>|
|mp Code Cache max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=Code Cache",Usage.max]<p>Update: 1h</p>|
|mp CMS Perm Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Perm Gen",Usage.used]<p>Update: 1m</p>|
|cl Total Loaded Class Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=ClassLoading",TotalLoadedClassCount]<p>Update: 1m</p>|
|gc PS MarkSweep accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=PS MarkSweep",CollectionTime]<p>Update: 1m</p>|
|cl Unloaded Class Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=ClassLoading",UnloadedClassCount]<p>Update: 1m</p>|
|comp Name of the current JIT compiler|<p>-</p>|`JMX agent`|jmx["java.lang:type=Compilation",Name]<p>Update: 1h</p>|
|comp Accumulated time spent in compilation|<p>-</p>|`JMX agent`|jmx["java.lang:type=Compilation",TotalCompilationTime]<p>Update: 1m</p>|
|gc ConcurrentMarkSweep number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=ConcurrentMarkSweep",CollectionCount]<p>Update: 1m</p>|
|gc ConcurrentMarkSweep accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=ConcurrentMarkSweep",CollectionTime]<p>Update: 1m</p>|
|gc Copy number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=Copy",CollectionCount]<p>Update: 1m</p>|
|gc Copy accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=Copy",CollectionTime]<p>Update: 1m</p>|
|gc MarkSweepCompact number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=MarkSweepCompact",CollectionCount]<p>Update: 1m</p>|
|gc MarkSweepCompact accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=MarkSweepCompact",CollectionTime]<p>Update: 1m</p>|
|gc ParNew number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=ParNew",CollectionCount]<p>Update: 1m</p>|
|gc ParNew accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=ParNew",CollectionTime]<p>Update: 1m</p>|
|gc PS MarkSweep number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=PS MarkSweep",CollectionCount]<p>Update: 1m</p>|
|gc PS Scavenge number of collections per second|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=PS Scavenge",CollectionCount]<p>Update: 1m</p>|
|mp CMS Perm Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Perm Gen",Usage.max]<p>Update: 1h</p>|
|gc PS Scavenge accumulated time spent in collection|<p>-</p>|`JMX agent`|jmx["java.lang:type=GarbageCollector,name=PS Scavenge",CollectionTime]<p>Update: 1m</p>|
|mem Heap Memory committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",HeapMemoryUsage.committed]<p>Update: 1m</p>|
|mem Heap Memory max|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",HeapMemoryUsage.max]<p>Update: 1h</p>|
|mem Heap Memory used|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",HeapMemoryUsage.used]<p>Update: 1m</p>|
|mem Non-Heap Memory committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",NonHeapMemoryUsage.committed]<p>Update: 1m</p>|
|mem Non-Heap Memory max|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",NonHeapMemoryUsage.max]<p>Update: 1h</p>|
|mem Non-Heap Memory used|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",NonHeapMemoryUsage.used]<p>Update: 1m</p>|
|mem Object Pending Finalization Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Memory",ObjectPendingFinalizationCount]<p>Update: 1m</p>|
|mp CMS Old Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Old Gen",Usage.committed]<p>Update: 1m</p>|
|mp CMS Old Gen max|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Old Gen",Usage.max]<p>Update: 1h</p>|
|mp CMS Old Gen used|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Old Gen",Usage.used]<p>Update: 1m</p>|
|mp CMS Perm Gen committed|<p>-</p>|`JMX agent`|jmx["java.lang:type=MemoryPool,name=CMS Perm Gen",Usage.committed]<p>Update: 1m</p>|
|th Total Started Thread Count|<p>-</p>|`JMX agent`|jmx["java.lang:type=Threading",TotalStartedThreadCount]<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

