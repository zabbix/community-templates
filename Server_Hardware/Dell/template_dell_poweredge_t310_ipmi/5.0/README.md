# IPMI Dell Power Edge T310

## Overview

Simple template for Dell T310 IPMI monitoring.


Contains:


* 4 sensors (Fan, Temp, Power state and consumption)
* 8 triggers (Fan speed too slow, Temp too high, Power down, Power consumption too high)
* 2 graphics (Fan speed + Temp, Power consumption)


Is lightweight, keeps data for 7 days, except for temperature and power consumption (90d)



## Author

Eric N

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fan 1|<p>-</p>|`IPMI agent`|ipmi.fan1.rpm<p>Update: 300</p>|
|Power State|<p>-</p>|`IPMI agent`|ipmi.power.state<p>Update: 300</p>|
|Ambient Temp|<p>-</p>|`IPMI agent`|ipmi.ambient.temp<p>Update: 300</p>|
|Power consumption|<p>-</p>|`IPMI agent`|ipmi.power.consumption<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

