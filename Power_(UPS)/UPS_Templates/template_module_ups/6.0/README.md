# Module UPS

## Description

Template para módulos UPS (Nobreaks), em conformidade com a RFC 1628 de Maio de 1994. Link: https://tools.ietf.org/html/rfc1628

## Overview

Este é o módulo MIB UPS-MIB baseado em Padrões/RFCs.



## Author

Henrique Soares

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Informações de entrada de fase|<p>-</p>|`SNMP agent`|ups.line.in.discovery<p>Update: 2h</p>|
|Informações da bateria|<p>-</p>|`SNMP agent`|ups.system.discovery<p>Update: 2h</p>|
|Informações de saída de fase|<p>-</p>|`SNMP agent`|ups.line.out.discovery<p>Update: 2h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fabricante|<p>-</p>|`SNMP agent`|upsIdentManufacturer<p>Update: 1m</p>|
|Nome|<p>-</p>|`SNMP agent`|upsIdentName<p>Update: 1m</p>|
|Modelo|<p>-</p>|`SNMP agent`|upsIdentModel<p>Update: 1m</p>|
|Versão do software do UPS|<p>-</p>|`SNMP agent`|upsIdentUPSSoftwareVersion<p>Update: 1m</p>|
|Corrente de entrada (A) - Fase $1|<p>-</p>|`SNMP agent`|upsInputCurrent.[{#EINDICE}]<p>Update: 1m</p><p>LLD</p>|
|Frequência de entrada (Hz) - Fase $1|<p>-</p>|`SNMP agent`|upsInputFrequency.[{#EINDICE}]<p>Update: 1h</p><p>LLD</p>|
|Potencia Real de entrada (W) - Fase $1|<p>-</p>|`SNMP agent`|upsInputTruePower.[{#EINDICE}]<p>Update: 1m</p><p>LLD</p>|
|Tensão de entrada (V) - Fase $1|<p>-</p>|`SNMP agent`|upsInputVoltage.[{#EINDICE}]<p>Update: 1m</p><p>LLD</p>|
|Corrente da Bateria (A) $1|<p>-</p>|`SNMP agent`|upsbatterycurrent.[{#INDICE}]<p>Update: 30m</p><p>LLD</p>|
|Estado da Bateria $1|<p>A indicação da capacidade restante na(s) baterias do sistema do UPS. Um valor de "bateria normal" indica que o tempo de execução restante é maior que "upsConfigLowBattTime". Um valor de "bateria baixa" indica que o tempo de execução restante da bateria seja menor que ou igual a "upsConfigLowBattTime". Um valor de "bateria esgotada" indica que o UPS não será capaz para sustentar a carga atual quando e a energia for perdida (incluindo a possibilidade de que a energia da rede elétrica esteja ausente e o UPS será incapaz de sustentar a saída).</p>|`SNMP agent`|upsBatteryStatus.[{#INDICE}]<p>Update: 30m</p><p>LLD</p>|
|Temperatura da Bateria (ºC) $1|<p>A temperatura ambiente em ou perto do invólucro da bateria do UPS.</p>|`SNMP agent`|upsBatteryTemperature.[{#INDICE}]<p>Update: 30m</p><p>LLD</p>|
|Tensão da Bateria (V) $1|<p>A magnitude da tensão atual da bateria.</p>|`SNMP agent`|upsBatteryVoltage.[{#INDICE}]<p>Update: 30m</p><p>LLD</p>|
|Tempo estimado de carga restante (%) $1|<p>Uma estimativa da carga restante da bateria expressa como uma porcentagem da carga total.</p>|`SNMP agent`|upsEstimatedChargeRemaining.[{#INDICE}]<p>Update: 30m</p><p>LLD</p>|
|Tempo estimado restante (Minutos) $1|<p>Uma estimativa de tempo para o esgotamento da carga da bateria sob as atuais condições de carga, se a energia da rede elétrica estiver desligada e permanecer desligada, ou se for perdida e permanecer desligada.</p>|`SNMP agent`|upsEstimatedMinutesRemaining.[{#INDICE}]<p>Update: 30m</p><p>LLD</p>|
|Tempo de uso da Bateria (Segundos) $1|<p>Se a unidade estiver funcionando na bateria, este contador mostra o tempo decorrido desde a última vez que o no-break mudou para energia da bateria, ou o tempo desde que o subsistema de gerenciamento de rede foi reiniciado. O valor mostrado é sempre o menor dentre os dois. Deve retornar zero se a unidade não estiver funcionando com bateria.</p>|`SNMP agent`|upsSecondsOnBattery.[{#INDICE}]<p>Update: 30m</p><p>LLD</p>|
|Corrente de saída (A) - Fase $1|<p>-</p>|`SNMP agent`|upsOutputCurrent.[{#SINDICE}]<p>Update: 1m</p><p>LLD</p>|
|Percentual de carga - Fase $1|<p>-</p>|`SNMP agent`|upsOutputPercentLoad.[{#SINDICE}]<p>Update: 30m</p><p>LLD</p>|
|Potência de saída (W) - Fase $1|<p>-</p>|`SNMP agent`|upsOutputPower.[{#SINDICE}]<p>Update: 1m</p><p>LLD</p>|
|Tensão de saída (V) - Fase $1|<p>-</p>|`SNMP agent`|upsOutputVoltage.[{#SINDICE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Bateria do Nobreak esgotada|<p>Este alerta indica que o atual estado da bateria, não será capaz de suportar a atual carga, caso a energia seja perdida.</p>|<p>**Expression**: last(/Module UPS/upsBatteryStatus.[{#INDICE}],#5)=4</p><p>**Recovery expression**: </p>|average|
|Temperatura da bateria está elevada em {$HOST.HOST}|<p>A temperatura da bateria está acima do nível operacional. Temperatura atual: {#ITEMVALUE}</p>|<p>**Expression**: last(/Module UPS/upsBatteryTemperature.[{#INDICE}],#5:now-1s)>38</p><p>**Recovery expression**: </p>|average|
|Bateria do Nobreak esgotada (LLD)|<p>Este alerta indica que o atual estado da bateria, não será capaz de suportar a atual carga, caso a energia seja perdida.</p>|<p>**Expression**: last(/Module UPS/upsBatteryStatus.[{#INDICE}],#5)=4</p><p>**Recovery expression**: </p>|average|
|Temperatura da bateria está elevada em {$HOST.HOST} (LLD)|<p>A temperatura da bateria está acima do nível operacional. Temperatura atual: {#ITEMVALUE}</p>|<p>**Expression**: last(/Module UPS/upsBatteryTemperature.[{#INDICE}],#5:now-1s)>38</p><p>**Recovery expression**: </p>|average|
