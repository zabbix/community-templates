# Net Digisol DG-GS1526E SNMPv2

## Description

Template Net Digisol DG-GS1526E SNMPv2 Tested on Zabbix 4.4 with DG-GS1526E running 1.0.1.4 software Created by full clone of Template Net Digisol DG-GS4524 SNMPv2 then: . Templates .. Unlink and clear: Template Module Generic SNMPv2 .. Link: Template Module ICMP Ping . Macros: copied {$SNMP.TIMEOUT} from "Template Module Generic SNMPv2" . Applications: added "General" and "Status" . Items deleted .. Hardware version . Items added .. SNMP traps (fallback): copy from "Template Module Generic SNMPv2" .. System contact details: copy from "Template Module Generic SNMPv2" .. System description: copy from "Template Module Generic SNMPv2" .. System location: copy from "Template Module Generic SNMPv2" .. System name: copy from "Template Module Generic SNMPv2" .. System object ID: copy from "Template Module Generic SNMPv2" .. Uptime: copy from "Template Module Generic SNMPv2" .. System serial number: Delete

## Overview

### Introduction


Template Net Digisol DG-GS1526E SNMPv2  
  
Tested on Zabbix 4.4 with DG-GS1526E running 1.0.1.4 software


Created by full clone of Template Net Digisol DG-GS4524 SNMPv2 then:


* Templates
	+ Unlink and clear: Template Module Generic SNMPv2
	+ Link: Template Module ICMP Ping
* Macros: copied {$SNMP.TIMEOUT} from "Template Module Generic SNMPv2"
* Applications: added "General" and "Status"
* Items deleted
	+ Hardware version
	+ System serial number
* Items added
	+ SNMP traps (fallback): copy from "Template Module Generic SNMPv2"
	+ System contact details: copy from "Template Module Generic SNMPv2"
	+ System description: copy from "Template Module Generic SNMPv2"
	+ System location: copy from "Template Module Generic SNMPv2"
	+ System name: copy from "Template Module Generic SNMPv2"
	+ System object ID: copy from "Template Module Generic SNMPv2"
	+ Uptime: copy from "Template Module Generic SNMPv2"


### Installation


Administration > General > Macros: SNMP\_COMMUNITY


Download the file (link below).


Configuration > Templates > Import > browse to the downloaded file > Import


Configure a host > Templates > Link new templates > search for Template Net Digisol DG-GS1526E SNMPv2 > Add


### Bugs


None identified


### License


This template is distributed under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.


### Copyright


Copyright (c) Charles Michael Atkinson


### Authors


Charles M Atkinson (c |at| charlesmatkinson |dot| org)



## Author

Charles M Atkinson

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$IFCONTROL}|<p>-</p>|`1`|Text macro|
|{$IF.ERRORS.WARN}|<p>-</p>|`2`|Text macro|
|{$IF.UTIL.MAX}|<p>-</p>|`95`|Text macro|
|{$NET.IF.IFADMINSTATUS.MATCHES}|<p>Ignore notPresent(6)</p>|`^.*`|Text macro|
|{$NET.IF.IFADMINSTATUS.NOT_MATCHES}|<p>Ignore down(2) administrative status</p>|`^2$`|Text macro|
|{$NET.IF.IFDESCR.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFDESCR.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$NET.IF.IFNAME.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFNAME.NOT_MATCHES}|<p>Filter out loopbacks, nulls, docker veth links and docker0 bridge by default</p>|`(^Software Loopback Interface|^NULL[0-9.]*$|^[Ll]o[0-9.]*$|^[Ss]ystem$|^Nu[0-9.]*$|^veth[0-9a-z]+$|docker[0-9]+|br-[a-z0-9]{12})`|Text macro|
|{$NET.IF.IFOPERSTATUS.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFOPERSTATUS.NOT_MATCHES}|<p>Ignore notPresent(6)</p>|`^6$`|Text macro|
|{$NET.IF.IFTYPE.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFTYPE.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$SNMP.TIMEOUT}|<p>-</p>|`5m`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interface duplex status discovery|<p>-</p>|`SNMP agent`|net.if.duplex.discovery<p>Update: 5m</p>|
|Network interfaces discovery|<p>Discovering interfaces from IF-MIB.</p>|`SNMP agent`|net.if.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System object ID|<p>MIB: SNMPv2-MIB The vendor's authoritative identification of the network management subsystem contained in the entity. This value is allocated within the SMI enterprises subtree (1.3.6.1.4.1) and provides an easy and unambiguous means for determining`what kind of box' is being managed. For example, if vendor`Flintstones, Inc.' was assigned the subtree1.3.6.1.4.1.4242, it could assign the identifier 1.3.6.1.4.1.4242.1.1 to its `Fred Router'.</p>|`SNMP agent`|system.objectid[sysObjectID.0]<p>Update: 15m</p>|
|SNMP traps (fallback)|<p>Item is used to collect all SNMP traps unmatched by other snmptrap items</p>|`SNMP trap`|snmptrap.fallback<p>Update: 1m</p>|
|SNMP agent availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 1m</p>|
|System description|<p>MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.descr[sysDescr.0]<p>Update: 1h</p>|
|System contact details|<p>MIB: SNMPv2-MIB The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|system.contact[sysContact.0]<p>Update: 1h</p>|
|Uptime|<p>MIB: SNMPv2-MIB The time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|system.uptime[sysUpTime.0]<p>Update: 30s</p>|
|System location|<p>MIB: SNMPv2-MIB The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.location[sysLocation.0]<p>Update: 1h</p>|
|System name|<p>MIB: SNMPv2-MIB An administratively-assigned name for this managed node.By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.name<p>Update: 1h</p>|
|Interface {#IFNAME}({#IFALIAS}): Duplex status|<p>MIB: EtherLike-MIB The current mode of operation of the MAC entity. 'unknown' indicates that the current duplex mode could not be determined. Management control of the duplex mode is accomplished through the MAU MIB. When an interface does not support autonegotiation, or when autonegotiation is not enabled, the duplex mode is controlled using ifMauDefaultType. When autonegotiation is supported and enabled, duplex mode is controlled using ifMauAutoNegAdvertisedBits. In either case, the currently operating duplex mode is reflected both in this object and in ifMauType. Note that this object provides redundant information with ifMauType. Normally, redundant objects are discouraged. However, in this instance, it allows a management application to determine the duplex status of an interface without having to know every possible value of ifMauType. This was felt to be sufficiently valuable to justify the redundancy. Reference: [IEEE 802.3 Std.], 30.3.1.1.32,aDuplexStatus.</p>|`SNMP agent`|net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|<p>MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>MIB: IF-MIB The total number of octets received on the interface,including framing characters. Discontinuities in the value of this counter can occurat re-initialization of the management system, and atother times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in[ifInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|<p>MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. Discontinuities in the value of this counter can occurat re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out[ifOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>MIB: IF-MIB An estimate of the interface's current bandwidth in bits per second. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. If the bandwidth of the interface is greater than the maximum value reportable by this object then this object should report its maximum value (4,294,967,295) and ifHighSpeed must be used to report the interace's speed. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|net.if.speed[ifSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|<p>MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned NumbersAuthority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: change(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])<0 and last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])>0 and ( last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=6 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=7 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=11 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=62 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=69 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=117 ) and (last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}])<>2)</p><p>**Recovery expression**: (change(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])>0 and last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}],#2)>0) or (last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}])=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage ( > {$IF.UTIL.MAX:"{#IFNAME}"}% )|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: (avg(/Net Digisol DG-GS1526E SNMPv2/net.if.in[ifInOctets.{#SNMPINDEX}],15m)>(95/100)*last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}]) or avg(/Net Digisol DG-GS1526E SNMPv2/net.if.out[ifOutOctets.{#SNMPINDEX}],15m)>(95/100)*last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])) and last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])>0</p><p>**Recovery expression**: avg(/Net Digisol DG-GS1526E SNMPv2/net.if.in[ifInOctets.{#SNMPINDEX}],15m)<((95-3)/100)*last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}]) and avg(/Net Digisol DG-GS1526E SNMPv2/net.if.out[ifOutOctets.{#SNMPINDEX}],15m)<((95-3)/100)*last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate ( > {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: min(/Net Digisol DG-GS1526E SNMPv2/net.if.in.errors[ifInErrors.{#SNMPINDEX}],5m)>2 or min(/Net Digisol DG-GS1526E SNMPv2/net.if.out.errors[ifOutErrors.{#SNMPINDEX}],5m)>2</p><p>**Recovery expression**: max(/Net Digisol DG-GS1526E SNMPv2/net.if.in.errors[ifInErrors.{#SNMPINDEX}],5m)<2*0.8 and max(/Net Digisol DG-GS1526E SNMPv2/net.if.out.errors[ifOutErrors.{#SNMPINDEX}],5m)<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and (last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}])=2 and (last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}],#1)<>last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}],#2))=1)</p><p>**Recovery expression**: last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}])<>2</p>|average|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode|<p>Check autonegotiation settings and cabling</p>|<p>**Expression**: last(/Net Digisol DG-GS1526E SNMPv2/net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|warning|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode (LLD)|<p>Check autonegotiation settings and cabling</p>|<p>**Expression**: last(/Net Digisol DG-GS1526E SNMPv2/net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: change(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])<0 and last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])>0 and ( last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=6 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=7 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=11 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=62 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=69 or last(/Net Digisol DG-GS1526E SNMPv2/net.if.type[ifType.{#SNMPINDEX}])=117 ) and (last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}])<>2)</p><p>**Recovery expression**: (change(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])>0 and last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}],#2)>0) or (last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}])=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage ( > {$IF.UTIL.MAX:"{#IFNAME}"}% ) (LLD)|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: (avg(/Net Digisol DG-GS1526E SNMPv2/net.if.in[ifInOctets.{#SNMPINDEX}],15m)>(95/100)*last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}]) or avg(/Net Digisol DG-GS1526E SNMPv2/net.if.out[ifOutOctets.{#SNMPINDEX}],15m)>(95/100)*last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])) and last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])>0</p><p>**Recovery expression**: avg(/Net Digisol DG-GS1526E SNMPv2/net.if.in[ifInOctets.{#SNMPINDEX}],15m)<((95-3)/100)*last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}]) and avg(/Net Digisol DG-GS1526E SNMPv2/net.if.out[ifOutOctets.{#SNMPINDEX}],15m)<((95-3)/100)*last(/Net Digisol DG-GS1526E SNMPv2/net.if.speed[ifSpeed.{#SNMPINDEX}])</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate ( > {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m) (LLD)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: min(/Net Digisol DG-GS1526E SNMPv2/net.if.in.errors[ifInErrors.{#SNMPINDEX}],5m)>2 or min(/Net Digisol DG-GS1526E SNMPv2/net.if.out.errors[ifOutErrors.{#SNMPINDEX}],5m)>2</p><p>**Recovery expression**: max(/Net Digisol DG-GS1526E SNMPv2/net.if.in.errors[ifInErrors.{#SNMPINDEX}],5m)<2*0.8 and max(/Net Digisol DG-GS1526E SNMPv2/net.if.out.errors[ifOutErrors.{#SNMPINDEX}],5m)<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and (last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}])=2 and (last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}],#1)<>last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}],#2))=1)</p><p>**Recovery expression**: last(/Net Digisol DG-GS1526E SNMPv2/net.if.status[ifOperStatus.{#SNMPINDEX}])<>2</p>|average|
