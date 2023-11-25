# DNS bind statistics

## Overview

**Requirements**  

Instead xml2 command, which was used in previous template version and unfortunately is not present at EL8 and newer RHEL based systems this template uses jq command and parses directly Json output of Bind statistic-channels. Added more values, Graphs and Dashboard.

 Bind Server 9 and above  
 Zabbix Server 4+ and above  
 Zabbix Agent on monitored host
 Installed jq and curl utility 
  
  
**How it works**  
Include statistics in named.conf  
  
/etc/named.conf

statistics-channels {
	inet 127.0.0.1 port 8053 allow { 127.0.0.1; };
};


semanage port --add -t dns_port_t -p tcp 8053
systemctl restart named
dnf install jq curl

Include - zabbix\_agentd.d/bind_jq.conf 
UserParameter=bind.queries.jq[*],curl $3 2>/dev/null | jq ".$1.$2"

## Macros used

|Name|Description|
|----|-----------|
|{$BIND_STAT_URL}|URL of bind statistic-channels, default http://127.0.0.1:8053/json|

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Port 53BIND|<p>-</p>|`Zabbix agent`|net.udp.listen[53]<p>Update: 5m</p>|
|Queries A|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,A,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries AAAA|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,AAAA,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries ANY|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,ANY,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries AuthAns|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,QryAuthAns,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries AXFR|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,AXFR,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries CDNSKEY|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,CDNSKEY,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries CNAME|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,CNAME,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries DNSKEY|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,DNSKEY,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries Dropped|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,QryDropped,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries DS|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,DS,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries Failure|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,QryFailure,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries HTTPS|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,HTTPS,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries MX|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,MX,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries NS|<p>-</p>|`Zabbix agent`|	bind.queries.jq[qtypes,NS,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries NXDOMAIN|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,QryNXDOMAIN,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries Nxrrset|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,QryNxrrset,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries Others|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,Others,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries PTR|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,PTR,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries Requestv4|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,Requestv4,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries Requestv6|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,Requestv6,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries RRSIG|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,RRSIG,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries SOA|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,SOA,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries SPF|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,SPF,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries SRV|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,SRV,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries Success|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,QrySuccess,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries TCP|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,QryTCP,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries TLSA|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,TLSA,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries TXT|<p>-</p>|`Zabbix agent`|bind.queries.jq[qtypes,TXT,{$BIND_STAT_URL}]<p>Update: 30</p>|
|Queries UDP|<p>-</p>|`Zabbix agent`|bind.queries.jq[nsstats,QryUDP,{$BIND_STAT_URL}]<p>Update: 30</p>|


## Triggers

|Name|Description|Expression|Recovery Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------------------|--------|--------------------------------|
|BIND: Port not opened (UDP 53) at {HOST.HOST}||`min(/DNS-bind stat jq/net.udp.listen[53],#3)<>1`|`min(/DNS-bind stat jq/net.udp.listen[53],#10)=1`|Disaster||


