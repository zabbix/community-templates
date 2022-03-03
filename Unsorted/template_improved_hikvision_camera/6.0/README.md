# Security Cameras - HikVision

## Description

Based of SNMP v2 Generic

## Overview

Utilizes ICMP, SNMP and a Web Check against the RTSP connection to verify the camera is working.


HikVision provide minimal data over SNMP so there is not much pulled from there however I have pulled the following information into inventory


 


System Firmware Version > OS  
System MAC Address > MAC Address A  
System Model > Model  
System Manufacturer > Vendor


 


You will need to ensure that your SNMP Macro is set correctly for the cameras (or override it at the Template or Host level) and set the RTSP\_USER and RTSP\_PASS macro's in the template to allow the RTSP check to work



## Author

Justin Simmonds

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$RTSP_PASS}|<p>-</p>|`RTSP_PASS`|Text macro|
|{$RTSP_USER}|<p>-</p>|`RTSP_User`|Text macro|
|{$SNMP.TIMEOUT}|<p>-</p>|`5m`|Text macro|


## Template links

|Name|
|----|
|Template App HTTP Service|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System Model|<p>MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.model<p>Update: 12h</p>|
|System Firmware|<p>MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.firmware<p>Update: 1h</p>|
|SNMP agent availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 5m</p>|
|System MAC Address|<p>MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.macaddress<p>Update: 12h</p>|
|System Manafacturer|<p>MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.manafacturer<p>Update: 12h</p>|


## Triggers

There are no triggers in this template.

