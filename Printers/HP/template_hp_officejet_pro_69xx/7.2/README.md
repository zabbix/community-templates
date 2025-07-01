# Printer HP OfficeJet Pro 69xx

## Overview

Tested with Zabbix 7.2.6 on HP OfficeJet Pro 6978



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Max cartridge ink level - Cyan|<p>-</p>|`SNMP agent`|ink.cyan.max<p>Update: 3600</p>|
|Max cartridge ink level - Black|<p>-</p>|`SNMP agent`|ink.black.max<p>Update: 3600</p>|
|Cardridge Type Black|<p>-</p>|`SNMP agent`|black.cartridge.type<p>Update: 21600</p>|
|Level Cyan %|<p>-</p>|`Calculated`|cyan<p>Update: 600</p>|
|Cardridge Type Yellow|<p>-</p>|`SNMP agent`|yellow.cartridge.type<p>Update: 21600</p>|
|Level Yellow in %|<p>-</p>|`Calculated`|yellow<p>Update: 600</p>|
|Max cartridge ink level - Magenta|<p>-</p>|`SNMP agent`|ink.magenta.max<p>Update: 3600</p>|
|Level Black in %|<p>-</p>|`Calculated`|black<p>Update: 600</p>|
|Current cartridge ink level - Black|<p>-</p>|`SNMP agent`|ink.black.now<p>Update: 3600</p>|
|Max cartridge ink level - Yellow|<p>-</p>|`SNMP agent`|ink.yellow.max<p>Update: 3600</p>|
|Printer model|<p>-</p>|`SNMP agent`|model<p>Update: 21600</p>|
|Level Magenta in %|<p>-</p>|`Calculated`|magenta<p>Update: 600</p>|
|Cardridge Type Cyan|<p>-</p>|`SNMP agent`|cyan.cartridge.type<p>Update: 21600</p>|
|Cardridge Type Magenta|<p>-</p>|`SNMP agent`|magenta.cartridge.type<p>Update: 21600</p>|
|Current cartridge ink level - Magenta|<p>-</p>|`SNMP agent`|ink.magenta.now<p>Update: 3600</p>|
|Current cartridge ink level - Cyan|<p>-</p>|`SNMP agent`|ink.cyan.now<p>Update: 3600</p>|
|Current cartridge ink level - Yellow|<p>-</p>|`SNMP agent`|ink.yellow.now<p>Update: 3600</p>|


## Triggers


|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Empty Ink - Magenta|<p>-</p>|<p>**Expression**: last(/Printer HP OfficeJet Pro 69xx/magenta)=0 and nodata(/Printer HP OfficeJet Pro 69xx/magenta.cartridge.type,3w)=0 and nodata(/Printer HP OfficeJet Pro 69xx/model,3w)=0</p>|high|
|Ink low - Magenta ({ITEM.LASTVALUE})|<p>-</p>|<p>**Expression**: last(/Printer HP OfficeJet Pro 69xx/magenta)<3 and nodata(/Printer HP OfficeJet Pro 69xx/magenta.cartridge.type,3w)=0 and nodata(/Printer HP OfficeJet Pro 69xx/model,3w)=0</p>|info|
|Empty Ink - Cyan|<p>-</p>|<p>**Expression**: last(/Printer HP OfficeJet Pro 69xx/cyan)=0 and nodata(/Printer HP OfficeJet Pro 69xx/cyan.cartridge.type,3w)=0 and nodata(/Printer HP OfficeJet Pro 69xx/model,3w)=0</p>|high|
|Ink low - Cyan ({ITEM.LASTVALUE})|<p>-</p>|<p>**Expression**: last(/Printer HP OfficeJet Pro 69xx/cyan)<3 and nodata(/Printer HP OfficeJet Pro 69xx/cyan.cartridge.type,3w)=0 and nodata(/Printer HP OfficeJet Pro 69xx/model,3w)=0</p>|info|
|Empty Ink - Yellow|<p>-</p>|<p>**Expression**: last(/Printer HP OfficeJet Pro 69xx/yellow)=0 and nodata(/Printer HP OfficeJet Pro 69xx/yellow.cartridge.type,3w)=0 and nodata(/Printer HP OfficeJet Pro 69xx/model,3w)=0</p>|high|
|Ink low - Yellow ({ITEM.LASTVALUE})|<p>-</p>|<p>**Expression**: last(/Printer HP OfficeJet Pro 69xx/yellow)<3 and nodata(/Printer HP OfficeJet Pro 69xx/yellow.cartridge.type,3w)=0 and nodata(/Printer HP OfficeJet Pro 69xx/model,3w)=0</p>|info|
|Empty Ink - Black|<p>-</p>|<p>**Expression**: last(/Printer HP OfficeJet Pro 69xx/black)=0 and nodata(/Printer HP OfficeJet Pro 69xx/black.cartridge.type,3w)=0 and nodata(/Printer HP OfficeJet Pro 69xx/model,3w)=0</p>|high|
|Ink low - Black ({ITEM.LASTVALUE})|<p>-</p>|<p>**Expression**: last(/Printer HP OfficeJet Pro 69xx/black)<3 and nodata(/Printer HP OfficeJet Pro 69xx/black.cartridge.type,3w)=0 and nodata(/Printer HP OfficeJet Pro 69xx/model,3w)=0</p>|info|
