# App Chrony Service

## Overview

This template will parse the various types of data from the acquisition result of chronyc tracking command.  
This allows you to detect the change of the time of displacement and Stratum by chrony.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Chrony Leap status|<p>This is the leap status, which can be Normal, Insert second, Delete second or Not synchronized.</p>|`Zabbix agent (active)`|system.run[chronyc tracking|grep "Leap status"|awk '{print $4}']<p>Update: 1800</p>|
|Number of chrony processes|<p>-</p>|`Zabbix agent`|proc.num[,chrony]<p>Update: 60</p>|
|Version of chrony(d) running|<p>-</p>|`Zabbix agent (active)`|system.run[chronyd --version]<p>Update: 3600</p>|
|Chrony RMS offset|<p>This is a long-term average of the offset value.</p>|`Zabbix agent (active)`|system.run[chronyc tracking|grep "RMS offset"|awk '{print $4}']<p>Update: 1800</p>|
|Chrony Last offset|<p>This is the estimated local offset on the last clock update.</p>|`Zabbix agent (active)`|system.run[chronyc tracking|grep "Last offset"|awk '{print $4}']<p>Update: 1800</p>|
|Chrony Stratum|<p>The stratum indicates how many hops away from a computer with an attached reference clock we are. Such a computer is a stratum-1 computer, so the computer in the example is two hops away</p>|`Zabbix agent (active)`|system.run[chronyc tracking|grep "Stratum"|awk '{print $3}']<p>Update: 1800</p>|
|Chrony synchronized server|<p>This is the reference ID and name (or IP address) if available, of the server to which the computer is currently synchronized.</p>|`Zabbix agent (active)`|system.run[chronyc tracking|grep "Reference ID"|awk '{print $4$5}']<p>Update: 1800</p>|
|Chrony Update interval|<p>This is the total dispersion accumulated through all the computers back to the stratum-1 computer from which the computer is ultimately synchronized. Dispersion is due to system clock resolution, statistical measurement variations etc.</p>|`Zabbix agent (active)`|system.run[chronyc tracking|grep "Update interval"|awk '{print $4}']<p>Update: 1800</p>|
|Chrony Root delay|<p>This is the total of the network path delays to the stratum-1 computer from which the computer is ultimately synchronized. In certain extreme situations, this value can be negative. (This can arise in a symmetric peer arrangement where the computers’ frequencies are not tracking each other and the network delay is very short relative to the turn-around time at each computer.)</p>|`Zabbix agent (active)`|system.run[chronyc tracking|grep "Root delay"|awk '{print $4}']<p>Update: 1800</p>|


## Triggers

There are no triggers in this template.

