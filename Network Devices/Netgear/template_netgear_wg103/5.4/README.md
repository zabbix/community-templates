# Netgear_WG103

## Overview

Template for Netgear WG103 access point.


Works with Zabbix 2.4.7 and a Netgear WG103 FW 2.2.5.


 


Contains :


Basic information such as : FWversion, S/N, APname, MACLAN, MACWLAN


Interfaces traffic (LAN and WLAN)


Wifi profiles names


Current users number connected to the AP



## Author

Nicolas C.

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Profil name 05|<p>-</p>|`SNMP agent`|profil5.name<p>Update: 3600</p>|
|FW version|<p>-</p>|`SNMP agent`|fw.pa<p>Update: 3600</p>|
|Profil name 02|<p>-</p>|`SNMP agent`|profil2.name<p>Update: 3600</p>|
|Profil name 07|<p>-</p>|`SNMP agent`|profil7.name<p>Update: 3600</p>|
|Profil name 01|<p>-</p>|`SNMP agent`|profil1.name<p>Update: 3600</p>|
|Profil name 04|<p>-</p>|`SNMP agent`|profil4.name<p>Update: 3600</p>|
|S/N|<p>-</p>|`SNMP agent`|serial.pa<p>Update: 3600</p>|
|AP name|<p>-</p>|`SNMP agent`|nom.pa<p>Update: 3600</p>|
|Profil name 03|<p>-</p>|`SNMP agent`|profil3.name<p>Update: 3600</p>|
|Profil name 06|<p>-</p>|`SNMP agent`|profil6.name<p>Update: 3600</p>|
|LAN IN|<p>-</p>|`SNMP agent`|lan.in<p>Update: 5</p>|
|Connected users|<p>-</p>|`SNMP agent`|connected.users<p>Update: 5</p>|
|LAN OUT|<p>-</p>|`SNMP agent`|lan.out<p>Update: 5</p>|
|WLAN MAC address|<p>-</p>|`SNMP agent`|mac.pa.wlan<p>Update: 3600</p>|
|WLAN IN|<p>-</p>|`SNMP agent`|wlan.in<p>Update: 5</p>|
|WLAN OUT|<p>-</p>|`SNMP agent`|wlan.out<p>Update: 5</p>|
|LAN MAC address|<p>-</p>|`SNMP agent`|mac.pa.lan<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

