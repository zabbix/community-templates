# App MSSQL 2008-2016 WSFC

## Overview


```
Requirements:
```

1. Zabbix 3+


Install instrucitons:


https://github.com/hermanekt/MSSQL-2008-2016-Multi-instance-with-WSFC



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Database Discovery|<p>-</p>|`Zabbix agent`|mssql.db.discovery<p>Update: 1h</p>|
|SQL Error Log|<p>-</p>|`Zabbix agent`|mssql.errorlog<p>Update: 1h</p>|
|Instance Discovery|<p>-</p>|`Zabbix agent`|mssql.instance.discovery<p>Update: 1h</p>|
|Services Discovery|<p>-</p>|`Zabbix agent`|mssql.service.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|SQL Server Default Service State - MSSQLSERVER|<p>-</p>|`Zabbix agent`|service_state[MSSQLSERVER]<p>Update: 30s</p>|
|SQL Agent Default Instance: Service State - SQL Agent (MSSQLSERVER)|<p>-</p>|`Zabbix agent`|service_state[SQLServerAgent]<p>Update: 60s</p>|
|Host name of SQL Node|<p>-</p>|`Zabbix agent`|agent.hostname<p>Update: 60s</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Active Transactions|<p>Number of active transactions for the database.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Active Transactions"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Data File Size|<p>Cumulative size (in kilobytes) of all the data files in the database including any automatic growth. Monitoring this counter is useful, for example, for determining the correct size of tempdb.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Data File(s) Size (KB)"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Log Bytes Flushed/sec|<p>Total number of log bytes flushed per second. Useful for determining trends and utilization of the transaction log.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Log Bytes Flushed/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Log File Size|<p>Cumulative size (in kilobytes) of all the transaction log files in the database.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Log File(s) Size (KB)"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Log File Used Size|<p>The cumulative used size of all the log files in the database.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Log File(s) Used Size (KB)"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Log Flushes/sec|<p>Number of log flushes per second.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Log Flushes/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Log Flush Waits/sec|<p>Number of commits per second waiting for the log flush.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Log Flush Waits/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Log Flush Wait Time|<p>Total wait time (in milliseconds) to flush the log. On an AlwaysOn secondary database, this value indicates the wait time for log records to be hardened to disk.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Log Flush Wait Time"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Log Growths|<p>Total number of times the transaction log for the database has been expanded.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Log Growths"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Log Shrinks|<p>Total number of times the transaction log for the database has been shrunk.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Log Shrinks"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Log Truncations|<p>The number of times the transaction log has been shrunk.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Log Truncations"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Percent Log Used|<p>Percentage of space in the log that is in use.</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Percent Log Used"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}, DB {#DBNAME}: Transactions per second|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases({#DBNAME})\Transactions/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Error Log File (LOGCount)|<p>-</p>|`Zabbix agent (active)`|log.count[{#ERRORLOG},Error|Failed,"UTF-16"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Error Log File (LOG)|<p>-</p>|`Zabbix agent (active)`|log[{#ERRORLOG},Error|Failed,"UTF-16"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Access Methods\Page Splits/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Access Methods\Page Splits/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:SQL Statistics\Batch Requests/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:SQL Statistics\Batch Requests/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Redone Bytes/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Redone Bytes/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Redones/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Redones/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Total Log requiring undo|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Total Log requiring undo"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Transaction Delay|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Transaction Delay"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Databases(_Total)\Percent Log Used|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Databases(_Total)\Percent Log Used"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:General Statistics\User Connections|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:General Statistics\User Connections"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Locks(_Total)\Lock Timeouts/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Locks(_Total)\Lock Timeouts/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Locks(_Total)\Number of Deadlocks/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Locks(_Total)\Number of Deadlocks/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Memory Manager\Memory Grants Pending|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Memory Manager\Memory Grants Pending"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Memory Manager\Target Server Memory (KB)|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Memory Manager\Target Server Memory (KB)"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Memory Manager\Total Server Memory (KB)|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Memory Manager\Total Server Memory (KB)"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:SQL Statistics\SQL Compilations/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:SQL Statistics\SQL Compilations/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Redo blocked/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Redo blocked/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:SQL Statistics\SQL Re-Compilations/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:SQL Statistics\SQL Re-Compilations/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Memory grant queue waits/Average wait time (ms)|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Average wait time (ms))\Memory grant queue waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Network IO waits/Average wait time (ms)|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Average wait time (ms))\Network IO waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Page IO latch waits/Average wait time (ms)|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Average wait time (ms))\Page IO latch waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Memory grant queue waits/Cumulative wait time (ms) per second|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Cumulative wait time (ms) per second)\Memory grant queue waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Network IO waits/Cumulative wait time (ms) per second|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Cumulative wait time (ms) per second)\Network IO waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Page IO latch waits/Cumulative wait time (ms) per second|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Cumulative wait time (ms) per second)\Page IO latch waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Memory grant queue waits/Waits in progress|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Waits in progress)\Memory grant queue waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Network IO waits/Waits in progress|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Waits in progress)\Network IO waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Page IO latch waits/Waits in progress|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Waits in progress)\Page IO latch waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Memory grant queue waits/Waits started per second|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Waits started per second)\Memory grant queue waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Network IO waits/Waits started per second|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Waits started per second)\Network IO waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Redo Bytes Remaining|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Redo Bytes Remaining"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Recovery Queue|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Recovery Queue"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Bytes Received from Replica/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Availability Replica(_Total)\Bytes Received from Replica/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Database Flow Control Delay|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Database Flow Control Delay"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Bytes Sent to Replica/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Availability Replica(_Total)\Bytes Sent to Replica/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Bytes Sent to Transport/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Availability Replica(_Total)\Bytes Sent to Transport/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Flow Control/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Availability Replica(_Total)\Flow Control/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Flow Control Time (ms/sec)|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Availability Replica(_Total)\Flow Control Time (ms/sec)"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Receives from Replica/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Availability Replica(_Total)\Receives from Replica/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Resent Messages/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Availability Replica(_Total)\Resent Messages/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Sends to Replica/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Availability Replica(_Total)\Sends to Replica/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Sends to Transport/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Availability Replica(_Total)\Sends to Transport/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Buffer Manager\Page life expectancy|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Buffer Manager\Page life expectancy"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Buffer Manager\Page reads/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Buffer Manager\Page reads/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Buffer Manager\Page writes/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Buffer Manager\Page writes/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Database Flow Controls/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Database Flow Controls/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Mirrored Write Transactions/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Mirrored Write Transactions/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: File Bytes Received/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\File Bytes Received/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Group Commits/Sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Group Commits/Sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Group Commit Time|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Group Commit Time"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Log Bytes Compressed/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Log Bytes Compressed/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Log Bytes Decompressed/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Log Bytes Decompressed/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Log Bytes Received/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Log Bytes Received/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Log Compression Cache hits/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Log Compression Cache hits/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Log Compression Cache misses/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Log Compression Cache misses/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Log Compressions/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Log Compressions/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Log Decompressions/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Log Decompressions/sec"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Log remaining for undo|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Log remaining for undo"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}: Log Send Queue|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Database Replica(_Total)\Log Send Queue"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server, Instance {#INST}:Page IO latch waits/Waits started per second|<p>-</p>|`Zabbix agent`|perf_counter["\{#PERFCOUNTERNAME}:Wait Statistics(Waits started per second)\Page IO latch waits"]<p>Update: 1m</p><p>LLD</p>|
|SQL Server {#INST} Service State - {#INST}|<p>-</p>|`Zabbix agent`|service_state[MSSQL${#INST}]<p>Update: 10s</p><p>LLD</p>|
|SQL Agent {#INST} Service State - {#INST}|<p>-</p>|`Zabbix agent`|service_state[SQLAgent${#INST}]<p>Update: 10s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Errors in {#INST} ERRORLOG|<p>-</p>|<p>**Expression**: {App MSSQL 2008-2016 WSFC:log.count[{#ERRORLOG},Error|Failed,"UTF-16"].sum(5m)}>0</p><p>**Recovery expression**: </p>|warning|
|SQL Agent {#INST} Service state is not running|<p>-</p>|<p>**Expression**: {App MSSQL 2008-2016 WSFC:service_state[SQLAgent${#INST}].last(0)}>0 and {App MSSQL 2008-2016 WSFC:service_state[SQLAgent${#INST}].last(0)}<255</p><p>**Recovery expression**: </p>|high|
|SQL Server {#INST} Service state is not running|<p>-</p>|<p>**Expression**: {App MSSQL 2008-2016 WSFC:service_state[MSSQL${#INST}].last(0)}>0 and {App MSSQL 2008-2016 WSFC:service_state[MSSQL${#INST}].last(0)}<255</p><p>**Recovery expression**: </p>|high|
|Errors in {#INST} ERRORLOG (LLD)|<p>-</p>|<p>**Expression**: {App MSSQL 2008-2016 WSFC:log.count[{#ERRORLOG},Error|Failed,"UTF-16"].sum(5m)}>0</p><p>**Recovery expression**: </p>|warning|
|SQL Agent {#INST} Service state is not running (LLD)|<p>-</p>|<p>**Expression**: {App MSSQL 2008-2016 WSFC:service_state[SQLAgent${#INST}].last(0)}>0 and {App MSSQL 2008-2016 WSFC:service_state[SQLAgent${#INST}].last(0)}<255</p><p>**Recovery expression**: </p>|high|
|SQL Server {#INST} Service state is not running (LLD)|<p>-</p>|<p>**Expression**: {App MSSQL 2008-2016 WSFC:service_state[MSSQL${#INST}].last(0)}>0 and {App MSSQL 2008-2016 WSFC:service_state[MSSQL${#INST}].last(0)}<255</p><p>**Recovery expression**: </p>|high|
