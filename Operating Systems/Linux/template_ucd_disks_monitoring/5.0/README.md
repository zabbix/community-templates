# SNMP UCD Disk

## Overview

SNMP Template to poll UCD Disks


Polls the following Stats


diskIONRead The number of bytes read from this device since boot.


diskIONWritten The number of bytes written to this device since boot.


diskIOReads The number of read accesses from this device since boot.


diskIOWrites The number of write accesses to this device since boot.


diskIOLA1 The 1 minute average load of disk (%)


diskIOLA5 The 5 minute average load of disk (%)


diskIOLA15 The 15 minute average load of disk (%)


 


Reference : http://net-snmp.sourceforge.net/docs/mibs/ucdDiskIOMIB.html



## Author

SirLagz

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disks|<p>-</p>|`SNMP agent`|ucdDisk<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disk Load Average 1 Minute of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ucdDiskIOLA1[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Disk Load Average 5 Minutes of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ucdDiskIOLA5[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Disk Load Average 15 Minutes of {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ucdDiskIOLA15[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Bytes Read From Disk Since Boot $1|<p>-</p>|`SNMP agent`|ucdStorageBytesDiskRead[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Bytes Written To Disk Since Boot $1|<p>-</p>|`SNMP agent`|ucdStorageBytesDiskWritten[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Description of Disk $1|<p>-</p>|`SNMP agent`|ucdStorageDesc[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Read Access From Disk Since Boot $1|<p>-</p>|`SNMP agent`|ucdStorageDiskReads[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Write Access To Disk Since Boot $1|<p>-</p>|`SNMP agent`|ucdStorageDiskWrites[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

