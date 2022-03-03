# OKI

## Overview

A template to check supplies on OKIDATA printers (you'll need the OKIDATA MIB).


It provides items and triggers for toner, drum, fuser and belt levels as well as a simple paper count.


I've been using it with an OKI C5950 and an OKI C610 printer.


You'll need to add a 'zabbix' snmp read community on your printer (from the Admin webpage choose Network->SNMP->Settings->Step2) or change the community to 'public' within the template.


Triggers will be activated at 11% for toner and 10% for drums, belt and fuser unit, which should be ample time to restack on supplies unless you're really printing loads of pages.


EDIT: 2017-06-01 Updated this for adjusted trigger levels on toner and drums as the chosen ones were too low.



## Author

Korbinian Grote

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fuser level %|<p>-</p>|`Calculated`|FuserLevelPercCalc<p>Update: 300</p>|
|Cyan Toner Level %|<p>-</p>|`SNMP agent`|usageTonerCurrentLevel.2<p>Update: 300</p>|
|Black Drum max|<p>-</p>|`SNMP agent`|usageDrumMaxLevel.1<p>Update: 300</p>|
|Belt level %|<p>-</p>|`Calculated`|BeltLevelPercCalc<p>Update: 300</p>|
|Cyan Drum max|<p>-</p>|`SNMP agent`|usageDrumMaxLevel.2<p>Update: 300</p>|
|Yellow Drum level %|<p>-</p>|`Calculated`|yellowDrumLevelPercCalc<p>Update: 300</p>|
|Magenta Drum level %|<p>-</p>|`Calculated`|magentaDrumLevelPercCalc<p>Update: 300</p>|
|Yellow Toner Level %|<p>-</p>|`SNMP agent`|usageTonerCurrentLevel.4<p>Update: 300</p>|
|Fuser max level|<p>-</p>|`SNMP agent`|usageFuserMaxLevel.1<p>Update: 300</p>|
|Black Toner Level %|<p>-</p>|`SNMP agent`|usageTonerCurrentLevel.1<p>Update: 300</p>|
|Belt count|<p>-</p>|`SNMP agent`|usageBeltCurrentLevel.1<p>Update: 300</p>|
|Magenta Drum count|<p>-</p>|`SNMP agent`|usageDrumCurrentLevel.3<p>Update: 300</p>|
|Total pages printed|<p>-</p>|`SNMP agent`|usagePrinterUnitCounter.1<p>Update: 300</p>|
|Yellow Drum max|<p>-</p>|`SNMP agent`|usageDrumMaxLevel.4<p>Update: 300</p>|
|Magenta Drum max|<p>-</p>|`SNMP agent`|usageDrumMaxLevel.3<p>Update: 300</p>|
|Fuser count|<p>-</p>|`SNMP agent`|usageFuserCurrentLevel.1<p>Update: 300</p>|
|Cyan Drum count|<p>-</p>|`SNMP agent`|usageDrumCurrentLevel.2<p>Update: 300</p>|
|Black Drum count|<p>-</p>|`SNMP agent`|usageDrumCurrentLevel.1<p>Update: 300</p>|
|Belt max level|<p>-</p>|`SNMP agent`|usageBeltMaxLevel.1<p>Update: 300</p>|
|Black Drum level %|<p>-</p>|`Calculated`|blackDrumLevelPercCalc<p>Update: 300</p>|
|Magenta Toner Level %|<p>-</p>|`SNMP agent`|usageTonerCurrentLevel.3<p>Update: 300</p>|
|Yellow Drum count|<p>-</p>|`SNMP agent`|usageDrumCurrentLevel.4<p>Update: 300</p>|
|Cyan Drum level %|<p>-</p>|`Calculated`|cyanDrumLevelPercCalc<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

