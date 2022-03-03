# Nobreak Engetron SNMP v1

## Overview

Template para o UPS Nobreak Engetron WBRC-II (v2.6) utilizando SNMP v1, único protocolo aceito pelo equipamento. Criado utilizando UPS-MIB.



## Author

Andre Juliano Danielski

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Potência Entrada Fase 2|<p>-</p>|`SNMP agent`|upsInputTruePower2<p>Update: 30s</p>|
|Potência Saída Fase 3|<p>-</p>|`SNMP agent`|upsOutputPower3<p>Update: 30s</p>|
|Temperatura|<p>-</p>|`SNMP agent`|upsBatteryTemperature<p>Update: 30s</p>|
|Potência Entrada Fase 3|<p>-</p>|`SNMP agent`|upsInputTruePower3<p>Update: 30s</p>|
|Tensão Entrada Fase 2|<p>-</p>|`SNMP agent`|upsInputVoltage2<p>Update: 30s</p>|
|Carga Utilizada Fase 2|<p>-</p>|`SNMP agent`|upsOutputPercentLoad2<p>Update: 30s</p>|
|Tensão Entrada Fase 3|<p>-</p>|`SNMP agent`|upsInputVoltage3<p>Update: 30s</p>|
|Corrente Entrada Fase 3|<p>-</p>|`SNMP agent`|upsInputCurrent3<p>Update: 30s</p>|
|Carga Utilizada Fase 1|<p>-</p>|`SNMP agent`|upsOutputPercentLoad1<p>Update: 30s</p>|
|Corrente Saída Fase 1|<p>-</p>|`SNMP agent`|upsOutputCurrent1<p>Update: 30s</p>|
|Autonomia|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 30s</p>|
|Fase2|<p>-</p>|`SNMP agent`|upsInputLineIndex2<p>Update: 30s</p>|
|Fase3|<p>-</p>|`SNMP agent`|upsInputLineIndex3<p>Update: 30s</p>|
|Corrente Entrada Fase 2|<p>-</p>|`SNMP agent`|upsInputCurrent2<p>Update: 30s</p>|
|Modelo|<p>-</p>|`SNMP agent`|upsIdentModel<p>Update: 7200</p>|
|Fase1|<p>-</p>|`SNMP agent`|upsInputLineIndex1<p>Update: 30s</p>|
|Carga Utilizada Fase 3|<p>-</p>|`SNMP agent`|upsOutputPercentLoad3<p>Update: 30s</p>|
|Tensão Saída Fase 2|<p>-</p>|`SNMP agent`|upsOutputVoltage2<p>Update: 30s</p>|
|Corrente Saída Fase 2|<p>-</p>|`SNMP agent`|upsOutputCurrent2<p>Update: 30s</p>|
|Potência Entrada Fase 1|<p>-</p>|`SNMP agent`|upsInputTruePower1<p>Update: 30s</p>|
|Tensão Bateria|<p>-</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 30s</p>|
|Potência Saída Fase 2|<p>-</p>|`SNMP agent`|upsOutputPower2<p>Update: 30s</p>|
|Tensão Entrada Fase 1|<p>-</p>|`SNMP agent`|upsInputVoltage1<p>Update: 30s</p>|
|Fabricante|<p>-</p>|`SNMP agent`|upsIdentManufacturer<p>Update: 7200</p>|
|Tensão Saída Fase 1|<p>-</p>|`SNMP agent`|upsOutputVoltage1<p>Update: 30s</p>|
|Corrente Entrada Fase 1|<p>-</p>|`SNMP agent`|upsInputCurrent1<p>Update: 30s</p>|
|Potência Saída Fase 1|<p>-</p>|`SNMP agent`|upsOutputPower1<p>Update: 30s</p>|
|Tensão Saída Fase 3|<p>-</p>|`SNMP agent`|upsOutputVoltage3<p>Update: 30s</p>|
|Corrente Saída Fase 3|<p>-</p>|`SNMP agent`|upsOutputCurrent3<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

