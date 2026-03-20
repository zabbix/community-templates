# Sugon RackServer Monitor

## Description

Hitachi_DiskArray_monitor_template Known Issues: In some version, the item "nicHealthAllStatus" may be disable device : H620-G30, I620-G30, I840-G30

## Overview

中科曙光服务器snmpv2监控模板，覆盖CPU、内存、硬盘、BMC、网卡、PCIE卡、电源、风扇和系统。


其中网卡监控在部分版本上可能无法使用。


G30型号适用。


将宏{$CLOUD\_SNMP\_COMMUNITY}中默认团体字"public"替换为实际团体字。


Sugon RackServer Monitor Template, covering CPU, menory, disk, BMC, nic, pcie, power, fan and system.


Known Issues: In some version, the item "nicHealthAllStatus" may be disable.


device : H620-G30, I620-G30, I840-G30


Repalce macro {$CLOUD\_SNMP\_COMMUNITY} with your snmp community



## Author

zhangzhefeng

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CLOUD_SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU Health Status|<p>-</p>|`SNMP agent`|cpuHealthAllStatus<p>Update: 10m</p>|
|Disk Health Status|<p>-</p>|`SNMP agent`|hddHealthAllStatus<p>Update: 10m</p>|
|BMC Health Status|<p>-</p>|`SNMP agent`|mBHealthStatus<p>Update: 10m</p>|
|Power Health Status|<p>-</p>|`SNMP agent`|psuHealthAllStatus<p>Update: 10m</p>|
|NIC Health Status|<p>-</p>|`SNMP agent`|nicHealthAllStatus<p>Update: 10m</p>|
|Fan Health Status|<p>-</p>|`SNMP agent`|fanHealthAllStatus<p>Update: 10m</p>|
|PCIE Health Status|<p>-</p>|`SNMP agent`|pCIeHealthAllStatus<p>Update: 10m</p>|
|System Health Status|<p>-</p>|`SNMP agent`|systemHealthStatus<p>Update: 10m</p>|
|Memory Health Status|<p>-</p>|`SNMP agent`|memHealthAllStatus<p>Update: 10m</p>|


## Triggers

There are no triggers in this template.

