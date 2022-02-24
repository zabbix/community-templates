# Eocortex

## Overview

This template will monitor the following items of a Eocortex (or Macroscop) server:


- Service State (Windows Service)


- Eocortex version (through the API)


- Last recording (by monitoring D:\EocortexArchive\ArchiveLogicDrive.xml, if you have more drives or different drive letters this needs modifying)


- Total number of camera's (through the API)


- Number of offline camera's (through the API)


- CPU usage (i raised the default trigger because it's common for a Eocortex server doing video analytics to have high CPU usage)


 


It needs two macro's to be configured on the host:


{$EOCORTEX\_PASSWORD} Eocortex password in MD5 hash


{$EOCORTEX\_USER} = Eocortex Username


The user doesnt need any specific permissions in Eocortex.


 


It's all configured with active checks, so make sure your agent works with the active checks or change it to passive checks.


The agent will connect to localhost; if you have multiple Eocortex servers, just add all servers.


 


I'm using Zabbix 4.4.4 but there is nothing very specific so it will probably also work on older versions.



## Author

ARAS Security B.V.

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Free swap space|<p>-</p>|`Zabbix agent (active)`|system.swap.size[,free]<p>Update: 60</p>|
|System uptime|<p>-</p>|`Zabbix agent (active)`|system.uptime<p>Update: 60</p>|
|Eocortex Version|<p>-</p>|`Zabbix agent (active)`|web.page.get[127.0.0.1,/configex?login={$EOCORTEX_USER}&password={$EOCORTEX_PASSWORD}&responsetype=json,8080]<p>Update: 90m</p>|
|Free memory|<p>-</p>|`Zabbix agent (active)`|vm.memory.size[free]<p>Update: 60</p>|
|Total memory|<p>-</p>|`Zabbix agent (active)`|vm.memory.size[total]<p>Update: 3600</p>|
|Processor load (5 min average)|<p>-</p>|`Zabbix agent (active)`|system.cpu.load[percpu,avg5]<p>Update: 60</p>|
|Eocortex Service|<p>-</p>|`Zabbix agent (active)`|service_state[EocortexServer]<p>Update: 30s</p>|
|Number of camera's|<p>-</p>|`Zabbix agent (active)`|web.page.get[127.0.0.1,/command?type=getchannelsstates&login={$EOCORTEX_USER}&password={$EOCORTEX_PASSWORD}&responsetype=json,8080]<p>Update: 60m</p>|
|System information|<p>-</p>|`Zabbix agent (active)`|system.uname<p>Update: 3600</p>|
|Average disk read queue length|<p>Full counter name: PhysicalDisk(_Total) Avg. Disk Read Queue Length</p>|`Zabbix agent (active)`|perf_counter[\234(_Total)\1402]<p>Update: 60</p>|
|Average disk write queue length|<p>Full counter name: PhysicalDisk(_Total) Avg. Disk Write Queue Length</p>|`Zabbix agent (active)`|perf_counter[\234(_Total)\1404]<p>Update: 60</p>|
|Last recording|<p>-</p>|`Zabbix agent (active)`|vfs.file.time[D:\EocortexArchive\ArchiveLogicDrive.xml,modify]<p>Update: 1m</p>|
|Agent ping|<p>-</p>|`Zabbix agent (active)`|agent.ping<p>Update: 1m</p>|
|Free disk space on C: (percentage)|<p>-</p>|`Zabbix agent (active)`|vfs.fs.size[C:,pfree]<p>Update: 60m</p>|
|Total swap space|<p>-</p>|`Zabbix agent (active)`|system.swap.size[,total]<p>Update: 3600</p>|
|Number of camera's offline|<p>-</p>|`Zabbix agent (active)`|web.page.get[localhost,/command?type=getchannelsstates&login={$EOCORTEX_USER}&password={$EOCORTEX_PASSWORD}&responsetype=json,8080]<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

