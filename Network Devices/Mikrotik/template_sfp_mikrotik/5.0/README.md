# SFP Mikrotik

## Overview

Template para monitoramento de interfaces SFP de equipamentos Mikrotik


 


Monitora:


 - Tx


 - RX


 - Temperatura


 


Triggers:


 - Variação de sinal de tx/x


 - Alarme de temperatura


 


Link GitHub:


<https://github.com/anderson-raber/sfp_mikrotik/blob/master/README.md>



## Author

anderson raber

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Signal SFP Mikrotik|<p>-</p>|`SNMP agent`|signal.sfp<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|RX $1|<p>-</p>|`SNMP agent`|RX[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Temperatura $1|<p>-</p>|`SNMP agent`|temperatura[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|TX $1|<p>-</p>|`SNMP agent`|TX[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Alarme Temperatura - atenção|<p>-</p>|<p>**Expression**: {SFP Mikrotik:temperatura[{#SNMPVALUE}].last()}>50</p><p>**Recovery expression**: </p>|warning|
|Alarme Temperatura - Critico|<p>-</p>|<p>**Expression**: {SFP Mikrotik:temperatura[{#SNMPVALUE}].last()}>=55</p><p>**Recovery expression**: </p>|high|
|SFP Signal Change|<p>-</p>|<p>**Expression**: {SFP Mikrotik:RX[{#SNMPVALUE}].change()}>-2 or {SFP Mikrotik:TX[{#SNMPVALUE}].change()}>-2</p><p>**Recovery expression**: </p>|average|
|Alarme Temperatura - atenção (LLD)|<p>-</p>|<p>**Expression**: {SFP Mikrotik:temperatura[{#SNMPVALUE}].last()}>50</p><p>**Recovery expression**: </p>|warning|
|Alarme Temperatura - Critico (LLD)|<p>-</p>|<p>**Expression**: {SFP Mikrotik:temperatura[{#SNMPVALUE}].last()}>=55</p><p>**Recovery expression**: </p>|high|
|SFP Signal Change (LLD)|<p>-</p>|<p>**Expression**: {SFP Mikrotik:RX[{#SNMPVALUE}].change()}>-2 or {SFP Mikrotik:TX[{#SNMPVALUE}].change()}>-2</p><p>**Recovery expression**: </p>|average|
