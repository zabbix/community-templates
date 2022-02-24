# SNMP QNAP

## Overview

This template allows you to quickly get up and running with monitoring of QNAP line of devices (NAS). It allows for auto-discovering of hard drives, LUNs, pools, volumes, system HW and automatically applies appropriate triggers for the discovered items.


 


If you wish to see new items added please open an issue @ [albinbatman/zabbix-qnap-template @ GitHub](https://github.com/albinbatman/zabbix-qnap-template). All new updates will be released on github.



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU_TEMPERATURE_ALARM}|<p>Amount in centigrade when an alarm shall be raised</p>|`65`|Text macro|
|{$DISK_LATENCY_ALARM}|<p>Amount in ms when an alarm shall be raised</p>|`30`|Text macro|
|{$HDD_TEMPERATURE_ALARM}|<p>Amount in centigrade when an alarm shall be raised</p>|`50`|Text macro|
|{$POOL_SIZE_ALARM}|<p>Amount in % when an alarm shall be raised</p>|`15`|Text macro|


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
|Pool Discovery|<p>-</p>|`SNMP agent`|pool.discovery<p>Update: 15m</p>|
|FAN Discovery|<p>-</p>|`SNMP agent`|fan.discovery<p>Update: 15m</p>|
|RAID Discovery|<p>-</p>|`SNMP agent`|raid.discovery<p>Update: 15m</p>|
|Network interfaces discovery|<p>Discovering interfaces from IF-MIB.</p>|`SNMP agent`|net.if.discovery<p>Update: 1h</p>|
|LUN Discovery|<p>-</p>|`SNMP agent`|lun.discovery<p>Update: 15m</p>|
|Disk Discovery|<p>-</p>|`SNMP agent`|disk.discovery<p>Update: 15m</p>|
|EtherLike-MIB Discovery|<p>Discovering interfaces from IF-MIB and EtherLike-MIB. Interfaces with up(1) Operational Status are discovered.</p>|`SNMP agent`|net.if.duplex.discovery<p>Update: 1h</p>|
|Volume Discovery|<p>-</p>|`SNMP agent`|volume.discovery<p>Update: 15m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU Temperature|<p>-</p>|`SNMP agent`|cpu.temp<p>Update: 30m</p>|
|Disk IOPS|<p>-</p>|`SNMP agent`|disk.iops<p>Update: 15m</p>|
|System Temperature|<p>-</p>|`SNMP agent`|system.temp<p>Update: 30m</p>|
|Disk latency|<p>-</p>|`SNMP agent`|disk.latency<p>Update: 15m</p>|
|Pool {#POOLINDEX}: Capacity|<p>-</p>|`SNMP agent`|pool.capacity[{#POOLINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Pool {#POOLINDEX}: Free size in %|<p>-</p>|`Calculated`|pool.freepercentage[{#POOLINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Pool {#POOLINDEX}: Free size|<p>-</p>|`SNMP agent`|pool.freeSize[{#POOLINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Pool {#POOLINDEX}: Status|<p>-</p>|`SNMP agent`|pool.status[{#POOLINDEX}]<p>Update: 15m</p><p>LLD</p>|
|FAN {#FANINDEX}: Name|<p>-</p>|`SNMP agent`|fan.name[{#FANINDEX}]<p>Update: 1h</p><p>LLD</p>|
|FAN {#FANINDEX}: Speed|<p>-</p>|`SNMP agent`|fan.speed[{#FANINDEX}]<p>Update: 30m</p><p>LLD</p>|
|FAN {#FANINDEX}: Status|<p>-</p>|`SNMP agent`|fan.status[{#FANINDEX}]<p>Update: 30m</p><p>LLD</p>|
|RAID {#RAIDINDEX}: Capacity|<p>-</p>|`SNMP agent`|raid.capacity[{#RAIDINDEX}]<p>Update: 1h</p><p>LLD</p>|
|RAID {#RAIDINDEX}: Free size|<p>-</p>|`SNMP agent`|raid.freeSize[{#RAIDINDEX}]<p>Update: 1h</p><p>LLD</p>|
|RAID {#RAIDINDEX}: Level|<p>-</p>|`SNMP agent`|raid.level[{#RAIDINDEX}]<p>Update: 1h</p><p>LLD</p>|
|RAID {#RAIDINDEX}: State|<p>-</p>|`SNMP agent`|raid.state[{#RAIDINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Interface {#IFDESCR}: Inbound packets discarded|<p>MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Inbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Bits received|<p>MIB: IF-MIB The total number of octets received on the interface,including framing characters. Discontinuities in the value of this counter can occurat re-initialization of the management system, and atother times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in[ifInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Outbound packets discarded|<p>MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Outbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Bits sent|<p>MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. Discontinuities in the value of this counter can occurat re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out[ifOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFDESCR}: Speed|<p>MIB: IF-MIB An estimate of the interface's current bandwidth in bits per second. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. If the bandwidth of the interface is greater than the maximum value reportable by this object then this object should report its maximum value (4,294,967,295) and ifHighSpeed must be used to report the interace's speed. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|net.if.speed[ifSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFDESCR}: Operational status|<p>MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFDESCR}: Interface type|<p>MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned NumbersAuthority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|LUN {#LUNINDEX}: Name|<p>-</p>|`SNMP agent`|lun.name[{#LUNINDEX}]<p>Update: 1h</p><p>LLD</p>|
|LUN {#LUNINDEX}: Status|<p>-</p>|`SNMP agent`|lun.status[{#LUNINDEX}]<p>Update: 15m</p><p>LLD</p>|
|HDD {#HDDINDEX}: Capacity|<p>-</p>|`SNMP agent`|hdd.capacity[{#HDDINDEX}]<p>Update: 1h</p><p>LLD</p>|
|HDD {#HDDINDEX}: Model|<p>-</p>|`SNMP agent`|hdd.model[{#HDDINDEX}]<p>Update: 1h</p><p>LLD</p>|
|HDD {#HDDINDEX}: Hot Spare|<p>-</p>|`SNMP agent`|hdd.spare[{#HDDINDEX}]<p>Update: 1h</p><p>LLD</p>|
|HDD {#HDDINDEX}: State|<p>-</p>|`SNMP agent`|hdd.state[{#HDDINDEX}]<p>Update: 5m</p><p>LLD</p>|
|HDD {#HDDINDEX}: SMART Status|<p>-</p>|`SNMP agent`|hdd.status[{#HDDINDEX}]<p>Update: 30m</p><p>LLD</p>|
|HDD {#HDDINDEX}: Temperature|<p>-</p>|`SNMP agent`|hdd.temp[{#HDDINDEX}]<p>Update: 30m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Duplex status|<p>MIB: EtherLike-MIB The current mode of operation of the MAC entity. 'unknown' indicates that the current duplex mode could not be determined. Management control of the duplex mode is accomplished through the MAU MIB. When an interface does not support autonegotiation, or when autonegotiation is not enabled, the duplex mode is controlled using ifMauDefaultType. When autonegotiation is supported and enabled, duplex mode is controlled using ifMauAutoNegAdvertisedBits. In either case, the currently operating duplex mode is reflected both in this object and in ifMauType. Note that this object provides redundant information with ifMauType. Normally, redundant objects are discouraged. However, in this instance, it allows a management application to determine the duplex status of an interface without having to know every possible value of ifMauType. This was felt to be sufficiently valuable to justify the redundancy. Reference: [IEEE 802.3 Std.], 30.3.1.1.32,aDuplexStatus.</p>|`SNMP agent`|net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume {#VOLUMEINDEX}: Capacity|<p>-</p>|`SNMP agent`|volume.capacity[{#VOLUMEINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Volume {#VOLUMEINDEX}: Free size in %|<p>-</p>|`Calculated`|volume.freePercentage[{#VOLUMEINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Volume {#VOLUMEINDEX}: Free size|<p>-</p>|`SNMP agent`|volume.freeSize[{#VOLUMEINDEX}]<p>Update: 15m</p><p>LLD</p>|
|Volume {#VOLUMEINDEX}: Name|<p>-</p>|`SNMP agent`|volume.name[{#VOLUMEINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Volume {#VOLUMEINDEX}: Status|<p>-</p>|`SNMP agent`|volume.status[{#VOLUMEINDEX}]<p>Update: 15m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode|<p>Please check autonegotiation settings and cabling</p>|<p>**Expression**: {SNMP QNAP:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].change()}<0 and {SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}>0 and ( {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].change()}>0 and {SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].prev()}>0) or ({SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFDESCR}: Link down|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFDESCR}: High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% )|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({SNMP QNAP:net.if.in[ifInOctets.{#SNMPINDEX}].avg(15m)}>(95/100)*{SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()} or {SNMP QNAP:net.if.out[ifOutOctets.{#SNMPINDEX}].avg(15m)}>(95/100)*{SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}) and {SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {SNMP QNAP:net.if.in[ifInOctets.{#SNMPINDEX}].avg(15m)}<((95-3)/100)*{SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()} and {SNMP QNAP:net.if.out[ifOutOctets.{#SNMPINDEX}].avg(15m)}<((95-3)/100)*{SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFDESCR}: High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {SNMP QNAP:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {SNMP QNAP:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {SNMP QNAP:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {SNMP QNAP:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|HDD {#HDDINDEX} (hotspare) is in operation|<p>Harddisk was previously a hot spare but is now in operation.</p>|<p>**Expression**: {SNMP QNAP:hdd.state[{#HDDINDEX}].last()}=1</p><p>**Recovery expression**: </p>|warning|
|Faulty SMART state of HDD {#HDDINDEX}|<p>S.M.A.R.T has alerted a faulty state of the disk.</p>|<p>**Expression**: {SNMP QNAP:hdd.status[{#HDDINDEX}].last()}<>0</p><p>**Recovery expression**: </p>|high|
|Temperature of HDD {#HDDINDEX} is excessive for 15m|<p>Harddisk temperature is higher than the threshold for 15 minutes.</p>|<p>**Expression**: {SNMP QNAP:hdd.temp[{#HDDINDEX}].min(15m)}>50</p><p>**Recovery expression**: </p>|warning|
|Temperature of HDD {#HDDINDEX} is high for 5m|<p>Harddisk temperature is higher than the threshold for 5 minutes.</p>|<p>**Expression**: {SNMP QNAP:hdd.temp[{#HDDINDEX}].min(5m)}>50</p><p>**Recovery expression**: </p>|information|
|State of LUN {#LUNINDEX} is disconnected|<p>The target of LUN is disconnected.</p>|<p>**Expression**: {SNMP QNAP:lun.status[{#LUNINDEX}].last()}<0</p><p>**Recovery expression**: </p>|warning|
|Reaching threshold for pool {#POOLINDEX} (<{$POOL_SIZE_ALARM}%)|<p>The free size of the pool is reaching the threshold.</p>|<p>**Expression**: {SNMP QNAP:pool.freepercentage[{#POOLINDEX}].last()}<15</p><p>**Recovery expression**: </p>|warning|
|Faulty state of Pool {#POOLINDEX}|<p>A faulty state has been reported by the pool.</p>|<p>**Expression**: {SNMP QNAP:pool.status[{#POOLINDEX}].last()}<>0</p><p>**Recovery expression**: </p>|high|
|Faulty state of RAID {#RAIDINDEX}|<p>RAID has reported a faulty state.</p>|<p>**Expression**: {SNMP QNAP:raid.state[{#RAIDINDEX}].iregexp("^Ready|Synchronizing")}=0</p><p>**Recovery expression**: </p>|high|
|Reaching threshold for volume {#VOLUMEINDEX} (<{$VOLUME_SIZE_ALARM}%)|<p>The free size of the volume is reaching the threshold.</p>|<p>**Expression**: {SNMP QNAP:volume.freePercentage[{#VOLUMEINDEX}].last()}<{$VOLUME_SIZE_ALARM}</p><p>**Recovery expression**: </p>|warning|
|Faulty state of volume {#VOLUMEINDEX}|<p>Volume is in a faulty state. Check as soon as possible.</p>|<p>**Expression**: {SNMP QNAP:volume.status[{#VOLUMEINDEX}].last()}<>0</p><p>**Recovery expression**: </p>|disaster|
|Reaching threshold for pool {#POOLINDEX} (<{$POOL_SIZE_ALARM}%) (LLD)|<p>The free size of the pool is reaching the threshold.</p>|<p>**Expression**: {SNMP QNAP:pool.freepercentage[{#POOLINDEX}].last()}<15</p><p>**Recovery expression**: </p>|warning|
|Faulty state of Pool {#POOLINDEX} (LLD)|<p>A faulty state has been reported by the pool.</p>|<p>**Expression**: {SNMP QNAP:pool.status[{#POOLINDEX}].last()}<>0</p><p>**Recovery expression**: </p>|high|
|Faulty state of RAID {#RAIDINDEX} (LLD)|<p>RAID has reported a faulty state.</p>|<p>**Expression**: {SNMP QNAP:raid.state[{#RAIDINDEX}].iregexp("^Ready|Synchronizing")}=0</p><p>**Recovery expression**: </p>|high|
|Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before (LLD)|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].change()}<0 and {SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}>0 and ( {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {SNMP QNAP:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].change()}>0 and {SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].prev()}>0) or ({SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFDESCR}: Link down (LLD)|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {SNMP QNAP:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFDESCR}: High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% ) (LLD)|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({SNMP QNAP:net.if.in[ifInOctets.{#SNMPINDEX}].avg(15m)}>(95/100)*{SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()} or {SNMP QNAP:net.if.out[ifOutOctets.{#SNMPINDEX}].avg(15m)}>(95/100)*{SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}) and {SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {SNMP QNAP:net.if.in[ifInOctets.{#SNMPINDEX}].avg(15m)}<((95-3)/100)*{SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()} and {SNMP QNAP:net.if.out[ifOutOctets.{#SNMPINDEX}].avg(15m)}<((95-3)/100)*{SNMP QNAP:net.if.speed[ifSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFDESCR}: High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m) (LLD)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {SNMP QNAP:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {SNMP QNAP:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {SNMP QNAP:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {SNMP QNAP:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|State of LUN {#LUNINDEX} is disconnected (LLD)|<p>The target of LUN is disconnected.</p>|<p>**Expression**: {SNMP QNAP:lun.status[{#LUNINDEX}].last()}<0</p><p>**Recovery expression**: </p>|warning|
|HDD {#HDDINDEX} (hotspare) is in operation (LLD)|<p>Harddisk was previously a hot spare but is now in operation.</p>|<p>**Expression**: {SNMP QNAP:hdd.state[{#HDDINDEX}].last()}=1</p><p>**Recovery expression**: </p>|warning|
|Faulty SMART state of HDD {#HDDINDEX} (LLD)|<p>S.M.A.R.T has alerted a faulty state of the disk.</p>|<p>**Expression**: {SNMP QNAP:hdd.status[{#HDDINDEX}].last()}<>0</p><p>**Recovery expression**: </p>|high|
|Temperature of HDD {#HDDINDEX} is excessive for 15m (LLD)|<p>Harddisk temperature is higher than the threshold for 15 minutes.</p>|<p>**Expression**: {SNMP QNAP:hdd.temp[{#HDDINDEX}].min(15m)}>50</p><p>**Recovery expression**: </p>|warning|
|Temperature of HDD {#HDDINDEX} is high for 5m (LLD)|<p>Harddisk temperature is higher than the threshold for 5 minutes.</p>|<p>**Expression**: {SNMP QNAP:hdd.temp[{#HDDINDEX}].min(5m)}>50</p><p>**Recovery expression**: </p>|information|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode (LLD)|<p>Please check autonegotiation settings and cabling</p>|<p>**Expression**: {SNMP QNAP:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Reaching threshold for volume {#VOLUMEINDEX} (<{$VOLUME_SIZE_ALARM}%) (LLD)|<p>The free size of the volume is reaching the threshold.</p>|<p>**Expression**: {SNMP QNAP:volume.freePercentage[{#VOLUMEINDEX}].last()}<{$VOLUME_SIZE_ALARM}</p><p>**Recovery expression**: </p>|warning|
|Faulty state of volume {#VOLUMEINDEX} (LLD)|<p>Volume is in a faulty state. Check as soon as possible.</p>|<p>**Expression**: {SNMP QNAP:volume.status[{#VOLUMEINDEX}].last()}<>0</p><p>**Recovery expression**: </p>|disaster|
