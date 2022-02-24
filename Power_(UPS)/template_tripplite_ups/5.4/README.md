# SNMP Tripplite

## Overview

Updated! Fixed an incorrect OID and refined one of the graphs.


This template was made from scratch for a SU20KRT8 (Using the newest Tripplite MIBs. Zabbix devs, come on and write MIB ingestion into the GUI already.). However, it should support any type of single phase UPS and likely 3 phase.


 


I may add line discovery in later. But for now this template should cover everything most will need. Including triggers for temp, battery condition, bypass, voltage changes, etc.


Enjoy and please rate!



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|upsEstimatedMinutesRemaining|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 30</p>|
|upsBatteryStatus|<p>-</p>|`SNMP agent`|upsBatteryStatus<p>Update: 30</p>|
|upsOutputCurrent.1|<p>-</p>|`SNMP agent`|upsOutputCurrent.1<p>Update: 30</p>|
|upsInputFrequency.1|<p>-</p>|`SNMP agent`|upsInputFrequency.1<p>Update: 30</p>|
|upsIdentAgentSoftwareVersion|<p>-</p>|`SNMP agent`|upsIdentAgentSoftwareVersion<p>Update: 600</p>|
|upsIdentModel|<p>-</p>|`SNMP agent`|upsIdentModel<p>Update: 86400</p>|
|upsInputLineBads|<p>-</p>|`SNMP agent`|upsInputLineBads<p>Update: 30</p>|
|upsBatteryVoltage|<p>-</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 60</p>|
|upsAlarmsPresent|<p>-</p>|`SNMP agent`|upsAlarmsPresent<p>Update: 30</p>|
|upsIdentUPSSoftwareVersion|<p>-</p>|`SNMP agent`|upsIdentUPSSoftwareVersion<p>Update: 600</p>|
|upsOutputFrequency|<p>-</p>|`SNMP agent`|upsOutputFrequency<p>Update: 30</p>|
|upsBypassFrequency|<p>-</p>|`SNMP agent`|upsBypassFrequency<p>Update: 30</p>|
|upsBypassVoltage.1|<p>-</p>|`SNMP agent`|upsBypassVoltage.1<p>Update: 30</p>|
|upsBypassCurrent.1|<p>-</p>|`SNMP agent`|upsBypassCurrent.1<p>Update: 30</p>|
|upsInputVoltage.1|<p>-</p>|`SNMP agent`|upsInputVoltage.1<p>Update: 30</p>|
|upsOutputPercentLoad.1|<p>-</p>|`SNMP agent`|upsOutputPercentLoad.1<p>Update: 30</p>|
|upsBypassPower.1|<p>-</p>|`SNMP agent`|upsBypassPower.1<p>Update: 30</p>|
|upsBatteryTemperature|<p>-</p>|`SNMP agent`|upsBatteryTemperature<p>Update: 60</p>|
|upsOutputVoltage.1|<p>-</p>|`SNMP agent`|upsOutputVoltage.1<p>Update: 30</p>|
|upsSecondsOnBattery|<p>-</p>|`SNMP agent`|upsSecondsOnBattery<p>Update: 30</p>|
|upsOutputSource|<p>-</p>|`SNMP agent`|upsOutputSource<p>Update: 30</p>|
|upsEstimatedChargeRemaining|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 60</p>|
|upsOutputPower.1|<p>-</p>|`SNMP agent`|upsOutputPower.1<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

