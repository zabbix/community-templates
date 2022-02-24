# Template App BlueCoat SG

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status of the Disk1|<p>This variable indicates the present operational status of the disk.</p>|`SNMP agent`|deviceDiskStatus1<p>Update: 60</p>|
|Status of the Disk2|<p>This variable indicates the present operational status of the disk.</p>|`SNMP agent`|deviceDiskStatus2<p>Update: 60</p>|
|Percent of CPU in use|<p>Percent of CPU in use.</p>|`SNMP agent`|sgDeviceUsagePercentCPU<p>Update: 60</p>|
|Percent of disk in use|<p>Percent of disk in use.</p>|`SNMP agent`|sgDeviceUsagePercentDisk<p>Update: 60</p>|
|Uptime|<p>The amount of time the proxy has been running since boot, in milliseconds.</p>|`SNMP agent`|sgProxyCpuCoreUpTime<p>Update: 60</p>|
|Median DNS service time 1|<p>The median DNS service time, in milliseconds.</p>|`SNMP agent`|sgProxyDnsMedianServiceTime.1<p>Update: 60</p>|
|Median DNS service time 5|<p>The median DNS service time, in milliseconds.</p>|`SNMP agent`|sgProxyDnsMedianServiceTime.5<p>Update: 60</p>|
|Median DNS service time 60|<p>The median DNS service time, in milliseconds.</p>|`SNMP agent`|sgProxyDnsMedianServiceTime.60<p>Update: 60</p>|
|Average byte rate for all responses|<p>The average byte rate for all HTTP responses, in bytes per second.</p>|`SNMP agent`|sgProxyHttpByteRateAll<p>Update: 60</p>|
|Average byte rate for all hits|<p>The average byte rate for all HTTP hits, in bytes per second.</p>|`SNMP agent`|sgProxyHttpByteRateHit<p>Update: 60</p>|
|Average byte rate for all misses|<p>The average byte rate for all HTTP misses, in bytes per second.</p>|`SNMP agent`|sgProxyHttpByteRateMiss<p>Update: 60</p>|
|Average byte rate for all partial hits|<p>The average byte rate for all HTTP partial hits, in bytes per second.</p>|`SNMP agent`|sgProxyHttpByteRatePartialHit<p>Update: 60</p>|
|Percentage hit rate (by requested bytes)|<p>The percentage HTTP hit rate (by requested bytes). This is the number of bytes returned to the client for hits, as a fraction of the total bytes.</p>|`SNMP agent`|sgProxyHttpClientByteHitRate<p>Update: 60</p>|
|Total number of connections with the proxy clients|<p>The total number of HTTP connections with the proxy clients.</p>|`SNMP agent`|sgProxyHttpClientConnections<p>Update: 60</p>|
|Number of active connections with the proxy clients|<p>The number of active HTTP connections with the proxy clients.</p>|`SNMP agent`|sgProxyHttpClientConnectionsActive<p>Update: 60</p>|
|Number of idle connections with the proxy clients|<p>The number of idle HTTP connections with the proxy clients.</p>|`SNMP agent`|sgProxyHttpClientConnectionsIdle<p>Update: 60</p>|
|Number of errors caused by client connections|<p>The number of HTTP errors caused by client connections.</p>|`SNMP agent`|sgProxyHttpClientErrors<p>Update: 60</p>|
|Percentage hit rate (by objects)|<p>The percentage HTTP hit rate (by objects).</p>|`SNMP agent`|sgProxyHttpClientHitRate<p>Update: 60</p>|
|Number of hits|<p>The number of HTTP hits that the proxy clients have produced.</p>|`SNMP agent`|sgProxyHttpClientHits<p>Update: 60</p>|
|Number of bytes received from the clients|<p>The number of bytes received from the clients by the proxy.</p>|`SNMP agent`|sgProxyHttpClientInBytes<p>Update: 60</p>|
|Number of misses|<p>The number of HTTP misses that the proxy clients have produced.</p>|`SNMP agent`|sgProxyHttpClientMisses<p>Update: 60</p>|
|Number of bytes delivered to clients|<p>The number of bytes delivered to clients from the proxy.</p>|`SNMP agent`|sgProxyHttpClientOutBytes<p>Update: 60</p>|
|Number of partial (near) hits|<p>The number of HTTP partial (near) hits that the proxy clients have produced.</p>|`SNMP agent`|sgProxyHttpClientPartialHits<p>Update: 60</p>|
|Average rate per second of requests|<p>The average rate per second of HTTP requests.</p>|`SNMP agent`|sgProxyHttpClientRequestRate<p>Update: 60</p>|
|Number of requests received from clients|<p>The number of HTTP requests received from clients.</p>|`SNMP agent`|sgProxyHttpClientRequests<p>Update: 60</p>|
|Average time to first response byte for all requests|<p>The average time to first response byte for all HTTP requests, in milliseconds.</p>|`SNMP agent`|sgProxyHttpFirstByteAll<p>Update: 60</p>|
|Average time to first response byte for all hits|<p>The average time to first response byte for all HTTP hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpFirstByteHit<p>Update: 60</p>|
|Average time to first response byte for all misses|<p>The average time to first response byte for all HTTP misses, in milliseconds.</p>|`SNMP agent`|sgProxyHttpFirstByteMiss<p>Update: 60</p>|
|Average time to first response byte for all partial (near) hits|<p>The average time to first response byte for all HTTP partial (near) hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpFirstBytePartialHit<p>Update: 60</p>|
|Median service time for all requests 1|<p>The median service time for all HTTP requests, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimeAll.1<p>Update: 60</p>|
|Median service time for all requests 5|<p>The median service time for all HTTP requests, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimeAll.5<p>Update: 60</p>|
|Median service time for all requests 60|<p>The median service time for all HTTP requests, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimeAll.60<p>Update: 60</p>|
|Median service time for all hits 1|<p>The median service time for all HTTP hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimeHit.1<p>Update: 60</p>|
|Median service time for all hits 5|<p>The median service time for all HTTP hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimeHit.5<p>Update: 60</p>|
|Median service time for all hits 60|<p>The median service time for all HTTP hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimeHit.60<p>Update: 60</p>|
|Median service time for all misses 1|<p>The median service time for all HTTP misses, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimeMiss.1<p>Update: 60</p>|
|Median service time for all misses 5|<p>The median service time for all HTTP misses, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimeMiss.5<p>Update: 60</p>|
|Median service time for all misses 60|<p>The median service time for all HTTP misses, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimeMiss.60<p>Update: 60</p>|
|Median service time for all partial (near) hits 1|<p>The median service time for all HTTP partial (near) hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimePartialHit.1<p>Update: 60</p>|
|Median service time for all partial (near) hits 5|<p>The median service time for all HTTP partial (near) hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimePartialHit.5<p>Update: 60</p>|
|Median service time for all partial (near) hits 60|<p>The median service time for all HTTP partial (near) hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpMedianServiceTimePartialHit.60<p>Update: 60</p>|
|Average response size for all responses|<p>The average response size for all HTTP responses, in bytes.</p>|`SNMP agent`|sgProxyHttpResponseSizeAll<p>Update: 60</p>|
|Average response size for all hits|<p>The average response size for all HTTP hits, in bytes.</p>|`SNMP agent`|sgProxyHttpResponseSizeHit<p>Update: 60</p>|
|Average response size for all misses|<p>The average response size for all HTTP misses, in bytes.</p>|`SNMP agent`|sgProxyHttpResponseSizeMiss<p>Update: 60</p>|
|Average response size for all partial hits|<p>The average response size for all HTTP partial hits, in bytes.</p>|`SNMP agent`|sgProxyHttpResponseSizePartialHit<p>Update: 60</p>|
|Total number of connections with remote servers|<p>The total number of HTTP connections with remote servers.</p>|`SNMP agent`|sgProxyHttpServerConnections<p>Update: 60</p>|
|Number of active connections with remote servers|<p>The number of active HTTP connections with remote servers.</p>|`SNMP agent`|sgProxyHttpServerConnectionsActive<p>Update: 60</p>|
|Number of idle connections with remote servers|<p>The number of idle HTTP connections with remote servers.</p>|`SNMP agent`|sgProxyHttpServerConnectionsIdle<p>Update: 60</p>|
|Number of errors while fetching objects|<p>The number of HTTP errors while fetching objects.</p>|`SNMP agent`|sgProxyHttpServerErrors<p>Update: 60</p>|
|Number of bytes received by the proxy from remote servers|<p>The number of bytes received by the proxy from remote servers.</p>|`SNMP agent`|sgProxyHttpServerInBytes<p>Update: 60</p>|
|Number of bytes transmitted|<p>The number of bytes transmitted by the proxy to remote servers.</p>|`SNMP agent`|sgProxyHttpServerOutBytes<p>Update: 60</p>|
|Number of requests|<p>The number of HTTP requests that the proxy has issued.</p>|`SNMP agent`|sgProxyHttpServerRequests<p>Update: 60</p>|
|Average service time for all requests|<p>The average service time for all HTTP requests, in milliseconds.</p>|`SNMP agent`|sgProxyHttpServiceTimeAll<p>Update: 60</p>|
|Average service time for all hits|<p>The average service time for all HTTP hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpServiceTimeHit<p>Update: 60</p>|
|Average service time for all misses|<p>The average service time for all HTTP misses, in milliseconds.</p>|`SNMP agent`|sgProxyHttpServiceTimeMiss<p>Update: 60</p>|
|Average service time for all partial (near) hits|<p>The average service time for all HTTP partial (near) hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpServiceTimePartialHit<p>Update: 60</p>|
|Total fetch time for all responses|<p>The total fetch time for all HTTP responses, in milliseconds.</p>|`SNMP agent`|sgProxyHttpTotalFetchTimeAll<p>Update: 60</p>|
|Total fetch time for all hits|<p>The total fetch time for all HTTP hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpTotalFetchTimeHit<p>Update: 60</p>|
|Total fetch time for all misses|<p>The total fetch time for all HTTP misses, in milliseconds.</p>|`SNMP agent`|sgProxyHttpTotalFetchTimeMiss<p>Update: 60</p>|
|Total fetch time for all partial (near) hits|<p>The total fetch time for all HTTP partial (near) hits, in milliseconds.</p>|`SNMP agent`|sgProxyHttpTotalFetchTimePartialHit<p>Update: 60</p>|
|Memory available|<p>The total memory available for use by the proxy.</p>|`SNMP agent`|sgProxyMemAvailable<p>Update: 60</p>|
|Memory used for object caching|<p>The memory used by the proxy for object caching.</p>|`SNMP agent`|sgProxyMemCacheUsage<p>Update: 60</p>|
|Proportion of memory used|<p>The proportion of memory used in total by the proxy, as a percentage of the total memory available.</p>|`SNMP agent`|sgProxyMemoryPressure<p>Update: 60</p>|
|Memory used for system and support processes|<p>The memory used by the proxy for system and support processes.</p>|`SNMP agent`|sgProxyMemSysUsage<p>Update: 60</p>|
|Number of objects currently held|<p>The number of objects currently held by the proxy.</p>|`SNMP agent`|sgProxyNumObjects<p>Update: 60</p>|
|Hardware serial number|<p>Hardware serial number of the proxy appliance.</p>|`SNMP agent`|sgProxySerialNumber<p>Update: 3600</p>|
|Name of the proxy software|<p>Name of the proxy software.</p>|`SNMP agent`|sgProxySoftware<p>Update: 3600</p>|
|Quantity of storage in use|<p>The quantity of storage in use by the proxy.</p>|`SNMP agent`|sgProxyStorage<p>Update: 60</p>|
|Version of the proxy software|<p>Version of the proxy software.</p>|`SNMP agent`|sgProxyVersion<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

