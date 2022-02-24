# Gluster Storage

## Overview

 This project was created to monitor Gluster Storage with Zabbix. In this repository there are two files. One python script that calls [gstatus](https://github.com/gluster/gstatus), discovering gluster volumes and print data we want, according to the arguments given. You have to install gstatus [gstatus](https://github.com/gluster/gstatus)


You should save the script in any directory you want, in order to do it executable from zabbix user using sudo. You have to create a file in /etc/zabbix/zabbix\_server.conf.d/ and add UserParameters:


* You should save the script in any directory you want, do it executable from zabbix user using sudo.
* You have to create a file in /etc/zabbix/zabbix\_server.conf.d/ and add UserParameters: ... UserParameter=gluster\_volume\_info[*],sudo /path/gstatus\_discovery.py $1 $2 UserParameter=gluster\_storage\_info[*],sudo /path/gstatus\_discovery.py $1 UserParameter=gluster\_volume\_info,sudo /path/gstatus\_discovery.py
* The last one shoud be import zabbix\_template.xml in zabbix


You can check my [github repository](https://github.com/MrCirca/zabbix-glusterfs)



## Author

MrCirca

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Gluster Volume Names Discovery|<p>-</p>|`Zabbix agent`|gluster_volume_name.discovery<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Gluster Storage % Free Space|<p>-</p>|`Calculated`|gluster_storage_free_space<p>Update: 2m</p>|
|Gluster Storage Snapshots|<p>-</p>|`Zabbix agent`|gluster_storage_info["snapshot_count"]<p>Update: 2m</p>|
|Gluster Storage Volume Number|<p>-</p>|`Zabbix agent`|gluster_storage_info["volume_count"]<p>Update: 2m</p>|
|Gluster Storage Total Size|<p>-</p>|`Zabbix agent`|gluster_storage_info["usable_capacity"]<p>Update: 2m</p>|
|Gluster Storage Used Size|<p>-</p>|`Zabbix agent`|gluster_storage_info["used_capacity"]<p>Update: 2m</p>|
|Gluster Storage Nodes|<p>-</p>|`Zabbix agent`|gluster_storage_info["node_count"]<p>Update: 2m</p>|
|Gluster Storage Self Heal Enabled|<p>-</p>|`Zabbix agent`|gluster_storage_info["sh_enabled"]<p>Update: 2m</p>|
|Gluster Storage Self Heal Active|<p>-</p>|`Zabbix agent`|gluster_storage_info["sh_active"]<p>Update: 2m</p>|
|Gluster Storage status|<p>-</p>|`Zabbix agent`|gluster_storage_info["status"]<p>Update: 2m</p>|
|Gluster Storage raw capacity|<p>-</p>|`Zabbix agent`|gluster_storage_info["raw_capacity"]<p>Update: 2m</p>|
|Gluster Storage Active Nodes|<p>-</p>|`Zabbix agent`|gluster_storage_info["nodes_active"]<p>Update: 2m</p>|
|Gluster Volume % Free Space {#VOLUME_NAME}|<p>-</p>|`Calculated`|gluster_volume_free_space[{#VOLUME_NAME}]<p>Update: 30s</p><p>LLD</p>|
|Gluster Volume snapshot_count on {#VOLUME_NAME}|<p>-</p>|`Zabbix agent`|gluster_volume_info["snapshot_count",{#VOLUME_NAME}]<p>Update: 30s</p><p>LLD</p>|
|Gluster Volume state on {#VOLUME_NAME}|<p>-</p>|`Zabbix agent`|gluster_volume_info["state",{#VOLUME_NAME}]<p>Update: 30s</p><p>LLD</p>|
|Gluster Volume Total Size on {#VOLUME_NAME}|<p>-</p>|`Zabbix agent`|gluster_volume_info["usable_capacity",{#VOLUME_NAME}]<p>Update: 30s</p><p>LLD</p>|
|Gluster Volume Used Size on {#VOLUME_NAME}|<p>-</p>|`Zabbix agent`|gluster_volume_info["used_capacity",{#VOLUME_NAME}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Gluster Volume Free Space is less than 20%|<p>-</p>|<p>**Expression**: {Gluster Storage:gluster_volume_free_space[{#VOLUME_NAME}].last(,5m)}<20</p><p>**Recovery expression**: </p>|warning|
|Gluster Volume state in {#VOLUME_NAME} is down|<p>-</p>|<p>**Expression**: {Gluster Storage:gluster_volume_info["state",{#VOLUME_NAME}].str(up)}=0</p><p>**Recovery expression**: </p>|warning|
|Gluster Volume Free Space is less than 20% (LLD)|<p>-</p>|<p>**Expression**: {Gluster Storage:gluster_volume_free_space[{#VOLUME_NAME}].last(,5m)}<20</p><p>**Recovery expression**: </p>|warning|
|Gluster Volume state in {#VOLUME_NAME} is down (LLD)|<p>-</p>|<p>**Expression**: {Gluster Storage:gluster_volume_info["state",{#VOLUME_NAME}].str(up)}=0</p><p>**Recovery expression**: </p>|warning|
