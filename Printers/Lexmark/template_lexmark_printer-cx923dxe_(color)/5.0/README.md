# SNMP - Lexmark CX923dxe COLOR

## Overview

Lexmark Printer **SNMP** template for model **Lexmark CX923dxe** (**Color**)


note : every new lexmark model in 2018/2019 seem to have specific OIDs depending on the modules in the printer, therefore i made many templates for each model i've been working on.


i plan to add other triggers late (such as detect paper jams etc.).


At the moment all templates can monitor all basic things, and all modules (toners, photoconductors, waste boxes etc.) as well as ping the machine to ensure it's available (you might want to modify triggers to lower/higher values if required)


if required, replace Zabbix version from 3.4 to 3.0 in the XML to make it work on 3.0


**note : template edited on April 6th 2019 to fix issues with triggers, now triggering everything at 15% levels (with high capacity toners)**



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
|MAGENTA Photoconductor capacity|<p>-</p>|`SNMP agent`|MagentaPhotoconductorCapacity<p>Update: 3600</p>|
|200K MPF Maintenance Kit Level|<p>-</p>|`SNMP agent`|200KMPFMaintenanceKitLevel<p>Update: 3600</p>|
|Fuser Kit Level|<p>-</p>|`SNMP agent`|FuserKitLevel<p>Update: 3600</p>|
|Waste Toner Bottle Level|<p>-</p>|`SNMP agent`|WasteTonerBottleLevel<p>Update: 3600</p>|
|Color Developer kit (CMY) capacity|<p>-</p>|`SNMP agent`|ColorDeveloperkitCapacity<p>Update: 3600</p>|
|03 Device contact|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|Toner Level MAGENTA|<p>-</p>|`SNMP agent`|prtMagentaTonerLevel<p>Update: 60</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|Device Manufacturer|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|deviceManufacturer<p>Update: 3600</p>|
|Toner capacity MAGENTA|<p>-</p>|`SNMP agent`|prtMagentaTonerMaxCapacity<p>Update: 3600</p>|
|Printer Status|<p>-</p>|`SNMP agent`|prtConsoleDisplayBufferText<p>Update: 60</p>|
|Waste Toner Bottle capacity|<p>-</p>|`SNMP agent`|WasteTonerBottleCapacity<p>Update: 3600</p>|
|Toner capacity BLACK|<p>-</p>|`SNMP agent`|prtBlackTonerMaxCapacity<p>Update: 3600</p>|
|BLACK Developer capacity|<p>-</p>|`SNMP agent`|BlackDeveloperCapacity<p>Update: 3600</p>|
|CYAN Photoconductor level|<p>-</p>|`SNMP agent`|CyanPhotoconductorLevel<p>Update: 1800</p>|
|Hole Punch Box capacity|<p>-</p>|`SNMP agent`|HolePunchBoxCapacity<p>Update: 3600</p>|
|YELLOW Photoconductor level|<p>-</p>|`SNMP agent`|YellowPhotoconductorLevel<p>Update: 1800</p>|
|Hole Punch Box Level|<p>-</p>|`SNMP agent`|HolePunchBoxLevel<p>Update: 3600</p>|
|300K Maintenance Kit capacity|<p>-</p>|`SNMP agent`|300KMaintenanceKitCapacity<p>Update: 3600</p>|
|Staples capacity|<p>-</p>|`SNMP agent`|StaplesCapacity<p>Update: 3600</p>|
|Fuser Kit capacity|<p>-</p>|`SNMP agent`|FuserKitCapacity<p>Update: 3600</p>|
|Page Counter|<p>-</p>|`SNMP agent`|prtMarkerLifeCount<p>Update: 60</p>|
|200K HCF Maintenance Kit Level|<p>-</p>|`SNMP agent`|200KHCFMaintenanceKitLevel<p>Update: 3600</p>|
|MAGENTA Photoconductor level|<p>-</p>|`SNMP agent`|MagentaPhotoconductorLevel<p>Update: 1800</p>|
|02 Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|BLACK Photoconductor capacity|<p>-</p>|`SNMP agent`|BlackPhotoconductorCapacity<p>Update: 3600</p>|
|01 Device model|<p>-</p>|`SNMP agent`|deviceModel<p>Update: 30</p>|
|ADF Kit capacity|<p>-</p>|`SNMP agent`|ADFKitCapacity<p>Update: 3600</p>|
|BLACK Developer level|<p>-</p>|`SNMP agent`|BlackDeveloperLevel<p>Update: 1800</p>|
|Color Developer Kit (CMY) level|<p>-</p>|`SNMP agent`|ColorDeveloperKitLevel<p>Update: 1800</p>|
|200K MPF Maintenance Kit capacity|<p>-</p>|`SNMP agent`|200KMPFMaintenanceKitCapacity<p>Update: 3600</p>|
|06 Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|Toner capacity YELLOW|<p>-</p>|`SNMP agent`|prtYellowTonerMaxCapacity<p>Update: 3600</p>|
|Toner Level YELLOW|<p>-</p>|`SNMP agent`|prtYellowTonerLevel<p>Update: 60</p>|
|Ping Printer|<p>-</p>|`Simple check`|icmpping[,5,,,]<p>Update: 120s</p>|
|04 Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|200K HCF Maintenance Kit capacity|<p>-</p>|`SNMP agent`|200KHCFMaintenanceKitCapacity<p>Update: 3600</p>|
|Toner Level BLACK|<p>-</p>|`SNMP agent`|prtBlackTonerLevel<p>Update: 60</p>|
|Toner Level CYAN|<p>-</p>|`SNMP agent`|prtCyanTonerLevel<p>Update: 60</p>|
|BLACK Photoconductor level|<p>-</p>|`SNMP agent`|BlackPhotoconductorLevel<p>Update: 1800</p>|
|300K Maintenance Kit Level|<p>-</p>|`SNMP agent`|300KMaintenanceKitLevel<p>Update: 3600</p>|
|ADF Kit level|<p>-</p>|`SNMP agent`|ADFKitLevel<p>Update: 1800</p>|
|CYAN Photoconductor capacity|<p>-</p>|`SNMP agent`|CyanPhotoconductorCapacity<p>Update: 3600</p>|
|Staples level|<p>-</p>|`SNMP agent`|StaplesLevel<p>Update: 1800</p>|
|05 Device Serial Number|<p>-</p>|`SNMP agent`|serialNumber<p>Update: 3600</p>|
|Toner capacity CYAN|<p>-</p>|`SNMP agent`|prtCyanTonerMaxCapacity<p>Update: 3600</p>|
|YELLOW Photoconductor capacity|<p>-</p>|`SNMP agent`|YellowPhotoconductorCapacity<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

