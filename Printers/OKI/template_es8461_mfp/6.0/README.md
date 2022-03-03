# OKI Printer

## Overview

I created this template for my office printer OKI ES8461 MFP.


Not sure if it works with any other models.


Let us know in comments.



## Author

Slawek Glebocki

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Belt|<p>-</p>|`SNMP agent`|belt<p>Update: 600</p>|
|Fuser|<p>-</p>|`SNMP agent`|fuser<p>Update: 600</p>|
|Cyan Toner|<p>-</p>|`SNMP agent`|toner.lvl.cyan[available]<p>Update: 600</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Yellow Toner|<p>-</p>|`SNMP agent`|toner.lvl.yellow[available]<p>Update: 600</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|Black Toner|<p>-</p>|`SNMP agent`|toner.lvl.black[available]<p>Update: 600</p>|
|Black Drum|<p>-</p>|`SNMP agent`|black.drum<p>Update: 600</p>|
|Cyan Drum|<p>-</p>|`SNMP agent`|cyan.drum<p>Update: 600</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|Magenta Toner|<p>-</p>|`SNMP agent`|toner.lvl.magneta[available]<p>Update: 600</p>|
|Magenta Drum|<p>-</p>|`SNMP agent`|magenta.drum<p>Update: 600</p>|
|Yellow Drum|<p>-</p>|`SNMP agent`|yellow.drum<p>Update: 600</p>|


## Triggers

There are no triggers in this template.

