# Asustor NAS

## Description

Asustor NAS AS1004T https://www.asustor.com/

## Overview

Asustor NAS AS1004T template for Zabbix


CPU, fan, net, storage, volume discovery



## Author

Sergey Demidov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Net discovery|<p>-</p>|`SNMP agent`|netDiscovery<p>Update: 1h</p>|
|Storage discovery|<p>-</p>|`SNMP agent`|diskDiscovery<p>Update: 1h</p>|
|Fan discovery|<p>-</p>|`SNMP agent`|fanDiscovery<p>Update: 1h</p>|
|CPU discovery|<p>-</p>|`SNMP agent`|cpuDiscovery<p>Update: 1h</p>|
|Volume discovery|<p>-</p>|`SNMP agent`|volumeDiscovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|hwProcessor|<p>Модель процессора</p>|`SNMP agent`|hwProcessor<p>Update: 1h</p>|
|hwTotalMem|<p>Общий объем памяти системы в мегабайтах (МБ)</p>|`SNMP agent`|hwTotalMem<p>Update: 1h</p>|
|sysUptime|<p>Время безотказной работы данного NAS</p>|`SNMP agent`|sysUptime<p>Update: 1h</p>|
|hwSysTemperature|<p>Температура системы в градусах Цельсия</p>|`SNMP agent`|hwSysTemperature<p>Update: 15s</p>|
|sysAsustorID|<p>Проверяет, есть ли более новая версия ADM для обновления (Available / Unavailable)</p>|`SNMP agent`|sysAsustorID<p>Update: 1h</p>|
|hwFreeMem|<p>Свободный объем памяти системы в мегабайтах (МБ)</p>|`SNMP agent`|hwFreeMem<p>Update: 1h</p>|
|hwCPUTemperature|<p>Температура процессора в градусах Цельсия</p>|`SNMP agent`|hwCPUTemperature<p>Update: 15s</p>|
|sysBiosVersion|<p>Версия BIOS данного NAS</p>|`SNMP agent`|sysBiosVersion<p>Update: 1h</p>|
|sysTime|<p>Текущее время данного NAS</p>|`SNMP agent`|sysTime<p>Update: 1h</p>|
|hwModelName|<p>Модель данного NAS</p>|`SNMP agent`|hwModelName<p>Update: 1h</p>|
|sysADMVersion|<p>Версия ADM данного NAS</p>|`SNMP agent`|sysADMVersion<p>Update: 1h</p>|
|sysSerialNumber|<p>Серийный номер данного NAS</p>|`SNMP agent`|sysSerialNumber<p>Update: 1h</p>|
|sysTimeZone|<p>Часовой пояс данного NAS</p>|`SNMP agent`|sysTimeZone<p>Update: 1h</p>|
|Net #{#SNMPINDEX} index|<p>-</p>|`SNMP agent`|netIndex[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Net #{#SNMPINDEX} interface|<p>Интерфейс сети</p>|`SNMP agent`|netInterface[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Net #{#SNMPINDEX} IP4-address|<p>IPv4-адрес сетевого интерфейса</p>|`SNMP agent`|netIPv4Address[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Net #{#SNMPINDEX} IP6-address|<p>IPv6-адрес сетевого интерфейса</p>|`SNMP agent`|netIPv6Address[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Net #{#SNMPINDEX} MAC-address|<p>MAC-адрес сетевого интерфейса</p>|`SNMP agent`|netMacAddress[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Net #{#SNMPINDEX} Received|<p>Входящие пакеты в килобайтах (КБ)</p>|`SNMP agent`|netPacketReceived[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Net #{#SNMPINDEX} Sent|<p>Исходящие пакеты в килобайтах (КБ)</p>|`SNMP agent`|netPacketSent[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk #{#SNMPINDEX} index|<p>-</p>|`SNMP agent`|storage.diskIndex[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk #{#SNMPINDEX} interface|<p>Тип диска (SATA/SSD)</p>|`SNMP agent`|storage.diskInterface[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk #{#SNMPINDEX} model|<p>Модель диска</p>|`SNMP agent`|storage.diskModel[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk #{#SNMPINDEX} name|<p>ID дискового отсека</p>|`SNMP agent`|storage.diskName[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk #{#SNMPINDEX} size|<p>Размер диска в гигабайтах (ГБ)</p>|`SNMP agent`|storage.diskSize[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk #{#SNMPINDEX} SmartInfo|<p>Информация S.M.A.R.T. диска</p>|`SNMP agent`|storage.diskSmartInfo[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk #{#SNMPINDEX} status|<p>S.M.A.R.T. статус диска (Healthy, Normal, Risky, Dangerous, Bad)</p>|`SNMP agent`|storage.diskStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Disk #{#SNMPINDEX} temperature|<p>Температура диска в градусах Цельсия</p>|`SNMP agent`|storage.diskTemperature[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Fan #{#SNMPINDEX} speed|<p>Скорость вращения вентилятора, об/м</p>|`SNMP agent`|fanSpeed[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|CPU #{#SNMPINDEX} usage|<p>Процент использования процессора</p>|`SNMP agent`|CPUUsage[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume #{#SNMPINDEX} filesystem|<p>Тип файловой системы тома</p>|`SNMP agent`|volumeFileSystem[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Volume #{#SNMPINDEX} free size|<p>Свободный объем тома в гигабайтах (ГБ)</p>|`SNMP agent`|volumeFreeSize[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Volume #{#SNMPINDEX} index|<p>-</p>|`SNMP agent`|volumeIndex[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Volume #{#SNMPINDEX} level|<p>Уровень тома (Single / JBOD / Raid0 / Raid1 / Raid10 / Raid5 / Raid6)</p>|`SNMP agent`|volumeLevel[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Volume #{#SNMPINDEX} name|<p>Имя тома</p>|`SNMP agent`|volumeName[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Volume #{#SNMPINDEX} status|<p>Статус тома (Healthy, Clean, Active, Resyncing, Recovering, Reshaping, Appending, Migrating, fsExpanding fsIniting Degraded, Failed, Inactive)</p>|`SNMP agent`|volumeStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume #{#SNMPINDEX} total size|<p>Общий размер тома в гигабайтах (ГБ)</p>|`SNMP agent`|volumeTotalSize[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Hard Disk #{#SNMPINDEX} status: Bad|<p>-</p>|<p>**Expression**: find(/Asustor NAS/storage.diskStatus[{#SNMPINDEX}],,"regexp","bad")=1</p><p>**Recovery expression**: </p>|disaster|
|Hard Disk #{#SNMPINDEX} status: Risky|<p>-</p>|<p>**Expression**: find(/Asustor NAS/storage.diskStatus[{#SNMPINDEX}],,"regexp","Risky")=1</p><p>**Recovery expression**: </p>|warning|
|Hard Disk #{#SNMPINDEX} status: Warning|<p>-</p>|<p>**Expression**: find(/Asustor NAS/storage.diskStatus[{#SNMPINDEX}],,"regexp","Dangerous")=1</p><p>**Recovery expression**: </p>|average|
|Hard Disk #{#SNMPINDEX} Temperature to High > 60℃|<p>-</p>|<p>**Expression**: last(/Asustor NAS/storage.diskTemperature[{#SNMPINDEX}])>60</p><p>**Recovery expression**: </p>|average|
|Hard Disk #{#SNMPINDEX} Temperature to High > 70℃|<p>-</p>|<p>**Expression**: last(/Asustor NAS/storage.diskTemperature[{#SNMPINDEX}])>70</p><p>**Recovery expression**: </p>|disaster|
|FAN #{#SNMPINDEX} Slow RPM|<p>-</p>|<p>**Expression**: last(/Asustor NAS/fanSpeed[{#SNMPINDEX}])<50</p><p>**Recovery expression**: </p>|high|
|Volume #{#SNMPINDEX} {#VOLUMENAME} - FreeSpace is less than 10%|<p>-</p>|<p>**Expression**: (last(/Asustor NAS/volumeFreeSize[{#SNMPINDEX}]) / last(/Asustor NAS/volumeTotalSize[{#SNMPINDEX}])*100) < 10</p><p>**Recovery expression**: </p>|average|
|Hard Disk #{#SNMPINDEX} status: Bad (LLD)|<p>-</p>|<p>**Expression**: find(/Asustor NAS/storage.diskStatus[{#SNMPINDEX}],,"regexp","bad")=1</p><p>**Recovery expression**: </p>|disaster|
|Hard Disk #{#SNMPINDEX} status: Risky (LLD)|<p>-</p>|<p>**Expression**: find(/Asustor NAS/storage.diskStatus[{#SNMPINDEX}],,"regexp","Risky")=1</p><p>**Recovery expression**: </p>|warning|
|Hard Disk #{#SNMPINDEX} status: Warning (LLD)|<p>-</p>|<p>**Expression**: find(/Asustor NAS/storage.diskStatus[{#SNMPINDEX}],,"regexp","Dangerous")=1</p><p>**Recovery expression**: </p>|average|
|Hard Disk #{#SNMPINDEX} Temperature to High > 60℃ (LLD)|<p>-</p>|<p>**Expression**: last(/Asustor NAS/storage.diskTemperature[{#SNMPINDEX}])>60</p><p>**Recovery expression**: </p>|average|
|Hard Disk #{#SNMPINDEX} Temperature to High > 70℃ (LLD)|<p>-</p>|<p>**Expression**: last(/Asustor NAS/storage.diskTemperature[{#SNMPINDEX}])>70</p><p>**Recovery expression**: </p>|disaster|
|FAN #{#SNMPINDEX} Slow RPM (LLD)|<p>-</p>|<p>**Expression**: last(/Asustor NAS/fanSpeed[{#SNMPINDEX}])<50</p><p>**Recovery expression**: </p>|high|
|Volume #{#SNMPINDEX} {#VOLUMENAME} - FreeSpace is less than 10% (LLD)|<p>-</p>|<p>**Expression**: (last(/Asustor NAS/volumeFreeSize[{#SNMPINDEX}]) / last(/Asustor NAS/volumeTotalSize[{#SNMPINDEX}])*100) < 10</p><p>**Recovery expression**: </p>|average|
