# App MQTT  Service

## Overview

A very simple template+script for monitoring mosquitto.


 


 


 


 


 


 


CONFIG


/etc/zabbix/zabbix-agent.d/userparams\_mosquitto.conf


======================= CUT HERE ================================ 

```
# Mosquitto monitoring


#


# This content is licensed GNU GPL v2


# Author: Guido Rizzi ([guido.rizzi@studiorizzi.net](mailto:guido.rizzi@studiorizzi.net))


#


UserParameter=mosquitto[*],/etc/zabbix/scripts/mosquitto \$SYS/broker/$1 2>/dev/null

```
======================= CUT HERE ================================ 


 


SCRIPT


/etc/zabbix/scripts/mosquitto


======================= CUT HERE ================================ 

```
#!/bin/bash


mosquitto_sub -C 1 -u USERNAME -P PASSWORD -t "$1"
```

======================= CUT HERE ================================ 


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MQTT Messages Sent|<p>-</p>|`Zabbix agent`|mosquitto[/messages/sent]<p>Update: 30</p>|
|MQTT Clients Expired|<p>-</p>|`Zabbix agent`|mosquitto[clients/expired]<p>Update: 30</p>|
|MQTT AVG Bytes Sent|<p>-</p>|`Zabbix agent`|mosquitto[load/bytes/sent/5min]<p>Update: 30</p>|
|MQTT Clients Disconnected|<p>-</p>|`Zabbix agent`|mosquitto[clients/disconnected]<p>Update: 30</p>|
|MQTT Messages Inflight|<p>-</p>|`Zabbix agent`|mosquitto[messages/inflight]<p>Update: 30</p>|
|MQTT AVG Messages Sent|<p>-</p>|`Zabbix agent`|mosquitto[load/messages/sent/5min]<p>Update: 30</p>|
|MQTT Publish Sent|<p>-</p>|`Zabbix agent`|mosquitto[load/publish/sent/5min]<p>Update: 30</p>|
|MQTT Publish Received|<p>-</p>|`Zabbix agent`|mosquitto[load/publish/received/5min]<p>Update: 30</p>|
|MQTT Clients Max|<p>-</p>|`Zabbix agent`|mosquitto[clients/maximum]<p>Update: 30</p>|
|MQTT Messages Received|<p>-</p>|`Zabbix agent`|mosquitto[messages/received]<p>Update: 30</p>|
|MQTT Count Retained|<p>-</p>|`Zabbix agent`|mosquitto[retained/messages/count]<p>Update: 30</p>|
|MQTT Publish Dropped|<p>-</p>|`Zabbix agent`|mosquitto[load/publish//dropped/5min]<p>Update: 30</p>|
|MQTT Clients Total|<p>-</p>|`Zabbix agent`|mosquitto[clients/total]<p>Update: 30</p>|
|MQTT Count Subscriptions|<p>-</p>|`Zabbix agent`|mosquitto[subscriptions/count]<p>Update: 30</p>|
|MQTT Messages Stored|<p>-</p>|`Zabbix agent`|mosquitto[messages/stored]<p>Update: 30</p>|
|MQTT AVG Bytes Received|<p>-</p>|`Zabbix agent`|mosquitto[load/bytes/received/5min]<p>Update: 30</p>|
|MQTT AVG Messages Received|<p>-</p>|`Zabbix agent`|mosquitto[load/messages/received/5min]<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

