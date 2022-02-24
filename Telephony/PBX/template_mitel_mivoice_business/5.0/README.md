# Mitel MiVoice Business

## Overview

Template for Mitel MiVoice Business, formerly known as Mitel Communications Director and Mitel 3300.


Uses SNMP to fetch various Mitel OIDs, most importantly the Alarm State.


Tested with a range of firmware releases from 10.x to 14.x.


 


Fetches:


* Alarm state
* Number of categories in alarm state
* User licenses purchased
* User licenses used
* Disk reads
* Disk writes
* 1min CPU average
* Hardware platform
* Software version


Triggers:


* Alarm state


## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Mitel Software platform|<p>VerSw substring from SNMPv2-MIB::sysDescr.0 = STRING: VerAg:07.00.00.01.00;VerSw:12.0.1.24;VerHw:CX;VerPl:3300 ICP;VerMCD:6.0 SP1</p>|`SNMP agent`|VerSw<p>Update: 1h</p>|
|Number of categories in alarm state|<p>-</p>|`SNMP agent`|mitelIpera3000AlmNbrCategories.0<p>Update: 2m</p>|
|Mitel hardware platform|<p>VerHw substring from SNMPv2-MIB::sysDescr.0 = STRING: VerAg:07.00.00.01.00;VerSw:12.0.1.24;VerHw:CX;VerPl:3300 ICP;VerMCD:6.0 SP1</p>|`SNMP agent`|VerHw<p>Update: 1h</p>|
|MCD alarm state|<p>Alarm level as reported by MCD. Requires investigation.</p>|`SNMP agent`|mitelIpera3000AlmLevel<p>Update: 2m</p>|
|Disk writes|<p>mitelResPerfDiskWrites OBJECT-TYPE SYNTAX Unsigned32 MAX-ACCESS read-only STATUS current DESCRIPTION "The number of write access to this disk since the system reset. " ::= { mitelResDiskPerfEntry 2 }</p>|`SNMP agent`|mitelResPerfDiskWrites.1<p>Update: 2m</p>|
|First alarm category|<p>-</p>|`SNMP agent`|mitelIpera3000CatTblName.1<p>Update: 300s</p>|
|User licenses used|<p>-</p>|`SNMP agent`|mitelIpera3000IPUsrLicUsed<p>Update: 2m</p>|
|Disk reads|<p>mitelResPerfDiskReads OBJECT-TYPE SYNTAX Unsigned32 MAX-ACCESS read-only STATUS current DESCRIPTION "The number of read accesses to this disk since the system reset. " ::= { mitelResDiskPerfEntry 1 }</p>|`SNMP agent`|mitelResPerfDiskReads.1<p>Update: 2m</p>|
|User licenses purchased|<p>-</p>|`SNMP agent`|mitelIpera3000IPUsrLicPurchased<p>Update: 2m</p>|
|1 minute CPU average|<p>DESCRIPTION "The average, over the last minute, the percentage of time that this processor was processing calls. Percentage value (from 0.0 to 100.0) including a single decimal place."</p>|`SNMP agent`|mitelResSystemCallLoad.0<p>Update: 2m</p>|


## Triggers

There are no triggers in this template.

