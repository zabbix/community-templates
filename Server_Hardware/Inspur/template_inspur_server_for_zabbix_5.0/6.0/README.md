# Server Inspur BMC All Items 4 Zabbix5.0

## Description

加密方式改为SHA和AES

## Overview

支持 zabbix 5.0


通过SNMP监控浪潮BMC接口，兼容M4和M5系列，已经在NF5280M4、NF5280M5、SA5212M5等设备上测试。监控整体健康、型号、序列号等信息。同时可以自动发现内存、风扇、硬盘、温度数据。


 


support zabbix 5.0


Monitor the Inspur BMC interface through SNMPv3


It is compatible with M4 and M5 series. It has been tested on NF5280M4, NF5280M5, SA5212M5 and other devices. Monitor overall health, model, serial number and more. At the same time, you can automatically find the memory, fan, hard disk, and temperature data.



## Author

Yihai Duan

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|FRU Discovery|<p>-</p>|`SNMP agent`|inspur.server.fru.dicovery<p>Update: 60m</p>|
|MICROCONTROLLER  Discovery|<p>-</p>|`SNMP agent`|inspur.server.microcontroller.dicovery<p>Update: 20m</p>|
|PROCESSOR INFO Discovery|<p>-</p>|`SNMP agent`|inspur.server.processor.info.dicovery<p>Update: 60m</p>|
|PROCESSOR Discovery|<p>-</p>|`SNMP agent`|inspur.server.processor.dicovery<p>Update: 20m</p>|
|VOLTAGE Discovery|<p>-</p>|`SNMP agent`|inspur.server.voltage.dicovery<p>Update: 20m</p>|
|TEMPERATURE Discovery|<p>-</p>|`SNMP agent`|inspur.server.temperature.dicovery<p>Update: 20m</p>|
|MANAGEMENT SUBSYSTEM HEALTH  Discovery|<p>-</p>|`SNMP agent`|inspur.server.management.subsystem.health.dicovery<p>Update: 20m</p>|
|POWER SUPPLY Discovery|<p>-</p>|`SNMP agent`|inspur.server.power.supply.dicovery<p>Update: 20m</p>|
|WATCHDOG Discovery|<p>-</p>|`SNMP agent`|inspur.server.watchdog.dicovery<p>Update: 20m</p>|
|PCIE Discovery|<p>-</p>|`SNMP agent`|inspur.server.pcie.dicovery<p>Update: 60m</p>|
|DISK INFO Discovery|<p>-</p>|`SNMP agent`|inspur.server.disk.dicovery.info<p>Update: 10m</p>|
|MEMORY INFO Discovery|<p>-</p>|`SNMP agent`|inspur.server.memory.info.dicovery<p>Update: 60m</p>|
|MEMORY Discovery|<p>-</p>|`SNMP agent`|inspur.server.memory.dicovery<p>Update: 20m</p>|
|DISK Discovery|<p>-</p>|`SNMP agent`|inspur.server.disk.dicovery<p>Update: 20m</p>|
|RAID Discovery|<p>-</p>|`SNMP agent`|inspur.server.raid.dicovery<p>Update: 60m</p>|
|FAN Discovery|<p>-</p>|`SNMP agent`|inspur.server.fan.dicovery<p>Update: 20m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|FRU INFO: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.fru.info.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MICROCONTROLLER STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.microcontroller.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|PROCESSOR L1 CACHE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.processor.L1.cache.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PROCESSOR L2 CACHE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.processor.L2.cache.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PROCESSOR L3 CACHE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.processor.L3.cache.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PROCESSOR MODEL INFO: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.processor.model.info.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PROCESSOR PRESENT STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.processor.present.status.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PROCESSOR THERMAL DESIGN POWER: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.processor.thermal.design.power.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PROCESSOR USED CORE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.processor.used.core.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PROCESSOR STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.processor.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|VOLTAGE STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.voltage.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|VOLTAGE VALUE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.voltage.value.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|TEMPERATURE STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.temperature.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|TEMPERATURE VALUE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.temperature.value.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|MANAGEMENT SUBSYSTEM HEALTH STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.management.subsystem.health.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|POWER SUPPLY STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.power.supply.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|POWER SUPPLY VALUE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.power.supply.value.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|WATCHDOG STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.watchdog.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|PCIE CONNECT TYPE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.pcie.connect.type.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PCIE DEVICE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.pcie.device.info.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PCIE DEVICE TYPE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.pcie.device.type.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PCIE PRESENT STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.pcie.present.status.[{#SNMPVALUE}]<p>Update: 20m</p><p>LLD</p>|
|PCIE RATED SPEED: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.pcie.rated.speed.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PCIE RATED WIDTH: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.pcie.rated.width.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PCIE SLOT ON RISER: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.pcie.slot.on.riser.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|PCIE VENDER: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.pcie.vender.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|DISK ATTACH: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.disk.attach.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|DISK INFO STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.disk.info.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|DISK MODEL: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.disk.model.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|DISK PRODUCT: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.disk.product.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|DISK SIZE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.disk.size.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|DISK TYPE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.disk.type.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|MEMORY ATTACH : {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.attach.info.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MEMORY CAPACITY: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.capacity.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MEMORY DATA WIDTH: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.data.width.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MEMORY MFC INFO: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.mfc.info.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MEMORY PART NUMBER: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.part.number.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MEMORY PRESNET STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.present.status.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MEMORY SN: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.sn.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MEMORY SPEED: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.speed.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MEMORY TYPE INFO: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.type.info.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|MEMORY STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.memory.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|DISK STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.disk.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|RAID STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.raid.status.[{#SNMPVALUE}]<p>Update: 60m</p><p>LLD</p>|
|FAN SPEED VALUE: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.fan.speed.value.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|FAN STATUS: {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inspur.server.fan.status.[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|INSPUR_SERVER_DISK_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.disk.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.disk.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_FAN_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.fan.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.fan.status.[{#SNMPVALUE}])=1</p>|warning|
|INSPUR_SERVER_MANAGEMENT_SUBSYSTEM_HEALTH_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.management.subsystem.health.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.management.subsystem.health.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_MEMORY_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.memory.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.memory.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_MICROCONTROLLER_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.microcontroller.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.microcontroller.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_PCIE_PRESENT_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.pcie.present.status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.pcie.present.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_POWER_SUPPLY_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.power.supply.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.power.supply.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_PROCESSOR_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.processor.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.processor.status.[{#SNMPVALUE}])=1</p>|disaster|
|INSPUR_SERVER_TEMPERATURE_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.temperature.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.temperature.status.[{#SNMPVALUE}])=1</p>|warning|
|INSPUR_SERVER_VOLTAGE_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.voltage.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.voltage.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_WATCHDOG_STATUS_ALARM|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.watchdog.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.watchdog.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_MICROCONTROLLER_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.microcontroller.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.microcontroller.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_PROCESSOR_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.processor.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.processor.status.[{#SNMPVALUE}])=1</p>|disaster|
|INSPUR_SERVER_VOLTAGE_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.voltage.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.voltage.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_TEMPERATURE_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.temperature.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.temperature.status.[{#SNMPVALUE}])=1</p>|warning|
|INSPUR_SERVER_MANAGEMENT_SUBSYSTEM_HEALTH_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.management.subsystem.health.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.management.subsystem.health.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_POWER_SUPPLY_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.power.supply.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.power.supply.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_WATCHDOG_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.watchdog.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.watchdog.status.[{#SNMPVALUE}])=1</p>|average|
|INSPUR_SERVER_PCIE_PRESENT_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.pcie.present.status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.pcie.present.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_MEMORY_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.memory.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.memory.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_DISK_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.disk.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.disk.status.[{#SNMPVALUE}])=1</p>|high|
|INSPUR_SERVER_FAN_STATUS_ALARM (LLD)|<p>-</p>|<p>**Expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.fan.status.[{#SNMPVALUE}])>1</p><p>**Recovery expression**: last(/Server Inspur BMC All Items 4 Zabbix5.0/inspur.server.fan.status.[{#SNMPVALUE}])=1</p>|warning|
