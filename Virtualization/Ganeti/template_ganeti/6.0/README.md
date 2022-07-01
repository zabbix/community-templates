# Ganeti by RAPI

## Description

This template use Ganeti RAPI for monitoring the status of the cluster, nodes and instances. Bundled with template some javascript automation for interact with Ganeti cluster from Zabbix frontend or Trigger actions.

## How to use

Templates:
1. Configure RAPI service on cluster following [Ganeti Docs](https://docs.ganeti.org/docs/ganeti/3.0/html/rapi.html) directives (If you what to use Zabbix Scripts you need write access RAPI permission).
2. Import `template_zabbix-ganeti.yaml` file template on Zabbix.
3. Create a Zabbix Host for Ganeti Master Node and assign `Ganeti` template configuring the required macros.

## Templates

|Name|Description|
|----|-----------|
|Ganeti|Template assigned to the master node. It monitor cluster status and create node and instances hosts using `Host prototype`|
|Ganeti Nodes|Template used for monitor Ganeti Node|
|Ganeti Instances|Template used for monitor Ganeti Instance|

## Ganeti: Macros

|Name|Description|Default|Required|Type|
|----|-------|--------|-----------|----|
|{$GANETI.MASTER}|Ganeti RAPI Master use IP or DNS name|<p>-</p>|`yes`|`Text`|
|{$GANETI.PASSWORD}|Ganeti RAPI Password|<p>-</p>|`yes`|`Vault secret`|
|{$GANETI.PORT}|Ganeti RAPI port|5080|`yes`|`Text`|
|{$GANETI.PROTOCOL}|Ganeti RAPI protocol http or https (default)|https|`yes`|`Text`|
|{$GANETI.USERNAME}|Ganeti RAPI Username|<p>-</p>|`yes`|`Text`|

## Ganeti: Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Discover Ganeti Groups|Discover Groups on cluster|`HTTP agent`|ganeti.info.cluster.group<p>Update: 1d</p>|
|Discover Ganeti Instances|Discover Instances on cluster|`HTTP agent`|ganeti.instances<p>Update: 1d</p>|
|Discover Ganeti Jobs|Discover Jobs on cluster|`HTTP agent`|ganeti.jobs<p>Update: 1h</p>|
|Discover Ganeti Nodes|Discover Nodes on cluster|`HTTP agent`|ganeti.nodes.discovery<p>Update: 1d</p>|

## Ganeti: Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Info Raw|<p>-</p>|`HTTP Agent`|ganeti.info<p>Update: 1d</p>|
|Cluster Config Version|<p>-</p>|`Dependent item`|ganeti.info.ganeti.version|
|Cluster Volume Group Name|<p>-</p>|`Dependent item`|ganeti.info.cluster.vg|
|Cluster Name|<p>-</p>|`Dependent item`|ganeti.info.cluster.name|
|Cluster Master|<p>-</p>|`Dependent item`|ganeti.info.cluster.master|
|Cluster Hypervisor|<p>-</p>|`Dependent item`|ganeti.info.cluster.hypervisor|
|Cluster Config Version|<p>-</p>|`Dependent item`|ganeti.info.cluster.configversion|
|{#NAME} Raw|<p>-</p>|`HTTP Agent`|ganeti.group[{#NAME}]<p>Update: 1d</p><p>LLD</p>|
|{#NAME} Nodes|<p>-</p>|`Dependent item`|ganeti.group.nodes[{#NAME}]<p>LLD</p>|
|Job {#ID} Raw|<p>-</p>|`HTTP Agent`|ganeti.jobs[{#ID}]<p>Update: 5m</p><p>LLD</p>|
|Job {#ID} Status|<p>-</p>|`Dependent item`|ganeti.jobs.status[{#ID}]<p>LLD</p>|
|Job {#ID} Summary|<p>-</p>|`Dependent item`|ganeti.jobs.summary[{#ID}]<p>LLD</p>|

## Ganeti: Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Ganeti Cluster Name Changed|<p>-</p>|<p>**Expression**: change(/Ganeti/ganeti.info.cluster.master)=1</p><p>**Recovery expression**: </p>|warning|
|Ganeti Config Version Changed|<p>-</p>|<p>**Expression**: change(/Ganeti/ganeti.info.cluster.configversion)=1</p><p>**Recovery expression**: </p>|warning|
|Ganeti Master Changed|<p>-</p>|<p>**Expression**: change(/Ganeti/ganeti.info.cluster.master)=1</p><p>**Recovery expression**: </p>|warning|
|Ganeti Version Changed|<p>-</p>|<p>**Expression**: change(/Ganeti/ganeti.info.ganeti.version)=1</p><p>**Recovery expression**: </p>|warning|
|Ganeti Volume Group Name Changed|<p>-</p>|<p>**Expression**: change(/Ganeti/ganeti.info.cluster.vg)=1</p><p>**Recovery expression**: </p>|warning|

## Ganeti Nodes: Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Info Raw|<p>-</p>|`HTTP agent`|ganeti.node<p>Update: 10m</p>|
|Disk Free|<p>-</p>|`Dependent item`|ganeti.node.disk.free|
|Disk Total|<p>-</p>|`Dependent item`|ganeti.node.disk.total|
|Disk Used|<p>-</p>|`Calculated`|ganeti.node.disk.used<p>Update: 10m</p>|
|Memory Free|<p>-</p>|`Dependent item`|ganeti.node.memory.free|
|Memory Total|<p>-</p>|`Dependent item`|ganeti.node.memory.total|
|Memory Used|<p>-</p>|`Calculated`|ganeti.node.memory.used<p>Update: 10m</p>|
|Memory Used %|<p>-</p>|`Calculated`|ganeti.node.memory.used.percentage<p>Update: 10m</p>|
|Offline|<p>-</p>|`Dependent item`|ganeti.node.offline|
|Primary Instances|<p>-</p>|`Dependent item`|ganeti.node.pinstances|
|Primary Instances Number|<p>-</p>|`Dependent item`|ganeti.node.pinstances.number|
|Role|<p>-</p>|`Dependent item`|ganeti.node.role|
|Secondary Instances|<p>-</p>|`Dependent item`|ganeti.node.sinstances|
|Secondary Instances Number|<p>-</p>|`Dependent item`|ganeti.node.sinstances.number|
|UUID|<p>-</p>|`Dependent item`|ganeti.node.uuid|
|VM Capable|<p>-</p>|`Dependent item`|ganeti.node.vm.capable|

## Ganeti nodes: Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Disk Usage reached 90%|<p>-</p>|<p>**Expression**: last(/Ganeti Nodes/ganeti.node.disk.used.percentage)>=90</p><p>**Recovery expression**: </p>|warning|
|Disk Usage reached 95%|<p>-</p>|<p>**Expression**: last(/Ganeti Nodes/ganeti.node.disk.used.percentage)>=95</p><p>**Recovery expression**: </p>|average|
|Memory Usage reached 90%|<p>-</p>|<p>**Expression**: last(/Ganeti Nodes/ganeti.node.memory.used.percentage)>=90</p><p>**Recovery expression**: </p>|warning|
|Memory Usage reached 95%|<p>-</p>|<p>**Expression**: last(/Ganeti Nodes/ganeti.node.memory.used.percentage)>=95</p><p>**Recovery expression**: </p>|average|
|Node is in Offline State|<p>-</p>|<p>**Expression**: last(/Ganeti Nodes/ganeti.node.offline)="true"</p><p>**Recovery expression**: </p>|high|
|Node Role Changed||<p>-</p>|<p>**Expression**: change(/Ganeti Nodes/ganeti.node.role)=1</p><p>**Recovery expression**: </p>|warning|


## Ganeti Instances: Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Info Raw|<p>-</p>|`HTTP agent`|ganeti.instance<p>Update: 10m</p>|
|VNC Console|<p>-</p>|`HTTP agent`|ganeti.instance.vnc<p>Update: 10m</p>|
|Disk Assigned|<p>-</p>|`Dependent item`|ganeti.instance.disk|
|Interfaces|<p>-</p>|`Dependent item`|ganeti.instance.interfaces|
|Memory Assigned|<p>-</p>|`Dependent item`|ganeti.instance.memory|
|OS|<p>-</p>|`Dependent item`|ganeti.instance.os|
|Primary Node|<p>-</p>|`Dependent item`|ganeti.instance.pnode|
|Secondary Node|<p>-</p>|`Dependent item`|ganeti.instance.snode|
|Status|<p>-</p>|`Dependent item`|ganeti.instance.status|
|Tags|<p>-</p>|`Dependent item`|ganeti.instance.tags|
|vCPU Assigned|<p>-</p>|`Dependent item`|ganeti.instance.vcpu|
|VNC Port|<p>-</p>|`Dependent item`|ganeti.instance.vnc.port|

## Ganeti Instances: Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Instance Down|<p>-</p>|<p>**Expression**: last(/Ganeti Instances/ganeti.instance.status)="down"<p>**Recovery expression**: </p>|average|
|Primary Node Changed|<p>-</p>|<p>**Expression**: change(/Ganeti Instances/ganeti.instance.pnode)=1<p>**Recovery expression**: </p>|information|

### Licenses

|Template|License|
|---|---|
|Ganeti|*GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README)|
|Ganeti Nodes|*GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README)
|Ganeti Instances|*GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README)|

All javascript on script folder are on *GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README)

## Author

Massimiliano Pasquini.