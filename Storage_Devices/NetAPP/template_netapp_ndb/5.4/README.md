
# # NDB port status checker

## Overview

Template for NDB NetApp plugin.



 You need to install this little script in the Zabbix Server [port_status.sh](https://github.com/PatxiAndueza/zabbix-stuff/blob/main/netapp-plugin-port-status-checker/ "port_status.sh")



## Author

PatxiAndueza

## Macros used

There are no macros links in this template.

## Template links

Template Module ICMP Ping

## Discovery rules

There are no discovery rules in this template.


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Management port|8080 bidirectional This port is used to manage the virtual appliance.|`Zabbix trapper`|vsc.9083|
|SnapCenter Plug-in for VMware vSphere port|8144 (HTTPS), bidirectional The port is used for communications from the vCenter vSphere web client and from the SnapCenter Server|`Zabbix trapper`|vsc.8144|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Closed Management port|<p>-</p>|<p>**Expression**: last(/NetApp Data Broker - NDB for VMware plug-in/ndb.8080,#1)<>"open"</p><p>**Recovery expression**: </p>|average|
|Closed SnapCenter Plug-in for VMware vSphere port|<p>-</p>|<p>**Expression**: last(/NetApp Data Broker - NDB for VMware plug-in/ndb.8144,#1)<>"open"</p><p>**Recovery expression**: </p>|high|