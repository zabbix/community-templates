# Huawei NE40E - BGP

## Description

Template para monitoramento de sessão BGP

## Overview

Template to discovery all bgp peers and to create a trigger when the session bgp peer is down



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Huawei BGP Peering|<p>Regra que descobre informações de Peering BGP</p>|`SNMP agent`|snmp.peering.discovery<p>Update: 5m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Peer: {#PEERADDR}-AS{#PEERASN}|<p>Item que busca o estado da sessão bgp de cada peer. O estado varia de 1 a 6</p>|`SNMP agent`|snmp.bgp.rem.addr.[{#PEERADDR}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Peer: {#PEERADDR}-AS{#PEERASN} - Down|<p>Trigger que informa queda na sessão bgp. Caso o stado for diferente de 6, então o peer está down.</p>|<p>**Expression**: last(/Huawei NE40E - BGP/snmp.bgp.rem.addr.[{#PEERADDR}])<>6</p><p>**Recovery expression**: last(/Huawei NE40E - BGP/snmp.bgp.rem.addr.[{#PEERADDR}])=6</p>|high|
|Peer: {#PEERADDR}-AS{#PEERASN} - Down (LLD)|<p>Trigger que informa queda na sessão bgp. Caso o stado for diferente de 6, então o peer está down.</p>|<p>**Expression**: last(/Huawei NE40E - BGP/snmp.bgp.rem.addr.[{#PEERADDR}])<>6</p><p>**Recovery expression**: last(/Huawei NE40E - BGP/snmp.bgp.rem.addr.[{#PEERADDR}])=6</p>|high|
