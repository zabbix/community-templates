# SNMP FreeNAS 11

## Overview

This is based on [https://share.zabbix.com/storage-devices/freenas-snmp-w-zfs-stats](storage-devices/freenas-snmp-w-zfs-stats)  
  
It has more graphs and triggers. It uses the OID as zabbix was having issues parsing the MIB.


Please Note: For ZVols, ZPools and Datasets the data is multiplied by 4096 under PreProcessing. This is the AllocationUnits. All of mine were 4096 so decided this is neater. Obviously this can be changed if required, you can get this data from an SNMP Walk. This could be done automatically by creating a item prototype of allocationUnits, another to get the data in units and then another item prototype to to calculate the value in bytes. Instead of 14 item prototypes; there would be 42. If anyone knows of a better way then please let me know.


Eg: snmpwalk -v 2c -c public 192.168.1.50 FREENAS-MIB::zvolAllocationUnits  
snmpwalk -v 2c -c public 192.168.1.50 FREENAS-MIB::zpoolAllocationUnits  
snmpwalk -v 2c -c public 192.168.1.50 FREENAS-MIB::datasetAllocationUnits  
  
Note: You might get erros if you don't fix the MIB. See bug here:  
<https://forums.freenas.org/index.php?threads/freenas-11-1-snmp-index-out-of-range.62732/>  
  
1) Import the following templates if they are not already  
[https://share.zabbix.com/official-templates/snmp-devices/snmp-interfaces-discovery](official-templates/snmp-devices/snmp-interfaces-discovery)  
[https://share.zabbix.com/official-templates/snmp-devices/snmp-processors-discovery](official-templates/snmp-devices/snmp-processors-discovery)  
[https://share.zabbix.com/official-templates/snmp-devices/snmp-generic](official-templates/snmp-devices/snmp-generic)


2) The FREENAS-MIB.txt will also need to be uploaded to your Zabbix Server. The MIB can be downloaded from your FreeNAS server and is located in /usr/local/share/snmp/mibs/.


3) Import the template  
  
4) Add the host, include the macro {$SNMP\_COMMUNITY}  
  
5) Wait  
  
Memory should be pretty quick while the zpools might take a while.



## Author

Chris Hamer & from previous template FreeNAS Community/Marty Godsey

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template SNMP Generic|
|Template SNMP Interfaces|
|Template SNMP Processors|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ZFS Pools|<p>ZFS pools</p>|`SNMP agent`|zpoolDescr<p>Update: 3600</p>|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescr<p>Update: 3600</p>|
|ZVols|<p>Find all the zvols on the FreeNAS system</p>|`SNMP agent`|zvolDescr<p>Update: 3600</p>|
|Processors|<p>{$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|hrProcessorLoad<p>Update: 3600</p>|
|Datasets|<p>Discover the datasets available on the FreeNAS system</p>|`SNMP agent`|datasetDescr<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Arc meta|<p>Arc meta ?</p>|`SNMP agent`|zfs.Arcmeta<p>Update: 60</p>|
|Arc misses|<p>Arc misses</p>|`SNMP agent`|zfs.ArcMisses<p>Update: 60</p>|
|Swap Error Message|<p>OID: .1.3.6.1.4.1.2021.4.101 Describes whether the amount of available swap space (as reported by 'memAvailSwap(4)'), is less than the desired minimum (specified by 'memMinimumSwap(12)'). http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memSwapErrMsg<p>Update: 60s</p>|
|Arc Cache miss percent|<p>Arc cach miss percentage</p>|`SNMP agent`|zfs.ArcMissPercent<p>Update: 60</p>|
|Arc C|<p>Arc C ?</p>|`SNMP agent`|zfs.ArcC<p>Update: 60</p>|
|ZIL operations per second|<p>ZIL operations per second</p>|`SNMP agent`|zfs.ZilstatOps1sec<p>Update: 60</p>|
|Buffered Memory|<p>Shared Memory OID: .1.3.6.1.4.1.2021.4.14 The total amount of real or virtual memory currently allocated for use as memory buffers. http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memBuff<p>Update: 60s</p>|
|Arc P|<p>Arc P ?</p>|`SNMP agent`|zfs.ArcP<p>Update: 60</p>|
|Shared Memory|<p>Shared Memory OID: .1.3.6.1.4.1.2021.4.13 The total amount of real or virtual memory currently allocated for use as shared memory. http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memShared<p>Update: 60s</p>|
|Total Swap Memory|<p>Total Memory Available OID: .1.3.6.1.4.1.2021.4.3 The total amount of swap space configured for this host. http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memTotalSwap<p>Update: 60s</p>|
|Available Swap Memory|<p>Real Memory Available OID: .1.3.6.1.4.1.2021.4.4 The amount of swap space currently unused or available. http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memAvailSwap<p>Update: 60s</p>|
|Available Real Memory|<p>Real Memory Available OID: .1.3.6.1.4.1.2021.4.6 The amount of real/physical memory currently unused or available. http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memAvailReal<p>Update: 60s</p>|
|Arc size|<p>Arc size iin bytes</p>|`SNMP agent`|zfs.Arcsize<p>Update: 60</p>|
|L2Arc misses|<p>L2Arc misses</p>|`SNMP agent`|zfs.L2ArcMisses<p>Update: 60</p>|
|Arc Cache hit ratio|<p>Arc hit ratio</p>|`SNMP agent`|zfs.ArcHitratio<p>Update: 60</p>|
|Arc Cache miss ratio|<p>Arc cach miss ratio</p>|`SNMP agent`|zfs.ArcMissratio<p>Update: 60</p>|
|Swap Error|<p>OID: .1.3.6.1.4.1.2021.4.100 Indicates whether the amount of available swap space (as reported by 'memAvailSwap(4)'), is less than the desired minimum (specified by 'memMinimumSwap(12)'). http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memSwapErr<p>Update: 60s</p>|
|Cached Memory|<p>Shared Memory OID: .1.3.6.1.4.1.2021.4.15 The total amount of real or virtual memory currently allocated for use as cached memory. http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memCached<p>Update: 60s</p>|
|L2Arc size|<p>L2Arc size iin bytes</p>|`SNMP agent`|zfs.L2Arcsize<p>Update: 60</p>|
|Minimum Swap Memory|<p>OID: .1.3.6.1.4.1.2021.4.12 The minimum amount of swap space expected to be kept free or available during normal operation of this host. If this value (as reported by 'memAvailSwap(4)') falls below the specified level, then 'memSwapError(100)' will be set to 1 and an error message made available via 'memSwapErrorMsg(101)'. http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memMinSwap<p>Update: 60s</p>|
|Total Real Memory|<p>Total Memory Available OID: .1.3.6.1.4.1.2021.4.5 The total amount of real/physical memory allocated for text pages on this host. http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memTotalReal<p>Update: 60s</p>|
|Total Memory Free|<p>Available Swap Available OID: .1.3.6.1.4.1.2021.4.11 The total amount of memory free or available for use on this host. This value typically covers both real memory and swap space or virtual memory. http://www.net-snmp.org/docs/mibs/ucdavis.html</p>|`SNMP agent`|memTotalFree<p>Update: 60s</p>|
|Arc data|<p>Arc data</p>|`SNMP agent`|zfs.ArcData<p>Update: 60</p>|
|Arc hits|<p>Arc hits</p>|`SNMP agent`|zfs.Archits<p>Update: 60</p>|
|L2Arc hits|<p>L2Arc hits</p>|`SNMP agent`|zfs.L2Archits<p>Update: 60</p>|
|Read bandwidth on pool {#SNMPVALUE}|<p>The bandwidth of all read operations (including metadata), expressed as units per second (over 1 second interval)</p>|`SNMP agent`|vfs.fs.bandwidth[{#SNMPVALUE},read]<p>Update: 60</p><p>LLD</p>|
|Total read bandwidth on pool {#SNMPVALUE}|<p>The bandwidth of all read operations (including metadata), expressed as units per second (averaged since system booted)</p>|`SNMP agent`|vfs.fs.bandwidth[{#SNMPVALUE},read ]<p>Update: 60</p><p>LLD</p>|
|Write bandwidth on pool {#SNMPVALUE}|<p>The bandwidth of all write operations, expressed as units per second (over 1 second interval).</p>|`SNMP agent`|vfs.fs.bandwidth[{#SNMPVALUE},write]<p>Update: 60</p><p>LLD</p>|
|Total write bandwidth on pool {#SNMPVALUE}|<p>The bandwidth of all write operations, expressed as units per second (averaged since system booted).</p>|`SNMP agent`|vfs.fs.bandwidth[{#SNMPVALUE},write ]<p>Update: 60</p><p>LLD</p>|
|Total IO Read Ops on pool {#SNMPVALUE}|<p>The number of read I/O operations sent to the pool or device, including metadata requests (averaged since system booted).</p>|`SNMP agent`|vfs.fs.iops[{#SNMPVALUE},read ]<p>Update: 60</p><p>LLD</p>|
|IO Read Ops on pool {#SNMPVALUE}|<p>The number of read I/O operations sent to the pool or device, including metadata requests (over 1 second interval).</p>|`SNMP agent`|vfs.fs.iops[{#SNMPVALUE},read]<p>Update: 60</p><p>LLD</p>|
|Total IO Write Ops on pool {#SNMPVALUE}|<p>The number of write I/O operations sent to the pool or device (averaged since system booted).</p>|`SNMP agent`|vfs.fs.iops[{#SNMPVALUE},write ]<p>Update: 60</p><p>LLD</p>|
|IO Write Ops on pool {#SNMPVALUE}|<p>The number of write I/O operations sent to the pool or device (over 1 second interval).</p>|`SNMP agent`|vfs.fs.iops[{#SNMPVALUE},write]<p>Update: 60</p><p>LLD</p>|
|Available bytes on pool {#SNMPVALUE}|<p>The number of available bytes on the pool. This is multiplied by the datasetAllocationUnits which is usually 4096. The OID for this is .1.3.6.1.4.1.50536.1.2.1.1.3</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE},free]<p>Update: 60</p><p>LLD</p>|
|Usage of pool {#SNMPVALUE}|<p>Used percentage of the pools capacity</p>|`Calculated`|vfs.fs.size[{#SNMPVALUE},pfree]<p>Update: 60</p><p>LLD</p>|
|Size of pool {#SNMPVALUE}|<p>The size of the pool expressed as bytes</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE},total]<p>Update: 60</p><p>LLD</p>|
|Used bytes on pool {#SNMPVALUE}|<p>The number of used bytes in the pool.</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE},used]<p>Update: 60</p><p>LLD</p>|
|Health of pool {#SNMPVALUE}|<p>The current health of the containing pool, as reported by zpool status. online(0), degraded(1), faulted(2), offline(3), unavail(4), removed(5)</p>|`SNMP agent`|zfsPoolHealth[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Name of pool #$1|<p>The name of the ZFS Pool</p>|`SNMP agent`|zpoolDescr[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Admin status of interface $1|<p>The desired state of the interface.</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Description of interface $1|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Available bytes on zvol {#SNMPVALUE}|<p>The available bytes of each zvol. This is multiplied by the datasetAllocationUnits which is usually 4096. The OID for this is .1.3.6.1.4.1.50536.1.2.1.1.3</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE},free  ]<p>Update: 60s</p><p>LLD</p>|
|Usage of zvol {#SNMPVALUE}|<p>Used percentage of the zvols capacity</p>|`Calculated`|vfs.fs.size[{#SNMPVALUE}, pfree]<p>Update: 60s</p><p>LLD</p>|
|Size of zvol {#SNMPVALUE}|<p>The size of each zvol. This is multiplied by the datasetAllocationUnits which is usually 4096. The OID for this is .1.3.6.1.4.1.50536.1.2.1.1.3</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE}, total]<p>Update: 60s</p><p>LLD</p>|
|Used bytes on zvol {#SNMPVALUE}|<p>The used bytes in each zvol. This is multiplied by the datasetAllocationUnits which is usually 4096. The OID for this is .1.3.6.1.4.1.50536.1.2.1.1.3</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE}, used]<p>Update: 60s</p><p>LLD</p>|
|Utilization of processor #$1|<p>The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.</p>|`SNMP agent`|hrProcessorLoad[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Available bytes on dataset {#SNMPVALUE}|<p>The available bytes of each dataset. This is multiplied by the datasetAllocationUnits which is usually 4096. The OID for this is .1.3.6.1.4.1.50536.1.2.1.1.3</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE},free ]<p>Update: 60s</p><p>LLD</p>|
|Usage of dataset {#SNMPVALUE}|<p>Used percentage of the datasets capacity</p>|`Calculated`|vfs.fs.size[{#SNMPVALUE},pfree ]<p>Update: 60s</p><p>LLD</p>|
|Used bytes on dataset {#SNMPVALUE}|<p>The used bytes in each dataset. This is multiplied by the datasetAllocationUnits which is usually 4096. The OID for this is .1.3.6.1.4.1.50536.1.2.1.1.3</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE},used ]<p>Update: 60s</p><p>LLD</p>|
|Size of dataset {#SNMPVALUE}|<p>The size of each dataset. This is multiplied by the datasetAllocationUnits which is usually 4096. The OID for this is .1.3.6.1.4.1.50536.1.2.1.1.3</p>|`SNMP agent`|vfs.fs.size[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {SNMP FreeNAS 11:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
|Dataset {#SNMPVALUE} usage is over 70%|<p>Your dataset is starting to get full. You might want to increase it's quota or increase the disk space.</p>|<p>**Expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE},pfree ].last(1h)}>70</p><p>**Recovery expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE},pfree ].last(6h)}<65</p>|warning|
|Pool {#SNMPVALUE} is DEGRADED!|<p>Your pool {#SNMPVALUE} is in degraded state. online(0), degraded(1), faulted(2), offline(3), unavail(4), removed(5)</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=1</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|high|
|Pool {#SNMPVALUE} is FAULTED!|<p>Your pool {#SNMPVALUE} is in faulted state. You are in trouble</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|disaster|
|Pool {#SNMPVALUE} is in OFFLINE state|<p>Your pool {#SNMPVALUE} is in offline state. Maybe your pool is locked?</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|high|
|Pool {#SNMPVALUE} is in REMOVED state|<p>Your pool {#SNMPVALUE} is in removed state.</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=5</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|high|
|Pool {#SNMPVALUE} is in UNAVAILABLE state|<p>Your pool {#SNMPVALUE} is in unavailable state.</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|disaster|
|Pool {#SNMPVALUE} usage is over 80%|<p>Your pool {#SNMPVALUE} is more than 80% full! It is a known fact that performance will degrade significantly. Please free up some space.</p>|<p>**Expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE},pfree].last(1h)}>80</p><p>**Recovery expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE},pfree].last(6h)}<78</p>|average|
|Zvol {#SNMPVALUE} usage is over 70%|<p>The zvol is getting full, you may want to increase its space.</p>|<p>**Expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE}, pfree].last(1h)}>70</p><p>**Recovery expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE}, pfree].last(6h)}<65</p>|warning|
|Pool {#SNMPVALUE} is DEGRADED! (LLD)|<p>Your pool {#SNMPVALUE} is in degraded state. online(0), degraded(1), faulted(2), offline(3), unavail(4), removed(5)</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=1</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|high|
|Pool {#SNMPVALUE} is FAULTED! (LLD)|<p>Your pool {#SNMPVALUE} is in faulted state. You are in trouble</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|disaster|
|Pool {#SNMPVALUE} is in OFFLINE state (LLD)|<p>Your pool {#SNMPVALUE} is in offline state. Maybe your pool is locked?</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|high|
|Pool {#SNMPVALUE} is in REMOVED state (LLD)|<p>Your pool {#SNMPVALUE} is in removed state.</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=5</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|high|
|Pool {#SNMPVALUE} is in UNAVAILABLE state (LLD)|<p>Your pool {#SNMPVALUE} is in unavailable state.</p>|<p>**Expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: {SNMP FreeNAS 11:zfsPoolHealth[{#SNMPVALUE}].last()}=0</p>|disaster|
|Pool {#SNMPVALUE} usage is over 80% (LLD)|<p>Your pool {#SNMPVALUE} is more than 80% full! It is a known fact that performance will degrade significantly. Please free up some space.</p>|<p>**Expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE},pfree].last(1h)}>80</p><p>**Recovery expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE},pfree].last(6h)}<78</p>|average|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {SNMP FreeNAS 11:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
|Zvol {#SNMPVALUE} usage is over 70% (LLD)|<p>The zvol is getting full, you may want to increase its space.</p>|<p>**Expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE}, pfree].last(1h)}>70</p><p>**Recovery expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE}, pfree].last(6h)}<65</p>|warning|
|Dataset {#SNMPVALUE} usage is over 70% (LLD)|<p>Your dataset is starting to get full. You might want to increase it's quota or increase the disk space.</p>|<p>**Expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE},pfree ].last(1h)}>70</p><p>**Recovery expression**: {SNMP FreeNAS 11:vfs.fs.size[{#SNMPVALUE},pfree ].last(6h)}<65</p>|warning|
