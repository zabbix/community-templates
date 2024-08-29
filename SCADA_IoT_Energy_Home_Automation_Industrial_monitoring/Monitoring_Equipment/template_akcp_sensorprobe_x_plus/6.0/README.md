# AKCP

## Overview

This template is designed for all SensorProbeX devices from the vendor AKCP.


All connected sensors (humidity and temperature) are automaticly discovered in this template.

The triggers are using the alarm status setup directly on the AKCP sensors, so no thresholds are needed.

This template is tested whith SensorProbeX+.



## Author

Juan Candon - wahezu

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DRYINOUT Sensors Discovery|<p>-</p>|`SNMP agent`|dryinout.sensor.discovery<p>Update: 60</p>|
|Humidity Sensors Discovery|<p>-</p>|`SNMP agent`|humidity.sensor.discovery<p>Update: 60</p>|
|Temperature Sensors Discovery|<p>-</p>|`SNMP agent`|temperature.sensor.discovery<p>Update: 60</p>|
|Water Sensors Discovery|<p>-</p>|`SNMP agent`|water.sensor.discovery<p>Update: 60</p>|


## Value mappings

|Name|Value|mapped to|
|----|------|---------|
|Alarm Status|1|no status|
|Alarm Status|2|normal|
|Alarm Status|3|high warning|
|Alarm Status|4|high critical|
|Alarm Status|5|low warning|
|Alarm Status|6|low critical|
|Alarm Status|7|sensor error|
|Status|0|OK|
|Status|1|CIRITCAL|


