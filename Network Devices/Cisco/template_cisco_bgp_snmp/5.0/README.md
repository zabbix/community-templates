# Cisco BGP SNMP

## Description

Template Cisco BGP Sessions -AdminStatus -Established Time -OperationStatus -AS Name -Maximum Prefix -Accepted Prefix -BGP last Error By: Flavio Gomes Figueira Camacho Junior Require: ValueMaps .BGP4-MIB::bgpPeerAdminStatus .BGP4-MIB::bgpPeerState ExternalScript .as.name .oid_to_ipv6 Base: CISCO-BGP4-MIB.mib http://www.circitor.fr/Mibs/Html/C/CISCO-BGP4-MIB.php#cbgpPeer2RemoteAs External Scripts and Value Mapping on my Github: https://github.com/flaviojunior1995/Zabbix-Templates

## Overview

Template Cisco BGP Sessions 


-AdminStatus


-Established Time


-OperationStatus


-AS Name


-Maximum Prefix


-Accepted Prefix


-BGP last Error


 


By: Flavio Gomes Figueira Camacho Junior


 


Require:


ValueMaps


.BGP4-MIB::bgpPeerAdminStatus


.BGP4-MIB::bgpPeerState


 


ExternalScript


.as.name


.oid\_to\_ipv6


 


Base: 


CISCO-BGP4-MIB.mib


http://www.circitor.fr/Mibs/Html/C/CISCO-BGP4-MIB.php#cbgpPeer2RemoteAs


 


External Scripts and Value Mapping on my Github:


https://github.com/flaviojunior1995/Zabbix-Templates



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MAXIMUM_PREFIX_ALARM}|<p>% maximum prefix limit alarm to reach 100%</p>|`80`|Text macro|
|{$PEER_LOW_TIME}|<p>time in sec alarm for uptime bgp session</p>|`14400`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGPv6 Peers Discovery|<p>-</p>|`SNMP agent`|cbgpPeer2LocalAddr["BGPv6"]<p>Update: 1h</p>|
|BGPv4 Peers Discovery|<p>-</p>|`SNMP agent`|cbgpPeer2RemoteAs["BGPv4"]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AS Name for IPv6 peer "$2" ASN "$1"|<p>-</p>|`External check`|as_name["{#SNMPASN}","{#SNMPINDEX}","BGPv6"]<p>Update: 1d</p><p>LLD</p>|
|Administrative status for peer "$1" ASN "$2"|<p>-</p>|`SNMP agent`|cbgp6Peer2AdminStatus["{#SNMPINDEX}","{#SNMPASN}"]<p>Update: 10m</p><p>LLD</p>|
|Established time for peer "$1" ASN "$2"|<p>-</p>|`SNMP agent`|cbgp6Peer2FsmEstablishedTime["{#SNMPINDEX}","{#SNMPASN}"]<p>Update: 10m</p><p>LLD</p>|
|Remote AS for peer "$1" ASN "$2"|<p>-</p>|`SNMP agent`|cbgp6Peer2RemoteAs["{#SNMPINDEX}","{#SNMPASN}"]<p>Update: 1d</p><p>LLD</p>|
|Operational status for peer "$1" ASN "$2"|<p>-</p>|`SNMP agent`|cbgp6Peer2State["{#SNMPINDEX}","{#SNMPASN}"]<p>Update: 1m</p><p>LLD</p>|
|BGP peer last error "$1" ASN "$2"|<p>-</p>|`SNMP agent`|cbgpPeer2LastError["{#SNMPINDEX}","{#SNMPASN}"]<p>Update: 10m</p><p>LLD</p>|
|Remote IPv6 Peer "$1"|<p>-</p>|`External check`|oid_to_ipv6["{#SNMPINDEX}"]<p>Update: 1d</p><p>LLD</p>|
|AS Name for IPv4 peer "{#SNMPINDEX}"|<p>-</p>|`External check`|as_name["{#SNMPASN}","{#SNMPINDEX}"]<p>Update: 1d</p><p>LLD</p>|
|Administrative status for peer "$1"|<p>-</p>|`SNMP agent`|cbgpPeer2AdminStatus[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Established time for peer "$1"|<p>-</p>|`SNMP agent`|cbgpPeer2FsmEstablishedTime[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Remote AS for peer "$1"|<p>-</p>|`SNMP agent`|cbgpPeer2RemoteAs[{#SNMPINDEX}]<p>Update: 1d</p><p>LLD</p>|
|Operational status for peer "$1"|<p>-</p>|`SNMP agent`|cbgpPeer2State[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|BGP peer last error "$1"|<p>-</p>|`SNMP agent`|cbgpPeerLastErrorTxt["{#SNMPINDEX}"]<p>Update: 10m</p><p>LLD</p>|
|Accepted prefix for peer "$1"|<p>-</p>|`SNMP agent`|cbgpPeerPrefixAccepted[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Maximum prefix for peer "$1"|<p>-</p>|`SNMP agent`|cbgpPeerPrefixLimit[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BGPv6 peer {#SNMPVALUE} ASN {#SNMPASN} is DOWN|<p>-</p>|<p>**Expression**: {Cisco BGP SNMP:cbgp6Peer2State["{#SNMPINDEX}","{#SNMPASN}"].last(#3)}<>6 and {Cisco BGP SNMP:cbgp6Peer2AdminStatus["{#SNMPINDEX}","{#SNMPASN}"].last(0)}=2</p><p>**Recovery expression**: </p>|high|
|BGPv6 peer up time low {#SNMPVALUE} ASN {#SNMPASN}|<p>-</p>|<p>**Expression**: {Cisco BGP SNMP:cbgp6Peer2FsmEstablishedTime["{#SNMPINDEX}","{#SNMPASN}"].last()}<14400</p><p>**Recovery expression**: </p>|information|
|BGPv4 peer {#SNMPINDEX} ASN {#SNMPASN} is DOWN|<p>-</p>|<p>**Expression**: {Cisco BGP SNMP:cbgpPeer2State[{#SNMPINDEX}].last(#3)}<>6 and {Cisco BGP SNMP:cbgpPeer2AdminStatus[{#SNMPINDEX}].last(0)}=2</p><p>**Recovery expression**: </p>|high|
|BGPv4 Prefix Limit {#SNMPINDEX} ASN {#SNMPASN} near|<p>-</p>|<p>**Expression**: ( {Cisco BGP SNMP:cbgpPeerPrefixAccepted[{#SNMPINDEX}].last()} * 100 / {Cisco BGP SNMP:cbgpPeerPrefixLimit[{#SNMPINDEX}].last()} ) > 80</p><p>**Recovery expression**: </p>|warning|
|BGPv4 peer up time low {#SNMPINDEX} ASN {#SNMPASN}|<p>-</p>|<p>**Expression**: {Cisco BGP SNMP:cbgpPeer2FsmEstablishedTime[{#SNMPINDEX}].last()}<14400</p><p>**Recovery expression**: </p>|information|
|BGPv6 peer {#SNMPVALUE} ASN {#SNMPASN} is DOWN (LLD)|<p>-</p>|<p>**Expression**: {Cisco BGP SNMP:cbgp6Peer2State["{#SNMPINDEX}","{#SNMPASN}"].last(#3)}<>6 and {Cisco BGP SNMP:cbgp6Peer2AdminStatus["{#SNMPINDEX}","{#SNMPASN}"].last(0)}=2</p><p>**Recovery expression**: </p>|high|
|BGPv6 peer up time low {#SNMPVALUE} ASN {#SNMPASN} (LLD)|<p>-</p>|<p>**Expression**: {Cisco BGP SNMP:cbgp6Peer2FsmEstablishedTime["{#SNMPINDEX}","{#SNMPASN}"].last()}<14400</p><p>**Recovery expression**: </p>|information|
|BGPv4 peer {#SNMPINDEX} ASN {#SNMPASN} is DOWN (LLD)|<p>-</p>|<p>**Expression**: {Cisco BGP SNMP:cbgpPeer2State[{#SNMPINDEX}].last(#3)}<>6 and {Cisco BGP SNMP:cbgpPeer2AdminStatus[{#SNMPINDEX}].last(0)}=2</p><p>**Recovery expression**: </p>|high|
|BGPv4 Prefix Limit {#SNMPINDEX} ASN {#SNMPASN} near (LLD)|<p>-</p>|<p>**Expression**: ( {Cisco BGP SNMP:cbgpPeerPrefixAccepted[{#SNMPINDEX}].last()} * 100 / {Cisco BGP SNMP:cbgpPeerPrefixLimit[{#SNMPINDEX}].last()} ) > 80</p><p>**Recovery expression**: </p>|warning|
|BGPv4 peer up time low {#SNMPINDEX} ASN {#SNMPASN} (LLD)|<p>-</p>|<p>**Expression**: {Cisco BGP SNMP:cbgpPeer2FsmEstablishedTime[{#SNMPINDEX}].last()}<14400</p><p>**Recovery expression**: </p>|information|
