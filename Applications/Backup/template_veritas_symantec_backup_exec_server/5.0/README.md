# Backup Exec Server

## Description

Veritas/Simantec Backup Exec Server template All checks executes with T-SQL, so you must configure Zabbix to use FreeTDS for MS SQL Server. Backup Jobs ODBC LLD rules: - Backup Exec Windows Service - Backup Exec Jobs (FULL) - Backup Exec Jobs (INCREMENTAL) Two rules needs for creating triggers with different severity levels for Full job types and Incremental job types. Macroses {$BE.USER} and {$BE.PASSWORD} must be set on template or host level before usage. These are username and password to connect to BEDB database. LLD returns {#JOB.TYPE} macros, containig 'FULL' or 'INCR' string to determine backup job type. On database level it's: 16777216 - INCR 16973824 - FULL Documentation will be available soon on my GitHub page (https://github.com/asand3r).

## Overview

**Veritas/Symantec Backup Exec Server template**


All checks executes with T-SQL, so you must configure Zabbix to use FreeTDS for MS SQL Server.  
Backup Jobs LLD rules:  
- Backup Exec Windows Service  
- Backup Exec Jobs Discovery  
  
Macroses {$BE.USER} and {$BE.PASSWORD} **must** be set on template or host level before usage. These are username and password to connect to BEDB database.  
  
LLD returns {#JOB.TYPE} macros, containig 'full' or 'incr' string to determine backup job type.  
On database level it's:  
16777216, 20971520 - incr  
16973824 - full  
  




## Author

Khatsayuk Alexander

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$BE.PASSWORD}|<p>-</p>|`PASSWORD`|Text macro|
|{$BE.USER}|<p>-</p>|`LOGIN`|Text macro|
|{$HISTORY}|<p>-</p>|`14d`|Text macro|
|{$TRENDS}|<p>-</p>|`180d`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Backup Exec Jobs Discovery (FULL)|<p>Discover Full Backup Exec jobs by SQL query.</p>|`Database monitor`|db.odbc.discovery[be.jobs.full,{HOST.HOST}]<p>Update: 1h</p>|
|Backup Exec Services|<p>Discovery Backup Exec Services.</p>|`Zabbix agent (active)`|service.discovery<p>Update: 3h</p>|
|Backup Exec Jobs Discovery (INCREMENTAL)|<p>Discover Incremental Backup Exec jobs by SQL query.</p>|`Database monitor`|db.odbc.discovery[be.jobs.incr,{HOST.HOST}]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#JOB.NAME}: Final Job Status|<p>{#JOB.NAME} final job status</p>|`Database monitor`|db.odbc.select[be.job.full.{#JOB.NAME}.finaljobstatus,{HOST.HOST}]<p>Update: 15m</p><p>LLD</p>|
|{#JOB.NAME}: Total Data Size, bytes|<p>{#JOB.NAME} total bytes</p>|`Database monitor`|db.odbc.select[be.job.full.{#JOB.NAME}.totalbytes,{HOST.HOST}]<p>Update: 15m</p><p>LLD</p>|
|Service {#SERVICE.NAME} status|<p>{#SERVICE.NAME} status Display name: {#SERVICE.DISPLAYNAME} Description: {#SERVICE.DESCRIPTION}</p>|`Zabbix agent (active)`|service.info[{#SERVICE.NAME}]<p>Update: 1m</p><p>LLD</p>|
|{#JOB.NAME}: Final Job Status|<p>{#JOB.NAME} final job status</p>|`Database monitor`|db.odbc.select[be.job.incr.{#JOB.NAME}.finaljobstatus,{HOST.HOST}]<p>Update: 15m</p><p>LLD</p>|
|{#JOB.NAME}: Total Data Size, bytes|<p>{#JOB.NAME} total bytes</p>|`Database monitor`|db.odbc.select[be.job.incr.{#JOB.NAME}.totalbytes,{HOST.HOST}]<p>Update: 15m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Backup job {#JOB.NAME}: {ITEM.VALUE}|<p>Backup job {#JOB.NAME} finished with error: {ITEM.LASTVALUE}.</p>|<p>**Expression**: {Backup Exec Server:db.odbc.select[be.job.full.{#JOB.NAME}.finaljobstatus,Backup Exec Server].count(#2,19,ne)}<>0</p><p>**Recovery expression**: </p>|average|
|Backup job {#JOB.NAME}: {ITEM.VALUE}|<p>Backup job {#JOB.NAME} finished with error: {ITEM.LASTVALUE}.</p>|<p>**Expression**: {Backup Exec Server:db.odbc.select[be.job.incr.{#JOB.NAME}.finaljobstatus,Backup Exec Server].count(#2,19,ne)}<>0</p><p>**Recovery expression**: </p>|warning|
|Service {#SERVICE.NAME} in {ITEM.VALUE} state|<p>Service {#SERVICE.NAME} ({#SERVICE.DISPLAYNAME}) not in 'Running' state</p>|<p>**Expression**: {Backup Exec Server:service.info[{#SERVICE.NAME}].count(#5,0,ne)}>3</p><p>**Recovery expression**: </p>|warning|
|Backup job {#JOB.NAME}: {ITEM.VALUE} (LLD)|<p>Backup job {#JOB.NAME} finished with error: {ITEM.LASTVALUE}.</p>|<p>**Expression**: {Backup Exec Server:db.odbc.select[be.job.full.{#JOB.NAME}.finaljobstatus,Backup Exec Server].count(#2,19,ne)}<>0</p><p>**Recovery expression**: </p>|average|
|Service {#SERVICE.NAME} in {ITEM.VALUE} state (LLD)|<p>Service {#SERVICE.NAME} ({#SERVICE.DISPLAYNAME}) not in 'Running' state</p>|<p>**Expression**: {Backup Exec Server:service.info[{#SERVICE.NAME}].count(#5,0,ne)}>3</p><p>**Recovery expression**: </p>|warning|
|Backup job {#JOB.NAME}: {ITEM.VALUE} (LLD)|<p>Backup job {#JOB.NAME} finished with error: {ITEM.LASTVALUE}.</p>|<p>**Expression**: {Backup Exec Server:db.odbc.select[be.job.incr.{#JOB.NAME}.finaljobstatus,Backup Exec Server].count(#2,19,ne)}<>0</p><p>**Recovery expression**: </p>|warning|
