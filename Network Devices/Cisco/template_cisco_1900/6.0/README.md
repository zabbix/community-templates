# Cisco_1900

## Overview

Prezados,


 


Este template e para roteador cisco 1900 , caso queira acrescentar mais informações fiquem a vontade , apos este , por gentileza inserir novamente no share do zabbix.


# Este template Monitora:


1- Disponibilidade , 2- Latencia , 3- Pacotes de entrada , 4- Pacotes de Saida , 5- Trafego de entrada , 6- Trafego de saida 7- Velocidade da Porta 8- Velocidade em MTU


 Att:


<p style="margin: 0px 0px 1.5em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-size: 12px; line-height: 1.5em; color: #1f2c33; font-family: arial, sans-serif; background-image: initial; background-attachment: initial; background-size: initial; background-origin: i

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
|Tempo Ligado|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/0|<p>-</p>|`SNMP agent`|ifSpeed.1<p>Update: 30</p>|
|Tráfego de Entrada GigabitEthernet 0/1|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 60</p>|
|Tráfego de Entrada GigabitEthernet 0/0|<p>-</p>|`SNMP agent`|ifInOctets.1<p>Update: 60</p>|
|Tráfego de Saida GigabitEthernet 0/0|<p>-</p>|`SNMP agent`|ifOutOctets.1<p>Update: 60</p>|
|Latencia|<p>-</p>|`Simple check`|icmppingsec<p>Update: 60</p>|
|Velocidade Porta GigaEthernet 0/1 MTU|<p>-</p>|`SNMP agent`|ifMtu.2<p>Update: 30</p>|
|Velocidade Porta GigaEthernet 0/0 MTU|<p>-</p>|`SNMP agent`|ifMtu.1<p>Update: 30</p>|
|Velocidade Porta GigaEthernet 0/1|<p>-</p>|`SNMP agent`|ifSpeed.2<p>Update: 30</p>|
|Tráfego de Saida GigabitEthernet 0/1|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 60</p>|
|Disponibilidade|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

