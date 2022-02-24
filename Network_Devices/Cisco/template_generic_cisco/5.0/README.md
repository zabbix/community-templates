# Generic Cisco

## Overview

I was looking for a template that gave me as much information as possible on a Cisco device, working on Zabbix 4.0.x + and quick implementation of multiple Zabbix servers. Template is based on the stock Cisco SNMPv2 template but with some additional content


  
- Device Model Name  
- FAN Discovery  
- Power Supply  
- Temperature  
- CPU Discovery  
- Serial Numbers Discovery  
- Memory Discovery  
- Network interfaces Discovery


  
Based on your device it will create around:  
150-250 items  
100-150 triggers  
20-50 graphs


Tested and worked in my case on:  
Cisco 800  
Cisco 878 k9  
Cisco 881  
Cisco 803  
  
As it is based on the default Cisco SNMPv2 template it will work on every generic Cisco Router/Switch.



## Author

Kjoffy

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|EtherLike-MIB Discovery|<p>Discovering interfaces from IF-MIB and EtherLike-MIB. Interfaces with up(1) Operational Status are discovered.</p>|`SNMP agent`|net.if.duplex.discovery<p>Update: 1h</p>|
|Cisco Power Supply|<p>-</p>|`SNMP agent`|ciscoEnvMonSupplyStatusDescr<p>Update: 5m</p>|
|Network Interfaces Discovery|<p>Discovering interfaces from IF-MIB. Interfaces are not discovered: - with down(2) Administrative status - with notPresent(6) Operational status - loopbacks</p>|`SNMP agent`|net.if.discovery<p>Update: 1h</p>|
|FAN Discovery|<p>The table of fan status maintained by the environmental monitor.</p>|`SNMP agent`|fan.discovery<p>Update: 1h</p>|
|CPU Discovery|<p>If your IOS device has several CPUs, you must use CISCO-PROCESS-MIB and its object cpmCPUTotal5minRev from the table called cpmCPUTotalTable , indexed with cpmCPUTotalIndex . This table allows CISCO-PROCESS-MIB to keep CPU statistics for different physical entities in the router, like different CPU chips, group of CPUs, or CPUs in different modules/cards. In case of a single CPU, cpmCPUTotalTable has only one entry.</p>|`SNMP agent`|cpu.discovery<p>Update: 1h</p>|
|Entity Serial Numbers Discovery|<p>-</p>|`SNMP agent`|entity_sn.discovery<p>Update: 1h</p>|
|Network Interfaces|<p>-</p>|`SNMP agent`|cis_fDescr<p>Update: 30s</p>|
|Cisco Device Model Name|<p>-</p>|`SNMP agent`|modelName<p>Update: 1d</p>|
|Cisco Temperature|<p>-</p>|`SNMP agent`|ciscoEnvMonTemperatureStatusDescr<p>Update: 30m</p>|
|Cisco Fan|<p>-</p>|`SNMP agent`|ciscoEnvMonFanStatusDescr<p>Update: 5m</p>|
|Memory Discovery|<p>Discovery of ciscoMemoryPoolTable, a table of memory pool monitoring entries. http://www.cisco.com/c/en/us/support/docs/ip/simple-network-management-protocol-snmp/15216-contiguous-memory.html</p>|`SNMP agent`|memory.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IOS Version|<p>-</p>|`SNMP agent`|ciscoImageString<p>Update: 1008m</p>|
|Used CPU for the last 5 minutes|<p>-</p>|`SNMP agent`|ciscoCpmCPUTotal5minRev<p>Update: 5m</p>|
|Device Model Name|<p>.1.3.6.1.2.1.47.1.1.1.1.13["index",".1.3.6.1.2.1.47.1.1.1.1.4","0"]</p>|`SNMP agent`|ciscoPhysicalModelName<p>Update: 1d</p>|
|Device Serial Number|<p>.1.3.6.1.2.1.47.1.1.1.1.11["index",".1.3.6.1.2.1.47.1.1.1.1.4","0"] = original snmp oid</p>|`SNMP agent`|ciscoPhysicalSerialNum<p>Update: 1d</p>|
|System name|<p>-</p>|`SNMP agent`|Cisco_sysName<p>Update: 30s</p>|
|Used memory for the last 5 minutes|<p>-</p>|`SNMP agent`|ciscoMemoryPoolUsed<p>Update: 5m</p>|
|Unused memory for the last 5 minutes|<p>-</p>|`SNMP agent`|ciscoMemoryPoolFree<p>Update: 5m</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 30m</p>|
|Interface {#IFNAME}({#IFALIAS}): Duplex status|<p>MIB: EtherLike-MIB The current mode of operation of the MAC entity. 'unknown' indicates that the current duplex mode could not be determined. Management control of the duplex mode is accomplished through the MAU MIB. When an interface does not support autonegotiation, or when autonegotiation is not enabled, the duplex mode is controlled using ifMauDefaultType. When autonegotiation is supported and enabled, duplex mode is controlled using ifMauAutoNegAdvertisedBits. In either case, the currently operating duplex mode is reflected both in this object and in ifMauType. Note that this object provides redundant information with ifMauType. Normally, redundant objects are discouraged. However, in this instance, it allows a management application to determine the duplex status of an interface without having to know every possible value of ifMauType. This was felt to be sufficiently valuable to justify the redundancy. Reference: [IEEE 802.3 Std.], 30.3.1.1.32,aDuplexStatus.</p>|`SNMP agent`|net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|$1 state|<p>-</p>|`SNMP agent`|ciscoEnvMonSupplyState[{#POWERSUP}]<p>Update: 1d</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|<p>MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|<p>MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. This object is a 64-bit version of ifOutOctets.Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>MIB: IF-MIB An estimate of the interface's current bandwidth in units of 1,000,000 bits per second. If this object reports a value of `n' then the speed of the interface is somewhere in the range of `n-500,000' to`n+499,999'. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|<p>MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned NumbersAuthority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|{#SENSOR_INFO}: Fan status|<p>MIB: CISCO-ENVMON-MIB</p>|`SNMP agent`|sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|#{#SNMPINDEX}: CPU utilization|<p>MIB: CISCO-PROCESS-MIB The cpmCPUTotal5minRev MIB object provides a more accurate view of the performance of the router over time than the MIB objects cpmCPUTotal1minRev and cpmCPUTotal5secRev . These MIB objects are not accurate because they look at CPU at one minute and five second intervals, respectively. These MIBs enable you to monitor the trends and plan the capacity of your network. The recommended baseline rising threshold for cpmCPUTotal5minRev is 90 percent. Depending on the platform, some routers that run at 90 percent, for example, 2500s, can exhibit performance degradation versus a high-end router, for example, the 7500 series, which can operate fine. Reference: http://www.cisco.com/c/en/us/support/docs/ip/simple-network-management-protocol-snmp/15215-collect-cpu-util-snmp.html</p>|`SNMP agent`|system.cpu.util[cpmCPUTotal5minRev.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#ENT_NAME}: Hardware serial number|<p>MIB: ENTITY-MIB</p>|`SNMP agent`|system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Device Model Name at OID [{#SNMPINDEX}]|<p>-</p>|`SNMP agent`|modelName[{#SNMPINDEX}]<p>Update: 1d</p><p>LLD</p>|
|Device Serial Number at OID [{#SNMPINDEX}]|<p>-</p>|`SNMP agent`|SerialNumber[{#SNMPINDEX}]<p>Update: 1d</p><p>LLD</p>|
|Temperature state of $1|<p>-</p>|`SNMP agent`|ciscoEnvMonTemperatureState[{#CHASSISTEMP}]<p>Update: 30m</p><p>LLD</p>|
|Temperature value of $1|<p>-</p>|`SNMP agent`|ciscoEnvMonTemperatureStatusValue[{#CHASSISTEMP}]<p>Update: 30m</p><p>LLD</p>|
|$1 state|<p>-</p>|`SNMP agent`|ciscoEnvMonFanState[{#FANVAL}]<p>Update: 1d</p><p>LLD</p>|
|{#SNMPVALUE}: Available memory|<p>MIB: CISCO-MEMORY-POOL-MIB Indicates the number of bytes from the memory pool that are currently unused on the managed device. Note that the sum of ciscoMemoryPoolUsed and ciscoMemoryPoolFree is the total amount of memory in the pool Reference: http://www.cisco.com/c/en/us/support/docs/ip/simple-network-management-protocol-snmp/15216-contiguous-memory.html</p>|`SNMP agent`|vm.memory.free[ciscoMemoryPoolFree.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE}: Memory utilization|<p>Memory utilization in %</p>|`Calculated`|vm.memory.pused[vm.memory.pused.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|{#SNMPVALUE}: Used memory|<p>MIB: CISCO-MEMORY-POOL-MIB Indicates the number of bytes from the memory pool that are currently in use by applications on the managed device. Reference: http://www.cisco.com/c/en/us/support/docs/ip/simple-network-management-protocol-snmp/15216-contiguous-memory.html</p>|`SNMP agent`|vm.memory.used[ciscoMemoryPoolUsed.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status for {#SNMPVALUE} is CRITICAL|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonFanState[{#FANVAL}].last(0)}=3</p><p>**Recovery expression**: </p>|high|
|Operational status for {#SNMPVALUE} is Failed|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonFanState[{#FANVAL}].last(0)}=4</p><p>**Recovery expression**: </p>|disaster|
|Operational status for {#SNMPVALUE} is WARNING|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonFanState[{#FANVAL}].last(0)}=2</p><p>**Recovery expression**: </p>|warning|
|Operational status for {#SNMPVALUE} was changed|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonFanState[{#FANVAL}].diff(0)}>0</p><p>**Recovery expression**: </p>|information|
|Operational status for {#SNMPVALUE} is CRITICAL|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonSupplyState[{#POWERSUP}].last(0)}=3</p><p>**Recovery expression**: </p>|high|
|Operational status for {#SNMPVALUE} is FAILED|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonSupplyState[{#POWERSUP}].last(0)}=4</p><p>**Recovery expression**: </p>|disaster|
|Operational status for {#SNMPVALUE} is WARNING|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonSupplyState[{#POWERSUP}].last(0)}=2</p><p>**Recovery expression**: </p>|warning|
|Operational status for {#SNMPVALUE} was changed|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonSupplyState[{#POWERSUP}].diff(0)}>0</p><p>**Recovery expression**: </p>|high|
|Operational status for sensor {#SNMPVALUE} is CRITICAL|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonTemperatureState[{#CHASSISTEMP}].last(0)}=3</p><p>**Recovery expression**: </p>|high|
|Operational status for sensor {#SNMPVALUE} is FAILED|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonTemperatureState[{#CHASSISTEMP}].last(0)}=4</p><p>**Recovery expression**: </p>|disaster|
|Operational status for sensor {#SNMPVALUE} is WARNING|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonTemperatureState[{#CHASSISTEMP}].last(0)}=2</p><p>**Recovery expression**: </p>|warning|
|Operational status for sensor {#SNMPVALUE} was changed|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonTemperatureState[{#CHASSISTEMP}].diff(0)}>0</p><p>**Recovery expression**: </p>|high|
|#{#SNMPINDEX}: High CPU utilization|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: {Generic Cisco:system.cpu.util[cpmCPUTotal5minRev.{#SNMPINDEX}].avg(5m)}>{$CPU_UTIL_MAX}</p><p>**Recovery expression**: </p>|average|
|{#ENT_NAME}: Device has been replaced (new serial number received)|<p>Last value: {ITEM.LASTVALUE1}. Device serial number has changed. Ack to close</p>|<p>**Expression**: {Generic Cisco:system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}].diff()}=1 and {Generic Cisco:system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}].strlen()}>0</p><p>**Recovery expression**: </p>|information|
|{#SENSOR_INFO}: Fan is in critical state|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: {Generic Cisco:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_CRIT_STATUS:"critical"},eq)}=1 or {Generic Cisco:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_CRIT_STATUS:"shutdown"},eq)}=1</p><p>**Recovery expression**: </p>|average|
|{#SENSOR_INFO}: Fan is in warning state|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: {Generic Cisco:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_WARN_STATUS:"warning"},eq)}=1 or {Generic Cisco:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_WARN_STATUS:"notFunctioning"},eq)}=1</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE}: High memory utilization|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: {Generic Cisco:vm.memory.pused[vm.memory.pused.{#SNMPINDEX}].avg(5m)}>{$MEMORY_UTIL_MAX}</p><p>**Recovery expression**: </p>|average|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>({Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|<p>**Expression**: {Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({Generic Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: </p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:"{#IFNAME}"}%|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: ({Generic Cisco:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>({$IF_UTIL_MAX:"{#IFNAME}"}/100)*{Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {Generic Cisco:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>({$IF_UTIL_MAX:"{#IFNAME}"}/100)*{Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Generic Cisco:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<(({$IF_UTIL_MAX:"{#IFNAME}"}-3)/100)*{Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {Generic Cisco:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<(({$IF_UTIL_MAX:"{#IFNAME}"}-3)/100)*{Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate|<p>Last value: {ITEM.LASTVALUE1}. Recovers when below 80% of {$IF_ERRORS_WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Generic Cisco:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}>{$IF_ERRORS_WARN:"{#IFNAME}"} or {Generic Cisco:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}>{$IF_ERRORS_WARN:"{#IFNAME}"}</p><p>**Recovery expression**: {Generic Cisco:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}<{$IF_ERRORS_WARN:"{#IFNAME}"}*0.8 and {Generic Cisco:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}<{$IF_ERRORS_WARN:"{#IFNAME}"}*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>Last value: {ITEM.LASTVALUE1}. Interface is down</p>|<p>**Expression**: {$IFCONTROL:"{#IFNAME}"}=1 and ({Generic Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Generic Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Generic Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|average|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode|<p>Last value: {ITEM.LASTVALUE1}. Please check autonegotiation settings and cabling</p>|<p>**Expression**: {Generic Cisco:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check autonegotiation settings and cabling</p>|<p>**Expression**: {Generic Cisco:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Operational status for {#SNMPVALUE} is CRITICAL (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonSupplyState[{#POWERSUP}].last(0)}=3</p><p>**Recovery expression**: </p>|high|
|Operational status for {#SNMPVALUE} is FAILED (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonSupplyState[{#POWERSUP}].last(0)}=4</p><p>**Recovery expression**: </p>|disaster|
|Operational status for {#SNMPVALUE} is WARNING (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonSupplyState[{#POWERSUP}].last(0)}=2</p><p>**Recovery expression**: </p>|warning|
|Operational status for {#SNMPVALUE} was changed (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonSupplyState[{#POWERSUP}].diff(0)}>0</p><p>**Recovery expression**: </p>|high|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>({Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|<p>**Expression**: {Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {Generic Cisco:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({Generic Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: </p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:"{#IFNAME}"}% (LLD)|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: ({Generic Cisco:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>({$IF_UTIL_MAX:"{#IFNAME}"}/100)*{Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {Generic Cisco:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>({$IF_UTIL_MAX:"{#IFNAME}"}/100)*{Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Generic Cisco:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<(({$IF_UTIL_MAX:"{#IFNAME}"}-3)/100)*{Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {Generic Cisco:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<(({$IF_UTIL_MAX:"{#IFNAME}"}-3)/100)*{Generic Cisco:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Recovers when below 80% of {$IF_ERRORS_WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Generic Cisco:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}>{$IF_ERRORS_WARN:"{#IFNAME}"} or {Generic Cisco:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}>{$IF_ERRORS_WARN:"{#IFNAME}"}</p><p>**Recovery expression**: {Generic Cisco:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}<{$IF_ERRORS_WARN:"{#IFNAME}"}*0.8 and {Generic Cisco:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}<{$IF_ERRORS_WARN:"{#IFNAME}"}*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Interface is down</p>|<p>**Expression**: {$IFCONTROL:"{#IFNAME}"}=1 and ({Generic Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Generic Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Generic Cisco:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|average|
|{#SENSOR_INFO}: Fan is in critical state (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: {Generic Cisco:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_CRIT_STATUS:"critical"},eq)}=1 or {Generic Cisco:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_CRIT_STATUS:"shutdown"},eq)}=1</p><p>**Recovery expression**: </p>|average|
|{#SENSOR_INFO}: Fan is in warning state (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: {Generic Cisco:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_WARN_STATUS:"warning"},eq)}=1 or {Generic Cisco:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_WARN_STATUS:"notFunctioning"},eq)}=1</p><p>**Recovery expression**: </p>|warning|
|#{#SNMPINDEX}: High CPU utilization (LLD)|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: {Generic Cisco:system.cpu.util[cpmCPUTotal5minRev.{#SNMPINDEX}].avg(5m)}>{$CPU_UTIL_MAX}</p><p>**Recovery expression**: </p>|average|
|{#ENT_NAME}: Device has been replaced (new serial number received) (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Device serial number has changed. Ack to close</p>|<p>**Expression**: {Generic Cisco:system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}].diff()}=1 and {Generic Cisco:system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}].strlen()}>0</p><p>**Recovery expression**: </p>|information|
|Operational status for sensor {#SNMPVALUE} is CRITICAL (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonTemperatureState[{#CHASSISTEMP}].last(0)}=3</p><p>**Recovery expression**: </p>|high|
|Operational status for sensor {#SNMPVALUE} is FAILED (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonTemperatureState[{#CHASSISTEMP}].last(0)}=4</p><p>**Recovery expression**: </p>|disaster|
|Operational status for sensor {#SNMPVALUE} is WARNING (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonTemperatureState[{#CHASSISTEMP}].last(0)}=2</p><p>**Recovery expression**: </p>|warning|
|Operational status for sensor {#SNMPVALUE} was changed (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonTemperatureState[{#CHASSISTEMP}].diff(0)}>0</p><p>**Recovery expression**: </p>|high|
|Operational status for {#SNMPVALUE} is CRITICAL (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonFanState[{#FANVAL}].last(0)}=3</p><p>**Recovery expression**: </p>|high|
|Operational status for {#SNMPVALUE} is Failed (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonFanState[{#FANVAL}].last(0)}=4</p><p>**Recovery expression**: </p>|disaster|
|Operational status for {#SNMPVALUE} is WARNING (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonFanState[{#FANVAL}].last(0)}=2</p><p>**Recovery expression**: </p>|warning|
|Operational status for {#SNMPVALUE} was changed (LLD)|<p>-</p>|<p>**Expression**: {Generic Cisco:ciscoEnvMonFanState[{#FANVAL}].diff(0)}>0</p><p>**Recovery expression**: </p>|information|
|{#SNMPVALUE}: High memory utilization (LLD)|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: {Generic Cisco:vm.memory.pused[vm.memory.pused.{#SNMPINDEX}].avg(5m)}>{$MEMORY_UTIL_MAX}</p><p>**Recovery expression**: </p>|average|
