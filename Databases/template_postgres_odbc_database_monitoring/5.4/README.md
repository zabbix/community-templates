# Postgres ODBC

## Overview

I have been looking for templates to use with the new ODBC database monitoring item type with out success. 


I have created a rudimentary one for postgres. To use it follow these instructions for setting up ODBC on the server side.


https://www.zabbix.com/documentation/4.0/manual/config/items/itemtypes/odbc\_checks


We run multiple instances on each server so I create a host for each database and use the {HOST.NAME} macro in the item key. If you want to use a different macro like {$DATABASE.NAME} then do a find and replace before you import this. As well all items have the name zabbix set as the user and the password set as " my\_password". Again you may want to do a find and replace before importing.


Then import this template and add it to the host you are using and then go through and double check the items.


I know this functionality was in Zabbix 3 so this may work there but I created this in 4 so that is all I know it works with. I hope some one finds this useful.


 


 


 


 



## Author

J Villain

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|xactrollback|<p>-</p>|`Database monitor`|db.odbc.select[xactrollback,{HOST.NAME}]<p>Update: 60s</p>|
|pmbcexclusivelock|<p>-</p>|`Database monitor`|db.odbc.select[pmbcexclusivelock,{HOST.NAME}]<p>Update: 60s</p>|
|sharerowexclusivelock|<p>-</p>|`Database monitor`|db.odbc.select[sharerowexclusivelock,{HOST.NAME}]<p>Update: 60s</p>|
|shareupdateexclusivelock|<p>-</p>|`Database monitor`|db.odbc.select[shareupdateexclusivelock,{HOST.NAME}]<p>Update: 60s</p>|
|checkpoints_req|<p>-</p>|`Database monitor`|db.odbc.select[checkpoints_req,{HOST.NAME}]<p>Update: 60s</p>|
|xactcommit|<p>-</p>|`Database monitor`|db.odbc.select[xactcommit,{HOST.NAME}]<p>Update: 60s</p>|
|tupdeleted|<p>-</p>|`Database monitor`|db.odbc.select[tupdeleted,{HOST.NAME}]<p>Update: 60s</p>|
|buffers_clean|<p>-</p>|`Database monitor`|db.odbc.select[buffers_clean,{HOST.NAME}]<p>Update: 60s</p>|
|rowexclusivelock|<p>-</p>|`Database monitor`|db.odbc.select[rowexclusivelock,{HOST.NAME}]<p>Update: 60s</p>|
|accessexclusivelock|<p>-</p>|`Database monitor`|db.odbc.select[accessexclusivelock,{HOST.NAME}]<p>Update: 60s</p>|
|tupinserted|<p>-</p>|`Database monitor`|db.odbc.select[tupinserted,{HOST.NAME}]<p>Update: 60s</p>|
|tupupdated|<p>-</p>|`Database monitor`|db.odbc.select[tupupdated,{HOST.NAME}]<p>Update: 60s</p>|
|maxwritten_clean|<p>-</p>|`Database monitor`|db.odbc.select[maxwritten_clean,{HOST.NAME}]<p>Update: 60s</p>|
|exclusivelock|<p>-</p>|`Database monitor`|db.odbc.select[exclusivelock,{HOST.NAME}]<p>Update: 60s</p>|
|one|<p>-</p>|`Database monitor`|db.odbc.select[one,{HOST.NAME}]<p>Update: 60s</p>|
|activeconn|<p>-</p>|`Database monitor`|db.odbc.select[activeconn,{HOST.NAME}]<p>Update: 60s</p>|
|buffers_backend|<p>-</p>|`Database monitor`|db.odbc.select[buffers_backend,{HOST.NAME}]<p>Update: 60s</p>|
|accesssharelock|<p>-</p>|`Database monitor`|db.odbc.select[accesssharelock,{HOST.NAME}]<p>Update: 60s</p>|
|checkpoints_timed|<p>-</p>|`Database monitor`|db.odbc.select[checkpoints_timed,{HOST.NAME}]<p>Update: 60s</p>|
|buffers_alloc|<p>-</p>|`Database monitor`|db.odbc.select[buffers_alloc,{HOST.NAME}]<p>Update: 60s</p>|
|buffers_checkpoint|<p>-</p>|`Database monitor`|db.odbc.select[buffers_checkpoint,{HOST.NAME}]<p>Update: 60s</p>|
|rowsharelock|<p>-</p>|`Database monitor`|db.odbc.select[rowsharelock,{HOST.NAME}]<p>Update: 60s</p>|
|tupfetched|<p>-</p>|`Database monitor`|db.odbc.select[tupfetched,{HOST.NAME}]<p>Update: 60s</p>|
|tupreturned|<p>-</p>|`Database monitor`|db.odbc.select[tupreturned,{HOST.NAME}]<p>Update: 60s</p>|


## Triggers

There are no triggers in this template.

