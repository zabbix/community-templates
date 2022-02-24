# Module Interfaces SNMPv2

## Description

Template Interfaces version: 0.14 MIBs used: IF-MIB

## Overview

Hello, I created this template that contains the verification of all interfaces of fortinet equipment


 


Including


 


CPU%


Memory%


Vpn discovery


HA monitoring


Equipment Uptime


Number of Connections


Traffic Internet Inbound and Outbound


Serial Number (Included in host screens)


Firmware version (Included in host screens)


In addition to trigger triggers for all items


 


Update: Template updated to configuration version, search and discovery items changed



## Author

Cleyton Ferreira da Silva

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$IFCONTROL}|<p>-</p>|`1`|Text macro|
|{$IF_ERRORS_WARN}|<p>-</p>|`2`|Text macro|
|{$IF_UTIL_MAX}|<p>-</p>|`90`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces Discovery|<p>Discovering interfaces from IF-MIB. Interfaces with down(2) Administrative Status are not discovered.</p>|`SNMP agent`|net.if.discovery<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Used storage space|<p>-</p>|`SNMP agent`|fortinetUsedStorage<p>Update: 60</p>|
|Firmware Version|<p>-</p>|`SNMP agent`|SysmFirmwareVersion<p>Update: 3600</p>|
|Current CPU Util|<p>-</p>|`SNMP agent`|fortinetCurrentCPUUtil<p>Update: 60</p>|
|Fortinet Uptime|<p>-</p>|`SNMP agent`|fortinetUpTime<p>Update: 30</p>|
|Current connections|<p>-</p>|`SNMP agent`|fortinetCurrentConnections<p>Update: 60</p>|
|Current RAM Usage|<p>-</p>|`SNMP agent`|fortinetCurrentRAMUtil<p>Update: 60</p>|
|Total storage space|<p>-</p>|`SNMP agent`|fortinetTotalStorage<p>Update: 3600</p>|
|Fortinet Used Storage %|<p>-</p>|`Calculated`|fortinetUsedStorage-percent<p>Update: 60</p>|
|Serial Number|<p>-</p>|`SNMP agent`|fortinetSysSerial<p>Update: 3600</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|<p>MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Recebidos|<p>MIB: IF-MIB The total number of octets received on the interface,including framing characters. This object is a 64-bit version of ifInOctets. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|<p>MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Enviados|<p>MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. This object is a 64-bit version of ifOutOctets.Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>MIB: IF-MIB An estimate of the interface's current bandwidth in units of 1,000,000 bits per second. If this object reports a value of `n' then the speed of the interface is somewhere in the range of `n-500,000' to`n+499,999'. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|<p>MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned NumbersAuthority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>Last value: {ITEM.LASTVALUE1}. This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2) </p><p>**Recovery expression**: ({Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:"{#IFNAME}"}%|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: ({Module Interfaces SNMPv2:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {Module Interfaces SNMPv2:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Module Interfaces SNMPv2:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {Module Interfaces SNMPv2:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate|<p>Last value: {ITEM.LASTVALUE1}. Recovers when below 80% of {$IF_ERRORS_WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Module Interfaces SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}>2 or {Module Interfaces SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}>2</p><p>**Recovery expression**: {Module Interfaces SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}<2*0.8 and {Module Interfaces SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>Last value: {ITEM.LASTVALUE1}. Interface is down</p>|<p>**Expression**: 1=1 and ({Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|disaster|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>Last value: {ITEM.LASTVALUE1}. This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {Module Interfaces SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2) </p><p>**Recovery expression**: ({Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:"{#IFNAME}"}% (LLD)|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: ({Module Interfaces SNMPv2:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {Module Interfaces SNMPv2:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Module Interfaces SNMPv2:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {Module Interfaces SNMPv2:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Module Interfaces SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Recovers when below 80% of {$IF_ERRORS_WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Module Interfaces SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}>2 or {Module Interfaces SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}>2</p><p>**Recovery expression**: {Module Interfaces SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}<2*0.8 and {Module Interfaces SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Interface is down</p>|<p>**Expression**: 1=1 and ({Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Module Interfaces SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|disaster|
