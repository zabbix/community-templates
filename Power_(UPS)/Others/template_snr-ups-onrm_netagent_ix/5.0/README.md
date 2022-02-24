# NetAgent UPS

## Overview

A simple template for monitoring the UPS company NAG series **SNR-UPS-ONRM** with network cards **SNMP DL801** (**NetAgent IX**)


  
List of parameters:  
UPS battery capacity (%)  
UPS Battery Last Replace Date  
UPS battery status  
UPS battery temperature  
UPS Firmware Revision  
UPS input voltage  
UPS output frequency  
UPS output load (%)  
UPS output voltage  
UPS status  
UPS time on battery  
Uptime



## Author

Ilya Ostanin

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
|UPS battery status|<p>-</p>|`SNMP agent`|netagent.battery.status<p>Update: 30m</p>|
|UPS status|<p>The current state of the UPS. If the UPS is unable to determine the state of the UPS this variable is set to unknown(1).</p>|`SNMP agent`|upsBaseOutputStatus<p>Update: 30s</p>|
|UPS time on battery|<p>The elapsed time in seconds since the UPS has switched to battery power. Прошедшее время в секундах с момента переключения ИБП на батареи.</p>|`SNMP agent`|upsBaseBatteryTimeOnBattery<p>Update: 60s</p>|
|UPS Firmware Revision|<p>-</p>|`SNMP agent`|upsSmartIdentFirmwareRevision<p>Update: 30s</p>|
|UPS output voltage|<p>The output voltage of the UPS system in 1/10 VAC</p>|`SNMP agent`|upsSmartOutputVoltage<p>Update: 30s</p>|
|UPS battery capacity (%)|<p>The remaining battery capacity expressed in percent of full capacity. Оставшаяся емкость аккумулятора выражена в процентов от полной емкости.</p>|`SNMP agent`|upsSmartBatteryCapacity<p>Update: 60s</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 1m</p>|
|UPS battery temperature|<p>The current internal UPS temperature expressed in tenths of a Celsius degree. Текущая внутренняя температура ИБП, выраженная в десятых долях градус Цельсия.</p>|`SNMP agent`|upsSmartBatteryTemperature<p>Update: 60s</p>|
|UPS output frequency|<p>The current input frequency to the UPS system in 1/10 Hz.</p>|`SNMP agent`|upsSmartOutputFrequency<p>Update: 30s</p>|
|UPS Battery Last Replace Date|<p>The date when the UPS system's batteries were last replaced in mm/dd/yy format. For UPS models, this value is originally set in the factory. When the UPS batteries are replaced, this value should be reset by the administrator Дата последней замены батарей системы ИБП в формате мм / дд / гг. Это значение изначально установлено на заводе. Когда батареи ИБП заменены, это значение должно быть сброшено администратором</p>|`SNMP agent`|upsBaseLBatteryLastReplaceDate<p>Update: 1h</p>|
|UPS output load (%)|<p>The current UPS load expressed in percent of rated capacity.</p>|`SNMP agent`|upsSmartOutputLoad<p>Update: 60s</p>|
|UPS input voltage|<p>-</p>|`SNMP agent`|upsSmartInputLineVoltage<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

