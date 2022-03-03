# Asigra Backup SNMP Traps

## Overview

This template will store Asigra Client Backup Jobs (failed and successful) in Items. It also includes triggers when a Backup Job fails.


The triggers will NOT auto recover. So user needs to either acknowledge or close the trigger manually. 


Prerequisites:


- SNMP Traps configured and working on Zabbix Server or Proxy.


- Asigra Client needs to be configured to sent SNMP Traps to Zabbix Server or Proxy.


- Host sending the traps needs to be configured with SNMP interface in Zabbix Server Frontend GUI.


 


Tested on Version 4.4.5



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Asigra Backup Completed with Errors - SNMP Traps|<p>-</p>|`SNMP trap`|snmptrap["SNMPv2-SMI::enterprises.15538.1.1.0.2"]<p>Update: 0</p>|
|Asigra Backup Completed - SNMP Traps|<p>-</p>|`SNMP trap`|snmptrap["SNMPv2-SMI::enterprises.15538.1.1.0.1"]<p>Update: 0</p>|
|Asigra Backup Client is running on low database Space - SNMP Traps|<p>-</p>|`SNMP trap`|snmptrap["SNMPv2-SMI::enterprises.15538.1.1.0.6"]<p>Update: 0</p>|
|Asigra Backup Found Bulk Insert Failure - SNMP Traps|<p>-</p>|`SNMP trap`|snmptrap["SNMPv2-SMI::enterprises.15538.1.1.0.4"]<p>Update: 0</p>|
|Asigra Backup Completed with Warnings - SNMP Traps|<p>-</p>|`SNMP trap`|snmptrap["SNMPv2-SMI::enterprises.15538.1.1.0.11"]<p>Update: 0</p>|
|Asigra Backup Failed - SNMP Traps|<p>-</p>|`SNMP trap`|snmptrap["SNMPv2-SMI::enterprises.15538.1.1.0.3"]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

