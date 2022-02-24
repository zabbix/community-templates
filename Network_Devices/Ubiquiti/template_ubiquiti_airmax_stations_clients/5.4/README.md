# Ubiquiti AirMax AP Clientes by Dzset

## Overview

Template monitora as estações conectadas no AP Ubiquiti (testado somente na linha M5)


Métricas:


* Capacidade Airmax
* CCQ
* Distancia AP
* MAC
* Prioridade Airmax
* Qualidade Airmax
* RX Rate
* Sinal
* Uptime
* Tx Rate


## Author

Luís Henrique Nascimento

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Airmax Discovery|<p>-</p>|`SNMP agent`|ubntStaEntry<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Capacidade do Airmax|<p>-</p>|`SNMP agent`|ubntStaAmc.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Prioridade do Airmax|<p>-</p>|`SNMP agent`|ubntStaAmp.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Qualidade do Airmax|<p>-</p>|`SNMP agent`|ubntStaAmq.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|CCQ|<p>-</p>|`SNMP agent`|ubntStaCcq.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Tempo de Conexão|<p>-</p>|`SNMP agent`|ubntStaConnTime.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Distância do AP|<p>-</p>|`SNMP agent`|ubntStaDistance.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|MAC|<p>-</p>|`SNMP agent`|ubntStaMac.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Rx Rate|<p>-</p>|`SNMP agent`|ubntStaRxRate.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Sinal|<p>-</p>|`SNMP agent`|ubntStaSignal.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Tx Rate|<p>-</p>|`SNMP agent`|ubntStaTxRate.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

