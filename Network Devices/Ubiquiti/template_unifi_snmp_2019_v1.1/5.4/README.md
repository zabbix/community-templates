# UBQT UNIFI SNMP V1 HN

## Description

This template retrieve SNMP data from Unifi AP devices. MIBS requiriments: FROGFOOT-RESOURCES-MIB IANAifType-MIB IF-MIB SNMP-FRAMEWORK-MIB SNMPv2-CONF SNMPv2-MIB SNMPv2-SMI SNMPv2-TC UBNT-MIB UBNT-UniFi-MIB Author: Alex Moura

## Overview

Explicação detalhada no link do site.  
Detailed instructions on website link.  
  
This template retrieve SNMP data from Unifi AP devices.  
  
Model, Firmware Version, Uptime, IP Address, MAC Address, Interface speed, LAN port Speed and real time traffic, CPU Load, CPU usage, WIFI SSIDs, Traffic/SSID, Users/SSID, AP Hostname, Channel Utilization 2G and 3G,   
  
Traffic graphics, Users graphics,   
  
Triggers: CPU Load, Channel usage.  
  
MIBS requirements:  
FROGFOOT-RESOURCES-MIB . IANAifType-MIB , IF-MIB , SNMP-FRAMEWORK-MIB , SNMPv2-CONF. SNMPv2-MIB, SNMPv2-SMI, SNMPv2-TC  
UBNT-MIB, UBNT-UniFi-MIB  
  
Tested on: (LOCAL and PROXY environments)  
  
Models tested: UAP, UAP-LR. UAP-LRv2, UAP-AC-LR, UAP-AC-Lite  
  
(in progress)  
  
Requirements:  
AP firmware above 3.9.X  
AP SNMP feature enabled  
  
 If you Like let a comment to help me make this template better.  
Se voce gostou deixe um comentário com sugestões para melhoria do template.



## Author

Alex Moura

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Wifi Virtual Interfaces|<p>-</p>|`SNMP agent`|unifiVapEssId<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System Time|<p>-</p>|`SNMP agent`|hrSystemDate.0<p>Update: 30s</p>|
|Interface Speed (Mbit/s)|<p>-</p>|`SNMP agent`|unifiIfSpeed.1<p>Update: 60m</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 5m</p>|
|IP Address|<p>-</p>|`SNMP agent`|unifiApSystemIp.0<p>Update: 10m</p>|
|System Description|<p>Informa o modelo do aparelho</p>|`SNMP agent`|sysDescr.0<p>Update: 30m</p>|
|Firmware version|<p>-</p>|`SNMP agent`|unifiApSystemVersion.0<p>Update: 60m</p>|
|CPU AVG Load 5 Min|<p>-</p>|`SNMP agent`|IaLoad.2<p>Update: 1m</p>|
|LAN Traffic Outgoing|<p>-</p>|`SNMP agent`|unifiIfTxBytes.1<p>Update: 1m</p>|
|LAN Traffic Incoming Errors|<p>-</p>|`SNMP agent`|unifiIfRxError.1<p>Update: 1m</p>|
|AP Hostname|<p>-</p>|`SNMP agent`|unifiSysName.0<p>Update: 60m</p>|
|CPU Usage|<p>-</p>|`SNMP agent`|cpuLoad.0<p>Update: 30s</p>|
|CPU AVG Load 1 Min|<p>-</p>|`SNMP agent`|IaLoad.1<p>Update: 1m</p>|
|Contact|<p>Informa o modelo do aparelho</p>|`SNMP agent`|sysContact.0<p>Update: 60m</p>|
|MAC Address|<p>-</p>|`SNMP agent`|unifiIfMac.1<p>Update: 30m</p>|
|Channel utilization 5G (AC)|<p>Informa o modelo do aparelho</p>|`SNMP agent`|unifiRadioCuTotal.2<p>Update: 30s</p>|
|Model|<p>Informa o modelo do aparelho</p>|`SNMP agent`|unifiApSystemModel.0<p>Update: 60m</p>|
|Location|<p>Informa o modelo do aparelho</p>|`SNMP agent`|sysLocation.0<p>Update: 60m</p>|
|LAN Traffic Outgoing Errors|<p>-</p>|`SNMP agent`|unifiIfTxError.1<p>Update: 1m</p>|
|LAN Traffic Incoming|<p>-</p>|`SNMP agent`|unifiIfRxBytes.1<p>Update: 1m</p>|
|Channel 5G (N/AC)|<p>Informa o modelo do aparelho</p>|`SNMP agent`|unifiVapChannel.5<p>Update: 1m</p>|
|Channel 2G (N/G)|<p>Informa o modelo do aparelho</p>|`SNMP agent`|unifiVapChannel.1<p>Update: 1m</p>|
|Channel utilization 2G (BGN)|<p>Informa o modelo do aparelho</p>|`SNMP agent`|unifiRadioCuTotal.1<p>Update: 30s</p>|
|CPU AVG Load 15 Min|<p>-</p>|`SNMP agent`|IaLoad.3<p>Update: 1m</p>|
|WIFI Channel $2 on $1|<p>-</p>|`SNMP agent`|unifiVapChannel[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 1m</p><p>LLD</p>|
|Users $2 on $1|<p>-</p>|`SNMP agent`|unifiVapNumStations[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Incoming $2 on $1|<p>-</p>|`SNMP agent`|unifiVapRxBytes[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Incoming Errors per Second $2 on $1|<p>-</p>|`SNMP agent`|unifiVapRxErrors[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 60s</p><p>LLD</p>|
|Traffic Outgoing $2 on $1|<p>-</p>|`SNMP agent`|unifiVapTxBytes[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Outgoing Errors per Second $2 on $1|<p>-</p>|`SNMP agent`|unifiVapTxErrors[{#UNIFIVAPESSID},{#UNIVAPRADIO}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

