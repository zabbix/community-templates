# Checkpoint VPN-1

## Overview

Use this template to monitor Checkpoint firewalls VPN activity.


 


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

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Current Outbound IPSec SAs|<p>-</p>|`SNMP agent`|cpvCurrEspSAsOut<p>Update: 120</p>|
|Current IKE SAs|<p>-</p>|`SNMP agent`|cpvIKECurrSAs<p>Update: 120</p>|
|VPN Encrypted Packets/s|<p>-</p>|`SNMP agent`|cpvEncPackets<p>Update: 120</p>|
|Current Inbound IPSec SAs|<p>-</p>|`SNMP agent`|cpvCurrEspSAsIn<p>Update: 120</p>|
|VPN Decrypted Packets/s|<p>-</p>|`SNMP agent`|cpvDecPackets<p>Update: 120</p>|


## Triggers

There are no triggers in this template.

