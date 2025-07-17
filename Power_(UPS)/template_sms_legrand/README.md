# Nobreak SMS Double II DSP - SNMP Template for Zabbix 6.2

## Description
Version 1.0. SNMP template for monitoring SMS Double II DSP UPS systems (10 and 20 KVA models) via Zabbix 6.2. This template provides comprehensive monitoring of UPS status, battery health, input/output parameters, and alarm conditions using standard UPS MIB (RFC 1628) over SNMP protocol.

## Overview
Version 1.0.

This template is designed for monitoring SMS Double II DSP UPS systems with 10 and 20 KVA capacity through SNMP protocol. It implements the standard UPS MIB (Management Information Base) as defined in RFC 1628, providing comprehensive monitoring capabilities for:

- Battery status and health monitoring
- Input/output voltage and frequency tracking
- Load monitoring and power consumption
- Temperature monitoring
- Alarm and event detection
- Bypass and operational mode tracking

The template uses SNMP community string "sms" by default and polls data every 30 seconds for optimal balance between monitoring accuracy and system performance.

## Author
Marlon J dos Anjos

## Macros used
|Name|Description|Default|
|----|-----------|-------|
|{$SNMP_COMMUNITY}|SNMP community string for UPS communication|sms|

## Template links
There are no template links in this template.

## Discovery rules
There are no discovery rules in this template.

## Items collected
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Battery Bad Alarm|<p>Indicates if battery replacement is needed</p>|`SNMP agent`|upsAlarmBatteryBad<p>Update: 30s</p>|
|Alarms Present|<p>Number of active alarms in the UPS system</p>|`SNMP agent`|upsAlarmsPresent<p>Update: 30s</p>|
|Auto Restart|<p>UPS auto-restart configuration status</p>|`SNMP agent`|upsAutoRestart<p>Update: 30s</p>|
|Battery Current|<p>Current battery current in amperes</p>|`SNMP agent`|upsBatteryCurrent<p>Update: 30s</p>|
|Battery Status|<p>Current battery status (1=unknown, 2=normal, 3=low, 4=depleted)</p>|`SNMP agent`|upsBatteryStatus<p>Update: 30s</p>|
|Battery Temperature|<p>Battery temperature in degrees Celsius</p>|`SNMP agent`|upsBatteryTemperature<p>Update: 30s</p>|
|Battery Voltage|<p>Battery voltage in volts (multiplied by 100)</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 30s</p>|
|Bypass Current|<p>Bypass line current in amperes</p>|`SNMP agent`|upsBypassCurrent<p>Update: 30s</p>|
|Bypass Frequency|<p>Bypass line frequency in Hz (divided by 10)</p>|`SNMP agent`|upsBypassFrequency<p>Update: 30s</p>|
|Bypass Line Index|<p>Bypass line index identifier</p>|`SNMP agent`|upsBypassLineIndex<p>Update: 30s</p>|
|Bypass Number of Lines|<p>Number of bypass lines available</p>|`SNMP agent`|upsBypassNumLines<p>Update: 30s</p>|
|Bypass Power|<p>Bypass power consumption</p>|`SNMP agent`|upsBypassPower<p>Update: 30s</p>|
|Bypass Voltage|<p>Bypass line voltage in volts</p>|`SNMP agent`|upsBypassVoltage<p>Update: 30s</p>|
|Config Audible Status|<p>Audible alarm configuration status</p>|`SNMP agent`|upsConfigAudibleStatus<p>Update: 30s</p>|
|Config Input Frequency|<p>Configured input frequency in Hz (divided by 10)</p>|`SNMP agent`|upsConfigInputFreq<p>Update: 30s</p>|
|Config Input Voltage|<p>Configured input voltage in volts</p>|`SNMP agent`|upsConfigInputVoltage<p>Update: 30s</p>|
|Config Low Battery Time|<p>Low battery warning time configuration</p>|`SNMP agent`|upsConfigLowBattTime<p>Update: 30s</p>|
|Config Output Frequency|<p>Configured output frequency in Hz (divided by 10)</p>|`SNMP agent`|upsConfigOutputFreq<p>Update: 30s</p>|
|Config Output Power|<p>Configured output power in watts</p>|`SNMP agent`|upsConfigOutputPower<p>Update: 30s</p>|
|Config Output VA|<p>Configured output apparent power in VA</p>|`SNMP agent`|upsConfigOutputVA<p>Update: 30s</p>|
|Config Output Voltage|<p>Configured output voltage in volts</p>|`SNMP agent`|upsConfigOutputVoltage<p>Update: 30s</p>|
|Estimated Charge Remaining|<p>Estimated battery charge remaining in percentage</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 30s</p>|
|Estimated Minutes Remaining|<p>Estimated runtime on battery in minutes</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 30s</p>|
|Agent Software Version|<p>UPS agent software version</p>|`SNMP agent`|upsIdentAgentSoftwareVersion<p>Update: 30s</p>|
|Manufacturer|<p>UPS manufacturer identification</p>|`SNMP agent`|upsIdentManufacturer<p>Update: 30s</p>|
|Model|<p>UPS model identification</p>|`SNMP agent`|upsIdentModel<p>Update: 30s</p>|
|UPS Software Version|<p>UPS firmware version</p>|`SNMP agent`|upsIdentUPSSoftwareVersion<p>Update: 30s</p>|
|Input Line Bads|<p>Number of input line failures</p>|`SNMP agent`|upsInputLineBads<p>Update: 30s</p>|
|Input Number of Lines|<p>Number of input lines</p>|`SNMP agent`|upsInputNumLines<p>Update: 30s</p>|
|Input Frequency|<p>Input frequency in Hz (divided by 10)</p>|`SNMP agent`|upsInputTable.upsInputEntry.upsInputFrequency<p>Update: 30s</p>|
|Input Line Index|<p>Input line index identifier</p>|`SNMP agent`|upsInputTable.upsInputEntry.upsInputLineIndex<p>Update: 30s</p>|
|Input Voltage|<p>Input voltage in volts</p>|`SNMP agent`|upsInputTable.upsInputEntry.upsInputVoltage<p>Update: 30s</p>|
|Output Current|<p>Output current in amperes</p>|`SNMP agent`|upsOutputCurrent<p>Update: 30s</p>|
|Output Frequency|<p>Output frequency in Hz (divided by 10)</p>|`SNMP agent`|upsOutputFrequencyv<p>Update: 30s</p>|
|Output Line Index|<p>Output line index identifier</p>|`SNMP agent`|upsOutputLineIndex<p>Update: 30s</p>|
|Output Number of Lines|<p>Number of output lines</p>|`SNMP agent`|upsOutputNumLines<p>Update: 30s</p>|
|Output Percent Load|<p>Output load as percentage of rated capacity</p>|`SNMP agent`|upsOutputPercentLoad<p>Update: 30s</p>|
|Output Power|<p>Output power in watts</p>|`SNMP agent`|upsOutputPower<p>Update: 30s</p>|
|Output Source|<p>Current output source (3=normal, 4=bypass, 5=battery, 6=booster, 7=reducer)</p>|`SNMP agent`|upsOutputSource<p>Update: 30s</p>|
|Output Voltage|<p>Output voltage in volts</p>|`SNMP agent`|upsOutputVoltage<p>Update: 30s</p>|
|Reboot With Duration|<p>UPS reboot control parameter</p>|`SNMP agent`|upsRebootWithDuration<p>Update: 30s</p>|
|Seconds On Battery|<p>Time elapsed since UPS switched to battery power</p>|`SNMP agent`|upsSecondsOnBattery<p>Update: 30s</p>|
|Shutdown After Delay|<p>UPS shutdown control parameter</p>|`SNMP agent`|upsShutdownAfterDelay<p>Update: 30s</p>|
|Shutdown Type|<p>UPS shutdown type configuration</p>|`SNMP agent`|upsShutdownType<p>Update: 30s</p>|
|Startup After Delay|<p>UPS startup control parameter</p>|`SNMP agent`|upsStartupAfterDelay<p>Update: 30s</p>|

## Triggers
|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Alarm Present {HOSTNAME}|<p>Triggered when UPS has active alarms</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsAlarmsPresent)<>0`|High|
|Low Battery {HOSTNAME}|<p>Triggered when battery status is low</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsBatteryStatus)=3`|High|
|Unknown Battery {HOSTNAME}|<p>Triggered when battery status is unknown</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsBatteryStatus)=1`|High|
|Battery Depleted {HOSTNAME}|<p>Triggered when battery is depleted</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsBatteryStatus)=4`|High|
|High Temperature >=28°C {HOSTNAME}|<p>Triggered when battery temperature is high</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsBatteryTemperature)>=28`|High|
|Battery < 50% {HOSTNAME}|<p>Triggered when battery charge is below 50%</p>|`avg(/NOBREAK SMS DOUBLE II DSP/upsEstimatedChargeRemaining,5m)<50`|High|
|Critical Battery < 10% - Shutdown Everything! {HOSTNAME}|<p>Critical trigger when battery is below 10%</p>|`avg(/NOBREAK SMS DOUBLE II DSP/upsEstimatedChargeRemaining,3m)<10`|High|
|Input Voltage {HOSTNAME}|<p>Triggered when input voltage is out of range (210-240V)</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsInputTable.upsInputEntry.upsInputVoltage)>240 or last(/NOBREAK SMS DOUBLE II DSP/upsInputTable.upsInputEntry.upsInputVoltage)<210`|High|
|High Load >80% {HOSTNAME}|<p>Triggered when output load exceeds 80%</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsOutputPercentLoad)>80`|High|
|Using Battery {HOSTNAME}|<p>Triggered when UPS is running on battery power</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsOutputSource)=5`|High|
|Using Booster {HOSTNAME}|<p>Triggered when UPS is using booster mode</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsOutputSource)=6`|High|
|Using Bypass {HOSTNAME}|<p>Triggered when UPS is in bypass mode</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsOutputSource)=4`|High|
|Using Reducer {HOSTNAME}|<p>Triggered when UPS is using reducer mode</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsOutputSource)=7`|High|
|Output Voltage {HOSTNAME}|<p>Triggered when output voltage is out of range (110-120V)</p>|`last(/NOBREAK SMS DOUBLE II DSP/upsOutputVoltage)>120 or last(/NOBREAK SMS DOUBLE II DSP/upsOutputVoltage)<110`|High|

## Installation
1. Import the template file into your Zabbix 6.2 server
2. Configure the SNMP community string macro `{$SNMP_COMMUNITY}` if different from "sms"
3. Apply the template to your SMS Double II DSP UPS hosts
4. Ensure SNMP is properly configured on the UPS device
5. Verify connectivity and data collection

## Notes
- This template is specifically designed for SMS Double II DSP UPS models (10 and 20 KVA)
- SNMP community string can be customized via the `{$SNMP_COMMUNITY}` macro
- All voltage thresholds are configured for typical Brazilian power standards
- Temperature monitoring threshold is set to 28°C (adjustable in triggers)
- Battery monitoring includes both percentage and status-based alerts
- Output source monitoring provides detailed operational mode tracking
