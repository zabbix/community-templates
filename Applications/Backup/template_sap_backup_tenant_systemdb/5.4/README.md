# SAP Backup

## Overview

================ SAP-Backup-TENANT-SYSTEMDB ================  
  
O presente documento tem por objetivo apresentar todas as etapas técnicas   
para implantação do monitoramento do Backup SAP utilizando shell script   
e hdbsql, e a função do Userparameter do agente Zabbix.  
  
Projeto idealizado na comunidade Zabbix Brasil no Telegram pelos usuários  
Wilson Fernandes e Eduardo Freitas.  
  
A ideia do projeto foi monitorar os backups executados pelo SAP.  
  
* Data da execucão do backup  
* Status do backup do SYSTEMDB  
* Status do backup do TENANT



## Author

wilsonwers

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$BCO}|<p>-</p>|`PRD`|Text macro|
|{$ID}|<p>-</p>|`00`|Text macro|
|{$PASS}|<p>-</p>|`passwd`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{$BCO} - LAST XSENGINE TENANT|<p>-</p>|`Zabbix agent`|check_backup[{$ID},{$PASS},{$BCO},backup_last,xsengine]<p>Update: 21600s</p>|
|{$BCO} - STATUS NAMESERVER SYSTEMDB|<p>-</p>|`Zabbix agent`|check_backup[{$ID},{$PASS},{$BCO},backup,nameserver]<p>Update: 3600s</p>|
|{$BCO} - STATUS INDEXSERVER TENANT|<p>-</p>|`Zabbix agent`|check_backup[{$ID},{$PASS},{$BCO},backup,indexserver]<p>Update: 3600s</p>|
|{$BCO} - LAST INDEXSERVER TENANT|<p>-</p>|`Zabbix agent`|check_backup[{$ID},{$PASS},{$BCO},backup_last,indexserver]<p>Update: 21600s</p>|
|{$BCO} - STATUS XSENGINE TENANT|<p>-</p>|`Zabbix agent`|check_backup[{$ID},{$PASS},{$BCO},backup,xsengine]<p>Update: 3600s</p>|
|{$BCO} - LAST NAMESERVER SYSTEMDB|<p>-</p>|`Zabbix agent`|check_backup[{$ID},{$PASS},{$BCO},backup_last,nameserver]<p>Update: 21600s</p>|


## Triggers

There are no triggers in this template.

