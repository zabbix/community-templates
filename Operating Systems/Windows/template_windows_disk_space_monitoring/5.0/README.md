# OS Windows Disk Space

## Description

includes used disk space Trigger goes below a certain level. the Default is 2GB but is configurable through macro.

## Overview

**Features**
------------


 


a modified version of the disk space monitoring part of the official Operating System Windows template.


instead of using a percentage based trigger for disk space monitoring this template use a configurable fixed disk space to trigger on.


modify the macro in the template to change the default or modify the macro on a host to have it use different values.


 


 


 



## Author

Stefan Sonneveld

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$DISK_UTIL_CRIT}|<p>-</p>|`200M`|Text macro|
|{$DISK_UTIL_WARN}|<p>-</p>|`2G`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Mounted filesystem discovery|<p>Discovery of file systems of different types as defined in global regular expression "File systems for discovery".</p>|`Zabbix agent`|vfs.fs.discovery<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Free disk space on {#FSNAME}|<p>-</p>|`Zabbix agent`|vfs.fs.size[{#FSNAME},free]<p>Update: 60</p><p>LLD</p>|
|Free disk space on {#FSNAME} (percentage)|<p>-</p>|`Zabbix agent`|vfs.fs.size[{#FSNAME},pfree]<p>Update: 60</p><p>LLD</p>|
|Total disk space on {#FSNAME}|<p>-</p>|`Zabbix agent`|vfs.fs.size[{#FSNAME},total]<p>Update: 3600</p><p>LLD</p>|
|Used disk space on {#FSNAME}|<p>-</p>|`Zabbix agent`|vfs.fs.size[{#FSNAME},used]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Free disk space on {HOST.NAME} is less than {$DISK_UTIL_CRIT} on volume {#FSNAME}|<p>-</p>|<p>**Expression**: {OS Windows Disk Space:vfs.fs.size[{#FSNAME},free].last(0)}<200M</p><p>**Recovery expression**: </p>|average|
|Free disk space on {HOST.NAME} is less than {$DISK_UTIL_WARN} on volume {#FSNAME}|<p>-</p>|<p>**Expression**: {OS Windows Disk Space:vfs.fs.size[{#FSNAME},free].last(0)}<2G</p><p>**Recovery expression**: </p>|warning|
|Free disk space on {HOST.NAME} is less than {$DISK_UTIL_CRIT} on volume {#FSNAME} (LLD)|<p>-</p>|<p>**Expression**: {OS Windows Disk Space:vfs.fs.size[{#FSNAME},free].last(0)}<200M</p><p>**Recovery expression**: </p>|average|
|Free disk space on {HOST.NAME} is less than {$DISK_UTIL_WARN} on volume {#FSNAME} (LLD)|<p>-</p>|<p>**Expression**: {OS Windows Disk Space:vfs.fs.size[{#FSNAME},free].last(0)}<2G</p><p>**Recovery expression**: </p>|warning|
