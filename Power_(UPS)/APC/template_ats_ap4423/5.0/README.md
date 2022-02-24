# APC ATS

## Description

APC Rack Automatic Transfer Switches (rack ATS) provide reliable, redundant rack mount power to single-corded equipment. The rack ATS has dual input power cords supplying power to the connected load. If the primary power source becomes unavailable, the rack ATS will seamlessly source power from the secondary source without interrupting critical loads.

## Overview

APC ATS Template 


Model : AP4423


Update APC To the Last Version. otherwise Snmpget wouldnt work fine.


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Internal APC Sensor|<p>-</p>|`SNMP agent`|apc18953A<p>Update: 5</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|#atsNumInputs|<p>-</p>|`SNMP agent`|atsNumInputs.0<p>Update: 30s</p>|
|atsOutputCurrent|<p>-</p>|`SNMP agent`|atsOutputCurrent.1.1.1<p>Update: 30s</p>|
|atsOutputVoltage|<p>-</p>|`SNMP agent`|atsOutputVoltage.1.1.1<p>Update: 30s</p>|
|atsInputVoltage.1|<p>-</p>|`SNMP agent`|atsInputVoltage.1.1.1<p>Update: 30s</p>|
|System upTIme {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 60s</p>|
|atsInputVoltage.2|<p>-</p>|`SNMP agent`|atsInputVoltage.2.1.1<p>Update: 30s</p>|
|atsOutputVoltage|<p>{#SNMPVALUE}</p>|`SNMP agent`|atsOutputVoltage.["{#SNMPINDEX}"]<p>Update: 5</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

