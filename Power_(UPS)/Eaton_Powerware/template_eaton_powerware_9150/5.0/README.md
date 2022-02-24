# Eaton 9130

## Overview

This template based on "Eaton Powerware 9130" by Алексей Пустовалов.


I add 2 triggers and make 2 fixes to make it compare with 9150.


You may need some old items to add this template to older versions of zabbix. You can download it from oficial zabbix site.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|upsAutoRestart.0|<p>-</p>|`SNMP agent`|upsAutoRestart.0<p>Update: 30</p>|
|upsInputFrequency.1|<p>-</p>|`SNMP agent`|upsInputFrequency.1<p>Update: 30</p>|
|upsBypassFrequency.0|<p>-</p>|`SNMP agent`|upsBypassFrequency.0<p>Update: 30</p>|
|upsIdentManufacturer.0|<p>-</p>|`SNMP agent`|upsIdentManufacturer.0<p>Update: 86400</p>|
|upsOutputVoltage.1|<p>-</p>|`SNMP agent`|upsOutputVoltage.1<p>Update: 30</p>|
|upsEstimatedChargeRemaining.0|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining.0<p>Update: 30</p>|
|upsConfigLowBattTime.0|<p>-</p>|`SNMP agent`|upsConfigLowBattTime.0<p>Update: 30</p>|
|upsTestResultsDetail.0|<p>-</p>|`SNMP agent`|upsTestResultsDetail.0<p>Update: 30</p>|
|upsIdentAgentSoftwareVersion.0|<p>-</p>|`SNMP agent`|upsIdentAgentSoftwareVersion.0<p>Update: 86400</p>|
|upsOutputSource.0|<p>-</p>|`SNMP agent`|upsOutputSource.0<p>Update: 30</p>|
|upsSecondsOnBattery.0|<p>-</p>|`SNMP agent`|upsSecondsOnBattery.0<p>Update: 30</p>|
|upsAlarmsPresent.0|<p>-</p>|`SNMP agent`|upsAlarmsPresent.0<p>Update: 30</p>|
|upsConfigLowVoltageTransferPoint.0|<p>-</p>|`SNMP agent`|upsConfigLowVoltageTransferPoint.0<p>Update: 30</p>|
|upsInputNumLines.0|<p>-</p>|`SNMP agent`|upsInputNumLines.0<p>Update: 30</p>|
|upsIdentModel.0|<p>-</p>|`SNMP agent`|upsIdentModel.0<p>Update: 86400</p>|
|upsOutputPercentLoad.1|<p>-</p>|`SNMP agent`|upsOutputPercentLoad.1<p>Update: 30</p>|
|upsOutputLineIndex.1|<p>-</p>|`SNMP agent`|upsOutputLineIndex.1<p>Update: 30</p>|
|upsIdentUPSSoftwareVersion.0|<p>-</p>|`SNMP agent`|upsIdentUPSSoftwareVersion.0<p>Update: 30</p>|
|upsTestStartTime.0|<p>-</p>|`SNMP agent`|upsTestStartTime.0<p>Update: 30</p>|
|upsConfigOutputFreq.0|<p>-</p>|`SNMP agent`|upsConfigOutputFreq.0<p>Update: 30</p>|
|upsTestSpinLock.0|<p>-</p>|`SNMP agent`|upsTestSpinLock.0<p>Update: 30</p>|
|upsBatteryVoltage.0|<p>-</p>|`SNMP agent`|upsBatteryVoltage.0<p>Update: 30</p>|
|upsBypassNumLines.0|<p>-</p>|`SNMP agent`|upsBypassNumLines.0<p>Update: 30</p>|
|upsStartupAfterDelay.0|<p>-</p>|`SNMP agent`|upsStartupAfterDelay.0<p>Update: 30</p>|
|upsConfigAudibleStatus.0|<p>-</p>|`SNMP agent`|upsConfigAudibleStatus.0<p>Update: 30</p>|
|upsOutputPower.1|<p>-</p>|`SNMP agent`|upsOutputPower.1<p>Update: 30</p>|
|upsConfigInputVoltage.0|<p>-</p>|`SNMP agent`|upsConfigInputVoltage.0<p>Update: 30</p>|
|upsShutdownAfterDelay.0|<p>-</p>|`SNMP agent`|upsShutdownAfterDelay.0<p>Update: 30</p>|
|upsBypassVoltage.1|<p>-</p>|`SNMP agent`|upsBypassVoltage.1<p>Update: 30</p>|
|upsConfigOutputPower.0|<p>-</p>|`SNMP agent`|upsConfigOutputPower.0<p>Update: 30</p>|
|upsConfigHighVoltageTransferPoint.0|<p>-</p>|`SNMP agent`|upsConfigHighVoltageTransferPoint.0<p>Update: 30</p>|
|upsConfigOutputVA.0|<p>-</p>|`SNMP agent`|upsConfigOutputVA.0<p>Update: 30</p>|
|upsIdentName.0|<p>-</p>|`SNMP agent`|upsIdentName.0<p>Update: 86400</p>|
|upsRebootWithDuration.0|<p>-</p>|`SNMP agent`|upsRebootWithDuration.0<p>Update: 30</p>|
|upsBypassLineIndex.1|<p>-</p>|`SNMP agent`|upsBypassLineIndex.1<p>Update: 30</p>|
|upsTestResultsSummary.0|<p>-</p>|`SNMP agent`|upsTestResultsSummary.0<p>Update: 30</p>|
|upsInputLineBads.0|<p>-</p>|`SNMP agent`|upsInputLineBads.0<p>Update: 30</p>|
|upsBatteryStatus.0|<p>-</p>|`SNMP agent`|upsBatteryStatus.0<p>Update: 30</p>|
|upsOutputNumLines.0|<p>-</p>|`SNMP agent`|upsOutputNumLines.0<p>Update: 30</p>|
|upsShutdownType.0|<p>-</p>|`SNMP agent`|upsShutdownType.0<p>Update: 30</p>|
|upsConfigOutputVoltage.0|<p>-</p>|`SNMP agent`|upsConfigOutputVoltage.0<p>Update: 30</p>|
|upsIdentAttachedDevices.0|<p>-</p>|`SNMP agent`|upsIdentAttachedDevices.0<p>Update: 86400</p>|
|upsEstimatedMinutesRemaining.0|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining.0<p>Update: 30</p>|
|upsConfigInputFreq.0|<p>-</p>|`SNMP agent`|upsConfigInputFreq.0<p>Update: 30</p>|
|upsOutputFrequency.0|<p>-</p>|`SNMP agent`|upsOutputFrequency.0<p>Update: 30</p>|
|upsTestId.0|<p>-</p>|`SNMP agent`|upsTestId.0<p>Update: 30</p>|
|upsOutputCurrent.1|<p>-</p>|`SNMP agent`|upsOutputCurrent.1<p>Update: 30</p>|
|upsTestElapsedTime.0|<p>-</p>|`SNMP agent`|upsTestElapsedTime.0<p>Update: 30</p>|
|upsInputVoltage.1|<p>-</p>|`SNMP agent`|upsInputVoltage.1<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

