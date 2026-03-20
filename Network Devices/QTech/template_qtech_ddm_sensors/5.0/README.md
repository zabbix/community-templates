# Qtech_Sensors

## Overview

Template for Qtech. Discovering RX power, TX power, Bias, Voltage and Temp sensors of installed SFP (SFP modules must be with DDM support).


PS: Without triggers. Must be later.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Sensors discovery|<p>-</p>|`SNMP agent`|sensors.discovery<p>Update: 600s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#SNMPVALUE}({#IFDESC}) SFP Bias|<p>-</p>|`SNMP agent`|ddmsensorbias[{#SNMPINDEX}]<p>Update: 600s</p><p>LLD</p>|
|{#SNMPVALUE}({#IFDESC}) SFP RX Power|<p>-</p>|`SNMP agent`|ddmsensorrxpower[{#SNMPINDEX}]<p>Update: 600s</p><p>LLD</p>|
|{#SNMPVALUE}({#IFDESC}) SFP Temp|<p>-</p>|`SNMP agent`|ddmsensortemp[{#SNMPINDEX}]<p>Update: 600s</p><p>LLD</p>|
|{#SNMPVALUE}({#IFDESC}) SFP TX Power|<p>-</p>|`SNMP agent`|ddmsensortxpower[{#SNMPINDEX}]<p>Update: 600s</p><p>LLD</p>|
|{#SNMPVALUE}({#IFDESC}) SFP Voltage|<p>-</p>|`SNMP agent`|ddmsensorvoltage[{#SNMPINDEX}]<p>Update: 600s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

