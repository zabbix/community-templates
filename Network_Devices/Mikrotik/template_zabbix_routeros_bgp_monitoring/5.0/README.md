# RouterOS BGP

## Overview

For more details using this template, take a look at the [repository](https://github.com/MrCirca/zabbix-routeros-bgp)


 



## Author

MrCirca

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ROUTEROS_PASSWORD}|<p>-</p>|`zabbix_discovery`|Text macro|
|{$ROUTEROS_USERNAME}|<p>-</p>|`zabbix`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP peer names|<p>-</p>|`External check`|bgp_peer_names.sh["{HOST.CONN}","{$ROUTEROS_USERNAME}","{$ROUTEROS_PASSWORD}"]<p>Update: 10</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP peer {#BGP_PEER_NAME} state|<p>-</p>|`External check`|bgp_peer_field.sh["{HOST.CONN}", "{$ROUTEROS_USERNAME}", "{$ROUTEROS_PASSWORD}", {#BGP_PEER_NAME}, "state"]<p>Update: 5</p><p>LLD</p>|
|BGP peer {#BGP_PEER_NAME} uptime|<p>-</p>|`External check`|bgp_peer_field.sh["{HOST.CONN}", "{$ROUTEROS_USERNAME}", "{$ROUTEROS_PASSWORD}", {#BGP_PEER_NAME}, "uptime"]<p>Update: 5</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BGP peer {#BGP_PEER_NAME} state is not established|<p>-</p>|<p>**Expression**: {RouterOS BGP:bgp_peer_field.sh["*UNKNOWN*", "zabbix", "zabbix_discovery", {#BGP_PEER_NAME}, "state"].last(#5)}<4 and {RouterOS BGP:bgp_peer_field.sh["*UNKNOWN*", "zabbix", "zabbix_discovery", {#BGP_PEER_NAME}, "state"].last(#5)}>0</p><p>**Recovery expression**: </p>|warning|
|BGP peer {#BGP_PEER_NAME} state is not established (LLD)|<p>-</p>|<p>**Expression**: {RouterOS BGP:bgp_peer_field.sh["*UNKNOWN*", "zabbix", "zabbix_discovery", {#BGP_PEER_NAME}, "state"].last(#5)}<4 and {RouterOS BGP:bgp_peer_field.sh["*UNKNOWN*", "zabbix", "zabbix_discovery", {#BGP_PEER_NAME}, "state"].last(#5)}>0</p><p>**Recovery expression**: </p>|warning|
