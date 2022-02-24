# Halley Synology NAS Backup

## Description

Is the template for the service NAS Backup. Will contain only items for discover and monitor de NAS backup instances

## Overview

All processes are described here:


https://github.com/tudorticau/Synology-Backup-LLD-Monitor


First step: setup syslogserver


Second: configure zabbix to monitor using LLD


All is tested and already implemented on production: over 40 NAS


Template have 1 item and 1 trigger, but is LLD - this mean you don't have to take care how your admins will add and name the backup processes: all is done automatically


 


 



## Author

Tudor Ticau

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$BPERIOD1}|<p>-</p>|`1d`|Text macro|
|{$BPERIOD2}|<p>-</p>|`1d`|Text macro|
|{$BPERIOD3}|<p>-</p>|`1d`|Text macro|
|{$NAS.IP}|<p>-</p>|`{HOST.IP2}`|Text macro|
|{$SNMP_COMMUNITY}|<p>-</p>|`MonitorZabbix`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BACKUP: Backup tasks|<p>Discover backup tasks with the script from /var/log/remotelog/synobackup.sh</p>|`Zabbix agent`|backup[{$NAS.IP}]<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Backup "{#BPNAME}" status|<p>Monitor the backup {#BPNAME} status and return date and task status. This backup is configured to be done every {$BPERIOD1}</p>|`Zabbix agent`|backupt[{$NAS.IP},{#BPNAME}]<p>Update: {$BPERIOD1}</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Backup "{#BPNAME}" has an error|<p>Backup "{#BPNAME}" has an error. Maybe the new backup was not done or has been completed with errors. Check the status of backup configured by Backup or HyperBackup utility NAS IP: {$NAS.IP} Backup "{#BPNAME}" is done every: {$BPERIOD1}</p>|<p>**Expression**: find(/Halley Synology NAS Backup/backupt[{HOST.IP2},{#BPNAME}],#1,"like","Failed to run backup task")=1 or find(/Halley Synology NAS Backup/backupt[{HOST.IP2},{#BPNAME}],#1,"like","Backup task was cancelled")=1</p><p>**Recovery expression**: </p>|high|
|Backup "{#BPNAME}" has an error (LLD)|<p>Backup "{#BPNAME}" has an error. Maybe the new backup was not done or has been completed with errors. Check the status of backup configured by Backup or HyperBackup utility NAS IP: {$NAS.IP} Backup "{#BPNAME}" is done every: {$BPERIOD1}</p>|<p>**Expression**: find(/Halley Synology NAS Backup/backupt[{HOST.IP2},{#BPNAME}],#1,"like","Failed to run backup task")=1 or find(/Halley Synology NAS Backup/backupt[{HOST.IP2},{#BPNAME}],#1,"like","Backup task was cancelled")=1</p><p>**Recovery expression**: </p>|high|
