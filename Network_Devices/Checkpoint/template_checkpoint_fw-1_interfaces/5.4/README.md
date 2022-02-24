# CheckPoint FW-1 Interfaces

## Overview

Use this template to monitor Checkpoint firewalls interfaces and packet filtering.


****


The following value map must be created for the Checkpoint templates collection :


"Checkpoint standard status"


0 ⇒ OK


1 ⇒ Warning


2 ⇒ Error


The advsnmp.discovery external script (<https://github.com/simonkowallik/Zabbix-Addons/tree/master/advsnmp.discovery>) is also needed by most templates.


Last, the SNMP items reference the CHECKPOINT-MIB (chkpnt.mib, see https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit\_doGoviewsolutiondetails=&solutionid=sk90470#Check Point SNMP MIB files for all products) so it must be properly installed on your Zabbix server.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interfaces Discovery|<p>-</p>|`External check`|advsnmp.discovery[{HOSTNAME},"-v2c -c{$SNMP_COMMUNITY}",1.3.6.1.4.1.2620.1.1.25.5.1.2,1.3]<p>Update: 900</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interface {#ADVSNMPVALUE} fwAcceptBytesIn|<p>-</p>|`SNMP agent`|fwAcceptBytesIn["{#ADVSNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Interface {#ADVSNMPVALUE} fwAcceptBytesOut|<p>-</p>|`SNMP agent`|fwAcceptBytesOut["{#ADVSNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Interface {#ADVSNMPVALUE} fwAcceptPcktsIn|<p>-</p>|`SNMP agent`|fwAcceptPcktsIn["{#ADVSNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Interface {#ADVSNMPVALUE} fwAcceptPcktsOut|<p>-</p>|`SNMP agent`|fwAcceptPcktsOut["{#ADVSNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Interface {#ADVSNMPVALUE} fwDropPcktsIn|<p>-</p>|`SNMP agent`|fwDropPcktsIn["{#ADVSNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Interface {#ADVSNMPVALUE} fwDropPcktsOut|<p>-</p>|`SNMP agent`|fwDropPcktsOut["{#ADVSNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Interface {#ADVSNMPVALUE} fwRejectPcktsIn|<p>-</p>|`SNMP agent`|fwRejectPcktsIn["{#ADVSNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|
|Interface {#ADVSNMPVALUE} fwRejectPcktsOut|<p>-</p>|`SNMP agent`|fwRejectPcktsOut["{#ADVSNMPVALUE}"]<p>Update: 120</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

