# SNMP FreeNAS

## Overview

This template will allow you to easily monitor and graph a TrueNAS/FreeNAS server including ZFS ARC stats. This requires TrueNAS/FreeNAS 9.3 or above.


You will also need to create a Zabbix macro named {$SNMP\_COMMUNITY} which contains your SNMP community name. The FREENAS-MIB.txt will also need to be uploaded to your Zabbix Server. The MIB can be downloaded from your FreeNAS server and is located in /usr/local/share/snmp/mibs/.



## Author

FreeNAS Community

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template SNMP Generic|
|Template SNMP Interfaces|
|Template SNMP Processors|
|Template SNMP Disks|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescr<p>Update: 3600</p>|
|Memory statistics|<p>The rule will discover all memory matching the global regexp "Storage devices for SNMP discovery". {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|hrMemDescr<p>Update: 3600</p>|
|ZFS Pools|<p>ZFS pools</p>|`SNMP agent`|zfsPoolName<p>Update: 3600</p>|
|Disk partitions|<p>The rule will discover all disk partitions matching the global regexp "Storage devices for SNMP discovery". {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|hrStorageDescr<p>Update: 3600</p>|
|Processors|<p>{$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|hrProcessorLoad<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Arc Cache miss ratio|<p>Arc cach miss ratio</p>|`SNMP agent`|zfs.ArcMissratio<p>Update: 60</p>|
|ZIL operations per second|<p>ZIL operations per second</p>|`SNMP agent`|zfs.ZilstatOps1sec<p>Update: 60</p>|
|L2Arc size|<p>L2Arc size iin bytes</p>|`SNMP agent`|zfs.L2Arcsize<p>Update: 60</p>|
|Arc P|<p>Arc P ?</p>|`SNMP agent`|zfs.ArcP<p>Update: 60</p>|
|Arc Cache miss percent|<p>Arc cach miss percentage</p>|`SNMP agent`|zfs.ArcMissPercent<p>Update: 60</p>|
|Arc Cache hit ratio|<p>Arc hit ratio</p>|`SNMP agent`|zfs.ArcHitratio<p>Update: 60</p>|
|Arc misses|<p>Arc misses</p>|`SNMP agent`|zfs.ArcMisses<p>Update: 60</p>|
|Arc hits|<p>Arc hits</p>|`SNMP agent`|zfs.Archits<p>Update: 60</p>|
|Arc meta|<p>Arc meta ?</p>|`SNMP agent`|zfs.Arcmeta<p>Update: 60</p>|
|Arc C|<p>Arc C ?</p>|`SNMP agent`|zfs.ArcC<p>Update: 60</p>|
|Arc size|<p>Arc size iin bytes</p>|`SNMP agent`|zfs.Arcsize<p>Update: 60</p>|
|L2Arc hits|<p>L2Arc hits</p>|`SNMP agent`|zfs.L2Archits<p>Update: 60</p>|
|Arc data|<p>Arc data</p>|`SNMP agent`|zfs.ArcData<p>Update: 60</p>|
|L2Arc misses|<p>L2Arc misses</p>|`SNMP agent`|zfs.L2ArcMisses<p>Update: 60</p>|
|Admin status of interface $1|<p>The desired state of the interface.</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Description of interface $1|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} allocated units|<p>-</p>|`SNMP agent`|memAllocated[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} size|<p>-</p>|`Calculated`|memSize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} units|<p>-</p>|`SNMP agent`|memUnits[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Available bytes on pool {#SNMPVALUE}|<p>The number of available bytes (rounded to 1 MB blocks) on the volume.</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE},free]<p>Update: 60</p><p>LLD</p>|
|Health of pool {#SNMPVALUE}|<p>The current health of the containing pool, as reported by zpool status. online(1), degraded(2), faulted(3), unknown(4)</p>|`SNMP agent`|zfsPoolHealth[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|IO Read Ops on pool {#SNMPVALUE}|<p>The number of read I/O operations sent to the pool or device.</p>|`SNMP agent`|vfs.fs.iops[{#SNMPVALUE},read]<p>Update: 60</p><p>LLD</p>|
|IO Write Ops on pool {#SNMPVALUE}|<p>The number of write I/O operations sent to the pool or device.</p>|`SNMP agent`|vfs.fs.iops[{#SNMPVALUE},write]<p>Update: 60</p><p>LLD</p>|
|Name of pool #$1|<p>The name of the filesystem type Volume</p>|`SNMP agent`|zfsPoolName[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Read bandwidth on pool {#SNMPVALUE}|<p>the bandwidth of all read operations (including metadata), expressed as units per second</p>|`SNMP agent`|vfs.fs.bandwidth[{#SNMPVALUE},read]<p>Update: 60</p><p>LLD</p>|
|Size of pool {#SNMPVALUE}|<p>The number of bytes (rounded to 1 MB blocks) part of the volume.</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE},total]<p>Update: 60</p><p>LLD</p>|
|Usage of pool {#SNMPVALUE}|<p>Used percentage of the pools capacity</p>|`Calculated`|vfs.fs.size[{#SNMPVALUE},pfree]<p>Update: 60</p><p>LLD</p>|
|Used bytes on pool {#SNMPVALUE}|<p>The number of bytes (rounded to 1 MB blocks) that are used.</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE},used]<p>Update: 60</p><p>LLD</p>|
|Write bandwidth on pool {#SNMPVALUE}|<p>the bandwidth of all write operations expressed as units per second</p>|`SNMP agent`|vfs.fs.bandwidth[{#SNMPVALUE},write]<p>Update: 60</p><p>LLD</p>|
|Allocation units for storage $1|<p>The size, in bytes, of the data objects allocated from this pool. If this entry is monitoring sectors, blocks, buffers, or packets, for example, this number will commonly be greater than one. Otherwise this number will typically be one.</p>|`SNMP agent`|hrStorageAllocationUnits[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Description of storage $1|<p>A description of the type and instance of the storage described by this entry.</p>|`SNMP agent`|hrStorageDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Total disk space on $1|<p>This is a calculated item, we need it to get total disk space in bytes.</p>|`Calculated`|hrStorageSizeInBytes[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Total disk space on $1 in units|<p>The size of the storage represented by this entry, in units of hrStorageAllocationUnits. This object is writable to allow remote configuration of the size of the storage area in those cases where such an operation makes sense and is possible on the underlying system. For example, the amount of main memory allocated to a buffer pool might be modified or the amount of disk space allocated to virtual memory might be modified.</p>|`SNMP agent`|hrStorageSize[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Used disk space on $1|<p>This is a calculated item, we need it to get used disk space in bytes.</p>|`Calculated`|hrStorageUsedInBytes[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Used disk space on $1 in units|<p>The amount of the storage represented by this entry that is allocated, in units of hrStorageAllocationUnits.</p>|`SNMP agent`|hrStorageUsed[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Utilization of processor #$1|<p>The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.</p>|`SNMP agent`|hrProcessorLoad[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {SNMP FreeNAS:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
|Free disk space is less than 20% on volume {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {SNMP FreeNAS:hrStorageUsed[{#SNMPVALUE}].last(0)} / {SNMP FreeNAS:hrStorageSize[{#SNMPVALUE}].last(0)} > 0.8</p><p>**Recovery expression**: </p>|warning|
|Pool {#SNMPVALUE} is DEGRADED!|<p>Your pool {#SNMPVALUE} is in degraded state. online(1), degraded(2), faulted(3), unknown(4)</p>|<p>**Expression**: {SNMP FreeNAS:zfsPoolHealth[{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|high|
|Pool {#SNMPVALUE} is FAULTED!|<p>Your pool {#SNMPVALUE} is in faulted state. You are in trouble</p>|<p>**Expression**: {SNMP FreeNAS:zfsPoolHealth[{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|disaster|
|Pool {#SNMPVALUE} is in UNKNOWN state|<p>Your pool {#SNMPVALUE} is in unknown state. You are in trouble, I really hope you have a backup</p>|<p>**Expression**: {SNMP FreeNAS:zfsPoolHealth[{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|Pool {#SNMPVALUE} usage is over 80%|<p>Your pool {#SNMPVALUE} is more than 80% full! It is a known fact that performance will degrade significantly. Please free up some space.</p>|<p>**Expression**: {SNMP FreeNAS:vfs.fs.size[{#SNMPVALUE},pfree].last(0)}>80</p><p>**Recovery expression**: </p>|average|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {SNMP FreeNAS:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
|Pool {#SNMPVALUE} is DEGRADED! (LLD)|<p>Your pool {#SNMPVALUE} is in degraded state. online(1), degraded(2), faulted(3), unknown(4)</p>|<p>**Expression**: {SNMP FreeNAS:zfsPoolHealth[{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|high|
|Pool {#SNMPVALUE} is FAULTED! (LLD)|<p>Your pool {#SNMPVALUE} is in faulted state. You are in trouble</p>|<p>**Expression**: {SNMP FreeNAS:zfsPoolHealth[{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|disaster|
|Pool {#SNMPVALUE} is in UNKNOWN state (LLD)|<p>Your pool {#SNMPVALUE} is in unknown state. You are in trouble, I really hope you have a backup</p>|<p>**Expression**: {SNMP FreeNAS:zfsPoolHealth[{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|Pool {#SNMPVALUE} usage is over 80% (LLD)|<p>Your pool {#SNMPVALUE} is more than 80% full! It is a known fact that performance will degrade significantly. Please free up some space.</p>|<p>**Expression**: {SNMP FreeNAS:vfs.fs.size[{#SNMPVALUE},pfree].last(0)}>80</p><p>**Recovery expression**: </p>|average|
|Free disk space is less than 20% on volume {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {SNMP FreeNAS:hrStorageUsed[{#SNMPVALUE}].last(0)} / {SNMP FreeNAS:hrStorageSize[{#SNMPVALUE}].last(0)} > 0.8</p><p>**Recovery expression**: </p>|warning|
