# RavenDB Server

## Overview

Zabbix template for RavenDB via SNMP.

### Usage

- Please modify the macros to match your instance specifications and your workload. Recommended values are:
    - `MANAGED_MEMORY_RECOVERY_THRESHOLD` around 65% of total machine RAM
    - `MANAGED_MEMORY_THRESHOLD` around 75% of total machine RAM
    - `UNMANAGED_MEMORY_THRESHOLD` around 25% of total machine RAM

## Authors

Grzegorz Lachowski

Bartosz Piekarski

## Macros used

|Name|Description|Default|
|---|---|---|
| {$MANAGED_MEMORY_RECOVERY_THRESHOLD} | Managed memory recovery threshold | 2.5G |
| {$MANAGED_MEMORY_THRESHOLD} | Managed memory threshold | 3G |
| {$UNMANAGED_MEMORY_THRESHOLD} | Unmanaged memory threshold | 1G |


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
| Current node state | - | SNMP_AGENT | cluster.currentNode.state |
| Cluster term | - | SNMP_AGENT | cluster.term |
| Time since oldest backup | - | SNMP_AGENT | databases.backups.oldestBackupTime |
| Writes/sec | - | SNMP_AGENT | databases.bytesWritten |
| Databases # / Faulty | - | SNMP_AGENT | databases.faulty |
| Indexes # / All | - | SNMP_AGENT | databases.indexes.all |
| Indexes # / Error | - | SNMP_AGENT | databases.indexes.error |
| Indexes # / Faulty | - | SNMP_AGENT | databases.indexes.faulty |
| Maps/sec in Map | - | SNMP_AGENT | databases.indexes.mapsPerSecInMap |
| Maps/sec in Map/Reduce | - | SNMP_AGENT | databases.indexes.mapsPerSecInMapReduce |
| Reduces/sec in Map/Reduce | - | SNMP_AGENT | databases.indexes.reducesPerSecInMapReduce |
| Indexes # / Stale | - | SNMP_AGENT | databases.indexes.stale |
| Available worker threads | - | SNMP_AGENT | server.availableWorkerThreads |
| Number of running backups | - | SNMP_AGENT | server.backups.running |
| Free disk space | - | SNMP_AGENT | server.disk.freeSpace |
| Free disk space in % | - | SNMP_AGENT | server.disk.freeSpacePercentage |
| IO Queue Length | - | SNMP_AGENT | server.io.queue.length |
| IOPS read | - | SNMP_AGENT | server.iops.read |
| IOPS write | - | SNMP_AGENT | server.iops.write |
| IOwait | - | SNMP_AGENT | server.iowait |
| License Expiration Left | - | SNMP_AGENT | server.license.expirationLeft |
| Low memory flag | - | SNMP_AGENT | server.lowMemory |
| Machine CPU usage | - | SNMP_AGENT | server.machine.cpu.util |
| Total SWAP size | - | SNMP_AGENT | server.machine.swap.totalSize |
| SWAP usage | - | SNMP_AGENT | server.machine.swap.util |
| Allocated memory | - | SNMP_AGENT | server.memory.allocated |
| Available memory | - | SNMP_AGENT | server.memory.available |
| Dirty memory | - | SNMP_AGENT | server.memory.dirty |
| Managed memory | - | SNMP_AGENT | server.memory.managed |
| Unmanaged memory | - | SNMP_AGENT | server.memory.unmanaged |
| Process ID | - | SNMP_AGENT | server.pid |
| Server process CPU usage % | - | SNMP_AGENT | server.process.cpu.util |
| Public Server URL | - | SNMP_AGENT | server.publicUrl |
| Average request duration | - | SNMP_AGENT | server.requests.avgDuration |
| Req/s | - | SNMP_AGENT | server.requests.persecond |
| Number of expired client certificates | - | SNMP_AGENT | server.security.certificates.expired |
| Number of expiring client certificates | - | SNMP_AGENT | server.security.certificates.expiring |
| Server certificate expiration left | - | SNMP_AGENT | server.security.serverCertificateExpirationLeft |
| Server certificate expiration date | - | SNMP_AGENT | server.security.serverCertificateExpiresAt |
| Active TCP Connections | - | SNMP_AGENT | server.tcpConnections.active |
| IO read throughput | - | SNMP_AGENT | server.throughput.read |
| IO write throughput | - | SNMP_AGENT | server.throughput.write |
| Uptime | - | SNMP_AGENT | server.uptime |
| Version | - | SNMP_AGENT | server.version |



## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
| Cluster node state changed | - | change(/RavenDB server/cluster.currentNode.state)=1 | INFO |
| Sudden term increase (over 10/min) | - | (max(/RavenDB server/cluster.term,60s)-min(/RavenDB server/cluster.term,60s))>=10 | WARNING |
| Faulty databases | - | last(/RavenDB server/databases.faulty)>0 | HIGH |
| Error Indexes | - | last(/RavenDB server/databases.indexes.error)>0 | AVERAGE |
| Faulty indexes | - | last(/RavenDB server/databases.indexes.faulty)>0 | HIGH |
| Some indexes are stale | - | avg(/RavenDB server/databases.indexes.stale,1800s)>1 | WARNING |
| Backup is running | - | last(/RavenDB server/server.backups.running)>0 | INFO |
| Low Storage Free Disk Space | - | last(/RavenDB server/server.disk.freeSpace)<15000 | AVERAGE |
| Very Low Storage Free Disk Space | - | last(/RavenDB server/server.disk.freeSpace)<3000 | HIGH |
| Free space lower than 5% | - | last(/RavenDB server/server.disk.freeSpacePercentage)<=5 | HIGH |
| Free space lower than 15% | - | last(/RavenDB server/server.disk.freeSpacePercentage)<=15 | AVERAGE |
| IOwait is high | - | avg(/RavenDB server/server.iowait,30s)>20 | AVERAGE |
| Server license expires in less than 3 days | - | last(/RavenDB server/server.license.expirationLeft)<=259200 | HIGH |
| Server license expires in less than 14 days | - | last(/RavenDB server/server.license.expirationLeft)<=1209600 | WARNING |
| Low Memory mode | - | last(/RavenDB server/server.lowMemory)>0 | WARNING |
| High Machine CPU usage | - | avg(/RavenDB server/server.machine.cpu.util,60s)>70 | WARNING |
| Managed mem is high | - | last(/RavenDB server/server.memory.managed)>={$MANAGED_MEMORY_THRESHOLD} | AVERAGE |
| Unmanaged mem is over threshold | - | last(/RavenDB server/server.memory.unmanaged)>={$UNMANAGED_MEMORY_THRESHOLD} | WARNING |
| Restarted | - | change(/RavenDB server/server.pid)=1 | INFO |
| High Process CPU usage | - | avg(/RavenDB server/server.process.cpu.util,60s)>70 | WARNING |
| Client certificate expired | - | change(/RavenDB server/server.security.certificates.expired)>0 | AVERAGE |
| Client certificate expiring | - | change(/RavenDB server/server.security.certificates.expiring)>0 | WARNING |
| Down | - | nodata(/RavenDB server/server.uptime,300s)=1 | DISASTER |
| Server version changed | - | change(/RavenDB server/server.version)=1 | INFO |


