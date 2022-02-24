# Kyocera TASKalfa 3051ci

## Overview

Template for Kyocera TASKalfa 3051ci network printer, in french.


Works with Zabbix 2.4.7


 


Contains :


- Copier : amount of printed pages in B/W and in color


- Printer : amount of printed pages in B/W and in color


- Informations : location, MAC Address, Name, S/N



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
|Emplacement copieur|<p>-</p>|`SNMP agent`|emplacement.copieur<p>Update: 3600</p>|
|NB|<p>-</p>|`SNMP agent`|imprimante.nb<p>Update: 60</p>|
|NB|<p>-</p>|`SNMP agent`|copieur.nb<p>Update: 60</p>|
|Couleur|<p>-</p>|`SNMP agent`|imprimante.couleur<p>Update: 60</p>|
|Nom copieur|<p>-</p>|`SNMP agent`|nom.copieur<p>Update: 3600</p>|
|Couleur|<p>-</p>|`SNMP agent`|copieur.couleur<p>Update: 60</p>|
|Numéro série|<p>-</p>|`SNMP agent`|num.serie<p>Update: 3600</p>|
|MAC carte|<p>-</p>|`SNMP agent`|mac.carte<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

