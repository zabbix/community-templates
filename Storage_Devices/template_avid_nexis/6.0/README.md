# SNMP AvidNEXIS-MIB

## Overview

I created a template for basic AVID NEXIS editing platform metrics.


This functions on SNMPv2 and tested with Zabbix v4.0 and NEXIS E2 20.7.5


 


Metrics include:


* Active Client Count
* Event Log Notify
* File Count
* Folder Count
* Highest Disk Used Percentage
* Maximum Client Count
* Data transfer /sec
* Storage read/writes
* Messages /sec
* Product Name
* System Director State
* Memory/RAM
* NEXIS Version
* Workspace count


 


No built-in triggers, but they can easily be created once imported.



## Author

Danielle

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AvidNEXIS-MIB::AvidNEXISMessagesPerSecond|<p>This variable shows the number of messages per second the system director is processing</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.3.4.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISMaximumClientCount|<p>This variable shows the maximum active client count</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.3.7.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISTotalUsedMB|<p>This variable shows how total system usage across all workspaces</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.4.4.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISMegabytesPerSecond|<p>This variable shows total megabytes per second for all connected clients</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.3.1.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISOpenFiles|<p>This variable shows how many open files are currently open</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.3.5.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISWriteMegabytesPerSecond|<p>This variable shows total write megabytes per second for all connected clients</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.3.3.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISTotalAllocatedMB|<p>This variable shows how total allocated megabytes. Allocated size is the sum of all the workspace sizes.</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.4.3.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISFolderCount|<p>This variable shows the number of folders across all workspaces</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.4.6.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISWorkspaceCount|<p>This variable shows how total number of workspaces</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.4.7.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISHighestDiskUsedPercentage|<p>This variable shows the highest percent used across all disks</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.4.1.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISReadMegabytesPerSecond|<p>This variable shows total read megabytes per second for all connected clients</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.3.2.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISWorkspaceRedistributingCount|<p>This variable shows the current number of workspaces currently performing a redistribution.</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.2.4.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISCheckEventLog|<p>This variable shows whether the check event log flag is set.</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.2.3.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISVersion|<p>This variable shows the version of the AvidNEXIS install</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.1.2.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISSystemDirectorState|<p>This variable shows the state of the System Director. 0=Online, 1=Offline, 2=Standby, 3=Unknown</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.2.1.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISFileCount|<p>This variable shows how total number of files across all workspaces</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.4.5.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISTotalSystemMB|<p>This variable shows how total system megabytes</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.4.2.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISSystemDirectorStateString|<p>This variable shows the state of the System Director in string format.</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.2.2.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISActiveClientCount|<p>This variable shows the active client count</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.3.6.0<p>Update: 1h</p>|
|AvidNEXIS-MIB::AvidNEXISProductName|<p>This variable shows the name of the Avid NEXIS product line</p>|`SNMP agent`|.1.3.6.1.4.1.526.20.1.1.0<p>Update: 1h</p>|


## Triggers

There are no triggers in this template.

