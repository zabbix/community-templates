# Dell PowerEdge M1000e SNMP

## Overview

SNMP template fetching:


 

Statuses:
* Blade status  
* CMC health status  
* Fan status  
* Global status  
* iKVM status  
* IOM status  
* Power status  
* Redundancy status  
* Temperature sensor status  

Hardware info:
* CMC Firmware version  
* Chassis model  
* Chassis service tag  

Metrics:
* Maximal power available to the chassis  
* Total chassis input current  
* Total chassis input power  
* Rating of each power supply  
* Voltage of each power supply  
* Input current for each power supply  
  



## Author

Toni Cherfan

## Macros used

The only defined macros are constants copied from DELL-RAC-MIB. These should not be modified unless you really know what you are doing.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PSU Discovery|<p>-</p>|`SNMP agent`|psu.discovery<p>Update: 3600</p>|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Blade subsystem status|<p>-</p>|`SNMP agent`|blades.status<p>Update: 60</p>|
|CMC health status|<p>-</p>|`SNMP agent`|cmc.status<p>Update: 60</p>|
|Fan subsystem status|<p>-</p>|`SNMP agent`|fan.status<p>Update: 60</p>|
|Global system health status|<p>-</p>|`SNMP agent`|system.status[globalSystemStatus.0]<p>Update: 60</p>|
|iKVM Subsystem status|<p>-</p>|`SNMP agent`|ikvm.status<p>Update: 60</p>|
|IO Module (IOM) subsystem status|<p>-</p>|`SNMP agent`|iom.status<p>Update: 60</p>|
|Power subsystem status|<p>-</p>|`SNMP agent`|power.status<p>Update: 60</p>|
|Redundancy status|drsRedCurrStatus in DELL-RAC-MIB|`SNMP agent`|redundancy.status<p>Update: 60</p>|
|Temperature sensor subsystem status|<p>-</p>|`SNMP agent`|temperature.status<p>Update: 60</p>|
|Firmware version|<p>-</p>|`SNMP agent`|system.hw.firmware<p>Update: 3600</p>|
|Hardware model name|<p>-</p>|`SNMP agent`|system.hw.model<p>Update: 3600</p>|
|Hardware serial number|<p>-</p>|`SNMP agent`|system.hw.serialnumber<p>Update: 3600</p>|
|Maximal chassis power|<p>-</p>|`SNMP agent`|psu.watts.max<p>Update: 3600</p>|
|Total chassis current usage|<p>-</p>|`SNMP agent`|psu.amps.total<p>Update: 60</p>|
|Total chassis power usage|<p>-</p>|`SNMP agent`|psu.watts.total<p>Update: 60</p>|


## Triggers


|Name|Description|Expression|Priority|
|----|-----------|----|----|
|Blade subsystem status is Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/blades.status)={$DELLRAC.STATUS.CRIT}</p><p>**Recovery expression**: </p>|Average|
|Blade subsystem status is Non-Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/blades.status)={$DELLRAC.STATUS.NONCRIT}</p><p>**Recovery expression**: </p>|Warning|
|Blade subsystem status is Non-Recoverable|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/blades.status)={$DELLRAC.STATUS.NONRECOVER}</p><p>**Recovery expression**: </p>|High|
|Blade subsystem status is Unknown|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/blades.status)={$DELLRAC.STATUS.OTHER} or last(/Dell M1000e Blade Chassis/blades.status)={$DELLRAC.STATUS.UNKNOWN}</p><p>**Recovery expression**: </p>|Information|
|CMC status is Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/cmc.status)={$DELLRAC.STATUS.CRIT}</p><p>**Recovery expression**: </p>|Average|
|CMC status is Non-Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/cmc.status)={$DELLRAC.STATUS.NONCRIT}</p><p>**Recovery expression**: </p>|Warning|
|CMC Status is Non-Recoverable|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/cmc.status)={$DELLRAC.STATUS.NONRECOVER}</p><p>**Recovery expression**: </p>|High|
|CMC Status is Unknown|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/cmc.status)={$DELLRAC.STATUS.OTHER} or last(/Dell M1000e Blade Chassis/cmc.status)={$DELLRAC.STATUS.UNKNOWN}</p><p>**Recovery expression**: </p>|Information|
|Fan Status is Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/fan.status)={$DELLRAC.STATUS.CRIT}</p><p>**Recovery expression**: </p>|Average|
|Fan status is Non-Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/fan.status)={$DELLRAC.STATUS.NONCRIT}</p><p>**Recovery expression**: </p>|Warning|
|Fan Status is Non-Recoverable|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/fan.status)={$DELLRAC.STATUS.NONRECOVER}</p><p>**Recovery expression**: </p>|High|
|Fan Status is Unknown|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/fan.status)={$DELLRAC.STATUS.OTHER} or last(/Dell M1000e Blade Chassis/fan.status)={$DELLRAC.STATUS.UNKNOWN}</p><p>**Recovery expression**: </p>|Information|
|Global System Status is Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/system.status[globalSystemStatus.0])={$DELLRAC.STATUS.CRIT}</p><p>**Recovery expression**: </p>|Average|
|Global System Status is Non-Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/system.status[globalSystemStatus.0])={$DELLRAC.STATUS.NONCRIT}</p><p>**Recovery expression**: </p>|Warning|
|Global System Status is Non-Recoverable|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/system.status[globalSystemStatus.0])={$DELLRAC.STATUS.NONRECOVER}</p><p>**Recovery expression**: </p>|High|
|Global System Status is Unknown|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/system.status[globalSystemStatus.0])={$DELLRAC.STATUS.OTHER} or last(/Dell M1000e Blade Chassis/system.status[globalSystemStatus.0])={$DELLRAC.STATUS.UNKNOWN}</p><p>**Recovery expression**: </p>|Information|
|iKVM Status is Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/ikvm.status)={$DELLRAC.STATUS.CRIT}</p><p>**Recovery expression**: </p>|Average|
|iKVM status is Non-Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/ikvm.status)={$DELLRAC.STATUS.NONCRIT}</p><p>**Recovery expression**: </p>|Warning|
|iKVM Status is Non-Recoverable|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/ikvm.status)={$DELLRAC.STATUS.NONRECOVER}</p><p>**Recovery expression**: </p>|High|
|iKVM Status is Unknown|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/ikvm.status)={$DELLRAC.STATUS.OTHER} or last(/Dell M1000e Blade Chassis/ikvm.status)={$DELLRAC.STATUS.UNKNOWN}</p><p>**Recovery expression**: </p>|Information|
|IOM Status is Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/iom.status)={$DELLRAC.STATUS.CRIT}</p><p>**Recovery expression**: </p>|Average|
|IOM status is Non-Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/iom.status)={$DELLRAC.STATUS.NONCRIT}</p><p>**Recovery expression**: </p>|Warning|
|IOM Status is Non-Recoverable|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/iom.status)={$DELLRAC.STATUS.NONRECOVER}</p><p>**Recovery expression**: </p>|High|
|IOM Status is Unknown|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/iom.status)={$DELLRAC.STATUS.OTHER} or last(/Dell M1000e Blade Chassis/iom.status)={$DELLRAC.STATUS.UNKNOWN}</p><p>**Recovery expression**: </p>|Information|
|Power subsystem status is Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/power.status)={$DELLRAC.STATUS.CRIT}</p><p>**Recovery expression**: </p>|Average|
|Power subsystem status is Non-Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/power.status)={$DELLRAC.STATUS.NONCRIT}</p><p>**Recovery expression**: </p>|Warning|
|Power subsystem status is Non-Recoverable|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/power.status)={$DELLRAC.STATUS.NONRECOVER}</p><p>**Recovery expression**: </p>|High|
|Power subsystem status is Unknown|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/power.status)={$DELLRAC.STATUS.OTHER} or last(/Dell M1000e Blade Chassis/power.status)={$DELLRAC.STATUS.UNKNOWN}</p><p>**Recovery expression**: </p>|Information|
|Redundancy status is Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/redundancy.status)={$DELLRAC.STATUS.CRIT}</p><p>**Recovery expression**: </p>|Average|
|Redundancy status is Non-Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/redundancy.status)={$DELLRAC.STATUS.NONCRIT}</p><p>**Recovery expression**: </p>|Warning|
|Redundancy status is Non-Recoverable|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/redundancy.status)={$DELLRAC.STATUS.NONRECOVER}</p><p>**Recovery expression**: </p>|High|
|Redundancy status is Unknown|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/redundancy.status)={$DELLRAC.STATUS.OTHER} or last(/Dell M1000e Blade Chassis/redundancy.status)={$DELLRAC.STATUS.UNKNOWN}</p><p>**Recovery expression**: </p>|Information|
|Temperature sensor subsystem is Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/temperature.status)={$DELLRAC.STATUS.CRIT}</p><p>**Recovery expression**: </p>|Average|
|Temperature sensor subsystem is Non-Critical|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/temperature.status)={$DELLRAC.STATUS.NONCRIT}</p><p>**Recovery expression**: </p>|Warning|
|Temperature sensor subsystem is Non-Recoverable|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/temperature.status)={$DELLRAC.STATUS.NONRECOVER}</p><p>**Recovery expression**: </p>|High|
|Temperature sensor subsystem is Unknown|<p>-</p>|<p>**Expression**: last(/Dell M1000e Blade Chassis/temperature.status)={$DELLRAC.STATUS.OTHER} or last(/Dell M1000e Blade Chassis/temperature.status)={$DELLRAC.STATUS.UNKNOWN}</p><p>**Recovery expression**: </p>|Information|

