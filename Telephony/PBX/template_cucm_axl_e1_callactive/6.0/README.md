# Cisco AXL MGCP monitoring

## Overview

Information from PerfMon API for MGCP E1 ports.


 


needs application user with permission access to PerfMon


macro for username: {$ZABBIX\_APIUSER\_UC}


macro for password: {$ZABBIX\_APIPASS\_UC}



## Author

Andrey

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Port S0_SU1_DS1-3|<p>-</p>|`Dependent item`|apiaxlS0_SU1_DS1-3<p>Update: 0</p>|
|Port S0_SU1_DS1-0|<p>-</p>|`Dependent item`|apiaxlS0_SU1_DS1-0<p>Update: 0</p>|
|Port S0_SU1_DS1-2|<p>-</p>|`Dependent item`|apiaxlS0_SU1_DS1-2<p>Update: 0</p>|
|Cisco MGCP PRI Device XML|<p>-</p>|`HTTP agent`|mgcpxml<p>Update: 30s</p>|
|Port S0_SU1_DS1-1|<p>-</p>|`Dependent item`|apiaxlS0_SU1_DS1-1<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

