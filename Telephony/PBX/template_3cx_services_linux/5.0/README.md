# 3CX Services Linux

## Overview

Template for monitoring 3cx services running on linux, this template contains trigger and items to monitor services related to the 3cx system, the postgresql and nginx database service.


 


Note: As of version 18, the tunnel has been incorporated into the media server and this item/trigger must be disabled or excluded.



## Author

Antony T. N. Peronio

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|3CX Management Console Service|<p>-</p>|`Zabbix agent`|proc.num[,,,3CXManagementConsole]<p>Update: 1m</p>|
|3CX Phone System Service|<p>-</p>|`Zabbix agent`|proc.num[,,,/usr/sbin/3CXPhoneSystem]<p>Update: 1m</p>|
|3CX Tunnel Service|<p>-</p>|`Zabbix agent`|proc.num[,,,3CXTunnel]<p>Update: 1m</p>|
|3CX Call Flow Service|<p>-</p>|`Zabbix agent`|proc.num[,,,3CXCallFlow]<p>Update: 1m</p>|
|3CX Media Server Service|<p>-</p>|`Zabbix agent`|proc.num[,,,3CXMediaServer]<p>Update: 1m</p>|
|Nginx Service|<p>-</p>|`Zabbix agent`|proc.num[,,,nginx]<p>Update: 1m</p>|
|3CX Audio Provider Service|<p>-</p>|`Zabbix agent`|proc.num[,,,3CXAudioProvider]<p>Update: 1m</p>|
|3CX System Service|<p>-</p>|`Zabbix agent`|proc.num[,,,3cxSystemService]<p>Update: 1m</p>|
|3CX Event Notification Manager|<p>-</p>|`Zabbix agent`|proc.num[,,,CloudServicesWatcher]<p>Update: 1m</p>|
|3CX IVR Service|<p>-</p>|`Zabbix agent`|proc.num[,,,3CXIVR]<p>Update: 1m</p>|
|3CX Configuration Service|<p>-</p>|`Zabbix agent`|proc.num[,,,3CXSLDBServ]<p>Update: 1m</p>|
|3CX Queue Manager Service|<p>-</p>|`Zabbix agent`|proc.num[,,,TcxQMsrv]<p>Update: 1m</p>|
|PostgreSQL Service|<p>-</p>|`Zabbix agent`|proc.num[,,,postgres]<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

