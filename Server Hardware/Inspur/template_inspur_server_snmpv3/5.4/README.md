# Server Inspur BMC SNMPv3

## Overview

通过SNMPv3监控浪潮BMC接口，兼容M4和M5系列，已经在NF5280M4、NF5280M5、SA5212M5等设备上测试。监控整体健康、型号、序列号等信息。同时可以自动发现内存、风扇、硬盘、温度数据。


 


Monitor the Inspur BMC interface through SNMPv3


It is compatible with M4 and M5 series. It has been tested on NF5280M4, NF5280M5, SA5212M5 and other devices. Monitor overall health, model, serial number and more. At the same time, you can automatically find the memory, fan, hard disk, and temperature data.


 



## Author

Yihai Duan

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMPV3_AUTHPASSPHRASE}|<p>-</p>|`rootuser`|Text macro|
|{$SNMPV3_PRIVPASSPHRASE}|<p>-</p>|`rootuser`|Text macro|
|{$SNMPV3_SECURITYNAME}|<p>-</p>|`sysadmin`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MEMORY Discovery|<p>-</p>|`SNMP agent`|inspur.server.memory.dicovery<p>Update: 300s</p>|
|TEMPERATURE Discovery|<p>-</p>|`SNMP agent`|inspur.server.temperature.dicovery<p>Update: 300s</p>|
|VOLTAGE Discovery|<p>-</p>|`SNMP agent`|inspur.server.voltage.dicovery<p>Update: 300s</p>|
|FRU Discovery|<p>-</p>|`SNMP agent`|inspur.server.fru.dicovery<p>Update: 300s</p>|
|DISK Discovery|<p>-</p>|`SNMP agent`|inspur.server.disk.dicovery<p>Update: 300s</p>|
|FAN Discovery|<p>-</p>|`SNMP agent`|inspur.server.fan.dicovery<p>Update: 300s</p>|
|POWER SUPPLY Discovery|<p>-</p>|`SNMP agent`|inspur.server.power.supply.dicovery<p>Update: 300s</p>|
|WATCHDOG Discovery|<p>-</p>|`SNMP agent`|inspur.server.watchdog.dicovery<p>Update: 300s</p>|
|MICROCONTROLLER  Discovery|<p>-</p>|`SNMP agent`|inspur.server.microcontroller.dicovery<p>Update: 300s</p>|
|MANAGEMENT SUBSYSTEM HEALTH  Discovery|<p>-</p>|`SNMP agent`|inspur.server.management.subsystem.health.dicovery<p>Update: 300s</p>|
|PROCESSOR Discovery|<p>-</p>|`SNMP agent`|inspur.server.processor.dicovery<p>Update: 300s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MEMORY STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.status.[{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|TEMPERATURE STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.temperature.status.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|TEMPERATURE VALUE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.temperature.value.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|VOLTAGE STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.voltage.status.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|VOLTAGE VALUE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.voltage.value.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|FRU INFO: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.fru.info.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|DISK STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.disk.status.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|FAN SPEED VALUE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.fan.speed.value.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|FAN STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.fan.status.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|POWER SUPPLY STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.power.supply.status.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|POWER SUPPLY VALUE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.power.supply.value.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|WATCHDOG STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.watchdog.status.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|MICROCONTROLLER STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.microcontroller.status.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|MANAGEMENT SUBSYSTEM HEALTH STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.management.subsystem.health.status.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|PROCESSOR STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.processor.status.[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|INSPUR_SERVER_DISK_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.disk.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.disk.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_FAN_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.fan.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.fan.status.[{#SNMPVALUE}])=1</p>|warning|
|INSPUR_SERVER_MANAGEMENT_SUBSYSTEM_HEALTH_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.management.subsystem.health.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.management.subsystem.health.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_MEMORY_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.memory.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.memory.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_MICROCONTROLLER_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.microcontroller.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.microcontroller.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_POWER_SUPPLY_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.power.supply.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.power.supply.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_PROCESSOR_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.processor.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.processor.status.[{#SNMPVALUE}])=1</p>|disaster|
|INSPUR_SERVER_TEMPERATURE_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.temperature.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.temperature.status.[{#SNMPVALUE}])=1</p>|warning|
|INSPUR_SERVER_VOLTAGE_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.voltage.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.voltage.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_WATCHDOG_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.watchdog.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.watchdog.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_MEMORY_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.memory.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.memory.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_TEMPERATURE_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.temperature.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.temperature.status.[{#SNMPVALUE}])=1</p>|warning|
|INSPUR_SERVER_VOLTAGE_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.voltage.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.voltage.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_DISK_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.disk.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.disk.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_FAN_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.fan.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.fan.status.[{#SNMPVALUE}])=1</p>|warning|
|INSPUR_SERVER_POWER_SUPPLY_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.power.supply.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.power.supply.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_WATCHDOG_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.watchdog.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.watchdog.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_MICROCONTROLLER_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.microcontroller.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.microcontroller.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_MANAGEMENT_SUBSYSTEM_HEALTH_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.management.subsystem.health.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.management.subsystem.health.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_PROCESSOR_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC SNMPv3/inspur.server.processor.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC SNMPv3/inspur.server.processor.status.[{#SNMPVALUE}])=1</p>|disaster|
