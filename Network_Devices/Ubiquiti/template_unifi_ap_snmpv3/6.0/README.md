# UBQT UNIFI SNMP V3 HN

## Description

This template retrieve SNMP data from Unifi AP devices. MIBS requirements: FROGFOOT-RESOURCES-MIB IANAifType-MIB IF-MIB SNMP-FRAMEWORK-MIB SNMPv2-CONF SNMPv2-MIB SNMPv2-SMI SNMPv2-TC UBNT-MIB UBNT-UniFi-MIB Author: Helmut Leonhardt based on Alex Moura

## Overview


unifi zabbix snmpv3
based on Alex Mouras work https://share.zabbix.com/network\_devices/ubiquiti/unifi-snmp-2019-v1-1
  

Ubiquity Controller > Settings > Services > SNMP v3 > enable, set username and password
Zabbix > Macro >
{$SNMP\_USERNAME} <= username set in controller
{$SNMP\_AUTHPASS} & {$SNMP\_PRIVPASS} <= password set in controller
 
2020 April
fixed zabbix version
fixed virtual interface items

2024 September - Fixes by Crowtrobot
Add network traffic numbers in bits/sec to simplify comparing to other network devices.
Replaced some description strings that appeared to be in Portuguese with English strings, or removed them completely where they didn't seem useful.
Fixed 5GHz channel oid, which was wrong on my UAP-AC-InWall and U6-Enterprise.
Added 6GHz radio channel oid.  


## Author

Helmut Leonhardt

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_AUTHPASS}|<p>-</p>|``|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|
|{$SNMP_PRIVPASS}|<p>-</p>|``|Text macro|
|{$SNMP_USERNAME}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|WiFi Virtual Interfaces|<p>-</p>|`SNMP agent`|unifiVapEssId<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System Description|<p>Description (seems to usually be the model and firmware version).</p>|`SNMP agent`|sysDescr.0<p>Update: 30m</p>|
|Contact|<p>The contact string set for this device in the unifi controler.</p>|`SNMP agent`|sysContact.0<p>Update: 60m</p>|
|Location|<p>The location string set for this device in the unifi controller.</p>|`SNMP agent`|sysLocation.0<p>Update: 60m</p>|
|IP Address|<p>The device's IP address.</p>|`SNMP agent`|unifiApSystemIp.0<p>Update: 10m</p>|
|LAN Traffic Incoming (bytes)|<p>LAN incoming traffic in Bytes/sec</p>|`SNMP agent`|unifiIfRxBytes.1<p>Update: 1m</p>|
|LAN Traffic Incoming (bits)|<p>LAN incoming traffic in bites/sec</p>|`SNMP agent`|unifiIfRxBits.1<p>Update: 1m</p>|
|Interface Speed (Mbit/s)|<p>LAN port connection speed in Mbits/s (so 1000 is 1Gbps)</p>|`SNMP agent`|unifiIfSpeed.1<p>Update: 60m</p>|
|CPU AVG Load 15 Min|<p>-</p>|`SNMP agent`|IaLoad.3<p>Update: 1m</p>|
|Channel 5G (N/AC)|<p>WiFi channel on the 5GHz radio</p>|`SNMP agent`|unifiVapChannel.5<p>Update: 1m</p>|
|Firmware version|<p>-</p>|`SNMP agent`|unifiApSystemVersion.0<p>Update: 60m</p>|
|Channel 2G (N/G)|<p>WiFi channel on the 2.4GHz radio</p>|`SNMP agent`|unifiVapChannel.1<p>Update: 1m</p>|
|AP Hostname|<p>-</p>|`SNMP agent`|unifiSysName.0<p>Update: 60m</p>|
|CPU Usage|<p>-</p>|`SNMP agent`|cpuLoad.0<p>Update: 30s</p>|
|MAC Address|<p>-</p>|`SNMP agent`|unifiIfMac.1<p>Update: 30m</p>|
|System Time|<p>-</p>|`SNMP agent`|hrSystemDate.0<p>Update: 30s</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 5m</p>|
|Model|<p>AP model name</p>|`SNMP agent`|unifiApSystemModel.0<p>Update: 60m</p>|
|CPU AVG Load 5 Min|<p>-</p>|`SNMP agent`|IaLoad.2<p>Update: 1m</p>|
|LAN Traffic Outgoing Errors|<p>-</p>|`SNMP agent`|unifiIfTxError.1<p>Update: 1m</p>|
|LAN Traffic Outgoing (bytes)|<p>LAN incoming traffic in bytes/sec</p>|`SNMP agent`|unifiIfTxBytes.1<p>Update: 1m</p>|
|LAN Traffic Outgoing (bits)|<p>LAN incoming traffic in bits/sec</p>|`SNMP agent`|unifiIfTxBits.1<p>Update: 1m</p>|
|Channel utilization 2G (BGN)|<p>-</p>|`SNMP agent`|unifiRadioCuTotal.1<p>Update: 30s</p>|
|CPU AVG Load 1 Min|<p>-</p>|`SNMP agent`|IaLoad.1<p>Update: 1m</p>|
|Channel utilization 5G (AC)|<p>-</p>|`SNMP agent`|unifiRadioCuTotal.2<p>Update: 30s</p>|
|LAN Traffic Incoming Errors|<p>-</p>|`SNMP agent`|unifiIfRxError.1<p>Update: 1m</p>|
|WIFI Channel $2 on $1|<p>-</p>|`SNMP agent`|unifiVapChannel[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 1m</p><p>LLD</p>|
|Users $2 on $1|<p>-</p>|`SNMP agent`|unifiVapNumStations[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Incoming $2 on $1 (bytes)|<p>Network traffic incoming on specific WiFi network in Bytes/sec</p>|`SNMP agent`|unifiVapRxBytes[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Incoming $2 on $1|<p>Network traffic incoming on specific WiFi network in Bits/sec</p>|`SNMP agent`|unifiVapRxBits[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Incoming Errors per Second $2 on $1|<p>-</p>|`SNMP agent`|unifiVapRxErrors[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 60s</p><p>LLD</p>|
|Traffic Outgoing $2 on $1 (bytes)|<p>Network traffic outgoing on specific WiFi network in Bytes/sec</p>|`SNMP agent`|unifiVapTxBytes[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Outgoing $2 on $1 (bits)|<p>Network traffic outgoing on specific WiFi network in bits/sec</p>|`SNMP agent`|unifiVapTxBits[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Outgoing Errors per Second $2 on $1|<p>-</p>|`SNMP agent`|unifiVapTxErrors[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

