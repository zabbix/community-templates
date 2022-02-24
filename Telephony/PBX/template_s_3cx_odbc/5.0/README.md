# s 3CX ODBC

## Overview

This tempalte is used in 3CX linux servers, it is necessary to create a postgresql ODBC connector to perform the collections and to change the {$ DSN3CX} macro to the name of the created connector.


 


To check the DB credentials, I checked the file "/var/lib/3cxpbx/Bin/3CXSystemService.exe.config"


and edit pg\_hba.conf to release remote connections.


 


Note: only release the IP of the zabbix proxy or server for security reasons.


 


Itens: 


- Discovery of trunks and extensions


- Calls today, 7 days and this month


 


Extensions:


- User Extension Last Register


- User Extension Status


- User First Name


- User Last Name 


- User Mail


 


Trunks:


- Gateway Host


- Gateway Max Calls


- Gateway Port


- Number of associated routes



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$DSN3CX}|<p>-</p>|`3CXDB`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery Gateways|<p>-</p>|`Database monitor`|db.odbc.discovery[discovery.gws,{$DSN3CX}]<p>Update: 1h</p>|
|Discovery Users|<p>-</p>|`Database monitor`|db.odbc.discovery[discovery.users,{$DSN3CX}]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of Calls Today|<p>-</p>|`Database monitor`|db.odbc.select[calls.total,{$DSN3CX}]<p>Update: 5m</p>|
|Number of Calls in this month|<p>-</p>|`Database monitor`|db.odbc.select[calls.month,{$DSN3CX}]<p>Update: 5m</p>|
|Number of Calls in the last 7 days|<p>-</p>|`Database monitor`|db.odbc.select[calls.7days,{$DSN3CX}]<p>Update: 5m</p>|
|Gateway Host|<p>-</p>|`Database monitor`|db.odbc.select[gw.host-{#IDGATEWAY},{$DSN3CX}]<p>Update: 1h</p><p>LLD</p>|
|Gateway Max Calls|<p>-</p>|`Database monitor`|db.odbc.select[gw.max-calls-{#IDGATEWAY},{$DSN3CX}]<p>Update: 1h</p><p>LLD</p>|
|Number of associated routes|<p>-</p>|`Database monitor`|db.odbc.select[gw.number-routes-{#IDGATEWAY},{$DSN3CX}]<p>Update: 1h</p><p>LLD</p>|
|Gateway Port|<p>-</p>|`Database monitor`|db.odbc.select[gw.port-{#IDGATEWAY},{$DSN3CX}]<p>Update: 1h</p><p>LLD</p>|
|User Last Name|<p>-</p>|`Database monitor`|db.odbc.select[ext.user.lastname-{#FKIDEXTENSION},{$DSN3CX}]<p>Update: 1h</p><p>LLD</p>|
|User First Name|<p>-</p>|`Database monitor`|db.odbc.select[ext.username-{#FKIDEXTENSION},{$DSN3CX}]<p>Update: 1h</p><p>LLD</p>|
|User Extension Last Register|<p>-</p>|`Database monitor`|db.odbc.select[user-last-resgister-{#FKIDEXTENSION},{$DSN3CX}]<p>Update: 1m</p><p>LLD</p>|
|User Extension Status|<p>-</p>|`Database monitor`|db.odbc.select[user-last-status-{#FKIDEXTENSION},{$DSN3CX}]<p>Update: 1m</p><p>LLD</p>|
|User Mail|<p>-</p>|`Database monitor`|db.odbc.select[user.mail-{#FKIDEXTENSION},{$DSN3CX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

