# PitON

## Overview

This template for PitON XM20
============================


 


Protocol SNMP v2.


Items 128 with low discovery.


Sorry but without triggers.


 


Template on my [GitHub](https://github.com/pgalonza/Notes/blob/master/administration/zabbix/templates/PitON%20XM20.xml) repository


MIBs on my [GitHub](https://github.com/pgalonza/Notes/tree/master/administration/PitON/XM20/snmp) repository



## Author

P.V. Galonza

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CRITICAL_BATTERY_TIME}|<p>-</p>|`20m`|Text macro|
|{$CRITYICAL_BATTERY_CAPACITY}|<p>-</p>|`50`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Traps|<p>Discovery traps</p>|`SNMP agent`|XPPC-MIB.trapsIndex<p>Update: 1h</p>|
|Devices|<p>Discovery pluged devices</p>|`SNMP agent`|XPPC-MIB.indexOfDevice<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Firmware revision|<p>The firmware revision of the UPS system.</p>|`SNMP agent`|XPPC-MIB.upsSmartIdentFirmwareRevision<p>Update: 6h</p>|
|Three phase DC and rectifier status low battery shutdown|<p>Low Battery Shutdown</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseDCandRectifierStatusLowBatteryShutdown<p>Update: 5m</p>|
|Control simulate power fail|<p>Setting this variable to simulatePowerFailure(2) causes the UPS switch to battery power. Setting this value to noSimulatePowerFailure(1) has no effect. The value noSimulatePowerFailure(1) will always be returned when the variable is read.</p>|`SNMP agent`|XPPC-MIB.upsSmartControlSimulatePowerFail<p>Update: 5m</p>|
|Test diagnostics|<p>Setting this variable to testDiagnostics(2) causes the UPS to perform a diagnostic self test. Setting this value to noTestDiagnostics(1) has no effect. The value noTestDiagnostics(1) will always be returned when the variable is read.</p>|`SNMP agent`|XPPC-MIB.upsSmartTestDiagnostics<p>Update: 5m</p>|
|UPS ID|<p>An 8 byte ID string identifying the UPS. This object can be set by the administrator</p>|`SNMP agent`|XPPC-MIB.upsBaseIdentUpsName<p>Update: 6h</p>|
|Three Phase Battery Voltage|<p>Battery Voltage</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseBatteryVoltage<p>Update: 5m</p>|
|Last replaced date|<p>The date when the UPS system's batteries were last replaced in mm/dd/yy format. For UPS models, this value is originally set in the factory. When the UPS batteries are replaced, this value should be reset by the administrator.</p>|`SNMP agent`|XPPC-MIB.upsBaseBatteryLastReplaceDate<p>Update: 6h</p>|
|Three phase UPS status AC status|<p>AC Status</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseUPSStatusACStatus<p>Update: 5m</p>|
|Environment smoke|<p>Smoke status</p>|`SNMP agent`|XPPC-MIB.upsEnvSmoke<p>Update: 5m</p>|
|Battery replace indicator|<p>Indicates whether the UPS batteries need replacing.</p>|`SNMP agent`|XPPC-MIB.upsSmartBatteryReplaceIndicator<p>Update: 5m</p>|
|Alarm timer|<p>The time in seconds after initial line failure at which the UPS begins emitting audible alarms (beeping). This timer is observerd only if the value of extControlAlarm is timed(2). Allowed values are 0 or 30 seconds. If a value other than a supported value is provided in a set request, the UPS interprets it as a the next lower acceptable value. If the provided value is lower than the lowest acceptable value, the lowest acceptable value is used.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigAlarmTimer<p>Update: 5m</p>|
|Three phase fault status over temperature|<p>Over Temperature</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseFaultStatusOverTemperature<p>Update: 5m</p>|
|Test calibration results|<p>The results of the last runtime calibration. Value ok(1) means a successful runtime calibration. Value invalidTest(2) indicates last calibration did not take place since the battery capacity was below 100 percent. Value calibrationInProgress(3) means a calibration is occurring now.</p>|`SNMP agent`|XPPC-MIB.upsSmartTestCalibrationResults<p>Update: 5m</p>|
|Three phase fault status emergency stop|<p>Emergency Stop</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseFaultStatusEmergencyStop<p>Update: 5m</p>|
|Sensitivity|<p>The sensitivity of the UPS to utility line abnormalities or noises.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigSensitivity<p>Update: 5m</p>|
|Environment security 1|<p>Security status</p>|`SNMP agent`|XPPC-MIB.upsEnvSecurity1<p>Update: 5m</p>|
|Three phase fault status inverter output fail|<p>Output Fail</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseFaultStatusInverterOutputFail<p>Update: 5m</p>|
|Three phase bypss source voltage S|<p>Bypass VoltageS</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseBypssSourceVoltageS<p>Update: 5m</p>|
|Battery time on|<p>The elapsed time in seconds since the UPS has switched to battery power.</p>|`SNMP agent`|XPPC-MIB.upsBaseBatteryTimeOnBattery<p>Update: 5m</p>|
|Control ups off|<p>Setting this variable to turnUpsOff(2) causes the UPS to shut off. When in this state, the UPS will not provide output power regardless of the input line state. The on/off switch on the UPS must be toggled for the UPS to return to operation. Setting this value to noTurnUpsOff(1) has no effect. The value noTurnUpsOff(1) will always be returned when the variable is read.</p>|`SNMP agent`|XPPC-MIB.upsSmaControlUpsOff<p>Update: 5m</p>|
|Control ups sleep|<p>Setting this variable to putUpsToSleep(2) causes the UPS to go to sleep for the time specified by upsSmartConfigUpsSleepTime. When in sleep mode, the UPS will not provide output power regardless of the input line state. Once the specified time has elapsed, output power will be restored. Setting this value to noPutUpsToSleep(1) has no effect. The value noPutUpsToSleep(1) will always be returned when the variable is read.</p>|`SNMP agent`|XPPC-MIB.upsSmartControlUpsSleep<p>Update: 5m</p>|
|Three phase output load percentage T|<p>Load PercentageT</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseOutputLoadPercentageT<p>Update: 5m</p>|
|Environment under temperature|<p>Alarm dupsAlarmUnderTemperature on when the environment temperature below the value.</p>|`SNMP agent`|XPPC-MIB.upsEnvUnderTemperature<p>Update: 5m</p>|
|Three phase fault status overLoad|<p>Over Load</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseFaultStatusOverLoad<p>Update: 5m</p>|
|Three phase fault status bypass breaker|<p>Bypass Breaker</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseFaultStatusBypassBreaker<p>Update: 5m</p>|
|Hight transfer voltage|<p>The maximum line voltage in 1/10 VAC allowed before the UPS system transfers to battery backup. Allowed value depend on the UPS used: 120 Volt units allow settings of 1290, 1320, 1350, 1380. 100 Volt units allow settings of 1080, 1100, 1120, 1140. 230 Volt units allow settings of 2530, 2640, 2710, 2800. 208 Volt units allow settings of 2240, 2290, 2340, 2390. If a value other than a supported value is provided in a set request, the UPS interprets it as the next lower acceptable value. If the provided value is lower than the lowest acceptable value, the lowest acceptable value is used.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigHighTransferVolt<p>Update: 5m</p>|
|Test calibration date|<p>The date the last UPS runtime calibration was performed in mm/dd/yy format.</p>|`SNMP agent`|XPPC-MIB.upsSmartTestCalibrationDate<p>Update: 6h</p>|
|Return delay|<p>The delay in seconds after utility line power returns before the UPS will turn on. This value is also used when the UPS comes out of a reboot and before the UPS wakes up from 'sleep' mode. Allowed values are 0, 60, 180 and 300 seconds. If a value other than a supported value is provided in a set request, the UPS interprets it as a the next higher acceptable value. If the provided value is higher than the highest acceptable value, the highest acceptable value is used.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigReturnDelay<p>Update: 5m</p>|
|Input phase|<p>The current AC input phase.</p>|`SNMP agent`|XPPC-MIB.upsBaseInputPhase<p>Update: 5m</p>|
|Control flash and beep|<p>UPS to identify itself by lighting all indicators and beeping. Setting this variable to FlashAndBeep(2) causes the UPS lights all panel indicators and beeps. Setting this value to noFlashAndBeep(1) has no effect. The value noFlashAndBeep(1) will always be returned when the variable is read.</p>|`SNMP agent`|XPPC-MIB.upsSmartControlFlashAndBeep<p>Update: 5m</p>|
|Three phase UPS status inverter operating|<p>Operating</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseUPSStatusInverterOperating<p>Update: 5m</p>|
|Environment water|<p>Water status</p>|`SNMP agent`|XPPC-MIB.upsEnvWater<p>Update: 5m</p>|
|Input frequency|<p>The current input frequency to the UPS system in 1/10 Hz.</p>|`SNMP agent`|XPPC-MIB.upsSmartInputFrequency<p>Update: 5m</p>|
|Battery conserve control|<p>Setting this variable to turnUpsOffToConserveBattery(2) causes a UPS on battery to be put into 'sleep' mode immediately. The (10) means suspending time(10 minutes) before turn off UPS. UPS will turn back on when utility power is restored. Attempting to turn off a UPS that is not on battery will result in a badValue error. Setting this value to noTurnOffUps(1) has no effect. The value noTurnOffUps(1) will always be returned when the variable is read.</p>|`SNMP agent`|XPPC-MIB.upsBaseControlConserveBattery<p>Update: 5m</p>|
|Three phase rating battery voltage|<p>Battery Voltage</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseRatingBatteryVoltage<p>Update: 5m</p>|
|Three phase rating output frequency|<p>Output Frequency</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseRatingOutputFrequency<p>Update: 5m</p>|
|Output frequency|<p>The current output frequency of the UPS system in 1/10 Hz.</p>|`SNMP agent`|XPPC-MIB.upsSmartOutputFrequency<p>Update: 5m</p>|
|Minimim return capacity|<p>The minimum battery capacity as a percent of full capacity required before the UPS will return from a low battery shutdown condition. In other words, the UPS will not re-energize the output until the battery capacity is equal to this value. Allowed values are 0, 10, 25, or 90 percent. If a value other than a supported value is provided in a set request, the UPS interprets it as a the next higher acceptable value. If the provided value is higher than the highest acceptable value, the highest acceptable value is used.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigMinReturnCapacity<p>Update: 5m</p>|
|Environment over humidity|<p>Alarm dupsAlarmOverHumidity on when the environment humidity over the value.</p>|`SNMP agent`|XPPC-MIB.upsEnvOverHumidity<p>Update: 5m</p>|
|Output voltage|<p>The output voltage of the UPS system in 1/10 VAC.</p>|`SNMP agent`|XPPC-MIB.upsSmartOutputVoltage<p>Update: 5m</p>|
|Set EEPROM defaults|<p>WRITE: Resets the UPS EEPROM variables to default values. READ: returns 0</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigSetEEPROMDefaults<p>Update: 5m</p>|
|Battery capacity|<p>The remaining battery capacity expressed in percent of full capacity.</p>|`SNMP agent`|XPPC-MIB.upsSmartBatteryCapacity<p>Update: 5m</p>|
|Battery current of maximum current|<p>The current battery current expressed in percent of maximum current.</p>|`SNMP agent`|XPPC-MIB.upsSmartBatteryCurrent<p>Update: 5m</p>|
|UPS sleep time|<p>The time in minutes for the UPS to go to 'sleep' when instructed. When in sleep mode, the UPS will not provide output power regardless of the input line state. Once the specified time has elapsed, output power will be restored. This is a configuration setting. The UPS will not go to sleep until told to do so by the manager from a management station. Any input value is allowed, however the UPS only recognizes 0 - 9999 minutes in one minute increments. If the provided value is higher than the highest acceptable value, the highest acceptable value is used.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigUpsSleepTime<p>Update: 5m</p>|
|Test diagnostic schedule|<p>The UPS system's automatic battery test schedule.</p>|`SNMP agent`|XPPC-MIB.upsSmartTestDiagnosticSchedule<p>Update: 5m</p>|
|Output phase|<p>The current output phase.</p>|`SNMP agent`|XPPC-MIB.upsBaseOutputPhase<p>Update: 5m</p>|
|Output status|<p>The current state of the UPS. If the UPS is unable to determine the state of the UPS this variable is set to unknown(1)</p>|`SNMP agent`|XPPC-MIB.upsBaseOutputStatus<p>Update: 5m</p>|
|Environment security 7|<p>Security status</p>|`SNMP agent`|XPPC-MIB.upsEnvSecurity7<p>Update: 5m</p>|
|Three phase UPS status bypass frequency fail|<p>Bypass Status</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseUPSStatusBypassFreqFail<p>Update: 5m</p>|
|Three phase input voltage S|<p>Input VoltageS</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseInputVoltageS<p>Update: 5m</p>|
|Input minimum line voltage|<p>The minimum utility line voltage in 1/10 VAC over the previous 1 minute period.</p>|`SNMP agent`|XPPC-MIB.upsSmartInputMinLineVoltage<p>Update: 5m</p>|
|Three phase input voltage T|<p>Input VoltageT</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseInputVoltageT<p>Update: 5m</p>|
|Environment security 4|<p>Security status</p>|`SNMP agent`|XPPC-MIB.upsEnvSecurity4<p>Update: 5m</p>|
|Three phase bypss source voltage R|<p>Bypass VoltageR</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseBypssSourceVoltageR<p>Update: 5m</p>|
|Three phase fault status short circuit|<p>Short Circuit</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseFaultStatusShortCircuit<p>Update: 5m</p>|
|Environment temperature|<p>The ambient environment temperature.</p>|`SNMP agent`|XPPC-MIB.upsEnvTemperature<p>Update: 5m</p>|
|Three phase DC and rectifier status low battery|<p>Low Battery</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseDCandRectifierStatusLowBattery<p>Update: 5m</p>|
|Environment over temperature|<p>Alarm dupsAlarmOverTemperature on when the environment temperature over the value.</p>|`SNMP agent`|XPPC-MIB.upsEnvOverTemperature<p>Update: 5m</p>|
|Output load|<p>The current UPS load expressed in percent of rated capacity.</p>|`SNMP agent`|XPPC-MIB.upsSmartOutputLoad<p>Update: 5m</p>|
|Three phase rating bypass frequency|<p>Bypass Frequency</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseRatingBypassFrequency<p>Update: 5m</p>|
|Three phase output load percentage S|<p>Load PercentageS</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseOutputLoadPercentageS<p>Update: 5m</p>|
|Serial number|<p>An 8-character string identifying the serial number of the UPS internal microprocessor. This number is set at the factory. NOTE: This number does NOT correspond to the serial number on the rear of the UPS.</p>|`SNMP agent`|XPPC-MIB.upsSmartIdentUpsSerialNumber<p>Update: 6h</p>|
|Three phase output voltage S|<p>Output VoltageS</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseOutputVoltageS<p>Update: 5m</p>|
|Three phase battery time remain|<p>Battery Time Remain (unit is Minute)</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseBatteryTimeRemain<p>Update: 5m</p>|
|Three phase input voltage R|<p>Input VoltageR</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseInputVoltageR<p>Update: 5m</p>|
|Three phase battery temperature|<p>Battery Temperature</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseBatteryTemperature<p>Update: 5m</p>|
|Three phase output load percentage R|<p>Load PercentageR</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseOutputLoadPercentageR<p>Update: 5m</p>|
|Three phase DC and rectifier status charge status|<p>Charge Status</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseDCandRectifierStatusChargeStatus<p>Update: 5m</p>|
|Battery full charge voltage|<p>The fully charged battery voltage of the battery system used in the UPS, expressed in tenths of a volt.</p>|`SNMP agent`|XPPC-MIB.upsSmartBatteryFullChargeVoltage<p>Update: 5m</p>|
|Three phase output voltage T|<p>Output VoltageT</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseOutputVoltageT<p>Update: 5m</p>|
|Battery time remaining|<p>The UPS battery run time remaining before battery exhaustion, in seconds.</p>|`SNMP agent`|XPPC-MIB.upsSmartBatteryRunTimeRemaining<p>Update: 5m</p>|
|Three phase DC and rectifier status rectifier rotation error|<p>Rectifier Rotation Error</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseDCandRectifierStatusRecRotError<p>Update: 5m</p>|
|Last diagnostics date|<p>The date the last UPS diagnostics test was performed in mm/dd/yy format.</p>|`SNMP agent`|XPPC-MIB.upsSmartTestLastDiagnosticsDate<p>Update: 6h</p>|
|Battery status|<p>The status of the UPS batteries. A batteryLow(3) value indicates the UPS will be unable to sustain the current load, and its services will be lost if power is not restored. The amount of run time in reserve at the time of low battery can be configured by the upsSmartConfigLowBatteryRunTime.</p>|`SNMP agent`|XPPC-MIB.upsBaseBatteryStatus<p>Update: 5m</p>|
|Three phase DC and rectifier status in and out|<p>In And Put</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseDCandRectifierStatusInAndOut<p>Update: 5m</p>|
|Diagnostics results|<p>The results of the last UPS diagnostics test performed.</p>|`SNMP agent`|XPPC-MIB.upsSmartTestDiagnosticsResults<p>Update: 5m</p>|
|Three phase rating rectifier frequency|<p>Rectifier Frequency</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseRatingRectifierFrequency<p>Update: 5m</p>|
|Rated output voltage|<p>The nominal output voltage from the UPS in 1/10 VAC. Possible values are 1000, 1200, 2080, 2200, 2250, 2300 and 2400. NOTE: Only units that are 2200, 2250, 2300 and 2400 can be changed. Allowable values are 2200, 2250, 2300 and 2400. For these adjustable units, if a value other than a supported value is provided in a set request, the UPS interprets it as the next lower acceptable value. If the provided value is lower than the lowest acceptable value, the lowest acceptable value is used.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigRatedOutputVoltage<p>Update: 5m</p>|
|Three phase fault status high DC shutdown|<p>High DC Shutdown</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseFaultStatusHighDCShutdown<p>Update: 5m</p>|
|Model name|<p>The UPS model name (e.g. 'Intelligent 8000E 900VA').</p>|`SNMP agent`|XPPC-MIB.upsBaseIdentModel<p>Update: 6h</p>|
|Low transfer voltage|<p>The minimum line voltage in 1/10 VAC allowed before the UPS system transfers to battery backup. Allowable values depend on the UPS used: 120 Volt units allow settings of 970, 1000, 1030, 1060. 100 Volt units allow settings of 810, 830, 850, 870. 230 Volt units allow settings of 1880, 1960, 2040, 2080. 208 Volt units allow settings of 1680, 1720, 1770, 1820. If a value other than a supported value is provided in a set request, the UPS interprets it as a the next higher acceptable value. If the provided value is higher than the highest acceptable value, the highest acceptable value is used.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigLowTransferVol<p>Update: 5m</p>|
|Input line voltage|<p>The current utility line voltage in 1/10 VAC</p>|`SNMP agent`|XPPC-MIB.upsSmartInputLineVoltage<p>Update: 5m</p>|
|Phase battery capacity percentage|<p>Battery Capacity Percentage</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseBatteryCapacityPercentage<p>Update: 5m</p>|
|Three phase output frequency|<p>Output Frequency</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseOutputFrequency<p>Update: 5m</p>|
|Test runtime calibration|<p>Setting this variable to performCalibration(2) causes the UPS to discharge to calibrate the UPS. The test will only start if the battery capacity is 100 percent. The test runs until capacity is less than 25 percent. Setting this variable to cancelCurrentCalibration(3) after setting performCalibration(2) will cancel the current discharge. Setting this variable to noPerformCalibration(1) will have no effect. The value noPerformCalibration(1) will always be returned when the variable is read. The result of the calibration will be saved in upsSmartTestCalibrationResult.</p>|`SNMP agent`|XPPC-MIB.upsSmartTestRuntimeCalibration<p>Update: 5m</p>|
|SNMP Proxy agent firmware revision|<p>The firmware revision of the UPS SNMP Proxy agent.</p>|`SNMP agent`|XPPC-MIB.upsSmartIdentAgentFirmwareRevision<p>Update: 6h</p>|
|Three phase rating bypass voltage|<p>Bypass Voltage</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseRatingBypassVoltage<p>Update: 5m</p>|
|Three phase DC and rectifier status battery status|<p>Back Status</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseDCandRectifierStatusBatteryStatus<p>Update: 5m</p>|
|Three phase battery current|<p>Battery Electric Current</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseBatteryCurrent<p>Update: 5m</p>|
|Input line fail cause|<p>The reason for the occurrence of the last transfer to UPS battery power. The variable is set to noTransfer(1) if there is no transfer yet. The variable is set to highLineVoltage(2) if the transfer to battery is caused by an over voltage greater than the high transfer voltage. The variable is set to brownout(3) if the duration of the outage is greater than five seconds and the line voltage is between 40 percent of the rated output voltage and the low transfer voltage. The variable is set to blackout(4) if the duration of the outage is greater than five seconds and the line voltage is between 40 percent of the rated output voltage and ground. The variable is set to smallMomentarySag(5) if the duration of the outage is less than five seconds and the line voltage is between 40 percent of the rated output voltage and the low transfer voltage. The variable is set to deepMomentarySag(6) if the duration of the outage is less than five seconds and the line voltage is between 40 percent of the rated output voltage and ground.</p>|`SNMP agent`|XPPC-MIB.upsSmartInputLineFailCause<p>Update: 5m</p>|
|Three phase UPS static switch mode|<p>Switch Mode</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseUPSStaticSwitchMode<p>Update: 5m</p>|
|Manufactured date|<p>The date when the UPS was manufactured in mm/dd/yy format.</p>|`SNMP agent`|XPPC-MIB.upsSmartIdentDateOfManufacture<p>Update: 6h</p>|
|Plugged devices|<p>The number of devices that are plugged into the UPS.</p>|`SNMP agent`|XPPC-MIB.upsBaseConfigNumDevices<p>Update: 6h</p>|
|Number of manager to send traps|<p>The number of managers to send traps to.</p>|`SNMP agent`|XPPC-MIB.mconfigTrapsReceiversNum<p>Update: 6h</p>|
|Three phase UPS status manual bypass breaker|<p>Breaker Status</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseUPSStatusManualBypassBreaker<p>Update: 5m</p>|
|Control turn on ups load|<p>Setting this variable to upsSmartControlTurnOnUpsLoad(2) causes the UPS switch back to utility power if utility power is present. Setting this value to noUpsSmartControlTurnOnUpsLoad(1) has no effect. The value noUpsSmartControlTurnOnUpsLoad(1) will always be returned when the variable is read.</p>|`SNMP agent`|XPPC-MIB.upsSmartControlTurnOnUpsLoad<p>Update: 5m</p>|
|Control reboot ups|<p>Setting this variable to rebootUps(2) causes the UPS to shut off and turn back on. Setting this value to noRebootUps(1) has no effect. The value noRebootUps(1) will always be returned when the variable is read.</p>|`SNMP agent`|XPPC-MIB.upsSmartControlRebootUps<p>Update: 5m</p>|
|Three phase DC and rectifier status rectifier operating|<p>Rectifier Operatin</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseDCandRectifierStatusRecOperating<p>Update: 5m</p>|
|Shut off delay|<p>The delay in seconds the UPS remains on after being told to turn off. Allowed values are 12, 18, 24, 30, 36, 42, 48, 54, 60, 120, 180, 240, 300, 360, 420, 480, 540, and 600 seconds. If a value other than a supported value is provided in a set request, the UPS interprets it as next higher acceptable value. If the provided value is higher than the highest acceptable value, the highest acceptable value is used.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigShutoffDelay<p>Update: 5m</p>|
|Three phase input frequency|<p>Input Frequency</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseInputFrequency<p>Update: 5m</p>|
|Low battery run time|<p>The desired run time in seconds once the low battery condition is reached. Allowed values are 120, 300, 420, or 600 seconds. During this time the UPS will produce a constant warning tone which can not be disabled. If a value other than a supported value is provided in a set request, the UPS interprets it as a the next higher acceptable value. If the provided value is higher than the highest acceptable value, the highest acceptable value is used.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigLowBatteryRunTime<p>Update: 5m</p>|
|Test indicators|<p>Setting this variable to testIndicators(2) causes the UPS to perform a front panel indicator (lights) test. Setting this value to noTestIndicators(1) has no effect. The value noTestIndicators(1) will always be returned when the variable is read.</p>|`SNMP agent`|XPPC-MIB.upsSmartTestIndicators<p>Update: 5m</p>|
|Environment security 2|<p>Security status</p>|`SNMP agent`|XPPC-MIB.upsEnvSecurity2<p>Update: 5m</p>|
|Battery temperature|<p>The current internal UPS temperature expressed in tenths of a Celsius degree.</p>|`SNMP agent`|XPPC-MIB.upsSmartBatteryTemperature<p>Update: 5m</p>|
|Three phase rating rectifier voltage|<p>Rectifier Voltage</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseRatingRectifierVoltage<p>Update: 5m</p>|
|Three phase bypass source frequency|<p>Bypass Frequency</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseBypassSourceFrequency<p>Update: 5m</p>|
|Environment under humidity|<p>Alarm dupsAlarmUnderHumidity on when the environment humidity below the value</p>|`SNMP agent`|XPPC-MIB.upsEnvUnderHumidity<p>Update: 5m</p>|
|Three phase rating output voltage|<p>Output Voltage</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseRatingOutputVoltage<p>Update: 5m</p>|
|Three phase output voltage R|<p>Output VoltageR</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseOutputVoltageR<p>Update: 5m</p>|
|Environment security 5|<p>Security status</p>|`SNMP agent`|XPPC-MIB.upsEnvSecurity5<p>Update: 5m</p>|
|Three phase rating power|<p>Power Rating</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseRatingPower<p>Update: 5m</p>|
|Input maximum line voltage|<p>The maximum utility line voltage in 1/10 VAC over the previous 1 minute period.</p>|`SNMP agent`|XPPC-MIB.upsSmartInputMaxLineVoltage<p>Update: 5m</p>|
|Battery current voltage|<p>The current battery voltage expressed in 1/10 VDC</p>|`SNMP agent`|XPPC-MIB.upsSmartBatteryVoltage<p>Update: 5m</p>|
|Alarm|<p>A flag indicating how the UPS should handle audible line fail alarms.</p>|`SNMP agent`|XPPC-MIB.upsSmartConfigAlarm<p>Update: 5m</p>|
|Three phase bypss source voltage T|<p>Bypass VoltageT</p>|`SNMP agent`|XPPC-MIB.upsThreePhaseBypssSourceVoltageT<p>Update: 5m</p>|
|Environment security 6|<p>Security status</p>|`SNMP agent`|XPPC-MIB.upsEnvSecurity6<p>Update: 5m</p>|
|Environment security 3|<p>Security status</p>|`SNMP agent`|XPPC-MIB.upsEnvSecurity3<p>Update: 5m</p>|
|Eenvironment humidity|<p>The environment humidity.</p>|`SNMP agent`|XPPC-MIB.upsEnvHumidity<p>Update: 5m</p>|
|Receiver {#TRAPID} accept|<p>An entry will become active if yes, and will be deleted if no.</p>|`SNMP agent`|XPPC-MIB[receiverAccept.{#TRAPID}]<p>Update: 5m</p><p>LLD</p>|
|Receiver {#TRAPID} community string|<p>The community name to use in the trap when sent to the manager.</p>|`SNMP agent`|XPPC-MIB[receiverCommunityString.{#TRAPID}]<p>Update: 6h</p><p>LLD</p>|
|Severity level {#TRAPID}|<p>The severity threshold of traps to send to the manager. Traps are labeled in severity as informational(1), warning(2), severe(3). Only traps of equal or greater severity than this value are sent to the manager.</p>|`SNMP agent`|XPPC-MIB[severityLevel.{#TRAPID}]<p>Update: 5m</p><p>LLD</p>|
|Trap {#TRAPID} receiver address|<p>The IP address of the manager to send a trap to.</p>|`SNMP agent`|XPPC-MIB[trapsReceiverAddr.{#TRAPID}]<p>Update: 6h</p><p>LLD</p>|
|Device {#UPSDEVICENAME} accept|<p>An entry is added if yes, the entry is deleted if no.</p>|`SNMP agent`|XPPC-MIB[deviceAccept.{#UPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|Device {#UPSDEVICENAME} id|<p>The index of the device that is plugged into the UPS.</p>|`SNMP agent`|XPPC-MIB[nameOfDevice.{#UPSDEVICEID}]<p>Update: 6h</p><p>LLD</p>|
|Devices {#UPSDEVICENAME} rating|<p>The volt-amp rating of the device plugged into the UPS</p>|`SNMP agent`|XPPC-MIB[vaRatingOfDevice.{#UPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

