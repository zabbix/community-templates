# SNMP Riello UPS

## Overview

Basic Riello UPS Template no MIBs needed



## Author

I. Aliaga U.

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$NOMINAL_FREQUENCY}|<p>-</p>|`60`|Text macro|
|{$NOMINAL_VOLTAGE}|<p>-</p>|`230`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Input Lines|<p>-</p>|`SNMP agent`|InputLinesD<p>Update: 30s</p>|
|Bypass Lines|<p>-</p>|`SNMP agent`|BypassLinesD<p>Update: 30s</p>|
|Output Lines|<p>-</p>|`SNMP agent`|OutputLinesD<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Battery Status|<p>-</p>|`SNMP agent`|rupsBatteryStatus.0<p>Update: 60s</p>|
|Estimated Charge Remaining|<p>-</p>|`SNMP agent`|rupsEstimatedChargeRemaining.0<p>Update: 60s</p>|
|Software version|<p>-</p>|`SNMP agent`|rupsIdentUPSSoftwareVersion.0<p>Update: 1d</p>|
|Seconds on Battery|<p>-</p>|`SNMP agent`|rupsSecondsOnBattery.0<p>Update: 60s</p>|
|Battery Voltage|<p>-</p>|`SNMP agent`|rupsBatteryVoltage.0<p>Update: 60s</p>|
|Input Line Bads|<p>-</p>|`SNMP agent`|rupsInputLineBads.0<p>Update: 60s</p>|
|Model name|<p>-</p>|`SNMP agent`|rupsIdentModel.0<p>Update: 1d</p>|
|Bypass frequency|<p>-</p>|`SNMP agent`|rupsBypassFrequency.0<p>Update: 60s</p>|
|Estimated Minutes Remaining|<p>-</p>|`SNMP agent`|rupsEstimatedMinutesRemaining.0<p>Update: 60s</p>|
|Alarms Present|<p>-</p>|`SNMP agent`|upsAlarmsPresent.0<p>Update: 60s</p>|
|Ups Agent Version|<p>-</p>|`SNMP agent`|rupsIdentAgentSoftwareVersion.0<p>Update: 1d</p>|
|Output frequency|<p>-</p>|`SNMP agent`|rupsOutputFrequency.0<p>Update: 60s</p>|
|Battery Temperature|<p>-</p>|`SNMP agent`|rupsBatteryTemperature.0<p>Update: 60s</p>|
|Output source|<p>-</p>|`SNMP agent`|rupsOutputSource.0<p>Update: 60s</p>|
|System Temperature|<p>-</p>|`SNMP agent`|rupsSystemTemperature.0<p>Update: 30s</p>|
|Battery Current|<p>-</p>|`SNMP agent`|rupsBatteryCurrent.0<p>Update: 60s</p>|
|Agent availability|<p>The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 30s</p>|
|Line {#SNMPINDEX} Input Current|<p>-</p>|`SNMP agent`|rupsInputCurrent.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Input Frequency|<p>-</p>|`SNMP agent`|rupsInputFrequency.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Input  True Power|<p>-</p>|`SNMP agent`|rupsInputTruePower.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Input  Voltage|<p>-</p>|`SNMP agent`|rupsInputVolage.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Bypass Current|<p>-</p>|`SNMP agent`|rupsBypassCurrent[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Bypass Power|<p>-</p>|`SNMP agent`|rupsBypassPower[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Bypass Voltage|<p>-</p>|`SNMP agent`|rupsBypassVoltage[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Output Current|<p>-</p>|`SNMP agent`|rupsOutputCurrent.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Output Peak Current|<p>-</p>|`SNMP agent`|rupsOutputPeakCurrent.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Output % Load|<p>-</p>|`SNMP agent`|rupsOutputPercetLoad.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Output Power|<p>-</p>|`SNMP agent`|rupsOutputPower.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Line {#SNMPINDEX} Output Voltage|<p>-</p>|`SNMP agent`|rupsOutputVoltage.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Bypass voltage on line {#SNMPINDEX} below {$NOMINAL_VOLTAGE}|<p>-</p>|<p>**Expression**: max(/SNMP Riello UPS/rupsInputVolage.[{#SNMPINDEX}],#2)<(230*0.9)</p><p>**Recovery expression**: </p>|high|
|Bypass voltage on line {#SNMPINDEX} below {$NOMINAL_VOLTAGE} (LLD)|<p>-</p>|<p>**Expression**: max(/SNMP Riello UPS/rupsInputVolage.[{#SNMPINDEX}],#2)<(230*0.9)</p><p>**Recovery expression**: </p>|high|
