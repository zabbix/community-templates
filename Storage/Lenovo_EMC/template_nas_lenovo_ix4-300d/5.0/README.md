# Storage Lenovo ix4-300d

## Overview

SNMPv3 Template for Lenovo NAS ix4-300d: this template monitor RAID, FAN , Disk partitions, Connected users, Network interfaces and device temperature. 


- 11 items


- 5 Triggers


- 8 Discovery 


 



## Author

Hamdi Ben Abdallah

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_AUTH}|<p>-</p>|`pass`|Text macro|
|{$SNMP_SECNAME}|<p>-</p>|`user`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Connected Clients|<p>Protocol used by this kind of clients</p>|`SNMP agent`|conProtocol<p>Update: 3600</p>|
|Temperature Sensors|<p>Temperature sensors.</p>|`SNMP agent`|tempName<p>Update: 3600</p>|
|Disk ID|<p>ID of disk in array</p>|`SNMP agent`|diskID<p>Update: 3600</p>|
|Voltage Sensors|<p>Name of the volt sensor.</p>|`SNMP agent`|voltName<p>Update: 3600</p>|
|Disk Partitions|<p>The (conceptual) table of logical storage areas on the host. An entry shall be placed in the storage table for each logical area of storage that is allocated and has fixed resource limits. The amount of storage represented in an entity is the amount actually usable by the requesting entity, and excludes loss due to formatting or file system reference information. These entries are associated with logical storage areas, as might be seen by an application, rather than physical storage entities which are typically seen by an operating system. Storage such as tapes and floppies without file systems on them are typically not allocated in chunks by the operating system to requesting applications, and therefore shouldn't appear in this table. Examples of valid storage for this table include disk partitions, file systems, ram (for some architectures this is further segmented into regular memory, extended memory, and so on), backing store for virtual memory (`swap space'). This table is intended to be a useful diagnostic for `out of memory' and `out of buffers' types of failures. In addition, it can be a useful performance monitoring tool for tracking memory, disk, or buffer usage.</p>|`SNMP agent`|hrStorageDescr<p>Update: 3600</p>|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.</p>|`SNMP agent`|ifDescr<p>Update: 3600</p>|
|Fan Sensors|<p>Name of the fan sensor.</p>|`SNMP agent`|fanName<p>Update: 3600</p>|
|Disk Names|<p>An entry of one disk I/O performance.</p>|`SNMP agent`|diskName<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device name|<p>-</p>|`SNMP agent`|deviceName<p>Update: 28800</p>|
|Media service status|<p>-</p>|`SNMP agent`|mediaServiceEnabled<p>Update: 1800</p>|
|Raid Level Configured|<p>Raid Level configured on device.</p>|`SNMP agent`|raidLevel<p>Update: 3600</p>|
|Memory size|<p>The amount of physical read-write main memory, typically RAM, contained by the host.</p>|`SNMP agent`|hrMemorySize<p>Update: 3600</p>|
|Raid Status|<p>-</p>|`SNMP agent`|raidStatus<p>Update: 600</p>|
|Number of processes|<p>The number of process contexts currently loaded or running on this system.</p>|`SNMP agent`|hrSystemProcesses<p>Update: 600</p>|
|Device description|<p>-</p>|`SNMP agent`|deviceDescr<p>Update: 28800</p>|
|System uptime|<p>The time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUptime<p>Update: 300</p>|
|Maximum number of processes|<p>The maximum number of process contexts this system can support. If there is no fixed maximum, the value should be zero. On systems that have a fixed maximum this object can help diagnose failures that occur when this maximum is reached.</p>|`SNMP agent`|hrSystemMaxProcesses<p>Update: 7200</p>|
|Remote access status|<p>-</p>|`SNMP agent`|raEnabled<p>Update: 1800</p>|
|Device uptime|<p>The amount of time since this host was last initialized. Note that this is different from sysUpTime in the SNMPv2-MIB [RFC1907] because sysUpTime is the uptime of the network management portion of the system.</p>|`SNMP agent`|hrSystemUptime<p>Update: 300</p>|
|Connected client count of protocol $1|<p>-</p>|`SNMP agent`|conCount[{#SNMPVALUE}]<p>Update: 600</p><p>LLD</p>|
|Temperature of $1|<p>-</p>|`SNMP agent`|tempValue[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Disk size of $1|<p>Capacity of disk</p>|`SNMP agent`|diskSize[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Disk status of $1|<p>Status of Disk. There are four status: NORMAL FOREIGN FAULTED MISSING</p>|`SNMP agent`|diskStatus[{#SNMPVALUE}]<p>Update: 600</p><p>LLD</p>|
|Voltage of $1|<p>The voltage in V</p>|`SNMP agent`|voltValue[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Allocations Units on $1|<p>The size, in bytes, of the data objects allocated from this pool. If this entry is monitoring sectors, blocks, buffers, or packets, for example, this number will commonly be greater than one. Otherwise this number will typically be one.</p>|`SNMP agent`|hrStorageAllocationUnits[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Storage total size in Bytes on $1|<p>The real size of the storage in Bytes. hrStorageSize * hrStorageAllocationUnits.</p>|`Calculated`|hrStorageSizeInBytes[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Storage total size on $1|<p>The size of the storage represented by this entry, in units of hrStorageAllocationUnits. This object is writable to allow remote configuration of the size of the storage area in those cases where such an operation makes sense and is possible on the underlying system. For example, the amount of main memory allocated to a buffer pool might be modified or the amount of disk space allocated to virtual memory might be modified.</p>|`SNMP agent`|hrStorageSize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Storage used in Bytes on $1|<p>The storage used in Bytes. hrStorageUsed * hrStorageAllocationUnits.</p>|`Calculated`|hrStorageUsedInBytes[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Storage used on $1|<p>The amount of the storage represented by this entry that is allocated, in units of hrStorageAllocationUnits.</p>|`SNMP agent`|hrStorageUsed[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Description of interface $1|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Physical Address of interface $1|<p>The interface's address at the protocol layer immediately `below' the network layer in the protocol stack. For interfaces which do not have such an address (e.g., a serial line), this object should contain an octet string of zero length.</p>|`SNMP agent`|ifPhysAddress[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|Rotation speed of $1|<p>-</p>|`SNMP agent`|fanValue[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO average queue length of $1|<p>Average queue length.</p>|`SNMP agent`|ioAvgQueue[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO average service time at disk of $1|<p>Average service time at disk.</p>|`SNMP agent`|ioAvgSvc[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO average disk utilization of $1|<p>Average disk utilization.</p>|`SNMP agent`|ioAvgUtil[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO average waiting time of $1|<p>Average waiting time (queue + service)</p>|`SNMP agent`|ioAvgWait[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO CPU time (%) of $1|<p>Percentage of CPU time during which I/O requests were issued to the device.</p>|`SNMP agent`|ioCpuTime[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO kilobytes read per second of $1|<p>Kilobytes read per second.</p>|`SNMP agent`|ioKbrs[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO kilobytes write per second of $1|<p>Kilobytes written per second.</p>|`SNMP agent`|ioKbws[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO read merges per second of $1|<p>Read merges per second.</p>|`SNMP agent`|ioMgrs[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO write merges per second of $1|<p>Write merges per second.</p>|`SNMP agent`|ioMgws[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO read requests per second of $1|<p>Read io requests per second.</p>|`SNMP agent`|ioReqrs[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|IO write requests per second of $1|<p>Write io requests per second.</p>|`SNMP agent`|ioReqws[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#SNMPVALUE} status require attention: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Storage Lenovo ix4-300d:diskStatus[{#SNMPVALUE}].str(NORMAL)}=0</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 2% on volume {#SNMPVALUE}|<p>Used: {ITEM.LASTVALUE} Total: {ITEM.LASTVALUE2}</p>|<p>**Expression**: {Storage Lenovo ix4-300d:hrStorageUsedInBytes[{#SNMPVALUE}].last(0)}/{Storage Lenovo ix4-300d:hrStorageSizeInBytes[{#SNMPVALUE}].last(0)} > 0.98</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 10% on volume {#SNMPVALUE}|<p>Used: {ITEM.LASTVALUE} Total: {ITEM.LASTVALUE2}</p>|<p>**Expression**: {Storage Lenovo ix4-300d:hrStorageUsedInBytes[{#SNMPVALUE}].last(0)}/{Storage Lenovo ix4-300d:hrStorageSizeInBytes[{#SNMPVALUE}].last(0)} > 0.9</p><p>**Recovery expression**: </p>|warning|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Storage Lenovo ix4-300d:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
|Temperature of {#SNMPVALUE} is to high: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Storage Lenovo ix4-300d:tempValue[{#SNMPVALUE}].last()}>65</p><p>**Recovery expression**: </p>|average|
|Temperature of {#SNMPVALUE} is to very high: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Storage Lenovo ix4-300d:tempValue[{#SNMPVALUE}].last()}>70</p><p>**Recovery expression**: </p>|high|
|Temperature of {#SNMPVALUE} is to high: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Storage Lenovo ix4-300d:tempValue[{#SNMPVALUE}].last()}>65</p><p>**Recovery expression**: </p>|average|
|Temperature of {#SNMPVALUE} is to very high: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Storage Lenovo ix4-300d:tempValue[{#SNMPVALUE}].last()}>70</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} status require attention: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Storage Lenovo ix4-300d:diskStatus[{#SNMPVALUE}].str(NORMAL)}=0</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 2% on volume {#SNMPVALUE} (LLD)|<p>Used: {ITEM.LASTVALUE} Total: {ITEM.LASTVALUE2}</p>|<p>**Expression**: {Storage Lenovo ix4-300d:hrStorageUsedInBytes[{#SNMPVALUE}].last(0)}/{Storage Lenovo ix4-300d:hrStorageSizeInBytes[{#SNMPVALUE}].last(0)} > 0.98</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 10% on volume {#SNMPVALUE} (LLD)|<p>Used: {ITEM.LASTVALUE} Total: {ITEM.LASTVALUE2}</p>|<p>**Expression**: {Storage Lenovo ix4-300d:hrStorageUsedInBytes[{#SNMPVALUE}].last(0)}/{Storage Lenovo ix4-300d:hrStorageSizeInBytes[{#SNMPVALUE}].last(0)} > 0.9</p><p>**Recovery expression**: </p>|warning|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Storage Lenovo ix4-300d:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
