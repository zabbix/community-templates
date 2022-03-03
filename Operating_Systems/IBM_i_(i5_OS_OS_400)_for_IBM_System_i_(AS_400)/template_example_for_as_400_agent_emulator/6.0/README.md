# AS400

## Description

Template for using with our own "agents"

## Overview

It is example of template for AS/400 Zabbix agent emulator from [this project](operating-systems/ibm-i-i5-os-os-400-for-ibm-system-i-as-400/zabbix-agent-emulator-for-as-400-platform).


It was exported from Zabbix server v3.0; but uses too little features that are specific for v3.x (really - only macro with context).


So, it should be possible to import this template on Zabbix v2.x also. Required modifications:


* it is necessary to modify version from "3.0" onto "2.0" at the beginning of template;
* remove entire "value\_maps" section at the end of this file: the appropriate value maps for disk status and ASP status should be created manually;
* replace macro with context **{$MAX\_DISK\_PUSED:"{#FSNAME}"}** by the regular macro **{$MAX\_DISK\_PUSED}** in the trigger prototype of ASP discovery rule (twice: in the trigger's name and in the formula).


## Author

Constantin Oshmyan

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MAX_CPU_FOR_DISCOVERY}|<p>-</p>|`30`|Text macro|
|{$MAX_CPU_PER_PROCESS_PUSED}|<p>-</p>|`20`|Text macro|
|{$MAX_DISK_PUSED}|<p>-</p>|`65`|Text macro|
|{$MAX_QEZ_INCREASE}|<p>-</p>|`400`|Text macro|
|{$MAX_QEZ_SIZE}|<p>-</p>|`50000`|Text macro|
|{$MAX_QPRINT_SIZE}|<p>-</p>|`15000`|Text macro|


## Template links

|Name|
|----|
|Template App Zabbix Agent|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disks discovery|<p>-</p>|`Zabbix agent (active)`|as400.disk.discovery<p>Update: 3600</p>|
|Processes discovery|<p>-</p>|`Zabbix agent (active)`|proc.cpu.util.discovery[{$MAX_CPU_FOR_DISCOVERY}]<p>Update: 60</p>|
|ASP discovery|<p>-</p>|`Zabbix agent (active)`|vfs.fs.discovery<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Size of output queue $1 in library $2|<p>-</p>|`Zabbix agent (active)`|as400.outputqueue.size[QEZDEBUG,QUSRSYS]<p>Update: 900</p>|
|Size of output queue $1 in library $2|<p>-</p>|`Zabbix agent (active)`|as400.outputqueue.size[QPRINT,QGPL]<p>Update: 900</p>|
|Size of output queue $1 in library $2|<p>-</p>|`Zabbix agent (active)`|as400.outputqueue.size[QEZJOBLOG,QUSRSYS]<p>Update: 900</p>|
|Number of users|<p>-</p>|`Zabbix agent (active)`|system.users.num<p>Update: 60</p>|
|System information|<p>-</p>|`Zabbix agent`|system.uname<p>Update: 120</p>|
|Number of jobs in state $3|<p>-</p>|`Zabbix agent (active)`|proc.num[,,LCKW,]<p>Update: 300</p>|
|CPU Usage for all process|<p>-</p>|`Zabbix agent (active)`|proc.cpu.util[,,total,,,]<p>Update: 60</p>|
|Number of running jobs (total)|<p>-</p>|`Zabbix agent (active)`|proc.num[,,run]<p>Update: 300</p>|
|Services availability|<p>-</p>|`Zabbix agent (active)`|as400.services<p>Update: 300</p>|
|Messages in the queue QSYSOPR (errors)|<p>-</p>|`Zabbix agent (active)`|eventlog[QSYSOPR,,70,,,100,skip]<p>Update: 20</p>|
|Disk {#DSK_ID}: {#DSK_NAME} free space|<p>-</p>|`Zabbix agent (active)`|as400.disk.size[{#DSK_SN},free]<p>Update: 300</p><p>LLD</p>|
|Disk {#DSK_ID}: {#DSK_NAME} free space, %|<p>-</p>|`Zabbix agent (active)`|as400.disk.size[{#DSK_SN},pfree]<p>Update: 300</p><p>LLD</p>|
|Disk {#DSK_ID}: {#DSK_NAME} used space, %|<p>-</p>|`Zabbix agent (active)`|as400.disk.size[{#DSK_SN},pused]<p>Update: 300</p><p>LLD</p>|
|Disk {#DSK_ID}: {#DSK_NAME} capacity|<p>-</p>|`Zabbix agent (active)`|as400.disk.size[{#DSK_SN},total]<p>Update: 3600</p><p>LLD</p>|
|Disk {#DSK_ID}: {#DSK_NAME} used space|<p>-</p>|`Zabbix agent (active)`|as400.disk.size[{#DSK_SN},used]<p>Update: 300</p><p>LLD</p>|
|Disk {#DSK_ID}: {#DSK_NAME} ({#DSK_TYPE} {#DSK_MODEL}, {#DSK_SN}) status|<p>-</p>|`Zabbix agent (active)`|as400.disk.state[{#DSK_SN}]<p>Update: 300</p><p>LLD</p>|
|CPU Usage by process $6/$2/$1|<p>-</p>|`Zabbix agent (active)`|proc.cpu.util[{#NAME},{#USER},total,,avg1,{#NUM}]<p>Update: 60</p><p>LLD</p>|
|ASP{#FSNAME} free|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[{#FSNAME},free]<p>Update: 300</p><p>LLD</p>|
|ASP{#FSNAME} free, %|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[{#FSNAME},pfree]<p>Update: 300</p><p>LLD</p>|
|ASP{#FSNAME} pused, %|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[{#FSNAME},pused]<p>Update: 300</p><p>LLD</p>|
|ASP{#FSNAME} capacity|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[{#FSNAME},total]<p>Update: 3600</p><p>LLD</p>|
|ASP{#FSNAME} used|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[{#FSNAME},used]<p>Update: 300</p><p>LLD</p>|
|ASP{#FSNAME} status|<p>-</p>|`Zabbix agent (active)`|vfs.fs.state[{#FSNAME}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Disk {#DSK_ID}: {#DSK_NAME} ({#DSK_TYPE} {#DSK_MODEL}, {#DSK_SN}) failed|<p>-</p>|<p>**Expression**: last(/AS400/as400.disk.state[{#DSK_SN}])<>1 and last(/AS400/as400.disk.state[{#DSK_SN}])<>4294967295</p><p>**Recovery expression**: </p>|average|
|Job {#NUM}/{#USER}/{#NAME} has large CPU usage (>{$MAX_CPU_PER_PROCESS_PUSED}%)|<p>-</p>|<p>**Expression**: count(/AS400/proc.cpu.util[{#NAME},{#USER},total,,avg1,{#NUM}],#6,"ge","20")=6</p><p>**Recovery expression**: </p>|warning|
|ASP{#FSNAME} used more than {$MAX_DISK_PUSED:"{#FSNAME}"}%|<p>-</p>|<p>**Expression**: min(/AS400/vfs.fs.size[{#FSNAME},pused],#2)>65 and count(/AS400/vfs.fs.state[{#FSNAME}],#2,,"1")=0 and count(/AS400/vfs.fs.state[{#FSNAME}],#2,,"2")=0</p><p>**Recovery expression**: </p>|average|
|Disk {#DSK_ID}: {#DSK_NAME} ({#DSK_TYPE} {#DSK_MODEL}, {#DSK_SN}) failed (LLD)|<p>-</p>|<p>**Expression**: last(/AS400/as400.disk.state[{#DSK_SN}])<>1 and last(/AS400/as400.disk.state[{#DSK_SN}])<>4294967295</p><p>**Recovery expression**: </p>|average|
|Job {#NUM}/{#USER}/{#NAME} has large CPU usage (>{$MAX_CPU_PER_PROCESS_PUSED}%) (LLD)|<p>-</p>|<p>**Expression**: count(/AS400/proc.cpu.util[{#NAME},{#USER},total,,avg1,{#NUM}],#6,"ge","20")=6</p><p>**Recovery expression**: </p>|warning|
|ASP{#FSNAME} used more than {$MAX_DISK_PUSED:"{#FSNAME}"}% (LLD)|<p>-</p>|<p>**Expression**: min(/AS400/vfs.fs.size[{#FSNAME},pused],#2)>65 and count(/AS400/vfs.fs.state[{#FSNAME}],#2,,"1")=0 and count(/AS400/vfs.fs.state[{#FSNAME}],#2,,"2")=0</p><p>**Recovery expression**: </p>|average|
