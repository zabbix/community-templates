# FGT-INTERFACES DISCOVERY

## Overview

Monitoramento de Appliance Fortigate homologado nos modelos "100D - 200B - 60C - 30D",  
(CPU(%), Interfaces (bit/s), Memoria(%), Nº. Serial, Uptime, Modelo, Uso em Disco).


Template pensado para ser usado em conjunto com o Grafana.



## Author

Leonardo Nascimento da Silva

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interfaces de Rede|<p>-</p>|`SNMP agent`|ifname<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Download $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 5</p><p>LLD</p>|
|Upload $1|<p>-</p>|`SNMP agent`|ifHCOutOctets[{#SNMPVALUE}]<p>Update: 5</p><p>LLD</p>|
|Velocidade do Link $1|<p>-</p>|`SNMP agent`|ifHighSpeed[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

