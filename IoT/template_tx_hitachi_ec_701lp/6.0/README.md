# tx Hitachi EC701LP

## Description

Template of transmitter Hitachi model EC701LP.

## Overview

Template of transmitter Hitachi model **EC701LP.** This template contains:


* 7 applications
* 18 itens
* 5 triggers


Our applications have itens of the component below:


* Energy
* Forward Power
* Multiplexer
* Power Amplifier
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
|System -  ALC Refence (V)|<p>System -  ALC Refence (V) alcVoltage.0</p>|`SNMP agent`|alcVoltage.0<p>Update: 1m</p>|
|System - Forward Power|<p>System - Forward Power forwardPower.0</p>|`SNMP agent`|forwardPower.0<p>Update: 15s</p>|
|System - Multiplexer 1PPS Input|<p>Status of the 1 Pulse Per Second (1PPS) reference for the internal time base. SYNTAX INTEGER { notpresent(0), present(1).</p>|`SNMP agent`|ppsInput.0<p>Update: 1m</p>|
|PA3 Current|<p>Measure of Power Amplifier for item power1PA3Current</p>|`SNMP agent`|power1PA3.current<p>Update: 1m</p>|
|System - Multiplexer BTS Alignment|<p>Indicates BTS Alignment. When TSP and Clock alignment is achieved, it means that the equipment is perfectly synchronized with the Network. When just TSP alignment is informed, it means that synchronization still holds but slight jitter (wander) is present (generally due to momentary lost of time base reference). SYNTAX INTEGER { none(0), tsp(1), clk(2), tspclk(3) }</p>|`SNMP agent`|btsAlignment.0<p>Update: 1m</p>|
|System - Multiplexer SFN Info|<p>Status of the SFN information (NSI) in the IIP within the BTS. SYNTAX INTEGER { notpresent(0), present(1) }</p>|`SNMP agent`|sfnInfo.0<p>Update: 1m</p>|
|System - Power Amplifier Current|<p>System - Power Amplifier Current Power Amplifier Current.</p>|`SNMP agent`|paCurrent.0<p>Update: 1m</p>|
|System - PSU1 Output (50V)|<p>System - PSU1 Output (50V) exciterPower1Supply50v.0.</p>|`SNMP agent`|exciterPower1Supply50v.0<p>Update: 1m</p>|
|System - PSU1 Output Current|<p>System - PSU1 Output Current Mesurement of the Power Supply 1 total current consumption.</p>|`SNMP agent`|exciterPower1SupplyCurrent.0<p>Update: 1m</p>|
|System - PSU1 Voltage|<p>System - PSU1 Voltage power1PSU1ACLineVoltage.0</p>|`SNMP agent`|exciterPower1SupplyAc.0<p>Update: 1m</p>|
|System - PSU2 Output (50V)|<p>System - PSU2 Output (50V) Mesurement of the +50V Power Supply 1 output.(Apply Mask 0,0).</p>|`SNMP agent`|exciterPower2Supply50v.0 <p>Update: 1m</p>|
|System - PSU2 Output Current|<p>System - PSU2 Output Current Mesurement of the Power Supply 2 total current consumption.</p>|`SNMP agent`|power1PSU2PowerSupplyCurrent.0<p>Update: 1m</p>|
|System - PSU2 Voltage|<p>System - PSU2 Voltage Measurement of the Power Supply 2 Input Voltage.</p>|`SNMP agent`|exciterPower2SupplyAc.0<p>Update: 1m</p>|
|System - Reflected Power|<p>Measured of RF total reflected power at mask filter output.(Apply Mask 0,00).</p>|`SNMP agent`|reflectedPower.0<p>Update: 1m</p>|
|System - Reflectometer (V)|<p>System - Reflectometer (V) reflectedPowerSensorVoltage.0</p>|`SNMP agent`|power1PA1.temperature<p>Update: 1m</p>|
|System - Uptime|<p>System Uptime</p>|`SNMP agent`|sysUpTime.0<p>Update: 1h</p>|
|Temperature - Power Amplifier |<p>Measurement of the Power Supply 1 Temperature (Celcius).</p>|`SNMP agent`|exciterPower1SupplyTemperature.0<p>Update: 5m</p>|
|Temperature - PSU1|<p>Measure of Input Air Temperature for power1FAN1Rotation.</p>|`SNMP agent`|power1.fan1.rotation<p>Update: 1m</p>|
|Temperature - PSU2|<p>Measurement of the Power Supply 2 Temperature (Celcius).</p>|`SNMP agent`|exciterPower2SupplyTemperature.0<p>Update: 5m</p>|



## Triggers

|Severity|Name|Expression|
|----|-----------|----|
| High | <p>{HOST.NAME} - Forward Power - Low</p> | last(/Template TX Hitachi EC7X0LP/forwardPower.0)<=({$PROGRAMMED_POWER} - ({$PROGRAMMED_POWER} * {$PERCENTUAL_POWER_AVAILABLE}))
|Information | 	<p>{HOST.NAME} - Forward Power - Nodata (5m)</p> | nodata(/Template TX Hitachi EC7X0LP/forwardPower.0,5m)=1 |
|Warning | <p>{HOST.NAME} - Reflected Power >= 15%</p> | last(/Template TX Hitachi EC7X0LP/reflectedPower.0)>=({$PROGRAMMED_POWER} * {$PERCENTUAL_REFLECTED_WARNING}) {HOST.NAME} - Reflected Power >= 15% |
| High | <p>{HOST.NAME} - Reflected Power >= 20% </p> | last(/Template TX Hitachi EC7X0LP/reflectedPower.0)>=({$PROGRAMMED_POWER} * {$PERCENTUAL_REFLECTED_HIGH})|
| Warning | <p>{HOST.NAME} No data - without data collected for more 24h</p> | nodata(/Template TX Hitachi EC7X0LP/forwardPower.0,24h)=1|