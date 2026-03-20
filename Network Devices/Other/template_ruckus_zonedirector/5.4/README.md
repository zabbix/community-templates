# SNMP Ruckus Zonedirector

## Overview

In order to get this template working, you need at least Firmware 9.10 .  
  
Inventory template  
 **General:**   
 -CPU Utilization  
 -ZoneDirector MAC Adress  
 -ZoneDirector Serial Number  
 -ZoneDirector System Model  
 -ZoneDirector System Name  
 -ZoneDirector System Version  
 **Acces Points:**  
 -AP Status (via Discovery rules) + Triggers  
 **Interfaces:**  
 -Status of interface (eth0,...) + Triggers  
 **Users:**  
 -Authenticated Users on AP  
 -Total Authenticated users  
 -Total connected users ( Authenticated and not-authenticated)


**If you are using Zabbix 2.4, you need to add value mappings!**  
   
 **Administration => General => Value Mapping => Create ValueMap**  
   
 **RuckusAPStatus**  
   
 0 ⇒ Disconnected  
 1 ⇒ Connected  
 2 ⇒ ApprovalPending  
 3 ⇒ UpgradingFirmware  
 4 ⇒ Provisioning


**ruckusZDEthStatus**  
   
 1 ⇒ Up  
 2 ⇒ Down



## Author

Pieter-Jan Lamont

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ZoneDirector Eth|<p>-</p>|`SNMP agent`|ZDEthName[{#SNMPVALUE}]<p>Update: 3600</p>|
|Ruckus APs|<p>-</p>|`SNMP agent`|AP-[{#SNMPVALUE}]<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ICMP ping|<p>-</p>|`Simple check`|icmpping<p>Update: 60</p>|
|ZoneDirector Serial Number|<p>-</p>|`SNMP agent`|ruckusZDSystemSerialNumber.0<p>Update: 3600</p>|
|ZoneDirector Total Users|<p>-</p>|`SNMP agent`|ruckusZDSystemStatsAllNumSta<p>Update: 30</p>|
|ZoneDirector System Name|<p>-</p>|`SNMP agent`|ruckusZDSystemName.0<p>Update: 3600</p>|
|ICMP loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 60</p>|
|ZoneDirector System Model|<p>-</p>|`SNMP agent`|ruckusZDSystemModel.0<p>Update: 3600</p>|
|ZoneDirector CPU Utilization|<p>-</p>|`SNMP agent`|ruckusZDSystemCPUUTIL.0<p>Update: 30</p>|
|ZoneDirector Total Auth Clients|<p>-</p>|`SNMP agent`|ruckusZDSystemStatsNumSta.0<p>Update: 30</p>|
|ICMP response time|<p>-</p>|`Simple check`|icmppingsec<p>Update: 60</p>|
|ZoneDirector System Version|<p>-</p>|`SNMP agent`|ruckusZDSystemVersion.0<p>Update: 3600</p>|
|ZoneDirector MAC Adress|<p>-</p>|`SNMP agent`|ruckusZDSystemMacAddr.0<p>Update: 3600</p>|
|Status $1|<p>-</p>|`SNMP agent`|ruckusZDEthStatus[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|AP $1 : Auth Clients|<p>-</p>|`SNMP agent`|ruckusZDWLANAPNumSta[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|AP Status $1|<p>-</p>|`SNMP agent`|ruckusZDWLANAPStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Acces Point {#SNMPVALUE} is Offline|<p>-</p>|<p>**Expression**: last(/SNMP Ruckus Zonedirector/ruckusZDWLANAPStatus[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|Port {#SNMPVALUE} is Down|<p>-</p>|<p>**Expression**: last(/SNMP Ruckus Zonedirector/ruckusZDEthStatus[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|Port {#SNMPVALUE} is Down (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Ruckus Zonedirector/ruckusZDEthStatus[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|Acces Point {#SNMPVALUE} is Offline (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Ruckus Zonedirector/ruckusZDWLANAPStatus[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
