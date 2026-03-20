# Mikrotik RouterOS

## Description

Ros Modelo dedicado (dispositivo RB) Este modelo é usado apenas para o monitoramento do sistema de roteamento RouterOS.。 By:[Suspeito]

## Overview

MONITORAMENTO MIKROTIK 


 


 


 


Temperatura da CPU


Temperatura do equipamento


Tempo de Atividade


Monitirando Comsumo Clientes PPoE


Monitirando Quantidade de Clientes PPoE


Monitora todos os comnumo das portas


Monitirando CPUs 


Monitora Ping


 


 


 


Contatos: whatsapp 81 982670619


 


E-Mail: rsg.sp.gov@gmail.com



## Author

Renato

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Descubra interfaces de rede|<p>Expressão regular 2-3 dígitos ^ d{2,3}$</p>|`SNMP agent`|net.if.discovery<p>Update: 30s</p>|
|Verificar automaticamente a conta de discagem VPN|<p>-</p>|`SNMP agent`|net.if.discoveryppp<p>Update: 30s</p>|
|Verificar automaticamente a CPU|<p>-</p>|`SNMP agent`|system.discoverycpu<p>Update: 3s</p>|
|Descubra a interface NIC local|<p>NICs de expressão regular 1-10 ^ ([1,2,3,4,5,6,7,8,9] | 10) $</p>|`SNMP agent`|discoverylocal<p>Update: 30s</p>|
|Descubra automaticamente estatísticas de tráfego da NIC local|<p>-</p>|`SNMP agent`|net.if.discoveryStatisticslocal<p>Update: 30s</p>|
|Descubra as estatísticas de tráfego da interface|<p>-</p>|`SNMP agent`|net.if.discoveryStatistics<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Temperatura da CPU|<p>-</p>|`SNMP agent`|mikrotik.cpu.temperature<p>Update: 30s</p>|
|Tamanho da memória|<p>-</p>|`SNMP agent`|vm.memory.total[hrStorageSize.Memory]<p>Update: 15s</p>|
|Temperatura do equipamento|<p>-</p>|`SNMP agent`|mikrotik.device.temperature<p>Update: 30s</p>|
|Latencia|<p>-</p>|`Simple check`|icmppingsec<p>Update: 60</p>|
|Uso da CPU (total)|<p>Dica: Por favor, preencha de acordo com o número principal do seu dispositivo! Copie o código da fórmula。 A referência é a seguinte： 2 fórmulas principais (last(cpucore[ifnum1])+last(cpucore[ifnum2]))/2 3 fórmulas principais (last(cpucore[ifnum1])+last(cpucore[ifnum2])+last(cpucore[ifnum3]))/3 4 fórmulas principais (last(cpucore[ifnum1])+last(cpucore[ifnum2])+last(cpucore[ifnum3])+last(cpucore[ifnum4]))/4</p>|`Calculated`|cpucore[ifnum]<p>Update: 30s</p>|
|Atividade Ping|<p>-</p>|`Simple check`|icmpping<p>Update: 60</p>|
|Memória usada|<p>-</p>|`SNMP agent`|vm.memory.used[hrStorageUsed.Memory]<p>Update: 15s</p>|
|Perda de Pacote|<p>-</p>|`Simple check`|icmppingloss<p>Update: 60</p>|
|Clientes Conectado|<p>-</p>|`SNMP agent`|PPPoE<p>Update: 1m</p>|
|Tempo de execução|<p>-</p>|`SNMP agent`|mikrotik.uptime<p>Update: 30s</p>|
|Uso de memória|<p>-</p>|`Calculated`|vm.memory.pused[memoryUsedPercentage.Memory]<p>Update: 30s</p>|
|Memória livre|<p>-</p>|`Calculated`|vm.memory.free[hrStoragefree.Memory]<p>Update: 30s</p>|
|{#IFNAME}Recepção de tráfego|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 1s</p><p>LLD</p>|
|{#IFNAME}Envio de tráfego|<p>-</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 1s</p><p>LLD</p>|
|{#IFNAME}Recepção de tráfego|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctetsppp.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#IFNAME}Envio de tráfego|<p>-</p>|`SNMP agent`|net.if.out[ifHCOutOctetsppp.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU{#SNMPINDEX}Use|<p>-</p>|`SNMP agent`|cpucore[ifnum{#SNMPINDEX}]<p>Update: 15s</p><p>LLD</p>|
|{#IFNAME}Recepção de tráfego da placa de rede|<p>-</p>|`SNMP agent`|net.if.in[localin.{#SNMPINDEX}]<p>Update: 1s</p><p>LLD</p>|
|{#IFNAME}Envio de tráfego NIC|<p>-</p>|`SNMP agent`|net.if.out[localout.{#SNMPINDEX}]<p>Update: 1s</p><p>LLD</p>|
|{#IFNAME}Obter a quantidade total de placas de rede locais recebidas|<p>-</p>|`SNMP agent`|net.if[localinterface.in.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#IFNAME}Obter o valor total enviado pela placa de rede local|<p>-</p>|`SNMP agent`|net.if[localinterface.out{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#IFNAME}Recebendo aquisição total|<p>-</p>|`SNMP agent`|net.if[interface.in.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#IFNAME}Obter o valor total|<p>-</p>|`SNMP agent`|net.if[interface.out.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

