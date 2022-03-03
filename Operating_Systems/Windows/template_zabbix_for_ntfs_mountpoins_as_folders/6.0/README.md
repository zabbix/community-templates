# getWindowsMountPointsToFolders

## Description

Get Windows servers mount points to folders

## Overview


Template Discovery Windows Mountpoints on Folders
=================================================


The current Zabbix Agent does not support the functionality of discovering mounted fileSystems on folders for Windows OS


This is still opened a feature request <https://support.zabbix.com/browse/ZBXNEXT-1595>


Installation
------------


### Host Installation


<ul style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; padding-left: 2em; color: #24292e; font-family: -apple-system, system-ui, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple C

## Author

Douglas Lopez

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Volume Mountpoints filesystem discovery|<p>This Rule only Discover Disk at Mountpoints without Drive-Letters</p>|`Zabbix agent (active)`|vfs.fs.customfolders.windowsmountpoints.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Free disk space on $1|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[{#DISKNAME},free]<p>Update: 1h</p><p>LLD</p>|
|Free disk space on $1 (percentage)|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[{#DISKNAME},pfree]<p>Update: 1h</p><p>LLD</p>|
|Total disk space on $1|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[{#DISKNAME},total]<p>Update: 1h</p><p>LLD</p>|
|Used disk space on $1|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[{#DISKNAME},used]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Free disk space is less than 1% on volume {#DISKNAME} ({ITEM.LASTVALUE3} Free Space left)|<p>-</p>|<p>**Expression**: last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])<1 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])>10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},free])>1</p><p>**Recovery expression**: </p>|disaster|
|Free disk space is less than 5% on volume {#DISKNAME} ({ITEM.LASTVALUE3} Free Space left)|<p>-</p>|<p>**Expression**: last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])<5 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])>10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},free])>1</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 10% on volume {#DISKNAME} ({ITEM.LASTVALUE3} Free Space left)|<p>-</p>|<p>**Expression**: last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])<10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])>10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},free])>1</p><p>**Recovery expression**: </p>|warning|
|Free disk space is less than 20% on volume {#DISKNAME} ({ITEM.LASTVALUE3} Free Space left)|<p>-</p>|<p>**Expression**: last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])<20 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])>10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},free])>1</p><p>**Recovery expression**: </p>|information|
|Free disk space is less than 1% on volume {#DISKNAME} ({ITEM.LASTVALUE3} Free Space left) (LLD)|<p>-</p>|<p>**Expression**: last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])<1 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])>10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},free])>1</p><p>**Recovery expression**: </p>|disaster|
|Free disk space is less than 5% on volume {#DISKNAME} ({ITEM.LASTVALUE3} Free Space left) (LLD)|<p>-</p>|<p>**Expression**: last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])<5 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])>10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},free])>1</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 10% on volume {#DISKNAME} ({ITEM.LASTVALUE3} Free Space left) (LLD)|<p>-</p>|<p>**Expression**: last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])<10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])>10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},free])>1</p><p>**Recovery expression**: </p>|warning|
|Free disk space is less than 20% on volume {#DISKNAME} ({ITEM.LASTVALUE3} Free Space left) (LLD)|<p>-</p>|<p>**Expression**: last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])<20 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},pfree])>10 and last(/getWindowsMountPointsToFolders/vfs.fs.size[{#DISKNAME},free])>1</p><p>**Recovery expression**: </p>|information|
