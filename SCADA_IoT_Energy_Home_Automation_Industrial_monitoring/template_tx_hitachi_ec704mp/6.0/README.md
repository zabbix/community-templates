# tx Hitachi EC704MP

## Description

Template of transmissor Hitachi model EC704MP.

## Overview

Template of transmissor Hitachi model **EC704MP.** This template contains:


* 8 applications
* 61 itens
* 4 triggers


Our applications have itens of the component below:


* Driver Measurements
* General
* Power Amplifiers
* Power Setup
* Power Supply
* SFN
* Template module ICMP Ping:status
* System

## Author

Marcos Sousa and Tadeu Ibns

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
|Status Power 8|<p>Status of power 8.</p>|`SNMP agent`|system.power8<p>Update: 1m</p>|
|Output Voltage 1|<p>Measure of Input voltage 1 for item power1PSU1PowerSupply50V</p>|`SNMP agent`|power1.psu1.powersupply.50v<p>Update: 1m</p>|
|Temperature 2|<p>Measure of Temperature 2 for item power1PSU2PFCTemperature</p>|`SNMP agent`|power1.psu2.pfc.temperature<p>Update: 1m</p>|
|PA3 Current|<p>Measure of Power Amplifier for item power1PA3Current</p>|`SNMP agent`|power1PA3.current<p>Update: 1m</p>|
|PA4 Current|<p>Measure of Power Amplifier for item power1PA4Current</p>|`SNMP agent`|power1PA4.current<p>Update: 1m</p>|
|Excited Power +5V|<p>Status of excited power +5V</p>|`SNMP agent`|system.excitedpower.5v<p>Update: 1m</p>|
|PA3 Temperature|<p>Measure of Power Amplifier for item power1PA3Temperature.</p>|`SNMP agent`|power1PA3.temperature<p>Update: 1m</p>|
|FAN 3 Rotation|<p>Measure of Input Air Temperature for power1FAN3Rotation.</p>|`SNMP agent`|power1.fan3.rotation<p>Update: 1m</p>|
|Status Power 5|<p>Status of power 5.</p>|`SNMP agent`|system.power5<p>Update: 1m</p>|
|SFN Info|<p>Alarm of SFN Info Expected values Integer: - 0 off; - 1 error; - 2 on</p>|`SNMP agent`|multiplexer.Sfn.Info<p>Update: 1m</p>|
|Status Power 11|<p>Status of power 11.</p>|`SNMP agent`|system.power11<p>Update: 1m</p>|
|Pre Driver Current|<p>Measure of Driver measurements for power1PreDriverCurrent.</p>|`SNMP agent`|power1.predriver.current<p>Update: 1m</p>|
|PA2 Vgs Feedback|<p>Measure of Power Amplifier for item power1PA2vgsfeedback.</p>|`SNMP agent`|power1PA2.vgsfeedback<p>Update: 1m</p>|
|ALC Reference Voltage|<p>Value of ALC Reference Voltage.</p>|`SNMP agent`|system.alc.reference.voltage<p>Update: 1m</p>|
|PA1 Temperature|<p>Measure of Power Amplifier for item power1PA1Temperature.</p>|`SNMP agent`|power1PA1.temperature<p>Update: 1m</p>|
|BTS Alignment|<p>Alarm of 1 PPS Input Expected values Integer: - 0 - none; - 1 - CLK; - 2 - TSP - 3 - tsPandCLK</p>|`SNMP agent`|multiplexer.sfn.bts.alignment<p>Update: 1m</p>|
|Input Voltage 2|<p>Measure of Input voltage 1 for item power1PSU2ACLineVoltage</p>|`SNMP agent`|power1.psu2.acline.voltage<p>Update: 1m</p>|
|PA2 Temperature|<p>Measure of Power Amplifier for item power1PA2Temperature.</p>|`SNMP agent`|power1PA2.temperature<p>Update: 1m</p>|
|FAN 1 Rotation|<p>Measure of Input Air Temperature for power1FAN1Rotation.</p>|`SNMP agent`|power1.fan1.rotation<p>Update: 1m</p>|
|Output Current 1|<p>Measure of Input voltage 1 for item power1PSU1PowerSupplyCurrent</p>|`SNMP agent`|power1.psu1.powersupply.current<p>Update: 1m</p>|
|Driver Current|<p>Measure of Driver measurements for power1DriverCurrent</p>|`SNMP agent`|power1.driver.current<p>Update: 1m</p>|
|FWD Output Power|<p>Measure of Input Air Temperature for power1FWDOutputPower</p>|`SNMP agent`|power1.fwdoutput.power<p>Update: 1m</p>|
|PA4 Temperature|<p>Measure of Power Amplifier for item power1PA4Temperature.</p>|`SNMP agent`|power1PA4.temperature<p>Update: 1m</p>|
|Input Air Temp Celcius|<p>-</p>|`Calculated`|power1.input.air.temperature.celcius<p>Update: 15s</p>|
|PA1 Temperature custom|<p>Measure of Power Amplifier for item power1PA1Temperature.</p>|`Calculated`|power1PA1.temperature.custom<p>Update: 1m</p>|
|FAN 2 Rotation|<p>Measure of Input Air Temperature for power1FAN2Rotation.</p>|`SNMP agent`|power1.fan2.rotation<p>Update: 1m</p>|
|System Model|<p>Name of equipament.</p>|`SNMP agent`|system.model<p>Update: 1m</p>|
|Current Carrier|<p>Measure of Input Air Temperature for power1CurrentCarrier.</p>|`SNMP agent`|power1.current.carrier<p>Update: 1m</p>|
|PA1 Current|<p>Measure of Power Amplifier for item power1PA1Current</p>|`SNMP agent`|power1PA1.current<p>Update: 1m</p>|
|Reflectometer Voltage|<p>-</p>|`SNMP agent`|system.reflectometer.voltage<p>Update: 1m</p>|
|System Battery|<p>Status of battery</p>|`SNMP agent`|system.battery<p>Update: 1m</p>|
|Status Power 10|<p>Status of power 10.</p>|`SNMP agent`|system.power10<p>Update: 1m</p>|
|Status Power 1|<p>Status of power 1.</p>|`SNMP agent`|system.power1<p>Update: 1m</p>|
|Status Power 9|<p>Status of power 9.</p>|`SNMP agent`|system.power9<p>Update: 1m</p>|
|Excited Power +3.3V|<p>Status of excited power +3.3V</p>|`SNMP agent`|system.excitedpower.3.3v<p>Update: 1m</p>|
|PA4 Vgs Feedback|<p>Measure of Power Amplifier for item power1PA4vgsfeedback.</p>|`SNMP agent`|power1PA4.vgsfeedback<p>Update: 1m</p>|
|Software Version|<p>Version the software of equipament.</p>|`SNMP agent`|system.software.version<p>Update: 1m</p>|
|Excited Power +15V|<p>Status of excited power +15V</p>|`SNMP agent`|system.excitedpower.15v<p>Update: 1m</p>|
|Status Power 7|<p>Status of power 7.</p>|`SNMP agent`|system.power7<p>Update: 1m</p>|
|Forward Power|<p>Voltage of forward Power.</p>|`SNMP agent`|system.current.alarm2<p>Update: 15s</p>|
|VGS Peak|<p>Measure of Input Air Temperature for power1VGSPeak.</p>|`SNMP agent`|power1.vgs.peak<p>Update: 1m</p>|
|Status Power 3|<p>Status of power 3.</p>|`SNMP agent`|system.power3<p>Update: 1m</p>|
|PA3 Vgs Feedback|<p>Measure of Power Amplifier for item power1PA3vgsfeedback.</p>|`SNMP agent`|power1PA3.vgsfeedback<p>Update: 1m</p>|
|Status Power 2|<p>Status of power 2.</p>|`SNMP agent`|system.power2<p>Update: 1m</p>|
|Output Voltage 2|<p>Measure of Input voltage 1 for item power1PSU2PowerSupply50V</p>|`SNMP agent`|power1.psu2.powersupply.50v<p>Update: 1m</p>|
|Output Current 2|<p>Measure of Input voltage 1 for item power1PSU2PowerSupplyCurrent</p>|`SNMP agent`|power1.psu2.powersupply.current<p>Update: 1m</p>|
|Status Power 6|<p>Status of power 6.</p>|`SNMP agent`|system.power6<p>Update: 1m</p>|
|Excited Power +28V|<p>Status of excited power +28V</p>|`SNMP agent`|system.excitedpower.28v<p>Update: 1m</p>|
|PA2 Current|<p>Measure of Power Amplifier for item power1PA2Current</p>|`SNMP agent`|power1PA2.current<p>Update: 1m</p>|
|Temperature 1|<p>Measure of Temperature 1 for item power1PSU1DCDCTemperature</p>|`SNMP agent`|power1.psu1.dcdc.temperature<p>Update: 1m</p>|
|Driver Input voltage|<p>Measure of Driver measurements for power1DriverInputVoltage</p>|`SNMP agent`|power1.driver.inputvoltage<p>Update: 1m</p>|
|PA1 Vgs Feedback|<p>Measure of Power Amplifier for item power1PA1vgsfeedback.</p>|`SNMP agent`|power1PA1.vgsfeedback<p>Update: 1m</p>|
|RFD Output Power|<p>Measure of Input Air Temperature for power1RFDOutputPower</p>|`SNMP agent`|power1.rfdoutput.power<p>Update: 1m</p>|
|Input Air Temperature|<p>Temperature of input Air Temperature.</p>|`SNMP agent`|power1.input.air.temperature<p>Update: 15s</p>|
|Input Voltage 1|<p>Measure of Input voltage 1 for item power1PSU1ACLineVoltage</p>|`SNMP agent`|power1.psu1.acline.voltage<p>Update: 1m</p>|
|Programmed Power|<p>Value programmed of forward Power.</p>|`SNMP agent`|system.current.alarm<p>Update: 15s</p>|
|1 PPS Input|<p>Alarm of 1 PPS Input Expected values Integer: - 0 - notPresent; - 1 - error; - 2 - present</p>|`SNMP agent`|multiplexer.Sfn.1PPsInput<p>Update: 15s</p>|
|Status Power 4|<p>Status of power 4.</p>|`SNMP agent`|system.power4<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.
