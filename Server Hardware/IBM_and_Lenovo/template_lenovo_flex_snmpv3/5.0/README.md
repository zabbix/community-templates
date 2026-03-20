# Lenovo Flex chassis

## Overview

**Basic zabbix template for Lenovo Flex chassis.**
==================================================


Базовый монтирониг: Blades, Fans, Information, Powers, Switches, System.


Настройка:


1. Включить на CMM Flex SNMPv3.
2. Создать и настроить пользователя для мониторинга на CMM Flex.
3. В импортированном шаблоне прописать макросы: {$FLEX\_USER} и {$FLEX\_PASS}.


 


 


 



## Author

Evgen-20

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$FLEX_PASS}|<p>-</p>|``|Text macro|
|{$FLEX_USER}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery fan|<p>-</p>|`SNMP agent`|discovery.flex.fans<p>Update: 1d</p>|
|Discovery blades|<p>-</p>|`SNMP agent`|discovery.flex.blades<p>Update: 1h</p>|
|Discovery switches|<p>-</p>|`SNMP agent`|discovery.flex.switch<p>Update: 1d</p>|
|Discovery status power|<p>-</p>|`SNMP agent`|discovery.flex.power<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Flex CMM_2 firmware|<p>-</p>|`SNMP agent`|flex.fw.cmm2<p>Update: 1d</p>|
|Flex CMM_1 firmware|<p>-</p>|`SNMP agent`|flex.fw.cmm1<p>Update: 1d</p>|
|Flex temperature|<p>This is surrounding temperature where the system is installed. (C)</p>|`SNMP agent`|flex.temp<p>Update: 2m</p>|
|Flex serial number|<p>Machine serial number VPD information (from System BIOS).</p>|`SNMP agent`|flex.serial.number<p>Update: 1d</p>|
|Flex system health|<p>critical(0) nonCritical(2) systemLevel(4) normal(255)</p>|`SNMP agent`|flex.health<p>Update: 1m</p>|
|Flex power|<p>Chassis total power being used, which displays the total power being consumed by all modules in the chassis. It also includes power consumed by the blowers (chassis cooling devices) for the chassis.</p>|`SNMP agent`|flex.power.w<p>Update: 2m</p>|
|Flex fan speed {#SNMPINDEX}|<p>Chassis fan speed expressed in percent(%) of maximum RPM.</p>|`SNMP agent`|1.3.6.1.4.1.2.3.51.2.2.3.50.1.3.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Flex fan status {#SNMPINDEX}|<p>unknown(0) good(1) warning(2) bad(3)</p>|`SNMP agent`|1.3.6.1.4.1.2.3.51.2.2.3.50.1.4.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Flex blade {#SNMPINDEX}|<p>unknown(0) good(1) warning(2) critical(3) kernelMode(4) discovering(5) commError(6) noPower(7) flashing(8) initFailure(9) insufficientPower(10) powerDenied(11) maintMode(12) firehoseDump(13)</p>|`SNMP agent`|1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Flex switch {#SNMPINDEX}|<p>Switchs: Ethernet, Fiber and etc. unknown(0) good(1) warning(2) bad(3)</p>|`SNMP agent`|1.3.6.1.4.1.2.3.51.2.22.3.1.1.1.15.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Flex power {#SNMPINDEX}|<p>unknown(0) good(1) warning(2) notAvailable(3) critical(4)</p>|`SNMP agent`|1.3.6.1.4.1.2.3.51.2.2.4.1.1.3.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Check blade {#SNMPINDEX} on {HOST.NAME}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].last()}>3 or ({Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].last()}=0 and {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].prev()}>0)</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} has critical on blade {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} has warning on blade {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Check fan module {#SNMPINDEX} on {HOST.NAME}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.3.50.1.4.[{#SNMPINDEX}].last()}=0</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} has critical on fan module {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.3.50.1.4.[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} has warning on fan module {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.3.50.1.4.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Check power module {#SNMPINDEX} on {HOST.NAME}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.4.1.1.3.[{#SNMPINDEX}].last()}=0 or {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.4.1.1.3.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} has critical on power module {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.4.1.1.3.[{#SNMPINDEX}].last()}=4</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} has warning on power module {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.4.1.1.3.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Check switch {#SNMPINDEX} on {HOST.NAME}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.22.3.1.1.1.15.[{#SNMPINDEX}].last()}=0</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} has critical on switch {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.22.3.1.1.1.15.[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} has warning on switch {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.22.3.1.1.1.15.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Check fan module {#SNMPINDEX} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.3.50.1.4.[{#SNMPINDEX}].last()}=0</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} has critical on fan module {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.3.50.1.4.[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} has warning on fan module {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.3.50.1.4.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Check blade {#SNMPINDEX} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].last()}>3 or ({Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].last()}=0 and {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].prev()}>0)</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} has critical on blade {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} has warning on blade {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.8.2.1.1.5.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Check switch {#SNMPINDEX} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.22.3.1.1.1.15.[{#SNMPINDEX}].last()}=0</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} has critical on switch {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.22.3.1.1.1.15.[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} has warning on switch {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.22.3.1.1.1.15.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Check power module {#SNMPINDEX} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.4.1.1.3.[{#SNMPINDEX}].last()}=0 or {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.4.1.1.3.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} has critical on power module {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.4.1.1.3.[{#SNMPINDEX}].last()}=4</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} has warning on power module {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {Lenovo Flex chassis:1.3.6.1.4.1.2.3.51.2.2.4.1.1.3.[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
