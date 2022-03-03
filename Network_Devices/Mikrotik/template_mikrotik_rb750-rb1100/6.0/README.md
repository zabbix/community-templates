# Mikrotik RB750-RB1100

## Description

Autor: Danilo Barros de Medeiros Template: Mikrotik RB750/RB1100 Versão Zabbix: 3.0 Versão Template: 1.1

## Overview

Template Mikrotik para RB 750 e RB1100.


Zabbix 3.0


 



## Author

Danilo Barros

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|LLD Interfaces|<p>-</p>|`SNMP agent`|ifDescr<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System name|<p>-</p>|`SNMP agent`|mikrotik.identity.name<p>Update: 3600</p>|
|CPU load|<p>-</p>|`SNMP agent`|mikrotik.cpu.load<p>Update: 30</p>|
|CPU temperature|<p>-</p>|`SNMP agent`|mikrotik.processor.temperature<p>Update: 30</p>|
|System temperature|<p>-</p>|`SNMP agent`|mikrotik.system.temperature<p>Update: 30</p>|
|System version and hw|<p>-</p>|`SNMP agent`|mikrotik.version.and.hw<p>Update: 3600</p>|
|PingLatency|<p>-</p>|`Simple check`|icmppingsec<p>Update: 120</p>|
|Total memory|<p>-</p>|`SNMP agent`|mikrotik.total.memory<p>Update: 30</p>|
|Pingloss|<p>-</p>|`Simple check`|icmppingloss[,,,,]<p>Update: 60</p>|
|Used memory|<p>-</p>|`SNMP agent`|mikrotik.used.memory<p>Update: 30</p>|
|System uptime|<p>-</p>|`SNMP agent`|mikrotik.uptime<p>Update: 30</p>|
|Used disk space|<p>-</p>|`SNMP agent`|mikrotik.used.disk.space<p>Update: 30</p>|
|Voltage|<p>-</p>|`SNMP agent`|mikrotik.voltage<p>Update: 30</p>|
|Ping|<p>-</p>|`Simple check`|icmpping<p>Update: 120</p>|
|Total disk space|<p>-</p>|`SNMP agent`|mikrotik.total.disk.space<p>Update: 30</p>|
|Alias Interface $1|<p>-</p>|`SNMP agent`|ifAlias[{#IFDESCR}]<p>Update: 30</p><p>LLD</p>|
|In-Erros Interface $1|<p>-</p>|`SNMP agent`|ifInErrors[{#IFDESCR}]<p>Update: 30</p><p>LLD</p>|
|Inbound Interface $1|<p>-</p>|`SNMP agent`|ifInOctets[{#IFDESCR}]<p>Update: 30</p><p>LLD</p>|
|Operacional Status Interface $1|<p>-</p>|`SNMP agent`|ifOperStatus[{#IFDESCR}]<p>Update: 30</p><p>LLD</p>|
|Out-Erros Interface $1|<p>-</p>|`SNMP agent`|ifOutErrors[{#IFDESCR}]<p>Update: 30</p><p>LLD</p>|
|Outbound Interface $1|<p>-</p>|`SNMP agent`|ifOutOctets[{#IFDESCR}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Status Operacional Alterado {HOST.NAME} Interface {#IFDESCR}|<p>-</p>|<p>**Expression**: (last(/Mikrotik RB750-RB1100/ifOperStatus[{#IFDESCR}],#1)<>last(/Mikrotik RB750-RB1100/ifOperStatus[{#IFDESCR}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Status Operacional Alterado {HOST.NAME} Interface {#IFDESCR} (LLD)|<p>-</p>|<p>**Expression**: (last(/Mikrotik RB750-RB1100/ifOperStatus[{#IFDESCR}],#1)<>last(/Mikrotik RB750-RB1100/ifOperStatus[{#IFDESCR}],#2))=1</p><p>**Recovery expression**: </p>|information|
