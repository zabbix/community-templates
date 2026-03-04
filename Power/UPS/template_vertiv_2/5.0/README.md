# Vertiv

## Overview

https://github.com/Mihguel-Araujo/Template-Zabbix/blob/main/Template%20Vertiv



## Author

Mihguel da Silva Santos Tavares de Araujo

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HOSTNAME}|<p>HOSTNAME</p>|`{#IFHOSTNAME}`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Alarms Description|<p>-</p>|`SNMP agent`|ifAlarmDescription<p>Update: 1m</p>|
|Retificadores|<p>-</p>|`SNMP agent`|ifRetificadores<p>Update: 1m</p>|
|Battery|<p>-</p>|`SNMP agent`|ifBattery<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Input Line B Voltage|<p>-</p>|`SNMP agent`|psInputLineBVoltage<p>Update: 1m</p>|
|Input Line A Voltage|<p>-</p>|`SNMP agent`|psInputLineAVoltage<p>Update: 1m</p>|
|psSystemTotalDCEnergy|<p>-</p>|`SNMP agent`|psSystemTotalDCEnergy<p>Update: 1m</p>|
|Battery 2 Capacity|<p>-</p>|`SNMP agent`|fBattery2Capacity<p>Update: 1m</p>|
|System Current|<p>-</p>|`SNMP agent`|ifSystemCurrent<p>Update: 1m</p>|
|Input Line B Current|<p>-</p>|`SNMP agent`|psInputLineBCurrent<p>Update: 1m</p>|
|psTemperature1|<p>MIB: PowerNet-MIB The current internal UPS temperature in Celsius. Temperatures below zero read as 0.</p>|`SNMP agent`|ps1.temperature[upsHighPrecBatteryTemperature]<p>Update: 1m</p>|
|psStatusBatteryMode|<p>MIB: PowerNet-MIB The status of the UPS batteries. A batteryLow(3) value indicates the UPS will be unable to sustain the current load, and its services will be lost if power is not restored. The amount of run time in reserve at the time of low battery can be configured by the upsAdvConfigLowBatteryRunTime. A batteryInFaultCondition(4)value indicates that a battery installed has an internal error condition.</p>|`SNMP agent`|psbattery.status[upsBasicBatteryStatus]<p>Update: 1m</p>|
|Capacidade da Bateria (%)|<p>-</p>|`SNMP agent`|ifCapacidadeBateria<p>Update: 1m</p>|
|Battery 1 Capacity|<p>-</p>|`SNMP agent`|ifBattery1Capacity<p>Update: 1m</p>|
|Capacidade Usada dos Retificadores|<p>-</p>|`SNMP agent`|rectifiersUsedCapacity<p>Update: 1m</p>|
|System Voltage|<p>-</p>|`SNMP agent`|ifSystemVoltage<p>Update: 1m</p>|
|System Used Capacity|<p>-</p>|`SNMP agent`|ifSystemUsedCapacity<p>Update: 1m</p>|
|Input Line C Current|<p>-</p>|`SNMP agent`|psInputLineCCurrent<p>Update: 1m</p>|
|Input Line C Voltage|<p>-</p>|`SNMP agent`|psInputLineCVoltage<p>Update: 1m</p>|
|psSystemTotalACEnergy|<p>-</p>|`SNMP agent`|psSystemTotalACEnergy<p>Update: 1m</p>|
|System Status|<p>-</p>|`SNMP agent`|ifSystemStatus<p>Update: 1m</p>|
|Input Line A Current|<p>-</p>|`SNMP agent`|psInputLineACurrent<p>Update: 1m</p>|
|Battery 1 Current|<p>-</p>|`SNMP agent`|ifBattery1Current<p>Update: 1m</p>|
|Battery 2 Current|<p>-</p>|`SNMP agent`|ifBattery2Current<p>Update: 1m</p>|
|Battery Voltage|<p>-</p>|`SNMP agent`|ifBatteryVoltage<p>Update: 1m</p>|
|Total Load Current|<p>-</p>|`SNMP agent`|psTotalLoadCurrent<p>Update: 1m</p>|
|psTemperature2|<p>MIB: PowerNet-MIB The current internal UPS temperature in Celsius. Temperatures below zero read as 0.</p>|`SNMP agent`|ps2.temperature[upsHighPrecBatteryTemperature]<p>Update: 1m</p>|
|{#DESCR}|<p>-</p>|`SNMP agent`|if[{#DESCR}]<p>Update: 1m</p><p>LLD</p>|
|{#IFDESCR} - Capacidade da Corrente|<p>-</p>|`SNMP agent`|ifCurrentCapacity[{#IFDESCR}]<p>Update: 1h</p><p>LLD</p>|
|{#IFDESCR} - Falha no Retificador|<p>-</p>|`SNMP agent`|ifFailRectifyer[{#IFDESCR}]<p>Update: 1h</p><p>LLD</p>|
|Hardware Version {#IFDESCR}|<p>-</p>|`SNMP agent`|ifHardwareVersion[{#IFDESCR}]<p>Update: 1h</p><p>LLD</p>|
|Product Model {#IFDESCR}|<p>-</p>|`SNMP agent`|ifProducModel[{#IFDESCR}]<p>Update: 1h</p><p>LLD</p>|
|Software Revision {#IFDESCR}|<p>-</p>|`SNMP agent`|ifSoftwareRevision[{#IFDESCR}]<p>Update: 1h</p><p>LLD</p>|
|{#IFDESCR} - Temperature|<p>-</p>|`SNMP agent`|ifTemperatura[{#IFDESCR}]<p>Update: 1h</p><p>LLD</p>|
|Serial {#IFDESCR}|<p>-</p>|`SNMP agent`|serial[{#IFDESCR}]<p>Update: 1h</p><p>LLD</p>|
|{#IFBATTERY} - Capacidade|<p>Tipo de Bateria Utilizada</p>|`SNMP agent`|ifBatteryRating[{#IFBATTERY}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#DESCR} - CRITICAL|<p>-</p>|<p>**Expression**: {Vertiv:if[{#DESCR}].last()}=6</p><p>**Recovery expression**: </p>|high|
|{#DESCR} - WARNING|<p>-</p>|<p>**Expression**: {Vertiv:if[{#DESCR}].last()}=3</p><p>**Recovery expression**: </p>|average|
|Falha no Retificador|<p>-</p>|<p>**Expression**: {Vertiv:ifFailRectifyer[{#IFDESCR}].last()}<>2</p><p>**Recovery expression**: </p>|high|
|{#DESCR} - CRITICAL (LLD)|<p>-</p>|<p>**Expression**: {Vertiv:if[{#DESCR}].last()}=6</p><p>**Recovery expression**: </p>|high|
|{#DESCR} - WARNING (LLD)|<p>-</p>|<p>**Expression**: {Vertiv:if[{#DESCR}].last()}=3</p><p>**Recovery expression**: </p>|average|
|Falha no Retificador (LLD)|<p>-</p>|<p>**Expression**: {Vertiv:ifFailRectifyer[{#IFDESCR}].last()}<>2</p><p>**Recovery expression**: </p>|high|
