# Liebert_GXT4_UPS

## Overview

This template has 23 items 10 triggers and depends on Template Module ICMP Ping 3.4.   
If your zabbix hasn't got the Template Module ICMP Ping 3.4, please, download/import that first and then import the UPS template. 


Template Module ICMP Ping link [Template Module ICMP Ping 3.4](?link_id=451&cf_id=42 "Template Module ICMP Ping 3.4")



## Author

Peter Franca

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Input Frequency|<p>The present input frequency.</p>|`SNMP agent`|upsInputFrequency<p>Update: 1m</p>|
|Battery voltage|<p>The magnitude of the present battery voltage.</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 1m</p>|
|UPS last test performed|<p>The results of the current or last UPS diagnostics test performed. The values for donePass(1), doneWarning(2), and doneError(3) indicate that the test completed either successfully, with a warning, or with an error, respectively. The value aborted(4) is returned for tests which are aborted by setting the value of upsTestId to upsTestAbortTestInProgress. Tests which have not yet concluded are indicated by inProgress(5). The value noTestsInitiated(6) indicates that no previous test results are available, such as is the case when no tests have been run since the last reinitialization of the network management subsystem and the system has no provision for non- volatile storage of test results INTEGER {donePass(1), doneWarning(2), doneError(3), aborted(4), inProgress(5), noTestsInitiated(6) }</p>|`SNMP agent`|upsTestResultsSummary<p>Update: 1m</p>|
|Number of current alarm|<p>The present number of active alarm conditions A list of alarm table entries. The table contains zero, one, or many rows at any moment, depending upon the number of alarm conditions in effect. The table is initially empty at agent startup. The agent creates a row in the table each time a condition is detected and deletes that row when that condition no longer pertains. The agent creates the first row with upsAlarmId equal to 1, and increments the value of upsAlarmId each time a new row is created, wrapping to the first free value greater than or equal to 1 when the maximum value of upsAlarmId would otherwise be exceeded. Consequently, after multiple operations, the table may become sparse, e.g., containing entries for rows 95, 100, 101, and 203 and the entries should not be assumed to be in chronological order because upsAlarmId might have wrapped. Alarms are named by an AutonomousType (OBJECT IDENTIFIER), upsAlarmDescr, to allow a single table to reflect well known alarms plus alarms defined by a particular implementation, i.e., as documented in the private enterprise MIB definition for the device. No two rows will have the same value of upsAlarmDescr, since alarms define conditions. In order to meet this requirement, care should be taken in the definition of alarm conditions to insure that a system cannot enter the same condition multiple times simultaneously. The number of rows in the table at any given time is reflected by the value of upsAlarmsPresent.</p>|`SNMP agent`|upsAlarmsPresent<p>Update: 1m</p>|
|Battery status|<p>The indication of the capacity remaining in the UPS system's batteries. A value of batteryNormal indicates that the remaining run-time is greater than upsConfigLowBattTime. A value of batteryLow indicates that the remaining battery run-time is less than or equal to upsConfigLowBattTime. A value of batteryDepleted indicates that the UPS will be unable to sustain the present load when and if the utility power is lost (including the possibility that the utility power is currently absent and the UPS is unable to sustain the output). INTEGER {unknown(1), batteryNormal(2), batteryLow(3), batteryDepleted(4) }</p>|`SNMP agent`|upsBatteryStatus<p>Update: 1m</p>|
|Model|<p>-</p>|`SNMP agent`|lgpAgentDeviceModel<p>Update: 24h</p>|
|Manufacture date|<p>-</p>|`SNMP agent`|lgpAgentDeviceManufactureDate<p>Update: 24h</p>|
|Input voltage|<p>The magnitude of the present input voltage</p>|`SNMP agent`|upsInputVoltage<p>Update: 1m</p>|
|Output power|<p>The present output true power</p>|`SNMP agent`|upsOutputPower<p>Update: 1m</p>|
|Charge remaining|<p>An estimate of the battery charge remaining expressed as a percent of full charge</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 1m</p>|
|Input current|<p>The magnitude of the present input current.</p>|`SNMP agent`|upsInputCurrent<p>Update: 1m</p>|
|Output voltage|<p>The present output voltage</p>|`SNMP agent`|upsOutputVoltage<p>Update: 1m</p>|
|Output frequency|<p>The present output frequency.</p>|`SNMP agent`|upsOutputFrequency<p>Update: 1m</p>|
|Firmware version|<p>-</p>|`SNMP agent`|lgpAgentDeviceFirmwareVersion<p>Update: 24h</p>|
|Estimated time remaining on battery|<p>An estimate of the time to battery charge depletion under the present load conditions if the utility power is off and remains off, or if it were to be lost and remain off.</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 1m</p>|
|UPS power capacity presently being used|<p>The percentage of the UPS power capacity presently being used on this output line, i.e., the greater of the percent load of true power capacity and the percent load of VA.</p>|`SNMP agent`|upsOutputPercentLoad<p>Update: 1m</p>|
|Output current|<p>The present output current</p>|`SNMP agent`|upsOutputCurrent<p>Update: 1m</p>|
|Output source|<p>The present source of output power. The enumeration none(2) indicates that there is no source of output power (and therefore no output power), for example, the system has opened the output breaker</p>|`SNMP agent`|upsOutputSource<p>Update: 1m</p>|
|UPS test results|<p>Additional information about upsTestResultsSummary. If no additional information available, a zero length string is returned</p>|`SNMP agent`|upsTestResultsDetail<p>Update: 1m</p>|
|Time on battery|<p>If the unit is on battery power, the elapsed time since the UPS last switched to battery power, or the time since the network management subsystem was last restarted, whichever is less. Zero shall be returned if the unit is not on battery power.</p>|`SNMP agent`|upsSecondsOnBattery<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

