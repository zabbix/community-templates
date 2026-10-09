# App VMmanager 6 KVM Hypervisor

## Overview

Version: 2026-10-01

Template for monitoring VMmanager 6 KVM host (cluster node).
Requires Zabbix 7.0 or newer and Zabbix agent 2 on the node.

Template groups: `Templates/Virtualization`, `VMmanager 6`.

Nodes can be added to Zabbix automatically by the Host discovery rule of the `Template VMmanager 6 Master` template: its host prototype links this template together with `Linux by Zabbix agent`.

## Setup

1. Install Zabbix agent 2 on the KVM node.

2. Allow the `zabbix` user to run `virsh` without a password. Create `/etc/sudoers.d/zabbix`:

   ```
   Defaults:zabbix !requiretty
   Cmnd_Alias ZABBIX_CMD = /usr/bin/virsh -q list, /usr/bin/virsh -q list --all
   zabbix ALL = (root) NOPASSWD: ZABBIX_CMD
   ```

3. Add user parameters for VM counters. Create `/etc/zabbix/zabbix_agent2.d/vmmanager.conf`:

   ```
   UserParameter=vm.all,sudo virsh -q list --all | wc -l
   UserParameter=vm.running,sudo virsh -q list | wc -l
   ```

4. Restart the agent: `systemctl restart zabbix-agent2`.

## Macros used

There are no macros in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VMmanager Services|<p>Watch for essential VMmanager 6 services on cluster node. Filter (OR): `{#UNIT.NAME}` matches `^bird`, `^frr`, `^ha-agent` or `^libvirtd`</p>|`Zabbix agent`|systemd.unit.discovery<p>Update: 1m</p><p>Keep lost resources: 30d</p>|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VM All Count|<p>Count of all VM on host</p>|`Zabbix agent`|vm.all<p>Update: 10m</p>|
|VM Running Count|<p>Count of running VM on host</p>|`Zabbix agent`|vm.running<p>Update: 10m</p>|
|{#UNIT.DESCRIPTION}|<p>State of essential service</p>|`Zabbix agent`|`systemd.unit.info["{#UNIT.NAME}",ActiveState]`<p>Update: 1m</p>|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#UNIT.NAME} DOWN|<p>Essential service DOWN</p>|<p>**Expression**: last(/Template VMmanager 6 KVM Hypervisor/systemd.unit.info["{#UNIT.NAME}",ActiveState],#3:now-1m)<>"active"</p><p>**Recovery expression**: </p>|average|

## Graphs

|Name|Items|
|----|-----|
|VM Count|VM All Count, VM Running Count|
