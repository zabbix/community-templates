# SAMSUNG

## Overview

Desenvolvido por Thomas Lage 


E-Mail: lage.thomas@gmail.com


Telegram: @lagethomasm


 


 


Template para impressoras SAMSUNG,montado com as principais configurações que são necessárias para o uso na empresa em que trabalho, testado e montado com base nos modelos:


 


SL-M4025ND


SL-M4075FR


CARACTERISTICAS:


 


Informação do setor (se cadastrado na impressora)


Modelo


Número de série


Endereço IP


Endereço MAC


Nível do toner (números)


Nível do toner (%) - Trigger notifica com 5% de toner


Nível do fotocondutor (Números) - Trigger Notifica com 5% de fotocondutor


Total de impressões


Entre outros...


Como sou novo com Zabbix, esse é meu primeiro template, resolvi compartilhar e contribuir com a comunidade.



## Author

Thomas Henrique Lage

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Endereço MAC|<p>-</p>|`SNMP agent`|sysMac<p>Update: 1s</p>|
|Domínio|<p>-</p>|`SNMP agent`|sysDominio<p>Update: 30s</p>|
|Modelo|<p>-</p>|`SNMP agent`|hrDeviceDescr.1<p>Update: 120m</p>|
|Nível toner Black (%)|<p>-</p>|`SNMP agent`|tonerBk<p>Update: 15m</p>|
|Localização|<p>-</p>|`SNMP agent`|sysLocation.0<p>Update: 30s</p>|
|Nível do fotocondutor|<p>-</p>|`SNMP agent`|sams.clr.black.img<p>Update: 1s</p>|
|Bandeja 1 - Capacidade de folhas|<p>-</p>|`SNMP agent`|folhasQnt<p>Update: 30s</p>|
|Bandeja 2 - Capacidade de folhas|<p>-</p>|`SNMP agent`|folhasQnt2<p>Update: 30s</p>|
|Conectividade|<p>-</p>|`Simple check`|icmpping<p>Update: 30s</p>|
|Nível toner Black|<p>-</p>|`SNMP agent`|sams.clr.black.perc<p>Update: 1s</p>|
|Status|<p>-</p>|`SNMP agent`|sysStatus<p>Update: 30s</p>|
|Número de série|<p>-</p>|`SNMP agent`|sysSn<p>Update: 1s</p>|
|Tipo de papel|<p>-</p>|`SNMP agent`|tipoPapel<p>Update: 30s</p>|
|Endereço IP|<p>-</p>|`SNMP agent`|ipAdEntAddr<p>Update: 1s</p>|
|Tempo ligada|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 1s</p>|
|Total de impressões|<p>-</p>|`SNMP agent`|sams.clr.counter<p>Update: 1s</p>|


## Triggers

There are no triggers in this template.

