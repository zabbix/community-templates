# SNMP FortiSwitch Devices

## Overview

This is a template created starting from Andrea Durante's Fortigate SNMP template, but with modified OIDs from the MIB of the FortiSwitch 124E-PoE device.


Serial No., OS version,% CPU,% RAM, disk (total and used), interface data (link and speed).


Graphs for % CPU, % RAM, disk use and network traffic.



## Author

Sergio Román González

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces|<p>-</p>|`SNMP agent`|ifname<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Firmware Version|<p>-</p>|`SNMP agent`|SysmFirmwareVersion<p>Update: 3600</p>|
|Fortinet Used Storage %|<p>-</p>|`Calculated`|fortinetUsedStorage-percent<p>Update: 60</p>|
|Current CPU Util|<p>-</p>|`SNMP agent`|fortinetCurrentCPUUtil<p>Update: 60</p>|
|Used storage space|<p>-</p>|`SNMP agent`|fortinetUsedStorage<p>Update: 60</p>|
|Total storage space|<p>-</p>|`SNMP agent`|fortinetTotalStorage<p>Update: 3600</p>|
|Fortinet Used RAM %|<p>-</p>|`Calculated`|fortinetUsedMemory-percent<p>Update: 60</p>|
|Serial Number|<p>-</p>|`SNMP agent`|SysmSerialNumber<p>Update: 3600</p>|
|Current RAM Usage|<p>-</p>|`SNMP agent`|fortinetCurrentRAMUtil<p>Update: 60</p>|
|Total RAM Capacity|<p>-</p>|`SNMP agent`|fortinetTotalRAMCapacity<p>Update: 3600</p>|
|Upload $1|<p>-</p>|`SNMP agent`|ifHCOutOctets[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Link Speed $1|<p>-</p>|`SNMP agent`|ifHighSpeed[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Download $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

