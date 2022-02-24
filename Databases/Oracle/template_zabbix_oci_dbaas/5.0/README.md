# OCI_Dbaas

## Overview

This is a template to monitor OCI Dbaas with Zabbix.


If you want to monitor Dbaas, OCI Monitoring function is not enough (or there is not Dbaas metrics?)


So, It is Necessary to use other monitoring tools.


This Zabbix template has been verified to run on zabbix3 or 4series.


 


■ Source


<https://github.com/y-araki-git/zabbix-oci-dbaas>


 


■ The link is described below for the setting procedure.


・Setup


 <https://qiita.com/y-araki-qiita/items/f25e02182c7f279c0199>


・How to add monitoring


 <https://qiita.com/y-araki-qiita/items/0ec80adbb022458cab20>


 


■ Structure of download file


zabbix-oci-dbaas


├deploy\_zabbix-oci-dbaas.sh (Dbaas monitoring setup script executed on zabbix agent)


├README.md


├template\_oci\_dbaas.xml (Template to import in zabbix console)


└zabbix-oci-dbaas (Stores files placed under / etc / zabbix / scripts / agentd / zabbix-oci-dbaas /)


 ├zabbix\_agentd.conf (Setting of UserParameter)


 ├zabbix-oci-dbaas.conf.org (User description for OracleDB monitoring)


 ├zabbix-oci-dbaas.oraenv.org (Environment variable settings)


 ├zabbix-oci-dbaas.sh (Monitor acquisition script)


 └sql(Store sql to get monitored items)


  ├xxx.sql


  …


 



## Author

yu araki

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|[Oracle] Tablespaces|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas.discovery[{$ORACLE_SID},tb_list,1,ORACLE_TBS]<p>Update: 86400</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|[Oracle] Response Time Per Txn|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_metric,'Response Time Per Txn']<p>Update: 60</p>|
|[Oracle] Invalid objects|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_invalid,1]<p>Update: 3600</p>|
|[Oracle] Redo Logs count|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_redo,1]<p>Update: 600</p>|
|[Oracle] Flash Recovery Area percentage used|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_fra,1]<p>Update: 600</p>|
|[Oracle] ASM Data Area percentage used|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_asmdata,1]<p>Update: 600</p>|
|[Oracle] ASM Recovery Area percentage used|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_asmreco,1]<p>Update: 600</p>|
|[Oracle] Database uptime|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_uptime,1]<p>Update: 600</p>|
|[Oracle] Sessions blocks|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_block,1]<p>Update: 60</p>|
|[Oracle] Database size|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_size,1]<p>Update: 86400</p>|
|[Oracle] Database is active and open|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_active,1]<p>Update: 3600</p>|
|[Oracle] Database version|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_version,1]<p>Update: 86400</p>|
|[Oracle] RMAN problems counter|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_rman,1]<p>Update: 86400</p>|
|[Oracle] Locks count|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_lock,1]<p>Update: 60</p>|
|[Oracle] Connections available|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},db_connection,1]<p>Update: 300</p>|
|[Oracle] Tablespace $3 percentage used|<p>-</p>|`Zabbix agent`|zabbix-oci-dbaas[{$ORACLE_SID},tb_size,{#ORACLE_TBS}]<p>Update: 600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|[{$ORACLE_SID}] Tablespace: High used space on {#ORACLE_TBS}|<p>-</p>|<p>**Expression**: {OCI_Dbaas:zabbix-oci-dbaas[{$ORACLE_SID},tb_size,{#ORACLE_TBS}].last()}>95</p><p>**Recovery expression**: </p>|high|
|[{$ORACLE_SID}] Tablespace: Warning used space on {#ORACLE_TBS}|<p>-</p>|<p>**Expression**: {OCI_Dbaas:zabbix-oci-dbaas[{$ORACLE_SID},tb_size,{#ORACLE_TBS}].last()}>90 and {OCI_Dbaas:zabbix-oci-dbaas[{$ORACLE_SID},tb_size,{#ORACLE_TBS}].last()}<95</p><p>**Recovery expression**: </p>|warning|
|[{$ORACLE_SID}] Tablespace: High used space on {#ORACLE_TBS} (LLD)|<p>-</p>|<p>**Expression**: {OCI_Dbaas:zabbix-oci-dbaas[{$ORACLE_SID},tb_size,{#ORACLE_TBS}].last()}>95</p><p>**Recovery expression**: </p>|high|
|[{$ORACLE_SID}] Tablespace: Warning used space on {#ORACLE_TBS} (LLD)|<p>-</p>|<p>**Expression**: {OCI_Dbaas:zabbix-oci-dbaas[{$ORACLE_SID},tb_size,{#ORACLE_TBS}].last()}>90 and {OCI_Dbaas:zabbix-oci-dbaas[{$ORACLE_SID},tb_size,{#ORACLE_TBS}].last()}<95</p><p>**Recovery expression**: </p>|warning|
