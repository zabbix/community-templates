# B593

## Overview

Template for Huawei B593u-12 LTE Router.


Does not apply on B593s-12 or B593s-22 (should be ok with B593u-91).


A custom firmware is needed to get Zabbix agent, please follow the link.


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interface discovery|<p>Get interfaces from B593</p>|`Zabbix agent`|net.if.discovery<p>Update: 900</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of processes|<p>Total number of processes in any state.</p>|`Zabbix agent`|proc.num[]<p>Update: 180</p>|
|Host name|<p>System host name.</p>|`Zabbix agent`|system.hostname<p>Update: 3600</p>|
|Interrupts per second|<p>-</p>|`Zabbix agent`|system.cpu.intr<p>Update: 120</p>|
|Processor load (15 min)|<p>The processor load is calculates as system CPU load divided by number of CPU cores.</p>|`Zabbix agent`|cpu.load15<p>Update: 60</p>|
|Disk upgflash free|<p>-</p>|`Zabbix agent`|disk.free.usb<p>Update: 900</p>|
|System uptime|<p>-</p>|`Zabbix agent`|system.uptime<p>Update: 900</p>|
|Zabbix memory usage|<p>-</p>|`Zabbix agent`|mem.zbxagent<p>Update: 600</p>|
|Cached memory|<p>-</p>|`Zabbix agent`|mem.cached<p>Update: 300</p>|
|Disk upgflash used|<p>-</p>|`Zabbix agent`|disk.used.usb<p>Update: 900</p>|
|LTE bandwidth|<p>-</p>|`Calculated`|sum.hed0<p>Update: 120</p>|
|Host local time|<p>-</p>|`Zabbix agent`|system.localtime<p>Update: 300</p>|
|CPU user time|<p>The time the CPU has spent running users' processes that are not niced.</p>|`Zabbix agent`|cpu.user<p>Update: 120</p>|
|CPU sys time|<p>The time the CPU has spent running the kernel and its processes.</p>|`Zabbix agent`|cpu.sys<p>Update: 120</p>|
|System information|<p>The information as normally returned by 'uname -a'.</p>|`Zabbix agent`|system.uname<p>Update: 86400</p>|
|CPU nice time|<p>-</p>|`Zabbix agent`|cpu.nice<p>Update: 120</p>|
|Maximum number of processes|<p>It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.</p>|`Zabbix agent`|kernel.maxproc<p>Update: 86400</p>|
|CPU iowait time|<p>Amount of time the CPU has been waiting for I/O to complete.</p>|`Zabbix agent`|cpu.io<p>Update: 120</p>|
|Free memory|<p>-</p>|`Zabbix agent`|mem.free<p>Update: 300</p>|
|Number of running processes|<p>Number of processes in running state.</p>|`Zabbix agent`|proc.num[,,run]<p>Update: 180</p>|
|CPU idle time|<p>The time the CPU has spent doing nothing.</p>|`Zabbix agent`|cpu.idle<p>Update: 120</p>|
|Total memory|<p>-</p>|`Zabbix agent`|mem.total<p>Update: 86400</p>|
|Number of logged in users|<p>Number of users who are currently logged in.</p>|`Zabbix agent`|system.users.num<p>Update: 600</p>|
|CPU irq time|<p>-</p>|`Zabbix agent`|cpu.irq<p>Update: 120</p>|
|Host boot time|<p>-</p>|`Zabbix agent`|system.boottime<p>Update: 600</p>|
|Maximum number of opened files|<p>It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.</p>|`Zabbix agent`|kernel.maxfiles<p>Update: 86400</p>|
|Processor load (5 min)|<p>The processor load is calculates as system CPU load divided by number of CPU cores.</p>|`Zabbix agent`|cpu.load5<p>Update: 60</p>|
|Used memory|<p>-</p>|`Zabbix agent`|mem.used<p>Update: 300</p>|
|Context switches per second|<p>-</p>|`Zabbix agent`|system.cpu.switches<p>Update: 120</p>|
|Processor load (1 min)|<p>The processor load is calculates as system CPU load divided by number of CPU cores.</p>|`Zabbix agent`|cpu.load1<p>Update: 60</p>|
|CPU softirq time|<p>-</p>|`Zabbix agent`|cpu.softirq<p>Update: 120</p>|
|Incoming network traffic on $1|<p>-</p>|`Zabbix agent`|net.if.in[{#IFNAME}]<p>Update: 120</p><p>LLD</p>|
|Outgoing network traffic on $1|<p>-</p>|`Zabbix agent`|net.if.out[{#IFNAME}]<p>Update: 120</p><p>LLD</p>|
|Total network traffic on $1|<p>-</p>|`Zabbix agent`|net.if.total[{#IFNAME}]<p>Update: 120</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

