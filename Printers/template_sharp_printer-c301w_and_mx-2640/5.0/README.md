# Template Sharp Printers

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Printer Paper Tray|<p>-</p>|`SNMP agent`|sharp.prt.snmp.tray<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Black Photoconductive Drum Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.black.drum.usage<p>Update: 30</p>|
|Fusing Unit Usage|<p>-</p>|`SNMP agent`|sharp.printer.fusing.unit.usage<p>Update: 30</p>|
|Cyan Photoconductive Drum Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.cyan.drum.usage<p>Update: 30</p>|
|Black Toner Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.black.usage<p>Update: 30</p>|
|Yellow Toner Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.yellow.usage<p>Update: 30</p>|
|Magenta Photoconductive Drum Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.magenta.drum.usage<p>Update: 30</p>|
|Magenta Developer Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.magenta.dev.usage<p>Update: 30</p>|
|Yellow Developer Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.yellow.dev.usage<p>Update: 30</p>|
|Cyan Toner Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.cyan.usage<p>Update: 30</p>|
|Magenta Toner Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.magenta.usage<p>Update: 30</p>|
|Cyan Developer Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.cyan.dev.usage<p>Update: 30</p>|
|Black Developer Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.black.dev.usage<p>Update: 30</p>|
|Yellow Photoconductive Drum Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.yellow.drum.usage<p>Update: 30</p>|
|Waste Toner Usage|<p>-</p>|`SNMP agent`|sharp.printer.toner.waste.usage<p>Update: 30</p>|
|Paper Trays $1|<p>-</p>|`SNMP agent`|sharp.prt.snmp.tray.["{#SNMPINDEX}"]<p>Update: 30</p><p>LLD</p>|
|Paper Trays $1 Level|<p>-</p>|`SNMP agent`|sharp.prt.snmp.tray.level.["{#SNMPINDEX}"]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Paper Tray :: {#SNMPVALUE} is Empty|<p>-</p>|<p>**Expression**: {Template Sharp Printers:sharp.prt.snmp.tray.level.["{#SNMPINDEX}"].last()}=0 and {Template Sharp Printers:sharp.prt.snmp.tray.["{#SNMPINDEX}"].str(Bypass Tray)}=0</p><p>**Recovery expression**: </p>|information|
|Paper Tray :: {#SNMPVALUE} is Empty (LLD)|<p>-</p>|<p>**Expression**: {Template Sharp Printers:sharp.prt.snmp.tray.level.["{#SNMPINDEX}"].last()}=0 and {Template Sharp Printers:sharp.prt.snmp.tray.["{#SNMPINDEX}"].str(Bypass Tray)}=0</p><p>**Recovery expression**: </p>|information|
