# BALABIT-SNMPv2-Shell_Control_Box

## Overview

Template for supervise, with SNMP v2, the product: **BALABIT Shell Control Box**


<https://www.balabit.com/fr/network-security/scb>




---


 


You must add values on MACRO for each supervising protocol


1. Get the exact string for each protocol (**snmpwalk | grep scb\_**)


***=> See first image***


2. Add values on MACRO for each protocol


***=> See second image***


 



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|``|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|
|{$STRING_SERVICE_HTTP}|<p>-</p>|`--as scb_http --threads 1500 --stack-size 256 --process-mode safe-background --verbose 4 --log-tags --log-escape --uid zorp --gi`|Text macro|
|{$STRING_SERVICE_ICA}|<p>-</p>|`--as scb_ica --threads 1500 --stack-size 256 --process-mode safe-background --verbose 4 --log-tags --log-escape --uid zorp --gid`|Text macro|
|{$STRING_SERVICE_RDP}|<p>-</p>|`--as scb_rdp --threads 1500 --stack-size 256 --process-mode safe-background --verbose 4 --log-tags --log-escape --uid zorp --gid`|Text macro|
|{$STRING_SERVICE_SSH}|<p>-</p>|`--as scb_ssh --threads 1500 --stack-size 256 --process-mode safe-background --verbose 4 --log-tags --log-escape --uid zorp --gid`|Text macro|
|{$STRING_SERVICE_TELNET}|<p>-</p>|`--as scb_telnet --threads 1500 --stack-size 256 --process-mode safe-background --verbose 4 --log-tags --log-escape --uid zorp --`|Text macro|
|{$STRING_SERVICE_VNC}|<p>-</p>|`--as scb_vnc --threads 1500 --stack-size 256 --process-mode safe-background --verbose 4 --log-tags --log-escape --uid zorp --gid`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU|<p>-</p>|`SNMP agent`|snmp.CPU.discovery<p>Update: 60</p>|
|Network|<p>-</p>|`SNMP agent`|snmp.network.discovery<p>Update: 60</p>|
|File System|<p>-</p>|`SNMP agent`|snmp.filesystem.discovery<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Process workercontroller - Perf CPU|<p>-</p>|`SNMP agent`|SNMP-Process-workercontroller-Perf-CPU<p>Update: 60</p>|
|Process Supervising scb_ssh - Status|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_ssh-Status<p>Update: 60</p>|
|Snmp Availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 60</p>|
|Process Supervising scb_rdp - Perf CPU|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_rdp-Perf-CPU<p>Update: 60</p>|
|Process indexerworker - Status|<p>-</p>|`SNMP agent`|SNMP-Process-indexerworker-Status<p>Update: 60</p>|
|Process Supervising scb_rdp - Status|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_rdp-Status<p>Update: 60</p>|
|Process Supervising scb_vnc - Status|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_vnc-Status<p>Update: 60</p>|
|Process Supervising scb_ica - Perf Memory|<p>Result in Kbytes</p>|`SNMP agent`|SNMP-Process-Supervising_scb_ica-Perf-Memory<p>Update: 60</p>|
|Process indexerservice - Perf Memory|<p>Result in Kbytes</p>|`SNMP agent`|SNMP-Process-indexerservice-Perf-Memory<p>Update: 60</p>|
|Process indexerworker - Perf Memory|<p>Result in Kbytes</p>|`SNMP agent`|SNMP-Process-indexerworker-Perf-Memory<p>Update: 60</p>|
|System Description|<p>-</p>|`SNMP agent`|SNMP-SysDescr<p>Update: 3600</p>|
|Process indexerservice - Perf CPU|<p>-</p>|`SNMP agent`|SNMP-Process-indexerservice-Perf-CPU<p>Update: 60</p>|
|Process Supervising scb_http - Perf Memory|<p>Result in Kbytes</p>|`SNMP agent`|SNMP-Process-Supervising_scb_http-Perf-Memory<p>Update: 60</p>|
|Process Supervising scb_telnet - Perf CPU|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_telnet-Perf-CPU<p>Update: 60</p>|
|Process Supervising scb_telnet - Perf Memory|<p>Result in Kbytes</p>|`SNMP agent`|SNMP-Process-Supervising_scb_telnet-Perf-Memory<p>Update: 60</p>|
|Process Supervising scb_http - Status|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_http-Status<p>Update: 60</p>|
|Process workercontroller - Perf Memory|<p>Result in Kbytes</p>|`SNMP agent`|SNMP-Process-workercontroller-Perf-Memory<p>Update: 60</p>|
|Process Supervising scb_vnc - Perf Memory|<p>Result in Kbytes</p>|`SNMP agent`|SNMP-Process-Supervising_scb_vnc-Perf-Memory<p>Update: 60</p>|
|Nombre de Processus|<p>-</p>|`SNMP agent`|SNMP-Number-Processus<p>Update: 60</p>|
|Process Supervising scb_ica - Perf CPU|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_ica-Perf-CPU<p>Update: 60</p>|
|Ping Device|<p>-</p>|`Simple check`|icmpping[,2]<p>Update: 30</p>|
|Process indexerworker - Perf CPU|<p>-</p>|`SNMP agent`|SNMP-Process-indexerworker-Perf-CPU<p>Update: 60</p>|
|Process Supervising scb_ssh - Perf Memory|<p>Result in Kbytes</p>|`SNMP agent`|SNMP-Process-Supervising_scb_ssh-Perf-Memory<p>Update: 60</p>|
|Process Supervising scb_telnet - Status|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_telnet-Status<p>Update: 60</p>|
|Process indexerservice - Status|<p>-</p>|`SNMP agent`|SNMP-Process-indexerservice-Status<p>Update: 60</p>|
|Process workercontroller - Status|<p>-</p>|`SNMP agent`|SNMP-Process-workercontroller-Status<p>Update: 60</p>|
|Nombre Utilisateurs Connectes|<p>-</p>|`SNMP agent`|SNMP-Number-User-Connected<p>Update: 60</p>|
|Process Supervising scb_vnc - Perf CPU|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_vnc-Perf-CPU<p>Update: 60</p>|
|Name Machine|<p>-</p>|`SNMP agent`|SNMP-NameMachine<p>Update: 3600</p>|
|Process Supervising scb_ica - Status|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_ica-Status<p>Update: 60</p>|
|Process Supervising scb_ssh - Perf CPU|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_ssh-Perf-CPU<p>Update: 60</p>|
|Process Supervising scb_http - Perf CPU|<p>-</p>|`SNMP agent`|SNMP-Process-Supervising_scb_http-Perf-CPU<p>Update: 60</p>|
|Process Supervising scb_rdp - Perf Memory|<p>Result in Kbytes</p>|`SNMP agent`|SNMP-Process-Supervising_scb_rdp-Perf-Memory<p>Update: 60</p>|
|CPU {#SNMPINDEX} - Charge|<p>-</p>|`SNMP agent`|SNMP-Charge-CPU-[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|CPU {#SNMPINDEX} - Etat|<p>-</p>|`SNMP agent`|SNMP-Etat-CPU-[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|CPU {#SNMPINDEX} - Name|<p>-</p>|`SNMP agent`|SNMP-Name-CPU-[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] - IN Octets|<p>-</p>|`SNMP agent`|SNMP-Interface-IN-Octets-[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] - MAC|<p>-</p>|`SNMP agent`|SNMP-Interface-MAC-[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] - MTU|<p>-</p>|`SNMP agent`|SNMP-Interface-MTU-[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] - Operational Status|<p>-</p>|`SNMP agent`|SNMP-Interface-Op-Status-[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] - OUT Errors|<p>-</p>|`SNMP agent`|SNMP-Interface-OUT-Errors-[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] - OUT Octets|<p>-</p>|`SNMP agent`|SNMP-Interface-OUT-Octets-[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] - Speed|<p>-</p>|`SNMP agent`|SNMP-Interface-Speed-[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] - Type|<p>-</p>|`SNMP agent`|SNMP-Interface-Type-[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|File System {#SNMPVALUE} - Used Percentage|<p>-</p>|`Calculated`|File-System-Space-Used-Percentage-[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|File System {#SNMPVALUE} - Espace Alloue|<p>-</p>|`SNMP agent`|SNMP-File-System-Space-Allocated-[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|File System {#SNMPVALUE} - Espace Utilise|<p>-</p>|`SNMP agent`|SNMP-File-System-Space-Used-[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Free Space File System  {#SNMPVALUE}  -< 1%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: {BALABIT-SNMPv2-Shell_Control_Box:File-System-Space-Used-Percentage-[{#SNMPVALUE}].last()}>=99</p><p>**Recovery expression**: </p>|high|
|Free Space File System  {#SNMPVALUE}  -< 5%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: {BALABIT-SNMPv2-Shell_Control_Box:File-System-Space-Used-Percentage-[{#SNMPVALUE}].last()}>=95</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 10%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: {BALABIT-SNMPv2-Shell_Control_Box:File-System-Space-Used-Percentage-[{#SNMPVALUE}].last()}>=90</p><p>**Recovery expression**: </p>|warning|
|Interface [{#SNMPVALUE}] on {HOST.HOST1} - DOWN|<p>-</p>|<p>**Expression**: {BALABIT-SNMPv2-Shell_Control_Box:SNMP-Interface-Op-Status-[{#SNMPVALUE}].last()}=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}] on {HOST.HOST1} - DOWN (LLD)|<p>-</p>|<p>**Expression**: {BALABIT-SNMPv2-Shell_Control_Box:SNMP-Interface-Op-Status-[{#SNMPVALUE}].last()}=0</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 1%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: {BALABIT-SNMPv2-Shell_Control_Box:File-System-Space-Used-Percentage-[{#SNMPVALUE}].last()}>=99</p><p>**Recovery expression**: </p>|high|
|Free Space File System  {#SNMPVALUE}  -< 5%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: {BALABIT-SNMPv2-Shell_Control_Box:File-System-Space-Used-Percentage-[{#SNMPVALUE}].last()}>=95</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 10%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: {BALABIT-SNMPv2-Shell_Control_Box:File-System-Space-Used-Percentage-[{#SNMPVALUE}].last()}>=90</p><p>**Recovery expression**: </p>|warning|
