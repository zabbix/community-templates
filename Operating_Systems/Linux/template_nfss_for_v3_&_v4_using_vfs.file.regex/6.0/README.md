# Linux NFS v3 Client

## Overview

Templates for NFS V3 & V4 client statistics using vfs.file.regex



## Author

Len Rugen

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|NFSv3 mkdir operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){11}",,,,\1]<p>Update: 60</p>|
|NFSv3 commit operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){23}",,,,\1]<p>Update: 60</p>|
|NFSv3 getattr operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){3}",,,,\1]<p>Update: 60</p>|
|NFSv3 remove operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){14}",,,,\1]<p>Update: 60</p>|
|NFSv3 write operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){9}",,,,\1]<p>Update: 60</p>|
|NFSv3 rmdir operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){15}",,,,\1]<p>Update: 60</p>|
|NFSv3 setattr operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){4}",,,,\1]<p>Update: 60</p>|
|NFSv3 fsstat operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){20}",,,,\1]<p>Update: 60</p>|
|NFSv3 readdirplus operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){19}",,,,\1]<p>Update: 60</p>|
|NFSv3 create operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){10}",,,,\1]<p>Update: 60</p>|
|NFSv3 rename operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){16}",,,,\1]<p>Update: 60</p>|
|NFSv3 access operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){6}",,,,\1]<p>Update: 60</p>|
|NFSv3 read operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){8}",,,,\1]<p>Update: 60</p>|
|NFSv3 readdir operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){18}",,,,\1]<p>Update: 60</p>|
|NFSv3 lookup operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc3 (([0-9]*)?\s){5}",,,,\1]<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

# Linux NFS v4 Client

## Overview

Templates for NFS V3 & V4 client statistics using vfs.file.regex



## Author

Len Rugen

## Overview

Templates for NFS V3 & V4 client statistics using vfs.file.regex



## Author

Len Rugen

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|NFSv4 lookup operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){21}",,,,\1]<p>Update: 60</p>|
|NFSv4 commit operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){5}",,,,\1]<p>Update: 60</p>|
|NFSv4 renew operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){13}",,,,\1]<p>Update: 60</p>|
|NFSv4 remove operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){23}",,,,\1]<p>Update: 60</p>|
|NFSv4 create operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){27}",,,,\1]<p>Update: 60</p>|
|NFSv4 readdir operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){31}",,,,\1]<p>Update: 60</p>|
|NFSv4 locku operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){18}",,,,\1]<p>Update: 60</p>|
|NFSv4 close operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){10}",,,,\1]<p>Update: 60</p>|
|NFSv4 open operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){6}",,,,\1]<p>Update: 60</p>|
|NFSv4 lock operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){16}",,,,\1]<p>Update: 60</p>|
|NFSv4 write operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){4}",,,,\1]<p>Update: 60</p>|
|NFSv4 setattr operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){11}",,,,\1]<p>Update: 60</p>|
|NFSv4 getattr operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){20}",,,,\1]<p>Update: 60</p>|
|NFSv4 rel_lkowner operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){37}",,,,\1]<p>Update: 60</p>|
|NFSv4 access operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){19}",,,,\1]<p>Update: 60</p>|
|NFSv4 read operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){3}",,,,\1]<p>Update: 60</p>|
|NFSv4 statfs operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){29}",,,,\1]<p>Update: 60</p>|
|NFSv4 rename operations per minute|<p>-</p>|`Zabbix agent (active)`|vfs.file.regexp[/proc/net/rpc/nfs,"^proc4 (([0-9]*)?\s){24}",,,,\1]<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

