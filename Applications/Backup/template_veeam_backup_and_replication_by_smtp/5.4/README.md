# VEEAM SMTP trapper

## Overview

This Veeam Backup & Replication use email and not Powershell snippet. It is as efficient (or more) as other method of integration with Zabbix and it requires a lot less ressources. It monitors even Backup Database backup (which others do not).


 


Using a specific script it can be applied to Free Agents as well.


 


It uses zbxsmtptrap (on an idea from here : <https://www.zabbix.com/forum/showthread.php?p=186838>)


<https://github.com/sibiodev/zbxsmtptrap>


NB: a bug was recently corrected about Veeam sending multiline subjects - not really nice... but it can happen if you have long hostnames and happen to be sudenly out of support (which adds some garbage at the begining of the title)


 


Give it a try!


 


PS: to use this script with Veeam Free Agents without a VBR server (if you use a VBR server with a Free Agent, then you do not need this script because VBR will report by email to you), you'll need this small script to send the email :


<https://github.com/sibiodev/veeamrun>


 



## Author

Raynald de Lahondès

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$BACKUP_PERIODICITY}|<p>-</p>|`52h`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Job Discovery|<p>-</p>|`Zabbix trapper`|smtp.trap.subject.discovery[veeamjob]<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Job {#VEEAMJOB} message|<p>-</p>|`Zabbix trapper`|smtp.trap.subject.match.body[veeamjob,{#VEEAMJOB}]<p>Update: 0</p><p>LLD</p>|
|Job {#VEEAMJOB} status|<p>-</p>|`Zabbix trapper`|smtp.trap.subject.match[veeamjob,{#VEEAMJOB},status]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Failure of job {#VEEAMJOB}|<p>-</p>|<p>**Expression**: find(/VEEAM SMTP trapper/smtp.trap.subject.match[veeamjob,{#VEEAMJOB},status],,"like","Failed")=1</p><p>**Recovery expression**: </p>|high|
|Job {#VEEAMJOB} did not occur last {$BACKUP_PERIODICITY:"{#VEEAMJOB}"}|<p>-</p>|<p>**Expression**: nodata(/VEEAM SMTP trapper/smtp.trap.subject.match[veeamjob,{#VEEAMJOB},status],52h)=1</p><p>**Recovery expression**: </p>|high|
|Warning on job {#VEEAMJOB}|<p>-</p>|<p>**Expression**: find(/VEEAM SMTP trapper/smtp.trap.subject.match[veeamjob,{#VEEAMJOB},status],,"like","Warning")=1</p><p>**Recovery expression**: </p>|warning|
|Failure of job {#VEEAMJOB} (LLD)|<p>-</p>|<p>**Expression**: find(/VEEAM SMTP trapper/smtp.trap.subject.match[veeamjob,{#VEEAMJOB},status],,"like","Failed")=1</p><p>**Recovery expression**: </p>|high|
|Job {#VEEAMJOB} did not occur last {$BACKUP_PERIODICITY:"{#VEEAMJOB}"} (LLD)|<p>-</p>|<p>**Expression**: nodata(/VEEAM SMTP trapper/smtp.trap.subject.match[veeamjob,{#VEEAMJOB},status],52h)=1</p><p>**Recovery expression**: </p>|high|
|Warning on job {#VEEAMJOB} (LLD)|<p>-</p>|<p>**Expression**: find(/VEEAM SMTP trapper/smtp.trap.subject.match[veeamjob,{#VEEAMJOB},status],,"like","Warning")=1</p><p>**Recovery expression**: </p>|warning|
