# App Pi-Hole

## Description

Domains Blocked DNS Queries Today Ads Blocked Today Ads Blocked Percentage Today Clients Ever Seen Unique Clients Reply NODATA Reply NXDOMAIN Reply CNAME Reply IP

## Overview

**Pi-Hole API**


**Auth integration:**  
Simply execute this command on Pi-Hole to retrieve API Token:



```
sudo cat /etc/pihole/setupVars.conf | grep PASSWORD | cut -d "=" -f2
```

  
Or go in the Pi-Hole WebUI > Settings > tab Api / Web Interface > button Show API Token.


Report the value in Zabbix:  
Configuration > Hosts > [your Pi-Hole] > Macros Tab > new macro:


* Macro: {$WEBPASSWORD}
* Value: [the result of the command executed on your Pi-Hole]


  
 **Changelog:** 


****Update 2020.8.3 (v1.4):****- added getQueryTypes dependent items + graph:


* MX
* DS
* RRSIG
* DNSKEY
* OTHER


  
******Update 2020.7.9 (v1.3):******- added Auth support  
  
****Update 2020.7.8 (v1.2):****- bugfixes in existing items (preprocessing stuff)  
- switch to "summaryRaw" URL (http://{HOST.IP}/admin/api.php?summaryRaw)  
- link this page to Pi-Hole API FAQ  
- template graphics  
- new API metrics: http://{HOST.IP}/admin/api.php?getQueryTypes  
  
getQueryTypes dependent items:


* A (IPv4)
* AAAA (IPv6)
* ANY
* NAPTR
* PTR
* SOA
* SRV
* TXT


**Initiale release (v1.1):**  
API SummaryRaw (no auth needed): http://{HOST.IP}/admin/api.php?summaryRaw  
API Dependent items:


* Ads blocked today
* Ads percentage today
* DNS queries all types
* DNS queries today
* Domains being blocked
* Queries cached
* Queries forwarded
* Reply CNAME
* Reply IP
* Reply NODATA
* Reply NXDOMAIN
* Clients ever seen
* Unique clients
* Unique domain


## Author

Undefined_ID

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Reply CNAME|<p>-</p>|`Dependent item`|json.pihole.reply_CNAME<p>Update: 0</p>|
|Queries cached|<p>-</p>|`Dependent item`|json.pihole.queries_cached<p>Update: 0</p>|
|TXT|<p>-</p>|`Dependent item`|json.pihole.querytypes.txt<p>Update: 0</p>|
|DNS queries all types|<p>-</p>|`Dependent item`|json.pihole.dns_queries_all_types<p>Update: 0</p>|
|MX|<p>-</p>|`Dependent item`|json.pihole.querytypes.mx<p>Update: 0</p>|
|OTHER|<p>-</p>|`Dependent item`|json.pihole.querytypes.other<p>Update: 0</p>|
|DS|<p>-</p>|`Dependent item`|json.pihole.querytypes.ds<p>Update: 0</p>|
|NAPTR|<p>-</p>|`Dependent item`|json.pihole.querytypes.naptr<p>Update: 0</p>|
|Queries forwarded|<p>-</p>|`Dependent item`|json.pihole.queries_forwarded<p>Update: 0</p>|
|Unique domains|<p>-</p>|`Dependent item`|json.pihole.unique_domains<p>Update: 0</p>|
|Ads blocked today|<p>-</p>|`Dependent item`|json.pihole.ads_blocked_today<p>Update: 0</p>|
|Reply NXDOMAIN|<p>-</p>|`Dependent item`|json.pihole.reply_NXDOMAIN<p>Update: 0</p>|
|RRSIG|<p>-</p>|`Dependent item`|json.pihole.querytypes.rrsig<p>Update: 0</p>|
|Clients ever seen|<p>-</p>|`Dependent item`|json.pihole.clients_ever_seen<p>Update: 0</p>|
|DNS queries today|<p>-</p>|`Dependent item`|json.pihole.dns_queries_today<p>Update: 0</p>|
|AAAA (IPv6)|<p>-</p>|`Dependent item`|json.pihole.querytypes.aaaa<p>Update: 0</p>|
|API_SummaryRaw|<p>-</p>|`HTTP agent`|json.pihole<p>Update: 1m</p>|
|A (IPv4)|<p>-</p>|`Dependent item`|json.pihole.querytypes.a<p>Update: 0</p>|
|DNSKEY|<p>-</p>|`Dependent item`|json.pihole.querytypes.dnskey<p>Update: 0</p>|
|SOA|<p>-</p>|`Dependent item`|json.pihole.querytypes.soa<p>Update: 0</p>|
|API_getQueryTypes|<p>-</p>|`HTTP agent`|json.pihole.querytypes<p>Update: 1m</p>|
|Reply IP|<p>-</p>|`Dependent item`|json.pihole.reply_IP<p>Update: 0</p>|
|Unique clients|<p>-</p>|`Dependent item`|json.pihole.unique_clients<p>Update: 0</p>|
|PTR|<p>-</p>|`Dependent item`|json.pihole.querytypes.ptr<p>Update: 0</p>|
|ANY|<p>-</p>|`Dependent item`|json.pihole.querytypes.any<p>Update: 0</p>|
|SRV|<p>-</p>|`Dependent item`|json.pihole.querytypes.srv<p>Update: 0</p>|
|Ads percentage today|<p>-</p>|`Dependent item`|json.pihole.ads_percentage_today<p>Update: 0</p>|
|Domains being blocked|<p>-</p>|`Dependent item`|json.pihole.domains_being_blocked<p>Update: 0</p>|
|Reply NODATA|<p>-</p>|`Dependent item`|json.pihole.reply_NODATA<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

