# HSC Discovery DHCP scopes - HSC

## Overview

Este template foi elaborado para o monitoramento de escopos dhcp de servidores Microsoft Windows em PT-BR.


 


Nele existe um gatilho para o envio de alertas para escopos com menos de 15 ips livres.



## Author

William Normandia

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DHCP scopes|<p>-</p>|`SNMP agent`|dhcp.scope<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|parDhcpTotalNoOfRequests|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.311.1.3.1.3<p>Update: 60</p>|
|parDhcpTotalNoOfDeclines|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.311.1.3.1.8<p>Update: 60</p>|
|parDhcpTotalNoOfDiscovers|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.311.1.3.1.2<p>Update: 60</p>|
|Status Serviço DHCP|<p>0 - em execução, 1 - pausado, 2 - iniciação pendente, 3 - pausa pendente, 4 - retorno pendente, 5 - finalização pendente, 6 - finalizado, 7 - desconhecido, 255 - serviço desconhecido</p>|`Zabbix agent`|service.info[DHCPServer]<p>Update: 60</p>|
|parDhcpTotalNoOfOffers|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.311.1.3.1.5<p>Update: 60</p>|
|parDhcpTotalNoOfAcks|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.311.1.3.1.6<p>Update: 60</p>|
|parDhcpTotalNoOfNacks|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.311.1.3.1.7<p>Update: 60</p>|
|parDhcpTotalNoOfReleases|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.311.1.3.1.4<p>Update: 60</p>|
|Number of addresses that are free on scope {#IPSCOPE}|<p>-</p>|`SNMP agent`|ipfree[{#IPSCOPE}]<p>Update: 60</p><p>LLD</p>|
|Number of addresses that are use on scope {#IPSCOPE}|<p>-</p>|`SNMP agent`|ipuse[{#IPSCOPE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|The number of addresses that are free on scope {#IPSCOPE} is low = {ITEM.VALUE}.|<p>If the number of free adresses is less than 5, the trigger will be activated.</p>|<p>**Expression**: {HSC Discovery DHCP scopes - HSC:ipfree[{#IPSCOPE}].last()}<15</p><p>**Recovery expression**: </p>|high|
|The number of addresses that are free on scope {#IPSCOPE} is low = {ITEM.VALUE}. (LLD)|<p>If the number of free adresses is less than 5, the trigger will be activated.</p>|<p>**Expression**: {HSC Discovery DHCP scopes - HSC:ipfree[{#IPSCOPE}].last()}<15</p><p>**Recovery expression**: </p>|high|
