# SMS Legrand KEOR BR 20KVA - SNMP Template for Zabbix 6.2

## Description
Version 1.0. SNMP template for monitoring SMS Legrand KEOR BR 20KVA UPS systems via Zabbix 6.2. This template provides comprehensive monitoring of UPS status, battery health, three-phase input parameters, single-phase output monitoring, and alarm conditions using standard UPS MIB (RFC 1628) over SNMP protocol.

## Overview
Version 1.0.

This template is designed specifically for monitoring SMS Legrand KEOR BR 20KVA UPS systems with **three-phase input (380V) and single-phase output (220V)** configuration through SNMP protocol. It implements the standard UPS MIB (Management Information Base) as defined in RFC 1628, providing comprehensive monitoring capabilities for:

- **Three-phase input monitoring**: Real-time voltage and frequency tracking for all three phases (R, S, T)
- **Single-phase output monitoring**: Primary output line monitoring with load percentage
- **Battery management**: Status, charge level, voltage, current, and temperature monitoring
- **System identification**: Manufacturer, model, firmware versions
- **Alarm management**: Comprehensive alarm detection and notification
- **Test monitoring**: UPS diagnostic test results and status
- **Control functions**: Shutdown, startup, and reboot monitoring
- **Bypass monitoring**: Bypass line status and parameters

The template uses SNMP community string "sms" by default and polls data every 30 seconds for optimal balance between monitoring accuracy and system performance.

## Author
Gustavo Heidrich Grunwald

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
|UPS Manufacturer|<p>Manufacturer identification</p>|`SNMP agent`|upsIdentManufacturer<p>Update: 3600s</p>|
|UPS Model|<p>UPS model designation</p>|`SNMP agent`|upsIdentModel<p>Update: 3600s</p>|
|UPS Software Version|<p>UPS firmware version</p>|`SNMP agent`|upsIdentUPSSoftwareVersion<p>Update: 3600s</p>|
|Agent Software Version|<p>SNMP agent software version</p>|`SNMP agent`|upsIdentAgentSoftwareVersion<p>Update: 3600s</p>|
|Battery Status|<p>Battery status: 1=unknown, 2=normal, 3=low, 4=depleted</p>|`SNMP agent`|upsBatteryStatus<p>Update: 30s</p>|
|Seconds On Battery|<p>Time elapsed since UPS switched to battery power</p>|`SNMP agent`|upsSecondsOnBattery<p>Update: 30s</p>|
|Battery Charge Remaining|<p>Estimated battery charge remaining in percentage</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 30s</p>|
|Battery Voltage|<p>Present battery voltage in volts</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 30s</p>|
|Battery Current|<p>Present battery current in amperes</p>|`SNMP agent`|upsBatteryCurrent<p>Update: 30s</p>|
|Battery Temperature|<p>Battery temperature in degrees Celsius</p>|`SNMP agent`|upsBatteryTemperature<p>Update: 30s</p>|
|Input Line Failures|<p>Count of input line out-of-tolerance conditions</p>|`SNMP agent`|upsInputLineBads<p>Update: 30s</p>|
|Input Lines Count|<p>Number of input lines (should be 3 for three-phase)</p>|`SNMP agent`|upsInputNumLines<p>Update: 30s</p>|
|Input Frequency L1|<p>Input frequency for phase 1 in Hz</p>|`SNMP agent`|upsInputFrequency_L1<p>Update: 30s</p>|
|Input Voltage L1|<p>Input voltage for phase 1 in volts</p>|`SNMP agent`|upsInputVoltage_L1<p>Update: 30s</p>|
|Input Frequency L2|<p>Input frequency for phase 2 in Hz</p>|`SNMP agent`|upsInputFrequency_L2<p>Update: 30s</p>|
|Input Voltage L2|<p>Input voltage for phase 2 in volts</p>|`SNMP agent`|upsInputVoltage_L2<p>Update: 30s</p>|
|Input Frequency L3|<p>Input frequency for phase 3 in Hz</p>|`SNMP agent`|upsInputFrequency_L3<p>Update: 30s</p>|
|Input Voltage L3|<p>Input voltage for phase 3 in volts</p>|`SNMP agent`|upsInputVoltage_L3<p>Update: 30s</p>|
|Output Source|<p>Current output power source: 3=normal, 4=bypass, 5=battery, 6=booster, 7=reducer</p>|`SNMP agent`|upsOutputSource<p>Update: 30s</p>|
|Output Lines Count|<p>Number of output lines</p>|`SNMP agent`|upsOutputNumLines<p>Update: 30s</p>|
|Output Voltage L1|<p>Output voltage for line 1 in volts</p>|`SNMP agent`|upsOutputVoltage_L1<p>Update: 30s</p>|
|Output Load Percentage L1|<p>Output load as percentage of rated capacity</p>|`SNMP agent`|upsOutputPercentLoad_L1<p>Update: 30s</p>|
|Bypass Lines Count|<p>Number of bypass lines</p>|`SNMP agent`|upsBypassNumLines<p>Update: 30s</p>|
|Bypass Voltage L1|<p>Bypass voltage for line 1 in volts</p>|`SNMP agent`|upsBypassVoltage_L1<p>Update: 30s</p>|
|Active Alarms|<p>Number of active alarm conditions</p>|`SNMP agent`|upsAlarmsPresent<p>Update: 30s</p>|
|Shutdown Type|<p>Type of shutdown configuration</p>|`SNMP agent`|upsShutdownType<p>Update: 30s</p>|
|Shutdown After Delay|<p>Shutdown countdown timer</p>|`SNMP agent`|upsShutdownAfterDelay<p>Update: 30s</p>|
|Startup After Delay|<p>Startup countdown timer</p>|`SNMP agent`|upsStartupAfterDelay<p>Update: 30s</p>|
|Auto Restart|<p>Auto-restart configuration</p>|`SNMP agent`|upsAutoRestart<p>Update: 30s</p>|
|Audible Status|<p>Audible alarm configuration: 1=disabled, 2=enabled, 3=muted</p>|`SNMP agent`|upsConfigAudibleStatus<p>Update: 30s</p>|

## Triggers
|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Low Battery {HOSTNAME}|<p>Triggered when battery status is low</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsBatteryStatus)=3`|High|
|Unknown Battery Status {HOSTNAME}|<p>Triggered when battery status is unknown</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsBatteryStatus)=1`|High|
|Battery Depleted {HOSTNAME}|<p>Triggered when battery is depleted</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsBatteryStatus)=4`|High|
|Battery Charge Less Than 50% {HOSTNAME}|<p>Triggered when battery charge is below 50%</p>|`avg(/SMS_LEGRAND_KEOR_BR_20KVA/upsEstimatedChargeRemaining,5m)<50`|High|
|Critical Battery Less Than 20% {HOSTNAME}|<p>Critical trigger when battery is below 20%</p>|`avg(/SMS_LEGRAND_KEOR_BR_20KVA/upsEstimatedChargeRemaining,3m)<20`|High|
|High Temperature 35C or Higher {HOSTNAME}|<p>Triggered when battery temperature is high</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsBatteryTemperature)>=35`|High|
|Input Voltage L1 Out of Range {HOSTNAME}|<p>Triggered when input voltage L1 is out of range (210-240V)</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsInputVoltage_L1)>240 or last(/SMS_LEGRAND_KEOR_BR_20KVA/upsInputVoltage_L1)<210`|High|
|Input Voltage L2 Out of Range {HOSTNAME}|<p>Triggered when input voltage L2 is out of range (210-240V)</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsInputVoltage_L2)>240 or last(/SMS_LEGRAND_KEOR_BR_20KVA/upsInputVoltage_L2)<210`|High|
|Input Voltage L3 Out of Range {HOSTNAME}|<p>Triggered when input voltage L3 is out of range (210-240V)</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsInputVoltage_L3)>240 or last(/SMS_LEGRAND_KEOR_BR_20KVA/upsInputVoltage_L3)<210`|High|
|Using Battery Power {HOSTNAME}|<p>Triggered when UPS is running on battery power</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsOutputSource)=5`|High|
|Using Booster Mode {HOSTNAME}|<p>Triggered when UPS is using booster mode</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsOutputSource)=6`|High|
|Using Bypass Mode {HOSTNAME}|<p>Triggered when UPS is in bypass mode</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsOutputSource)=4`|High|
|Using Reducer Mode {HOSTNAME}|<p>Triggered when UPS is using reducer mode</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsOutputSource)=7`|High|
|Output Voltage Out of Range {HOSTNAME}|<p>Triggered when output voltage is out of range (200-240V)</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsOutputVoltage_L1)>240 or last(/SMS_LEGRAND_KEOR_BR_20KVA/upsOutputVoltage_L1)<200`|High|
|High Load Greater Than 80% {HOSTNAME}|<p>Triggered when output load exceeds 80%</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsOutputPercentLoad_L1)>80`|High|
|Alarm Present {HOSTNAME}|<p>Triggered when UPS has active alarms</p>|`last(/SMS_LEGRAND_KEOR_BR_20KVA/upsAlarmsPresent)<>0`|High|

## Installation
1. Download and import the template file into your Zabbix 6.2 server
2. Configure the SNMP community string macro `{$SNMP_COMMUNITY}` if different from "sms"
3. Create a new host for your KEOR BR 20KVA UPS
4. Apply the template to the UPS host
5. Configure the host interface with the UPS IP address and SNMP settings
6. Verify connectivity and data collection

## Configuration Notes

### Three-Phase Input Monitoring
- **Input Voltage Range**: 210-240V per phase (adjustable in triggers)
- **Frequency**: Monitored for all three phases (should be ~60Hz in Brazil)
- **Load Balancing**: Monitor all three phases for balanced load distribution

### Single-Phase Output
- **Primary Output**: Only L1 is typically active for single-phase loads
- **Voltage Range**: 200-240V (adjustable based on local standards)
- **Load Monitoring**: Critical threshold set at 80%

### Battery Management
- **Charge Thresholds**: Warning at <50%, Critical at <20%
- **Temperature**: Alert at ≥35°C (suitable for industrial environments)
- **Status Monitoring**: Comprehensive battery condition tracking

### Power Quality
- **Input Tolerance**: Configured for Brazilian power standards
- **Frequency Monitoring**: All phases tracked for stability
- **Voltage Regulation**: Monitors both input and output quality

## Troubleshooting

### Common Issues
1. **SNMP Timeout**: Verify community string and network connectivity
2. **Missing Data**: Check if UPS SNMP agent is enabled
3. **Voltage Alarms**: Adjust trigger thresholds for local power standards
4. **Battery Alerts**: Consider local environmental conditions for temperature thresholds

### SNMP Configuration
- **Community**: Default "sms" (configurable)
- **Version**: SNMPv1/v2c supported
- **Port**: 161 (standard SNMP port)
- **Polling**: 30-second intervals for operational data

## Compatibility
- **UPS Models**: SMS Legrand KEOR BR 20KVA with Net Adapter II
- **Input Configuration**: Three-phase 380V
- **Output Configuration**: Single-phase 220V
- **Zabbix Version**: 6.2 or higher
- **SNMP**: v1/v2c with standard UPS MIB (RFC 1628)

## Technical Specifications
- **47 monitoring items** covering all critical UPS parameters
- **15 intelligent triggers** for proactive alerting
- **RFC 1628 compliance** using standard UPS MIB
- **30-second polling** for optimal monitoring
- **Multi-phase support** for complex power configurations

This template provides enterprise-grade monitoring for SMS Legrand KEOR BR 20KVA systems, ensuring reliable power infrastructure monitoring and comprehensive alerting for critical power events.
