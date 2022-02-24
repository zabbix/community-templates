# 1wire Temperature Probe

## Description

Automatically finds all 1wire devices and assumes them to be temperature probes. Specifically made for DS18B20 sensor probes in combination with Raspberry Pis. Useful macros: You can assign a friendly name for the probes using the following syntax: {$PROBE:"1wire-ID"} 1wire-ID being the devices name, found under /sys/bus/w1/devices/. The set value will represent the friendly name. You also have the option to assign sensors to three different groups: 0, 1 and 2. This will modify the trigger behaviour for specific sensors. 0 is using a normal temperature range calculated for server rooms, 1 is using an extended range and 2 is disabling triggers completly. You can see the specific values in the trigger section. The macro syntax for this is similar to the friendly name: {$GROUP:"1wire-ID"}

## Overview

*Specifically made for DS18B20 sensor probes in combination with Raspberry Pis. Could & should work on other systems aswell (eventually with small modifications) however it has only been tested on RPIs and DS18B20s.*




---


 This template will automatically find all 1wire devices and assume them to be temperature probes.


It'll create items for every 1wire device it found under "/sys/bus/w1/devices/", convert the output to Celsius (in the correct fashion for DS18B20 probes) and create six threshold triggers aswell as a "no data"-trigger for each one.


To better differentiate between the sensors you can assign a friendly name for probes using the following syntax: {$PROBE:"1wire-ID"}


1wire-ID being the devices name, found under /sys/bus/w1/devices/. The set value will represent the friendly name.


You also have the option to assign sensors to three different groups: 0, 1 and 2. This will modify the trigger behaviour for specific sensors.


0 is using a normal temperature range calculated for server rooms, 1 is using an extended range and 2 is disabling triggers completly. The macro syntax for this is similar to the friendly name: {$GROUP:"1wire-ID"}


The space limit unfortunatly doesn't allow me to tell you the thresholds here, however you can quickly see them in the trigger sections.



## Author

Leonard Winck

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$GROUP}|<p>Default Group</p>|`0`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|1wire devices|<p>-</p>|`Zabbix agent`|system.run[find /sys/bus/w1/devices/28* -maxdepth 1 -type l -printf '%f\n' 2> /dev/null]<p>Update: 15m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Temperature reading of probe "{#DEVICE}" ({$PROBE:"{#DEVICE}"})|<p>-</p>|`Zabbix agent`|system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2  | cut -d= -f2-]<p>Update: 15s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|No data received (>3m) from probe "{$PROBE:"{#DEVICE}"}"|<p>-</p>|<p>**Expression**: {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].nodata(180)}=1</p><p>**Recovery expression**: </p>|not classified|
|Temperature critically high on probe "{$PROBE:"{#DEVICE}"}"|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=30 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<33 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=35 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<38 and 0=1)</p><p>**Recovery expression**: </p>|average|
|Temperature critically low on probe "{$PROBE:"{#DEVICE}"}"|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=14 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<17 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=6 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<10 and 0=1)</p><p>**Recovery expression**: </p>|average|
|Temperature disastrously high on probe "{$PROBE:"{#DEVICE}"}"|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].last()}>=33 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].last()}>=38 and 0=1)</p><p>**Recovery expression**: </p>|disaster|
|Temperature disastrously low on probe "{$PROBE:"{#DEVICE}"}"|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].last()}<14 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].nodata(35)}=0 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].last()}<6 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].nodata(35)}=0 and 0=1)</p><p>**Recovery expression**: </p>|disaster|
|Temperature high on probe "{$PROBE:"{#DEVICE}"}"|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=27 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<30 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=32 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<35 and 0=1)</p><p>**Recovery expression**: </p>|warning|
|Temperature low on probe "{$PROBE:"{#DEVICE}"}"|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=17 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<20 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=10 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<14 and 0=1)</p><p>**Recovery expression**: </p>|warning|
|No data received (>3m) from probe "{$PROBE:"{#DEVICE}"}" (LLD)|<p>-</p>|<p>**Expression**: {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].nodata(180)}=1</p><p>**Recovery expression**: </p>|not classified|
|Temperature critically high on probe "{$PROBE:"{#DEVICE}"}" (LLD)|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=30 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<33 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=35 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<38 and 0=1)</p><p>**Recovery expression**: </p>|average|
|Temperature critically low on probe "{$PROBE:"{#DEVICE}"}" (LLD)|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=14 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<17 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=6 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<10 and 0=1)</p><p>**Recovery expression**: </p>|average|
|Temperature disastrously high on probe "{$PROBE:"{#DEVICE}"}" (LLD)|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].last()}>=33 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].last()}>=38 and 0=1)</p><p>**Recovery expression**: </p>|disaster|
|Temperature disastrously low on probe "{$PROBE:"{#DEVICE}"}" (LLD)|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].last()}<14 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].nodata(35)}=0 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].last()}<6 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].nodata(35)}=0 and 0=1)</p><p>**Recovery expression**: </p>|disaster|
|Temperature high on probe "{$PROBE:"{#DEVICE}"}" (LLD)|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=27 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<30 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=32 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<35 and 0=1)</p><p>**Recovery expression**: </p>|warning|
|Temperature low on probe "{$PROBE:"{#DEVICE}"}" (LLD)|<p>-</p>|<p>**Expression**: ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=17 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<20 and 0=0) or ({1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}>=10 and {1wire-temperature-probe:system.run[cat /sys/bus/w1/devices/{#DEVICE}/w1_slave | tail -n +2 | cut -d= -f2-].avg(180)}<14 and 0=1)</p><p>**Recovery expression**: </p>|warning|
