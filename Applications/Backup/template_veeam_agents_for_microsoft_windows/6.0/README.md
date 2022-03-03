# VEEAM-Agents

## Overview

This template provide a way to monitor backup made by [Veeam Backup Agent for Microsoft Windows](https://www.veeam.com/windows-cloud-server-backup-agent.html).


There is no additionnals scripts needed, all results are read from the Windows Event Log.


It also monitor the service state of the application.


This template is made with "zabbix active" item, meaning it can work behind remote firewall.


 


 


 



## Author

Cédric MARCOUX

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VeeamAgent_Service|<p>-</p>|`Zabbix agent (active)`|service.info[VeeamEndpointBackupSvc]<p>Update: 5m</p>|
|VeeamAgent_EventLog_Synchronisation|<p>-</p>|`Zabbix agent (active)`|eventlog[Veeam Agent,,,Veeam Agent,195,,skip]<p>Update: 5m</p>|
|VeeamAgent_EventLog_JobResult|<p>-</p>|`Zabbix agent (active)`|eventlog[Veeam Agent,,,Veeam Agent,190,,skip]<p>Update: 5m</p>|
|VeeamAgent_EventLog_JobRetry|<p>-</p>|`Zabbix agent (active)`|eventlog[Veeam Agent,,,Veeam Agent,191,,skip]<p>Update: 5m</p>|


## Triggers

There are no triggers in this template.

