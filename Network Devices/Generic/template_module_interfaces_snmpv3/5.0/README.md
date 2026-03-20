# Module Interfaces SNMPv3

## Description

Template Module Interfaces SNMPv3 Used template Template Module Interfaces SNMPv2 Ville Leinonen https://www.hacknetwork.org Version 1.0

## Overview

UPDATED: There was a bug in version 1.0


 


Linked for Template Net HP and Aruba Enterprise Switch SNMPv3, but works also individually.


SNMPv3 support added, new macros:


{$SECURITY\_NAME} = Username


{$AUTH\_PASSPHRASE} = Authentication password


{$PRIV\_PASSPHRASE} = Encryption password


 


Template is just like V2 templates, but changed to support SNMPv3, please use SHA and AES128.



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$IFCONTROL}|<p>-</p>|`1`|Text macro|
|{$IF.ERRORS.WARN}|<p>-</p>|`2`|Text macro|
|{$IF.UTIL.MAX}|<p>-</p>|`90`|Text macro|
|{$NET.IF.IFADMINSTATUS.MATCHES}|<p>Ignore notPresent(6)</p>|`^.*`|Text macro|
|{$NET.IF.IFADMINSTATUS.NOT_MATCHES}|<p>Ignore down(2) administrative status</p>|`^2$`|Text macro|
|{$NET.IF.IFALIAS.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFALIAS.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$NET.IF.IFDESCR.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFDESCR.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$NET.IF.IFNAME.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFNAME.NOT_MATCHES}|<p>Filter out loopbacks, nulls, docker veth links and docker0 bridge by default</p>|`(^Software Loopback Interface|^NULL[0-9.]*$|^[Ll]o[0-9.]*$|^[Ss]ystem$|^Nu[0-9.]*$|^veth[0-9a-z]+$|docker[0-9]+|br-[a-z0-9]{12})`|Text macro|
|{$NET.IF.IFOPERSTATUS.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFOPERSTATUS.NOT_MATCHES}|<p>Ignore notPresent(6)</p>|`^6$`|Text macro|
|{$NET.IF.IFTYPE.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFTYPE.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces discovery|<p>Discovering interfaces from IF-MIB.</p>|`SNMP agent`|net.if.discoveryV3<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|<p>MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.discardsV3[ifInDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.errorsV3[ifInErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>MIB: IF-MIB The total number of octets received on the interface, including framing characters. This object is a 64-bit version of ifInOctets. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.inV3[ifHCInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|<p>MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.discardsV3[ifOutDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.errorsV3[ifOutErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. This object is a 64-bit version of ifOutOctets.Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.outV3[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>MIB: IF-MIB An estimate of the interface's current bandwidth in units of 1,000,000 bits per second. If this object reports a value of `n' then the speed of the interface is somewhere in the range of `n-500,000' to`n+499,999'. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|net.if.speedV3[ifHighSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`SNMP agent`|net.if.statusV3[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|<p>MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned NumbersAuthority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`SNMP agent`|net.if.type[ifTypeV3.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=6 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=7 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=11 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=62 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=69 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=117 ) and ({Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage ( > {$IF.UTIL.MAX:"{#IFNAME}"}% )|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({Module Interfaces SNMPv3:net.if.inV3[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()} or {Module Interfaces SNMPv3:net.if.outV3[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()}) and {Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Module Interfaces SNMPv3:net.if.inV3[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()} and {Module Interfaces SNMPv3:net.if.outV3[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate ( > {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Module Interfaces SNMPv3:net.if.in.errorsV3[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {Module Interfaces SNMPv3:net.if.out.errorsV3[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {Module Interfaces SNMPv3:net.if.in.errorsV3[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {Module Interfaces SNMPv3:net.if.out.errorsV3[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|average|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=6 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=7 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=11 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=62 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=69 or {Module Interfaces SNMPv3:net.if.type[ifTypeV3.{#SNMPINDEX}].last()}=117 ) and ({Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage ( > {$IF.UTIL.MAX:"{#IFNAME}"}% ) (LLD)|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({Module Interfaces SNMPv3:net.if.inV3[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()} or {Module Interfaces SNMPv3:net.if.outV3[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()}) and {Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Module Interfaces SNMPv3:net.if.inV3[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()} and {Module Interfaces SNMPv3:net.if.outV3[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Module Interfaces SNMPv3:net.if.speedV3[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate ( > {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m) (LLD)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Module Interfaces SNMPv3:net.if.in.errorsV3[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {Module Interfaces SNMPv3:net.if.out.errorsV3[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {Module Interfaces SNMPv3:net.if.in.errorsV3[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {Module Interfaces SNMPv3:net.if.out.errorsV3[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Module Interfaces SNMPv3:net.if.statusV3[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|average|
