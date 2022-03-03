# MikroTik

## Overview

**A newly built template designed to work on all MikroTik Routers!**


**Items:**


* CPU Frequency
* Disk Space Total
* Disk Space Used
* Disk Space Utilisation
* Firmware
* ICMP Ping
* ICMP Packet Loss
* ICMP Latency
* Identity
* Memory Total
* Memory Used
* Memory Utilisation
* Model
* Temperature
* Uptime
* Voltage
* SNMP Availability


**Discover Rules:**


* CPU
* Interfaces


All in one contained template.



## Author

Shaun Allen

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interfaces|<p>-</p>|`SNMP agent`|interfaces<p>Update: 1h</p>|
|CPU|<p>-</p>|`SNMP agent`|cpu<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Uptime|<p>-</p>|`SNMP agent`|uptime<p>Update: 1m</p>|
|ICMP Packet Loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 1m</p>|
|Memory Used|<p>-</p>|`SNMP agent`|memory.used<p>Update: 1m</p>|
|Disk Space Used|<p>-</p>|`SNMP agent`|disk.space.used<p>Update: 1m</p>|
|Model|<p>-</p>|`SNMP agent`|model<p>Update: 1d</p>|
|Voltage|<p>-</p>|`SNMP agent`|voltage<p>Update: 5m</p>|
|Memory Total|<p>-</p>|`SNMP agent`|memory.total<p>Update: 1m</p>|
|ICMP Latency|<p>-</p>|`Simple check`|icmppingsec<p>Update: 1m</p>|
|SNMP Availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 5m</p>|
|Firmware|<p>-</p>|`SNMP agent`|firmware<p>Update: 1h</p>|
|Disk Space Utilisation|<p>-</p>|`Calculated`|disk.space.utilisation<p>Update: 1m</p>|
|CPU Frequency|<p>-</p>|`SNMP agent`|cpu.frequency<p>Update: 1h</p>|
|Memory Utilisation|<p>-</p>|`Calculated`|memory.utilisation<p>Update: 1m</p>|
|Temperature|<p>-</p>|`SNMP agent`|temperature<p>Update: 5m</p>|
|Identity|<p>-</p>|`SNMP agent`|identity<p>Update: 1h</p>|
|Disk Space Total|<p>-</p>|`SNMP agent`|disk.space.total<p>Update: 1m</p>|
|ICMP Ping|<p>-</p>|`Simple check`|icmpping<p>Update: 1m</p>|
|{#SNMPVALUE} In|<p>-</p>|`SNMP agent`|interface.in.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE} Out|<p>-</p>|`SNMP agent`|interface.out.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|CPU {#SNMPINDEX}|<p>-</p>|`SNMP agent`|cpu.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|High CPU|<p>-</p>|<p>**Expression**: last(/MikroTik/cpu.[{#SNMPINDEX}],#2)>90</p><p>**Recovery expression**: </p>|warning|
|High CPU (LLD)|<p>-</p>|<p>**Expression**: last(/MikroTik/cpu.[{#SNMPINDEX}],#2)>90</p><p>**Recovery expression**: </p>|warning|
