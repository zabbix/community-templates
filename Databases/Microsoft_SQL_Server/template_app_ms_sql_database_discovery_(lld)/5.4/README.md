# Template App MS SQL DB Discovery

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$INSTANCE01}|<p>-</p>|`SQLServer`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MS SQL DB Discovery|<p>Discovers databases within a single instance specified in a Powershell script.</p>|`Zabbix agent`|windowsdb.discovery<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{$INSTANCE01} Databases {#DBS} Active Transactions|<p>Number of active transactions for the database.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Active Transactions",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Flush Write Time (ms)|<p>Time in milliseconds for performing writes of log flushes that were completed in the last second.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Flush Write Time (ms)",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Transactions/sec|<p>Number of transactions started for the database per second.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Transactions/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Tracked transactions/sec|<p>Number of committed transactions recorded in the commit table for the database.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Tracked transactions/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Shrink Data Movement Bytes/sec|<p>Amount of data being moved per second by autoshrink operations, or DBCC SHRINKDATABASE or DBCC SHRINKFILE statements.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Shrink Data Movement Bytes/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Repl. Trans. Rate|<p>Number of transactions per second read out of the transaction log of the publication database and delivered to the distribution database.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Repl. Trans. Rate",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Repl. Pending Xacts|<p>Number of transactions in the transaction log of the publication database marked for replication, but not yet delivered to the distribution database.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Repl. Pending Xacts",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Percent Log Used|<p>Percentage of space in the log that is in use.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Percent Log Used",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Truncations|<p>The number of times the transaction log has been shrunk.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Truncations",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Shrinks|<p>Total number of times the transaction log for the database has been shrunk.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Shrinks",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Pool Requests/sec|<p>The number of log-block requests processed by the log pool.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Pool Requests/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Pool Disk Reads/sec|<p>Number of disk reads that the log pool issued to fetch log blocks.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Pool Disk Reads/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Pool Cache Misses/sec|<p>Number of requests for which the log block was not available in the log pool. The log pool is an in-memory cache of the transaction log. This cache is used to optimize reading the log for recovery, transaction replication, rollback, and AlwaysOn Availability Groups.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Pool Cache Misses/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Growths|<p>Total number of times the transaction log for the database has been expanded.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Growths",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Flush Wait Time|<p>Total wait time (in milliseconds) to flush the log. On an AlwaysOn secondary database, this value indicates the wait time for log records to be hardened to disk.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Flush Wait Time",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Bulk Copy Rows/sec|<p>Number of rows bulk copied per second.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Bulk Copy Rows/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Flush Waits/sec|<p>Number of commits per second waiting for the log flush.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Flush Waits/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Flushes/sec|<p>Number of log flushes per second.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Flushes/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log File(s) Used Size (KB)|<p>The cumulative used size of all the log files in the database.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log File(s) Used Size (KB)",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log File(s) Size (KB)|<p>Cumulative size (in kilobytes) of all the transaction log files in the database.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log File(s) Size (KB)",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Cache Reads/sec|<p>Reads performed per second through the log manager cache.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Cache Reads/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Cache Hit Ratio|<p>Percentage of log cache reads satisfied from the log cache.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Cache Hit Ratio",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Log Bytes Flushed/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Log Bytes Flushed/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Group Commit Time/sec|<p>-</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Group Commit Time/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} DBCC Logical Scan Bytes/sec|<p>Number of logical read scan bytes per second for database console commands (DBCC).</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\DBCC Logical Scan Bytes/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Data File(s) Size (KB)|<p>Cumulative size (in kilobytes) of all the data files in the database including any automatic growth. Monitoring this counter is useful, for example, for determining the correct size of tempdb.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Data File(s) Size (KB)",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Commit Table Entries|<p>The size of the in-memory portion of the commit table for the database.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Commit Table Entries",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Bulk Copy Throughput/sec|<p>Amount of data bulk copied (in kilobytes) per second.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Bulk Copy Throughput/sec",300]<p>Update: 30</p><p>LLD</p>|
|{$INSTANCE01} Databases {#DBS} Write Transactions/sec|<p>Number of transactions that wrote to the database and committed, in the last second.</p>|`Zabbix agent`|perf_counter["\{$INSTANCE01}:Databases({#DBS})\Write Transactions/sec",300]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#DBS} Log Flush Waits/sec|<p>The number of times per second that SQL Server must wait for pages to be written to the transaction log.</p>|<p>**Expression**: avg(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Log Flush Waits/sec",300],600s)>0.1</p><p>**Recovery expression**: </p>|warning|
|{#DBS} Log Flush Wait Time|<p>Total wait time, in milliseconds, to write all transaction log pages.</p>|<p>**Expression**: avg(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Log Flush Wait Time",300],600s)>0.1</p><p>**Recovery expression**: </p>|warning|
|{#DBS} Log Growths|<p>Total number of times the transaction log for the database has been expanded. Each time the transaction log grows, all user activity must halt until the log growth completes. Therefore, you want log growths to occur during predefined maintenance windows rather than during general working hours</p>|<p>**Expression**: avg(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Log Growths",300],600s)>0.1</p><p>**Recovery expression**: </p>|warning|
|{#DBS} Log Shrinks|<p>Total number of times the transaction log for the database has been shrunk.</p>|<p>**Expression**: avg(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Log Shrinks",300],600s)>0.1</p><p>**Recovery expression**: </p>|warning|
|{#DBS} Percent Log Used|<p>Percentage of space in the log that is in use. Since all work in an OLTP database stops until writes can occur to the transaction log, it’s a very good idea to ensure that the log never fills completely. Hence, the recommendation to keep the log under 80% full.</p>|<p>**Expression**: last(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Percent Log Used",300])>80</p><p>**Recovery expression**: </p>|warning|
|{#DBS} Log Flush Waits/sec (LLD)|<p>The number of times per second that SQL Server must wait for pages to be written to the transaction log.</p>|<p>**Expression**: avg(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Log Flush Waits/sec",300],600s)>0.1</p><p>**Recovery expression**: </p>|warning|
|{#DBS} Log Flush Wait Time (LLD)|<p>Total wait time, in milliseconds, to write all transaction log pages.</p>|<p>**Expression**: avg(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Log Flush Wait Time",300],600s)>0.1</p><p>**Recovery expression**: </p>|warning|
|{#DBS} Log Growths (LLD)|<p>Total number of times the transaction log for the database has been expanded. Each time the transaction log grows, all user activity must halt until the log growth completes. Therefore, you want log growths to occur during predefined maintenance windows rather than during general working hours</p>|<p>**Expression**: avg(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Log Growths",300],600s)>0.1</p><p>**Recovery expression**: </p>|warning|
|{#DBS} Log Shrinks (LLD)|<p>Total number of times the transaction log for the database has been shrunk.</p>|<p>**Expression**: avg(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Log Shrinks",300],600s)>0.1</p><p>**Recovery expression**: </p>|warning|
|{#DBS} Percent Log Used (LLD)|<p>Percentage of space in the log that is in use. Since all work in an OLTP database stops until writes can occur to the transaction log, it’s a very good idea to ensure that the log never fills completely. Hence, the recommendation to keep the log under 80% full.</p>|<p>**Expression**: last(/Template App MS SQL DB Discovery/perf_counter[" SQLServer:Databases({#DBS}) Percent Log Used",300])>80</p><p>**Recovery expression**: </p>|warning|
