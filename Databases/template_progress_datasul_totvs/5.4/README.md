# Banco Progress Datasul

## Description

Monitoramento Banco Progress Datasul

## Overview

Basic template with itens and triggers monitoring default Totvs Datasul ports using Zabbix Agent on the host (Windows or Linux).


Tested on Zabbix 3.4.6


 


#####################


 


Template básico para montoramento do banco Progress para o Datasul da Totvs (Portas Padrões) utilizando o Agent do Zabbix (Windows ou Linux).


Testado no Zabbix 3.4.6


 


Cheers!


 


Luiz Fernando Gondin Santos



## Author

Luiz Fernando Gondin Santos

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DB EMSFND|<p>-</p>|`Zabbix agent`|net.tcp.port[,23620]<p>Update: 10s</p>|
|DB SRCADGER|<p>-</p>|`Zabbix agent`|net.tcp.port[,23608]<p>Update: 10s</p>|
|DB EMS2ADT|<p>-</p>|`Zabbix agent`|net.tcp.port[,23600]<p>Update: 10s</p>|
|DB EMS2CAD|<p>-</p>|`Zabbix agent`|net.tcp.port[,23612]<p>Update: 10s</p>|
|DB EMSDEV|<p>-</p>|`Zabbix agent`|net.tcp.port[,23618]<p>Update: 10s</p>|
|DB NEOGRID|<p>-</p>|`Zabbix agent`|net.tcp.port[,23603]<p>Update: 10s</p>|
|DB MDTFRW|<p>-</p>|`Zabbix agent`|net.tcp.port[,23624]<p>Update: 10s</p>|
|DB EMS5MOV|<p>-</p>|`Zabbix agent`|net.tcp.port[,23606]<p>Update: 10s</p>|
|DB MGESP|<p>-</p>|`Zabbix agent`|net.tcp.port[,23700]<p>Update: 10s</p>|
|DB EMS5CAD|<p>-</p>|`Zabbix agent`|net.tcp.port[,23605]<p>Update: 10s</p>|
|DB SRMOVFIN|<p>-</p>|`Zabbix agent`|net.tcp.port[,23609]<p>Update: 10s</p>|
|DB EMSINC|<p>-</p>|`Zabbix agent`|net.tcp.port[,23604]<p>Update: 10s</p>|
|DB MOV2DIS|<p>-</p>|`Zabbix agent`|net.tcp.port[,23640]<p>Update: 10s</p>|
|DB HCM|<p>-</p>|`Zabbix agent`|net.tcp.port[,23607]<p>Update: 10s</p>|
|DB MDMERGE|<p>-</p>|`Zabbix agent`|net.tcp.port[,23626]<p>Update: 10s</p>|
|DB EAI|<p>-</p>|`Zabbix agent`|net.tcp.port[,23622]<p>Update: 10s</p>|
|DB FINANCE|<p>-</p>|`Zabbix agent`|net.tcp.port[,23614]<p>Update: 10s</p>|
|DB EMS2MP|<p>-</p>|`Zabbix agent`|net.tcp.port[,23602]<p>Update: 10s</p>|
|DB PAYROLL|<p>-</p>|`Zabbix agent`|net.tcp.port[,23616]<p>Update: 10s</p>|
|DB EMS2SOR|<p>-</p>|`Zabbix agent`|net.tcp.port[,23610]<p>Update: 10s</p>|
|DB MDTCRM|<p>-</p>|`Zabbix agent`|net.tcp.port[,23628]<p>Update: 10s</p>|
|DB EMS2MOV|<p>-</p>|`Zabbix agent`|net.tcp.port[,23601]<p>Update: 10s</p>|


## Triggers

There are no triggers in this template.

