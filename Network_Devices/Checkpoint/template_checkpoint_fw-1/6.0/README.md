# CheckPoint FW-1

## Overview

Use this template to monitor Checkpoint firewalls CPU, mem, HA status and FW-1 activity.


 


****


 


The following value map must be created for the Checkpoint templates collection :


 


"Checkpoint standard status"


 


0 ⇒ OK


 


1 ⇒ Warning


 


2 ⇒ Error


 


The advsnmp.discovery external script (https://github.com/simonkowallik/Zabbix-Addons/tree/master/advsnmp.discovery) is also needed by most templates.


Last, the SNMP items reference the CHECKPOINT-MIB (chkpnt.mib, see https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit\_doGoviewsolutiondetails=&solutionid=sk90470#Check Point SNMP MIB files for all products) so it must be properly installed on your Zabbix server.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|HA Status|<p>-</p>|`External check`|advsnmp.discovery[{HOSTNAME},"-v2c -c{$SNMP_COMMUNITY}",1.3.6.1.4.1.2620.1.5.13.1.2,1.3]<p>Update: 240</p>|
|Processor Discovery|<p>-</p>|`External check`|advsnmp.discovery[{HOSTNAME},"-v2c -c{$SNMP_COMMUNITY}",1.3.6.1.4.1.2620.1.6.7.5.1.1,1.3]<p>Update: 240</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Product Version|<p>-</p>|`SNMP agent`|svnVersion<p>Update: 3600</p>|
|Firewall Module State|<p>-</p>|`SNMP agent`|fwModuleState<p>Update: 900</p>|
|Firewall Policy Install Time|<p>-</p>|`SNMP agent`|fwInstallTime<p>Update: 900</p>|
|High Availability Mode|<p>-</p>|`SNMP agent`|haWorkMode<p>Update: 900</p>|
|Number of current connections|<p>-</p>|`SNMP agent`|fwNumConn<p>Update: 120</p>|
|Memory Used|<p>-</p>|`SNMP agent`|memActiveReal<p>Update: 120</p>|
|Memory Total|<p>-</p>|`SNMP agent`|memTotalReal<p>Update: 120</p>|
|High Availability State|<p>-</p>|`SNMP agent`|haState<p>Update: 900</p>|
|Memory Free|<p>-</p>|`SNMP agent`|memFreeReal<p>Update: 120</p>|
|HA Problem Status {#ADVSNMPVALUE}|<p>-</p>|`SNMP agent`|haProblemStatus[{#ADVSNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Processor {#ADVSNMPVALUE} Idle Time|<p>-</p>|`SNMP agent`|multiProcIdleTime[{#ADVSNMPVALUE}]<p>Update: 90</p><p>LLD</p>|
|Processor {#ADVSNMPVALUE} System Time|<p>-</p>|`SNMP agent`|multiProcSystemTime[{#ADVSNMPVALUE}]<p>Update: 90</p><p>LLD</p>|
|Processor {#ADVSNMPVALUE} User Time|<p>-</p>|`SNMP agent`|multiProcUserTime[{#ADVSNMPVALUE}]<p>Update: 90</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|HA Status [{#ADVSNMPVALUE}]|<p>-</p>|<p>**Expression**: find(/CheckPoint FW-1/haProblemStatus[{#ADVSNMPVALUE}],,"like","OK")=0</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} Processor usage high on CPU {#ADVSNMPVALUE}|<p>-</p>|<p>**Expression**: avg(/CheckPoint FW-1/multiProcIdleTime[{#ADVSNMPVALUE}],300s)<25</p><p>**Recovery expression**: </p>|average|
|HA Status [{#ADVSNMPVALUE}] (LLD)|<p>-</p>|<p>**Expression**: find(/CheckPoint FW-1/haProblemStatus[{#ADVSNMPVALUE}],,"like","OK")=0</p><p>**Recovery expression**: </p>|average|
|{HOSTNAME} Processor usage high on CPU {#ADVSNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: avg(/CheckPoint FW-1/multiProcIdleTime[{#ADVSNMPVALUE}],300s)<25</p><p>**Recovery expression**: </p>|average|
