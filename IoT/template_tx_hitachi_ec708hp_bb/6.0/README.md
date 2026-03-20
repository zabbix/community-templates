# tx Hitachi EC708HP-BB

## Description

Template of transmitter Hitachi model EC708HP-BB.

## Overview

Template of transmitter Hitachi model **EC708HP-BB.** This template contains:


* 6 applications
* 19 itens
* 5 triggers


Our applications have itens of the component below:


* Energy
* Forward Power
* Multiplexer
* PSU
* System
* Temperature

## Author

Marcos Sousa and Tadeu Ibns

## Macros used

* $PERCENTUAL_POWER_AVAILABLE: Rate of available the power of equipament - default (0.2 -> 20%)
* $PERCENTUAL_REFLECTED_HIGH: Rate of available the reflected power of equipment - default (0.2 -> 20%) for high triggers
* $PERCENTUAL_REFLECTED_WARNING: Rate of available the reflected power of equipment - default (0.15 -> 15%) for warning triggers
* $PROGRAMMED_POWER: Power programmed of the equipament

## Template links

There aren't template links in this template.


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System -  ALC Refence (V)|<p>System -  ALC Refence (V) systemALCRefenceVoltage.0</p>|`SNMP agent`|systemALCRefenceVoltage.0<p>Update: 1m</p>|
|System - Forward Power|<p>System Forward Power [W] systemForwardPower.0</p>|`SNMP agent`|systemForwardPower.0<p>Update: 15s</p>|
|System - Multiplexer 1PPS Input|<p>System - Multiplexer 1PPS InputmultiplexerSfn1PPsInput. 0 Status of the 1 Pulse Per Second (1PPS) reference for the internal time base. SYNTAX INTEGER { notpresent(0), present(1)..</p>|`SNMP agent`|multiplexerSfn1PPsInput.0<p>Update: 1m</p>|
|System - Multiplexer BTS Alignment|<p>Indicates BTS Alignment. When TSP and Clock alignment is achieved, it means that the equipment is perfectly synchronized with the Network. When just TSP alignment is informed, it means that synchronization still holds but slight jitter (wander) is present (generally due to momentary lost of time base reference). SYNTAX INTEGER { none(0), tsp(1), clk(2), tspclk(3) }</p>|`SNMP agent`|multiplexerSfnBTSAlignment.0<p>Update: 1m</p>|
|System - Multiplexer SFN Info|<p>Status of the SFN information (NSI) in the IIP within the BTS. SYNTAX INTEGER { notpresent(0), present(1) }</p>|`SNMP agent`|multiplexerSfnInfo.0<p>Update: 1m</p>|
|System - Power Amplifier 1 Current|<p>System - Power Amplifier 1 Current power1PA1Current.0.</p>|`SNMP agent`|power1PA1Current.0<p>Update: 1m</p>|
|System - Power Amplifier 2 Current|<p>System - Power Amplifier 2 Current power1PA2Current.0.</p>|`SNMP agent`|power1PA2Current.0<p>Update: 1m</p>|
|System - Programmed Power|<p>System Programmed Power [W] systemProgrammedPower.0.</p>|`SNMP agent`|systemProgrammedPower.0<p>Update: 1h</p>|
|System - PSU1 Output (50V)|<p>System - PSU1 Output (50V) power1PSU1PowerSupply50V.0 Mesurement of the +50V Power Supply 1 output. (Apply Mask 0,0)</p>|`SNMP agent`| power1PSU1PowerSupply50V.0<p>Update: 1m</p>|
|System - PSU1 Output Current|<p>System - PSU1 Output Current power1PSU1PowerSupplyCurrent.0 System - PSU1 Output Current Mesurement of the Power Supply 1 total current consumption.</p>|`SNMP agent`|power1PSU1PowerSupplyCurrent.0 <p>Update: 1m</p>|
|System - PSU2 Output Current|<p>System - PSU1 Voltage power1PSU1ACLineVoltage.0. </p>|`SNMP agent`|power1PSU1ACLineVoltage.0<p>Update: 1m</p>|
|System - PSU1 Voltage|<p>System - PSU1 Voltage power1PSU1ACLineVoltage.0.</p>|`SNMP agent`|power1PSU1ACLineVoltage.0<p>Update: 1m</p>|
|System - PSU2 Voltage|<p>System - PSU2 Voltage power1PSU2ACLineVoltage.0 System - PSU2 Voltage Measurement of the Power Supply 2 Input Voltage.</p>|`SNMP agent`|power1PSU2ACLineVoltage.0<p>Update: 1m</p>|
|System - Reflected Power|<p>Measured of RF total reflected power at mask filter output.(Apply Mask 0,00).</p>|`SNMP agent`| systemReflectedPower.0<p>Update: 15s</p>|
|System - Reflectometer (V)|<p>System - Reflectometer (V) systemReflectometerVoltage.0</p>|`SNMP agent`| systemReflectometerVoltage.0<p>Update: 1m</p>|
|System - Uptime|<p>System Uptime</p>|`SNMP agent`|sysUpTime.0<p>Update: 1h</p>|
|Temperature - Power Amplifier |<p>Measurement of the Power Supply 1 Temperature (Celcius).</p>|`SNMP agent`|exciterPower1SupplyTemperature.0<p>Update: 5m</p>|
|Temperature - PSU1|<p>Temperature - PSU1 power1PSU1Temperature.0 Measurement of the Power Supply 1 Temperature (Celcius).</p>|`SNMP agent`|power1PSU1Temperature.0 <p>Update: 5m</p>|
|Temperature - PSU2|<p>Temperature - PSU2 power1PSU2Temperature.0 Measurement of the Power Supply 2 Temperature (Celcius).</p>|`SNMP agent`|power1PSU2Temperature.0<p>Update: 5m</p>|



## Triggers

|Severity|Name|Expression|
|----|-----------|----|
| High | <p>{HOST.NAME} - Forward Power - Low</p> | last(/Template TX Hitachi EC708HP-BB/systemForwardPower.0)<=({$PROGRAMMED_POWER} - ({$PROGRAMMED_POWER} * {$PERCENTUAL_POWER_AVAILABLE}))
|Information | 	<p>{HOST.NAME} - Forward Power - Nodata (5m)</p> | nodata(/Template TX Hitachi EC708HP-BB/systemForwardPower.0,5m)=1 |
|Warning | <p>{HOST.NAME} - Reflected Power >= 15%</p> |last(/Template TX Hitachi EC708HP-BB/systemReflectedPower.0)>=({$PROGRAMMED_POWER} * {$PERCENTUAL_REFLECTED_WARNING}) |
| High | <p>{HOST.NAME} - Reflected Power >= 20% </p> | last(/Template TX Hitachi EC708HP-BB/systemReflectedPower.0)>=({$PROGRAMMED_POWER} * {$PERCENTUAL_REFLECTED_HIGH})|
| Warning | <p>{HOST.NAME} No data - without data collected for more 24h</p> |nodata(/Template TX Hitachi EC708HP-BB/systemForwardPower.0,24h)=1|