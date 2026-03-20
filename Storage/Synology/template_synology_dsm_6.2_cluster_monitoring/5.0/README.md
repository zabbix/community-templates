# Zshare Synology Cluster

## Description

Template to monitor Synology HA Solution

## Overview

Template is based on [Synology MIB Guide](https://global.download.synology.com/download/Document/Software/DeveloperGuide/Firmware/DSM/All/enu/Synology_DiskStation_MIB_Guide.pdf) and monitor only an Synology HA Cluster


Is based on snmp v2 data from section Synology SHA MIB


Installation notes


1. Don't forget to set the right community name in template Macros section 


2. Before add to host set/add in Zabbix-> Administration -> General -> Value mapping


1. Synology Cluster Status


0 ⇒ normal  
1 ⇒ warning  
2 ⇒ critical  
3 ⇒ upgrading  
4 ⇒ processing


2. Synology Heartbeat Status


0 ⇒ normal  
1 ⇒ abnormal  
2 ⇒ disconnected  
3 ⇒ empty


3. Synology AutoFailover


1 ⇒ True  
2 ⇒ False


### Features


1. Items are explained in details


2. Triggers are explained and contain tags to show the problem details depending on received value


### Environment


Created and tested with:


* Synology DSM 6.2-24922on following models:  

	+ RS820RP+
* Zabbix version 4.0.0


### Note(s)


You can write questions also to [tudorticau@mail.ru](mailto:tudorticau@mail.ru)


Nice to read when will deploy Synology HA environment this [Synology HA White Paper](https://global.download.synology.com/download/Document/Software/WhitePaper/Package/HighAvailability/All/enu/Synology_SHA_White_Paper.pdf "Synology HA White Paper")


 



## Author

Tudor Ticau

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Heartbeat Transfer Speed|<p>Transfer speed of heartbeat in kilo-byte-per-second</p>|`SNMP agent`|heartbeatTxRate<p>Update: 60</p>|
|Active Server Name|<p>Hostname of active server/NAS</p>|`SNMP agent`|activeNodeName<p>Update: 60</p>|
|Cluster Name|<p>Hostname of High-Availability cluster</p>|`SNMP agent`|clusterName<p>Update: 60</p>|
|Cluster Status|<p>Status of High-Availability cluster Possible values: normal (0) - The High-Availability cluster is healthy warning (1) - The High-Availability cluster has something went wrong. Action should be taken to resume High-Availability feature. Please refer to High-Availability Manager for more details. critical (2) - The High-Availability cluster is in danger, and should be resolved as soon as possible.Please refer to High-Availability Manager for more details. upgrading (3) - The High-Availability cluster is upgrading. processing (4) - The High-Availability cluster is undergoing some operation.</p>|`SNMP agent`|clusterStatus<p>Update: 60</p>|
|Cluster AutoFailover|<p>Whether cluster can failover once something went wrong true (1) false (2)</p>|`SNMP agent`|clusterAutoFailover<p>Update: 60</p>|
|Heartbeat Status|<p>Status of heartbeat connection Possible values: normal (0) - The heartbeat connection is normal abnormal (1) - Some information about heartbeat is not available disconnected (2) - The High-Availability cluster loses connection to passive server through heartbeat interface, or it is currently in split-brain mode empty (3) - The High-Availability cluster has no passive server.</p>|`SNMP agent`|heartbeatStatus<p>Update: 60</p>|
|Passive Server Name|<p>Hostname of passive server</p>|`SNMP agent`|passiveNodeName<p>Update: 60</p>|
|Heartbeat Latency|<p>Heartbeat latency in microseconds (10^-6 seconds)</p>|`SNMP agent`|heartbeatLatency<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

