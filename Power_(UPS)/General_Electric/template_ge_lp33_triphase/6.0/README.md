# UPS GE LP33 - TriPhase

## Description

UPS General Electric - Model LP 33 Trifásica - Cláudio Ferreira

## Overview

Zabbix Template for UPS General Electric (GE) Model LP33 Triphase. Works with generic UPS's SNMP v2c enabled too.


Contains most importante items (49), 9 triggers for alerting and 8 graphics.


Because almost OIDs are generic, this template works with other UPS SNMP v2c enabled.



## Author

Cláudio Ferreira

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Input Voltage Min L2|<p>-</p>|`SNMP agent`|upsInputVoltageMin.2<p>Update: 30s</p>|
|Output Percent Load L3|<p>-</p>|`SNMP agent`|upsOutputPercentLoad.3<p>Update: 30s</p>|
|Bypass Voltage L1|<p>-</p>|`SNMP agent`|upsBypassVoltage.1<p>Update: 30s</p>|
|Output Frequency|<p>-</p>|`SNMP agent`|upsOutputFrequency.0<p>Update: 30s</p>|
|Inverter Status|<p>-</p>|`SNMP agent`|upsInverterOnOff.0<p>Update: 30s</p>|
|Bypass Voltage L2|<p>-</p>|`SNMP agent`|upsBypassVoltage.2<p>Update: 30s</p>|
|Input Voltage L1|<p>-</p>|`SNMP agent`|upsInputVoltage.1<p>Update: 30s</p>|
|Input Line Bads|<p>-</p>|`SNMP agent`|upsInputLineBads.0<p>Update: 30s</p>|
|Battery Status|<p>-</p>|`SNMP agent`|upsBatteryStatus.0<p>Update: 30s</p>|
|Output Voltage L1|<p>-</p>|`SNMP agent`|upsOutputVoltage.1<p>Update: 30s</p>|
|Operating Time|<p>-</p>|`SNMP agent`|upsIdentOperatingTime.0<p>Update: 30s</p>|
|ComProt Version|<p>-</p>|`SNMP agent`|upsIdentComProtVersion.0<p>Update: 1h</p>|
|Input Voltage Max L2|<p>-</p>|`SNMP agent`|upsInputVoltageMax.2<p>Update: 30s</p>|
|Input Frequency|<p>-</p>|`SNMP agent`|upsInputFrequency.2<p>Update: 30s</p>|
|Agent Software Version|<p>-</p>|`SNMP agent`|upsIdentAgentSoftwareVersion.0<p>Update: 1h</p>|
|Bypass Status|<p>-</p>|`SNMP agent`|upsBypassOnOff.0<p>Update: 30s</p>|
|Output Voltage L3|<p>-</p>|`SNMP agent`|upsOutputVoltage.3<p>Update: 30s</p>|
|Output Current L1|<p>-</p>|`SNMP agent`|upsOutputCurrent.1<p>Update: 30s</p>|
|Load Source|<p>-</p>|`SNMP agent`|upsLoadSource.0<p>Update: 30s</p>|
|Output Voltage L2|<p>-</p>|`SNMP agent`|upsOutputVoltage.2<p>Update: 30s</p>|
|Input Voltage Min L3|<p>-</p>|`SNMP agent`|upsInputVoltageMin.3<p>Update: 30s</p>|
|Input Num Lines|<p>-</p>|`SNMP agent`|upsInputNumLines.0<p>Update: 1h</p>|
|Ups Software Version|<p>-</p>|`SNMP agent`|upsIdentUPSSoftwareVersion.0<p>Update: 1h</p>|
|Output Current L3|<p>-</p>|`SNMP agent`|upsOutputCurrent.3<p>Update: 30s</p>|
|Input Voltage L3|<p>-</p>|`SNMP agent`|upsInputVoltage.3<p>Update: 30s</p>|
|Nome|<p>-</p>|`SNMP agent`|upsIdentName.0<p>Update: 1h</p>|
|Battery Temperature|<p>-</p>|`SNMP agent`|upsBatteryTemperature.0<p>Update: 30s</p>|
|Output Percent Load L2|<p>-</p>|`SNMP agent`|upsOutputPercentLoad.2<p>Update: 30s</p>|
|Input Voltage Min L1|<p>-</p>|`SNMP agent`|upsInputVoltageMin.1<p>Update: 30s</p>|
|Battery Charge Method|<p>-</p>|`SNMP agent`|upsBatteryChargeMethod.0<p>Update: 30s</p>|
|Bypass Voltage L3|<p>-</p>|`SNMP agent`|upsBypassVoltage.3<p>Update: 30s</p>|
|Active Alarms Present|<p>-</p>|`SNMP agent`|upsAlarmsPresent.0<p>Update: 30s</p>|
|Output Current L2|<p>-</p>|`SNMP agent`|upsOutputCurrent.2<p>Update: 30s</p>|
|Output Num Lines|<p>-</p>|`SNMP agent`|upsOutputNumLines.0<p>Update: 1h</p>|
|Input Voltage L2|<p>-</p>|`SNMP agent`|upsInputVoltage.2<p>Update: 30s</p>|
|Estimated minutes Remaining|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining.0<p>Update: 30s</p>|
|Output Source Presence|<p>"The present source of output power. The enumeration none(2) indicates that there is no source of output power (and therefore no output power), for example, the system has opened the output breaker.(*)"</p>|`SNMP agent`|upsOutputSource.0<p>Update: 30s</p>|
|Rectifier Status|<p>-</p>|`SNMP agent`|upsRectifierOnOff.0<p>Update: 30s</p>|
|Battery Voltage|<p>-</p>|`SNMP agent`|upsBatteryVoltage.0<p>Update: 30s</p>|
|Serial Number|<p>-</p>|`SNMP agent`|upsIdentUPSSerialNumber.0<p>Update: 1d</p>|
|UPS Mode|<p>-</p>|`SNMP agent`|upsUPSMode.0<p>Update: 30s</p>|
|Estimated Charge Remaining|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining.0<p>Update: 30s</p>|
|Bypass Frequency|<p>-</p>|`SNMP agent`|upsBypassFrequency.0<p>Update: 30s</p>|
|Input Voltage Max L1|<p>-</p>|`SNMP agent`|upsInputVoltageMax.1<p>Update: 30s</p>|
|Input Voltage Max L3|<p>-</p>|`SNMP agent`|upsInputVoltageMax.3<p>Update: 30s</p>|
|Manufacturer|<p>-</p>|`SNMP agent`|upsIdentManufacturer.0<p>Update: 1d</p>|
|Time on Battery|<p>-</p>|`SNMP agent`|upsSecondsOnBattery.0<p>Update: 30s</p>|
|Output Percent Load L1|<p>-</p>|`SNMP agent`|upsOutputPercentLoad.1<p>Update: 30s</p>|
|Model|<p>-</p>|`SNMP agent`|upsIdentModel.0<p>Update: 1d</p>|


## Triggers

There are no triggers in this template.

