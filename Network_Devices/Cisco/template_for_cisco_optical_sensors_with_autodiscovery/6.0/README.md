# Cisco_Sensors

## Overview

This template gets informations from optical sensors in Cisco switches/routes. It will get optical transmit and receive power from each optical interface connected in.


It uses mibs CISCO-ENTITY-SENSOR-MIB and CISCO-ENVMON-MIB.


Do not forget to add this lines to snmp.conf!


mibs +CISCO-ENTITY-SENSOR-MIB  
mibs +CISCO-ENVMON-MIB  
  
After discovery, template finds all connected GBICs and get informations about thresholds and signal levels.


There are triggers included which will be PROBLEM if signal level is out of range or if signal level changes in time.


Just apply template to your box and set macro {$SNMP\_COMMUNITY} to fit your needs.


 


 



## Author

Lukas Macura

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Sensors discovery|<p>-</p>|`SNMP agent`|snmp.discoverysensors<p>Update: 180</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Sensor threshold eval 1: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensorte1[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold severity 2: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensorts2[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold value 4: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensortv4[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold value 3: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensortv3[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold value 2: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensortv2[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold value 1: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensortv1[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold severity 4: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensorts4[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold severity 3: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensorts3[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold severity 1: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensorts1[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold eval 2: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensorte2[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold relation 4: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensortr4[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold relation 3: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensortr3[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold relation 2: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensortr2[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold relation 1: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensortr1[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold eval 4: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensorte4[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor threshold eval 3: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensorte3[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Sensor value: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|sensorvalue[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Sensor {#SNMPVALUE} changed more than 0.1dB!|<p>-</p>|<p>**Expression**: (max(/Cisco_Sensors/sensorvalue[{#SNMPINDEX}],#1)-min(/Cisco_Sensors/sensorvalue[{#SNMPINDEX}],#1))>0.1</p><p>**Recovery expression**: </p>|warning|
|Sensor {#SNMPVALUE} changed more than 1dB!|<p>-</p>|<p>**Expression**: (max(/Cisco_Sensors/sensorvalue[{#SNMPINDEX}],#1)-min(/Cisco_Sensors/sensorvalue[{#SNMPINDEX}],#1))>=1</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (alert)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte1[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts1[{#SNMPINDEX}])=20</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (alert)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte2[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts2[{#SNMPINDEX}])=20</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (alert)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte3[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts3[{#SNMPINDEX}])=20</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (alert)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte4[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts4[{#SNMPINDEX}])=20</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (critical)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte1[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts1[{#SNMPINDEX}])=30</p><p>**Recovery expression**: </p>|disaster|
|Sensor {#SNMPVALUE} over threshold (critical)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte2[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts2[{#SNMPINDEX}])=30</p><p>**Recovery expression**: </p>|disaster|
|Sensor {#SNMPVALUE} over threshold (critical)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte3[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts3[{#SNMPINDEX}])=30</p><p>**Recovery expression**: </p>|disaster|
|Sensor {#SNMPVALUE} over threshold (critical)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte4[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts4[{#SNMPINDEX}])=30</p><p>**Recovery expression**: </p>|disaster|
|Sensor {#SNMPVALUE} over threshold (warning)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte1[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts1[{#SNMPINDEX}])=10</p><p>**Recovery expression**: </p>|average|
|Sensor {#SNMPVALUE} over threshold (warning)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte2[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts2[{#SNMPINDEX}])=10</p><p>**Recovery expression**: </p>|average|
|Sensor {#SNMPVALUE} over threshold (warning)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte3[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts3[{#SNMPINDEX}])=10</p><p>**Recovery expression**: </p>|average|
|Sensor {#SNMPVALUE} over threshold (warning)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte4[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts4[{#SNMPINDEX}])=10</p><p>**Recovery expression**: </p>|average|
|Sensor {#SNMPVALUE} changed more than 0.1dB! (LLD)|<p>-</p>|<p>**Expression**: (max(/Cisco_Sensors/sensorvalue[{#SNMPINDEX}],#1)-min(/Cisco_Sensors/sensorvalue[{#SNMPINDEX}],#1))>0.1</p><p>**Recovery expression**: </p>|warning|
|Sensor {#SNMPVALUE} changed more than 1dB! (LLD)|<p>-</p>|<p>**Expression**: (max(/Cisco_Sensors/sensorvalue[{#SNMPINDEX}],#1)-min(/Cisco_Sensors/sensorvalue[{#SNMPINDEX}],#1))>=1</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (alert) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte1[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts1[{#SNMPINDEX}])=20</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (alert) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte2[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts2[{#SNMPINDEX}])=20</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (alert) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte3[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts3[{#SNMPINDEX}])=20</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (alert) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte4[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts4[{#SNMPINDEX}])=20</p><p>**Recovery expression**: </p>|high|
|Sensor {#SNMPVALUE} over threshold (critical) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte1[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts1[{#SNMPINDEX}])=30</p><p>**Recovery expression**: </p>|disaster|
|Sensor {#SNMPVALUE} over threshold (critical) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte2[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts2[{#SNMPINDEX}])=30</p><p>**Recovery expression**: </p>|disaster|
|Sensor {#SNMPVALUE} over threshold (critical) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte3[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts3[{#SNMPINDEX}])=30</p><p>**Recovery expression**: </p>|disaster|
|Sensor {#SNMPVALUE} over threshold (critical) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte4[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts4[{#SNMPINDEX}])=30</p><p>**Recovery expression**: </p>|disaster|
|Sensor {#SNMPVALUE} over threshold (warning) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte1[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts1[{#SNMPINDEX}])=10</p><p>**Recovery expression**: </p>|average|
|Sensor {#SNMPVALUE} over threshold (warning) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte2[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts2[{#SNMPINDEX}])=10</p><p>**Recovery expression**: </p>|average|
|Sensor {#SNMPVALUE} over threshold (warning) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte3[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts3[{#SNMPINDEX}])=10</p><p>**Recovery expression**: </p>|average|
|Sensor {#SNMPVALUE} over threshold (warning) (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_Sensors/sensorte4[{#SNMPINDEX}])=1 and last(/Cisco_Sensors/sensorts4[{#SNMPINDEX}])=10</p><p>**Recovery expression**: </p>|average|
