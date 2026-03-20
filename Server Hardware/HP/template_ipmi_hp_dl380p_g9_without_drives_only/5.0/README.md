# IPMI HP DL380p Gen9 without Drives

## Overview

Simple template to monitor ipmi hp DL380p G9 server by ipmi protocol by iLO interface.


useful with [my hp ipmi Drives discovery template](cat-server-hardware/hp/ipmi-hp-servers-hdd-discovery)


Please first corretly configure ipmi interface on node in zabbix web interface.


This pack contains template: IPMI HP DL380p Gen9 without Drives.xml - contains all sensors except hard drives I prefer use template with noHDD option and my ipmi HDD discovery template.



## Author

Dmitry Lavrukhin

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Power Supply 1|<p>-</p>|`IPMI agent`|PowerSupply1<p>Update: 3600</p>|
|10-Chipset|<p>-</p>|`IPMI agent`|10-Chipset<p>Update: 3600</p>|
|Memory Status|<p>-</p>|`IPMI agent`|MemoryStatus<p>Update: 3600</p>|
|Fans|<p>-</p>|`IPMI agent`|Fans<p>Update: 3600</p>|
|03-CPU 2|<p>-</p>|`IPMI agent`|03-CPU2<p>Update: 3600</p>|
|Megacell Status|<p>-</p>|`IPMI agent`|MegacellStatus<p>Update: 3600</p>|
|Fan 4|<p>-</p>|`IPMI agent`|Fan4<p>Update: 3600</p>|
|Fan 3|<p>-</p>|`IPMI agent`|Fan3<p>Update: 3600</p>|
|Sys Health LED|<p>-</p>|`IPMI agent`|SysHealthLED<p>Update: 3600</p>|
|UID|<p>-</p>|`IPMI agent`|UID<p>Update: 3600</p>|
|Fan 1|<p>-</p>|`IPMI agent`|Fan1<p>Update: 3600</p>|
|40-Battery Zone|<p>-</p>|`IPMI agent`|40-BatteryZone<p>Update: 3600</p>|
|01-Inlet Ambient|<p>-</p>|`IPMI agent`|01-InletAmbient<p>Update: 3600</p>|
|Fan 6|<p>-</p>|`IPMI agent`|Fan6<p>Update: 3600</p>|
|Fan 2|<p>-</p>|`IPMI agent`|Fan2<p>Update: 3600</p>|
|08-HD Max|<p>-</p>|`IPMI agent`|08-HDMax<p>Update: 3600</p>|
|PwrMeter Output|<p>-</p>|`IPMI agent`|PwrMeterOutput<p>Update: 3600</p>|
|Power Supply 2|<p>-</p>|`IPMI agent`|PowerSupply2<p>Update: 3600</p>|
|02-CPU 1|<p>-</p>|`IPMI agent`|02-CPU1<p>Update: 3600</p>|
|Fan 5|<p>-</p>|`IPMI agent`|Fan5<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

