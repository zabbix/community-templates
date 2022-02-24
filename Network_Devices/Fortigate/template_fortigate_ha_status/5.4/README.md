# Fortigate HA Sync

## Description

BY EAS *************** CONTACT erik@tndbrasil.com.br Facebook: https://www.facebook.com/easerik Instagram: https://www.instagram.com/easerik Linkedin: https://www.linkedin.com/in/easerik/

## Overview

**Fortigate HA Sync**


*********************


***Itens***


 *Ha Group Name*


*Ha System Mode*


*Ha Stats Sync Status*


*Ha Auto Sync*


****************************


**Triggers**


HA - {HOST.NAME} - UnSynchronized


HA Auto Sync- {HOST.NAME} - Disable


****************************


**Teste**


 Fortigate 100E / Fortigate 60E / Fortigate 30E


*************************************


**Firmware**


6.2/ 6.1



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Ha Group Name|<p>-</p>|`SNMP agent`|fgHaGroupName<p>Update: 1d</p>|
|Ha System Mode|<p>FgHaMode (INTEGER) {standalone(1), activeActive(2), activePassive(3) }</p>|`SNMP agent`|fgHaSystemMode<p>Update: 3600s</p>|
|Ha Auto Sync|<p>FnBoolState (INTEGER) {disabled (1), enabled (2)</p>|`SNMP agent`|fgHaAutoSync<p>Update: 1h</p>|
|Ha Stats Sync Status|<p>FgHaStatsSyncStatusType (INTEGER) {unsynchronized(0), synchronized(1) }</p>|`SNMP agent`|fgHaStatsSyncStatus<p>Update: 600s</p>|


## Triggers

There are no triggers in this template.

