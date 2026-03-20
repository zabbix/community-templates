# Fujitsu Primequest 3800E

## Overview

Value mapping


 


Primequest 3800E - CPU


1 - unknown


2 - not-present


3 - ok


4 - disabled


5 - error


6 - failed


7 - missing-termination


8 - prefailed-warning


 


Primequest 3800E - DIMM


1 - unknown


2 - not-present


3 - ok


4 - failed-disabled


5 - error


7 - warning


8 - hot-spare


9 - configuration-error


 


Primequest 3800E - FAN


1 - unknown


2 - disabled


3 - ok


4 - failed


5 - prefailed-predicted


6 - redundant-fan-failed


7 - not-manageable


8 - not-present


 


Primequest 3800E - FAN FAIL REACTION


1 - unknown


2 - continue


3 - shutdown-and-poweroff


 


Primequest 3800E - OVERAL STATUS


1 - ok


2 - degraded


3 - error


4 - failed


5 - unknown


 


Primequest 3800E - POWER SUPPLY


1 - unknown


2 - not-present


3 - ok


4 - failed


5 - ac-fail


6 - dc-fail


7 - critical-temperature


8 - not-manageable


9 - predictive-fail


 


Primequest 3800E - TEMPERATURE


1 - unknown


2 - not-available


3 - ok


5 - failed


6 - temperature-warning


7 - temperature-critical


 


Primequest 3800E - TEMPERATURE CRITICAL REACTION


1 - unknown


2 - continue


3 - shutdown-and-poweroff


 


Primequest 3800E - VOLTAGE


1 - unknown


2 - not-available


3 - ok


4 - too-low


5 - too-high


6 - sensor-failed


7 - low-warning


8 - high-warning



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discover CPU|<p>-</p>|`SNMP agent`|cpus<p>Update: 1h</p>|
|Discover TEMPERATURE|<p>-</p>|`SNMP agent`|temperatureSensors<p>Update: 1h</p>|
|Discover FAN|<p>-</p>|`SNMP agent`|fans<p>Update: 1h</p>|
|Discover DIMM|<p>-</p>|`SNMP agent`|memoryModules<p>Update: 1h</p>|
|Discover POWER SUPPLY|<p>-</p>|`SNMP agent`|powerSupply<p>Update: 1h</p>|
|Discovety SYSTEM BOARD|<p>-</p>|`SNMP agent`|systemBoard<p>Update: 1h</p>|
|Discovety VOLTAGE|<p>-</p>|`SNMP agent`|voltages<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System Description|<p>-</p>|`SNMP agent`|sysDescr.0<p>Update: 1h</p>|
|System Power Consumption (W)|<p>Current value of the system's power consumption (in Watts;4294967295(0xffffffff) if value not available)</p>|`SNMP agent`|pmCurrentPowerConsumption<p>Update: 60s</p>|
|Overall status|<p>Overall status of all monitored components in this agent ok(1):all subsystems and components working properly;no failure degraded(2):at least one component has a problem;system may still work properly error(3):severe problem;system will not work properly failed(4):one or more managed components have failed unknown(5):none of the subsystems had a valid status (e.g. during initialization)</p>|`SNMP agent`|agentStatus<p>Update: 15s</p>|
|System Uptime|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 30s</p>|
|System Name|<p>-</p>|`SNMP agent`|sysName.0<p>Update: 1h</p>|
|System exhaust airflow volume (m3/h)|<p>System exhaust airflow volume ('-1' if value not available)</p>|`SNMP agent`|afExhaustAirflowVolume<p>Update: 1m</p>|
|{#SNMPVALUE} Status|<p>CPU status Status mapping. SEL level MIB Value Warning disabled(4) Warning prefailed-warning(8) Error failed(6)</p>|`SNMP agent`|cpus.4.[{#SNMPINDEX}]<p>Update: 15s</p><p>LLD</p>|
|{#SNMPVALUE} Model Name|<p>CPU model name (e.g. Itanium2 Processor)</p>|`SNMP agent`|cpus.5.[{#SNMPINDEX}]<p>Update: 10h</p><p>LLD</p>|
|{#SNMPVALUE} Step|<p>CPU step / revision</p>|`SNMP agent`|cpus.7.[{#SNMPINDEX}]<p>Update: 10h</p><p>LLD</p>|
|{#SNMPVALUE} Current Speed|<p>CPU speed (frequency in MHz)</p>|`SNMP agent`|cpus.8.[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|{#SNMPVALUE} Number of Cores|<p>Number of (physically available) cores within one physical CPU (for multi-core CPUs;platform dependent)</p>|`SNMP agent`|cpus.13.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|{#SNMPVALUE} Number of Enabled Cores|<p>Number of effectively enabled cores within one physical CPU (for multi-core CPUs;0 if unknown)</p>|`SNMP agent`|cpus.15.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|{#SNMPVALUE} Status|<p>-</p>|`SNMP agent`|temperatureSensors.5.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE} Current Temperature|<p>-</p>|`SNMP agent`|temperatureSensors.6.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|{#SNMPVALUE} Temperature Warning Level|<p>-</p>|`SNMP agent`|temperatureSensors.7.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|{#SNMPVALUE} Temperature Critical Level|<p>-</p>|`SNMP agent`|temperatureSensors.8.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|{#SNMPVALUE} Critical Reaction|<p>-</p>|`SNMP agent`|temperatureSensors.9.[{#SNMPINDEX}]<p>Update: 10h</p><p>LLD</p>|
|{#SNMPVALUE} Status|<p>-</p>|`SNMP agent`|fans.5.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE} Current Speed|<p>-</p>|`SNMP agent`|fans.6.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|{#SNMPVALUE} Fail Reaction|<p>-</p>|`SNMP agent`|fans.8.[{#SNMPINDEX}]<p>Update: 10h</p><p>LLD</p>|
|{#SNMPVALUE} Status|<p>Memory module status Status mapping. SEL level MIB Value Warning failed-disabled(4) Warning warning(7) Error error(5) Error configuration-error(9)</p>|`SNMP agent`|memoryModules.4.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE} Capacity|<p>Memory module size (capacity in MBytes; -1 if unknown)</p>|`SNMP agent`|memoryModules.6.[{#SNMPINDEX}]<p>Update: 10h</p><p>LLD</p>|
|{#SNMPVALUE} Status|<p>Power supply status Status mapping. SEL level MIB Value Warning ac-fail(5) Warning predictive-fail(9) Error failed(4) Error not-manageable(8)</p>|`SNMP agent`|powerSupply.5.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|System Board ID#{#SNMPVALUE} Model Name|<p>Model name (e.g. 'System Board')</p>|`SNMP agent`|systemBoard.2.[{#SNMPINDEX}]<p>Update: 10h</p><p>LLD</p>|
|System Board ID#{#SNMPVALUE} Product Number|<p>Product number (may be identical to ModelName)</p>|`SNMP agent`|systemBoard.3.[{#SNMPINDEX}]<p>Update: 10h</p><p>LLD</p>|
|System Board ID#{#SNMPVALUE} Revision|<p>Revision string (e.g. 'WGS1 GS3')</p>|`SNMP agent`|systemBoard.4.[{#SNMPINDEX}]<p>Update: 10h</p><p>LLD</p>|
|System Board ID#{#SNMPVALUE} Serial Number|<p>Serial number (not available for all boards)</p>|`SNMP agent`|systemBoard.5.[{#SNMPINDEX}]<p>Update: 10h</p><p>LLD</p>|
|{#SNMPVALUE} Voltage Status|<p>Voltage status Status mapping. SEL level MIB Value Warning low-warning(7) Warning high-warning(8) Error too-low(4) Error too-high(5)</p>|`SNMP agent`|voltages.4.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE} Voltage Current Value|<p>Voltage current value. This object returns 0;if the agent can not get the value.(1/100V)</p>|`SNMP agent`|voltages.5.[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|{#SNMPVALUE} Voltage Minimum Level|<p>Voltage minimum level (1/100V)</p>|`SNMP agent`|voltages.7.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|{#SNMPVALUE} Voltage Maximum Level|<p>Voltage maximum level (1/100V)</p>|`SNMP agent`|voltages.8.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#SNMPVALUE} Error|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:cpus.4.[{#SNMPINDEX}].last()}=6</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Warning|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:cpus.4.[{#SNMPINDEX}].last()}=4 or {Fujitsu Primequest 3800E:cpus.4.[{#SNMPINDEX}].last()}=8</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Error|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:fans.5.[{#SNMPINDEX}].last()}=5 or {Fujitsu Primequest 3800E:fans.5.[{#SNMPINDEX}].last()}=4</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Error|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:memoryModules.4.[{#SNMPINDEX}].last()}=5 or {Fujitsu Primequest 3800E:memoryModules.4.[{#SNMPINDEX}].last()}=9</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Warning|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:memoryModules.4.[{#SNMPINDEX}].last()}=4 or {Fujitsu Primequest 3800E:memoryModules.4.[{#SNMPINDEX}].last()}=7</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Status Error|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:powerSupply.5.[{#SNMPINDEX}].last()}=4 or {Fujitsu Primequest 3800E:powerSupply.5.[{#SNMPINDEX}].last()}=8</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Status Warning|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:powerSupply.5.[{#SNMPINDEX}].last()}=5 or {Fujitsu Primequest 3800E:powerSupply.5.[{#SNMPINDEX}].last()}=9</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Critical Temperature Level|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:temperatureSensors.6.[{#SNMPINDEX}].last()}={Fujitsu Primequest 3800E:temperatureSensors.8.[{#SNMPINDEX}].last()}</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Status Error|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:temperatureSensors.5.[{#SNMPINDEX}].last()}=7 or {Fujitsu Primequest 3800E:temperatureSensors.5.[{#SNMPINDEX}].last()}=5</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Status Warning|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:temperatureSensors.5.[{#SNMPINDEX}].last()}=6</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Warning Temperature Level|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:temperatureSensors.6.[{#SNMPINDEX}].last()}={Fujitsu Primequest 3800E:temperatureSensors.7.[{#SNMPINDEX}].last()}</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Error|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:voltages.4.[{#SNMPINDEX}].last()}=4 or {Fujitsu Primequest 3800E:voltages.4.[{#SNMPINDEX}].last()}=5</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Warning|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:voltages.4.[{#SNMPINDEX}].last()}=7 or {Fujitsu Primequest 3800E:voltages.4.[{#SNMPINDEX}].last()}=8</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Error (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:cpus.4.[{#SNMPINDEX}].last()}=6</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Warning (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:cpus.4.[{#SNMPINDEX}].last()}=4 or {Fujitsu Primequest 3800E:cpus.4.[{#SNMPINDEX}].last()}=8</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Critical Temperature Level (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:temperatureSensors.6.[{#SNMPINDEX}].last()}={Fujitsu Primequest 3800E:temperatureSensors.8.[{#SNMPINDEX}].last()}</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Status Error (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:temperatureSensors.5.[{#SNMPINDEX}].last()}=7 or {Fujitsu Primequest 3800E:temperatureSensors.5.[{#SNMPINDEX}].last()}=5</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Status Warning (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:temperatureSensors.5.[{#SNMPINDEX}].last()}=6</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Warning Temperature Level (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:temperatureSensors.6.[{#SNMPINDEX}].last()}={Fujitsu Primequest 3800E:temperatureSensors.7.[{#SNMPINDEX}].last()}</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Error (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:fans.5.[{#SNMPINDEX}].last()}=5 or {Fujitsu Primequest 3800E:fans.5.[{#SNMPINDEX}].last()}=4</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Error (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:memoryModules.4.[{#SNMPINDEX}].last()}=5 or {Fujitsu Primequest 3800E:memoryModules.4.[{#SNMPINDEX}].last()}=9</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Warning (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:memoryModules.4.[{#SNMPINDEX}].last()}=4 or {Fujitsu Primequest 3800E:memoryModules.4.[{#SNMPINDEX}].last()}=7</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Status Error (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:powerSupply.5.[{#SNMPINDEX}].last()}=4 or {Fujitsu Primequest 3800E:powerSupply.5.[{#SNMPINDEX}].last()}=8</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Status Warning (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:powerSupply.5.[{#SNMPINDEX}].last()}=5 or {Fujitsu Primequest 3800E:powerSupply.5.[{#SNMPINDEX}].last()}=9</p><p>**Recovery expression**: </p>|average|
|{#SNMPVALUE} Error (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:voltages.4.[{#SNMPINDEX}].last()}=4 or {Fujitsu Primequest 3800E:voltages.4.[{#SNMPINDEX}].last()}=5</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Warning (LLD)|<p>-</p>|<p>**Expression**: {Fujitsu Primequest 3800E:voltages.4.[{#SNMPINDEX}].last()}=7 or {Fujitsu Primequest 3800E:voltages.4.[{#SNMPINDEX}].last()}=8</p><p>**Recovery expression**: </p>|average|
