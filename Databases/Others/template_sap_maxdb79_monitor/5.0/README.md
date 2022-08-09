# SAP MaxDB Monitor

## Overview
The template monitors SAP MaxDB database baselines. Сollection and transfer of data from the database to the Zabbix 
agent is performed by the custom library **maxdb-dbm-monitor.jar**, which in turn uses **sapdbc.jar** from 
[SAP MaxDB Database Studio](https://help.sap.com/docs/SAP_NETWEAVER_DBOS/e55b190e1c0b462bbaabd2ad8eb6a692/e9005dac1592496783e26133eb7fad0b.html). 
All indicators of the database are retrieved by commands similar to the Database Studio console; the library does not 
directly access database tables by SQL queries.  
Detailed description of the template are located here [https://github.com/onlycrab/maxdb-dbm-monitor/tree/master/src/zabbix](https://github.com/onlycrab/maxdb-dbm-monitor/tree/master/src/zabbix).

## Author
Roman Rynkovich

## How to add plugin to zabbix-agent
### Standalone server
1. Place the contents of the `zabbixRoot` directory from the `maxdb-dbm-monitor-zabbix.zip` archive into the root 
directory of the zabbix-agent configuration. Make changes to the agent configuration file, similar to the file 
`~zabbix_agentd.conf`. If you are already using the `Include` directive, change it or place `maxdb.conf` so that `maxdb.conf` 
match within its definition.
2. Place the `maxdb-dbm-monior.jar` and `sapdbc.jar` libraries in the `<zabbixRoot>\plugins\maxdb\` directory.  
3. For linux-like systems, make sure the zabbix-agent daemon has enough access to the plugin's directories and files.  
4. Restart the zabbix-agent service.
5. Make sure the settings are correct. To do this, follow  
for Windows  
`<zabbixRoot>\zabbix-agentd.exe -c <zabbixRoot>\zabbix-agentd.conf -t maxdb.discovery[]`  
for Linux  
`/usr/sbin/zabbix-agentd -c <zabbixRoot>/zabbix-agentd.conf -t maxdb.discovery[]`  
If the settings are correct, you will get a list of MaxDB database names as a result, or an empty list if the MaxDB 
database is not found.  
In case of an error in the settings, the result of the command will contain a textual description of the error.
### Microsoft failover cluster
1. In order to correctly connect the cluster object to zabbix, you need to install a second instance of zabbix-agent 
service on each cluster node. Cmd command example:  
`sc create "Zabbix Agent Cluster" binPath= "c:\zabbixCluster\zabbix_agentd.exe -c c:\zabbixCluster\zabbix_agentd.win.conf" displayname= "Zabbix Agent Cluster" start= auto`  
2. On the zabbix-server, create a host for the cluster object.  
3. Then follow all steps in sequence as for the case with a standalone server.

## Macros used
|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MAXDBHOST}|<p>Node on which the MaxDB instance is running.</p>|`localhost`|Text macro|
|{$MAXDBUSER}|<p>Read-access MaxDB instance user.</p>|``|Text macro|
|{$MAXDBPASS}|<p>Read-access MaxDB instance password.</p>|``|Text macro|
|{$MAXDBPASSFILE}|<p>Absolute path to the file containing authorization data. The file is prioritized. That is, if you specify authentication data both in the macroses {$MAXDBUSER}{$MAXDBPASS} and in the file, data from the file will be used.</p>|`c:\zabbix\plugins\maxdb\.pass`|Text macro|
|{$MAXDBINIPATH}|<p>ONLY FOR LINUX SYSTEMS! Absolute path to Installations.ini file (for MaxDB and XServer discovery). By default "/sapdb/data/config/Installations.ini".</p>|``|Text macro|
|{$MAXDBEXCLUDEDB}|<p>Exclude database name from DB and XServer discovery. Excluded db-names must be separated by comma (f.e. "ADB,BDB").</p>|``|Text macro|
|{$MAXDBONLYDB}|<p>Discover only DB in this list (for DB instances and XServer) discovery. Db-names must be separated by comma (f.e. "ADB,BDB").</p>|``|Text macro|
|{$MAXDB_DA_FREEBYTESLIMIT}|<p>DataArea top filling limit for triggering (by default = 50 Gbytes).</p>|`52427776`|Text macro|
|{$MAXDB_LA_FREEBYTESLIMIT}|<p>LogArea top filling limit for triggering (by default = 50 Gbytes).</p>|`52427776`|Text macro|
|{$MAXDB_ZMACROS}|<p>Custom macros. This value will be returned from node with the DB response.</p>|`backup_daily_dat_days=12345#backup_daily_dat_time=080000`|Text macro|

## Template links
There are no template links in this template.

## Discovery rules
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MaxDB discovery|<p>Discover of MaxDB installations</p>|`Zabbix agent`|maxdb.discovery[{$MAXDBINIPATH},{$MAXDBEXCLUDEDB},{$MAXDBONLYDB}]<p>Update: 4h</p>|
|XServer discovery|<p>Discovery of XServer installations</p>|`Zabbix agent`|xserver.discovery[{$MAXDBINIPATH},{$MAXDBEXCLUDEDB},{$MAXDBONLYDB}]<p>Update: 4h</p>|

## Items collected
### XServer
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#XSERVERNAME} data|<p>XServer status data</p>|`Zabbix agent`|xserver.data[localhost,{#XSERVERPORT}]<p>Update: 5m</p>|
|{#XSERVERNAME} availability|<p>XServer availability</p>|`Dependent item`|xserver.state[{#XSERVERNAME},{#XSERVERPORT}]|
|{#XSERVERNAME} error|<p>XServer checker error</p>|`Dependent item`|xserver.error[{#XSERVERNAME}]|
### Power
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#MAXDBNAME} power state data|<p>Data map for command <db_state></p>|`Zabbix agent`|maxdb.power[{$MAXDBHOST},{#MAXDBNAME},{$MAXDBUSER},{$MAXDBPASS},{$MAXDBPASSFILE},{$MAXDB_ZMACROS}]<p>Update: 5m</p>|
|{#MAXDBNAME} power state|<p>DB power state</p>|`Dependent item`|maxdb.power.state[{#MAXDBNAME}]|
|{#MAXDBNAME} get power state error|<p>Error getting power state data</p>|`Dependent item`|maxdb.power.error[{#MAXDBNAME}]|
### Info state
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#MAXDBNAME} info state data|<p>Data map for command <info state></p>|`Zabbix agent`|maxdb.infostate[{$MAXDBHOST},{#MAXDBNAME},{$MAXDBUSER},{$MAXDBPASS},{$MAXDBPASSFILE},{$MAXDB_ZMACROS}]<p>Update: 5m</p>|
|{#MAXDBNAME} Bad devspaces count|<p>Number of bad devspases</p>|`Dependent item`|maxdb.common.bad_devspaces[{#MAXDBNAME}]|
|{#MAXDBNAME} Bad indexes count|<p>Number of bad indexes</p>|`Dependent item`|maxdb.common.bad_indexes[{#MAXDBNAME}]|
|{#MAXDBNAME} Command monitoring|<p>Is command monitoring enabled</p>|`Dependent item`|maxdb.common.command_monitoring[{#MAXDBNAME}]|
|{#MAXDBNAME} Connect possible|<p>Is it possible to create a new connection to {#MAXDBNAME}</p>|`Dependent item`|maxdb.common.connect_possible[{#MAXDBNAME}]|
|{#MAXDBNAME} DataArea bytes|<p>Number of bytes of data in DataArea</p>|`Dependent item`|maxdb.data.bytes[{#MAXDBNAME}]|
|{#MAXDBNAME} DataArea is full|<p>Is DataArea full</p>|`Dependent item`|maxdb.data.full[{#MAXDBNAME}]|
|{#MAXDBNAME} DataArea MAX bytes|<p>Number of maximum possible bytes of data in DataArea</p>|`Dependent item`|maxdb.data.max_bytes[{#MAXDBNAME}]|
|{#MAXDBNAME} DataArea percentage|<p>Percentage of used space in DataArea</p>|`Dependent item`|maxdb.data.percentage[{#MAXDBNAME}]|
|{#MAXDBNAME} DataArea permanent bytes|<p>Number of bytes of permanent data in DataArea</p>|`Dependent item`|maxdb.data.perm_bytes[{#MAXDBNAME}]|
|{#MAXDBNAME} DataArea permanent percentage|<p>Percentage of used space by permanent data in DataArea</p>|`Dependent item`|maxdb.data.perm_percentage[{#MAXDBNAME}]|
|{#MAXDBNAME} DataArea temporarily bytes|<p>Number of bytes of temporarily data in DataArea</p>|`Dependent item`|maxdb.data.temp_data_bytes[{#MAXDBNAME}]|
|{#MAXDBNAME} DataArea temporarily percentage|<p>Percentage of used space by temporarily data in DataArea</p>|`Dependent item`|maxdb.data.temp_data_percentage[{#MAXDBNAME}]|
|{#MAXDBNAME} DataArea volumes count|<p>Number of DataArea volumes</p>|`Dependent item`|maxdb.data.volumes_count[{#MAXDBNAME}]|
|{#MAXDBNAME} DB monitoring|<p>Is database monitoring enabled</p>|`Dependent item`|maxdb.common.database_monitoring[{#MAXDBNAME}]|
|{#MAXDBNAME} get info state data error|<p>Error getting info state data</p>|`Dependent item`|maxdb.infostate.error[{#MAXDBNAME}]|
|{#MAXDBNAME} Kernel trace|<p>Is kernel trace enabled</p>|`Dependent item`|maxdb.common.kernel_trace[{#MAXDBNAME}]|
|{#MAXDBNAME} LogArea is full|<p>Is LogArea full</p>|`Dependent item`|maxdb.log.full[{#MAXDBNAME}]|
|{#MAXDBNAME} sessions active|<p>Number of active sessions</p>|`Dependent item`|maxdb.sessions.active[{#MAXDBNAME}]|
|{#MAXDBNAME} sessions active percentage|<p>Percentage of active sessions</p>|`Dependent item`|maxdb.sessions.active_percentage[{#MAXDBNAME}]|
|{#MAXDBNAME} sessions MAX|<p>Number of maximum possible sessions</p>|`Dependent item`|maxdb.sessions.max[{#MAXDBNAME}]|
### Log
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#MAXDBNAME} LogArea info|<p>Data map for command <info log></p>|`Zabbix agent`|maxdb.log[{$MAXDBHOST},{#MAXDBNAME},{$MAXDBUSER},{$MAXDBPASS},{$MAXDBPASSFILE},{$MAXDB_ZMACROS}]<p>Update: 5m</p>|
|{#MAXDBNAME} get log info error|<p>Error getting log info data</p>|`Dependent item`|maxdb.log.error[{#MAXDBNAME}]|
|{#MAXDBNAME} LogArea bytes|<p>Number of bytes of data in LogArea</p>|`Dependent item`|maxdb.log.bytes[{#MAXDBNAME}]|
|{#MAXDBNAME} LogArea MAX bytes|<p>Number of maximum possible bytes of data in LogArea</p>|`Dependent item`|maxdb.log.max_bytes[{#MAXDBNAME}]|
|{#MAXDBNAME} LogArea percentage|<p>Percentage of used space in LogArea</p>|`Dependent item`|maxdb.log.percentage[{#MAXDBNAME}]|
|{#MAXDBNAME} LogArea auto override ON|<p>Is override mode ON for LogArea</p>|`Dependent item`|maxdb.log.autooverride[{#MAXDBNAME}]|
|{#MAXDBNAME} LogArea is mirrored|<p>Is LogArea mirrored</p>|`Dependent item`|maxdb.log.mirrored[{#MAXDBNAME}]|
|{#MAXDBNAME} LogArea is writing|<p>Is LogArea writing</p>|`Dependent item`|maxdb.log.writing[{#MAXDBNAME}]|
### Parameters
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#MAXDBNAME} parameters data|<p>List of changed parameters for command <info params></p>|`Zabbix agent`|maxdb.params.diff[{$MAXDBHOST},{#MAXDBNAME},{$MAXDBUSER},{$MAXDBPASS},{$MAXDBPASSFILE},{$MAXDB_ZMACROS}]<p>Update: 15m</p>|
|{#MAXDBNAME} parameters difference|<p>List of changed DB parameters</p>|`Dependent item`|maxdb.params.diff.value[{#MAXDBNAME}]|
|{#MAXDBNAME} get parameters difference error|<p>Error getting parameters difference data</p>|`Dependent item`|maxdb.params.diff.error[{#MAXDBNAME}]|
### Cache hit rate
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#MAXDBNAME} cache hit rate|<p>Data map for command <info caches></p>|`Zabbix agent`|maxdb.cache.hitrate[{$MAXDBHOST},{#MAXDBNAME},{$MAXDBUSER},{$MAXDBPASS},{$MAXDBPASSFILE},{$MAXDB_ZMACROS}]<p>Update: 5m</p>|
|{#MAXDBNAME} Cache catalog hit rate|<p>Percentage of successful accesses to catalog cache</p>|`Dependent item`|maxdb.cache.hitrate.catalog[{#MAXDBNAME}]|
|{#MAXDBNAME} Cache command execute hit rate|<p>Percentage of successful accesses to command execute cache</p>|`Dependent item`|maxdb.cache.hitrate.commandexecute[{#MAXDBNAME}]|
|{#MAXDBNAME} Cache command prepare hit rate|<p>Percentage of successful accesses to command prepare cache</p>|`Dependent item`|maxdb.cache.hitrate.commandprepare[{#MAXDBNAME}]|
|{#MAXDBNAME} Cache data hit rate|<p>Percentage of successful accesses to data cache</p>|`Dependent item`|maxdb.cache.hitrate.data[{#MAXDBNAME}]|
|{#MAXDBNAME} Cache sequence hit rate|<p>Percentage of successful accesses to sequence cache</p>|`Dependent item`|maxdb.cache.hitrate.sequence[{#MAXDBNAME}]|
|{#MAXDBNAME} get caches hitrate error|<p>Error getting caches hitrate data</p>|`Dependent item`|maxdb.cache.hitrate.error[{#MAXDBNAME}]|
### Locks
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#MAXDBNAME} locks|<p>Data map for command <info locks></p>|`Zabbix agent`|maxdb.locks[{$MAXDBHOST},{#MAXDBNAME},{$MAXDBUSER},{$MAXDBPASS},{$MAXDBPASSFILE},{$MAXDB_ZMACROS}]<p>Update: 5m</p>|
|{#MAXDBNAME} locks collisions|<p>Number of lock collisions</p>|`Dependent item`|maxdb.locks.collisions[{#MAXDBNAME}]|
|{#MAXDBNAME} locks entries average used|<p>Number of average entries used for locks and lock requests</p>|`Dependent item`|maxdb.locks.entries.avgused[{#MAXDBNAME}]|
|{#MAXDBNAME} locks entries MAX|<p>Number of entries available for locks and lock requests</p>|`Dependent item`|maxdb.locks.entries.max[{#MAXDBNAME}]|
|{#MAXDBNAME} locks escalations|<p>Number of row locks from which the row locks are converted into table locks (lock escalation)</p>|`Dependent item`|maxdb.locks.escalations[{#MAXDBNAME}]|
|{#MAXDBNAME} locks request timeout|<p>Timeout of locks request</p>|`Dependent item`|maxdb.locks.requesttimeout[{#MAXDBNAME}]|
|{#MAXDBNAME} locks rows|<p>Number of row locks held</p>|`Dependent item`|maxdb.locks.rows[{#MAXDBNAME}]|
|{#MAXDBNAME} locks tables|<p>Number of table locks held</p>|`Dependent item`|maxdb.locks.tables[{#MAXDBNAME}]|
|{#MAXDBNAME} get locks info error|<p>Error getting locks data</p>|`Dependent item`|maxdb.locks.error[{#MAXDBNAME}]|
### Backup
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#MAXDBNAME} backup data|<p>Data map for command <backup_history_list -c LABEL,START,STOP,RC,ERROR -Inverted></p>|`Zabbix agent`|maxdb.backup[{$MAXDBHOST},{#MAXDBNAME},{$MAXDBUSER},{$MAXDBPASS},{$MAXDBPASSFILE},{$MAXDB_ZMACROS}]<p>Update: 30m</p>|
|{#MAXDBNAME} get backup info error|<p>Error getting backup status data</p>|`Dependent item`|maxdb.backup.error[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT daily ckeck time|<p>Time of day from which the status of the daily copy will be checked</p>|`Dependent item`|maxdb.backup.dat.checktime[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT daily ckeck today|<p>Flag whether it is necessary to check the status of the daily copy today</p>|`Dependent item`|maxdb.backup.dat.checkdaily[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT duration|<p>Last DataArea backup duration</p>|`Dependent item`|maxdb.backup.dat.duration[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT end date|<p>Last DataArea backup end date</p>|`Dependent item`|maxdb.backup.dat.enddate[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT end time|<p>Last DataArea backup end time</p>|`Dependent item`|maxdb.backup.dat.endtime[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT message|<p>Last DataArea backup message</p>|`Dependent item`|maxdb.backup.dat.message[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT number|<p>Last DataArea backup number</p>|`Dependent item`|maxdb.backup.dat.number[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT start date|<p>Last DataArea backup start date</p>|`Dependent item`|maxdb.backup.dat.startdate[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT start time|<p>Last DataArea backup start time</p>|`Dependent item`|maxdb.backup.dat.starttime[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup DAT successful|<p>Is Last DataArea backup successful</p>|`Dependent item`|maxdb.backup.dat.successful[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup LOG duration|<p>Last LogArea backup duration</p>|`Dependent item`|maxdb.backup.log.duration[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup LOG end date|<p>Last LogArea backup end date</p>|`Dependent item`|maxdb.backup.log.enddate[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup LOG end time|<p>Last LogArea backup end time</p>|`Dependent item`|maxdb.backup.log.endtime[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup LOG message|<p>Last LogArea backup message</p>|`Dependent item`|maxdb.backup.log.message[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup LOG number|<p>Last LogArea backup number</p>|`Dependent item`|maxdb.backup.log.number[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup LOG start date|<p>Last LogArea backup start date</p>|`Dependent item`|maxdb.backup.log.startdate[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup LOG start time|<p>Last LogArea backup start time</p>|`Dependent item`|maxdb.backup.log.starttime[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup LOG successful|<p>Is Last LogArea backup successful</p>|`Dependent item`|maxdb.backup.log.successful[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup PAG duration|<p>Last DataArea incremental backup duration</p>|`Dependent item`|maxdb.backup.pag.duration[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup PAG end date|<p>Last DataArea incremental backup end date</p>|`Dependent item`|maxdb.backup.pag.enddate[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup PAG end time|<p>Last DataArea incremental backup end time</p>|`Dependent item`|maxdb.backup.pag.endtime[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup PAG message|<p>Last DataArea incremental backup message</p>|`Dependent item`|maxdb.backup.pag.message[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup PAG number|<p>Last DataArea incremental backup number</p>|`Dependent item`|maxdb.backup.pag.number[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup PAG start date|<p>Last DataArea incremental backup start date</p>|`Dependent item`|maxdb.backup.pag.startdate[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup PAG start time|<p>Last DataArea incremental backup start time</p>|`Dependent item`|maxdb.backup.pag.starttime[{#MAXDBNAME}]|
|{#MAXDBNAME} Backup PAG successful|<p>Is last DataArea incremental backup successful</p>|`Dependent item`|maxdb.backup.pag.successful[{#MAXDBNAME}]|

## Triggers
|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Cant get {#MAXDBNAME} power state|<p>This error occurs when the monitoring system cannot get data about the power state of the database for a long time. Possible reasons: - critical database error; - <maxdb-dbm-monitor.jar> library command execution error; - no connection to the server.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.power.state[{#MAXDBNAME}].nodata(16m)}=1</p><p>**Recovery expression**: </p>|hight|
|{#MAXDBNAME} all sessions are busy|<p>This error occurs when the session limit has been reached in the database, which means it is not possible to create a new connection to the database.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.sessions.active_percentage[{#MAXDBNAME}].last()}=100</p><p>**Recovery expression**: </p>|hight|
|{#MAXDBNAME} DataArea is full|<p>This error occurs when the database runs out of free space. For the correct operation of the database, you need to free up some space or create a new DataArea volume.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.data.full[{#MAXDBNAME}].last()}=1</p><p>**Recovery expression**: </p>|hight|
|{#MAXDBNAME} error occurred at getting power state info|<p>This error occurs when an exception occurs when the maxdb-dbm-monitor library executes <db_state> command. You need to analyze the message and fix the error.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.power.error[{#MAXDBNAME}].strlen()}>1</p><p>**Recovery expression**: </p>|hight|
|{#MAXDBNAME} is OFFLINE|<p>This error occurs when the database is in the state OFFLINE or UNKNOWN.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.power.state[{#MAXDBNAME}].last()}=0 or {MaxDB DBMMonitor:maxdb.power.state[{#MAXDBNAME}].last()}=4</p><p>**Recovery expression**: </p>|hight|
|{#MAXDBNAME} LogArea is full|<p>This error occurs when the database runs out of free LogArea space. For the correct operation of the database, you need to backup LogArea or create a new LogAre volume.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.log.full[{#MAXDBNAME}].last()}=1</p><p>**Recovery expression**: </p>|hight|
|{#XSERVERNAME} is not available on {#XSERVERPORT}|<p>This error occurs when it is not possible to connect to the XServer service.</p>|<p>**Expression**: {MaxDB DBMMonitor:xserver.state[{#XSERVERNAME},{#XSERVERPORT}].last()}=0</p><p>**Recovery expression**: </p>|warning|
|{#XSERVERNAME} error occurred at getting data|<p>This error occurs when an exception occurs in a maxdb-dbm-monitor library call. You need to analyze the message and fix the error.</p>|<p>**Expression**: {MaxDB DBMMonitor:xserver.error[{#XSERVERNAME}].strlen()}>1</p><p>**Recovery expression**: </p>|warning|
|{#MAXDBNAME} connect not possible|<p>This error occurs when the DB reports that it cannot be connected to.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.common.connect_possible[{#MAXDBNAME}].last()}=0</p><p>**Recovery expression**: </p>|warning|
|{#MAXDBNAME} DataArea few space left|<p>DataArea cells are filled almost to the limit. It is necessary to analyze the increase in the amount of data in the database.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.data.percentage[{#MAXDBNAME}].last()}>90 and ({MaxDB DBMMonitor:maxdb.data.max_bytes[{#MAXDBNAME}].last()}-{MaxDB DBMMonitor:maxdb.data.bytes[{#MAXDBNAME}].last()})<{$MAXDB_DA_FREEBYTESLIMIT}</p><p>**Recovery expression**: </p>|warning|
|{#MAXDBNAME} DAT daily backup not found|<p>Daily backup process has not been started, or is still in progress.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.backup.dat.checkdaily[{#MAXDBNAME}].last()}=1 and {MaxDB DBMMonitor:maxdb.backup.dat.enddate[{#MAXDBNAME}].last()}<>{MaxDB DBMMonitor:maxdb.backup[{$MAXDBHOST},{#MAXDBNAME},{$MAXDBUSER},{$MAXDBPASS},{$MAXDBPASSFILE},{$MAXDB_ZMACROS}].date()} and {MaxDB DBMMonitor:maxdb.backup.dat.checktime[{#MAXDBNAME}].last()}<{MaxDB DBMMonitor:maxdb.backup[{$MAXDBHOST},{#MAXDBNAME},{$MAXDBUSER},{$MAXDBPASS},{$MAXDBPASSFILE},{$MAXDB_ZMACROS}].time()}</p><p>**Recovery expression**: </p>|warning|
|{#MAXDBNAME} error occurred at getting DB info|<p>This error occurs when an exception occurs when the maxdb-dbm-monitor library executes info command. You need to parse the message and fix the error.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.backup.error[{#MAXDBNAME}].strlen()}>1 or {MaxDB DBMMonitor:maxdb.cache.hitrate.error[{#MAXDBNAME}].strlen()}>1 or {MaxDB DBMMonitor:maxdb.infostate.error[{#MAXDBNAME}].strlen()}>1 or {MaxDB DBMMonitor:maxdb.locks.error[{#MAXDBNAME}].strlen()}>1 or {MaxDB DBMMonitor:maxdb.log.error[{#MAXDBNAME}].strlen()}>1 or {MaxDB DBMMonitor:maxdb.params.diff.error[{#MAXDBNAME}].strlen()}>1</p><p>**Recovery expression**: </p>|warning|
|{#MAXDBNAME} few sessions left|<p>This message occurs when the number of connections to the database has almost reached the limit. It is necessary to analyze opened database connections.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.sessions.active_percentage[{#MAXDBNAME}].last()}>90</p><p>**Recovery expression**: </p>|warning|
|{#MAXDBNAME} last DAT backup failed|<p>This error occurs when the last DataArea full backup failed.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.backup.dat.successful[{#MAXDBNAME}].last()}=0</p><p>**Recovery expression**: </p>|warning|
|{#MAXDBNAME} last LOG backup failed|<p>This error occurs when the last LogArea backup failed.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.backup.log.successful[{#MAXDBNAME}].last()}=0 and {MaxDB DBMMonitor:maxdb.log.autooverride[{#MAXDBNAME}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{#MAXDBNAME} last PAG backup failed|<p>This error occurs when the last DataArea incremental backup failed.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.backup.pag.successful[{#MAXDBNAME}].last()}=0</p><p>**Recovery expression**: </p>|warning|
|{#MAXDBNAME} LogArea few space left|<p>LogArea cells are filled almost to the limit. It is necessary to analyze the increase in the amount of data in the LogArea or run backup task.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.log.percentage[{#MAXDBNAME}].last()}>90 and ({MaxDB DBMMonitor:maxdb.log.max_bytes[{#MAXDBNAME}].last()}-{MaxDB DBMMonitor:maxdb.log.bytes[{#MAXDBNAME}].last()})<{$MAXDB_LA_FREEBYTESLIMIT}</p><p>**Recovery expression**: </p>|warning|
|There are new bad devspaces in the database {#MAXDBNAME}|<p>This message informs that there are new bad devspaces in the database.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.common.bad_devspaces[{#MAXDBNAME}].change()}>0</p><p>**Recovery expression**: </p>|info|
|There are new bad indexes in the database {#MAXDBNAME}|<p>This message informs that there are new bad indexes in the database.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.common.bad_indexes[{#MAXDBNAME}].change()}>0</p><p>**Recovery expression**: </p>|info|
|{#MAXDBNAME} command monitoring disabled|<p>This message informs that command monitoring mode has been disabled in the database.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.common.command_monitoring[{#MAXDBNAME}].last()}=0</p><p>**Recovery expression**: </p>|info|
|{#MAXDBNAME} database monitoring disabled|<p>This message informs that databese monitoring mode has been disabled in the database.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.common.database_monitoring[{#MAXDBNAME}].last()}=0</p><p>**Recovery expression**: </p>|info|
|{#MAXDBNAME} is not ONLINE|<p>This message informs that databese is up, but not in ONLINE state.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.power.state[{#MAXDBNAME}].last()}=2 or {MaxDB DBMMonitor:maxdb.power.state[{#MAXDBNAME}].last()}=3</p><p>**Recovery expression**: </p>|info|
|{#MAXDBNAME} kernel trace disabled|<p>This message informs that kernel trace mode has been disabled in the database.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.common.kernel_trace[{#MAXDBNAME}].last()}=0</p><p>**Recovery expression**: </p>|info|
|{#MAXDBNAME} LogArea auto override mode changed|<p>This message informs that the LogArea overwrite mode has been changed.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.log.autooverride[{#MAXDBNAME}].change()}<>0</p><p>**Recovery expression**: </p>|info|
|{#MAXDBNAME} LogArea mirror mode changed|<p>This message informs that the LogArea mirror mode has been changed.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.log.mirrored[{#MAXDBNAME}].change()}<>0</p><p>**Recovery expression**: </p>|info|
|{#MAXDBNAME} LogArea writing mode changed|<p>This message informs that the LogArea writing mode has been changed.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.log.writing[{#MAXDBNAME}].change()}<>0</p><p>**Recovery expression**: </p>|info|
|{#MAXDBNAME} number of volumes in DataArea was been changed|<p>This message informs that the number of volumes in DataArea has been changed. Disable this trigger if dynamic DataArea adjustment is enabled.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.data.volumes_count[{#MAXDBNAME}].diff()}<>0</p><p>**Recovery expression**: </p>|info|
|{#MAXDBNAME} parameters was been changed|<p>This message informs about the change of one or more database parameters.</p>|<p>**Expression**: {MaxDB DBMMonitor:maxdb.params.diff.value[{#MAXDBNAME}].strlen()}>0</p><p>**Recovery expression**: </p>|info|
