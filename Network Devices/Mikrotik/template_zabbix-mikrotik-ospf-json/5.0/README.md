# Mikrotik - OSPF LLD

## Overview

The Zabbix Mikrotik OSPF template for 4.0, which uses LLD, JSON, SSH for connection to Mikrotik router wihout externel scripts. Discovers OSPF neighbors and monitors STATE and changes. Uses one ssh connection to the Mikrotik for getting data. 


This template needs changing macroses:


{$MIKROTIK\_SSH\_PASS}


{$MIKROTIK\_SSH\_PORT}


{$MIKROTIK\_SSH\_USER}



## Author

AlKosmos

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MIKROTIK_SSH_PASS}|<p>-</p>|`11111`|Text macro|
|{$MIKROTIK_SSH_PORT}|<p>-</p>|`22`|Text macro|
|{$MIKROTIK_SSH_USER}|<p>-</p>|`mikmon`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OSPF - Neighbor|<p>-</p>|`SSH agent`|ssh.run[OSPF - Neighbor,,{$MIKROTIK_SSH_PORT},]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OSPF - Neighbor JSON|<p>-</p>|`SSH agent`|ssh.run[OSPF - Neighbor JSON,,{$MIKROTIK_SSH_PORT},]<p>Update: {$UPDATEINT}</p>|
|{#NUMBER}-{#ROUTERID}-{#ADDRESS}-{#INTERFACE}-state|<p>-</p>|`Dependent item`|state.[{#NUMBER},{#ROUTERID},{#ADDRESS},{#INTERFACE}]<p>Update: 0</p><p>LLD</p>|
|{#NUMBER}-{#ROUTERID}-{#ADDRESS}-{#INTERFACE}-statechange|<p>-</p>|`Dependent item`|statechange.[{#NUMBER},{#ROUTERID},{#ADDRESS},{#INTERFACE}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|OSPF Neighbor ({#NUMBER}-{#ROUTERID}-{#ADDRESS}-{#INTERFACE}) is not FULL|<p>-</p>|<p>**Expression**: {Mikrotik - OSPF LLD:state.[{#NUMBER},{#ROUTERID},{#ADDRESS},{#INTERFACE}].str(Full)}=0</p><p>**Recovery expression**: </p>|disaster|
|OSPF Neighbor ({#NUMBER}-{#ROUTERID}-{#ADDRESS}-{#INTERFACE}) state change  is to high|<p>-</p>|<p>**Expression**: {Mikrotik - OSPF LLD:statechange.[{#NUMBER},{#ROUTERID},{#ADDRESS},{#INTERFACE}].change()}>10</p><p>**Recovery expression**: </p>|disaster|
|OSPF Neighbor ({#NUMBER}-{#ROUTERID}-{#ADDRESS}-{#INTERFACE}) is not FULL (LLD)|<p>-</p>|<p>**Expression**: {Mikrotik - OSPF LLD:state.[{#NUMBER},{#ROUTERID},{#ADDRESS},{#INTERFACE}].str(Full)}=0</p><p>**Recovery expression**: </p>|disaster|
|OSPF Neighbor ({#NUMBER}-{#ROUTERID}-{#ADDRESS}-{#INTERFACE}) state change  is to high (LLD)|<p>-</p>|<p>**Expression**: {Mikrotik - OSPF LLD:statechange.[{#NUMBER},{#ROUTERID},{#ADDRESS},{#INTERFACE}].change()}>10</p><p>**Recovery expression**: </p>|disaster|
