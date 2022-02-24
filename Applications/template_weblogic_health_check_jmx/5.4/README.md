# WeblogicHealth

## Overview

##### Weblogic monitoring using JMX


##### <https://sath.com/weblogic-monitoring-zabbix-jmx/>


 



## Author

Argha Chatterjee

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|SOASERVER2|<p>-</p>|`JMX agent`|jmx["com.bea:Name=soa_server2,Type=ServerRuntime","State"]<p>Update: 30s</p>|
|OIMSERVER2|<p>-</p>|`JMX agent`|jmx["com.bea:Name=oim_server2,Type=ServerRuntime","State"]<p>Update: 30s</p>|
|SOASERVER1|<p>-</p>|`JMX agent`|jmx["com.bea:Name=soa_server1,Type=ServerRuntime","State"]<p>Update: 30s</p>|
|OIMSERVER1 Average Connection Count|<p>-</p>|`JMX agent`|jmx["com.bea:ServerRuntime=oim_server1,Name=ApplicationDB,Type=JDBCConnectionPoolRuntime","ActiveConnectionsAverageCount"]<p>Update: 30s</p>|
|OIMSERVER1|<p>-</p>|`JMX agent`|jmx["com.bea:Name=oim_server1,Type=ServerRuntime","State"]<p>Update: 30s</p>|
|OIMSERVER1 Leaked Connection Count|<p>-</p>|`JMX agent`|jmx["com.bea:ServerRuntime=oim_server1,Name=ApplicationDB,Type=JDBCConnectionPoolRuntime","LeakedConnectionCount"]<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

