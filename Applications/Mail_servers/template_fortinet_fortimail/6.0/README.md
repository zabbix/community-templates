# Fortimail 60D

## Author

Mikhail Norenberg

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU_USAGE_MAX}|<p>-</p>|`90`|Text macro|
|{$LOG_DISK_USAGE_MAX}|<p>-</p>|`90`|Text macro|
|{$MAIL_DISK_USAGE_MAX}|<p>-</p>|`90`|Text macro|
|{$MEMORY_USAGE_MAX}|<p>-</p>|`90`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Mail Queue|<p>-</p>|`SNMP agent`|fmlMailQueueName<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Product Model|<p>-</p>|`SNMP agent`|fmlSysModel<p>Update: 1h</p>|
|Product Firmware Version|<p>-</p>|`SNMP agent`|fmlSysVersion<p>Update: 1h</p>|
|System Load|<p>-</p>|`SNMP agent`|fmlSysSysLoad<p>Update: 30s</p>|
|Product Serial Number|<p>-</p>|`SNMP agent`|fmlSysSerial<p>Update: 1h</p>|
|CPU Usage|<p>-</p>|`SNMP agent`|fmlSysCpuUsage<p>Update: 30s</p>|
|Log Disk Usage|<p>-</p>|`SNMP agent`|fmlSysLogDiskUsage<p>Update: 30s</p>|
|Mail Disk Usage|<p>-</p>|`SNMP agent`|fmlSysMailDiskUsage<p>Update: 30s</p>|
|Operational Mode|<p>-</p>|`SNMP agent`|fmlSysOpMode<p>Update: 1h</p>|
|Session count|<p>-</p>|`SNMP agent`|fmlSysSesCount<p>Update: 30s</p>|
|Memory Usage|<p>-</p>|`SNMP agent`|fmlSysMemUsage<p>Update: 30s</p>|
|Antivirus DB Version|<p>-</p>|`SNMP agent`|fmlSysVersionAV<p>Update: 1h</p>|
|[{#FMLMAILQUEUENAME}] Mail Count|<p>-</p>|`SNMP agent`|fmlMailQueueMailCount.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|[{#FMLMAILQUEUENAME}] Mail Size|<p>-</p>|`SNMP agent`|fmlMailQueueMailSize.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

