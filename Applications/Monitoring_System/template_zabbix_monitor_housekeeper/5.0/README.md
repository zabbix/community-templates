# Housekeeping Metrics

## Description

Language: English Autor: Bernardo Lankheet Blog: www.bernardolankheet.com.br Repositorio: https://github.com/bernardolankheet/Zabbix-Monitor-Housekeeper

## Overview

Project Name: Zabbix-Monitor-Housekeeper
Author: Bernardo Lankheet
Telegram: [@bernardolankheet](https://t.me/bernardolankheet)
Description BR: Coleta de métricas sobre a execução do Housekeeper. *Não se aplica em ambientes que utiliza particionamento de tabelas ou outras rotinas para manutenção do banco de dados.*
Description EN: Collect Metrics on Housekeeper Execution. *It does not apply in environments that use table partitioning or other routines for maintaining the bank.*
OBS EN: Based on projet Diego Cavalcante [ZAKEEP.zabbix.housekeeper.monitor](https://github.com/suportecavalcante/zabbix.templates/tree/master/linux/ZAKEEP.zabbix.housekeeper.monitor)
OBS BR: Ideia retirada do projeto do Diego Cavalcante [ZAKEEP.zabbix.housekeeper.monitor](https://github.com/suportecavalcante/zabbix.templates/tree/master/linux/ZAKEEP.zabbix.housekeeper.monitor) 
 
#### **## Usage**


EN: Import your Template into Zabbix, link to the Host "Zabbix server" and wait for the items to be collected, collection is carried out according to the housekeeping schedule. Image 03 


BR: Importe seu Template para o Zabbix, vincula o template ao Host "Zabbix server" e aguarde os itens serem coletados, a coleta é realizada conforme a programação do housekeeping. Imagem 03 


#### **## How it works?**


EN: Whenever housekeeping is performed by zabbix-server, a line is generated containing the information deleted from zabbix\_server.log. The item Syslog Housekeeping, of the log type, captures the information via active checking and the other dependent items are pre-filled according to parent item information. 


BR: Sempre que a manutenção é realizada pelo zabbix-server, uma linha é gerada contendo as informações excluídas do zabbix\_server.log. O item Syslog Housekeeping, do tipo log, captura as informações por meio de verificação ativa e os demais itens dependentes são pré-preenchidos de acordo com as informações do item pai. 


#### **## Macros**


* {$ PATHLOG} - /var/log/zabbix/zabbix\_server.log - Path to zabbix\_server.log\
* {$ REGEXLOG} -. * Deleted. * [0-9] + hist \ /trends.* - Regex to capture the line for housekepping inside the log


#### **## Homolog**


* Zabbix 4.4
* Zabbix 5.0.6


#### **## Templates**


* Template Housekeeping Metrics-EN-US - English version (on github)
* Template Housekeeping Metricas - PT-BR (no github)


## Author

Bernardo Lankheet

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PATHLOG}|<p>Path Log zabbix_server.log</p>|`/var/log/zabbix/zabbix_server.log`|Text macro|
|{$REGEXLOG}|<p>Regex Housekeeping line</p>|`.*deleted.*[0-9]+ hist\/trends.*`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Records deleted in Alarms|<p>-</p>|`Dependent item`|dep.housekeeper.alarms<p>Update: 0</p>|
|Syslog Housekeeping|<p>-</p>|`Zabbix agent (active)`|log[{$PATHLOG},"{$REGEXLOG}",,,skip,,]<p>Update: 1s</p>|
|Records deleted in Audit|<p>-</p>|`Dependent item`|dep.housekeeper.audit<p>Update: 0</p>|
|Records deleted in Sessions|<p>-</p>|`Dependent item`|dep.housekeeper.sessions<p>Update: 0</p>|
|Records deleted in Events|<p>-</p>|`Dependent item`|dep.housekeeper.events<p>Update: 0</p>|
|Records deleted in Hist/Trends|<p>-</p>|`Dependent item`|dep.housekeeper.histtrends<p>Update: 0</p>|
|Records deleted in Items-Triggers|<p>-</p>|`Dependent item`|dep.housekeeper.itemstriggers<p>Update: 0</p>|
|Duration of the last executed Housekeeper|<p>-</p>|`Dependent item`|dep.housekeeper.duration<p>Update: 0</p>|
|Records deleted in Problems|<p>-</p>|`Dependent item`|dep.housekeeper.problems<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

