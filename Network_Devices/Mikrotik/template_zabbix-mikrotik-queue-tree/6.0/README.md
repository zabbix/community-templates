# Mikrotik-Queue-Tree

## Overview

Zabbix template for monitoring Mikrotik Queue Tree for Zabbix 4.x


Has been created in Zabbix 4.0, but exported from Zabbix 4.2


Needs to set up macroses:


{$HISTORY}


{$TRENDS}


{$UPDATEINT}



## Author

AlKosmos

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Mikrotik Queue Tree Table|<p>-</p>|`SNMP agent`|mktQueueTreeTable.discovery<p>Update: 10m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|mtxrQueueTreeDropped.[{#MKTQUEUETREENAME}]|<p>-</p>|`SNMP agent`|mtxrQueueTreeDropped.[{#MKTQUEUETREENAME}]<p>Update: {$UPDATEINT}</p><p>LLD</p>|
|mtxrQueueTreeHCBytes.[{#MKTQUEUETREENAME}]|<p>-</p>|`SNMP agent`|mtxrQueueTreeHCBytes.[{#MKTQUEUETREENAME}]<p>Update: {$UPDATEINT}</p><p>LLD</p>|
|mtxrQueueTreePackets.[{#MKTQUEUETREENAME}]|<p>-</p>|`SNMP agent`|mtxrQueueTreePackets.[{#MKTQUEUETREENAME}]<p>Update: {$UPDATEINT}</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

