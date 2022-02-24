# 1C Enterprise

## Overview

 **Zabbix 1C Enterprise**


Monitor sessions number for each base in cluster and for each cluster. Items names include base name and cluster name.


Using LLD for base discovery


Suggestions are welcome.


UPD Added items for monitoring


UPD2 Added converted to exe Python scripts, so you don't need install Python interpreter, but you need be very fearless to use exe files from Internet :)  




## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Infobases|<p>-</p>|`Zabbix agent`|1cEnt.infobases<p>Update: 2m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Infobase sessions {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Zabbix agent`|1cEnt.sessions[{#INFOBASE},{#CLUSTER}]<p>Update: 5m</p><p>LLD</p>|
|Total sessions in {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Calculated`|1cEnt.sessions.totalSessions[{#INFOBASE}, {#CLUSTER}]<p>Update: 5m</p><p>LLD</p>|
|Background jobs in {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Dependent item`|1cEnt.sessions.bjobs[{#INFOBASE}, {#CLUSTER}]<p>Update: 0</p><p>LLD</p>|
|Blocked objects by DBMS in {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Dependent item`|1cEnt.sessions.blocked-by-dbms[{#INFOBASE}, {#CLUSTER}]<p>Update: 0</p><p>LLD</p>|
|Data in {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Dependent item`|1cEnt.sessions.bytes-all[{#INFOBASE}, {#CLUSTER}]<p>Update: 0</p><p>LLD</p>|
|COM connections in {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Dependent item`|1cEnt.sessions.comconn[{#INFOBASE}, {#CLUSTER}]<p>Update: 0</p><p>LLD</p>|
|Block duration in {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Dependent item`|1cEnt.sessions.db-proc-took[{#INFOBASE}, {#CLUSTER}]<p>Update: 0</p><p>LLD</p>|
|Designer clients in {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Dependent item`|1cEnt.sessions.designers[{#INFOBASE}, {#CLUSTER}]<p>Update: 0</p><p>LLD</p>|
|Thick clients in {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Dependent item`|1cEnt.sessions.thickClient[{#INFOBASE}, {#CLUSTER}]<p>Update: 0</p><p>LLD</p>|
|Thin clients in {#NAME}, cluster {#CLUSTER_NAME}|<p>-</p>|`Dependent item`|1cEnt.sessions.thinClient[{#INFOBASE}, {#CLUSTER}]<p>Update: 0</p><p>LLD</p>|
|Web clients in {#NAME}, {#CLUSTER_NAME}|<p>-</p>|`Dependent item`|1cEnt.sessions.webclients[{#INFOBASE}, {#CLUSTER}]<p>Update: 0</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

