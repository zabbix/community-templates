# SNMP - Lexmark CS820de COLOR

## Overview

Lexmark Printer **SNMP** template for model **Lexmark CS820de** (**Color**)


note : every new lexmark model in 2018/2019 seem to have specific OIDs depending on the modules in the printer, therefore i made many templates for each model i've been working on.


i plan to add other triggers late (such as detect paper jams etc.).


At the moment all templates can monitor all basic things, and all modules (toners, photoconductors, waste boxes etc.) as well as ping the machine to ensure it's available (you might want to modify triggers to lower/higher values if required)


if required, replace Zabbix version from 3.4 to 3.0 in the XML to make it work on 3.0


**note : template edited on April 6th 2019 to fix issues with triggers, now triggering everything at 15% levels.**


 



## Author

Olivier GRIFFIN

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|CYAN Photoconductor level|<p>-</p>|`SNMP agent`|CyanPhotoconductorLevel<p>Update: 1800</p>|
|Transfer Module Level|<p>-</p>|`SNMP agent`|TransferModuleLevel<p>Update: 3600</p>|
|Toner Level BLACK|<p>-</p>|`SNMP agent`|prtBlackTonerLevel<p>Update: 60</p>|
|BLACK Photoconductor capacity|<p>-</p>|`SNMP agent`|BlackPhotoconductorCapacity<p>Update: 3600</p>|
|01 Device model|<p>-</p>|`SNMP agent`|deviceModel<p>Update: 30</p>|
|Toner capacity MAGENTA|<p>-</p>|`SNMP agent`|prtMagentaTonerMaxCapacity<p>Update: 3600</p>|
|Toner Level MAGENTA|<p>-</p>|`SNMP agent`|prtMagentaTonerLevel<p>Update: 60</p>|
|03 Device contact|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|MAGENTA Developer level|<p>-</p>|`SNMP agent`|MagentaDeveloperLevel<p>Update: 1800</p>|
|Fuser Level|<p>-</p>|`SNMP agent`|FuserLevel<p>Update: 3600</p>|
|YELLOW Developer capacity|<p>-</p>|`SNMP agent`|YellowDeveloperCapacity<p>Update: 3600</p>|
|02 Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|Toner capacity YELLOW|<p>-</p>|`SNMP agent`|prtYellowTonerMaxCapacity<p>Update: 3600</p>|
|05 Device Serial Number|<p>-</p>|`SNMP agent`|serialNumber<p>Update: 3600</p>|
|YELLOW Photoconductor level|<p>-</p>|`SNMP agent`|YellowPhotoconductorLevel<p>Update: 1800</p>|
|Toner Level CYAN|<p>-</p>|`SNMP agent`|prtCyanTonerLevel<p>Update: 60</p>|
|MAGENTA Photoconductor level|<p>-</p>|`SNMP agent`|MagentaPhotoconductorLevel<p>Update: 1800</p>|
|YELLOW Developer level|<p>-</p>|`SNMP agent`|YellowDeveloperLevel<p>Update: 1800</p>|
|YELLOW Photoconductor capacity|<p>-</p>|`SNMP agent`|YellowPhotoconductorCapacity<p>Update: 3600</p>|
|Toner capacity CYAN|<p>-</p>|`SNMP agent`|prtCyanTonerMaxCapacity<p>Update: 3600</p>|
|CYAN Photoconductor capacity|<p>-</p>|`SNMP agent`|CyanPhotoconductorCapacity<p>Update: 3600</p>|
|04 Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|CYAN Developer level|<p>-</p>|`SNMP agent`|CyanDeveloperLevel<p>Update: 1800</p>|
|Waste Toner Bottle Level|<p>-</p>|`SNMP agent`|WasteTonerBottleLevel<p>Update: 3600</p>|
|Ping Printer|<p>-</p>|`Simple check`|icmpping[,5,,,]<p>Update: 120s</p>|
|06 Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|Page Counter|<p>-</p>|`SNMP agent`|prtMarkerLifeCount<p>Update: 60</p>|
|Toner capacity BLACK|<p>-</p>|`SNMP agent`|prtBlackTonerMaxCapacity<p>Update: 3600</p>|
|BLACK Developer level|<p>-</p>|`SNMP agent`|BlackDeveloperLevel<p>Update: 1800</p>|
|BLACK Photoconductor level|<p>-</p>|`SNMP agent`|BlackPhotoconductorLevel<p>Update: 1800</p>|
|MAGENTA Photoconductor capacity|<p>-</p>|`SNMP agent`|MagentaPhotoconductorCapacity<p>Update: 3600</p>|
|MAGENTA Developer capacity|<p>-</p>|`SNMP agent`|MagentaDeveloperCapacity<p>Update: 3600</p>|
|Transfer Module capacity|<p>-</p>|`SNMP agent`|TransferModuleCapacity<p>Update: 3600</p>|
|Printer Status|<p>-</p>|`SNMP agent`|prtConsoleDisplayBufferText<p>Update: 60</p>|
|BLACK Developer capacity|<p>-</p>|`SNMP agent`|BlackDeveloperCapacity<p>Update: 3600</p>|
|Fuser capacity|<p>-</p>|`SNMP agent`|FuserCapacity<p>Update: 3600</p>|
|CYAN Developer capacity|<p>-</p>|`SNMP agent`|CyanDeveloperCapacity<p>Update: 3600</p>|
|Waste Toner Bottle capacity|<p>-</p>|`SNMP agent`|WasteTonerBottleCapacity<p>Update: 3600</p>|
|Device Manufacturer|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|deviceManufacturer<p>Update: 3600</p>|
|Toner Level YELLOW|<p>-</p>|`SNMP agent`|prtYellowTonerLevel<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

