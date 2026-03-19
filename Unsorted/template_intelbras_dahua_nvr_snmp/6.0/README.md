# calix

## Overview

Very Basic template to discovery and graph traffic in and out of Calix interfaces. Tested with E7-2 shelfs and Zabbix 3.4.


 


It may take up to 10 minutes for the graphs to discover and display after added the device and applying the template.



## Author

City of Windom-TF

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Calix Interfaces|<p>-</p>|`SNMP agent`|discovery.ifName<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#SNMPVALUE} - Inbound traffic|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.10.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound traffic|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.16.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

