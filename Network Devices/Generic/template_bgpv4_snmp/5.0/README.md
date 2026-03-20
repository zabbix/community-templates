# BGPv4 SNMP

## Description

Template BGPv4 Sessions -Admin Status -Established Time -Operation Status -AS Name -BGP last Error By: Flavio Gomes Figueira Camacho Junior Require: ValueMaps .BGP4-MIB::bgpPeerAdminStatus .BGP4-MIB::bgpPeerState ExternalScript .as_name Base: BGP4-MIB.mib https://www.iana.org/assignments/bgp-parameters/bgp-parameters.xhtml

## Overview

Template BGPv4 Sessions


-Admin Status


-Established Time


-Operation Status


-AS Name


-BGP last Error


 


By: Flavio Gomes Figueira Camacho Junior


 


Require:


ValueMaps


.BGP4-MIB::bgpPeerAdminStatus


.BGP4-MIB::bgpPeerState


 


ExternalScript


.as\_name


 


Base: 


BGP4-MIB.mib


<https://www.iana.org/assignments/bgp-parameters/bgp-parameters.xhtml>


 


External Scripts and Value Mapping on my Github:


https://github.com/flaviojunior1995/Zabbix-Templates



## Author

Flavio Camacho Junior

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PEER_LOW_TIME}|<p>time in sec alarm for low uptime bgp session</p>|`14400`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGPv4 Peers Discovery|<p>-</p>|`SNMP agent`|BgpPeerDiscovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AS Name for IPv4 peer $1|<p>-</p>|`External check`|as_name["{#SNMPVALUE}","{#SNMPASN}"]<p>Update: 1d</p><p>LLD</p>|
|Administrative status for peer $1|<p>-</p>|`SNMP agent`|bgpPeerAdminStatus[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Established time for peer $1|<p>-</p>|`SNMP agent`|bgpPeerFsmEstablishedTime[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|BGP peer last error {#SNMPVALUE}|<p>-</p>|`SNMP agent`|bgpPeerLastError[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Remote AS for peer $1|<p>-</p>|`SNMP agent`|bgpPeerRemoteAs[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Operational status for peer $1|<p>-</p>|`SNMP agent`|bgpPeerState[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BGP peer {#SNMPVALUE} ASN {#SNMPASN} is DOWN|<p>Trigger for peer that has a remote AS matching {$BGP_PEER_AS} macro.</p>|<p>**Expression**: {BGPv4 SNMP:bgpPeerState[{#SNMPVALUE}].last(#3)}<>6 and {BGPv4 SNMP:bgpPeerAdminStatus[{#SNMPVALUE}].last(0)}=2</p><p>**Recovery expression**: </p>|high|
|BGP peer up time low {#SNMPVALUE} ASN {#SNMPASN}|<p>-</p>|<p>**Expression**: {BGPv4 SNMP:bgpPeerFsmEstablishedTime[{#SNMPVALUE}].last()}<14400</p><p>**Recovery expression**: </p>|information|
|BGP peer {#SNMPVALUE} ASN {#SNMPASN} is DOWN (LLD)|<p>Trigger for peer that has a remote AS matching {$BGP_PEER_AS} macro.</p>|<p>**Expression**: {BGPv4 SNMP:bgpPeerState[{#SNMPVALUE}].last(#3)}<>6 and {BGPv4 SNMP:bgpPeerAdminStatus[{#SNMPVALUE}].last(0)}=2</p><p>**Recovery expression**: </p>|high|
|BGP peer up time low {#SNMPVALUE} ASN {#SNMPASN} (LLD)|<p>-</p>|<p>**Expression**: {BGPv4 SNMP:bgpPeerFsmEstablishedTime[{#SNMPVALUE}].last()}<14400</p><p>**Recovery expression**: </p>|information|
