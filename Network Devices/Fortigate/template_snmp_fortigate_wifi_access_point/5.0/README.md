# SNMP Fortigate Wifi Access Points

## Description

Created by Samuel Martins (02-17-2021) https://github.com/slunart https://www.linkedin.com/in/slmartins ----------------------------------------------------------- Forti AP is monitored through FortiGate, so you need to apply this template to the Fortigate device. Originally based on template: "Fortigate SNMP SSLVPN/FortiAP Manged by Fortigate WiFi Controller template" created by Vadim Portnoy. Source: https://share.zabbix.com/network_devices/fortigate/fortigate-snmp-sslvpn-fortiap-manged-by-fortigate-wifi-controller-template My improvements: - More items monitored. - Items' name shorted - Interval time of items modified - Trigged added - Graphics Prototype added

## Overview

Template to monitor Fortinet APs. Forti AP is monitored through FortiGate, so you need to apply this template to the Fortigate device.


  
Originally based on template: "Fortigate SNMP SSLVPN/FortiAP Manged by Fortigate WiFi Controller template" created by Vadim Portnoy. Source: https://share.zabbix.com/network\_devices/fortigate/fortigate-snmp-sslvpn-fortiap-manged-by-fortigate-wifi-controller-template  
  
My improvements:


* More items monitored.
* Items' name shortened.
* Interval time of items modified.
* Trigged added.
* Graphics Prototype added.


Important MIBs used to create this template:


* FORTINET-FORTIAP-MIB-build0456.mib (FortiAPs)
* FORTINETFORTIGATE-MIB-build1803.mib (FortiGate)
* FORTINET-CORE-MIB.mib


Data Sheet FortiAP:


https://www.fortinet.com/content/dam/fortinet/assets/data-sheets/fortiap-series.pdf


 


 


 



## Author

Samuel Martins

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fortigate Wifi Access Points|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpId<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Name of this WTP $1|<p>-</p>|`SNMP agent`|fgWcWtpConfigWtpName[{#SNMPVALUE}]<p>Update: 300s</p><p>LLD</p>|
|Session Connection State of this WTP $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionConnectionState[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Base Mac Address of this WTP $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpBaseMacAddress[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Number of bytes received by this WTP $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpByteRxCount[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Number of bytes transmitted by this WTP $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpByteTxCount[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|CPU usage of a WTP (percentage) $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpCpuUsage[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Total physical memory (RAM) installed (KB) $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpMemoryCapacity[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Current memory usage of a WTP (percentage) $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpMemoryUsage[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Profile Name of this WTP $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpProfileName[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Number of clients currently connected to this WTP $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpStationCount[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Sw Version of this WTP $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpSwVersion[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Uptime of this WTP $1|<p>-</p>|`SNMP agent`|fgWcWtpSessionWtpUpTime[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|The WTP {#SNMPVALUE} Session Connection State is not OnLine|<p>-</p>|<p>**Expression**: {SNMP Fortigate Wifi Access Points:fgWcWtpSessionConnectionState[{#SNMPVALUE}].last(#3)}<>2</p><p>**Recovery expression**: </p>|high|
|The WTP {#SNMPVALUE} Session Connection State is not OnLine (LLD)|<p>-</p>|<p>**Expression**: {SNMP Fortigate Wifi Access Points:fgWcWtpSessionConnectionState[{#SNMPVALUE}].last(#3)}<>2</p><p>**Recovery expression**: </p>|high|
