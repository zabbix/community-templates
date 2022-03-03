# SNMP Ricoh Printers

## Overview

Tested Printers:  
 * MP C5503   
 * IPSiO SP 6320.


Display Items:  
 * Counter (Total and Pages per Minute)  
 * Tray Level  
 * Tonor Level  
 * Option Parts Status


Graph Items:  
 * Page Counter per Minute


 



## Author

330k

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template SNMP Generic|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DetailCounters|<p>-</p>|`SNMP agent`|DetailCountersID<p>Update: 300</p>|
|Parts|<p>-</p>|`SNMP agent`|PartsID<p>Update: 300</p>|
|Trays|<p>-</p>|`SNMP agent`|TraysID<p>Update: 300</p>|
|Toners|<p>-</p>|`SNMP agent`|TonersID<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Page Count|<p>-</p>|`SNMP agent`|PageCount<p>Update: 60</p>|
|Status|<p>-</p>|`SNMP agent`|PrinterStatus<p>Update: 60</p>|
|Page Count / Min|<p>-</p>|`SNMP agent`|PageCountPerMinute<p>Update: 60</p>|
|Description|<p>-</p>|`SNMP agent`|Description<p>Update: 60</p>|
|DetailCounters[{#SNMPVALUE}]|<p>-</p>|`SNMP agent`|DetailCountersID[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Part {#SNMPVALUE} Status|<p>-</p>|`SNMP agent`|PartStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Tray {#SNMPVALUE} Current Level|<p>-</p>|`SNMP agent`|TrayCurrentLevel[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Tray {#SNMPVALUE} Max Level|<p>-</p>|`SNMP agent`|TrayMaxLevel[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Tonor {#SNMPVALUE} Level|<p>-</p>|`SNMP agent`|TonerLevel[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Cover Open|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/PartStatus[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|warning|
|Unknown: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/PartStatus[{#SNMPVALUE}])<>4 and last(/SNMP Ricoh Printers/PartStatus[{#SNMPVALUE}])<>3</p><p>**Recovery expression**: </p>|not classified|
|{#SNMPVALUE} Critical: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/TonerLevel[{#SNMPVALUE}])<10</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Warning: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/TonerLevel[{#SNMPVALUE}])<30 and last(/SNMP Ricoh Printers/TonerLevel[{#SNMPVALUE}])>10</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} - Critical: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/TrayCurrentLevel[{#SNMPVALUE}])<last(/SNMP Ricoh Printers/TrayMaxLevel[{#SNMPVALUE}])/4</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} - Warning: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/TrayCurrentLevel[{#SNMPVALUE}])<last(/SNMP Ricoh Printers/TrayMaxLevel[{#SNMPVALUE}])/2 and last(/SNMP Ricoh Printers/TrayCurrentLevel[{#SNMPVALUE}])>last(/SNMP Ricoh Printers/TrayMaxLevel[{#SNMPVALUE}])/4</p><p>**Recovery expression**: </p>|warning|
|Cover Open (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/PartStatus[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|warning|
|Unknown: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/PartStatus[{#SNMPVALUE}])<>4 and last(/SNMP Ricoh Printers/PartStatus[{#SNMPVALUE}])<>3</p><p>**Recovery expression**: </p>|not classified|
|{#SNMPVALUE} - Critical: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/TrayCurrentLevel[{#SNMPVALUE}])<last(/SNMP Ricoh Printers/TrayMaxLevel[{#SNMPVALUE}])/4</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} - Warning: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/TrayCurrentLevel[{#SNMPVALUE}])<last(/SNMP Ricoh Printers/TrayMaxLevel[{#SNMPVALUE}])/2 and last(/SNMP Ricoh Printers/TrayCurrentLevel[{#SNMPVALUE}])>last(/SNMP Ricoh Printers/TrayMaxLevel[{#SNMPVALUE}])/4</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} Critical: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/TonerLevel[{#SNMPVALUE}])<10</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} Warning: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Ricoh Printers/TonerLevel[{#SNMPVALUE}])<30 and last(/SNMP Ricoh Printers/TonerLevel[{#SNMPVALUE}])>10</p><p>**Recovery expression**: </p>|warning|
