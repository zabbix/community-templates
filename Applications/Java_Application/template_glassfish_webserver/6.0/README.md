# App Glassfish server.jvm

## Overview

#SO LUONG KET NOI TICH LUY


UserParameter=glassfish.counttotalconnections-starttime,/home/glassfish/bin/asadmin --passwordfile /home/webserver2/asadminpass get --monitor server.network.http-listener-1.connection-queue.counttotalconnections-starttime | grep server |cut -d ' ' -f3


UserParameter=glassfish.counttotalconnections-count,/home/glassfish/bin/asadmin --passwordfile /home/webserver2/asadminpass get --monitor server.network.http-listener-1.connection-queue.counttotalconnections-count | grep server |cut -d ' ' -f3


#SO LUONG KET NOI DANG MO


UserParameter=glassfish.countopenconnections-count,/home/glassfish/bin/asadmin --passwordfile /home/webserver2/asadminpass get --monitor server.network.http-listener-1.connection-queue.countopenconnections-count | grep server |cut -d ' ' -f3


#SO LUONG KET NOI CO DUOC TRONG 5 PHUT


UserParameter=glassfish.countqueued5minutesaverage-count,/home/glassfish/bin/asadmin --passwordfile /home/webserver2/asadminpass get --monitor server.network.http-listener-1.connection-queue.countqueued5minutesaverage-count | grep server |cut -d ' ' -f3


 


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|jvm.memory.usednonheapsize-count-count|<p>-</p>|`Zabbix agent`|glassfish.usednonheapsize-count-count<p>Update: 300</p>|
|jvm.memory.maxnonheapsize-count-count|<p>-</p>|`Zabbix agent`|glassfish.maxnonheapsize-count-count<p>Update: 300</p>|
|jvm.thread-system.threadcount-count|<p>-</p>|`Zabbix agent`|glassfish.threadcount-count<p>Update: 120</p>|
|jvm.memory.maxheapsize-count-count|<p>-</p>|`Zabbix agent`|glassfish.maxheapsize-count-count<p>Update: 900</p>|
|jvm.memory.usedheapsize-count-count|<p>-</p>|`Zabbix agent`|glassfish.usedheapsize-count-count<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

