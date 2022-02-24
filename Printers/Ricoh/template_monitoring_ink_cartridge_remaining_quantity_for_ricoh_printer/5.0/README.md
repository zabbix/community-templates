# Ricoh color printer

## Overview

It is the template for aIt is the template for an ink level monitored as "**gel jet color printer**" in Ricoh.


A warning trigger is activated when the ink remaining falls below 5%  
A mild failed trigger will be activated when the remaining amount increases in the + direction and the ink remaining amount reaches 0% after the cartridge is changed.  
If you send an e-mail with this trigger in Zabbix action, you can change an consumable cartridges automatically.


From Zabbix 2.2 onwards GXe series, they works but I guess from Zabbix 2.0 it will work as well.  
Also in the GX series I guess it will work unless SNMP is interrupted with a sleep mode. (it doesn't work actally)


**Update information:**  
I can monitor the free space of the wasted ink box from the SG series  
whose value decreases from 100% (empty) to 0% (full).  
Attention  
Regarding to the waste ink box, we set the item but we do not register the trigger.  




## Author

Toshihiro_SKK

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Full color|<p>-</p>|`SNMP agent`|fullcolor<p>Update: 600;3600/1-6,19:00-24:00;3600/1-6,00:00-08:00;3600/7,00:00-24:00</p>|
|Save color|<p>-</p>|`SNMP agent`|saveprint<p>Update: 600;3600/1-6,19:00-24:00;3600/1-6,00:00-08:00;3600/7,00:00-24:00</p>|
|Current volume of red ink|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevelmagen<p>Update: 180;3600/7,00:00-24:00</p>|
|Current volume of yellow ink|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevelyellow<p>Update: 180;3600/7,00:00-24:00</p>|
|Current capacity of blue ink|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevelcyan<p>Update: 180;3600/7,00:00-24:00</p>|
|Waste ink box free space|<p>Place where the waste ink at the ink head cleaning is discarded. If this becomes full, the printer will not be able to print, so please change it by then.</p>|`SNMP agent`|prtMarkerSuppliesLeveldustBOX<p>Update: 1800;3600/1-5,00:00-08:00;3600/6-7,00:00-24:00;3600/1-5,19:00-24:00</p>|
|all print|<p>-</p>|`SNMP agent`|allprint<p>Update: 600;3600/1-6,19:00-24:00;3600/1-6,00:00-08:00;3600/7,00:00-24:00</p>|
|mono color|<p>-</p>|`SNMP agent`|monoprint<p>Update: 600;3600/1-6,19:00-24:00;3600/1-6,00:00-08:00;3600/7,00:00-24:00</p>|
|Current capacity of black ink|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevelblack<p>Update: 180;3600/7,00:00-24:00</p>|


## Triggers

There are no triggers in this template.

