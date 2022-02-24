# Fronius Solar

## Description

Uses Fronius API V1 to query inverter Make sure you update the following macros after linking the template DEVICE_ID: the device you want to monitor (defaults to 1 if you only have 1 inverter). Make sure your host has a hsotname of ip address configured. This must be the address of the Fronius device to monitor

## Overview

 Introduction
============


This [Zabbix](https://www.zabbix.com/) template allows monitoring of Fronius devices such as inverters, dataloggers and smart loads through the [Fronius Solar API V1](https://www.fronius.com/en/photovoltaics/products/all-products/system-monitoring/open-interfaces/fronius-solar-api-json-).


[![graph of solar usage showing energy used and generated](https://raw.githubusercontent.com/wilsonwaters/zabbix-fronius/master/doc/fronius-graph.png "Example graph")](https://raw.githubusercontent.com/wilsonwaters/zabbix-fronius/master/doc/fronius-graph.png)


The template uses Zabbix dependent items to reduce the number of API calls made to the device. One API call is made and multiple dependent items use javascript pre-processing to parse the required field from the response.


<a id="user-content-requirements" class="anchor" style="box-sizing: border-box; background-color: initial; color: #0366d6; float: left; padding-right: 4px; margin-left: -20px; line-height: 1;
===============================================================================================================================================================================================



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$DEVICE_ID}|<p>-</p>|`1`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Power Generated Phase 1 inverter|<p>Voltage and current measurements supplied by inverter are only available when inverter is active (i.e. doesn't work at night time). Use the equivalent meter readings if you have one</p>|`Dependent item`|fronius.va_generated_p1_inverter<p>Update: 0</p>|
|Power Consumed Phase 1|<p>Smart meter power consumption</p>|`Dependent item`|fronius.power_consumed_p1_meter<p>Update: 0</p>|
|DC Voltage|<p>DC Voltage for inverter {$DEVICE_ID}</p>|`Dependent item`|fronius.udc<p>Update: 0</p>|
|Voltage Phase 3 meter|<p>Smart meter voltage measurement</p>|`Dependent item`|fronius.Voltage_AC_Phase_3_meter<p>Update: 0</p>|
|PowerFlowRealtimeDataAPI|<p>GetPowerFlowRealtimeData API call. Use dependent items to parse this</p>|`HTTP agent`|fronius.GetPowerFlowRealtimeData<p>Update: 30s</p>|
|OhmPilotRealtimeDataAPI|<p>GetOhmPilotRealtimeData API call. Use dependent items to parse this. Assumes you only have a single OhmPilot at device 0</p>|`HTTP agent`|fronius.GetOhmPilotRealtimeData<p>Update: 30s</p>|
|Energy Consumed Meter Day|<p>Energy consumption from the grid today</p>|`Calculated`|fronius.energy_consumed_meter_day<p>Update: 30s</p>|
|Ohmpilot Sensor Temperature|<p>Temperature of sensor plugged into OhmPilot at device 0</p>|`Dependent item`|fronius.ohmpilot.Temperature_Channel_1<p>Update: 0</p>|
|Frequency meter|<p>Smart meter Frequency Phase Average</p>|`Dependent item`|fronius.Frequency_Phase_Average<p>Update: 0</p>|
|Device Status Code|<p>status code for inverter {$DEVICE_ID}</p>|`Dependent item`|fronius.StatusCode<p>Update: 0</p>|
|Device Error Code|<p>error code for inverter {$DEVICE_ID}</p>|`Dependent item`|fronius.ErrorCode<p>Update: 0</p>|
|Voltage Phase 1 inverter|<p>Voltage measured by inverter is only available when inverter is active (i.e. doesn't work at night time). Use the equivalent meter readings if you have one</p>|`Dependent item`|fronius.vac_p1<p>Update: 0</p>|
|Ohmpilot Error Code|<p>Error status of OhmPilot at device 0</p>|`Dependent item`|fronius.ohmpilot.CodeOfError<p>Update: 0</p>|
|Voltage Phase 2 inverter|<p>Voltage measured by inverter is only available when inverter is active (i.e. doesn't work at night time). Use the equivalent meter readings if you have one</p>|`Dependent item`|fronius.vac_p2<p>Update: 0</p>|
|Voltage Phase 2 meter|<p>Smart meter voltage measurement</p>|`Dependent item`|fronius.Voltage_AC_Phase_2_meter<p>Update: 0</p>|
|Energy Generated Total|<p>Total energy generated on current day by all inverters on the system</p>|`Dependent item`|fronius.total_energy<p>Update: 0</p>|
|Ohmpilot Power Consumed|<p>Current power used by OhmPilot at device 0</p>|`Dependent item`|fronius.ohmpilot.PowerReal_PAC_Sum<p>Update: 0</p>|
|MeterRealtimeDataAPI|<p>GetMeterRealtimeData API call. Use dependent items to parse this. These items only work if your system has a smart meter installed</p>|`HTTP agent`|fronius.GetMeterRealtimeData<p>Update: 30s</p>|
|Power Grid|<p>-</p>|`Dependent item`|fronius.P_Grid<p>Update: 0</p>|
|InverterRealtimeData_CommonInverterDataAPI|<p>GetInverterRealtimeData API call. Use dependent items to parse this</p>|`HTTP agent`|fronius.GetInverterRealtimeData_CommonInverterDataAPI<p>Update: 30s</p>|
|Energy Consumed Meter start-of-day|<p>Energy consumption from the grid at the start of today</p>|`Calculated`|fronius.energy_consumed_meter_startofday<p>Update: 0;h0</p>|
|Power Consumed excluding Smartloads|<p>-</p>|`Dependent item`|fronius.power_no_ohmpilot<p>Update: 0</p>|
|Power Generated Phase 2 inverter|<p>Voltage and current measurements supplied by inverter are only available when inverter is active (i.e. doesn't work at night time). Use the equivalent meter readings if you have one</p>|`Dependent item`|fronius.va_generated_p2_inverter<p>Update: 0</p>|
|Power Generated|<p>Total AC power being generated by all inverters on system</p>|`Dependent item`|fronius.pac<p>Update: 0</p>|
|Energy Consumed Meter Total|<p>Smart meter energy consumption</p>|`Dependent item`|fronius.EnergyReal_WAC_Sum_Consumed<p>Update: 0</p>|
|Power Generated Phase 3 inverter|<p>Voltage and current measurements supplied by inverter are only available when inverter is active (i.e. doesn't work at night time). Use the equivalent meter readings if you have one</p>|`Dependent item`|fronius.va_generated_p3_inverter<p>Update: 0</p>|
|InverterRealtimeData_3PInverterDataAPI|<p>GetInverterRealtimeData API call. Use dependent items to parse this</p>|`HTTP agent`|fronius.GetInverterRealtimeData_3PInverterDataAPI<p>Update: 30s</p>|
|Energy Generated Day|<p>Total energy generated on current day by all inverters on the system</p>|`Dependent item`|fronius.day_energy<p>Update: 0</p>|
|Power Consumed Phase 3|<p>Smart meter power consumption</p>|`Dependent item`|fronius.power_consumed_p3_meter<p>Update: 0</p>|
|Ohmpilot Total Energy Consumed|<p>total energy consumed by OhmPilot at device 0</p>|`Dependent item`|fronius.ohmpilot.EnergyReal_WAC_Sum_Consumed<p>Update: 0</p>|
|Ohmpilot Status Code|<p>status code of OhmPilot at device 0</p>|`Dependent item`|fronius.ohmpilot.CodeOfState<p>Update: 0</p>|
|Voltage Phase 1 meter|<p>Smart meter voltage measurement</p>|`Dependent item`|fronius.Voltage_AC_Phase_1_meter<p>Update: 0</p>|
|Power Consumed Phase 2|<p>Smart meter power consumption</p>|`Dependent item`|fronius.power_consumed_p2_meter<p>Update: 0</p>|
|Voltage Phase 3 inverter|<p>Voltage measured by inverter is only available when inverter is active (i.e. doesn't work at night time). Use the equivalent meter readings if you have one</p>|`Dependent item`|fronius.vac_p3<p>Update: 0</p>|
|DC Current|<p>DC current for inverter {$DEVICE_ID}</p>|`Dependent item`|fronius.idc<p>Update: 0</p>|
|Power Consumed meter|<p>Smart meter power consumption</p>|`Dependent item`|fronius.power_consumed_meter<p>Update: 0</p>|
|Power Consumed|<p>-</p>|`Dependent item`|fronius.P_Load<p>Update: 0</p>|
|InverterRealtimeDataAPI|<p>GetInverterRealtimeData API call. Use dependent items to parse this</p>|`HTTP agent`|fronius.GetInverterRealtimeData<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

