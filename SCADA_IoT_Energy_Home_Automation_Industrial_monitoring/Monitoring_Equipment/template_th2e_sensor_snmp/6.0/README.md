# TH2E-Sensor (template_TH2ESensor_snmp)

## Overview
Zabbix template for TH2E Sensor (TH2E: Ethernet thermometer and hygrometer)

Test on: Zabbix 6.0

The template monitors the TH2E device, which is used to monitor the environment. This device monitors temperature and humidity.


## Author
Kamil Gołuchowski

## Setup
Import the template_TH2ESensor_snmp.yaml template into your Zabbix instance (Configuration --> Templates --> Import), and apply the template to a host.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Check Dew Sensore|Dew Sensore Check 0 =OK, 1 =Not available, 2 =over-flow, 3 =under-flow, 4 =error|SNMP Agent|dewSensoreCheck|
|Check Humidity Sensore|Humidity Sensore Check 0 =OK, 1 =Not available, 2 =over-flow, 3 =under-flow, 4 =error|SNMP Agent|humiditySensoreCheck|
|Check Temperature Sensore|Temperature Sensore Check 0 =OK, 1 =Not available, 2 =over-flow, 3 =under-flow, 4 =error|SNMP Agent|tempSensoreCheck|
|DewPoint|DewPoint status|SNMP Agent|DewPointValue|
|Humidity|Humidity status|SNMP Agent|humidityValue|
|Temperature|Temperature status|SNMP Agent|tempValue|
|ICMP loss| - |Simple check|icmppingloss|
|ICMP ping| - |Simple check|icmpping|
|ICMP response time| - |Simple check|icmppingsec|

## Triggers

|Name|Expression|Priority|
|----|----------|--------|
|Check Humidity Sensore, value: {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_TH2ESensor_snmp/humiditySensoreCheck)<>0|Information|
|Check Temperature Sensore, value: {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_TH2ESensor_snmp/tempSensoreCheck)<>0|Information|
|Critical humidity {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_TH2ESensor_snmp/humidityValue)>{$CRITICAL_HUMIDITY}|High|
|High humidity {ITEM.LASTVALUE} on {HOST.NAME}|	last(/template_TH2ESensor_snmp/humidityValue)>{$HIGHT_HUMIDITY}|Information|
|Hight temperature {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_TH2ESensor_snmp/tempValue)>{$HIGH_TEMP}|High|
|Low humidity {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_TH2ESensor_snmp/humidityValue)<{$LOW_HUMIDITY}|High|
|Low temperature {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_TH2ESensor_snmp/tempValue)<{$LOW_TEMP}>{$HIGH_TEMP}|High|
|Ping loss is too high on {HOST.NAME}|min(/template_TH2ESensor_snmp/icmppingloss,5m)>20|Warning|
|Response time is too high on {HOST.NAME}|avg(/template_TH2ESensor_snmp/icmppingsec,5m)>0.40|Warning|
|{HOST.NAME} is unavailable by ICMP|max(/template_TH2ESensor_snmp/icmpping,#5)=0|Average|


## Macros used

|Name|Description|Value|
|----|-----------|----|
|{$CRITICAL_HUMIDITY}|CRITICAL to high|70|
|{$HIGHT_HUMIDITY}|HUMIDITY to high|60|
|{$HIGH_TEMP}|Temperature to high|30|
|{$LOW_HUMIDITY}|HUMIDITY to low|20|
|{$LOW_TEMP}|Temperature to low|15|
|{$SNMP_COMMUNITY}| - |public|

## Value mapping
|Name|Value|
|----|-----------|
|sensorValue|0=OK, 1=Not available, 2=over-flow, 3=under-flow, 4=error
