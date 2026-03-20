# OS Linux

## Overview

Hi guys! Sorry for the delay to update this dashboard, but finally came, there are huge improvements, now you don't need to import any Zabbix template, this dashboard work with the latest Zabbix version today (5.2) and with the latest Grafana too (7.3).


By default, at the 'Group' tab, it's hiding some groups like the: Template, Zabbix, and Discovery groups, if your server doesn't show in the dashboard, maybe you need to linked to another group like 'Linux Servers' and 'Windows Servers'.


Please, if have any suggestions or problems, please contact me: https://github.com/paulopaim


 


Grafana Dashboard:


<https://grafana.com/grafana/dashboards/5363>



## Author

Paulo Paim

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template App Zabbix Agent|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interface discovery|<p>Discovery of network interfaces as defined in global regular expression "Network interfaces for discovery".</p>|`Zabbix agent`|net.if.discovery<p>Update: 1h</p>|
|Mounted filesystem discovery|<p>Discovery of file systems of different types as defined in global regular expression "File systems for discovery".</p>|`Zabbix agent`|vfs.fs.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU $2 time|<p>The time the CPU has spent running users' processes that have been niced.</p>|`Zabbix agent`|system.cpu.util[,nice]<p>Update: 1m</p>|
|Host boot time|<p>-</p>|`Zabbix agent`|system.boottime<p>Update: 10m</p>|
|Maximum number of opened files|<p>It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.</p>|`Zabbix agent`|kernel.maxfiles<p>Update: 1h</p>|
|CPU $2 time|<p>The time the CPU has spent doing nothing.</p>|`Zabbix agent`|system.cpu.util[,idle]<p>Update: 1m</p>|
|CPU $2 time|<p>Amount of time the CPU has been waiting for I/O to complete.</p>|`Zabbix agent`|system.cpu.util[,iowait]<p>Update: 1m</p>|
|Total swap space|<p>-</p>|`Zabbix agent`|system.swap.size[,total]<p>Update: 1h</p>|
|Checksum of $1|<p>-</p>|`Zabbix agent`|vfs.file.cksum[/etc/passwd]<p>Update: 1h</p>|
|CPU $2 time|<p>The time the CPU has spent running users' processes that are not niced.</p>|`Zabbix agent`|system.cpu.util[,user]<p>Update: 1m</p>|
|Total memory|<p>-</p>|`Zabbix agent`|vm.memory.size[total]<p>Update: 1h</p>|
|Context switches per second|<p>-</p>|`Zabbix agent`|system.cpu.switches<p>Update: 1m</p>|
|Interrupts per second|<p>-</p>|`Zabbix agent`|system.cpu.intr<p>Update: 1m</p>|
|Host name|<p>System host name.</p>|`Zabbix agent`|system.hostname<p>Update: 1h</p>|
|Processor load (15 min average per core)|<p>The processor load is calculated as system CPU load divided by number of CPU cores.</p>|`Zabbix agent`|system.cpu.load[percpu,avg15]<p>Update: 1m</p>|
|Host local time|<p>-</p>|`Zabbix agent`|system.localtime<p>Update: 1m</p>|
|CPU $2 time|<p>The amount of time the CPU has been servicing software interrupts.</p>|`Zabbix agent`|system.cpu.util[,softirq]<p>Update: 1m</p>|
|Number of running processes|<p>Number of processes in running state.</p>|`Zabbix agent`|proc.num[,,run]<p>Update: 1m</p>|
|CPU $2 time|<p>The amount of CPU 'stolen' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).</p>|`Zabbix agent`|system.cpu.util[,steal]<p>Update: 1m</p>|
|Used memory in %|<p>-</p>|`Zabbix agent`|vm.memory.size[pused]<p>Update: 1m</p>|
|Maximum number of processes|<p>It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.</p>|`Zabbix agent`|kernel.maxproc<p>Update: 1h</p>|
|System uptime|<p>-</p>|`Zabbix agent`|system.uptime<p>Update: 10m</p>|
|Processor load (1 min average per core)|<p>The processor load is calculated as system CPU load divided by number of CPU cores.</p>|`Zabbix agent`|system.cpu.load[percpu,avg1]<p>Update: 1m</p>|
|Number of processes|<p>Total number of processes in any state.</p>|`Zabbix agent`|proc.num[]<p>Update: 1m</p>|
|Free swap space in %|<p>-</p>|`Zabbix agent`|system.swap.size[,pfree]<p>Update: 1m</p>|
|Used memory|<p>-</p>|`Zabbix agent`|vm.memory.size[used]<p>Update: 1m</p>|
|Number of logged in users|<p>Number of users who are currently logged in.</p>|`Zabbix agent`|system.users.num<p>Update: 1m</p>|
|Free swap space|<p>-</p>|`Zabbix agent`|system.swap.size[,free]<p>Update: 1m</p>|
|CPU $2 time|<p>The amount of time the CPU has been servicing hardware interrupts.</p>|`Zabbix agent`|system.cpu.util[,interrupt]<p>Update: 1m</p>|
|Processor load (5 min average per core)|<p>The processor load is calculated as system CPU load divided by number of CPU cores.</p>|`Zabbix agent`|system.cpu.load[percpu,avg5]<p>Update: 1m</p>|
|Available memory|<p>Available memory is defined as free+cached+buffers memory.</p>|`Zabbix agent`|vm.memory.size[available]<p>Update: 1m</p>|
|Number of CPUs|<p>The number of CPUs.</p>|`Zabbix agent`|system.cpu.num[]<p>Update: 1h</p>|
|CPU $2 time|<p>The time the CPU has spent running the kernel and its processes.</p>|`Zabbix agent`|system.cpu.util[,system]<p>Update: 1m</p>|
|System information|<p>The information as normally returned by 'uname -a'.</p>|`Zabbix agent`|system.uname<p>Update: 1h</p>|
|Incoming network traffic on $1|<p>-</p>|`Zabbix agent`|net.if.in[{#IFNAME}]<p>Update: 1m</p><p>LLD</p>|
|Outgoing network traffic on $1|<p>-</p>|`Zabbix agent`|net.if.out[{#IFNAME}]<p>Update: 1m</p><p>LLD</p>|
|Free inodes on $1 in %|<p>-</p>|`Zabbix agent`|vfs.fs.inode[{#FSNAME},pfree]<p>Update: 1m</p><p>LLD</p>|
|Free disk space on $1|<p>-</p>|`Zabbix agent`|vfs.fs.size[{#FSNAME},free]<p>Update: 1m</p><p>LLD</p>|
|Free disk space on $1 in %|<p>-</p>|`Zabbix agent`|vfs.fs.size[{#FSNAME},pfree]<p>Update: 1m</p><p>LLD</p>|
|Total disk space on $1|<p>-</p>|`Zabbix agent`|vfs.fs.size[{#FSNAME},total]<p>Update: 1h</p><p>LLD</p>|
|Used disk space on $1|<p>-</p>|`Zabbix agent`|vfs.fs.size[{#FSNAME},used]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Free disk space is less than 1% on volume {#FSNAME}|<p>-</p>|<p>**Expression**: last(/OS Linux/vfs.fs.size[{#FSNAME},pfree])<1</p><p>**Recovery expression**: </p>|disaster|
|Free disk space is less than 5% on volume {#FSNAME}|<p>-</p>|<p>**Expression**: last(/OS Linux/vfs.fs.size[{#FSNAME},pfree])<5</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 20% on volume {#FSNAME}|<p>-</p>|<p>**Expression**: last(/OS Linux/vfs.fs.size[{#FSNAME},pfree])<20</p><p>**Recovery expression**: </p>|warning|
|Free inodes is less than 20% on volume {#FSNAME}|<p>-</p>|<p>**Expression**: last(/OS Linux/vfs.fs.inode[{#FSNAME},pfree])<20</p><p>**Recovery expression**: </p>|warning|
|Free disk space is less than 1% on volume {#FSNAME} (LLD)|<p>-</p>|<p>**Expression**: last(/OS Linux/vfs.fs.size[{#FSNAME},pfree])<1</p><p>**Recovery expression**: </p>|disaster|
|Free disk space is less than 5% on volume {#FSNAME} (LLD)|<p>-</p>|<p>**Expression**: last(/OS Linux/vfs.fs.size[{#FSNAME},pfree])<5</p><p>**Recovery expression**: </p>|high|
|Free disk space is less than 20% on volume {#FSNAME} (LLD)|<p>-</p>|<p>**Expression**: last(/OS Linux/vfs.fs.size[{#FSNAME},pfree])<20</p><p>**Recovery expression**: </p>|warning|
|Free inodes is less than 20% on volume {#FSNAME} (LLD)|<p>-</p>|<p>**Expression**: last(/OS Linux/vfs.fs.inode[{#FSNAME},pfree])<20</p><p>**Recovery expression**: </p>|warning|
