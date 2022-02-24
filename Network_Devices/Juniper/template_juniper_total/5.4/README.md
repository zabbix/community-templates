# Juniper Total

## Overview

This template is a smattering of a few templates combined with some custom discovery rules.


It has been tested to work with most Juniper switches and firewalls. It uses the standard SNMP root for all discovery, so it works with most switch/router devices. If you have any issues with it let me know. I exported this from a live system, so the read the dependencies below.


**What it does:**


* BGP Discovery
+ Peer State

* IPSEC Discovery
+ Peer State

* Interface Discovery
+ Traffic in/out
+ Errors in/out
+ Drops in/out

* OSPF Discovery
+ Neighbor State

* IKE Discovery
+ Peer State


**Non Discovery items:**


* Temperature
* CPU
* Memory
* Make/Model
* ICMP


The template creates quite a few graph prototypes and adds them to a screen as well.


**Dependencies:**


The template had value maps, interface filters and groups associated with it when I cloned it, but I removed them so there shouldn't be any issues with it. If you find an issue importing let me know. I was successful importing default template to a new system.


**Other Instructions:**


Be sure to fill in the $SNMP\_COMMUNITY macro with your SNMP community string.


Also IKE discovery does not seem to work on JunOS pre 12.3. Everything else seems to work fine.


**Updates:**


1) Updated as I left my community string in the macros section :(


2) The Parent OID for interface discovery is for the 32Bit counters. This will not work for 64Bit devices. I'll update this week



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`FillMeIn`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Juniper BGP Peer Enumeration|<p>-</p>|`SNMP agent`|discovery.bgp<p>Update: 3600</p>|
|Juniper OSPF Neighbor State Enumeration|<p>-</p>|`SNMP agent`|discovery.ospf.nbr<p>Update: 3600</p>|
|Juniper Interface enumeration|<p>-</p>|`SNMP agent`|discovery.ifDescr<p>Update: 3600</p>|
|Juniper IKE Peer Enumeration|<p>-</p>|`SNMP agent`|discovery.ike<p>Update: 3600</p>|
|Juniper IPSec Tunnel State Enumeration|<p>-</p>|`SNMP agent`|discovery.IPSec<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Simple ICMP Time|<p>-</p>|`Simple check`|icmppingsec[,,,,,]<p>Update: 30</p>|
|JunOS temperature|<p>-</p>|`SNMP agent`|Junos.Temp<p>Update: 30</p>|
|Juniper Make/Model|<p>OID to query Unit Make and Model</p>|`SNMP agent`|juniper.make.model<p>Update: 3600</p>|
|Simple ICMP Up Check|<p>-</p>|`Simple check`|icmpping[,,,,]<p>Update: 30</p>|
|JunOS CPU % in use|<p>-</p>|`SNMP agent`|Junos.CPU<p>Update: 30</p>|
|JunOS Memory % in use|<p>-</p>|`SNMP agent`|Junos.Mem<p>Update: 30</p>|
|bgpPeerState {#SNMPINDEX}|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.15.3.1.2.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|ospfNbrState {#SNMPINDEX}|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.14.10.1.6.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound traffic|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.10.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound discarded packets|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.13.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound error packets|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.14.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound traffic|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.16.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound discarded packets|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.19.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound error packets|<p>-</p>|`SNMP agent`|1.3.6.1.2.1.2.2.1.20.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|ikePeerState {#SNMPINDEX}|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.2636.3.52.1.1.2.1.6.1.4.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|IPSec Tunnel State {#SNMPINDEX}|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.2636.3.39.1.5.1.2.1.1.4.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

