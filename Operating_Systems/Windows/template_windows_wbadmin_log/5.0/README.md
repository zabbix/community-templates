# Event Windows Backup

## Overview

check windows backup (wbadmin tool) event log


tested on win 2012 r2



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Windiws Backup Trouble|<p>-</p>|`Zabbix agent (active)`|eventlog[Microsoft-Windows-Backup,,"Error|Critical|Warning",,,,skip]<p>Update: 300</p>|
|Windows Backup Successful|<p>-</p>|`Zabbix agent (active)`|eventlog[Microsoft-Windows-Backup,,"Information",,4,,skip]<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

