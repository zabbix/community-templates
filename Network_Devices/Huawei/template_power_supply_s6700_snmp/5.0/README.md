# Power Supply S6700 SNMP

## Overview

Regra de Descoberta com Filtros para monitoramento de PSU na linha S6700.. Testado com S6720, S5720, S6730, S5732



## Author

carlosviatroski

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Power Supply Status|<p>-</p>|`SNMP agent`|hwPowerSupplyStatus<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status Power Supply|<p>-</p>|`SNMP agent`|Status[hwPowerSupplyStatus.{#ENT_NAME}]<p>Update: 3m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Problema no Slot {#ENT_NAME}|<p>-</p>|<p>**Expression**: {Power Supply S6700 SNMP:Status[hwPowerSupplyStatus.{#ENT_NAME}].last()}=2</p><p>**Recovery expression**: {Power Supply S6700 SNMP:Status[hwPowerSupplyStatus.{#ENT_NAME}].last()}=3</p>|high|
|Problema no Slot {#ENT_NAME} (LLD)|<p>-</p>|<p>**Expression**: {Power Supply S6700 SNMP:Status[hwPowerSupplyStatus.{#ENT_NAME}].last()}=2</p><p>**Recovery expression**: {Power Supply S6700 SNMP:Status[hwPowerSupplyStatus.{#ENT_NAME}].last()}=3</p>|high|
