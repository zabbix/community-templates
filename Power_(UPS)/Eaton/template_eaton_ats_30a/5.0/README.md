# Eaton ATS 230V 30A

## Overview

Template for Eaton ATS 30A


64 Items  
25 Triggers



## Author

Peter Stanke

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|The output voltage|<p>-</p>|`SNMP agent`|atsOutputVoltage<p>Update: 5m</p>|
|Internal auxiliary power is reported as failure (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureAuxPower_source1<p>Update: 1m</p>|
|The present time in hh:mm:ss text format|<p>-</p>|`SNMP agent`|atsConfigTimeTextTime<p>Update: 5m</p>|
|Setting of input trip voltage (Source 1)|<p>-</p>|`SNMP agent`|atsConfigInputTrip_source1<p>Update: 1m</p>|
|Setting of input recovered time (Source 1)|<p>-</p>|`SNMP agent`|atsConfigInputRecover_source1<p>Update: 1m</p>|
|Set the detected time of fast detected AC blackout by the comparing cycles (Source 1)|<p>-</p>|`SNMP agent`|atsConfigInputMaxTime_source1<p>Update: 1m</p>|
|The manufacturer name of SNMP-Agent|<p>-</p>|`SNMP agent`|atsAgentManufacturer<p>Update: 5m</p>|
|The relay, SCR and thermal switch fail|<p>-</p>|`SNMP agent`|atsFailureSwitchFault<p>Update: 1m</p>|
|A voltage brownout was detected (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureBrownout_source2<p>Update: 1m</p>|
|The status of input relay is OPEN (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureRelayOpen_source1<p>Update: 1m</p>|
|The status of input SCR is OPEN (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureSCROpen_source1<p>Update: 1m</p>|
|A voltage drop was detected  (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureDrop_source2<p>Update: 1m</p>|
|The operation mode|<p>-</p>|`SNMP agent`|atsMessureOperationMode<p>Update: 1m</p>|
|Setting of input brownout low voltage (Source 1)|<p>-</p>|`SNMP agent`|atsConfigInputBrownoutLow_source1<p>Update: 1m</p>|
|Setting of input recovered time (Source 2)|<p>-</p>|`SNMP agent`|atsConfigInputRecover_source2<p>Update: 1m</p>|
|Device model name|<p>-</p>|`SNMP agent`|atsIdentModel<p>Update: 1d</p>|
|Setting of input trip voltage (Source 2)|<p>-</p>|`SNMP agent`|atsConfigInputTrip_source2<p>Update: 1m</p>|
|The status of input SCR is OPEN (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureSCROpen_source2<p>Update: 1m</p>|
|Setting of input brownout high voltage (Source 2)|<p>-</p>|`SNMP agent`|atsConfigInputBrownoutHigh_source2<p>Update: 1m</p>|
|The ambient temperature is over|<p>-</p>|`SNMP agent`|atsFailureOverTemperature<p>Update: 1m</p>|
|The output current|<p>-</p>|`SNMP agent`|atsOutputCurrent<p>Update: 5m</p>|
|The AC Blackout Sensitivity|<p>-</p>|`SNMP agent`|atsConfigSensitivity<p>Update: 1m</p>|
|The prefered source|<p>-</p>|`SNMP agent`|atsConfigPreferred<p>Update: 5m</p>|
|The input frequency (Source 2)|<p>-</p>|`SNMP agent`|atsInputFrequency_source2<p>Update: 5m</p>|
|The input frequency is out of range (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureFrequency_source2<p>Update: 1m</p>|
|Device ID codes|<p>-</p>|`SNMP agent`|atsIdentIDCodes<p>Update: 1d</p>|
|Device serial number|<p>-</p>|`SNMP agent`|atsIdentSerialNumber<p>Update: 1d</p>|
|The input is not operable (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureNotOperable_source1<p>Update: 1m</p>|
|Internal auxiliary power is reported as failure (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureAuxPower_source2<p>Update: 1m</p>|
|The firmware version of SNMP-Agent|<p>-</p>|`SNMP agent`|atsAgentVersion<p>Update: 1d</p>|
|There is no output|<p>-</p>|`SNMP agent`|atsFailureNoOutput<p>Update: 1m</p>|
|The input frequency is out of range (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureFrequency_source1<p>Update: 1m</p>|
|The status of input relay is SHORT (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureRelayShort_source2<p>Update: 1m</p>|
|Setting of input brownout high voltage (Source 1)|<p>-</p>|`SNMP agent`|atsConfigInputBrownoutHigh_source1<p>Update: 1m</p>|
|The internal temperature (in Fahrenheit)|<p>-</p>|`SNMP agent`|atsMeasureTemperatureF<p>Update: 1m</p>|
|The internal temperature (in Celsius)|<p>-</p>|`SNMP agent`|atsMeasureTemperatureC<p>Update: 5m</p>|
|The output current is over|<p>-</p>|`SNMP agent`|atsFailureOutputOC<p>Update: 1m</p>|
|The input is not operable (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureNotOperable_source2<p>Update: 1m</p>|
|The status of input relay is OPEN (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureRelayOpen_source2<p>Update: 1m</p>|
|Setting of input brownout low voltage (Source 2)|<p>-</p>|`SNMP agent`|atsConfigInputBrownoutLow_source2<p>Update: 1m</p>|
|The status of input SCR is SHORT (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureSCRShort_source2<p>Update: 1m</p>|
|Set the detected delta RMS voltage of fast detected AC blackout by the comparing cycles (Source 1)|<p>-</p>|`SNMP agent`|atsConfigInputMaxVoltage_source1<p>Update: 1m</p>|
|A voltage drop was detected  (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureDrop_source1<p>Update: 1m</p>|
|The input frequency (Source 1)|<p>-</p>|`SNMP agent`|atsInputFrequency_source1<p>Update: 5m</p>|
|The ATS run time|<p>-</p>|`SNMP agent`|atsMessureRunTime<p>Update: 5m</p>|
|The released date|<p>-</p>|`SNMP agent`|atsIdentRelease<p>Update: 1d</p>|
|The input voltage (Source 2)|<p>-</p>|`SNMP agent`|atsInputVoltage_source2<p>Update: 5m</p>|
|A voltage brownout was detected (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureBrownout_source1<p>Update: 1m</p>|
|The status of input SCR thermal is over (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureSCRThermal_source1<p>Update: 1m</p>|
|The status of upgrade progress|<p>-</p>|`SNMP agent`|atsUpgradeProcess<p>Update: 10m</p>|
|The step of ATS F/W upgrade|<p>-</p>|`SNMP agent`|atsUpgradeStep<p>Update: 10m</p>|
|The percentage of current progress (program or read)|<p>-</p>|`SNMP agent`|atsUpgradePercentage<p>Update: 1m</p>|
|The transfered times|<p>-</p>|`SNMP agent`|atsMessureTransferedTimes<p>Update: 10m</p>|
|The activity of source test|<p>-</p>|`SNMP agent`|atsConfigTest<p>Update: 1m</p>|
|Set the detected time of fast detected AC blackout by the comparing cycles (Source 2)|<p>-</p>|`SNMP agent`|atsConfigInputMaxTime_source2<p>Update: 1m</p>|
|The present date in MM/DD/YYYY text format|<p>-</p>|`SNMP agent`|atsConfigTimeTextDate<p>Update: 5m</p>|
|Set the detected delta RMS voltage of fast detected AC blackout by the comparing cycles (Source 2)|<p>-</p>|`SNMP agent`|atsConfigInputMaxVoltage_source2<p>Update: 1m</p>|
|The status of input relay is SHORT (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureRelayShort_source1<p>Update: 1m</p>|
|The status of input SCR is SHORT (Source 1)|<p>-</p>|`SNMP agent`|atsInputFailureSCRShort_source1<p>Update: 1m</p>|
|Device F/W version|<p>-</p>|`SNMP agent`|atsIdentFWVersion<p>Update: 1d</p>|
|The input voltage (Source 1)|<p>-</p>|`SNMP agent`|atsInputVoltage_source1<p>Update: 5m</p>|
|The RTC timer value (since 1/1/2000 00:00:00)|<p>-</p>|`SNMP agent`|atsConfigTimeRTC<p>Update: 10m</p>|
|The status of input SCR thermal is over (Source 2)|<p>-</p>|`SNMP agent`|atsInputFailureSCRThermal_source2<p>Update: 1m</p>|
|The link status of ModBUS communication to ATS device|<p>-</p>|`SNMP agent`|atsAgentModbusLink<p>Update: 5m</p>|


## Triggers

There are no triggers in this template.

