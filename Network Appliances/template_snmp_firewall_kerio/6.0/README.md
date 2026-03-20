# SNMP_FIREWALL_KERIO_CONTROL_LLD_VERSAO-1.0

## Overview

alimoradimllm99@gmail.com



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|LLD Discovery Firewall Description|<p>-</p>|`SNMP agent`|sysDescr.discovery<p>Update: 84600</p>|
|Discovery LLD Information Memory Firewall|<p>-</p>|`SNMP agent`|fgHaStatsMemUsage2.discovery<p>Update: 84600</p>|
|Discovery LLD Information Processor Firewall|<p>-</p>|`SNMP agent`|fgHaStatsCpuUsages.discovery<p>Update: 84600</p>|
|Firewall Network Interface LLD Discovery|<p>-</p>|`SNMP agent`|FwIfName.discovery<p>Update: 84600</p>|
|Discovery LLD Hardware Inventory|<p>-</p>|`SNMP agent`|fgHaStatsHostname.discovery<p>Update: 84600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Package Loss ( porcentagem)|<p>-</p>|`Simple check`|icmppingloss<p>Update: 30s</p>|
|Latencia|<p>-</p>|`Simple check`|icmppingsec<p>Update: 30s</p>|
|Availability|<p>-</p>|`Simple check`|icmpping<p>Update: 30s</p>|
|On time|<p>-</p>|`SNMP agent`|sysUpTimeInstance.0<p>Update: 600</p>|
|Number of services on the Firewall $1|<p>-</p>|`SNMP agent`|ifNumber.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Firewall Contact Information $1|<p>-</p>|`SNMP agent`|sysContact.[{#SNMPVALUE}]<p>Update: 84600</p><p>LLD</p>|
|Equipment description $1|<p>-</p>|`SNMP agent`|sysDescr.[{#SNMPVALUE}]<p>Update: 84600</p><p>LLD</p>|
|Firewall Location Information $1|<p>-</p>|`SNMP agent`|sysLocation.[{#SNMPVALUE}]<p>Update: 84600</p><p>LLD</p>|
|Firewall OID information $1|<p>-</p>|`SNMP agent`|sysObjectID.[{#SNMPVALUE}]<p>Update: 84600</p><p>LLD</p>|
|Memory in use on % {#SNMPVALUE}|<p>-</p>|`SNMP agent`|fgHaStatsMemUsage.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Firewall's Memory Cache Usage $1|<p>-</p>|`SNMP agent`|highMemUsage.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Full Firewall Memory $1|<p>-</p>|`SNMP agent`|hrMemorySize.[{#SNMPVALUE}]<p>Update: 84600</p><p>LLD</p>|
|Firewall Buffering Memory Usage $1|<p>-</p>|`SNMP agent`|memBuffer.[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Firewall Share Memory Usage $1|<p>-</p>|`SNMP agent`|memShared.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Firewall Free Total Memory $1|<p>-</p>|`SNMP agent`|memTotalFree.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Firewall processor usage information $1|<p>-</p>|`SNMP agent`|fgHaStatsCpuUsage.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Network Interface Administrative Status $1|<p>-</p>|`SNMP agent`|ifAdminStatus.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Network Interface Alias $1|<p>-</p>|`SNMP agent`|ifAlias.[{#SNMPINDEX}]<p>Update: 84600</p><p>LLD</p>|
|Network Interface Information $1|<p>-</p>|`SNMP agent`|ifInOctets.[{#SNMPVALUE}]<p>Update: 600</p><p>LLD</p>|
|Network Interface Description $1|<p>-</p>|`SNMP agent`|ifName.[{#SNMPINDEX}]<p>Update: 84600</p><p>LLD</p>|
|Outbound traffic on the interface $1|<p>-</p>|`SNMP agent`|ifOutOctets.[{#SNMPVALUE}]<p>Update: 600;60s/1-5,07:00-19:00</p><p>LLD</p>|
|Network Interface Mac Address $1|<p>-</p>|`SNMP agent`|ifPhysAddress.[{#SNMPINDEX}]<p>Update: 84600</p><p>LLD</p>|
|Network Interface Type $1|<p>-</p>|`SNMP agent`|ifType.[{#SNMPINDEX}]<p>Update: 84600</p><p>LLD</p>|
|Hostname do Firewall $1|<p>-</p>|`SNMP agent`|fgHaStatsHostnameMagnao.[{#SNMPVALUE}]<p>Update: 84600</p><p>LLD</p>|
|firewall version $1|<p>-</p>|`SNMP agent`|xg-firewallVersion.[{#SNMPVALUE}]<p>Update: 84600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Firewall processor usage {HOST.NAME} it's too high!|<p>-</p>|<p>**Expression**: last(/SNMP_FIREWALL_KERIO_CONTROL_LLD_VERSAO-1.0/fgHaStatsCpuUsage.[{#SNMPVALUE}])>50</p><p>**Recovery expression**: </p>|high|
|Firewall memory usage {HOST.NAME} it's too high!|<p>-</p>|<p>**Expression**: last(/SNMP_FIREWALL_KERIO_CONTROL_LLD_VERSAO-1.0/fgHaStatsMemUsage.[{#SNMPVALUE}])>1000</p><p>**Recovery expression**: </p>|high|
|The Network Interface {#SNMPVALUE} It is out!|<p>-</p>|<p>**Expression**: last(/SNMP_FIREWALL_KERIO_CONTROL_LLD_VERSAO-1.0/ifAdminStatus.[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|disaster|
|Firewall memory usage {HOST.NAME} it's too high! (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP_FIREWALL_KERIO_CONTROL_LLD_VERSAO-1.0/fgHaStatsMemUsage.[{#SNMPVALUE}])>1000</p><p>**Recovery expression**: </p>|high|
|Firewall processor usage {HOST.NAME} it's too high! (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP_FIREWALL_KERIO_CONTROL_LLD_VERSAO-1.0/fgHaStatsCpuUsage.[{#SNMPVALUE}])>50</p><p>**Recovery expression**: </p>|high|
|The Network Interface {#SNMPVALUE} It is out! (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP_FIREWALL_KERIO_CONTROL_LLD_VERSAO-1.0/ifAdminStatus.[{#SNMPVALUE}])<>1</p><p>**Recovery expression**: </p>|disaster|
