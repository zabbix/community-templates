# Huawei Storage OceanStor 5500 LLD V

## Overview

Шаблон состоит из 8 правил обнаружения. Все они настроены на обнаружение индексов и автоматическое создание элементов данных с триггерами. Есть простые правила, например, “Обнаружение БП” – создает элемент данных проверяющий состояние блока питания и триггер, который в случае получения значения не NORMAL создаст проблему. Есть более сложные правила обнаружения с вычисляемыми элементами данных. Так как СХД по SNMP не может сообщить % свободного или занятого места в хранилище мы запрашиваем данные в MB и создаем дополнительный элемент для вычисления %. Триггеры привязываем к %. Такой элемент дает нам удобный график.


Видео про Шаблон:https://youtu.be/HVqw0hHJNEk


Тема про Шаблон:https://vk.com/topic-171974497\_42088542



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMPV3_AUTHPASS}|<p>-</p>|`пароль`|Text macro|
|{$SNMPV3_PRIVPASS}|<p>-</p>|`пароль`|Text macro|
|{$SNMPV3_SECNAME}|<p>-</p>|`логин`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Обнаружение Performance Port|<p>-</p>|`SNMP agent`|hwPortPerformance<p>Update: 1d</p>|
|Обнаружение Performance LUN|<p>-</p>|`SNMP agent`|hwPerformanceLun<p>Update: 1d</p>|
|Обнаружение Контроллеров|<p>-</p>|`SNMP agent`|hwInfoController<p>Update: 1d</p>|
|Обнаружение Fan БП|<p>-</p>|`SNMP agent`|hwinfoFANPower<p>Update: 1d</p>|
|Обнаружение Storage Pool|<p>-</p>|`SNMP agent`|hwInfoPool<p>Update: 1d</p>|
|Обнаружение БП|<p>-</p>|`SNMP agent`|hwinfoPower<p>Update: 1d</p>|
|Обнаружение Disk Domain|<p>-</p>|`SNMP agent`|hwInfoDiskDomain<p>Update: 1d</p>|
|Обнаружение LUN|<p>-</p>|`SNMP agent`|hwInfoLun<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Состояние системы|<p>-</p>|`SNMP agent`|status.0<p>Update: 1m</p>|
|Port: {#PORTLOCATION} I/O latancy|<p>-</p>|`SNMP agent`|hwPerfPortDelay.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|LUN {$LUNID{#LUNPID}} Read IOPS|<p>-</p>|`SNMP agent`|hwPerfLunReadIOPS.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|LUN {$LUNID{#LUNPID}} Read bandwidth MB/s|<p>-</p>|`SNMP agent`|hwPerfLunReadTraffic.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|LUN {$LUNID{#LUNPID}} Total IOPS|<p>-</p>|`SNMP agent`|hwPerfLunTotalIOPS.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|LUN {$LUNID{#LUNPID}} Total bandwidth MB/s|<p>-</p>|`SNMP agent`|hwPerfLunTotalTraffic.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|LUN {$LUNID{#LUNPID}} Write IOPS|<p>-</p>|`SNMP agent`|hwPerfLunWriteIOPS.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|LUN {$LUNID{#LUNPID}} Write bandwidth MB/s|<p>-</p>|`SNMP agent`|hwPerfLunWriteTraffic.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Использование CPU контроллера: {#CONLOCATION} в %|<p>-</p>|`SNMP agent`|hwInfoControllerCPUUsage.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Состояние контроллера: {#CONLOCATION}|<p>-</p>|`SNMP agent`|hwInfoControllerHealthStatus.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Использование Memory контроллера: {#CONLOCATION} в %|<p>-</p>|`SNMP agent`|hwInfoControllerMemoryUsage.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Состояние вентилятора БП: {#FANLOCATION}|<p>-</p>|`SNMP agent`|hwInfoFanHealthStatus.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Storage Pool: {#POOLNAME} Allocated Capacity в %|<p>-</p>|`Calculated`|hwInfoStoragePoolCapacityProc.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Состояние Storage Pool: {#POOLNAME}|<p>-</p>|`SNMP agent`|hwInfoStoragePoolHealthStatus.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Storage Pool: {#POOLNAME} Capacity в байтах|<p>-</p>|`SNMP agent`|hwInfoStoragePoolTotal.[{#SNMPINDEX}]<p>Update: 24h</p><p>LLD</p>|
|Storage Pool: {#POOLNAME} Allocated Capacity в байтах|<p>-</p>|`SNMP agent`|hwInfoStoragePoolUsed.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Состояние БП: {#PLOCATION}|<p>-</p>|`SNMP agent`|hwInfoPowerHealthStatus.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Состояние Disk Domain: {#DISKDNAME}|<p>-</p>|`SNMP agent`|hwInfoDiskDomainHealthStatus.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Running статус Disk Domain: {#DISKDNAME}|<p>-</p>|`SNMP agent`|hwInfoDiskDomainRunningStatus.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|LUN {#LUNNAME} Capacity в байтах|<p>-</p>|`SNMP agent`|hwInfoLunCapacity.[{#SNMPINDEX}]<p>Update: 24h</p><p>LLD</p>|
|LUN {#LUNNAME} Allocated Capacity в %|<p>-</p>|`Calculated`|hwInfoLunCapacityProc.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Состояние LUN {#LUNNAME}|<p>-</p>|`SNMP agent`|hwInfoLunHealthStatus.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|LUN {#LUNNAME} Allocated Capacity в байтах|<p>-</p>|`SNMP agent`|hwInfoLunSubscribedCapacity.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Контроллер {#CONLOCATION} использует > 90% CPU|<p>Контроллер {#CONLOCATION} использует > 90% производительности CPU в течение 15 минут</p>|<p>**Expression**: avg(/Huawei Storage OceanStor 5500 LLD V/hwInfoControllerCPUUsage.[{#SNMPINDEX}],15m)>90</p><p>**Recovery expression**: </p>|high|
|Контроллер {#CONLOCATION} использует > 95% Memory|<p>Контроллер {#CONLOCATION} использует > 95% производительности памяти в течение 15 минут</p>|<p>**Expression**: avg(/Huawei Storage OceanStor 5500 LLD V/hwInfoControllerMemoryUsage.[{#SNMPINDEX}],15m)>95</p><p>**Recovery expression**: </p>|high|
|Проблема с контроллером: {#CONLOCATION}|<p>SNMP проверка получила состояние Контроллера не Normal</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoControllerHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Проблема с Disk Domain: {#DISKDNAME}|<p>SNMP проверка получила состояние не Normal</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoDiskDomainHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Проблема с Disk Domain: {#DISKDNAME}|<p>SNMP проверка получила состояние не Online. Проверьте состояние СХД.</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoDiskDomainRunningStatus.[{#SNMPINDEX}])<>27</p><p>**Recovery expression**: </p>|warning|
|Проблема с Вентилятором БП: {#FANLOCATION}|<p>SNMP проверка получила состояние Вентилятора БП не Normal ID:{#FANID} Location:{#FANLOCATION}</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoFanHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|LUN {#LUNNAME} Allocated Capacity > 85%|<p>-</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoLunCapacityProc.[{#SNMPINDEX}])>85</p><p>**Recovery expression**: </p>|warning|
|LUN {#LUNNAME} Allocated Capacity > 95%|<p>-</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoLunCapacityProc.[{#SNMPINDEX}])>95</p><p>**Recovery expression**: </p>|high|
|Проблема с LUN {#LUNNAME}|<p>SNMP проверка получила состояние не Normal ID:{#LUNID} LUN NAME:{#LUNNAME}</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoLunHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|{#POOLNAME} Allocated Capacity > 85%|<p>-</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoStoragePoolCapacityProc.[{#SNMPINDEX}])>85</p><p>**Recovery expression**: </p>|warning|
|{#POOLNAME} Allocated Capacity > 95%|<p>-</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoStoragePoolCapacityProc.[{#SNMPINDEX}])>95</p><p>**Recovery expression**: </p>|high|
|Проблема с Storage Pool: {#POOLNAME}|<p>SNMP проверка получила состояние Pool-а не Normal В меню "Последние данные" можно проверить состояние pool-а</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoStoragePoolHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Проблема с БП: {#PLOCATION}|<p>SNMP проверка получила состояние БП не Normal Модель БП:{#PMODEL} ID:{#POWERID} Location:{#PLOCATION}</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoPowerHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|I/O latancy Port: {#PORTLOCATION} > 40 мс|<p>Проверьте состояние СХД, возможны проблемы с производительностью.</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwPerfPortDelay.[{#SNMPINDEX}])>40</p><p>**Recovery expression**: </p>|average|
|I/O latancy Port: {#PORTLOCATION} > 40 мс (LLD)|<p>Проверьте состояние СХД, возможны проблемы с производительностью.</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwPerfPortDelay.[{#SNMPINDEX}])>40</p><p>**Recovery expression**: </p>|average|
|Контроллер {#CONLOCATION} использует > 90% CPU (LLD)|<p>Контроллер {#CONLOCATION} использует > 90% производительности CPU в течение 15 минут</p>|<p>**Expression**: avg(/Huawei Storage OceanStor 5500 LLD V/hwInfoControllerCPUUsage.[{#SNMPINDEX}],15m)>90</p><p>**Recovery expression**: </p>|high|
|Контроллер {#CONLOCATION} использует > 95% Memory (LLD)|<p>Контроллер {#CONLOCATION} использует > 95% производительности памяти в течение 15 минут</p>|<p>**Expression**: avg(/Huawei Storage OceanStor 5500 LLD V/hwInfoControllerMemoryUsage.[{#SNMPINDEX}],15m)>95</p><p>**Recovery expression**: </p>|high|
|Проблема с контроллером: {#CONLOCATION} (LLD)|<p>SNMP проверка получила состояние Контроллера не Normal</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoControllerHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Проблема с Вентилятором БП: {#FANLOCATION} (LLD)|<p>SNMP проверка получила состояние Вентилятора БП не Normal ID:{#FANID} Location:{#FANLOCATION}</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoFanHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|{#POOLNAME} Allocated Capacity > 85% (LLD)|<p>-</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoStoragePoolCapacityProc.[{#SNMPINDEX}])>85</p><p>**Recovery expression**: </p>|warning|
|{#POOLNAME} Allocated Capacity > 95% (LLD)|<p>-</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoStoragePoolCapacityProc.[{#SNMPINDEX}])>95</p><p>**Recovery expression**: </p>|high|
|Проблема с Storage Pool: {#POOLNAME} (LLD)|<p>SNMP проверка получила состояние Pool-а не Normal В меню "Последние данные" можно проверить состояние pool-а</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoStoragePoolHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Проблема с БП: {#PLOCATION} (LLD)|<p>SNMP проверка получила состояние БП не Normal Модель БП:{#PMODEL} ID:{#POWERID} Location:{#PLOCATION}</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoPowerHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Проблема с Disk Domain: {#DISKDNAME} (LLD)|<p>SNMP проверка получила состояние не Normal</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoDiskDomainHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|Проблема с Disk Domain: {#DISKDNAME} (LLD)|<p>SNMP проверка получила состояние не Online. Проверьте состояние СХД.</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoDiskDomainRunningStatus.[{#SNMPINDEX}])<>27</p><p>**Recovery expression**: </p>|warning|
|LUN {#LUNNAME} Allocated Capacity > 85% (LLD)|<p>-</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoLunCapacityProc.[{#SNMPINDEX}])>85</p><p>**Recovery expression**: </p>|warning|
|LUN {#LUNNAME} Allocated Capacity > 95% (LLD)|<p>-</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoLunCapacityProc.[{#SNMPINDEX}])>95</p><p>**Recovery expression**: </p>|high|
|Проблема с LUN {#LUNNAME} (LLD)|<p>SNMP проверка получила состояние не Normal ID:{#LUNID} LUN NAME:{#LUNNAME}</p>|<p>**Expression**: last(/Huawei Storage OceanStor 5500 LLD V/hwInfoLunHealthStatus.[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
