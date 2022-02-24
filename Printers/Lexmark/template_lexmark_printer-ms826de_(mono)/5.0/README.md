# SNMP - Lexmark MS826de MONO

## Overview

Lexmark Printer **SNMP** template for model **Lexmark MS826de** (**Mono**)


note : every new lexmark model in 2018/2019 seem to have specific OIDs depending on the modules in the printer, therefore i made many templates for each model i've been working on.


i plan to add other triggers late (such as detect paper jams etc.).


At the moment all templates can monitor all basic things, and all modules (toners, photoconductors, waste boxes etc.) as well as ping the machine to ensure it's available (you might want to modify triggers to lower/higher values if required)


if required, replace Zabbix version from 3.4 to 3.0 in the XML to make it work on 3.0


also, MONO templates seem to work on many models (e.g MS622de/MS826de have the same OIDs)


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
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|Imaging Unit capacity|<p>-</p>|`SNMP agent`|ImagingUnitMaxCapacity<p>Update: 3600</p>|
|Toner print capacity (black cartridge capacity)|<p>-</p>|`SNMP agent`|prtMarkerSuppliesMaxCapacity<p>Update: 3600</p>|
|Ping Printer|<p>-</p>|`Simple check`|icmpping[,5,,,]<p>Update: 120s</p>|
|Printer Status|<p>-</p>|`SNMP agent`|prtConsoleDescription<p>Update: 60</p>|
|02 Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|05 Device Serial Number|<p>-</p>|`SNMP agent`|serialNumber<p>Update: 3600</p>|
|01 Device model|<p>-</p>|`SNMP agent`|deviceModel<p>Update: 30</p>|
|Device Manufacturer|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|deviceManufacturer<p>Update: 3600</p>|
|04 Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Page Counter|<p>-</p>|`SNMP agent`|prtMarkerLifeCount<p>Update: 60</p>|
|Maintenance Kit capacity|<p>-</p>|`SNMP agent`|MaintenanceKitMaxCapacity<p>Update: 3600</p>|
|Imaging Unit level|<p>-</p>|`SNMP agent`|ImagingUnitCurrentLevel<p>Update: 60</p>|
|03 Device contact|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|Maintenance Kit level|<p>-</p>|`SNMP agent`|MaintenanceKitCurrentLevel<p>Update: 60</p>|
|Toner print level (black cartridge)|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevel<p>Update: 60</p>|
|06 Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

