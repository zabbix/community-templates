# SBR01

## Overview

This template for **SBR01 air conditioner controller**


Template for 3 conditioners, the rest you can add. Because MIB structure not good for low discovery. 


 


Protocol SNMP v2


Items 95 with low discovery


Graphs 1


 


**Triggers:**


All the air conditioning's stopped


Error on conditioner


No data on {HOST.NAME}


Temperature is above warning threshold in {HOST.NAME} room


 


Template on my [GitHub](https://github.com/pgalonza/Notes/blob/master/administration/zabbix/templates/SBR01.xml) repository


MIBs on my [GitHub](https://github.com/pgalonza/Notes/tree/master/administration/sbr01) repository



## Author

P.V. Galonza

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Conditioners|<p>-</p>|`SNMP agent`|sbr01.conditioners<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Conditioner1 control|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner1.autoOn<p>Update: 15m</p>|
|Conditioner2 temperature IN|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner2.tempIn<p>Update: 2m</p>|
|Conditioner2 temperature OUT|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner2.tempOut<p>Update: 2m</p>|
|Error|<p>-</p>|`SNMP agent`|sbr01.system.error<p>Update: 15m</p>|
|Conditioner2 control|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner2.autoOn<p>Update: 15m</p>|
|Rotation time|<p>-</p>|`SNMP agent`|sbr01.system.rotTime<p>Update: 10m</p>|
|Conditioner3 temperature IN|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner3.tempIn<p>Update: 2m</p>|
|Сonditioner3 error|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner3.error<p>Update: 3m</p>|
|Error response time|<p>-</p>|`SNMP agent`|sbr01.system.timeError<p>Update: 10m</p>|
|Room temperature|<p>-</p>|`SNMP agent`|sbr01.system.tempRoom<p>Update: 2m</p>|
|Conditioner3 uptime|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner3.coolTime<p>Update: 10m</p>|
|Conditioner3 control|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner3.autoOn<p>Update: 15m</p>|
|Conditioner3 state|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner3.state<p>Update: 3m</p>|
|Conditioner3 temperature OUT|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner3.tempOut<p>Update: 2m</p>|
|Emergency temperature|<p>-</p>|`SNMP agent`|sbr01.system.alarmTemp<p>Update: 10m</p>|
|Сonditioner2 error|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner2.error<p>Update: 3m</p>|
|Conditioner1 state|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner1.state<p>Update: 3m</p>|
|Count of conditioners in operation|<p>-</p>|`SNMP agent`|sbr01.system.minCondCnt<p>Update: 10m</p>|
|Conditioner1 temperature OUT|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner1.tempOut<p>Update: 2m</p>|
|Activation threshold|<p>-</p>|`SNMP agent`|sbr01.system.setTemp<p>Update: 10m</p>|
|Сonditioner1 error|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner1.error<p>Update: 3m</p>|
|Conditioner1 uptime|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner1.coolTime<p>Update: 10m</p>|
|Conditioner2 state|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner2.state<p>Update: 3m</p>|
|Conditioner1 temperature IN|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner1.tempIn<p>Update: 2m</p>|
|Uptime|<p>-</p>|`SNMP agent`|sbr01.system.localTimeSec<p>Update: 3h</p>|
|Conditioner2 uptime|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner2.coolTime<p>Update: 10m</p>|
|Conditioner number|<p>-</p>|`SNMP agent`|sbr01.conditioners.conditioner[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

