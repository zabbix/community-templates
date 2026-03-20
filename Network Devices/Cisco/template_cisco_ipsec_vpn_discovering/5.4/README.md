# Cisco IPsec VPN discovering

## Overview

 Zabbix SNMP template for discovering and monitoring cisco IPsec tunnels


 [github](https://github.com/Denis1215/Zabbix "This project on the github")


howto:


1. Import template to zabbix


2. Put MIB files to the folder /usr/share/snmp/mibs/


3. Add host (cisco router) to zabbix (snmp)


4. Add template to the host


 


Required MIB files:


CISCO-IPSEC-FLOW-MONITOR-MIB.my


SNMPv2-SMI.my


SNMPv2-CONF.my


SNMPv2-TC.my


CISCO-MEDIA-GATEWAY-MIB.my


CISCO-SMI.my



## Author

Denis Pavlov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VPN Tunnels|<p>-</p>|`SNMP agent`|cikeTunActiveTime<p>Update: 10m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Active time of  tunnel {#LOCAL}---{#REMOTE}|<p>-</p>|`SNMP agent`|cikeTunActiveTime[{#LOCAL}---{#REMOTE}]<p>Update: 1m</p><p>LLD</p>|
|In bytes of  tunnel {#LOCAL}---{#REMOTE}|<p>-</p>|`SNMP agent`|cikeTunInOctets[{#LOCAL}---{#REMOTE}]<p>Update: 1m</p><p>LLD</p>|
|In packets of  tunnel {#LOCAL}---{#REMOTE}|<p>-</p>|`SNMP agent`|cikeTunInPkts[{#LOCAL}---{#REMOTE}]<p>Update: 1m</p><p>LLD</p>|
|Out bytes of  tunnel {#LOCAL}---{#REMOTE}|<p>-</p>|`SNMP agent`|cikeTunOutOctets[{#LOCAL}---{#REMOTE}]<p>Update: 1m</p><p>LLD</p>|
|Out packets of  tunnel {#LOCAL}---{#REMOTE}|<p>-</p>|`SNMP agent`|cikeTunOutPkts[{#LOCAL}---{#REMOTE}]<p>Update: 1m</p><p>LLD</p>|
|Status of  tunnel {#LOCAL}---{#REMOTE}|<p>-</p>|`SNMP agent`|cikeTunStatus[{#LOCAL}---{#REMOTE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Status of tunnel {#LOCAL}---{#REMOTE} not up or no data received|<p>-</p>|<p>**Expression**: last(/Cisco IPsec VPN discovering/cikeTunStatus[{#LOCAL}---{#REMOTE}])=0 or nodata(/Cisco IPsec VPN discovering/cikeTunStatus[{#LOCAL}---{#REMOTE}],3m)=1</p><p>**Recovery expression**: </p>|warning|
|Status of tunnel {#LOCAL}---{#REMOTE} not up or no data received (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco IPsec VPN discovering/cikeTunStatus[{#LOCAL}---{#REMOTE}])=0 or nodata(/Cisco IPsec VPN discovering/cikeTunStatus[{#LOCAL}---{#REMOTE}],3m)=1</p><p>**Recovery expression**: </p>|warning|
