# Cisco UCS Standalone SNMP

## Overview

Features:


* LLD for fans
* LLD for disk drives
* LLD for logical disks
* LLD for PSU


 Tested on:


* Cisco UCS C220 M3
* Cisco UCS C220 M4


## Author

Aleksey Kurnosov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DSK dsvr|<p>-</p>|`SNMP agent`|dskdsvr<p>Update: 3600</p>|
|PSU dsvr|<p>-</p>|`SNMP agent`|psudsvr<p>Update: 3600</p>|
|ARR dsvr|<p>-</p>|`SNMP agent`|arrdsvr<p>Update: 3600</p>|
|FAN dsvr|<p>-</p>|`SNMP agent`|fandsvr<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Storage controller status|<p>-</p>|`SNMP agent`|cucsStorageControllerOperState<p>Update: 30</p>|
|{#SNMPVALUE} disk status|<p>-</p>|`SNMP agent`|diskstatus[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} power source status|<p>-</p>|`SNMP agent`|powerstate[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} status|<p>-</p>|`SNMP agent`|status[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} array status|<p>-</p>|`SNMP agent`|arrstatus[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} status|<p>-</p>|`SNMP agent`|fanstatus[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Array {#SNMPVALUE} in degraded state|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/arrstatus[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|high|
|Disk {#SNMPVALUE} in not operate state|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/diskstatus[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} in not operate state|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/fanstatus[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} have problems with power source|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/powerstate[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} in not operate state|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/status[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|high|
|Disk {#SNMPVALUE} in not operate state (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/diskstatus[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} have problems with power source (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/powerstate[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} in not operate state (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/status[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|high|
|Array {#SNMPVALUE} in degraded state (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/arrstatus[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} in not operate state (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco UCS Standalone SNMP/fanstatus[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|high|
