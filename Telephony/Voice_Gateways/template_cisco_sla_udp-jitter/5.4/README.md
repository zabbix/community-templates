# VoIP IPSLA Discovery

## Overview

command IPSLA on router:


ip sla 1111


 udp-jitter 1.1.1.1 49333 source-ip 2.2.2.2 codec g729a


 tag Region


ip sla schedule 1111 life forever start-time now


 


template will get all information like "sh ip sla statistics", don't forget use tag.


 



## Author

Andrey

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IPSLA tag discover|<p>-</p>|`SNMP agent`|discoverySLA<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Jitter AVG from {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_JitterAVG_from.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Lantancy MAX to {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_LatancyMAX_to.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|RTTmax between {#SNMPVALUE} and host|<p>-</p>|`SNMP agent`|SLADiscovery_RTTmax.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|MOS score {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_MOS.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Packet Loss from {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_Lost_to_host.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Packet Loss to {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_Lost_from_host.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Lantancy MIN to {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_Latancymin_to.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Lantancy MIN from {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_Latancymin_from.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Lantancy MAX from {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_LatancyMAX_from.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Jitter AVG to {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_JitterAVG_to.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Lantancy AVG to {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_LatancyAVG_to.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Lantancy AVG from {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_LatancyAVG_from.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Jitter MIN to {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_JitterMIN_to.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Jitter MIN from {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_JitterMIN_from.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Jitter MAX to {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_JitterMAX_to.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Jitter MAX from {#SNMPVALUE}|<p>-</p>|`SNMP agent`|SLADiscovery_JitterMAX_from.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|RTTmin between {#SNMPVALUE} and host|<p>-</p>|`SNMP agent`|SLADiscovery_RTTmin.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Packet Loss for {#SNMPVALUE}|<p>-</p>|<p>**Expression**: avg(/VoIP IPSLA Discovery/SLADiscovery_Lost_to_host.[{#SNMPINDEX}],300s)>10 or avg(/VoIP IPSLA Discovery/SLADiscovery_Lost_from_host.[{#SNMPINDEX}],300s)>10</p><p>**Recovery expression**: </p>|high|
|Please check the link between {HOST.NAME} and {#SNMPVALUE}|<p>-</p>|<p>**Expression**: avg(/VoIP IPSLA Discovery/SLADiscovery_RTTmax.[{#SNMPINDEX}],120s)=0</p><p>**Recovery expression**: </p>|high|
|Packet Loss for {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: avg(/VoIP IPSLA Discovery/SLADiscovery_Lost_to_host.[{#SNMPINDEX}],300s)>10 or avg(/VoIP IPSLA Discovery/SLADiscovery_Lost_from_host.[{#SNMPINDEX}],300s)>10</p><p>**Recovery expression**: </p>|high|
|Please check the link between {HOST.NAME} and {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: avg(/VoIP IPSLA Discovery/SLADiscovery_RTTmax.[{#SNMPINDEX}],120s)=0</p><p>**Recovery expression**: </p>|high|
