# SNMP Fortinet Devices v2019

## Overview

Up to date of [Andrea Durante](network_devices/fortigate/fortigate-snmp-template)'s excellent template.


Monitors: Serial N., OS version, Connection num, CPU%, RAM%, Disk (Total and Used), Interface data (link and speed).


Graph for everything.



## Author

Lorenzo Milesi, Andrea Durante

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`SI`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces|<p>-</p>|`SNMP agent`|ifname<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Used storage space|<p>-</p>|`SNMP agent`|fortinetUsedStorage<p>Update: 60</p>|
|Current RAM Usage|<p>-</p>|`SNMP agent`|fortinetCurrentRAMUtil<p>Update: 60</p>|
|Current connections|<p>-</p>|`SNMP agent`|fortinetCurrentConnections<p>Update: 60</p>|
|Total storage space|<p>-</p>|`SNMP agent`|fortinetTotalStorage<p>Update: 3600</p>|
|Serial Number|<p>-</p>|`SNMP agent`|SysmSerialNumber<p>Update: 3600</p>|
|Current CPU Util|<p>-</p>|`SNMP agent`|fortinetCurrentCPUUtil<p>Update: 60</p>|
|Fortinet Uptime|<p>-</p>|`SNMP agent`|fortinetUpTime<p>Update: 30</p>|
|Firmware Version|<p>-</p>|`SNMP agent`|SysmFirmwareVersion<p>Update: 3600</p>|
|Fortinet Used Storage %|<p>-</p>|`Calculated`|fortinetUsedStorage-percent<p>Update: 60</p>|
|Upload $1|<p>-</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Link Speed $1|<p>-</p>|`SNMP agent`|ifHighSpeed[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Download $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

