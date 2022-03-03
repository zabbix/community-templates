# Mikrotik Script Execution

## Overview

This template will discover any scripts created in the router which names starts with "Get" (can be customized in the template discovery filter) and will make them available as an item to be plotted in graphics or create triggers and alarms. 



## Author

Antonio Forster

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Scripts|<p>-</p>|`SNMP agent`|MikScript<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Execution of  {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ExecScript.[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

