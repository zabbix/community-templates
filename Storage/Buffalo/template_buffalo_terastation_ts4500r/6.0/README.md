# Buffalo TeraStation TS4500R

## Overview

Created for this Type of Tera Station:


TS4500R


* Items for all 4 Harddisk with Value Mapping
	+ Disk Status (in Array or Standalone)
	+ Disk SMART Status (with Trigger)
* Array
	+ Capacity
	+ Status (Raidlevel) with Value Mapping
* Failover
	+ Partner
	+ Role (with Trigger) with Value Mapping
	+ Status
* Services with Value Mapping
	+ FTP
	+ Mail Notification
	+ NFS
	+ SFTP
	+ SMB (with Trigger)
* System
	+ Firmware Version
	+ Firmware Update available with Value Mapping
	+ Product Name
	+ Serial Number


 


Template was creating with using the TeraStation MIB File from Manufactor.  
Template contain NOT all possible Items.


 



## Author

Bernhard Linz

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`TeraStation`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disk 2: SMART Status|<p>-</p>|`SNMP agent`|nasDiskSMARTStatus.2<p>Update: 900</p>|
|System: Serial Number|<p>-</p>|`SNMP agent`|nasProductSerialNumber.0<p>Update: 14400</p>|
|Disk 4: Disk Status|<p>-</p>|`SNMP agent`|nasDiskStatus.4<p>Update: 900</p>|
|Disk 1: Disk Status|<p>-</p>|`SNMP agent`|nasDiskStatus.1<p>Update: 900</p>|
|Disk 4: SMART Status|<p>-</p>|`SNMP agent`|nasDiskSMARTStatus.4<p>Update: 900</p>|
|System: Firmware Update available|<p>-</p>|`SNMP agent`|nasIsFWUpdateAvailable.0<p>Update: 14400</p>|
|Failover: Partner|<p>-</p>|`SNMP agent`|nasFailoverPartner<p>Update: 300</p>|
|System: Product Name|<p>-</p>|`SNMP agent`|nasProductName.0<p>Update: 14400</p>|
|Disk 3: Disk Status|<p>-</p>|`SNMP agent`|nasDiskStatus.3<p>Update: 900</p>|
|Service Status: SFTP|<p>-</p>|`SNMP agent`|nasServiceStatusSFTP.0<p>Update: 300</p>|
|Array 1: Capacity|<p>-</p>|`SNMP agent`|nasArrayCapacity.1<p>Update: 3600</p>|
|Array 1: Status|<p>-</p>|`SNMP agent`|nasArrayStatus.1<p>Update: 900</p>|
|Service Status: NFS|<p>-</p>|`SNMP agent`|nasServiceStatusNFS.0<p>Update: 300</p>|
|System: Firmware Version Major|<p>-</p>|`SNMP agent`|nasFWVersionMajor.0<p>Update: 14400</p>|
|Service Status: SMB|<p>-</p>|`SNMP agent`|nasServiceStatusSMB.0<p>Update: 300</p>|
|Disk 1: SMART Status|<p>-</p>|`SNMP agent`|nasDiskSMARTStatus.1<p>Update: 900</p>|
|Failover: Status|<p>-</p>|`SNMP agent`|nasFailoverStatus<p>Update: 300</p>|
|Failover: Role|<p>-</p>|`SNMP agent`|nasFailoverRole<p>Update: 300</p>|
|Service Status: FTP|<p>-</p>|`SNMP agent`|nasServiceStatusFTP.0<p>Update: 300</p>|
|Service Status: Mail Notification|<p>-</p>|`SNMP agent`|nasServiceStatusMailNotification.0<p>Update: 300</p>|
|Disk 2: Disk Status|<p>-</p>|`SNMP agent`|nasDiskStatus.2<p>Update: 900</p>|
|Disk 3: SMART Status|<p>-</p>|`SNMP agent`|nasDiskSMARTStatus.3<p>Update: 900</p>|


## Triggers

There are no triggers in this template.

