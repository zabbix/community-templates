# SNMP Tripplite WEBCARDLX

## Overview

This is Zabbix 3.0+ template for Tripplite UPS with option card WEBCARDLX.


Includes 23 items, 1 applications, 15 triggers, 3 Graphs


Monitors power parameters like voltage and frequency, battery charge and status, battery temperature, etc. Has triggers for out of range parameters, power loss, low battery. 



## Author

Dominique Beaulieu

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|upsBatteryStatus|<p>-</p>|`SNMP agent`|upsBatteryStatus<p>Update: 30</p>|
|upsSecondsOnBattery|<p>-</p>|`SNMP agent`|upsSecondsOnBattery<p>Update: 30</p>|
|upsOutputVoltage.1|<p>-</p>|`SNMP agent`|upsOutputVoltage.1<p>Update: 30</p>|
|upsBatteryTemperature|<p>-</p>|`SNMP agent`|upsBatteryTemperature<p>Update: 60</p>|
|upsIdentModel|<p>-</p>|`SNMP agent`|upsIdentModel<p>Update: 86400</p>|
|upsBatteryVoltage|<p>-</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 60</p>|
|upsEstimatedMinutesRemaining|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 30</p>|
|upsBypassVoltage.1|<p>-</p>|`SNMP agent`|upsBypassVoltage.1<p>Update: 30</p>|
|upsEstimatedChargeRemaining|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 60</p>|
|upsIdentAgentSoftwareVersion|<p>-</p>|`SNMP agent`|upsIdentAgentSoftwareVersion<p>Update: 600</p>|
|upsBypassFrequency|<p>-</p>|`SNMP agent`|upsBypassFrequency<p>Update: 30</p>|
|upsInputVoltage.1|<p>-</p>|`SNMP agent`|upsInputVoltage.1<p>Update: 30</p>|
|upsOutputSource|<p>-</p>|`SNMP agent`|upsOutputSource<p>Update: 30</p>|
|upsOutputCurrent.1|<p>-</p>|`SNMP agent`|upsOutputCurrent.1<p>Update: 30</p>|
|upsBypassPower.1|<p>-</p>|`SNMP agent`|upsBypassPower.1<p>Update: 30</p>|
|upsInputFrequency.1|<p>-</p>|`SNMP agent`|upsInputFrequency.1<p>Update: 30</p>|
|upsInputLineBads|<p>-</p>|`SNMP agent`|upsInputLineBads<p>Update: 30</p>|
|upsOutputPower.1|<p>-</p>|`SNMP agent`|upsOutputPower.1<p>Update: 30</p>|
|upsOutputPercentLoad.1|<p>-</p>|`SNMP agent`|upsOutputPercentLoad.1<p>Update: 30</p>|
|upsOutputFrequency|<p>-</p>|`SNMP agent`|upsOutputFrequency<p>Update: 30</p>|
|upsBypassCurrent.1|<p>-</p>|`SNMP agent`|upsBypassCurrent.1<p>Update: 30</p>|
|upsIdentUPSSoftwareVersion|<p>-</p>|`SNMP agent`|upsIdentUPSSoftwareVersion<p>Update: 600</p>|
|upsAlarmsPresent|<p>-</p>|`SNMP agent`|upsAlarmsPresent<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

