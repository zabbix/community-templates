# Cisco AXL Feature Service Status

## Overview

CUCM Feature Service Status request from AXL


Запрос информации о статусе сервисов CUCM через AXL.


 


Необходим Application User с правами на чтение AXL API


Application user name: {$ZABBIX\_APIUSER\_UC}


Applicatuin user passwd: {$ZABBIX\_APIUSER\_UC}


 


 



## Author

Andrey

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Cisco Database Layer Monitor|<p>-</p>|`Dependent item`|axlCUCMserviceDatabaseLayerMonitor<p>Update: 0</p>|
|Service Status getXML|<p>-</p>|`HTTP agent`|axl_ServiceStatusXML<p>Update: 30s</p>|
|Cisco DHCP Monitor Service|<p>-</p>|`Dependent item`|axlCUCMserviceDHCP<p>Update: 0</p>|
|A Cisco DB Replicator|<p>-</p>|`Dependent item`|axlCUCMserviceReplicator<p>Update: 0</p>|
|Cisco IP Voice Media Streaming App|<p>-</p>|`Dependent item`|axlCUCMserviceStreamingApp<p>Update: 0</p>|
|Cisco Tftp|<p>-</p>|`Dependent item`|axlCUCMserviceTftp<p>Update: 0</p>|
|Cisco CallManager|<p>-</p>|`Dependent item`|axlCUCMserviceCallManager<p>Update: 0</p>|
|Service A Cisco DB|<p>-</p>|`Dependent item`|axlCUCMserviceCiscoDB<p>Update: 0</p>|
|Cisco Push Notification Service|<p>-</p>|`Dependent item`|axlCUCMservicePUSH<p>Update: 0</p>|
|Cisco CTIManager|<p>-</p>|`Dependent item`|axlCUCMserviceCTIManager<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

