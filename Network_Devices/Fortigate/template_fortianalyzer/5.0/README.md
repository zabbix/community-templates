# SNMP FortiAnalyzer

## Description

Version 1.0 Created by Samuel Martins Repo: https://github.com/slunart/Zabbix-Templates Plesase, install the Fortianalyzer MIB on Zabbix Server FORTINET-FORTIMANAGER-FORTIANALYZER-MIB

## Overview

Hi,


This is my first attempt to create a template for the FortiAnalyzer appliance. In the future, I will update with more items and triggers.  
  
I test on Zabbix 4.4, but I believe it must be compatible with other recent versions.  
  
I used the MIB to extract the OID. Search the Fortinet website for the MIB: FORTINET-FORTIMANAGER-FORTIANALYZER-MIB  
  
You can complement the monitoring with the SNMP templates already existing in Zabbix, such as: "SNMP Devices" and others, it will not generate incompatibility.  
  
My GITHUB repository: <https://github.com/slunart/Zabbix-Templates/tree/master/Fortinet>


  
If you have any problems, send a message, I don't know if I'll be able to solve it, but I'll try.


FortiAnalyzer Website:


<https://www.fortinet.com/products/management/fortianalyzer.html>


Best Regards!



## Author

Samuel Martins

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Connected Device Name|<p>-</p>|`SNMP agent`|fmDeviceEntName<p>Update: 5m</p>|
|Connected Device Ip|<p>-</p>|`SNMP agent`|fmDeviceEntIp<p>Update: 5m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory Capacity|<p>Total physical and swap memory installed (KB)</p>|`SNMP agent`|fmSysMemCapacity<p>Update: 1m</p>|
|Number of administrative domains|<p>The number of administrative domains in fmAdomTable</p>|`SNMP agent`|fmAdomNumber<p>Update: 1m</p>|
|Memory Used|<p>Current memory used (KB)</p>|`SNMP agent`|fmSysMemUsed<p>Update: 1m</p>|
|HA Status|<p>Ha mode</p>|`SNMP agent`|fmHaMode<p>Update: 1m</p>|
|Peer numbers in the HA|<p>Peer numbers in the Ha</p>|`SNMP agent`|fmHaPeerNumber<p>Update: 1m</p>|
|Status of Administrative domains|<p>Whether administrative domains are enabled on this device</p>|`SNMP agent`|fmAdomEnabled<p>Update: 1m</p>|
|Cpu Usage|<p>Current CPU usage (percentage)</p>|`SNMP agent`|fmSysCpuUsage<p>Update: 1m</p>|
|Number of Devices|<p>The number of devices in fmDeviceTable</p>|`SNMP agent`|fmDeviceNumber<p>Update: 1m</p>|
|Disk Usage|<p>Current hard disk usage (MB)</p>|`SNMP agent`|fmSysDiskUsage<p>Update: 1m</p>|
|Serial Number|<p>-</p>|`SNMP agent`|fnSysSerial<p>Update: 1h</p>|
|Disk Capacity|<p>Total hard disk capacity (MB)</p>|`SNMP agent`|fmSysDiskCapacity<p>Update: 1m</p>|
|CPU usage excluded nice processes usage|<p>Current CPU usage excluded nice processes usage (percentage)</p>|`SNMP agent`|fmSysCpuUsageExcludedNice<p>Update: 1m</p>|
|HA Cluster Id|<p>Ha cluster ID</p>|`SNMP agent`|fmHaClusterId<p>Update: 1m</p>|
|Maximum number of administrative domains allowed|<p>The maximum number of administrative domains allowed on the device as allowed by hardware and/or licensing</p>|`SNMP agent`|fmAdomMax<p>Update: 1m</p>|
|Up Time|<p>The 64bit time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|fmSysUpTime<p>Update: 1m</p>|
|Firmware Version|<p>Firmware version of the device</p>|`SNMP agent`|fmSysVersion<p>Update: 5m</p>|
|Connected Device Name {#SNMPINDEX}|<p>-</p>|`SNMP agent`|fmDeviceEntName[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Connected Device IP {#SNMPINDEX}|<p>-</p>|`SNMP agent`|fmDeviceEntIp[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

