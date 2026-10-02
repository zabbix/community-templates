# Hikvision

## Overview

### Brief information:


Template for Hikvision company NVR's (Network Video Recorder) using SNMPv2. Tested on Zabbix v4.4 and Hikvision NVR 9664-i8


### Information covered by a template:


* Low Level Discovery
	+ LLD of installed HDD's statuses
	+ LLD of installed HDD's capacity
	+ LLD of installed HDD's free space
* Triggers
	+ HDD count change
	+ HDD state change
* Items
	+ Count of installed HDD's
	+ Device uptime
	+ Number of NIC
	+ Device description
* Mappings
	+ HDD disk state mappings


## Author

Omar Bayramov, David Sitnikov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DIskVolume|<p>-</p>|`SNMP agent`|hikDiskVolume<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Installed HDD count|<p>-</p>|`SNMP agent`|hikDiskNum.0<p>Update: 6h</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 4h</p>|
|Number of network interfaces|<p>The number of network interfaces (regardless of their current state) present on this system.</p>|`SNMP agent`|ifNumber<p>Update: 1h</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|HDD capability on {#HIKDINDEX}|<p>-</p>|`SNMP agent`|hikDiskCapability[{#HIKDINDEX}]<p>Update: 12h</p><p>LLD</p>|
|HDD free space on {#HIKDINDEX}|<p>-</p>|`SNMP agent`|hikDiskFreeSpace[{#HIKDINDEX}]<p>Update: 3h</p><p>LLD</p>|
|HDD Status on {#HIKDINDEX}|<p>-</p>|`SNMP agent`|hikDiskStatus[{#HIKDINDEX}]<p>Update: 30m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

