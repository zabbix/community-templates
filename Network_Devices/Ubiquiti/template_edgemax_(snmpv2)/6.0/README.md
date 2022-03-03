# EdgeMAX SNMPv2

## Overview

This template allows you to quickly get up and running with monitoring of Ubiquiti's EdgeRouter line of devices. It allows for auto-discovering of network interfaces and automatically applies appropriate triggers for the discovered network interfaces.


 


 Please see @ [Github (albinbatman/zabbix-edgemax-template)](https://github.com/albinbatman/zabbix-edgemax-template)



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$LOAD_AVG_PER_CPU.MAX.WARN}|<p>This macro is used as a threshold in memory utilization trigger.</p>|`1.5`|Text macro|
|{$MEMORY.UTIL.MAX}|<p>This macro is used as a threshold in memory utilization trigger.</p>|`90`|Text macro|


## Template links

|Name|
|----|
|Template Module EtherLike-MIB SNMP|
|Template Module ICMP Ping|
|Template Module Interfaces Simple SNMP|
|Template Module Generic SNMP|
|Template Net Network Generic Device SNMP|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces discovery|<p>-</p>|`SNMP agent`|NetworkInterface<p>Update: 1d</p>|
|Network interfaces discovery|<p>Discovering interfaces from IF-MIB.</p>|`SNMP agent`|net.if.discovery<p>Update: 1h</p>|
|EtherLike-MIB Discovery|<p>Discovering interfaces from IF-MIB and EtherLike-MIB. Interfaces with up(1) Operational Status are discovered.</p>|`SNMP agent`|net.if.duplex.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Load average last 1 minute|<p>-</p>|`SNMP agent`|LoadMinute<p>Update: 1m</p>|
|Total amount of cached|<p>-</p>|`SNMP agent`|MemCached<p>Update: 1m</p>|
|Total amount of available memory|<p>-</p>|`SNMP agent`|MemAvailable<p>Update: 1m</p>|
|Used memory|<p>-</p>|`Calculated`|MemUsed<p>Update: 1m</p>|
|Total amount of buffers|<p>-</p>|`SNMP agent`|MemBuffers<p>Update: 1m</p>|
|Memory utizilation|<p>-</p>|`Calculated`|MemUtil<p>Update: 1m</p>|
|Total amount of memory|<p>-</p>|`SNMP agent`|MemTotal<p>Update: 1m</p>|
|Interface {#IFNAME} : Bits received|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME} : Bits sent|<p>-</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME} : Speed|<p>-</p>|`SNMP agent`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Interface {#IFDESCR}: Inbound packets discarded|<p>MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Inbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Bits received|<p>MIB: IF-MIB The total number of octets received on the interface,including framing characters. Discontinuities in the value of this counter can occurat re-initialization of the management system, and atother times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in[ifInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Outbound packets discarded|<p>MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Outbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Bits sent|<p>MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. Discontinuities in the value of this counter can occurat re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out[ifOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Speed|<p>MIB: IF-MIB An estimate of the interface's current bandwidth in bits per second. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. If the bandwidth of the interface is greater than the maximum value reportable by this object then this object should report its maximum value (4,294,967,295) and ifHighSpeed must be used to report the interace's speed. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|net.if.speed[ifSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFDESCR}: Operational status|<p>MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFDESCR}: Interface type|<p>MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned NumbersAuthority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Duplex status|<p>MIB: EtherLike-MIB The current mode of operation of the MAC entity. 'unknown' indicates that the current duplex mode could not be determined. Management control of the duplex mode is accomplished through the MAU MIB. When an interface does not support autonegotiation, or when autonegotiation is not enabled, the duplex mode is controlled using ifMauDefaultType. When autonegotiation is supported and enabled, duplex mode is controlled using ifMauAutoNegAdvertisedBits. In either case, the currently operating duplex mode is reflected both in this object and in ifMauType. Note that this object provides redundant information with ifMauType. Normally, redundant objects are discouraged. However, in this instance, it allows a management application to determine the duplex status of an interface without having to know every possible value of ifMauType. This was felt to be sufficiently valuable to justify the redundancy. Reference: [IEEE 802.3 Std.], 30.3.1.1.32,aDuplexStatus.</p>|`SNMP agent`|net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode|<p>Please check autonegotiation settings and cabling</p>|<p>**Expression**: {EdgeMAX SNMPv2:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].change()}<0 and {EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}>0 and ( {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].change()}>0 and {EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].prev()}>0) or ({EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFDESCR}: Link down|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFDESCR}: High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% )|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({EdgeMAX SNMPv2:net.if.in[ifInOctets.{#SNMPINDEX}].avg(15m)}>(95/100)*{EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()} or {EdgeMAX SNMPv2:net.if.out[ifOutOctets.{#SNMPINDEX}].avg(15m)}>(95/100)*{EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}) and {EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {EdgeMAX SNMPv2:net.if.in[ifInOctets.{#SNMPINDEX}].avg(15m)}<((95-3)/100)*{EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()} and {EdgeMAX SNMPv2:net.if.out[ifOutOctets.{#SNMPINDEX}].avg(15m)}<((95-3)/100)*{EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFDESCR}: High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {EdgeMAX SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {EdgeMAX SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {EdgeMAX SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {EdgeMAX SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before (LLD)|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].change()}<0 and {EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}>0 and ( {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {EdgeMAX SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].change()}>0 and {EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].prev()}>0) or ({EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFDESCR}: Link down (LLD)|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {EdgeMAX SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFDESCR}: High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% ) (LLD)|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({EdgeMAX SNMPv2:net.if.in[ifInOctets.{#SNMPINDEX}].avg(15m)}>(95/100)*{EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()} or {EdgeMAX SNMPv2:net.if.out[ifOutOctets.{#SNMPINDEX}].avg(15m)}>(95/100)*{EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}) and {EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {EdgeMAX SNMPv2:net.if.in[ifInOctets.{#SNMPINDEX}].avg(15m)}<((95-3)/100)*{EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()} and {EdgeMAX SNMPv2:net.if.out[ifOutOctets.{#SNMPINDEX}].avg(15m)}<((95-3)/100)*{EdgeMAX SNMPv2:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFDESCR}: High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m) (LLD)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {EdgeMAX SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {EdgeMAX SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {EdgeMAX SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {EdgeMAX SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode (LLD)|<p>Please check autonegotiation settings and cabling</p>|<p>**Expression**: {EdgeMAX SNMPv2:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
