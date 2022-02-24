# Mikrotik - BGP LLD

## Overview

The Zabbix Mikrotik BGP template for 4.0, which uses LLD, JSON, SSH for connection to Mikrotik router wihout externel scripts.


Inspired by: [https://share.zabbix.com/network\_devices/mikrotik/mikrotik-bgp-lld#login-modal](network_devices/mikrotik/mikrotik-bgp-lld#login-modal)


The diferenses is this template uses one ssh connection for getting all parametrs through JSON.


This template requires changing macroses:


{$MIKROTIK\_SSH\_PASS}


{$MIKROTIK\_SSH\_PORT}


{$MIKROTIK\_SSH\_USER}


 



## Author

AlKosmos

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MIKROTIK_SSH_PASS}|<p>-</p>|`1111`|Text macro|
|{$MIKROTIK_SSH_PORT}|<p>-</p>|`22`|Text macro|
|{$MIKROTIK_SSH_USER}|<p>-</p>|`mikmon`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP - Peers|<p>-</p>|`SSH agent`|ssh.run[,,{$MIKROTIK_SSH_PORT},]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP - Peer JSON|<p>-</p>|`SSH agent`|ssh.run[BGP - Peer JSON,,{$MIKROTIK_SSH_PORT},]<p>Update: {$UPDATEINT}</p>|
|{#PEERNAME} ({#REMOTEAS}) - Prefix|<p>-</p>|`Dependent item`|ssh.run[{#PEERNAME}-prefix,,{$MIKROTIK_SSH_PORT},]<p>Update: 0</p><p>LLD</p>|
|{#PEERNAME} ({#REMOTEAS}) - Status|<p>-</p>|`Dependent item`|ssh.run[{#PEERNAME}-status,,{$MIKROTIK_SSH_PORT},]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Peer {#PEERNAME} not established|<p>-</p>|<p>**Expression**: find(/Mikrotik - BGP LLD/ssh.run[{#PEERNAME}-status,,22,],,"like","established")=0</p><p>**Recovery expression**: </p>|disaster|
|Peer {#PEERNAME} not established (LLD)|<p>-</p>|<p>**Expression**: find(/Mikrotik - BGP LLD/ssh.run[{#PEERNAME}-status,,22,],,"like","established")=0</p><p>**Recovery expression**: </p>|disaster|
