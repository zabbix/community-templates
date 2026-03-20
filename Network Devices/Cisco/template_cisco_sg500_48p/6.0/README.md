# SG500X_48P

## Overview

Prezados,


 Este template e para switch cisco SG500 , caso queira acrescentar mais informações fiquem a vontade , apos este , por gentileza inserir novamente no share do zabbix.


# Este template Monitora:


1- Cooler (FAN), 2- Disponibilidade , 3- Latencia , 4- Pacotes de entrada , 5- Pacotes de Saida , 6- Temperatura , 7- Trafego de entrada , 8- Trafego de saida


 Att:


 Magno Monte Cerqueira


<p style="margin: 0px 0px 1.5em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-size: 12px; line-height: 1.5em; color: #1f2c33; font-family: arial, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-

## Author

Magno Monte Cerqueira "magnopeem"

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Tráfego de saída Tengigabitethernet 1/1/1|<p>-</p>|`SNMP agent`|ifOutOctets.107<p>Update: 60</p>|
|Ping|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|
|Fan 01|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109250<p>Update: 600</p>|
|Estado operacional GigabitEthernet 1/1/1|<p>-</p>|`SNMP agent`|ifOperStatus.49<p>Update: 60</p>|
|Fan 04|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109253<p>Update: 600</p>|
|Tráfego de entrada GigabitEthernet 1/1/1|<p>-</p>|`SNMP agent`|ifInOctets.49<p>Update: 60</p>|
|Pacotes de saída com erro GigabitEthernet 1/1/1|<p>-</p>|`SNMP agent`|ifOutErrors.49<p>Update: 60</p>|
|Velocidade Porta Tengigabitethernet 1/1/1 MTU|<p>-</p>|`SNMP agent`|ifMtu.107<p>Update: 60</p>|
|Tráfego de entrada Tengigabitethernet 1/1/1|<p>-</p>|`SNMP agent`|ifInOctets.107<p>Update: 60</p>|
|CPU|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.9.9.109.1.1.1.1.5<p>Update: 120</p>|
|Fan 03|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109252<p>Update: 600</p>|
|Fan 05|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109254<p>Update: 600</p>|
|Tempo Ligado|<p>-</p>|`SNMP agent`|system.uptime<p>Update: 60</p>|
|Fan 02|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109251<p>Update: 600</p>|
|Fan 06|<p>-</p>|`SNMP agent`|rlEnvMonFanState.67109255<p>Update: 600</p>|
|Ping por Segundo|<p>-</p>|`Simple check`|icmppingsec<p>Update: 30</p>|
|Pacotes de saída com erro Tengigabitethernet 1/1/1|<p>-</p>|`SNMP agent`|ifOutErrors.107<p>Update: 60</p>|
|Pacotes de entrada com erro GigabitEthernet 1/1/1|<p>-</p>|`SNMP agent`|ifInErrors.49<p>Update: 60</p>|
|Velocidade da Porta  GigabitEthernet 1/1/1|<p>-</p>|`SNMP agent`|ifSpeed.49<p>Update: 60</p>|
|Velocidade da Porta Tengigabitethernet 1/1/1|<p>-</p>|`SNMP agent`|ifSpeed.107<p>Update: 60</p>|
|Tráfego de saída GigabitEthernet 1/1/1|<p>-</p>|`SNMP agent`|ifOutOctets.49<p>Update: 60</p>|
|Velocidade Porta GigabitEthernet 1/1/1 MTU|<p>-</p>|`SNMP agent`|ifMtu.49<p>Update: 60</p>|
|Temperatura|<p>-</p>|`SNMP agent`|entPhySensorValue.68420481<p>Update: 120</p>|
|Pacotes de entrada com erro Tengigabitethernet 1/1/1|<p>-</p>|`SNMP agent`|ifInErrors.107<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

