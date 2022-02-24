# Kyocera FS-4200DN

## Overview

Template for Kyocera FS-4200DN network printers, in french.


Works with Zabbix 2.4.7.


Contains :


- Informations : % toner remain, S/N, Total printed pages, MAC address, location, toner capacity


- Counters : printed pages, toner printed pages



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
|MAC Address|<p>-</p>|`SNMP agent`|mac.address<p>Update: 43200</p>|
|Emplacement imprimante|<p>-</p>|`SNMP agent`|emplacement.imprimante<p>Update: 43200</p>|
|Compteur toner|<p>-</p>|`SNMP agent`|compteur.toner<p>Update: 10</p>|
|Capacité toner|<p>-</p>|`SNMP agent`|capacite.toner<p>Update: 10</p>|
|Impressions|<p>-</p>|`SNMP agent`|impressions<p>Update: 10</p>|
|Nombre impressions total|<p>-</p>|`SNMP agent`|nbr.impressions.total<p>Update: 10</p>|
|Pourcentage toner|<p>-</p>|`Calculated`|pourcentage.toner<p>Update: 10</p>|
|Numéro série|<p>-</p>|`SNMP agent`|num.serie<p>Update: 43200</p>|


## Triggers

There are no triggers in this template.

