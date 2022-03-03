# Printer Xerox WorkCentre 7855

## Overview

Based on Dmitry Burtsev's "Xerox WorkCentre 7525" template, so cudos!


Added waste container trigger and minor changes to fit the 7855 model.


I also set the toner triggers lower (3% information, 0% warning)


Cheers



## Author

Steffen Winkelbauer

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Type of drum - yellow|<p>-</p>|`SNMP agent`|yellow.drum.type<p>Update: 21600</p>|
|Type of cartridge - cyan|<p>-</p>|`SNMP agent`|cyan.cartridge.type<p>Update: 21600</p>|
|Max cartridge toner level - yellow|<p>-</p>|`SNMP agent`|ink.yellow.max<p>Update: 3600</p>|
|Drum Yellow (R4) in %|<p>-</p>|`SNMP agent`|drum.yellow.now<p>Update: 3600</p>|
|Type of cartridge - magenta|<p>-</p>|`SNMP agent`|magenta.cartridge.type<p>Update: 21600</p>|
|Toner Black in %|<p>-</p>|`Calculated`|black.cartridge.toner<p>Update: 600</p>|
|Pages Black/White|<p>-</p>|`SNMP agent`|pages.printed.black<p>Update: 10800</p>|
|Drum Magenta (R3)  in %|<p>-</p>|`SNMP agent`|drum.magenta.now<p>Update: 3600</p>|
|Toner Waste Container in %|<p>-</p>|`Calculated`|waste.toner<p>Update: 600</p>|
|Toner Yellow in %|<p>-</p>|`Calculated`|yellow.cartridge.toner<p>Update: 600</p>|
|Type of drum - black|<p>-</p>|`SNMP agent`|black.drum.type<p>Update: 21600</p>|
|Current cartridge toner level - cyan|<p>-</p>|`SNMP agent`|ink.cyan.now<p>Update: 600</p>|
|Current cartridge toner level - magenta|<p>-</p>|`SNMP agent`|ink.magenta.now<p>Update: 600</p>|
|Type of cartridge - black|<p>-</p>|`SNMP agent`|black.cartridge.type<p>Update: 21600</p>|
|Printer model|<p>-</p>|`SNMP agent`|model<p>Update: 21600</p>|
|Current Waste Toner Container|<p>-</p>|`SNMP agent`|waste.toner.now<p>Update: 600</p>|
|Transfer Belt Cleaner in %|<p>-</p>|`SNMP agent`|transfer.belt.cleaner.percent<p>Update: 3600</p>|
|Max cartridge toner level - cyan|<p>-</p>|`SNMP agent`|ink.cyan.max<p>Update: 3600</p>|
|Pages Total|<p>-</p>|`SNMP agent`|pages.printed.total<p>Update: 10800</p>|
|Toner Cyan in %|<p>-</p>|`Calculated`|cyan.cartridge.toner<p>Update: 600</p>|
|Max cartridge toner level - magenta|<p>-</p>|`SNMP agent`|ink.magenta.max<p>Update: 3600</p>|
|Type of drum - magenta|<p>-</p>|`SNMP agent`|magenta.drum.type<p>Update: 21600</p>|
|Max Waste Toner Container|<p>-</p>|`SNMP agent`|waste.toner.max<p>Update: 600</p>|
|Type of toner waste Container|<p>-</p>|`SNMP agent`|waste.toner.type<p>Update: 21600</p>|
|Drum Black (R1) in %|<p>-</p>|`SNMP agent`|drum.black.now<p>Update: 3600</p>|
|Type of drum - cyan|<p>-</p>|`SNMP agent`|cyan.drum.type<p>Update: 21600</p>|
|Pages Color|<p>-</p>|`SNMP agent`|pages.printed.color<p>Update: 10800</p>|
|Toner Magenta in %|<p>-</p>|`Calculated`|magenta.cartridge.toner<p>Update: 600</p>|
|Max cartridge toner level - black|<p>-</p>|`SNMP agent`|ink.black.max<p>Update: 3600</p>|
|Second Transfer Roller in %|<p>-</p>|`SNMP agent`|second.btr.transfer.roller.percent<p>Update: 3600</p>|
|Drum Cyan (R2) in %|<p>-</p>|`SNMP agent`|drum.cyan.now<p>Update: 3600</p>|
|Type of cartridge - yellow|<p>-</p>|`SNMP agent`|yellow.cartridge.type<p>Update: 21600</p>|
|Current cartridge toner level - yellow|<p>-</p>|`SNMP agent`|ink.yellow.now<p>Update: 600</p>|
|Current cartridge toner level - black|<p>-</p>|`SNMP agent`|ink.black.now<p>Update: 600</p>|


## Triggers

There are no triggers in this template.

