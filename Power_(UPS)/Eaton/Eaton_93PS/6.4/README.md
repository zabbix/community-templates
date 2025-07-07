# Eaton 93PS 10kW

## Overview

Template for Eaton 93PS (built for a 10kW).
Based on Powerware 9150, merged with older eaton mistral template for temp & humidity triggers


70 Items  
12 Triggers



## Author

@sbsrouteur

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|UPS-ACNormal-Voltage|<p>-</p>|`SNMP_AGENT`|UPS-ACNormal-Voltage<p>Update: 30</p>|
|UPS-BatteryChargerFault|<p>-</p>|`SNMP_AGENT`|UPS-BatteryChargerFault<p>Update: 30</p>|
|UPS-BatteryChargeStatus|<p>-</p>|`SNMP_AGENT`|UPS-BatteryChargeStatus<p>Update: 30</p>|
|UPS-BatteryFaultBattery|<p>-</p>|`SNMP_AGENT`|UPS-BatteryFaultBattery<p>Update: 30</p>|
|UPS-BatteryMinutesRemaining|<p>-</p>|`SNMP_AGENT`|UPS-BatteryMinutesRemaining<p>Update: 30</p>|
|UPS-ConfigOutputVoltage|<p>-</p>|`SNMP_AGENT`|UPS-ConfigOutputVoltage<p>Update: 30</p>|
|UPS-Humidity|<p>-</p>|`SNMP_AGENT`|UPS-Humidity<p>Update: 30</p>|
|UPS-Humidity-High|<p>-</p>|`SNMP_AGENT`|UPS-Humidity-High<p>Update: 30</p>|
|UPS-Humidity-Low|<p>-</p>|`SNMP_AGENT`|UPS-Humidity-Low<p>Update: 30</p>|
|UPS-OutputPowerSource|<p>-</p>|`SNMP_AGENT`|UPS-OutputPowerSource<p>Update: 30</p>|
|UPS-Temperature-High|<p>-</p>|`SNMP_AGENT`|UPS-Temperature-High<p>Update: 30</p>|
|UPS-Temperature-Low|<p>-</p>|`SNMP_AGENT`|UPS-Temperature-Low<p>Update: 30</p>|
|UPS-TemperatureLevel|<p>-</p>|`SNMP_AGENT`|UPS-TemperatureLevel<p>Update: 30</p>|
|upsAlarmsPresent.0|<p>-</p>|`SNMP_AGENT`|upsAlarmsPresent.0<p>Update: 30</p>|
|upsAutoRestart.0|<p>-</p>|`SNMP_AGENT`|upsAutoRestart.0<p>Update: 30</p>|
|upsBatteryStatus.0|<p>-</p>|`SNMP_AGENT`|upsBatteryStatus.0<p>Update: 30</p>|
|upsBatteryVoltage.0|<p>-</p>|`SNMP_AGENT`|upsBatteryVoltage.0<p>Update: 30</p>|
|upsBypassFrequency.0|<p>-</p>|`SNMP_AGENT`|upsBypassFrequency.0<p>Update: 30</p>|
|upsBypassNumLines.0|<p>-</p>|`SNMP_AGENT`|upsBypassNumLines.0<p>Update: 30</p>|
|upsBypassVoltage.3|<p>-</p>|`SNMP_AGENT`|upsBypassVoltage.3<p>Update: 30</p>|
|upsConfigAudibleStatus.0|<p>-</p>|`SNMP_AGENT`|upsConfigAudibleStatus.0<p>Update: 30</p>|
|upsConfigHighVoltageTransferPoint.0|<p>-</p>|`SNMP_AGENT`|upsConfigHighVoltageTransferPoint.0<p>Update: 30</p>|
|upsConfigInputFreq.0|<p>-</p>|`SNMP_AGENT`|upsConfigInputFreq.0<p>Update: 30</p>|
|upsConfigInputVoltage.0|<p>-</p>|`SNMP_AGENT`|upsConfigInputVoltage.0<p>Update: 30</p>|
|upsConfigLowBattTime.0|<p>-</p>|`SNMP_AGENT`|upsConfigLowBattTime.0<p>Update: 30</p>|
|upsConfigLowVoltageTransferPoint.0|<p>-</p>|`SNMP_AGENT`|upsConfigLowVoltageTransferPoint.0<p>Update: 30</p>|
|upsConfigOutputFreq.0|<p>-</p>|`SNMP_AGENT`|upsConfigOutputFreq.0<p>Update: 30</p>|
|upsConfigOutputPower.0|<p>-</p>|`SNMP_AGENT`|upsConfigOutputPower.0<p>Update: 30</p>|
|upsConfigOutputVA.0|<p>-</p>|`SNMP_AGENT`|upsConfigOutputVA.0<p>Update: 30</p>|
|upsConfigOutputVoltage.0|<p>-</p>|`SNMP_AGENT`|upsConfigOutputVoltage.0<p>Update: 30</p>|
|upsEstimatedChargeRemaining.0|<p>-</p>|`SNMP_AGENT`|upsEstimatedChargeRemaining.0<p>Update: 30</p>|
|upsEstimatedMinutesRemaining.0|<p>-</p>|`SNMP_AGENT`|upsEstimatedMinutesRemaining.0<p>Update: 30</p>|
|upsIdentAgentSoftwareVersion.0|<p>-</p>|`SNMP_AGENT`|upsIdentAgentSoftwareVersion.0<p>Update: 86400</p>|
|upsIdentAttachedDevices.0|<p>-</p>|`SNMP_AGENT`|upsIdentAttachedDevices.0<p>Update: 86400</p>|
|upsIdentManufacturer.0|<p>-</p>|`SNMP_AGENT`|upsIdentManufacturer.0<p>Update: 86400</p>|
|upsIdentModel.0|<p>-</p>|`SNMP_AGENT`|upsIdentModel.0<p>Update: 86400</p>|
|upsIdentName.0|<p>-</p>|`SNMP_AGENT`|upsIdentName.0<p>Update: 86400</p>|
|upsIdentUPSSoftwareVersion.0|<p>-</p>|`SNMP_AGENT`|upsIdentUPSSoftwareVersion.0<p>Update: 30</p>|
|upsInputFrequency.1|<p>-</p>|`SNMP_AGENT`|upsInputFrequency.1<p>Update: 30</p>|
|upsInputFrequency.2|<p>-</p>|`SNMP_AGENT`|upsInputFrequency.2<p>Update: 30</p>|
|upsInputFrequency.3|<p>-</p>|`SNMP_AGENT`|upsInputFrequency.3<p>Update: 30</p>|
|upsInputLineBads.0|<p>-</p>|`SNMP_AGENT`|upsInputLineBads.0<p>Update: 30</p>|
|upsInputNumLines.0|<p>-</p>|`SNMP_AGENT`|upsInputNumLines.0<p>Update: 30</p>|
|upsInputVoltage.1|<p>-</p>|`SNMP_AGENT`|upsInputVoltage.1<p>Update: 30</p>|
|upsInputVoltage.2|<p>-</p>|`SNMP_AGENT`|upsInputVoltage.2<p>Update: 30</p>|
|upsInputVoltage.3|<p>-</p>|`SNMP_AGENT`|upsInputVoltage.3<p>Update: 30</p>|
|upsOutputCurrent.1|<p>-</p>|`SNMP_AGENT`|upsOutputCurrent.1<p>Update: 30</p>|
|upsOutputCurrent.2|<p>-</p>|`SNMP_AGENT`|upsOutputCurrent.2<p>Update: 30</p>|
|upsOutputCurrent.3|<p>-</p>|`SNMP_AGENT`|upsOutputCurrent.3<p>Update: 30</p>|
|upsOutputFrequency.0|<p>-</p>|`SNMP_AGENT`|upsOutputFrequency.0<p>Update: 30</p>|
|upsOutputNumLines.0|<p>-</p>|`SNMP_AGENT`|upsOutputNumLines.0<p>Update: 30</p>|
|upsOutputPercentLoad.1|<p>-</p>|`SNMP_AGENT`|upsOutputPercentLoad.1<p>Update: 30</p>|
|upsOutputPercentLoad.2|<p>-</p>|`SNMP_AGENT`|upsOutputPercentLoad.2<p>Update: 30</p>|
|upsOutputPercentLoad.3|<p>-</p>|`SNMP_AGENT`|upsOutputPercentLoad.3<p>Update: 30</p>|
|upsOutputPower.1|<p>-</p>|`SNMP_AGENT`|upsOutputPower.1<p>Update: 30</p>|
|upsOutputPower.2|<p>-</p>|`SNMP_AGENT`|upsOutputPower.2<p>Update: 30</p>|
|upsOutputPower.3|<p>-</p>|`SNMP_AGENT`|upsOutputPower.3<p>Update: 30</p>|
|upsOutputSource.0|<p>-</p>|`SNMP_AGENT`|upsOutputSource.0<p>Update: 30</p>|
|upsOutputVoltage.1|<p>-</p>|`SNMP_AGENT`|upsOutputVoltage.1<p>Update: 30</p>|
|upsOutputVoltage.2|<p>-</p>|`SNMP_AGENT`|upsOutputVoltage.2<p>Update: 30</p>|
|upsOutputVoltage.3|<p>-</p>|`SNMP_AGENT`|upsOutputVoltage.3<p>Update: 30</p>|
|upsRebootWithDuration.0|<p>-</p>|`SNMP_AGENT`|upsRebootWithDuration.0<p>Update: 30</p>|
|upsSecondsOnBattery.0|<p>-</p>|`SNMP_AGENT`|upsSecondsOnBattery.0<p>Update: 30</p>|
|upsShutdownAfterDelay.0|<p>-</p>|`SNMP_AGENT`|upsShutdownAfterDelay.0<p>Update: 30</p>|
|upsShutdownType.0|<p>-</p>|`SNMP_AGENT`|upsShutdownType.0<p>Update: 30</p>|
|upsStartupAfterDelay.0|<p>-</p>|`SNMP_AGENT`|upsStartupAfterDelay.0<p>Update: 30</p>|
|upsTestElapsedTime.0|<p>-</p>|`SNMP_AGENT`|upsTestElapsedTime.0<p>Update: 30</p>|
|upsTestResultsDetail.0|<p>-</p>|`SNMP_AGENT`|upsTestResultsDetail.0<p>Update: 30</p>|
|upsTestResultsSummary.0|<p>-</p>|`SNMP_AGENT`|upsTestResultsSummary.0<p>Update: 30</p>|
|upsTestStartTime.0|<p>-</p>|`SNMP_AGENT`|upsTestStartTime.0<p>Update: 30</p>|


## Triggers

|Name|Description|
|----|-----------|
|'NO ELECTRICITY on {HOST.NAME}'|last(/Eaton 93PS/UPS-ACNormal-Voltage,#1:now-0)<120|
|'UPS Battery Charger Fault on {HOST.NAME}'|last(/Eaton 93PS/UPS-BatteryChargerFault)=1|
|'UPS Battery Fault on {HOST.NAME}'|last(/Eaton 93PS/UPS-BatteryFaultBattery)=1|
|'LESS than 20 minutest battery remaining on {HOST.NAME}'|last(/Eaton 93PS/UPS-BatteryMinutesRemaining,#1:now-0)<20|
|'Humidity is to High on {HOST.NAME}'|last(/Eaton 93PS/UPS-Humidity-High)=1|
|'Humidity is to Low on {HOST.NAME}'|last(/Eaton 93PS/UPS-Humidity-Low)=1|
|'SERVER room is powered by UPS Battery on {HOST.NAME}'|last(/Eaton 93PS/UPS-OutputPowerSource)=1|
|'Temperature is to High'|last(/Eaton 93PS/UPS-Temperature-High)=1|
|'Temperature is to Low'|last(/Eaton 93PS/UPS-Temperature-Low)=1|
|'Temperature is above 28C on {HOST.NAME}'|last(/Eaton 93PS/UPS-TemperatureLevel)>28|
|'alarm on UPS'|last(/Eaton 93PS/upsAlarmsPresent.0)>0|
|'UPS Test Elapsed Time more than 35 days'|last(/Eaton 93PS/upsTestElapsedTime.0)>35|
