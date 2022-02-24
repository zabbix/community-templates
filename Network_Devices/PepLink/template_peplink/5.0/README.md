# Peplink

## Overview

*** LLD - SPEEDFUSION IN USE BY NAME**


- Item prototype - Speedfusion status


*** LLD - WAN IN USE BY NAME**


- Item prototype - Status wan


- Item prototype - Health check



## Author

Brunno Freitas Santos

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery_WAN|<p>-</p>|`SNMP agent`|wanName<p>Update: 30s</p>|
|Discovery_VPN|<p>-</p>|`SNMP agent`|pepVpnStatusId<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Health Check on {#WANNAME}|<p>-</p>|`SNMP agent`|wanHealthCheckState[{#WANNAME}]<p>Update: 30s</p><p>LLD</p>|
|Status on {#WANNAME}|<p>-</p>|`SNMP agent`|wanState[{#WANNAME}]<p>Update: 1m</p><p>LLD</p>|
|Status on {#PEPVPNNAME}|<p>-</p>|`SNMP agent`|pepVpnStatusConnectionState[{#PEPVPNNAME}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} Status SpeedFusion on {#PEPVPNNAME}|<p>-</p>|<p>**Expression**: {Peplink:pepVpnStatusConnectionState[{#PEPVPNNAME}].last()}<>4</p><p>**Recovery expression**: {Peplink:pepVpnStatusConnectionState[{#PEPVPNNAME}].last()}=4</p>|high|
|{HOST.NAME} : {#WANNAME} Link down|<p>-</p>|<p>**Expression**: {Peplink:wanState[{#WANNAME}].last()}<>3 and {Peplink:wanState[{#WANNAME}].last()}<>1</p><p>**Recovery expression**: {Peplink:wanState[{#WANNAME}].last()}=3 or {Peplink:wanState[{#WANNAME}].last()}=1</p>|high|
|{HOST.NAME} : {#WANNAME} Link down (LLD)|<p>-</p>|<p>**Expression**: {Peplink:wanState[{#WANNAME}].last()}<>3 and {Peplink:wanState[{#WANNAME}].last()}<>1</p><p>**Recovery expression**: {Peplink:wanState[{#WANNAME}].last()}=3 or {Peplink:wanState[{#WANNAME}].last()}=1</p>|high|
|{HOST.NAME} Status SpeedFusion on {#PEPVPNNAME} (LLD)|<p>-</p>|<p>**Expression**: {Peplink:pepVpnStatusConnectionState[{#PEPVPNNAME}].last()}<>4</p><p>**Recovery expression**: {Peplink:pepVpnStatusConnectionState[{#PEPVPNNAME}].last()}=4</p>|high|
