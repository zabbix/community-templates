# Synology DiskStation SNMPv3

## Description

A SNMPv3 template to monitor Synology DSM, based on https://share.zabbix.com/storage-devices/synology/synology-diskstation

SHA authpass and AES privpass are hardcoded

**Updates**

  - 2020 April: fixed https://github.com/kko/unifi-zabbix-snmpv3/issues/4

## Overview

**Setup Synology DSM**

Check the official Synology documentation for your version of DSM:  
<https://kb.synology.com/en-us/DSM/help/DSM/AdminCenter/system_snmp>

Go to SNMP settings (`Control Panel > Terminal & SNMP > SNMP`) and tick (enable)
  - "Enable SNMP service"
  - "SNMPv3 service"
  - "Enable SNMP privacy"

Set the username, protocol and password for authentication; and also set protocol and password for "SNMP privacy".
Record the values you set here because you have to replicate them later in Zabbix.


**Setup Zabbix**

1. Import the YAML template file in Zabbix (```Zabbix > Configuration > Templates > Import ```)
2. Create your host and under "Templates", link this template to the host. You can find it by typing its name "Synology DiskStation SNMPv3"
3. Under "Interfaces", add a "SNMP" interface to the host
4. Fill the required fields with the same data you already set in DSM.
    - "Context name": can be left empty
    - "Security name": is the username in DSM
    - "Security level": is "authPriv"
    - "Authentication protocol": same as you set in DSM.   
    - "Authentication passphrase":  Same as you set in DSM under "SNMPv3 service", "Password" field
    - "Privacy protocol": Same as you set in DSM under "Enable SNMP privacy", "Protocol".
    - "Privacy passphrase": Same as you set in DSM under "Enable SNMP privacy", "Password" field

**Troubleshooting**

- If you receive authentication errors, try tos set the Authentication / Privacy protocols to MD5+DES and if this works, then try to upgrade the encrypption step-by-step, changing only one attribute at a time. The choices what Zabbix can support and what is supported in a given version of DSM can be different. Find a common ground with the most strongest crypto. DES, SHA1 and MD5 are not considered cryptographically secure anymore.
- If all looks good, but does not work, try to restart the Zabbix server.


## Author

Helmut Leonhardt

## Macros used

| Name              | Description | Default | Type       |
|-------------------|-------------|---------|------------|
| {$DISK_UTIL_HIGH} | <p>-</p>    |`90`     | Text macro |
| {$DISK_UTIL_WARN} | <p>-</p>    |`80`     | Text macro |
| {$SNMP_AUTHPASS}  | <p>-</p>    |``       | Text macro |
| {$SNMP_PORT}      | <p>-</p>    |`161`    | Text macro |
| {$SNMP_PRIVPASS}  | <p>-</p>    |``       | Text macro |
| {$SNMP_USERNAME}  | <p>-</p>    |``       | Text macro |


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Synology Disk(s)|<p>For all disk entry.</p>|`SNMP agent`|synoDisk.diskTable.diskEntry<p>Update: 1h</p>|
|Synology StorageIO|<p>An entry containing a device and its statistics.</p>|`SNMP agent`|storageIO.storageIOTable.storageIOEntry<p>Update: 1h</p>|
|Network|<p>-</p>|`SNMP agent`|ifMIB.ifMIBObjects.ifXTable.ifXEntry<p>Update: 1h</p>|
|Synology iSCSI LUN|<p>An entry containing iscsi lun information.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry<p>Update: 1h</p>|
|Synology SpaceIO|<p>An entry containing a device and its statistics.</p>|`SNMP agent`|spaceIO.spaceIOTable.spaceIOEntry<p>Update: 1h</p>|
|Synology Disk(s) SMART|<p>An entry containing a disk SMART information.</p>|`SNMP agent`|synologyDiskSMART.diskSMARTTable.diskSMARTEntry<p>Update: 1h</p>|
|Synology RAID Volume(s)|<p>-</p>|`SNMP agent`|synoRaid.raidTable.raidEntry<p>Update: 1h</p>|
|Disk|<p>-</p>|`SNMP agent`|host.hrStorage.hrStorageTable.hrStorageEntry<p>Update: 1h</p>|
|Synology Service(s)|<p>An entry containing Service information.</p>|`SNMP agent`|synologyService.serviceTable.serviceEntry<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Upgrade Available|<p>Checks whether a new version or update of DSM is available</p>|`SNMP agent`|synoSystem.upgradeAvailable<p>Update: 1h</p>|
|Total Swap Available|<p>The amount of swap space currently unused or available.</p>|`SNMP agent`|ucdavis.memory.memAvailSwap<p>Update: 3m</p>|
|CPU User|<p>The percentage of CPU time spent processing user-level code.</p>|`SNMP agent`|synoSystem.ssCpuUser<p>Update: 1m</p>|
|Load Avg 1 min|<p>1 minute load.</p>|`SNMP agent`|synoSystem.laLoadInt.1<p>Update: 1m</p>|
|Load Avg 15 min|<p>15 minute load.</p>|`SNMP agent`|synoSystem.laLoadInt.3<p>Update: 1m</p>|
|Total Shared Memory|<p>The total amount of real or virtual memory currently allocated for use as shared memory.</p>|`SNMP agent`|ucdavis.memory.memShared<p>Update: 3m</p>|
|Total Buffer Memory|<p>The total amount of real or virtual memory currently allocated for use as memory buffers.</p>|`SNMP agent`|ucdavis.memory.memBuffer<p>Update: 3m</p>|
|System Fan Status|<p>Returns error if system fan fails.</p>|`SNMP agent`|synoSystem.systemFanStatus<p>Update: 1m</p>|
|Total Free Memory|<p>The total amount of memory free or available for use on this host.</p>|`SNMP agent`|ucdavis.memory.memTotalFree<p>Update: 3m</p>|
|CPU System|<p>The percentage of CPU time spent processing system-level code, calculated over the last minute.</p>|`SNMP agent`|synoSystem.ssCpuSystem<p>Update: 1m</p>|
|Total Swap Space|<p>The total amount of swap space configured for this host.</p>|`SNMP agent`|ucdavis.memory.memTotalSwap<p>Update: 3m</p>|
|Total Cached Memory|<p>The total amount of real or virtual memory currently allocated for use as cached memory.</p>|`SNMP agent`|ucdavis.memory.memCached<p>Update: 3m</p>|
|Total Physical Available|<p>The amount of real/physical memory currently unused or available.</p>|`SNMP agent`|ucdavis.memory.memAvailReal<p>Update: 3m</p>|
|Power Status|<p>Returns error if power supplies fail</p>|`SNMP agent`|synoSystem.powerStatus<p>Update: 1m</p>|
|Serial Number|<p>Model serial number</p>|`SNMP agent`|synoSystem.serialNumber<p>Update: 1h</p>|
|CPU Idle|<p>The percentage of processor time spent idle, calculated over the last minute.</p>|`SNMP agent`|synoSystem.ssCpuIdle<p>Update: 1m</p>|
|Version|<p>The version of DSM</p>|`SNMP agent`|synoSystem.version<p>Update: 1h</p>|
|System Status|<p>System partition status.</p>|`SNMP agent`|synoSystem.systemStatus<p>Update: 1m</p>|
|Total Physical Memory|<p>The total amount of real/physical memory installed on this host.</p>|`SNMP agent`|ucdavis.memory.memTotalReal<p>Update: 3m</p>|
|CPU Fan Status|<p>Returns error if CPU fan fails.</p>|`SNMP agent`|synoSystem.cpuFanStatus<p>Update: 1m</p>|
|Load Avg 5 min|<p>5 minute load.</p>|`SNMP agent`|synoSystem.laLoadInt.2<p>Update: 1m</p>|
|Model Name|<p>Model name of this NAS.</p>|`SNMP agent`|synoSystem.modelName<p>Update: 1h</p>|
|System Temperature|<p>Temperature of this NAS.</p>|`SNMP agent`|synoSystem.temperature<p>Update: 3m</p>|
|{#SNMPVALUE} Model|<p>Synology disk model name: the disk model name will be showed here.</p>|`SNMP agent`|synoDisk.diskTable.diskEntry.diskModel.[{#SNMPINDEX}]<p>Update: 1d</p><p>LLD</p>|
|{#SNMPVALUE} Status|<p>Synology disk status: each meanings of status represented describe below: [1] Normal: the hard disk functions normally. [2] Initialized: the hard disk has system partition but no data. [3] NotInitialized: the hard disk does not have system in system partition. [4] SystemPartitionFailed: the system partitions on the hard disks are damaged. [5] Crashed: the hard disk has damaged.</p>|`SNMP agent`|synoDisk.diskTable.diskEntry.diskStatus.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE} Bad sectors count|<p>The count of each disk I/O bad sector</p>|`SNMP agent`|synoDisk.diskTable.diskEntry.diskBadSector.[{#SNMPINDEX}]<p>Update: 12h</p><p>LLD</p>|
|{#SNMPVALUE} Temperature|<p>Synology disk temperature: the temperature of each disk uses Celsius degree.</p>|`SNMP agent`|synoDisk.diskTable.diskEntry.diskTemperature.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE} Type|<p>Synology disk type: the type of disk will be showed here, including SATA, SSD and so on.</p>|`SNMP agent`|synoDisk.diskTable.diskEntry.diskType.[{#SNMPINDEX}]<p>Update: 1d</p><p>LLD</p>|
|Storage Load on Disk {#SNMPVALUE}|<p>The load of disk (in %).</p>|`SNMP agent`|storageIO.storageIOTable.storageIOEntry.storageIOLA.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE} byte(s) read since boot|<p>The number of bytes read from this device since boot (32-bit VER.).</p>|`SNMP agent`|storageIO.storageIOTable.storageIOEntry.storageIONRead.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE} byte(s) written since boot|<p>The number of bytes written to this device since boot (32-bit VER.).</p>|`SNMP agent`|storageIO.storageIOTable.storageIOEntry.storageIONWritten.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE} read access(es) since boot|<p>The number of read accesses from this device since boot (32-bit VER.).</p>|`SNMP agent`|storageIO.storageIOTable.storageIOEntry.storageIOReads.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE} write access(es) since boot|<p>The number of write accesses from this device since boot (32-bit VER.).</p>|`SNMP agent`|storageIO.storageIOTable.storageIOEntry.storageIOWrites.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Incomming Packets on Interface {#IFNAME}|<p>The total number of octets received on the interface.</p>|`SNMP agent`|ifMIB.ifMIBObjects.ifXTable.ifXEntry.ifHCInOctets.[{#IFNAME}]<p>Update: 3m</p><p>LLD</p>|
|Outgoing Packets on Interface {#IFNAME}|<p>The total number of octets transmitted out of the interface.</p>|`SNMP agent`|ifMIB.ifMIBObjects.ifXTable.ifXEntry.ifHCOutOctets.[{#IFNAME}]<p>Update: 3m</p><p>LLD</p>|
|Disk Latency Read on LUN {#LUNNAME} ({#LUNUID})|<p>LUN read disk latency.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNDiskLatencyRead[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk Latency Write on LUN {#LUNNAME} ({#LUNUID})|<p>LUN write disk latency.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNDiskLatencyWrite[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|IOPS Read on LUN {#LUNNAME} ({#LUNUID})|<p>LUN read iops.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNIopsRead[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|IOPS Write on LUN {#LUNNAME} ({#LUNUID})|<p>LUN write iops.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNIopsWrite[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|IO Size Read on LUN {#LUNNAME} ({#LUNUID})|<p>LUN average io size when reading.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNIoSizeRead[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|IO Size Write on LUN {#LUNNAME} ({#LUNUID})|<p>LUN average io size when writing.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNIoSizeWrite[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Network Latency TX on LUN {#LUNNAME} ({#LUNUID})|<p>LUN network tx latency.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNNetworkLatencyTx[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Throughput Read High on LUN {#LUNNAME} ({#LUNUID})|<p>LUN read throughput over 32 bits part.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNThroughputReadHigh[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Throughput Read Low on LUN {#LUNNAME} ({#LUNUID})|<p>LUN read throughput over 32 bits part.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNThroughputReadLow[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Throughput Write High on LUN {#LUNNAME} ({#LUNUID})|<p>The higher 32 bit of write throughput.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNThroughputWriteHigh[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Throughput Write Low on LUN {#LUNNAME} ({#LUNUID})|<p>The lower 32 bit of write throughput.</p>|`SNMP agent`|synologyiSCSILUN.iSCSILUNTable.iSCSILUNEntry.iSCSILUNThroughputWriteLow[{#LUNINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Space Load of Disk {#SNMPVALUE}|<p>The load of disk in the volume (%).</p>|`SNMP agent`|spaceIO.spaceIOTable.spaceIOEntry.spaceIOLA.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE} byte(s) read since boot|<p>The number of bytes read from this volume since boot (32-bit ver.).</p>|`SNMP agent`|spaceIO.spaceIOTable.spaceIOEntry.spaceIONRead.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE} read access(es) since boot|<p>The number of read accesses from this volume since boot.</p>|`SNMP agent`|spaceIO.spaceIOTable.spaceIOEntry.spaceIONReads.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE} write accesses since boot|<p>The number of write accesses to this volume since boot (32-bit ver.).</p>|`SNMP agent`|spaceIO.spaceIOTable.spaceIOEntry.spaceIONWrites.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE} byte(s) written since boot|<p>The number of bytes written to this volume since boot (32-bit ver.).</p>|`SNMP agent`|spaceIO.spaceIOTable.spaceIOEntry.spaceIONWritten.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#ATTRNAME} on {#SNMPVALUE}|<p>-</p>|`SNMP agent`|synologyDiskSMART.diskSMARTTable.diskSMARTEntry.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|{#SNMPVALUE} RAID Name|<p>Synology raid name: the name of each raid will be showed here.</p>|`SNMP agent`|synoRaid.raidTable.raidEntry.raidName.[{#SNMPINDEX}]<p>Update: 1d</p><p>LLD</p>|
|{#SNMPVALUE} RAID Status|<p>Synology Raid status: each meanings of status represented describe below: [1] Normal: the raid functions normally. [11] Degrade: degrade happens when a tolerable failure of disk(s) occurs. [12] Crashed: raid has crashed and just uses for read-only operation. Note: other status will be showed when creating or deleting raids, including below status: [2] Repairing, [3] Migrating, [4] Expanding, [5] Deleting, [6] Creating(6), [7] RaidSyncing, [8] RaidParityChecking, [9] RaidAssembling and [10] Canceling.</p>|`SNMP agent`|synoRaid.raidTable.raidEntry.raidStatus.[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Storage Size on {#IFDESCR}|<p>The size of the storage represented by this entry, in units of hrStorageAllocationUnits.</p>|`SNMP agent`|host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageSize[{#IFINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Storage Used on {#IFDESCR} (%)|<p>% of disk space used.</p>|`Calculated`|host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed[{#IFINDEX},pct]<p>Update: 5m</p><p>LLD</p>|
|Storage Used on {#IFDESCR}|<p>The amount of the storage represented by this entry.</p>|`SNMP agent`|host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed[{#IFINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE} Users|<p>Number of users using this service.</p>|`SNMP agent`|synologyService.serviceTable.serviceEntry.serviceUsers.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Disk Space is CRITICAL on {#IFDESCR}|<p>-</p>|<p>**Expression**: last(/Synology DiskStation/host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed[{#IFINDEX},pct])>90</p><p>**Recovery expression**: </p>|high|
|Disk Space is LOW on {#IFDESCR}|<p>-</p>|<p>**Expression**: last(/Synology DiskStation/host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed[{#IFINDEX},pct])>80</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} disk damaged|<p>The disk is damaged</p>|<p>**Expression**: last(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskStatus.[{#SNMPINDEX}])=5</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} partition damaged|<p>Partitions on the disk are damaged</p>|<p>**Expression**: last(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskStatus.[{#SNMPINDEX}])=4</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} disk contains bad sectors|<p>Bad sectors in disk.</p>|<p>**Expression**: last(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskBadSector.[{#SNMPINDEX}])=5</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} temperature|<p>-</p>|<p>**Expression**: avg(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskTemperature.[{#SNMPINDEX}],#4)>60</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} was changed|<p>Disk was changed</p>|<p>**Expression**: (last(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskModel.[{#SNMPINDEX}],#1)<>last(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskModel.[{#SNMPINDEX}],#2))>0</p><p>**Recovery expression**: </p>|information|
|Disk SMART attribute {#ATTRNAME} state was changed on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/Synology DiskStation/synologyDiskSMART.diskSMARTTable.diskSMARTEntry.[{#SNMPINDEX}],#1)<>last(/Synology DiskStation/synologyDiskSMART.diskSMARTTable.diskSMARTEntry.[{#SNMPINDEX}],#2))>0</p><p>**Recovery expression**: </p>|high|
|Raid status on {HOSTNAME}: abnormal|<p>Repairing(2) Migrating(3) Expanding(4) Deleting(5) Creating(6) RaidSyncing(7) RaidParityChecking(8) RaidAssembling(9) Canceling(10)</p>|<p>**Expression**: last(/Synology DiskStation/synoRaid.raidTable.raidEntry.raidStatus.[{#SNMPINDEX}])>1 and last(/Synology DiskStation/synoRaid.raidTable.raidEntry.raidStatus.[{#SNMPINDEX}])<11</p><p>**Recovery expression**: </p>|warning|
|Raid status on {HOSTNAME}: crashed|<p>RAID has crashed and is now read-only.</p>|<p>**Expression**: last(/Synology DiskStation/synoRaid.raidTable.raidEntry.raidStatus.[{#SNMPINDEX}])=12</p><p>**Recovery expression**: </p>|high|
|Raid status on {HOSTNAME}: degrade|<p>Degrade is shown when a tolerable failure of disk(s) occurs.</p>|<p>**Expression**: last(/Synology DiskStation/synoRaid.raidTable.raidEntry.raidStatus.[{#SNMPINDEX}])=11</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} disk damaged (LLD)|<p>The disk is damaged</p>|<p>**Expression**: last(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskStatus.[{#SNMPINDEX}])=5</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} partition damaged (LLD)|<p>Partitions on the disk are damaged</p>|<p>**Expression**: last(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskStatus.[{#SNMPINDEX}])=4</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} temperature (LLD)|<p>-</p>|<p>**Expression**: avg(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskTemperature.[{#SNMPINDEX}],#4)>60</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} was changed (LLD)|<p>Disk was changed</p>|<p>**Expression**: (last(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskModel.[{#SNMPINDEX}],#1)<>last(/Synology DiskStation/synoDisk.diskTable.diskEntry.diskModel.[{#SNMPINDEX}],#2))>0</p><p>**Recovery expression**: </p>|information|
|Disk SMART attribute {#ATTRNAME} state was changed on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/Synology DiskStation/synologyDiskSMART.diskSMARTTable.diskSMARTEntry.[{#SNMPINDEX}],#1)<>last(/Synology DiskStation/synologyDiskSMART.diskSMARTTable.diskSMARTEntry.[{#SNMPINDEX}],#2))>0</p><p>**Recovery expression**: </p>|high|
|Raid status on {HOSTNAME}: abnormal (LLD)|<p>Repairing(2) Migrating(3) Expanding(4) Deleting(5) Creating(6) RaidSyncing(7) RaidParityChecking(8) RaidAssembling(9) Canceling(10)</p>|<p>**Expression**: last(/Synology DiskStation/synoRaid.raidTable.raidEntry.raidStatus.[{#SNMPINDEX}])>1 and last(/Synology DiskStation/synoRaid.raidTable.raidEntry.raidStatus.[{#SNMPINDEX}])<11</p><p>**Recovery expression**: </p>|warning|
|Raid status on {HOSTNAME}: crashed (LLD)|<p>RAID has crashed and is now read-only.</p>|<p>**Expression**: last(/Synology DiskStation/synoRaid.raidTable.raidEntry.raidStatus.[{#SNMPINDEX}])=12</p><p>**Recovery expression**: </p>|high|
|Raid status on {HOSTNAME}: degrade (LLD)|<p>Degrade is shown when a tolerable failure of disk(s) occurs.</p>|<p>**Expression**: last(/Synology DiskStation/synoRaid.raidTable.raidEntry.raidStatus.[{#SNMPINDEX}])=11</p><p>**Recovery expression**: </p>|average|
|Disk Space is CRITICAL on {#IFDESCR} (LLD)|<p>-</p>|<p>**Expression**: last(/Synology DiskStation/host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed[{#IFINDEX},pct])>90</p><p>**Recovery expression**: </p>|high|
|Disk Space is LOW on {#IFDESCR} (LLD)|<p>-</p>|<p>**Expression**: last(/Synology DiskStation/host.hrStorage.hrStorageTable.hrStorageEntry.hrStorageUsed[{#IFINDEX},pct])>80</p><p>**Recovery expression**: </p>|warning|
