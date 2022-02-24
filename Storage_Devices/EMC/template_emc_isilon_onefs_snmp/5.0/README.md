# SNMP EMC Isilon Cluster

## Overview

This EMC Isilon OneFS template was built from scratch by myself from the latest Isilon MIB's.


!NOTE! SOME ISILONS DO NOT DO WELL WITH BULK SNMP REQUESTS!!!!


If you notice flapping supported items, make sure bulk requests is off on your hosts.


It contains several additional features beyond basics, including drive, sensor, and license discovery. 2 different templates (One for your CLUSTER VIP, The other to monitor individual NODES).


It monitors basic network, drive, IFS usage, bandwidth, cluster / node / drive status, etc.


UPDATE v4: Fixed Temp discovery syntax problem


UPDATE v3: Fixed unixtime unit in licensing expiration item.


UPDATE v2: Fixed discovery item for disk size OID incorrect.


 


This is version 1.1 so it may have some inconsistencies, but I'm pretty good at uploading any fixes as I find them. You can see this from my other templates on this site which are popular.


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|configuredNodes|<p>-</p>|`SNMP agent`|configuredNodes.0<p>Update: 300</p>|
|clusterHealth|<p>-</p>|`SNMP agent`|clusterHealth.0<p>Update: 60</p>|
|ifsAvailableBytes|<p>-</p>|`SNMP agent`|ifsAvailableBytes.0<p>Update: 300</p>|
|ifsTotalBytes|<p>-</p>|`SNMP agent`|ifsTotalBytes.0<p>Update: 3600</p>|
|nodeCount|<p>-</p>|`SNMP agent`|nodeCount.0<p>Update: 300</p>|
|clusterIfsOutBitsPerSecond|<p>The cumulative throughput rate (bits per second) out of /ifs.</p>|`SNMP agent`|clusterIfsOutBitsPerSecond.0<p>Update: 60</p>|
|ifsUsedBytes|<p>-</p>|`SNMP agent`|ifsUsedBytes.0<p>Update: 300</p>|
|clusterIfsInBitsPerSecond|<p>The cumulative throughput rate (bits per second) into /ifs.</p>|`SNMP agent`|clusterIfsInBitsPerSecond.0<p>Update: 60</p>|
|clusterNetworkInBitsPerSecond|<p>-</p>|`SNMP agent`|clusterNetworkInBitsPerSecond.0<p>Update: 60</p>|
|clusterGUID|<p>-</p>|`SNMP agent`|clusterGUID.0<p>Update: 86400</p>|
|offlineNodes|<p>-</p>|`SNMP agent`|offlineNodes.0<p>Update: 300</p>|
|clusterName|<p>-</p>|`SNMP agent`|clusterName.0<p>Update: 3600</p>|
|onlineNodes|<p>-</p>|`SNMP agent`|onlineNodes.0<p>Update: 300</p>|
|clusterIfsOutBytes|<p>The cumulative number of bytes out of /ifs.</p>|`SNMP agent`|clusterIfsOutBytes.0<p>Update: 300</p>|
|clusterNetworkOutBitsPerSecond|<p>-</p>|`SNMP agent`|clusterNetworkOutBitsPerSecond.0<p>Update: 60</p>|
|clusterIfsInBytes|<p>The cumulative number of bytes into /ifs.</p>|`SNMP agent`|clusterIfsInBytes.0<p>Update: 300</p>|
|ifsFreeBytes|<p>-</p>|`SNMP agent`|ifsFreeBytes.0<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

# SNMP EMC Isilon Node

## Overview

This EMC Isilon OneFS template was built from scratch by myself from the latest Isilon MIB's.


!NOTE! SOME ISILONS DO NOT DO WELL WITH BULK SNMP REQUESTS!!!!


If you notice flapping supported items, make sure bulk requests is off on your hosts.


It contains several additional features beyond basics, including drive, sensor, and license discovery. 2 different templates (One for your CLUSTER VIP, The other to monitor individual NODES).


It monitors basic network, drive, IFS usage, bandwidth, cluster / node / drive status, etc.


UPDATE v4: Fixed Temp discovery syntax problem


UPDATE v3: Fixed unixtime unit in licensing expiration item.


UPDATE v2: Fixed discovery item for disk size OID incorrect.


 


This is version 1.1 so it may have some inconsistencies, but I'm pretty good at uploading any fixes as I find them. You can see this from my other templates on this site which are popular.


 



## Overview

This EMC Isilon OneFS template was built from scratch by myself from the latest Isilon MIB's.


!NOTE! SOME ISILONS DO NOT DO WELL WITH BULK SNMP REQUESTS!!!!


If you notice flapping supported items, make sure bulk requests is off on your hosts.


It contains several additional features beyond basics, including drive, sensor, and license discovery. 2 different templates (One for your CLUSTER VIP, The other to monitor individual NODES).


It monitors basic network, drive, IFS usage, bandwidth, cluster / node / drive status, etc.


UPDATE v4: Fixed Temp discovery syntax problem


UPDATE v3: Fixed unixtime unit in licensing expiration item.


UPDATE v2: Fixed discovery item for disk size OID incorrect.


 


This is version 1.1 so it may have some inconsistencies, but I'm pretty good at uploading any fixes as I find them. You can see this from my other templates on this site which are popular.


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Licenses|<p>-</p>|`SNMP agent`|licenseModuleName<p>Update: 3600</p>|
|Disks|<p>-</p>|`SNMP agent`|diskBay<p>Update: 3600</p>|
|Sensors|<p>-</p>|`SNMP agent`|tempSensorNumber<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|clusterIfsOutBytes|<p>The cumulative number of bytes out of /ifs.</p>|`SNMP agent`|clusterIfsOutBytes.0<p>Update: 300</p>|
|nodeNetworkOutBitsPerSecond|<p>-</p>|`SNMP agent`|nodeNetworkOutBitsPerSecond.0<p>Update: 60</p>|
|clusterIfsOutBitsPerSecond|<p>The cumulative throughput rate (bits per second) out of /ifs.</p>|`SNMP agent`|clusterIfsOutBitsPerSecond.0<p>Update: 60</p>|
|clusterNetworkOutBitsPerSecond|<p>-</p>|`SNMP agent`|clusterNetworkOutBitsPerSecond.0<p>Update: 60</p>|
|clusterGUID|<p>-</p>|`SNMP agent`|clusterGUID.0<p>Update: 86400</p>|
|readOnly|<p>-</p>|`SNMP agent`|readOnly.0<p>Update: 300</p>|
|nodeName|<p>-</p>|`SNMP agent`|nodeName.0<p>Update: 3600</p>|
|clusterIfsInBitsPerSecond|<p>The cumulative throughput rate (bits per second) into /ifs.</p>|`SNMP agent`|clusterIfsInBitsPerSecond.0<p>Update: 60</p>|
|nodeCPUUser|<p>-</p>|`SNMP agent`|nodeCPUUser.0<p>Update: 60</p>|
|nodeCount|<p>-</p>|`SNMP agent`|nodeCount.0<p>Update: 300</p>|
|ifsUsedBytes|<p>-</p>|`SNMP agent`|ifsUsedBytes.0<p>Update: 300</p>|
|nodeNetworkInBitsPerSecond|<p>-</p>|`SNMP agent`|nodeNetworkInBitsPerSecond.0<p>Update: 60</p>|
|clusterIfsInBytes|<p>The cumulative number of bytes into /ifs.</p>|`SNMP agent`|clusterIfsInBytes.0<p>Update: 300</p>|
|offlineNodes|<p>-</p>|`SNMP agent`|offlineNodes.0<p>Update: 300</p>|
|nodeCPUNice|<p>-</p>|`SNMP agent`|nodeCPUNice.0<p>Update: 60</p>|
|ifsTotalBytes|<p>-</p>|`SNMP agent`|ifsTotalBytes.0<p>Update: 3600</p>|
|nodeType|<p>-</p>|`SNMP agent`|nodeType.0<p>Update: 86400</p>|
|ifsAvailableBytes|<p>-</p>|`SNMP agent`|ifsAvailableBytes.0<p>Update: 300</p>|
|onlineNodes|<p>-</p>|`SNMP agent`|onlineNodes.0<p>Update: 300</p>|
|clusterNetworkInBitsPerSecond|<p>-</p>|`SNMP agent`|clusterNetworkInBitsPerSecond.0<p>Update: 60</p>|
|ifsFreeBytes|<p>-</p>|`SNMP agent`|ifsFreeBytes.0<p>Update: 300</p>|
|nodeIfsOutBytes|<p>The number of bytes out of /ifs thru this node.</p>|`SNMP agent`|nodeIfsOutBytes.0<p>Update: 300</p>|
|nodeCPUIdle|<p>-</p>|`SNMP agent`|nodeCPUIdle.0<p>Update: 30</p>|
|nodeIfsInBitsPerSecond|<p>The throughput rate (bytes per second) into /ifs thru this node.</p>|`SNMP agent`|nodeIfsInBitsPerSecond.0<p>Update: 60</p>|
|nodeHealth|<p>-</p>|`SNMP agent`|nodeHealth.0<p>Update: 60</p>|
|nodeIfsInBytes|<p>The number of bytes into /ifs thru this node.</p>|`SNMP agent`|nodeIfsInBytes.0<p>Update: 300</p>|
|nodeCPUSystem|<p>-</p>|`SNMP agent`|nodeCPUSystem.0<p>Update: 60</p>|
|nodeIfsOutBitsPerSecond|<p>The throughput rate (bytes per second) out of /ifs thru this node.</p>|`SNMP agent`|nodeIfsOutBitsPerSecond.0<p>Update: 60</p>|
|clusterName|<p>-</p>|`SNMP agent`|clusterName.0<p>Update: 3600</p>|
|configuredNodes|<p>-</p>|`SNMP agent`|configuredNodes.0<p>Update: 300</p>|
|clusterHealth|<p>-</p>|`SNMP agent`|clusterHealth.0<p>Update: 60</p>|
|License $1 Expiration Date|<p>-</p>|`SNMP agent`|licenseExpirationDate.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|License $1 Module Name|<p>-</p>|`SNMP agent`|licenseModuleName.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|License $1 Status|<p>-</p>|`SNMP agent`|licenseStatus.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Disk $1 Status|<p>-</p>|`SNMP agent`|diskDeviceStatus.[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Disk $1 Firmware Version|<p>-</p>|`SNMP agent`|diskFirmwareVersion.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Disk $1 Model|<p>-</p>|`SNMP agent`|diskModel.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Disk $1 Serial Number|<p>-</p>|`SNMP agent`|diskSerialNumber.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Disk $1 Size|<p>-</p>|`SNMP agent`|diskSizeBytes.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Temperature Sensor $1 Description|<p>-</p>|`SNMP agent`|tempSensorDescription.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Temperature Sensor $1 Name|<p>-</p>|`SNMP agent`|tempSensorName.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Temperature Sensor $1 Value|<p>-</p>|`SNMP agent`|tempSensorValue.[{#SNMPINDEX}]<p>Update: 120</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

