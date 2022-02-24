# SAP Availability Linux

## Overview

================ SAP-Process ================  
  
O presente documento tem por objetivo apresentar todas as etapas técnicas   
para implantação do monitoramento dos Processos SAP utilizando shell script   
e saphostctrl, e a função do Userparameter do agente Zabbix.  
  
Projeto idealizado por Wilson Fernandes.  
  
A ideia do projeto foi monitorar os processos SAP abaixo:  
  
- Compile Server  
- Daemon  
- Xsengine  
- Nameserver  
- Preprocessor  
- Webdispatcher



## Author

wilsonwers

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|sap.discovery|<p>-</p>|`Zabbix agent`|sap.availability[database]<p>Update: 60s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|[$2 - $3] [ HDB CompileServer ]|<p>-</p>|`Zabbix agent`|sap.availability[hdbcompileserver,{#COD_ID},{#NAME_ID}]<p>Update: 60s</p><p>LLD</p>|
|[$2 - $3] [ HDB Daemon ]|<p>-</p>|`Zabbix agent`|sap.availability[hdbdaemon,{#COD_ID},{#NAME_ID}]<p>Update: 60s</p><p>LLD</p>|
|[$2 - $3] [ HDB IndexServer ]|<p>-</p>|`Zabbix agent`|sap.availability[hdbindexserver,{#COD_ID},{#NAME_ID}]<p>Update: 60s</p><p>LLD</p>|
|[$2 - $3] [ HDB NameServer ]|<p>-</p>|`Zabbix agent`|sap.availability[hdbnameserver,{#COD_ID},{#NAME_ID}]<p>Update: 60s</p><p>LLD</p>|
|[$2 - $3] [ HDB PreProcessor ]|<p>-</p>|`Zabbix agent`|sap.availability[hdbpreprocessor,{#COD_ID},{#NAME_ID}]<p>Update: 60s</p><p>LLD</p>|
|[$2 - $3] [ HDB Webdispatcher ]|<p>-</p>|`Zabbix agent`|sap.availability[hdbwebdispatcher,{#COD_ID},{#NAME_ID}]<p>Update: 60s</p><p>LLD</p>|
|[$2 - $3] [ HDB Engine ]|<p>-</p>|`Zabbix agent`|sap.availability[hdbxsengine,{#COD_ID},{#NAME_ID}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOSTNAME} - Process CompileServer is not running|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbcompileserver,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process Daemon is not running|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbdaemon,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process Engine is not running|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbxsengine,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process IndexServer is not running|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbindexserver,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process NameServer is not running|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbnameserver,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process  PreProcessor is not running|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbpreprocessor,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process  Webdispatcher is not running|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbwebdispatcher,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process CompileServer is not running (LLD)|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbcompileserver,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process Daemon is not running (LLD)|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbdaemon,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process Engine is not running (LLD)|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbxsengine,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process IndexServer is not running (LLD)|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbindexserver,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process NameServer is not running (LLD)|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbnameserver,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process  PreProcessor is not running (LLD)|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbpreprocessor,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOSTNAME} - Process  Webdispatcher is not running (LLD)|<p>-</p>|<p>**Expression**: {SAP Availability Linux:sap.availability[hdbwebdispatcher,{#COD_ID},{#NAME_ID}].last(2m)}=0</p><p>**Recovery expression**: </p>|disaster|
