# SNMP Reillo UPS

## Overview

 SNMP Template for REILLLO UPS, tested with Zabbix 3.4 (should work in older versions) Battery Status, Input/output load, Alarms. This template requires [Reillo MIB files](http://www.riello-ups.com/downloads/25-netman-204) (RFC1628A.MIB ) to be import into Zabbix server. 



## Author

Sing Kingdavong

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$NOMINAL_FREQUENCY}|<p>-</p>|`50`|Text macro|
|{$NOMINAL_VOLTAGE}|<p>-</p>|`230`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Output lines|<p>-</p>|`SNMP agent`|upsOutputLineIndex<p>Update: 15s</p>|
|Input Lines|<p>-</p>|`SNMP agent`|upsInputLineIndex<p>Update: 15s</p>|
|Bypass lines|<p>-</p>|`SNMP agent`|upsBypassNumLines<p>Update: 15s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Estimated Charge Remaining|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 60s</p>|
|Software version|<p>-</p>|`SNMP agent`|upsIdentUPSSoftwareVersion<p>Update: 86400</p>|
|Output frequency|<p>-</p>|`SNMP agent`|upsOutputFrequency<p>Update: 60s</p>|
|Model name|<p>-</p>|`SNMP agent`|upsIdentModel<p>Update: 86400</p>|
|Seconds on Battery|<p>-</p>|`SNMP agent`|upsSecondsOnBattery<p>Update: 60s</p>|
|Estimated Minutes Remaining|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 60s</p>|
|Output source|<p>-</p>|`SNMP agent`|upsOutputSource<p>Update: 60s</p>|
|Bypass frequency|<p>-</p>|`SNMP agent`|upsBypassFrequency<p>Update: 60s</p>|
|Battery Status|<p>-</p>|`SNMP agent`|upsBatteryStatus<p>Update: 60s</p>|
|Ups Agent Version|<p>-</p>|`SNMP agent`|upsIdentAgentSoftwareVersion<p>Update: 86400</p>|
|Input Line Bads|<p>-</p>|`SNMP agent`|upsInputLineBads<p>Update: 60s</p>|
|Battery Current|<p>-</p>|`SNMP agent`|upsBatteryCurrent<p>Update: 60s</p>|
|Battery Temperature|<p>-</p>|`SNMP agent`|upsBatteryTemperature<p>Update: 60s</p>|
|Alarms Present|<p>-</p>|`SNMP agent`|upsAlarmsPresent<p>Update: 60s</p>|
|Agent availability|<p>The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 30s</p>|
|Battery Voltage|<p>-</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 60s</p>|
|Line {#SNMPVALUE} Output Current|<p>-</p>|`SNMP agent`|upsOutputCurrent[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} Load|<p>-</p>|`SNMP agent`|upsOutputPercentLoad[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} Output Power|<p>-</p>|`SNMP agent`|upsOutputPower[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} Output Voltage|<p>-</p>|`SNMP agent`|upsOutputVoltage[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} Input Current|<p>-</p>|`SNMP agent`|upsInputCurrent[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} Input Frequency|<p>-</p>|`SNMP agent`|upsInputFrequency[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} True Power|<p>-</p>|`SNMP agent`|upsInputTruePower[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} Input Voltage|<p>-</p>|`SNMP agent`|upsInputVoltage[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} Bypass Current|<p>-</p>|`SNMP agent`|upsBypassCurrent[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} Bypass Power|<p>-</p>|`SNMP agent`|upsBypassPower[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Line {#SNMPVALUE} Bypass Voltage|<p>-</p>|`SNMP agent`|upsBypassVoltage[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Bypass voltage on line {#SNMPVALUE} below {$NOMINAL_VOLTAGE}|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsBypassVoltage[{#SNMPVALUE}].max(#2)}<(230*0.9)</p><p>**Recovery expression**: </p>|high|
|Input line {#SNMPVALUE} frequency not {$NOMINAL_FREQUENCY}|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsInputFrequency[{#SNMPVALUE}].min(#2)}>50+1 or {SNMP Reillo UPS:upsInputFrequency[{#SNMPVALUE}].max(#2)}<(50-1)</p><p>**Recovery expression**: </p>|high|
|Input line {#SNMPVALUE} voltage below {$NOMINAL_VOLTAGE}|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsInputVoltage[{#SNMPVALUE}].max(#2)}<(230*0.9)</p><p>**Recovery expression**: </p>|high|
|Load of output line {#SNMPVALUE} is over 80%|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}>80 and {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}<=90</p><p>**Recovery expression**: </p>|warning|
|Load of output line {#SNMPVALUE} is over 90%|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}>90 and {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}<=95</p><p>**Recovery expression**: </p>|average|
|Load of output line {#SNMPVALUE} is over 95%|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}>95</p><p>**Recovery expression**: </p>|high|
|Output line {#SNMPVALUE} voltage below {$NOMINAL_VOLTAGE}|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsOutputVoltage[{#SNMPVALUE}].max(#2)}<(230*0.9)</p><p>**Recovery expression**: </p>|high|
|Load of output line {#SNMPVALUE} is over 80% (LLD)|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}>80 and {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}<=90</p><p>**Recovery expression**: </p>|warning|
|Load of output line {#SNMPVALUE} is over 90% (LLD)|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}>90 and {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}<=95</p><p>**Recovery expression**: </p>|average|
|Load of output line {#SNMPVALUE} is over 95% (LLD)|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsOutputPercentLoad[{#SNMPVALUE}].min(300)}>95</p><p>**Recovery expression**: </p>|high|
|Output line {#SNMPVALUE} voltage below {$NOMINAL_VOLTAGE} (LLD)|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsOutputVoltage[{#SNMPVALUE}].max(#2)}<(230*0.9)</p><p>**Recovery expression**: </p>|high|
|Input line {#SNMPVALUE} frequency not {$NOMINAL_FREQUENCY} (LLD)|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsInputFrequency[{#SNMPVALUE}].min(#2)}>50+1 or {SNMP Reillo UPS:upsInputFrequency[{#SNMPVALUE}].max(#2)}<(50-1)</p><p>**Recovery expression**: </p>|high|
|Input line {#SNMPVALUE} voltage below {$NOMINAL_VOLTAGE} (LLD)|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsInputVoltage[{#SNMPVALUE}].max(#2)}<(230*0.9)</p><p>**Recovery expression**: </p>|high|
|Bypass voltage on line {#SNMPVALUE} below {$NOMINAL_VOLTAGE} (LLD)|<p>-</p>|<p>**Expression**: {SNMP Reillo UPS:upsBypassVoltage[{#SNMPVALUE}].max(#2)}<(230*0.9)</p><p>**Recovery expression**: </p>|high|
