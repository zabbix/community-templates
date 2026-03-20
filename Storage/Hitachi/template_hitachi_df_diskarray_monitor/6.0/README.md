# Hitachi DF DiskArray Monitor

## Description

Hitachi_DF_DiskArray_monitor_template Known Issues: device : AMS 2100，AMS 2300，HUS130，HUS150

## Overview

Monitor Template of Hitachi DF DiskArray 


Suitable for AMS 2100, AMS 2300, HUS130, HUS150


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
|Regression Status|<p>-</p>|`SNMP agent`|RegressionStatus<p>Update: 10m</p>|
|Preventive Maintenance Status|<p>-</p>|`SNMP agent`|PreventiveMaintenance<p>Update: 10m</p>|


## Triggers

There are no triggers in this template.

