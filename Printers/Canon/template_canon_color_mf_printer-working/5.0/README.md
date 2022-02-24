# Canon Color MF printers

## Description

Template for color Canon Multi Functional printer.

## Overview

Modified version of created by aikucits


Corrected the error when the importing template to new zabbix versions. It tested on Zabbix version 5.0.5


Regards..



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Total.print.No.of.copies|<p>Shows printer total printed nuber of copies.</p>|`SNMP agent`|Total.print.No.of.copies<p>Update: 300</p>|
|Ping response time|<p>UPS ping check.</p>|`Simple check`|icmppingsec[, , , , ,]<p>Update: 60</p>|
|Toner.Black.level.now|<p>Black Toner level now.</p>|`SNMP agent`|Toner.Black.level.now<p>Update: 100</p>|
|Toner.Yellow.level.now|<p>Yellow Toner level now.</p>|`SNMP agent`|Toner.Yellow.level.now<p>Update: 100</p>|
|Toner.Magenta.level.now|<p>Magenta Toner level now.</p>|`SNMP agent`|Toner.Magenta.level.now<p>Update: 100</p>|
|Toner.Yellow.level.max|<p>Max Nuber of Yellow toner.</p>|`SNMP agent`|Toner.Yellow.level.max<p>Update: 10800</p>|
|Magenta.toner.model|<p>Shows printer magenta model and name.</p>|`SNMP agent`|Magenta.toner.model<p>Update: 10800</p>|
|device.name|<p>-</p>|`SNMP agent`|device.name<p>Update: 10800</p>|
|Total.Black.Small|<p>Shows Total.Black.Small type.</p>|`SNMP agent`|Total.Black.Small<p>Update: 10800</p>|
|Total.Full.Color.Single.Color.Small|<p>Shows counter Total.Full.Color.Single.Color.Small type.</p>|`SNMP agent`|Total.Full.Color.Single.Color.Small<p>Update: 10800</p>|
|Toner.Cyan.level.max|<p>Max Nuber of Cyan toner.</p>|`SNMP agent`|Toner.Cyan.level.max<p>Update: 10800</p>|
|Cyan.toner.model|<p>Shows printer cyan toner model and name.</p>|`SNMP agent`|Cyan.toner.model<p>Update: 10800</p>|
|Toner.Cyan.level.now|<p>Cyan Toner level now.</p>|`SNMP agent`|Toner.Cyan.level.now<p>Update: 100</p>|
|Total.scan.No.of.copies|<p>Shows printer total scaned number of copies.</p>|`SNMP agent`|Total.scan.No.of.copies<p>Update: 300</p>|
|Total.print|<p>Shows printer total printer paper.</p>|`SNMP agent`|Total.print<p>Update: 10800</p>|
|Device.location|<p>Device location.</p>|`SNMP agent`|Device.location<p>Update: 10800</p>|
|Yellow.toner.model|<p>Shows printer toner model and name.</p>|`SNMP agent`|Yellow.toner.model<p>Update: 10800</p>|
|Toner.Black.level.max|<p>Max Nuber of Black toner.</p>|`SNMP agent`|Toner.Black.level.max<p>Update: 10800</p>|
|Black.toner.model|<p>Shows black toner name and model.</p>|`SNMP agent`|Black.toner.model<p>Update: 10800</p>|
|Total.Full.Color.Single.Color.Small.No.of.copies|<p>Shows total nuber of copies.</p>|`SNMP agent`|Total.Full.Color.Single.Color.Small.No.of.copies<p>Update: 300</p>|
|Total.scan|<p>Shows printer total scaned paper.</p>|`SNMP agent`|Total.scan<p>Update: 10800</p>|
|Device.status|<p>Printer device status.</p>|`SNMP agent`|Device.status<p>Update: 60</p>|
|Total.Black.Small.No.of.Copies|<p>Shows total nuber of copies.</p>|`SNMP agent`|Total.Black.Small.No.of.Copies<p>Update: 300</p>|
|Canon.model|<p>Printer model.</p>|`SNMP agent`|Canon.model<p>Update: 10800</p>|
|Tray1.paper.out|<p>Printer Tray 1 paper out.</p>|`SNMP agent`|Tray1.paper.out<p>Update: 60</p>|
|Device.IP.address|<p>Shows device IP address</p>|`SNMP agent`|Device.IP.address<p>Update: 10800</p>|
|Toner.Magenta.level.max|<p>Max Nuber of Magenta toner.</p>|`SNMP agent`|Toner.Magenta.level.max<p>Update: 10800</p>|


## Triggers

There are no triggers in this template.

