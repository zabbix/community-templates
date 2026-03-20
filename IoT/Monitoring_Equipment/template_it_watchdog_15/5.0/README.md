# ITWatchDog 15

## Overview

This template is forked from the IT\_Watchdog\_100 for use with the IT Watchdog 15.


 


This template includes graphing for the Dew Point, Humidity, and Temperate and notifications on temperatures above 83 and 85 degrees (these can easily be changed to suit your environment).


 


No special configuration or mibs needed. Just import the template, assign the template to the watchdog already loaded into Zabbix, and assign the community string to the host macro in Zabbix.


 


I have only tested this in 3.0 and above. Changes might need to be made to be compatible with earlier versions of Zabbix.



## Author

Justin Pulling

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`CMPublic`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|UnitDewPoint|<p>-</p>|`SNMP agent`|DewP.WatchDog<p>Update: 60</p>|
|UnitTemp|<p>-</p>|`SNMP agent`|Temp.WatchDog<p>Update: 60</p>|
|UnitHumidity|<p>-</p>|`SNMP agent`|Humid.WatchDog<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

