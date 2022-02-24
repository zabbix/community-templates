# AD DS Health and Performance

## Overview

Performance counters


* DRA Inbound Bytes Total/Sec
* DRA Inbound Object Updates Remaining in Packet
* DRA Outbound Bytes Total/Sec
* DRA Pending Replication Synchronizations
* Kerberos Authentications/Sec
* LDAP Bind Time
* LDAP Client Sessions
* LDAP Searches/Sec
* LDAP Successful Binds/Sec
* LDAP Active Threads
* LDAP Writes/Sec
* NTLM Authentications


Events


* Active Directory Web Service (Error, Warning)
* DFS Replication (Error, Warning)
* Directory Service (Error, Warning)
* DNS Server (Error, Warning)


 Service


* Distributed File System Enables
* DNS Server
* DFS Replication
* 


## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ADDB_PATH}|<p>-</p>|`c:\windows\ntds\ntds.dit`|Text macro|
|{$ADLOG_PATH}|<p>-</p>|`c:\windows\ntds\edb.log`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|LSASS Processor Time|<p>Metric Process % Processor Time of LSASS perf_counter[ Process(lsass) % Processor Time]</p>|`Zabbix agent`|perf_counter[\230(lsass)\4676]<p>Update: 1m</p>|
|Database Size|<p>-</p>|`Zabbix agent`|vfs.file.size["{$ADDBPATH}"]<p>Update: 1h</p>|
|State of service "IsmServ" (Intersite Messaging)|<p>-</p>|`Zabbix agent`|service.info[IsmServ,state]<p>Update: 1m</p>|
|Active Directory Web Services Events|<p>-</p>|`Zabbix agent (active)`|eventlog[Active Directory Web Services,,"Warning|Error"]<p>Update: 5m</p>|
|I/O Database Reads/sec|<p>perf_counter[ Database ==> Instances(lsass/NTDSA) I/O Database Reads/sec]</p>|`Zabbix agent`|perf_counter[\3054(lsass/NTDSA)\3632]<p>Update: 1m</p>|
|Kerberos Authentications|<p>perf_counter[ Security system-wide statistics Kerberos Authentications]</p>|`Zabbix agent`|perf_counter[\1570\1574]<p>Update: 1m</p>|
|State of service "RpcSs" (Remote Procedure Call (RPC))|<p>-</p>|`Zabbix agent`|service.info[RpcSs,state]<p>Update: 1m</p>|
|NTLM Authentications|<p>perf_counter[ Security system-wide statistics NTLM Authentications]</p>|`Zabbix agent`|perf_counter[\1570\1572]<p>Update: 1m</p>|
|Log File Size|<p>-</p>|`Zabbix agent`|vfs.file.size["{$ADLOGPATH}"]<p>Update: 1h</p>|
|DNS Server Events|<p>-</p>|`Zabbix agent (active)`|eventlog[DNS Server,,"Warning|Error"]<p>Update: 5m</p>|
|State of service "SamSs" (Security Accounts Manager)|<p>-</p>|`Zabbix agent`|service.info[SamSs,state]<p>Update: 1m</p>|
|LDAP Client Sessions|<p>perf_counter[ NTDS LDAP Client Sessions]</p>|`Zabbix agent`|perf_counter[\6956\17274]<p>Update: 1m</p>|
|Directory Service Events|<p>-</p>|`Zabbix agent (active)`|eventlog[Directory Service,,"Warning|Error"]<p>Update: 5m</p>|
|State of service "DNS" (DNS Server)|<p>-</p>|`Zabbix agent`|service.info[DNS,state]<p>Update: 1m</p>|
|I/O Log Writes/sec|<p>perf_counter[ Database ==> Instances(lsass/NTDSA) I/O Log Writes/sec]</p>|`Zabbix agent`|perf_counter[\3054(lsass/NTDSA)\3712]<p>Update: 1m</p>|
|LDAP Searches/sec|<p>perf_counter[ NTDS LDAP Searches/sec]</p>|`Zabbix agent`|perf_counter[\6956\17280]<p>Update: 1m</p>|
|LDAP Active Threads|<p>perf_counter[ NTDS LDAP Active Threads]</p>|`Zabbix agent`|perf_counter[\6956\17276]<p>Update: 1m</p>|
|I/O Log Writes Average Latency|<p>perf_counter[ Database ==> Instances(lsass/NTDSA) I/O Log Writes Average Latency]</p>|`Zabbix agent`|perf_counter[\3054(lsass/NTDSA)\3714]<p>Update: 1m</p>|
|State of service "LanmanServer" (Server)|<p>-</p>|`Zabbix agent`|service.info[LanmanServer,state]<p>Update: 1m</p>|
|DRA Inbound Bytes Total/sec|<p>perf_counter[ NTDA DRA Inbound Bytes Total/sec]</p>|`Zabbix agent`|perf_counter[\6956\17444]<p>Update: 1m</p>|
|I/O Database Reads Average Latency|<p>perf_counter[ Database ==> Instances(lsass/NTDSA) I/O Database Reads Average Latency]</p>|`Zabbix agent`|perf_counter[\3054(lsass/NTDSA)\2664]<p>Update: 1m</p>|
|State of service "Netlogon" (Netlogon)|<p>-</p>|`Zabbix agent`|service.info[Netlogon,state]<p>Update: 1m</p>|
|State of service "LanmanWorkstation" (Workstation)|<p>-</p>|`Zabbix agent`|service.info[LanmanWorkstation,state]<p>Update: 1m</p>|
|DFS Replication Events|<p>-</p>|`Zabbix agent (active)`|eventlog[DFS Replication,,"Warning|Error"]<p>Update: 5m</p>|
|State of service "DFSR" (DFS Replication)|<p>-</p>|`Zabbix agent`|service.info[DFSR,state]<p>Update: 1m</p>|
|State of service "W32Time" (Windows Time)|<p>-</p>|`Zabbix agent`|service.info[W32Time,state]<p>Update: 1m</p>|
|DRA Inbound Object Updates Remaining in Packet|<p>perf_counter[ NTDA DRA Inbound Object Updates Remaining in Packet]</p>|`Zabbix agent`|perf_counter[\6956\17268]<p>Update: 1m</p>|
|LDAP Port is running|<p>-</p>|`Simple check`|net.tcp.service[ldap]<p>Update: 1m</p>|
|LDAP Writes/sec|<p>-</p>|`Zabbix agent`|perf_counter[\6956\17278]<p>Update: 1m</p>|
|State of service "Dnscache" (DNS Client)|<p>-</p>|`Zabbix agent`|service.info[Dnscache,state]<p>Update: 1m</p>|
|State of service "Kdc" (Kerberos Key Distribution Center)|<p>-</p>|`Zabbix agent`|service.info[Kdc,state]<p>Update: 1m</p>|
|DRA Pending Replication Synchronizations|<p>perf_counter[ NTDA DRA Pending Replication Synchronizations]</p>|`Zabbix agent`|perf_counter[\6956\17266]<p>Update: 1m</p>|
|DRA Outbound Bytes Total/sec|<p>perf_counter[ NTDA DRA Outbound Bytes Total/sec]</p>|`Zabbix agent`|perf_counter[\6956\17452]<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

