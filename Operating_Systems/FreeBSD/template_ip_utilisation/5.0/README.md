# FreeBSD IP statistics

## Overview

Keep track of IPv4 and IPv6 statistics on FreeBSD.




---


 


In /usr/local/etc/zabbix3/zabbix\_agentd.conf, add:



```
UserParameter=net.ip4[*],netstat -s -p ip | awk '/$1/{ print $$1}'  
UserParameter=net.ip6[*],netstat -s -p ip6 | awk '/$1/{ print $$1}'
```



---


 


Template might work on earlier Zabbix versions, only tested for 3.0.x



## Author

RedShift

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|U IPv4 total packets received|<p>-</p>|`Zabbix agent (active)`|net.ip4[total packets received]<p>Update: 30</p>|
|U IPv6 total packets received|<p>-</p>|`Zabbix agent (active)`|net.ip6[total packets received]<p>Update: 30</p>|
|U IPv6 Packets sent|<p>-</p>|`Zabbix agent (active)`|net.ip6[packets sent from this host]<p>Update: 30</p>|
|U IPv4 Packet sent|<p>-</p>|`Zabbix agent (active)`|net.ip4[packets sent from this host]<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

