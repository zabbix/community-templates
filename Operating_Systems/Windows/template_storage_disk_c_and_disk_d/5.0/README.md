# Storage

## Overview

Мониторинг свободного места на диске С и диске D используя только SNMP.


Важно не подключать диск А, меняются OID



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disc C: Total space GB|<p>-</p>|`Calculated`|DiscCTotalspaceGB<p>Update: 60s</p>|
|Disc C: Used space GB|<p>-</p>|`Calculated`|DiscCUsedspaceGB<p>Update: 60s</p>|
|Disc D: module|<p>-</p>|`SNMP agent`|Dmodule<p>Update: 60s</p>|
|Disc C: Used space|<p>-</p>|`SNMP agent`|DiscCUsedspace<p>Update: 60s</p>|
|Disc D: Total space GB|<p>-</p>|`Calculated`|DiscDTotalspaceGB<p>Update: 60s</p>|
|Disc D: Used space GB|<p>-</p>|`Calculated`|DiscDUsedspaceGB<p>Update: 60s</p>|
|Disc D: Free space GB|<p>-</p>|`Calculated`|DiscDFreeSpace<p>Update: 60s</p>|
|Disc C: Free space GB|<p>-</p>|`Calculated`|DiscCFreeSpace<p>Update: 60s</p>|
|Disc D: Used space|<p>-</p>|`SNMP agent`|DiscDUsedspace<p>Update: 60s</p>|
|Disc C: module|<p>-</p>|`SNMP agent`|Cmodule<p>Update: 60s</p>|
|Disc D: Total space|<p>-</p>|`SNMP agent`|DiscDTotalspace<p>Update: 60s</p>|
|Disc C: Total space|<p>-</p>|`SNMP agent`|DiscCTotalspace<p>Update: 60s</p>|


## Triggers

There are no triggers in this template.

