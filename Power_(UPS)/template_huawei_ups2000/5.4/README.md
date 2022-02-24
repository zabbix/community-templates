# Huawei 10K UPS

## Overview

This template for **Huawei UPS 2000**


Protocol SNMP v2


Items 95 with low discovery


 


**Triggers**:


Battery charge < {$BATTERY\_CHARGE}% on {HOST.NAME}


Battery backup time < {$BACKUP\_TIME} on {HOST.NAME}


Battery is discharging on {HOST.NAME}


 


**Macros****:**


{$BACKUP\_TIME} - Remaining critical battery life in minutes


{$BATTERY\_CHARGE} - The critical battery percentage


 


Template on my [GitHub](https://github.com/pgalonza/Notes/blob/master/administration/zabbix/templates/Template%20Huawei%2010K%20UPS.xml) repository


MIBs on my [GitHub](https://github.com/pgalonza/Notes/tree/master/administration/huawei/ups2000/snmp) repository



## Author

P.V. Galonza

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$BACKUP_TIME}|<p>-</p>|`15m`|Text macro|
|{$BATTERY_CHARGE}|<p>-</p>|`80`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device|<p>Rack ID, ranging from 1 to 100. This node is referenced as an index node by hwUpsDeviceIdentTable, hwUpsDeviceOperInfoTable, hwUpsInputTable, and hwUpsBattScheduleTestTable.</p>|`SNMP agent`|huawei-ups.hwUpsDeviceId<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Site time UTC|<p>UTC time, ranging from 0 to 4294967295. The unit is seconds.</p>|`SNMP agent`|huawei-ups.hwUpsSiteTimeUTC<p>Update: 10m</p>|
|System type|<p>Name of the UPS system. A string of characters. Configurable.</p>|`SNMP agent`|huawei-ups.hwUpsSystemType<p>Update: 6h</p>|
|System main device ESN|<p>ESN of the master device used for setting up a NetEco model. A string of characters.</p>|`SNMP agent`|huawei-ups.hwUpsSystemMainDeviceESN<p>Update: 6h</p>|
|Number of parallel systems|<p>Number of parallel systems. An integer ranging from 0 to 63.</p>|`SNMP agent`|huawei-ups.hwUpsParallelSysNum<p>Update: 1h</p>|
|Number of devices in the system|<p>Number of devices in the system. An integer ranging from 0 to 63.</p>|`SNMP agent`|huawei-ups.hwUpsSysDeviceNum<p>Update: 1h</p>|
|Ambient temperature.|<p>Ambient temperature. An integer ranging from -50 to 120. The value is accurate to one decimal place on the NetEco. The unit is °C.</p>|`SNMP agent`|huawei-ups.hwUpsEnvTemper<p>Update: 1m</p>|
|Number of active alarms|<p>Number of active alarms, ranging from 0 to 8000.</p>|`SNMP agent`|huawei-ups.hwUpsAlarmCurrActiveNum<p>Update: 5m</p>|
|Ambient humidity|<p>Ambient humidity. An integer ranging from 0 to 100. The value is accurate to one decimal place on the NetEco. The unit is %.</p>|`SNMP agent`|huawei-ups.hwUpsEnvHumidity<p>Update: 1m</p>|
|System interface protocol version|<p>Version number of the system interface protocol between the NetEco and NEs. A string of characters.</p>|`SNMP agent`|huawei-ups.hwUpsSysInerProtVersion<p>Update: 6h</p>|
|Alarm synchronization ID|<p>Alarm synchronization ID. The value ranges from 0 to 4294967295. This value is used by the NetEco to obtain the active alarm synchronization ID and synchronize alarms.</p>|`SNMP agent`|huawei-ups.hwUpsAlarmSynchronNum<p>Update: 10m</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery auto test|<p>Scheduled shallow discharge test enabled or disabled. Enumeration value. The value 1 indicates that the test is disabled. The value 2 indicates that the test is enabled.</p>|`SNMP agent`|huawei-ups[hwUpsBattAutoTest.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} redundant number|<p>Redundant number of the parallel system. An integer ranging from 0 to 3.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceRedundantNumber.{#HWUPSDEVICEID}]<p>Update: 1h</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} input voltage phase A|<p>Input voltage phase A. The value ranges from 0 to 10000. The value is accurate to one decimal place on the NetEco. The unit is V.</p>|`SNMP agent`|huawei-ups[hwUpsInputVoltageA.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} input row status|<p>RowStatus of UPS input information table.</p>|`SNMP agent`|huawei-ups[hwUpsInputRowStatus.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} input frequency|<p>Input frequency. The value ranges from 0 to 10000. The value is accurate to two decimal place on the NetEco. The unit is Hz.</p>|`SNMP agent`|huawei-ups[hwUpsInputFrequency.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|Device model with ID {#HWUPSDEVICEID}|<p>Device model. A string of characters.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceType.{#HWUPSDEVICEID}]<p>Update: 6h</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} temperature|<p>Maximum temperature of the modules in the current device. An integer ranging from 0 to 300.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceTemperature.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} soft version number|<p>Device software version number. A string of characters.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceSoftVersion.{#HWUPSDEVICEID}]<p>Update: 6h</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} power supply mode|<p>Device power supply mode. Enumeration type. Value 1 indicates no power supply. Value 2 indicates bypass mode. Value 3 indicates normal mode. Value 4 indicates battery mode. Value 5 indicates combined mode. Value 6 indicates mains ECO mode. Value 7 indicates battery ECO mode.</p>|`SNMP agent`|huawei-ups[hwUpsDevicePowerSupplyMethod.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} input voltage phase C|<p>Input voltage phase C. The value ranges from 0 to 10000. The value is accurate to one decimal place on the NetEco. The unit is V.</p>|`SNMP agent`|huawei-ups[hwUpsInputVoltageC.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} power rating|<p>System capacity. Enumeration type. The default value is 5. The unit is kVA. Value 1 indicates 80 kVA Value 2 indicates 100 kVA. Value 3 indicates 120 kVA. Value 4 indicates 160 kVA. Value 5 indicates 200 kVA.</p>|`SNMP agent`|huawei-ups[hwUpsDevicePowerRating.{#HWUPSDEVICEID}]<p>Update: 6h</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} parallel ID|<p>ID of the parallel system that the current device belongs to. An integer ranging from 0 to 63.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceParaSysIndex.{#HWUPSDEVICEID}]<p>Update: 6h</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} running row status|<p>RowStatus of UPS device running information table.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceOperInfoRowStatus.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} interface protocol|<p>Interface protocol version number for the current device. A string of characters.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceInerProtVersion.{#HWUPSDEVICEID}]<p>Update: 6h</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} row status|<p>RowStatus of UPS device Identification table.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceIdentRowStatus.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} ESN|<p>ESN. A string of characters.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceESN.{#HWUPSDEVICEID}]<p>Update: 6h</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} input voltage phase B|<p>Input voltage phase B. The value ranges from 0 to 10000. The value is accurate to one decimal place on the NetEco. The unit is V.</p>|`SNMP agent`|huawei-ups[hwUpsInputVoltageB.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output active power phase A|<p>Rack phase A output active power. The value ranges from -12000 to 12000. The value is accurate to one decimal place on the NetEco. The unit is kW.</p>|`SNMP agent`|huawei-ups[hwUpsOutputActivePowerA.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery status|<p>Battery status. Enumeration type. Value 1 indicates that no battery is connected. Value 2 indicates that the battery is not charging or discharging. Value 3 indicates hibernation. Value 4 indicates float charging. Value 5 indicates equalized charging. Value 6 indicates discharging.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceBatteryState.{#HWUPSDEVICEID}]<p>Update: 10s</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output frequency|<p>Rack output frequency. The value ranges from 0 to 10000. The value is accurate to two decimal place on the NetEco. The unit is Hz.</p>|`SNMP agent`|huawei-ups[hwUpsOutputFrequency.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output voltage phase B|<p>Rack phase B output voltage. The value ranges from 0 to 10000. The value is accurate to one decimal place on the NetEco. The unit is V.</p>|`SNMP agent`|huawei-ups[hwUpsOutputVoltageB.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output voltage phase A|<p>Rack phase A output voltage. The value ranges from 0 to 10000. The value is accurate to one decimal place on the NetEco. The unit is V.</p>|`SNMP agent`|huawei-ups[hwUpsOutputVoltageA.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output row status|<p>RowStatus of UPS output information table.</p>|`SNMP agent`|huawei-ups[hwUpsOutputRowStatus.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output load phase C|<p>Rack phase C output load ratio. The value ranges from 0 to 5000 The value is accurate to one decimal place on the NetEco.</p>|`SNMP agent`|huawei-ups[hwUpsOutputLoadC.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output load phase B|<p>Rack phase B output load ratio. The value ranges from 0 to 5000 The value is accurate to one decimal place on the NetEco.</p>|`SNMP agent`|huawei-ups[hwUpsOutputLoadB.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output load phase A|<p>Rack phase A output load ratio. The value ranges from 0 to 5000 The value is accurate to one decimal place on the NetEco.</p>|`SNMP agent`|huawei-ups[hwUpsOutputLoadA.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output current phase C|<p>Rack phase C output current. The value ranges from 0 to 10000. The value is accurate to one decimal place on the NetEco. The unit is A.</p>|`SNMP agent`|huawei-ups[hwUpsOutputCurrentC.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output active power phase B|<p>Rack phase B output active power. The value ranges from -12000 to 12000. The value is accurate to one decimal place on the NetEco. The unit is kW.</p>|`SNMP agent`|huawei-ups[hwUpsOutputActivePowerB.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output current phase B|<p>Rack phase B output current. The value ranges from 0 to 10000. The value is accurate to one decimal place on the NetEco. The unit is A.</p>|`SNMP agent`|huawei-ups[hwUpsOutputCurrentB.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output current phase A|<p>Rack phase A output current. The value ranges from 0 to 10000. The value is accurate to one decimal place on the NetEco. The unit is A.</p>|`SNMP agent`|huawei-ups[hwUpsOutputCurrentA.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output appearance power phase C|<p>Rack phase C output apparent power. The value ranges from -12000 to 12000. The value is accurate to one decimal place on the NetEco. The unit is kVA.</p>|`SNMP agent`|huawei-ups[hwUpsOutputAppearancePowerC.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output appearance power phase B|<p>Rack phase B output apparent power. The value ranges from -12000 to 12000. The value is accurate to one decimal place on the NetEco. The unit is kVA.</p>|`SNMP agent`|huawei-ups[hwUpsOutputAppearancePowerB.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output appearance power phase A|<p>Rack phase A output apparent power. The value ranges from -12000 to 12000. The value is accurate to one decimal place on the NetEco. The unit is kVA.</p>|`SNMP agent`|huawei-ups[hwUpsOutputAppearancePowerA.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output active power phase C|<p>Rack phase C output active power. The value ranges from -12000 to 12000. The value is accurate to one decimal place on the NetEco. The unit is kW.</p>|`SNMP agent`|huawei-ups[hwUpsOutputActivePowerC.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} current flow status|<p>Current flow status. An integer ranging from 0 to 70000.</p>|`SNMP agent`|huawei-ups[hwUpsDeviceEnergyFloatState.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} row status|<p>RowStatus of UPS rack control table</p>|`SNMP agent`|huawei-ups[hwUpsCtrlRowStatus.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery auto test discharge rate|<p>Shallow discharge test discharge ratio. An integer ranging from 10 to 50.</p>|`SNMP agent`|huawei-ups[hwUpsBattAutoTestDischargeRate.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery temperature|<p>Battery temperature.Value range: -20 to 80, Unit:°C, and the value is accurate to one decimal place (.1).</p>|`SNMP agent`|huawei-ups[hwUpsBatterytemperature.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} bypass input voltage phase B|<p>Bypass input voltage phase B. The value ranges from 0 to 10000 The value is accurate to one decimal place on the NetEco. The unit is V</p>|`SNMP agent`|huawei-ups[hwUpsBypassInputVoltageB.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} bypass input voltage phase A|<p>Bypass input voltage phase A. The value ranges from 0 to 10000 The value is accurate to one decimal place on the NetEco. The unit is V</p>|`SNMP agent`|huawei-ups[hwUpsBypassInputVoltageA.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} bypass input frequency|<p>Bypass input frequency. The value ranges from 0 to 10000 The value is accurate to two decimal place on the NetEco. The unit is Hz.</p>|`SNMP agent`|huawei-ups[hwUpsBypassInputFrequency.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery test|<p>If you set the value to shallowDsgTest(4), you can perform a shallow discharge test; if you set the value to verifyDsgTest(5), you can perform a capacity test; if you set the value to stopTest(2), you can stop the test. Other settings are invalid. If you start a test when other tests are in progress, error code 4 is returned. During test, you can use this node to obtain the current or previous test type. If you have never started the battery test sheduleTest(3), shallowDsgTest(4), or verifyDsgTest(5), this node returns noTestInit(1).</p>|`SNMP agent`|huawei-ups[hwUpsBattTest.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery schedule rest row status|<p>RowStatus of UPS Battery control table.</p>|`SNMP agent`|huawei-ups[hwUpsBattScheduleTestRowStatus/{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery voltage|<p>Battery Voltage. It is a real-time analog parameter. Value range: 0 to 20000, Unit: V, and the value is accurate to one decimal place (.1).</p>|`SNMP agent`|huawei-ups[hwUpsBatteryVoltage.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery row status|<p>RowStatus of UPS battery information table.</p>|`SNMP agent`|huawei-ups[hwUpsBatteryRowStatus.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} bypass row status|<p>RowStatus of UPS bypass information table.</p>|`SNMP agent`|huawei-ups[hwUpsBypassRowStatus.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery current|<p>Battery Total Current. It is a real-time analog parameter. Value range: -60000 to 60000, Unit: A, and the value is accurate to one decimal place (.1).</p>|`SNMP agent`|huawei-ups[hwUpsBatteryCurrent.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery capacity left|<p>Battery Capacity Left. Value range: 0 to 100, Unit: %, and the value is an integer.</p>|`SNMP agent`|huawei-ups[hwUpsBatteryCapacityLeft.{#HWUPSDEVICEID}]<p>Update: 10s</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery backup time|<p>Battery Backup Time. Value range: 0 to 172800, Unit: S, and the value is an integer.</p>|`SNMP agent`|huawei-ups[hwUpsBatteryBackupTime.{#HWUPSDEVICEID}]<p>Update: 10s</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery auto test time limit|<p>Scheduled shallow discharge test time. Enumeration value. Value 1 indicates 00:00 to 06:00. Value 2 indicates 06:00 to 12:00. Value 3 indicates 12:00 to 18:00. Value 4 indicates 18:00 to 00:00.</p>|`SNMP agent`|huawei-ups[hwUpsBattAutoTestTimeLimit.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery auto test time interval|<p>Scheduled shallow discharge test interval. An integer ranging from 30 to 90. The unit is days.</p>|`SNMP agent`|huawei-ups[hwUpsBattAutoTestTimeInterval.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery maximum discharge time|<p>Maximum battery discharge time. An integer ranging from 160 to 195. The value is accurate to one decimal place on the NetEco. The unit is V/Cell.</p>|`SNMP agent`|huawei-ups[hwUpsBattAutoTestEndVol.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} bypass input voltage phase C|<p>Bypass input voltage phase C. The value ranges from 0 to 10000 The value is accurate to one decimal place on the NetEco. The unit is V</p>|`SNMP agent`|huawei-ups[hwUpsBypassInputVoltageC.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery end test|<p>Battery End Test,Enumeration type. Value 1 indicates enabled. Value 2 indicates unknown</p>|`SNMP agent`|huawei-ups[hwUpsCtrlBatteryEndTest.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} power on state|<p>Power On State,Enumeration type. Value 1 indicates power off. Value 2 indicates booting. Value 3 indicates failed to power on. Value 4 indicates succeed tp power on.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlPowerOnState.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} EPO|<p>EPO. Enumeration type. Value 1 indicates EPO . Value 255 indicates invalid.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlEPO.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} power on|<p>Power on settings. Enumeration type. Value 1 indicates power on . Value 2 indicates unknow.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlPowerOn.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} power off|<p>Power off settings. Enumeration type. Value 1 indicates power off . Value 2 indicates unknow.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlPowerOff.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output standard|<p>Output Standard,Enumeration type. Value 1 indicates single phase. Value 2 indicates three phase.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlOutputStandard.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} model Type|<p>Model type,Enumeration type. Value 17 indicates 6K. Value 33 indicates 10K. Value 65 indicates 20K.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlModelType.{#HWUPSDEVICEID}]<p>Update: 6h</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} model capacity|<p>Model Capacity.The value ranges from 0 to 200, The value is accurate to one decimal place on the NetEco. The unit is kVA.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlModelCapacity.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} input standard|<p>Input Standard,Enumeration type. Value 1 indicates single phase. Value 2 indicates three phase.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlInputStandard.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} ECO switch|<p>ECO settings. Enumeration type. The default value is 1. Value 1 indicates ECO mode. Value 2 indicates Non ECO mode.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlECOSwitch.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery manual boost charge|<p>Battery Manual to Boost Charge,Enumeration type. Value 1 indicates enabled. Value 2 indicates disabled.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlBatteryManualBoostCharge.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery verify cap test|<p>Battery Verify Cap Test,Enumeration type. Value 1 indicates enabled. Value 2 indicates unknown</p>|`SNMP agent`|huawei-ups[hwUpsCtrlBatteryVerifyCapTest.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery to test state|<p>Battery Change to Test State,Enumeration type. Value 1 indicates enabled. Value 2 indicates disabled.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlBatteryToTestState.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery to float state|<p>Battery Change to Float Charge State,Enumeration type. Value 1 indicates enabled. Value 2 indicates disabled.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlBatteryToFloatState.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery to boost state|<p>Battery Change to Boost Charge State,Enumeration type. Value 1 indicates enabled. Value 2 indicates disabled.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlBatteryToBoostState.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery stop test state|<p>Battery Stop Test State,Enumeration type. Value 1 indicates enabled. Value 2 indicates disabled.</p>|`SNMP agent`|huawei-ups[hwUpsCtrlBatteryStopTestState.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery shallow test|<p>Battery Shallow Test,Enumeration type. Value 1 indicates enabled. Value 2 indicates unknown</p>|`SNMP agent`|huawei-ups[hwUpsCtrlBatteryShallowTest.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} battery manual float charge|<p>Battery Manual to Float Charge,Enumeration type. Value 1 indicates enabled. Value 2 indicates unknown</p>|`SNMP agent`|huawei-ups[hwUpsCtrlBatteryManualFloatCharge.{#HWUPSDEVICEID}]<p>Update: 10m</p><p>LLD</p>|
|{#HWUPSDEVICETYPE}-{#HWUPSDEVICEID} output voltage phase C|<p>Rack phase C output voltage. The value ranges from 0 to 10000. The value is accurate to one decimal place on the NetEco. The unit is V.</p>|`SNMP agent`|huawei-ups[hwUpsOutputVoltageC.{#HWUPSDEVICEID}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Battery backup time < {$BACKUP_TIME} on {HOST.NAME}|<p>last value: {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryBackupTime.{#HWUPSDEVICEID}])<15m</p><p>**Recovery expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryBackupTime.{#HWUPSDEVICEID}])>last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryBackupTime.{#HWUPSDEVICEID}],#2)</p>|high|
|Battery charge < {$BATTERY_CHARGE}% on {HOST.NAME}|<p>last value: {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryCapacityLeft.{#HWUPSDEVICEID}])<80</p><p>**Recovery expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryCapacityLeft.{#HWUPSDEVICEID}])>last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryCapacityLeft.{#HWUPSDEVICEID}],#2)</p>|high|
|Battery is discharging on {HOST.NAME}|<p>last value: {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsDeviceBatteryState.{#HWUPSDEVICEID}])=6</p><p>**Recovery expression**: </p>|high|
|Battery backup time < {$BACKUP_TIME} on {HOST.NAME} (LLD)|<p>last value: {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryBackupTime.{#HWUPSDEVICEID}])<15m</p><p>**Recovery expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryBackupTime.{#HWUPSDEVICEID}])>last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryBackupTime.{#HWUPSDEVICEID}],#2)</p>|high|
|Battery charge < {$BATTERY_CHARGE}% on {HOST.NAME} (LLD)|<p>last value: {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryCapacityLeft.{#HWUPSDEVICEID}])<80</p><p>**Recovery expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryCapacityLeft.{#HWUPSDEVICEID}])>last(/Huawei 10K UPS/huawei-ups[hwUpsBatteryCapacityLeft.{#HWUPSDEVICEID}],#2)</p>|high|
|Battery is discharging on {HOST.NAME} (LLD)|<p>last value: {ITEM.LASTVALUE}</p>|<p>**Expression**: last(/Huawei 10K UPS/huawei-ups[hwUpsDeviceBatteryState.{#HWUPSDEVICEID}])=6</p><p>**Recovery expression**: </p>|high|
