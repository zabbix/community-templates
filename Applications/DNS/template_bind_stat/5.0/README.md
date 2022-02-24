# DNS

## Overview

**Requirements**  
 Bind Server 9 and above  
 Zabbix Server 4+ and above  
 Zabbix Agent on monitored host  
  
  
**How it works**  
Include statistics in named.conf  
  
statistics-channels {  
 inet 127.0.0.1 port 8053 allow { 127.0.0.1; };  
 };


Include - zabbix\_agentd.d/bind.conf  
UserParameter=bind.net.udp,netstat -nua | grep :53 | wc -l  
UserParameter=bind.net.tcp,netstat -nta | grep :53 | wc -l  
UserParameter=bind.queries.in[*],curl http://127.0.0.1:8053/ 2>/dev/null | xml2 | grep -A1 "/statistics/server/counters/counter/@name=$1$" | tail -1 | cut -d= -f2  
UserParameter=bind.queries.out[*],curl http://127.0.0.1:8053/ 2>/dev/null | xml2 | grep -A1 "/statistics/views/view/counters/counter/@name=$1$" | tail -1 | cut -d= -f2  
UserParameter=bind.queries.query[*],curl http://127.0.0.1:8053/ 2>/dev/null | xml2 | grep -A1 "/statistics/server/counters/counter/@name=Qry$1$" | tail -1 | cut -d= -f2


![](http://img.dzek.ru/images/dns.jpg)



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Queries out SOA|<p>-</p>|`Zabbix agent`|bind.queries.out[SOA]<p>Update: 30</p>|
|Queries in MX|<p>-</p>|`Zabbix agent`|bind.queries.in[MX]<p>Update: 30</p>|
|Queries out MX|<p>-</p>|`Zabbix agent`|bind.queries.out[MX]<p>Update: 30</p>|
|Queries in CNAME|<p>-</p>|`Zabbix agent`|bind.queries.in[CNAME]<p>Update: 30</p>|
|Queries in ANY|<p>-</p>|`Zabbix agent`|bind.queries.in[ANY]<p>Update: 30</p>|
|Queries in TXT|<p>-</p>|`Zabbix agent`|bind.queries.in[TXT]<p>Update: 30</p>|
|Queries in AAAA|<p>-</p>|`Zabbix agent`|bind.queries.in[AAAA]<p>Update: 30</p>|
|Queries out A|<p>-</p>|`Zabbix agent`|bind.queries.out[A]<p>Update: 30</p>|
|Queries out NS|<p>-</p>|`Zabbix agent`|bind.queries.out[NS]<p>Update: 30</p>|
|Queries in A|<p>-</p>|`Zabbix agent`|bind.queries.in[A]<p>Update: 30</p>|
|Queries out TXT|<p>-</p>|`Zabbix agent`|bind.queries.out[TXT]<p>Update: 30</p>|
|Queries out AAAA|<p>-</p>|`Zabbix agent`|bind.queries.out[AAAA]<p>Update: 30</p>|
|Queries out ANY|<p>-</p>|`Zabbix agent`|bind.queries.out[ANY]<p>Update: 30</p>|
|Queries in SOA|<p>-</p>|`Zabbix agent`|bind.queries.in[SOA]<p>Update: 30</p>|
|Queries in SPF|<p>-</p>|`Zabbix agent`|bind.queries.in[SPF]<p>Update: 30</p>|
|Queries in PTR|<p>-</p>|`Zabbix agent`|bind.queries.in[PTR]<p>Update: 30</p>|
|Queries out PTR|<p>-</p>|`Zabbix agent`|bind.queries.out[PTR]<p>Update: 30</p>|
|Queries in NS|<p>-</p>|`Zabbix agent`|bind.queries.in[NS]<p>Update: 30</p>|
|Queries out CNAME|<p>-</p>|`Zabbix agent`|bind.queries.out[CNAME]<p>Update: 30</p>|
|Queries out SPF|<p>-</p>|`Zabbix agent`|bind.queries.out[SPF]<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

