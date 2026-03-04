# SNMP Hillstone


## Overview

This template is designed to monitor Hillstone devices by Zabbix SNMP agent.

It requires no additional files or components - just add the template and you're done.

Monitors the following items:

* Slot CPU use
* Slot CP Memory use
* Slot DP Memory use
* Session use
* Session total
* SessionRampupRate
* OverallThroughput
* Interfaces
	+ Inbound discarded packets
	+ Inbound errors
	+ Inbound traffic
	+ Outbound discarded packets
	+ Outbound errors
	+ Outbound traffic
* HAStatus
* Slot Status
* FAN Status
* Power Status


## Author

Wu Bin


## Requirements

Zabbix version: 7.4 and higher.


## Configuration

Zabbix should be configured according to the instructions in the Templates out of the box section.


## Setup

Refer to the vendor documentation.


## Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$CPU.UTIL.CRIT}|Threshold of CPU utilization for the Warning trigger in %.|80|
|{$ICMP_LOSS_WARN}| Warning threshold of ICMP packet loss in %.|20|
|{$ICMP_RESPONSE_TIME_WARN}| Warning threshold of the average ICMP response time in seconds.|0.15|
|{$IF.ERRORS.WARN}|Threshold of error packets rate for warning trigger. Can be used with interface name as context.|2|
|{$IF.UTIL.MAX}|Threshold of interface bandwidth utilization for warning trigger in %. Can be used with interface name as context.|95|
|{$IFCONTROL}|Macro for operational state of the interface for "Link down" trigger. Can be used with interface name as context.|1|
|{$MEMORY.UTIL.CRIT}|Threshold of memory utilization for critical trigger in %.|90|
|{$MEMORY_UTIL_WARN}|Threshold of memory utilization for warning trigger in %.|80|
|{$NETIF.IFADMINSTATUS.MATCHES}|Used in Network interface discovery. Can be overridden on the host or linked template level.|^.*|
|{$NETIF.IFADMINSTATUS.NOT_MATCHES}| Ignore down(2) administrative status|^2$|
|{$NETIF.IFALIAS.MATCHES}|Used in Network interface discovery. Can be overridden on the host or linked template level.|*|
|{$NETIF.IFALIAS.NOT_MATCHES}|Used in Network interface discovery. Can be overridden on the host or linked template level.|CHANGE_IF_NEEDED|
|{$NETIF.IFDESCR.MATCHES}|Used in Network interface discovery. Can be overridden on the host or linked template level.|*|
|{$NETIF.IFDESCR.NOT_MATCHES}|Used in Network interface discovery. Can be overridden on the host or linked template level.|CHANGE_IF_NEEDED|
|{$NETIF.IFNAME.MATCHES}|Used in Network interface discovery. Can be overridden on the host or linked template level.|^.*$|
|{$NETIF.IFNAME.NOT_MATCHES}|Filter out loopbacks, nulls, docker veth links and docker0 bridge by default |^(Software Loopback Interface|NULL{0-9.}*|Llo{0-9.}*|$|^System$|Nu{0-9.}*|veth{0-9a-z}+|docker{0-9}+|br-{0-9a-z}+)$|
|{$NET.IF.IFOPERSTATUS.MATCHES}|Used in Network interface discovery. Can be overridden on the host or linked template level.|^.*$|
|{$NET.IF.IFOPERSTATUS.NOT_MATCHES}|Ignore notPresent(6)|^6$|
|{$NET.IF.IFTYPE.MATCHES}|Used in Network interface discovery. Can be overridden on the host or linked template level.|.*|
|{$NET.IF.IFTYPE.NOT_MATCHES}|Used in Network interface discovery. Can be overridden on the host or linked template level.|CHANGE_IF_NEEDED|
|{$SESSION.UTIL.CRIT}|Threshold of session utilization for the Warning trigger in %.|80|
|{$SNMP.TIMEOUT}|Time interval for the SNMP availability trigger.|5m|


## Template links

There are no template links in this template.


## Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory utilization|Current memory utilization (percentage).|Calculated|hillstone.memory.utilization<p>Update: 60</p>|
|sysCurMemory|MIB: HILLSTONE-SYSTEM-MIB<p>The currently used memory.</p>|SNMP agent|hillstone.sysCurMemory<p>Update: 60</p>|
|sysTotalMemory|MIB: HILLSTONE-SYSTEM-MIB<p>Total Memory.</p>|SNMP agent|hillstone.sysTotalMemory<p>Update: 60</p>|
|sysCurSession|MIB: HILLSTONE-SYSTEM-MIB|SNMP agent|hillstone.sysCurSession<p>Update: 30</p>|
|sysTotalSession|MIB: HILLSTONE-SYSTEM-MIB|SNMP agent|hillstone.sysTotalSession<p>Update: 1h</p>|
|sysRamupRate|MIB: HILLSTONE-SYSTEM-MIB|SNMP agent|hillstone.sysRamupRate<p>Update: 30</p>|
|sysOverallThroughput|MIB: HILLSTONE-SYSTEM-MIB|SNMP agent|hillstone.sysOverallThroughput<p>Update: 60</p>|
|sysHAStatus|MIB: HILLSTONE-SYSTEM-MIB|SNMP agent|hillstone.sysHAStatus<p>Update: 10m</p>|


## Triggers

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|---------|
|Hillstone: High memory utilization|The system is running out of free memory.|`min(/Hillstone by SNMP/hillstone.memory.utilization,5m)>{$MEMORY.UTIL.WARN}`|Warning| |
|Hillstone: High Session utilization| |`last(/Hillstone by SNMP/hillstone.sysCurSession)>0 and last(/Hillstone by SNMP/hillstone.sysTotalSession)>0 and min(/Hillstone by SNMP/hillstone.sysCurSession,5m)*100/last(/Hillstone by SNMP/hillstone.sysTotalSession)>{$SESSION.UTIL.CRIT}`|Warning| |


## LLD rule Network interfaces discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces discovery|Discovering interfaces from IF-MIB.|SNMP agent|net.if.discovery|


## Item prototypes for Network interfaces discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interface {#IFNAME}({#IFALIAS}): Bits received|MIB: IF-MIB<p>The total number of octets received on the interface,including framing characters. Discontinuities in the value of this counter can occur at re-initialization of the management system, and another times as indicated by the value of ifCounterDiscontinuityTime.</p>|SNMP agent|net.if.in[ifInOctets.{#SNMPINDEX}]<p>Preprocessing<p>* Change per second<p>* Custom multiplier: `8`</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|MIB: IF-MIB<p>The total number of octets transmitted out of the interface, including framing characters. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|SNMP agent|net.if.out[ifOutOctets.{#SNMPINDEX}]<p>Preprocessing<p>* Change per second<p>* Custom multiplier: `8`</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|MIB: IF-MIB<p>The number of inbound packets which were chosen to be discarded<p>even though no errors had been detected to prevent their being deliverable to a higher-layer protocol.<p>One possible reason for discarding such a packet could be to free up buffer space.<p>Discontinuities in the value of this counter can occur at re-initialization of the management system,<p>and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|SNMP agent|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Preprocessing<p>* Change per second</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|MIB: IF-MIB<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|SNMP agent|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Preprocessing<p>* Change per second</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|MIB: IF-MIB<p>The number of inbound packets which were chosen to be discarded<p>even though no errors had been detected to prevent their being deliverable to a higher-layer protocol.<p>One possible reason for discarding such a packet could be to free up buffer space.<p>Discontinuities in the value of this counter can occur at re-initialization of the management system,<p>and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|SNMP agent|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Preprocessing<p>* Change per second</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|MIB: IF-MIB<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|SNMP agent|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Preprocessing<p>* Change per second</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|MIB: IF-MIB<p>The type of interface.<p>Additional values for ifType are assigned by the Internet Assigned Numbers Authority (IANA),<p>through updating the syntax of the IANAifType textual convention.</p>|SNMP agent|net.if.type[ifType.{#SNMPINDEX}]<p>Preprocessing<p>* Discard unchanged with<p> heartbeat: `1d`</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|MIB: IF-MIB<p>The current operational state of the interface.<p>- The testing(3) state indicates that no operational packet scan be passed<p>- If ifAdminStatus is down(2) then ifOperStatus should be down(2)<p>- If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic<p>- It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection)<p>- It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state<p>- It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|SNMP agent|net.if.status[ifOperStatus.{#SNMPINDEX}]|
|Interface {#IFNAME}({#IFALIAS}): Speed|MIB: IF-MIB<p>An estimate of the interface's current bandwidth in bits per second.<p>For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made,<p>this object should contain the nominal bandwidth.<p>If the bandwidth of the interface is greater than the maximum value reportable by this object then<p>this object should report its maximum value (4,294,967,295) and ifHighSpeed must be used to report the interface's speed.<p>For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|SNMP agent|net.if.speed[ifSpeed.{#SNMPINDEX}]|


## LLD rule FAN discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|FAN Discovery|Discovering FAN Status from HILLSTONE-FAN-MIB.|snmp agent|sysFanStatus.discovery|


## LLD rule Power discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Power Discovery|Discovering Power Status from HILLSTONE-POWER-MIB.|snmp agent|sysPowerStatus.discovery|


## LLD rule Slot discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Slot Discovery|Discovering Slot Status from HILLSTONE-MODULE-MIB.|snmp agent|sysSlotStatus.discovery|