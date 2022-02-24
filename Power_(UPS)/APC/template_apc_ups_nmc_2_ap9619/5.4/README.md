# APC NMC 2 AP9619

## Overview

This template was originaly created for the AP9619 card, but in version 2 now support more UPS's.  
Tested on:


APC Symmetra PX40 3Phase UPS  
APC Smart-UPS VT 20kVA 3Phase UPS  
Smart-UPS RT 7500 RM XL  
and more...


It gathers input and output values from all three phases. I tried to make it as universal as i could so it can be used with single phase ups's as well. I have disable some of the items on the template for the reason that my ups didn't support them, feel free to try them if they are supported by your UPS.


Changelog V2:


Added more items for single phase ups's and triggers.


 


thanks,  
petroska



## Author

petroska

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Probe Status|<p>-</p>|`SNMP agent`|iemStatusProbeStatus<p>Update: 3600</p>|
|Output Current L1|<p>The output current in 0.1 amperes drawn by the load on the UPS, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputCurrentL1<p>Update: 30s</p>|
|Latest cause for switching to battery power|<p>The reason for the occurrence of the last transfer to UPS battery power. The variable is set to: - noTransfer(1) -- if there is no transfer yet. - highLineVoltage(2) -- if the transfer to battery is caused by an over voltage greater than the high transfer voltage. - brownout(3) -- if the duration of the outage is greater than five seconds and the line voltage is between 40% of the rated output voltage and the low transfer voltage. - blackout(4) -- if the duration of the outage is greater than five seconds and the line voltage is between 40% of the rated output voltage and ground. - smallMomentarySag(5) -- if the duration of the outage is less than five seconds and the line voltage is between 40% of the rated output voltage and the low transfer voltage. - deepMomentarySag(6) -- if the duration of the outage is less than five seconds and the line voltage is between 40% of the rated output voltage and ground. The variable is set to - smallMomentarySpike(7) -- if the line failure is caused by a rate of change of input voltage less than ten volts per cycle. - largeMomentarySpike(8) -- if the line failure is caused by a rate of change of input voltage greater than ten volts per cycle. - selfTest(9) -- if the UPS was commanded to do a self test. - rateOfVoltageChange(10) -- if the failure is due to the rate of change of the line voltage.</p>|`SNMP agent`|upsAdvInputLineFailCause<p>Update: 60s</p>|
|Input Voltage L2|<p>The input voltage in VAC, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseInputVoltageL2<p>Update: 30s</p>|
|Battery Capacity|<p>The remaining battery capacity expressed in percent of full capacity.</p>|`SNMP agent`|upsAdvBatteryCapacity<p>Update: 30s</p>|
|Battery Amps [HighPrec]|<p>The battery current in tenths of Amps.</p>|`SNMP agent`|upsHighPrecBatteryCurrent<p>Update: 30s</p>|
|Output Load L1|<p>The output load in VA, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputLoadL1<p>Update: 30s</p>|
|Output Current L3|<p>The output current in 0.1 amperes drawn by the load on the UPS, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputCurrentL3<p>Update: 30s</p>|
|Output Load L2|<p>The output load in VA, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputLoadL2<p>Update: 30s</p>|
|Date of manufacture|<p>The date when the UPS was manufactured in mm/dd/yy (or yyyy) format.</p>|`SNMP agent`|upsAdvIdentDateOfManufacture<p>Update: 3600</p>|
|Battery Temperature|<p>The current internal UPS temperature expressed in Celsius.</p>|`SNMP agent`|upsAdvBatteryTemperature<p>Update: 30s</p>|
|Battery actual Volts|<p>The actual battery bus voltage in Volts.</p>|`SNMP agent`|upsAdvBatteryActualVoltage<p>Update: 30s</p>|
|Model|<p>The UPS model name (e.g. 'APC Smart-UPS 600').</p>|`SNMP agent`|upsBasicIdentModel<p>Update: 3600</p>|
|Input Current L1|<p>The input current in 0.1 amperes, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseInputCurrentL1<p>Update: 30s</p>|
|Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|Probe Name|<p>A descriptive name for the probe set by the user.</p>|`SNMP agent`|iemStatusProbeName<p>Update: 3600</p>|
|Input Frequency [HighPrec]|<p>-</p>|`SNMP agent`|upsHighPrecInputFrequency<p>Update: 30s</p>|
|Battery total DC current|<p>The total DC current in Amps.</p>|`SNMP agent`|upsAdvTotalDCCurrent<p>Update: 30s</p>|
|Battery total DC current [HighPrec]|<p>The total DC current in tenths of Amps. not always supported</p>|`SNMP agent`|upsHighPrecTotalDCCurrent<p>Update: 30s</p>|
|Output Load Current|<p>-</p>|`SNMP agent`|upsAdvOutputCurrent<p>Update: 30s</p>|
|Input Voltage|<p>The current utility line voltage in VAC.</p>|`SNMP agent`|upsAdvInputLineVoltage<p>Update: 30s</p>|
|Battery nominal Volts [HighPrec]|<p>-</p>|`SNMP agent`|upsHighPrecBatteryNominalVoltage<p>Update: 30s</p>|
|Input Frequency|<p>The current input frequency to the UPS system in Hz.</p>|`SNMP agent`|upsAdvInputFrequency<p>Update: 30s</p>|
|Output Voltage L1|<p>The output voltage in VAC, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputVoltageL1<p>Update: 30s</p>|
|Name|<p>An 8 byte ID string identifying the UPS. This object can be set by the administrator.</p>|`SNMP agent`|upsBasicIdentName<p>Update: 3600</p>|
|Output Voltage L2|<p>The output voltage in VAC, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputVoltageL2<p>Update: 30s</p>|
|Firmware Revision|<p>The firmware revision of the UPS system's microprocessor.</p>|`SNMP agent`|upsAdvIdentFirmwareRevision<p>Update: 3600</p>|
|Output Load|<p>The current UPS load expressed in percent of rated capacity.</p>|`SNMP agent`|upsAdvOutputLoad<p>Update: 30s</p>|
|Input Current L2|<p>The input current in 0.1 amperes, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseInputCurrentL2<p>Update: 30s</p>|
|Input Voltage [HighPrec]|<p>The current utility line voltage in tenths of VAC.</p>|`SNMP agent`|upsHighPrecInputLineVoltage<p>Update: 30s</p>|
|Output Load L3|<p>The output load in VA, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputLoadL3<p>Update: 30s</p>|
|Battery Capacity [HighPrec]|<p>The remaining battery capacity expressed in tenths of percent of full capacity.</p>|`SNMP agent`|upsHighPrecBatteryCapacity<p>Update: 30s</p>|
|Battery Amps|<p>The battery current in Amps.</p>|`SNMP agent`|upsAdvBatteryCurrent<p>Update: 30s</p>|
|Battery actual Volts [HighPrec]|<p>The actual battery bus voltage in tenths of Volts.</p>|`SNMP agent`|upsHighPrecBatteryActualVoltage<p>Update: 30s</p>|
|Battery Status|<p>The status of the UPS batteries. A batteryLow(3) value indicates the UPS will be unable to sustain the current load, and its services will be lost if power is not restored. The amount of run time in reserve at the time of low battery can be configured by the upsAdvConfigLowBatteryRunTime. A batteryInFaultCondition(4)value indicates that a battery installed has an internal error condition.</p>|`SNMP agent`|upsBasicBatteryStatus<p>Update: 30s</p>|
|Battery Temperature [HighPrec]|<p>The current internal UPS temperature expressed in tenths of degrees Celsius.</p>|`SNMP agent`|upsHighPrecBatteryTemperature<p>Update: 30s</p>|
|Output Voltage|<p>-</p>|`SNMP agent`|upsAdvOutputVoltage<p>Update: 30s</p>|
|Output Power L3|<p>The output power in Watts, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputPowerL3<p>Update: 30s</p>|
|Output Power L1|<p>The output power in Watts, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputPowerL1<p>Update: 30s</p>|
|Battery Runtime|<p>The UPS battery run time remaining before battery exhaustion.</p>|`SNMP agent`|upsAdvBatteryRunTimeRemaining<p>Update: 30s</p>|
|Input Voltage L3|<p>The input voltage in VAC, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseInputVoltageL3<p>Update: 30s</p>|
|Input Current L3|<p>The input current in 0.1 amperes, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseInputCurrentL3<p>Update: 30s</p>|
|Output Power L2|<p>-</p>|`SNMP agent`|upsPhaseOutputPowerL2<p>Update: 30s</p>|
|Battery replace status|<p>Indicates whether the UPS batteries need replacing.</p>|`SNMP agent`|upsAdvBatteryReplaceIndicator<p>Update: 3600</p>|
|Internal temperature|<p>The actual internal temperature of the UPS system in Celsius.</p>|`SNMP agent`|upsBasicSystemInternalTemperature<p>Update: 30s</p>|
|Time on battery|<p>The elapsed time since the UPS has switched to battery power.</p>|`SNMP agent`|upsBasicBatteryTimeOnBattery<p>Update: 30s</p>|
|Battery nominal Volts|<p>The nominal battery voltage in Volts.</p>|`SNMP agent`|upsAdvBatteryNominalVoltage<p>Update: 30s</p>|
|Output Current L2|<p>The output current in 0.1 amperes drawn by the load on the UPS, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputCurrentL2<p>Update: 30s</p>|
|Output Voltage L3|<p>The output voltage in VAC, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputVoltageL3<p>Update: 30s</p>|
|Output Phase capacity L1|<p>The percentage of the UPS power capacity in Watts at redundancy @ (n + x) presently being used on this output phase, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputPercentPowerL1<p>Update: 30s</p>|
|Probe Temperature|<p>The current temperature reading from the probe displayed in the units shown in the 'iemStatusProbeTempUnits' OID (Celsius or Fahrenheit).</p>|`SNMP agent`|iemStatusProbeCurrentTemp<p>Update: 30s</p>|
|Probe Humidity|<p>The current humidity reading from the probe in percent relative humidity.</p>|`SNMP agent`|iemStatusProbeCurrentHumid<p>Update: 30s</p>|
|Output Phase capacity L2|<p>The percentage of the UPS power capacity in Watts at redundancy @ (n + x) presently being used on this output phase, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputPercentPowerL2<p>Update: 30s</p>|
|Output Phase capacity L3|<p>The percentage of the UPS power capacity in Watts at redundancy @ (n + x) presently being used on this output phase, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseOutputPercentPowerL3<p>Update: 30s</p>|
|Input Voltage L1|<p>The input voltage in VAC, or -1 if it's unsupported by this UPS.</p>|`SNMP agent`|upsPhaseInputVoltageL1<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

