# UNIVERGE IX

## Overview

You can get hardware temperature and fan and power status, as well as CPU and memory usage.


PICO-SMI-MIB based


<https://jpn.nec.com/univerge/ix/Manual/index.html#mib>


Product details
---------------


<https://jpn.nec.com/univerge/ix/index.html>



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU_WARN}|<p>-</p>|`80`|Text macro|
|{$HIGH_TEMP_WARN}|<p>-</p>|`55`|Text macro|
|{$MEM_WARN}|<p>-</p>|`80`|Text macro|


## Template links

|Name|
|----|
|Template Module EtherLike-MIB SNMP|
|Template Module ICMP Ping|
|Template Module Interfaces SNMP|
|Template Module Generic SNMP|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|NAPT Cache|<p>-</p>|`SNMP agent`|naptCache.[{#IFNAME}]<p>Update: 1m</p>|
|PowerSupply|<p>-</p>|`SNMP agent`|pico.powersupply.[{#PSINDEX}]<p>Update: 5m</p>|
|Network interfaces discovery|<p>Discovering interfaces from IF-MIB.</p>|`SNMP agent`|net.if.discovery<p>Update: 1h</p>|
|EtherLike-MIB Discovery|<p>Discovering interfaces from IF-MIB and EtherLike-MIB. Interfaces with up(1) Operational Status are discovered.</p>|`SNMP agent`|net.if.duplex.discovery<p>Update: 1h</p>|
|Fan|<p>-</p>|`SNMP agent`|pico.fan.[{#FANINDEX}]<p>Update: 5m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IPv4 UFS Cache Entries|<p>-</p>|`SNMP agent`|pico.IPv4UFSCache.Entries<p>Update: 1m</p>|
|IPv4 UFS Cache Peaks|<p>-</p>|`SNMP agent`|pico.IPv4UFSCache.Peaks<p>Update: 1m</p>|
|IPv6 UFS Cache Peaks|<p>-</p>|`SNMP agent`|pico.IPv6UFSCache.Peaks<p>Update: 1m</p>|
|IPv4 UFS Cache Creates|<p>-</p>|`SNMP agent`|pico.IPv4UFSCache.Creates<p>Update: 1m</p>|
|Voltage|<p>-</p>|`SNMP agent`|pico.Voltage<p>Update: 5m</p>|
|Temperature|<p>-</p>|`SNMP agent`|pico.Celsius<p>Update: 3m</p>|
|Memory Utilization|<p>-</p>|`SNMP agent`|pico.Heap.Util<p>Update: 1m</p>|
|IPv6 UFS Cache Overflows|<p>-</p>|`SNMP agent`|pico.IPv6UFSCache.Overflows<p>Update: 1m</p>|
|CPU Utilization for 1min|<p>-</p>|`SNMP agent`|pico.SchedRtUtl.1Min<p>Update: 1m</p>|
|IPv6 UFS Cache Entries|<p>-</p>|`SNMP agent`|pico.IPv6UFSCache.Entries<p>Update: 1m</p>|
|IPv6 UFS Cache Creates|<p>-</p>|`SNMP agent`|pico.IPv6UFSCache.Creates<p>Update: 1m</p>|
|Total Heap Memory Size|<p>-</p>|`SNMP agent`|pico.Heap.Size<p>Update: 1m</p>|
|IPv4 UFS Cache Overflows|<p>-</p>|`SNMP agent`|pico.IPv4UFSCache.Overflows<p>Update: 1m</p>|
|NAPT Cache Creates - {#IFNAME}|<p>-</p>|`SNMP agent`|naptCache.creates.[{#IFNAME}]<p>Update: 1m</p><p>LLD</p>|
|NAPT Cache Entries - {#IFNAME}|<p>-</p>|`SNMP agent`|naptCache.entries.[{#IFNAME}]<p>Update: 1m</p><p>LLD</p>|
|NAPT Cache Overflows - {#IFNAME}|<p>-</p>|`SNMP agent`|naptCache.overflows.[{#IFNAME}]<p>Update: 1m</p><p>LLD</p>|
|NAPT Cache Peak - {#IFNAME}|<p>-</p>|`SNMP agent`|naptCache.peak.[{#IFNAME}]<p>Update: 1m</p><p>LLD</p>|
|Power Supply Status|<p>-</p>|`SNMP agent`|powersupply.status.[{#PSINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Power Supply Type|<p>-</p>|`SNMP agent`|powersupply.type.[{#PSINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|<p>MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>MIB: IF-MIB The total number of octets received on the interface, including framing characters. This object is a 64-bit version of ifInOctets. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|<p>MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. This object is a 64-bit version of ifOutOctets.Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>MIB: IF-MIB An estimate of the interface's current bandwidth in units of 1,000,000 bits per second. If this object reports a value of `n' then the speed of the interface is somewhere in the range of `n-500,000' to`n+499,999'. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|<p>MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned NumbersAuthority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Duplex status|<p>MIB: EtherLike-MIB The current mode of operation of the MAC entity. 'unknown' indicates that the current duplex mode could not be determined. Management control of the duplex mode is accomplished through the MAU MIB. When an interface does not support autonegotiation, or when autonegotiation is not enabled, the duplex mode is controlled using ifMauDefaultType. When autonegotiation is supported and enabled, duplex mode is controlled using ifMauAutoNegAdvertisedBits. In either case, the currently operating duplex mode is reflected both in this object and in ifMauType. Note that this object provides redundant information with ifMauType. Normally, redundant objects are discouraged. However, in this instance, it allows a management application to determine the duplex status of an interface without having to know every possible value of ifMauType. This was felt to be sufficiently valuable to justify the redundancy. Reference: [IEEE 802.3 Std.], 30.3.1.1.32,aDuplexStatus.</p>|`SNMP agent`|net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Fan #{#FANINDEX} rpm|<p>-</p>|`SNMP agent`|pico.fan.rpm.[{#FANINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Fan #{#FANINDEX} Status|<p>-</p>|`SNMP agent`|pico.fan.status.[{#FANINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode|<p>Please check autonegotiation settings and cabling</p>|<p>**Expression**: {UNIVERGE IX:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% )|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({UNIVERGE IX:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {UNIVERGE IX:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {UNIVERGE IX:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {UNIVERGE IX:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {UNIVERGE IX:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {UNIVERGE IX:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {UNIVERGE IX:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {UNIVERGE IX:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|Fan #{#FANINDEX} is failure|<p>-</p>|<p>**Expression**: {UNIVERGE IX:pico.fan.status.[{#FANINDEX}].last()}=2</p><p>**Recovery expression**: {UNIVERGE IX:pico.fan.status.[{#FANINDEX}].last()}=1</p>|high|
|Power Supply Module#{#PSINDEX} failure|<p>-</p>|<p>**Expression**: {UNIVERGE IX:powersupply.status.[{#PSINDEX}].last()}=2</p><p>**Recovery expression**: {UNIVERGE IX:powersupply.status.[{#PSINDEX}].last()}=1</p>|high|
|Power Supply Module#{#PSINDEX} failure (LLD)|<p>-</p>|<p>**Expression**: {UNIVERGE IX:powersupply.status.[{#PSINDEX}].last()}=2</p><p>**Recovery expression**: {UNIVERGE IX:powersupply.status.[{#PSINDEX}].last()}=1</p>|high|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {UNIVERGE IX:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {UNIVERGE IX:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% ) (LLD)|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({UNIVERGE IX:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {UNIVERGE IX:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {UNIVERGE IX:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {UNIVERGE IX:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{UNIVERGE IX:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m) (LLD)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {UNIVERGE IX:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {UNIVERGE IX:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {UNIVERGE IX:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {UNIVERGE IX:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode (LLD)|<p>Please check autonegotiation settings and cabling</p>|<p>**Expression**: {UNIVERGE IX:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Fan #{#FANINDEX} is failure (LLD)|<p>-</p>|<p>**Expression**: {UNIVERGE IX:pico.fan.status.[{#FANINDEX}].last()}=2</p><p>**Recovery expression**: {UNIVERGE IX:pico.fan.status.[{#FANINDEX}].last()}=1</p>|high|
