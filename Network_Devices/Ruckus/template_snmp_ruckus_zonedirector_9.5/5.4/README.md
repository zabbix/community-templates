# SNMP Ruckus Zonedirector 9.5

## Overview

Ruckus Zone Director 9.5
========================


Tested with Zabbix 3.2.7 Ruckus Zone Director 9.5 Template.


Tested with objects ID:


SNMPv2-SMI::enterprises.25053.3.1.5.15 SNMPv2-SMI::enterprises.25053.3.1.5.3 SNMPv2-SMI::enterprises.25053.3.1.5.2 .1.3.6.1.4.1.25053.3.1.5.15 .1.3.6.1.4.1.25053.3.1.5.3 .1.3.6.1.4.1.25053.3.1.5.2


Items:
------


-Total Rx/Tx Bytes


-CPU utilization


-MAC Address


<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: #24292e; font-family

## Author

Rafael Gustavo Gassner

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Ruckus APs|<p>-</p>|`SNMP agent`|APRZ-[{#SNMPVALUE}]<p>Update: 3600</p>|
|SSIDs|<p>-</p>|`SNMP agent`|SSIDRZ-[{#SNMPVALUE}]<p>Update: 3600</p>|
|ZoneDirector Eth|<p>-</p>|`SNMP agent`|ZDEthName[{#SNMPVALUE}]<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Total Tx Bytes|<p>-</p>|`SNMP agent`|ruckusZDSystemStatsWLANTotalTxBytes<p>Update: 120</p>|
|ZoneDirector MAC Adress|<p>-</p>|`SNMP agent`|ruckusZDSystemMacAddr.0<p>Update: 3600</p>|
|ZoneDirector Total Auth Clients|<p>-</p>|`SNMP agent`|ruckusZDSystemStatsNumSta.0<p>Update: 300</p>|
|ZoneDirector Total Users|<p>-</p>|`SNMP agent`|ruckusZDSystemStatsAllNumSta<p>Update: 300</p>|
|Total Rx Bytes|<p>-</p>|`SNMP agent`|ruckusZDSystemStatsWLANTotalRxBytes<p>Update: 120</p>|
|ZoneDirector System Version|<p>-</p>|`SNMP agent`|ruckusZDSystemVersion.0<p>Update: 3600</p>|
|ZoneDirector CPU Utilization|<p>-</p>|`SNMP agent`|ruckusZDSystemCPUUTIL.0<p>Update: 300</p>|
|ZoneDirector System Model|<p>-</p>|`SNMP agent`|ruckusZDSystemModel.0<p>Update: 3600</p>|
|ZoneDirector Serial Number|<p>-</p>|`SNMP agent`|ruckusZDSystemSerialNumber.0<p>Update: 3600</p>|
|AP $1 : Name|<p>-</p>|`SNMP agent`|APname[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|AP $1 : Auth Clients|<p>-</p>|`SNMP agent`|ruckusZDWLANAPNumSta[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|AP Status $1|<p>-</p>|`SNMP agent`|ruckusZDWLANAPStatus[{#SNMPVALUE}]<p>Update: 360</p><p>LLD</p>|
|ruckusZDWLANRxBytes $1|<p>-</p>|`SNMP agent`|ruckusZDWLANRxBytes-[{#SNMPVALUE}]<p>Update: 1200</p><p>LLD</p>|
|ruckusZDWLANTxBytes $1|<p>-</p>|`SNMP agent`|ruckusZDWLANTxBytes-[{#SNMPVALUE}]<p>Update: 1200</p><p>LLD</p>|
|SSID $1 : Name|<p>-</p>|`SNMP agent`|SSIDName-[{#SNMPVALUE}]<p>Update: 21600</p><p>LLD</p>|
|Status $1|<p>-</p>|`SNMP agent`|ruckusZDEthStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Acces Point Wifi  {ITEM.VALUE2} is not available. Address: {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/SNMP Ruckus Zonedirector 9.5/ruckusZDWLANAPStatus[{#SNMPVALUE}])<>1)or(find(/SNMP Ruckus Zonedirector 9.5/APname[{#SNMPVALUE}],,"regexp","^blablablabla$")=1)</p><p>**Recovery expression**: </p>|warning|
|Port {#SNMPVALUE} is Down|<p>-</p>|<p>**Expression**: last(/SNMP Ruckus Zonedirector 9.5/ruckusZDEthStatus[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|Acces Point Wifi  {ITEM.VALUE2} is not available. Address: {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/SNMP Ruckus Zonedirector 9.5/ruckusZDWLANAPStatus[{#SNMPVALUE}])<>1)or(find(/SNMP Ruckus Zonedirector 9.5/APname[{#SNMPVALUE}],,"regexp","^blablablabla$")=1)</p><p>**Recovery expression**: </p>|warning|
|Port {#SNMPVALUE} is Down (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Ruckus Zonedirector 9.5/ruckusZDEthStatus[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
