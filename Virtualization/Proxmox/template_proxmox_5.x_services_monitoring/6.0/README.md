# Proxmox Services

## Overview

Simple template for monitoring common Proxmox 5.x services.



## Author

Rafael Mundel

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PVE Local HA Ressource Manager|<p>-</p>|`Zabbix agent (active)`|proc.num[pve-ha-lrm]<p>Update: 60s</p>|
|Cron Service|<p>-</p>|`Zabbix agent (active)`|proc.num[cron]<p>Update: 60s</p>|
|PVE Firewall Service|<p>-</p>|`Zabbix agent (active)`|proc.num[pve-firewall]<p>Update: 60s</p>|
|KSM Tuning Service|<p>-</p>|`Zabbix agent (active)`|proc.num[ksmtuned]<p>Update: 60s</p>|
|PVE SPICE Proxy|<p>-</p>|`Zabbix agent (active)`|proc.num[spiceproxy]<p>Update: 60s</p>|
|PVE Status|<p>-</p>|`Zabbix agent (active)`|proc.num[pvestatd]<p>Update: 60s</p>|
|PVE API Proxy|<p>-</p>|`Zabbix agent (active)`|proc.num[pveproxy]<p>Update: 60s</p>|
|PVE API|<p>-</p>|`Zabbix agent (active)`|proc.num[pvedaemon]<p>Update: 60s</p>|
|PVE Cluster Ressource Manager|<p>-</p>|`Zabbix agent (active)`|proc.num[pve-ha-crm]<p>Update: 60s</p>|
|Corosync Service|<p>-</p>|`Zabbix agent (active)`|proc.num[corosync]<p>Update: 60s</p>|
|Postfix Service|<p>-</p>|`Zabbix agent (active)`|proc.num[postfix]<p>Update: 60s</p>|
|PVE Cluster Service|<p>-</p>|`Zabbix agent (active)`|proc.num[pmxcfs]<p>Update: 60s</p>|
|Secure Shell Server|<p>-</p>|`Zabbix agent (active)`|proc.num[sshd]<p>Update: 60s</p>|
|System Logging|<p>-</p>|`Zabbix agent (active)`|proc.num[syslog]<p>Update: 60s</p>|
|NTP|<p>-</p>|`Zabbix agent (active)`|proc.num[systemd-timesyncd]<p>Update: 60s</p>|
|PVE Firewall Logger|<p>-</p>|`Zabbix agent (active)`|proc.num[pvefw-logger]<p>Update: 60s</p>|


## Triggers

There are no triggers in this template.

