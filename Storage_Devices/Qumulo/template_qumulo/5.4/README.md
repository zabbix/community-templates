# Qumulo

## Overview

Tested on Qumulo version 4.1.3

Use qq binary, that can be downloaded from qumulo web ui

## Installation
* Get qq binary from your qumulo interface (Apis & Tools menu)
* Put qq on /etc/zabbix/scripts/qq (or adapt next conf file)
* Put zabbix_qumulo.conf on zabbix agent2.d folder, in order to include the userparameter, and change the user/pass on the first line ( UserParameter=qumulo.login,/etc/zabbix/scripts/qq --host qumulo_host login -u zabbix -p zabbix_pwd
)
* Import the template on zabbix.
* Change the 2 macro to the read value of your cluster (10% of usable capacity, and 20% )
* Force the item "Qumulo login" to execute "now" in order the zabbix user have the good "cookies" on the qumulo cluster and in order to have all other check "OK".

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$QUMULO.10PCENT}|<p>Should be put to 10% of total size of cluster</p>|`21T`|Text macro|
|{$QUMULO.20PCENT}|<p>Should be put to 20% of total size of cluster</p>|`42T`|Text macro|

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disks List|<p>-</p>|`Zabbix agent`|qumulo.cluster_slots|
|Node List|<p>-</p>|`Zabbix agent`|qumulo.nodes_list|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disk {#QDISK_ID} serial|<p>-</p>|`Dependent item`|qumulo.cluster_slots[{#QDISK_ID},serial]<p>LLD</p>|
|Disk {#QDISK_ID} state|<p>-</p>|`Dependent item`|qumulo.cluster_slots[{#QDISK_ID},state]<p>LLD</p>|
|{#QNODE_NAME} serial|<p>-</p>|`Dependent item`|qumulo.nodes_list[{#QNODE_ID},serial]<p>LLD</p>|
|{#QNODE_NAME} status|<p>-</p>|`Dependent item`|qumulo.nodes_list[{#QNODE_ID},status]<p>LLD</p>|
|Qumulo date |<p>-</p>|`Zabbix agent`|qumulo.time_status|
|Qumulo restriper time|<p>-</p>|`Zabbix agent`|qumulo.restriper_status[time_remain]|
|Qumulo cluster slots|<p>-</p>|`Zabbix agent`|qumulo.cluster_slots[]|
|Qumulo nodes |<p>-</p>|`Zabbix agent`|qumulo.nodes_list[]|
|Qumulo restriper |<p>-</p>|`Zabbix agent`|qumulo.restriper_status[status]|
|qumulo.free.forecast.24 |<p>-</p>|`Calculated`|qumulo.free.forecast.24|
|qumulo.free.last.1 |<p>-</p>|`Calculated`|qumulo.free.last.1|
|Qumulo free space|<p>-</p>|`Zabbix agent`|qumulo.fs_get_stats[free]|
|Qumulo total space|<p>-</p>|`Zabbix agent`|qumulo.fs_get_stats[total]|
|qumulo.node_chassis_status_get|<p>-</p>|`Zabbix agent`|qumulo.node_chassis_status_get|
|Qumulo login |<p>-</p>|`Zabbix agent`|qumulo.time_status|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Qumulo free space < 10%|<p>-</p>|<p>**Expression**: last(/Template App QUMULO/qumulo.fs_get_stats[free])<(last(/Template App QUMULO/qumulo.fs_get_stats[total])*0.1)</p><p>**Recovery expression**: </p>|Disaster|
|Qumulo free space < 10% in next 24h|<p>-</p>|<p>**Expression**: timeleft(/Template App QUMULO/qumulo.fs_get_stats[free],12h,{$QUMULO.10PCENT})<24h</p><p>**Recovery expression**: </p>|high|
|Qumulo free space < 20% in next 48h|<p>-</p>|<p>**Expression**: timeleft(/Template App QUMULO/qumulo.fs_get_stats[free],24h,{$QUMULO.20PCENT})<48h</p><p>**Recovery expression**: </p>|Average|
|Qumulo time shift > 5s|<p>-</p>|<p>**Expression**: fuzzytime(/Template App QUMULO/qumulo.time_status,5s)=0</p><p>**Recovery expression**: </p>|Average|
|Restriper is COMPACT|<p>-</p>|<p>**Expression**: last(/Template App QUMULO/qumulo.restriper_status[status])="COMPACT"</p><p>**Recovery expression**: </p>|Information|
|Restriper is REBALANCE|<p>-</p>|<p>**Expression**: last(/Template App QUMULO/qumulo.restriper_status[status])="REBALANCE")</p><p>**Recovery expression**: </p>|Information|
|Very long rebalance running ( > 8h )|<p>-</p>|<p>**Expression**: last(/Template App QUMULO/qumulo.restriper_status[time_remain])>28800</p><p>**Recovery expression**: </p>|Information|



