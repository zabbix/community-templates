# UNIFI SNMP 2019 V1.0

## Description

This template retrieve SNMP data from Unifi AP devices. MIBS requiriments: FROGFOOT-RESOURCES-MIB IANAifType-MIB IF-MIB SNMP-FRAMEWORK-MIB SNMPv2-CONF SNMPv2-MIB SNMPv2-SMI SNMPv2-TC UBNT-MIB UBNT-UniFi-MIB Author: Alex Moura

## Overview

Explicação em Português no link do site.


This template retrieve SNMP data from Unifi AP devices. 


Model, Firmware Version, Uptime, IP Address, MAC Address, LAN port Speed and real time traffic, WIFI SSIDs, Traffic/SSID, Users/SSID


Traffic graphics, Users graphics.


  
MIBS requirements:  
FROGFOOT-RESOURCES-MIB . IANAifType-MIB , IF-MIB , SNMP-FRAMEWORK-MIB , SNMPv2-CONF. SNMPv2-MIB, SNMPv2-SMI, SNMPv2-TC  
UBNT-MIB, UBNT-UniFi-MIB  
  
Tested on: (LOCAL and PROXY environments)


Models tested: UAP, UAP LR. UAP AC LR


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


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Wifi Interfaces|<p>-</p>|`SNMP agent`|unifiVapName<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Contact|<p>Informa o modelo do aparelho</p>|`SNMP agent`|sysContact.0<p>Update: 1m</p>|
|IP Address|<p>-</p>|`SNMP agent`|unifiApSystemIp.0<p>Update: 1m</p>|
|Traffic Incoming|<p>-</p>|`SNMP agent`|unifiIfRxBytes.1<p>Update: 1m</p>|
|Model|<p>Informa o modelo do aparelho</p>|`SNMP agent`|unifiApSystemModel.0<p>Update: 1m</p>|
|Traffic Outgoing|<p>-</p>|`SNMP agent`|unifiIfTxBytes.1<p>Update: 1m</p>|
|AP Hostname|<p>-</p>|`SNMP agent`|unifiSysName.0<p>Update: 1m</p>|
|Firmware version|<p>-</p>|`SNMP agent`|unifiApSystemVersion.0<p>Update: 1m</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 1m</p>|
|MAC Address|<p>-</p>|`SNMP agent`|unifiIfMac.1<p>Update: 1m</p>|
|Location|<p>Informa o modelo do aparelho</p>|`SNMP agent`|sysLocation.0<p>Update: 1m</p>|
|System Description|<p>Informa o modelo do aparelho</p>|`SNMP agent`|sysDescr.0<p>Update: 1m</p>|
|Interface Speed (Mbit/s)|<p>-</p>|`SNMP agent`|unifiIfSpeed.1<p>Update: 1m</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|unifiVapEssId[{#UNIFIVAPNAME}]<p>Update: 30s</p><p>LLD</p>|
|Users on $1|<p>-</p>|`SNMP agent`|unifiVapNumStations[{#UNIFIVAPNAME}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Incoming on $1|<p>-</p>|`SNMP agent`|unifiVapRxBytes[{#UNIFIVAPNAME}]<p>Update: 30s</p><p>LLD</p>|
|Traffic Outgoing on $1|<p>-</p>|`SNMP agent`|unifiVapTxBytes[{#UNIFIVAPNAME}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

