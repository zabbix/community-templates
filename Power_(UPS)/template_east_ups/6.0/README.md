# East Nobreak

## Overview

Monitors power parameters like voltage and frequency, battery charge and status, battery temperature, etc. Has triggers for out of range parameters,.


Please set macro for host. 




| Macro |
| --- |


{$SNMP\_COMMUNITY} ⇒ nobreak01



## Author

Wellington Martins

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`nobreak01`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Corrente da Bateria|<p>-</p>|`SNMP agent`|batteryCurrent<p>Update: 180</p>|
|Tempo Restante de Carga|<p>-</p>|`SNMP agent`|BatTimeRemaining<p>Update: 180</p>|
|Frequência de Saída|<p>-</p>|`SNMP agent`|upsOutputFrequency<p>Update: 15</p>|
|Restante de Carga|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 15</p>|
|Tensão de Entrada|<p>-</p>|`SNMP agent`|ac-Voltage<p>Update: 180</p>|
|Carga da Bateria|<p>-</p>|`SNMP agent`|BatCapacity<p>Update: 15</p>|
|Carga de Uso do Nobreak|<p>-</p>|`SNMP agent`|load-current<p>Update: 180</p>|
|Estado da Bateria|<p>Trigger 1 Desconhecido 2 Bateria Normal 3 Bateria Baixa 4 Depreciada</p>|`SNMP agent`|upsBatteryStatus<p>Update: 180</p>|
|Frequência de Entrada|<p>-</p>|`SNMP agent`|upsInputFrequency<p>Update: 15</p>|
|Tensão de Saída|<p>-</p>|`SNMP agent`|load-Power<p>Update: 180</p>|
|Temperatura da Bateria|<p>-</p>|`SNMP agent`|temp<p>Update: 180</p>|


## Triggers

There are no triggers in this template.

