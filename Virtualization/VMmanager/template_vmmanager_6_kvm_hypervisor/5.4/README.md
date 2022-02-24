# App VMmanager 6 KVM Hypervisor

## Overview

Version 2021-12-16

Template for monitoring  VMmanager 6 KVM host 

1. Template uses zabbix-agent2

2. Create /etc/sudoers.d/zabbix with
Defaults:zabbix !requiretty
Cmnd_Alias ZABBIX_CMD = /usr/bin/virsh -q list, /usr/bin/virsh -q list --all
zabbix ALL = (root) NOPASSWD: ZABBIX_CMD

3. Create /etc/zabbix/zabbix_agent2.d/vmmanager.conf with
UserParameter=vm.all,sudo virsh -q list --all | wc -l
UserParameter=vm.running,sudo virsh -q list | wc -l


## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$VM6_TOKEN}|<p>Get it by POST request `curl -v  -X POST -H  "accept: application/json" -H  "Content-Type: application/json" -d '{"email": "__ADMIN__EMAIL__", "password": "__PASSWORD__"}' "https://__VM_DOMAIN__/auth/v4/public/token"`</p>|`token`|Text macro|
|{$VM6_URL}|<p>Please fill your domain</p>|`https://__VM_DOMAIN__/vm/v3`|Text macro|
|{$TASK_MAX_RUNNING}|<p>Max running time for tasks in minutes</p>|30|Text macro|
|{$TASK_MAX_WAITING}|<p>Max waiting time for tasks in minutes</p>|5|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VMmanager Services|<p>Watch for essential VMmanager 6 services on cluster node</p>|`Zabbix agent`|systemd.unit.discovery<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VM All Count|<p>Count of All VM on host</p>|`Zabbix agent`|vm.all<p>Update: 10m</p>|
|VM Running Count|<p>Count of Running VM on host</p>|`Zabbix agent`|vm.running<p>Update: 10m</p>|
|{#UNIT.DESCRIPTION}|<p>State of essential service</p>|`Zabbix agent`|systemd.unit.info["{#UNIT.NAME}",ActiveState]<p>Update: 1m</p>|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#UNIT.NAME} DOWN|<p>Essential service DOWN</p>|<p>**Expression**: last(/Template VMmanager 6 KVM Hypervisor/systemd.unit.info["{#UNIT.NAME}",ActiveState],#3:now-1m)<>"active"</p><p>**Recovery expression**: </p>|average|


