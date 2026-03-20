# Fortigate 100D

## Overview

Customized Template based on the original made by Leonardo Nascimento da Silva. Added LLD for Hostname, CPU, Memory and Serial Number.


Also added HA Status and basic SNMP info (Contact, Name, Uptime).


Tested with Fortigate 100D on Zabbix 3.4.6


BTW, I had to create some Value Mappings as follows:


Fortigate HA Auto Sync


1 > Disabled


2 > Enabled


 


Fortigate HA Status


1 > Standalone


2 > Active/Active


3 > Active/Passive


 


 


######################################


 


Template customizado baseado no original do Leonardo Nascimento da Silva. Adicionei LLD's para o Hostname, CPU, Memória e Número de Série das unidades (quando estiverem em HA).


Também adicionei o status do HA e informações básicas do SNMP (Nome, Uptime, Contato)


 


Testei com o Fortigate 100D no Zabbix 3.4.6 


 


Inclusive, eu tive que criar alguns mapeamentos de valores:


Fortigate HA Auto Sync


1 > Desativado


2 > Ativado


 


Fortigate HA Status


1 > Sem HA


2 > Ativo/Ativo


3 > Ativo/Passivo


 


 


Cheers!


Luiz Fernando Gondin Santos



## Author

Luiz Fernando Gondin Santos

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces|<p>-</p>|`SNMP agent`|ifname<p>Update: 300</p>|
|Unit Hostname|<p>-</p>|`SNMP agent`|fgStatsHostName<p>Update: 300</p>|
|Memory Usage|<p>-</p>|`SNMP agent`|fgStatsMemUsage<p>Update: 300</p>|
|CPU Usage|<p>-</p>|`SNMP agent`|fgStatsCpuUsage<p>Update: 300</p>|
|Serial Number|<p>-</p>|`SNMP agent`|fgStatsSerial<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|HA Auto Sync|<p>-</p>|`SNMP agent`|fgHaAutoSync<p>Update: 30s</p>|
|HA Mode|<p>-</p>|`SNMP agent`|fgHaSystemMode<p>Update: 30s</p>|
|System Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 30s</p>|
|System Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 30s</p>|
|System Contact|<p>-</p>|`SNMP agent`|sysContact<p>Update: 30s</p>|
|Upload $1|<p>-</p>|`SNMP agent`|ifHCOutOctets[{#SNMPVALUE}]<p>Update: 5</p><p>LLD</p>|
|Speed $1|<p>-</p>|`SNMP agent`|ifHighSpeed[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Download $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 5</p><p>LLD</p>|
|Unit $1 Hostname|<p>-</p>|`SNMP agent`|fgStatsHostName.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Memory Usage $1|<p>-</p>|`SNMP agent`|fgStatsMemUsage.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU $1 Usage|<p>-</p>|`SNMP agent`|fgStatsCpuUsage.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Unit $1 Serial Number|<p>-</p>|`SNMP agent`|fgStatsSerial.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CPU {#SNMPINDEX} Load is High|<p>-</p>|<p>**Expression**: last(/Fortigate 100D/fgStatsCpuUsage.[{#SNMPINDEX}])>80</p><p>**Recovery expression**: </p>|average|
|Memory {#SNMPINDEX} use is High|<p>-</p>|<p>**Expression**: last(/Fortigate 100D/fgStatsMemUsage.[{#SNMPINDEX}])>80</p><p>**Recovery expression**: </p>|average|
|Memory {#SNMPINDEX} use is High (LLD)|<p>-</p>|<p>**Expression**: last(/Fortigate 100D/fgStatsMemUsage.[{#SNMPINDEX}])>80</p><p>**Recovery expression**: </p>|average|
|CPU {#SNMPINDEX} Load is High (LLD)|<p>-</p>|<p>**Expression**: last(/Fortigate 100D/fgStatsCpuUsage.[{#SNMPINDEX}])>80</p><p>**Recovery expression**: </p>|average|
