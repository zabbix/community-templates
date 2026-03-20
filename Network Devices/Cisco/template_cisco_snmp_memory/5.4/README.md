# SNMP Cisco Memory

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory discovery|<p>A textual name assigned to the memory pool. This object is suitable for output to a human operator, and may also be used to distinguish among the various pool types, especially among dynamic pools.</p>|`SNMP agent`|ciscoMemoryPoolName<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Amount of free memory pool {#SNMPVALUE}|<p>Indicates the number of bytes from the memory pool that are currently unused on the managed device. Note that the sum of ciscoMemoryPoolUsed and ciscoMemoryPoolFree is the total amount of memory in the pool</p>|`SNMP agent`|ciscoMemoryPoolFree[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Amount of largest contiguous free memory pool {#SNMPVALUE}|<p>Indicates the largest number of contiguous bytes from the memory pool that are currently unused on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolLargestFree[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Amount of used memory pool {#SNMPVALUE}|<p>Indicates the number of bytes from the memory pool that are currently in use by applications on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolUsed[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Utilization memory pool {#SNMPVALUE}|<p>-</p>|`Calculated`|ciscoMemoryPoolUtilization[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Memory pool (#SNMPVALUE) utilization on {HOST.NAME} is too high|<p>-</p>|<p>**Expression**: avg(/SNMP Cisco Memory/ciscoMemoryPoolUtilization[{#SNMPVALUE}],5m)>90</p><p>**Recovery expression**: </p>|high|
|Memory pool (#SNMPVALUE) utilization on {HOST.NAME} is too high (LLD)|<p>-</p>|<p>**Expression**: avg(/SNMP Cisco Memory/ciscoMemoryPoolUtilization[{#SNMPVALUE}],5m)>90</p><p>**Recovery expression**: </p>|high|
