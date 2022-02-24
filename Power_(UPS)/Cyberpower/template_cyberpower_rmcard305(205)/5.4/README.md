# Module Cyberpower RMCARD305

## Description

SNMPv2 Template for Cyberpower's remote management card ver.305 (205) used in OR and PR-series UPSes. Tested on firmware version 1.3.0. Created by Taurus (https://github.com/RusTaurus) MIBs used: CPS-MIB (v2.9) https://www.cyberpowersystems.com/products/software/mib-files/

## Overview

This is Zabbix SNMPv2 Template for Cyberpower's remote management card ver.305(205) used in OR- and PR-series UPSes.


Tested on Zabbix 4.0 and 4.4, PR3000ELCDRT2U, OR1500ELCDRM1U with RMCARD305 (firmware version 1.3.0).


[Here](https://github.com/RusTaurus/cyberpower-rmcard305) you can find latest firmware and MIB versions of RMCARD305.




---


Enhancements in v2 version of this template:


* New application with UPS configuration settings
* Add discovery of battery Age Recommendation parameter
* Display RMCARD serial number




---


 


MIBs used: CPS-MIB (v2.9)


 



## Author

Sergey Romanov

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Output Current Discovery|<p>Discovery because CPS-MIB::upsAdvanceOutputCurrent returns 0 (zero) on OR-series UPSes.</p>|`SNMP agent`|Output.current.discovery<p>Update: 30s</p>|
|Configuration Discovery #3|<p>Discovery because CPS-MIB::upsAdvanceConfigReturnDelay returns NULL on OR-series UPSes.</p>|`SNMP agent`|config.discovery.3<p>Update: 30s</p>|
|Configuration Discovery #2|<p>Discovery because CPS-MIB::upsAdvanceConfigRechargedCapacity returns NULL on OR-series UPSes.</p>|`SNMP agent`|config.discovery.2<p>Update: 30s</p>|
|Configuration Discovery #4|<p>Discovery because CPS-MIB::upsAdvanceConfigShutoffDelay returns NULL on OR-series UPSes.</p>|`SNMP agent`|config.discovery.4<p>Update: 30s</p>|
|Temperature Discovery|<p>Discovery because CPS-MIB::upsAdvanceBatteryTemperature returns 0 (zero) on OR-series UPSes.</p>|`SNMP agent`|Temperature.discovery<p>Update: 30s</p>|
|Battery Age Recommendation Discovery|<p>Discovery because CPS-MIB::upsBaseBatteryAgeRecommand returns 0 (zero) on OR-series UPSes.</p>|`SNMP agent`|BatteryAge.discovery<p>Update: 30s</p>|
|Configuration Discovery #5|<p>Discovery because CPS-MIB::upsAdvanceConfigSleepDelay returns NULL on OR-series UPSes.</p>|`SNMP agent`|config.discovery.5<p>Update: 30s</p>|
|Configuration Discovery #1|<p>Discovery because CPS-MIB::upsAdvanceConfigColdStart returns NULL on OR-series UPSes.</p>|`SNMP agent`|config.discovery.1<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Replace Indicator|<p>CPS-MIB::upsAdvanceBatteryReplaceIndicator - this value indicates if UPS batteries need to be replaced</p>|`SNMP agent`|battery.ReplaceIndicator<p>Update: 1h</p>|
|Voltage|<p>CPS-MIB::upsAdvanceOutputVoltage - the UPS output voltage in Volts</p>|`SNMP agent`|output.Voltage<p>Update: 30s</p>|
|Battery Low Threshold|<p>CPS-MIB::upsAdvanceConfigLowBatteryThreshold - when the UPS supplies battery power and the remaining capacity is lower than this threshold, the UPS will sound an alarm. The value expressed in percentage.</p>|`SNMP agent`|config.batteryLow<p>Update: 30m</p>|
|Power Rating|<p>CPS-MIB::upsAdvanceIdentPowerRating - the Volt-Amp rating of the UPS</p>|`SNMP agent`|ups.info.PowerRating<p>Update: 1h</p>|
|Firmware Revision|<p>CPS-MIB::upsAdvanceIdentAgentFirmwareRevision - the SNMP agent firmware revision</p>|`SNMP agent`|rmcard.FirmwareRevision<p>Update: 1h</p>|
|Status|<p>CPS-MIB::upsBaseBatteryStatus - the UPS battery status. A batteryLow(3) value means the battery will be exhausted soon under the current load. The amount of low battery run time can be configured by the upsAdvanceConfigLowBatteryRunTime.</p>|`SNMP agent`|battery.Status<p>Update: 15s</p>|
|System - Over Discharge Protection|<p>CPS-MIB::upsAdvanceConfigDeepDischargeProtection - when the UPS is on Battery Mode with 0% load and the status remains for the time configured, the RMCARD will enforce the UPS to Sleep Mode and the output will be turned off. The possible values are 0, 20, 40, and 60 minutes. If a value other than a possible value is set, it will not be accepted.</p>|`SNMP agent`|config.dischargeProtection<p>Update: 30m</p>|
|Last Fail Cause|<p>CPS-MIB::upsAdvanceInputLineFailCause - The reason of UPS power failure. This value is set to: - noTransfer(1), if UPS is in utility mode. - highLineVoltage(2), if UPS switch to battery mode by reason of input voltage over the high transfer vloltage. - brownout(3), if UPS switch to battery mode by reason of input voltage under the low transfer vloltage. - selfTest(4), if the UPS was commanded to do a self test.</p>|`SNMP agent`|input.FailCause<p>Update: 1h</p>|
|Time on Battery|<p>CPS-MIB::upsBaseBatteryTimeOnBattery - the UPS wasted battery time since the UPS has transfered to backup mode</p>|`SNMP agent`|battery.TimeOnBattery<p>Update: 30s</p>|
|System - Enter Sleep Mode After All Clients Shutdown|<p>CPS-MIB::upsAdvanceConfigSleepAfterAllClientShut - if this option is enabled, UPS will enter sleep mode after utility power failed and remaining MSDT+2 minutes.More information about MSDT please reference to help page of UPS - > PowerPanel List.</p>|`SNMP agent`|config.sleepMode<p>Update: 30m</p>|
|Load Power|<p>CPS-MIB::upsAdvanceIdentLoadPower - the power rating (Watts) of the UPS</p>|`SNMP agent`|ups.info.LoadPower<p>Update: 1h</p>|
|System - Audible Alarm|<p>CPS-MIB::upsAdvanceConfigAlarm - this value is set to handle audible alarms when power failure.</p>|`SNMP agent`|config.audibleAlarm<p>Update: 30m</p>|
|Frequency|<p>CPS-MIB::upsAdvanceOutputFrequency - the UPS output frequency in Hz</p>|`SNMP agent`|output.Frequency<p>Update: 30s</p>|
|Frequency|<p>CPS-MIB::upsAdvanceInputFrequency - the input line frequency in Hz</p>|`SNMP agent`|input.Frequency<p>Update: 30s</p>|
|Voltage Rating|<p>CPS-MIB::upsAdvanceBatteryVoltageRating - the DC voltage rating of the battery set</p>|`SNMP agent`|battery.VoltageRating<p>Update: 1h</p>|
|Status|<p>CPS-MIB::upsAdvanceInputStatus - display the present status of the utility power supplied to the UPS</p>|`SNMP agent`|input.Status<p>Update: 15s</p>|
|Output Voltage|<p>CPS-MIB::upsAdvanceConfigOutputVoltage - the standard UPS output voltage in Volts. The possible values are 100, 110, 120, 127, 208, 220, 230, and 240. If a value other than a possible value is set, it will not be accepted.</p>|`SNMP agent`|config.outputVoltage<p>Update: 30m</p>|
|Remaining Runtime|<p>CPS-MIB::upsAdvanceBatteryRunTimeRemaining - the UPS battery remaining run time</p>|`SNMP agent`|battery.RemainingRuntime<p>Update: 30s</p>|
|Name|<p>CPS-MIB::upsBaseIdentName - the UPS identified name could be set by the administrator</p>|`SNMP agent`|ups.info.Name<p>Update: 1h</p>|
|Serial Number|<p>CPS-MIB::upsAdvanceIdentAgentSerialNumber - a string identifying the serial number of the Agent</p>|`SNMP agent`|rmcard.SerialNumber<p>Update: 1h</p>|
|Status|<p>CPS-MIB::upsBaseOutputStatus - the UPS output status</p>|`SNMP agent`|output.Status<p>Update: 15s</p>|
|Load|<p>CPS-MIB::upsAdvanceOutputLoad - the UPS output load expressed in percentage</p>|`SNMP agent`|output.Load<p>Update: 30s</p>|
|Firmware Version|<p>CPS-MIB::upsAdvanceIdentFirmwareRevision - the UPS firmware revision</p>|`SNMP agent`|ups.info.FirmwareVersion<p>Update: 1h</p>|
|Capacity|<p>CPS-MIB::upsAdvanceBatteryCapacity - the battery capacity expressed in percentage</p>|`SNMP agent`|battery.Capacity<p>Update: 30s</p>|
|Model|<p>CPS-MIB::upsBaseIdentModel - the UPS model name</p>|`SNMP agent`|ups.info.Model<p>Update: 1h</p>|
|Voltage|<p>CPS-MIB::upsAdvanceInputLineVoltage - the input line voltage in Volts</p>|`SNMP agent`|input.Voltage<p>Update: 30s</p>|
|Load (watts)|<p>CPS-MIB::upsAdvanceOutputPower - the total output active power of the UPS system in W</p>|`SNMP agent`|output.LoadW<p>Update: 30s</p>|
|Current|<p>CPS-MIB::upsAdvanceOutputCurrent - the UPS output current in Amps</p>|`SNMP agent`|output.current.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Power Restore - Returned Delay|<p>CPS-MIB::upsAdvanceConfigReturnDelay - the delay time the UPS will turn on after power recovery. The value is also used in a 'reboot' or 'wake up' sequence. The possible values are 0 to 600 seconds. If a value other than a supported value is set, the value will not be accepted.</p>|`SNMP agent`|config.returnedDelay.[{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|
|Power Restore - Recharged Capacity|<p>CPS-MIB::upsAdvanceConfigRechargedCapacity - when the utility power restores, the UPS will start to recharge until the specified battery capacity in percentage is met before restoring output power. The possible values are 0, 15, 30, 45, 60, 75, and 90. If a value other than a possible value is set, it will not be accepted.</p>|`SNMP agent`|config.rechargedCapacity.[{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|
|Timers - ShutOff Delay|<p>CPS-MIB::upsAdvanceConfigShutoffDelay - the delay time the UPS will remain on after receiving a turn off command. The possible values are between 60 to 5940 seconds. If a value other than a supported value is set, the value will not be accepted.</p>|`SNMP agent`|config.shutoffDelay.[{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|
|Temperature|<p>CPS-MIB::upsAdvanceBatteryTemperature - the UPS battery temperature expressed in Celsius</p>|`SNMP agent`|ups.info.Temperature.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Age Recommendation|<p>CPS-MIB::upsBaseBatteryAgeRecommand - Recommended battery life in months</p>|`SNMP agent`|battery.ageRecommend.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Last Replace Date|<p>CPS-MIB::upsBaseBatteryLastReplaceDate - the UPS batteries last replaced date in mm/dd/yyyy format. This value is originally set when manufactured. If batteries replaced, administrator should reset this value.</p>|`SNMP agent`|battery.lastReplaceDate.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Timers - Sleep Delay|<p>CPS-MIB::upsAdvanceConfigSleepDelay - the delay time the UPS will enter sleep mode after receiving a sleep command. The possible values are between 60 to 5940 seconds. If a value other than a supported value is set, the value will not be accepted.</p>|`SNMP agent`|config.sleepDelay.[{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|
|System - Cold Start|<p>CPS-MIB::upsAdvanceConfigColdStart - set the ability of the UPS can start in the absence of input power. When this option is enabled the UPS can be turned on without having input power.</p>|`SNMP agent`|config.coldStart.[{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

