# TCP/UDP Stats Windows

## Overview

Starting from the template that they published in:


<https://systembash.com/track-tcp-and-udp-connections-with-zabbix/>


I have modified the parameters for use in Windows. For it to work, add the following lines in UserParameter of zabbix\_agent.conf


UserParameter=sockstat.sockets, netstat -ano | find /V "hola" /C  
 UserParameter=sockstat.tcp.inuse, netstat -ano | findstr ESTABLISHED  
 UserParameter=sockstat.tcp.inuse.count, netstat -ano | find /C "ESTABLISHED"  
 UserParameter=sockstat.tcp.orphan, netstat -ano | findstr CLOSE\_WAIT  
 UserParameter=sockstat.tcp.orphan.count, netstat -ano | find /C "CLOSE\_WAIT"  
 UserParameter=sockstat.tcp.timewait, netstat -ano | findstr TIME\_WAIT   
 UserParameter=sockstat.tcp.timewait.count, netstat -ano | find /C "TIME\_WAIT"  
 UserParameter=sockstat.tcp.allocated, netstat -ano | findstr LISTENING  
 UserParameter=sockstat.tcp.allocated.count, netstat -ano | find /C "LISTENING"  
 UserParameter=sockstat.udp.inuse, netstat -ano | findstr UDP  
 UserParameter=sockstat.udp.inuse.count, netstat -ano | find /C "UDP" 


Restart Zabbix agent



## Author

Sancho

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|TCP Sockets in CLOSE_WAIT|<p>-</p>|`Zabbix agent`|sockstat.tcp.orphan<p>Update: 60</p>|
|TCP Sockets in CLOSE_WAIT Count|<p>-</p>|`Zabbix agent`|sockstat.tcp.orphan.count<p>Update: 60</p>|
|TCP Sockets in TIME_WAIT|<p>-</p>|`Zabbix agent`|sockstat.tcp.timewait<p>Update: 60</p>|
|TCP Sockets in TIME_WAIT Count|<p>-</p>|`Zabbix agent`|sockstat.tcp.timewait.count<p>Update: 60</p>|
|UDP Sockets In Use|<p>-</p>|`Zabbix agent`|sockstat.udp.inuse<p>Update: 60</p>|
|TCP Sockets in LISTENING Count|<p>-</p>|`Zabbix agent`|sockstat.tcp.allocated.count<p>Update: 60</p>|
|TCP Sockets in ESTABLISHED Count|<p>-</p>|`Zabbix agent`|sockstat.tcp.inuse.count<p>Update: 60</p>|
|Total Sockets|<p>Number of open sockets</p>|`Zabbix agent`|sockstat.sockets<p>Update: 60</p>|
|TCP Sockets In ESTABLISHED|<p>TCP sockets currently in use on the system.</p>|`Zabbix agent`|sockstat.tcp.inuse<p>Update: 60</p>|
|UDP Sockets In Use Count|<p>-</p>|`Zabbix agent`|sockstat.udp.inuse.count<p>Update: 60</p>|
|TCP Sockets in LISTENING|<p>-</p>|`Zabbix agent`|sockstat.tcp.allocated<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

