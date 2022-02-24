# UPS HDS

## Overview

Coleta via SNMPv2


Retorna as informações:


Nome do Dispositivo


Local do Dispositivo


Uptime


Status da Bateria


Status da saída de energia


Voltagem da Bateria


Temperatura em °C


Frequência da energia de entrada


Voltagem de entrada


Capacidade da bateria


Carga da Bateria


 


Cria o mapeamento de valor:


1° UPS Battery Satus


1 ⇒ unknown  
2 ⇒ batteryNormal  
3 ⇒ batteryLow


 


2° Status saída bateria UPS


1 ⇒ unknown  
2 ⇒ onLine  
3 ⇒ onBattery  
4 ⇒ onBoost  
5 ⇒ sleeping  
6 ⇒ onBypass  
<span style="color: #1f2c33; fon



## Author

Carlos Eduardo

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Capacidade da Bateria|<p>A capacidade restante da bateria expressa em percentagem da capacidade total</p>|`SNMP agent`|upsSmartBatteryCapacity<p>Update: 120</p>|
|Temperatura UPS|<p>-</p>|`SNMP agent`|upsSmartBatteryTemperature.0<p>Update: 900</p>|
|Device Location|<p>Informa a filial do nobreak.</p>|`SNMP agent`|sysLocation<p>Update: 86400</p>|
|Voltagem Bateria|<p>Informa a voltagem da Bateria</p>|`SNMP agent`|upsBatteryVoltage.0<p>Update: 1800</p>|
|Frequência da Energia de Entrada|<p>Informa o valor da frequência da enerfica Input</p>|`SNMP agent`|upsInputFrequency.1<p>Update: 120</p>|
|Carga da UPS|<p>A carga atual do UPS expressa em porcentagem da capacidade nominal.</p>|`SNMP agent`|upsSmartOutputLoad.0<p>Update: 1500</p>|
|Name Device|<p>Informa nome do Dispositivo</p>|`SNMP agent`|sysName<p>Update: 86400</p>|
|Status bateria|<p>Informa o status da Bateria. { unknown ( 1 ) , batteryNormal ( 2 ) , batteryLow ( 3 ) }</p>|`SNMP agent`|upsBaseBatteryStatus.0<p>Update: 120</p>|
|Status saída nobreak|<p>Informa o status atual da UPS</p>|`SNMP agent`|upsBaseOutputStatus.0<p>Update: 900</p>|
|Voltagem Entrada de Energia|<p>-</p>|`SNMP agent`|upsInputVoltage.1<p>Update: 120</p>|
|Uptime|<p>Informa à quanto tempo está on-line</p>|`SNMP agent`|sysUpTime<p>Update: 600</p>|


## Triggers

There are no triggers in this template.

