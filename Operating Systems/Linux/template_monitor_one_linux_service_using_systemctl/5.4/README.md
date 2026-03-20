# Monitor one Linux Services

## Overview

**This template will allow you to monitor one Linux Services using systemctl, and fire the alarm on zabbix Dashboard.**


it's very simple template without using User Parameter or Scripts Just item and trigger , if you want to monitor more than one services then you should create another item.


**Steps:**


1. Download the template
2. Import the template into zabbix
3. Assign the template to the host.


 


**Template Group --> Template/Linux**


**Tested on :** 


* Ubuntu 18
* CentOS 6
* Redhat 7


**Zabbix version 4.4.2**


 



## Author

Osama Mustafa

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Check ufw|<p>1= not found 0 = found</p>|`Zabbix agent`|system.run["systemctl status ufw | grep -q running;echo $?"]<p>Update: 10s</p>|


## Triggers

There are no triggers in this template.

