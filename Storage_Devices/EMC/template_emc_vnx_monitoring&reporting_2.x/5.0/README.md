# VNX_monitoring_and_reporting

## Overview

Use this template to monitor EMC VNX Monitoring&reporting aka VNX M&R vApp/linux instance via passive checks.


 


Installation instructions here: <https://github.com/Vnet-as/VNX_Monitoring_and_reporting>


 


Enjoy!



## Author

Peter Vilhan

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Topology|<p>-</p>|`Zabbix agent`|proc.num[java,vnx,,com.emc.srm.topology.TopoServiceApp]<p>Update: 30s</p>|
|Database|<p>-</p>|`Zabbix agent`|proc.num[,vnx,,/opt/VNX/Databases/MySQL/Default/bin/mysqld]<p>Update: 30s</p>|
|Web Portal|<p>-</p>|`Zabbix agent`|proc.num[java,vnx,,Web-Servers]<p>Update: 30s</p>|
|Backend|<p>-</p>|`Zabbix agent`|proc.num[java,vnx,,APG-Backend]<p>Update: 30s</p>|
|Collecting|<p>-</p>|`Zabbix agent`|proc.num[java,vnx,,com.watch4net.apg.v2.collector.Bootstrap]<p>Update: 30s</p>|
|Event processing|<p>-</p>|`Zabbix agent`|proc.num[java,vnx,,com.watch4net.events.processing.manager.Bootstrap]<p>Update: 30s</p>|
|Topology Mapping|<p>-</p>|`Zabbix agent`|proc.num[java,vnx,,com.emc.srm.topology.processor.TopoMappingServiceApp]<p>Update: 30s</p>|
|Scheduler|<p>-</p>|`Zabbix agent`|proc.num[java,vnx,,com.watch4net.apg.scheduler.Bootstrap]<p>Update: 30s</p>|
|Alerting|<p>-</p>|`Zabbix agent`|proc.num[java,vnx,,com.watch4net.alerting.engine.AlertingEngine]<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

