Fortinet FortiSwitch by SNMP
## Overview

Fortinet FortiSwitch integration for Zabbix 7.0.

May also work with Zabbix 6.4 because it is using the new walk[] master and dependent items logic, but have not tested yet.

Monitors:
- OS version
- Serial number
- ICMP checks
- System name, location, object ID etc
- Network interfaces
- CPU & Memory

## Author

Christos Diamantis - christos.diamantis@outlook.com

## Macros used

|Name|Description|Default|Type|
|----|-----------|----|----|
|{$CPU.UTILIZATION.CRIT}|<p>-</p>|`70`|Text macro|
|{$CPU.UTILIZATION.WARN}|<p>-</p>|`50`|Text macro|
|{$MEM.UTILIZATION.CRIT}|<p>-</p>|`80`|Text macro|
|{$MEM.UTILIZATION.WARN}|<p>-</p>|`60`|Text macro|
|{$NET.IF.IFADMINSTATUS.MATCHES}|<p>-</p>|`^.*`|Text macro|
|{$NET.IF.IFADMINSTATUS.NOT_MATCHES}|Ignore down(2) administrative status|`^2$`|Text macro|
|{$NET.IF.IFALIAS.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFALIAS.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$NET.IF.IFDESCR.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFDESCR.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$NET.IF.IFNAME.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFNAME.NOT_MATCHES}|Filter out loopbacks, nulls, docker veth links and docker0 bridge by default|`(^Software Loopback Interface\|^NULL[0-9.]*$\|^[Ll]o[0-9.]*$\|^[Ss]ystem$\|^Nu[0-9.]*$\|^veth[0-9a-z]+$\|docker[0-9]+\|br-[a-z0-9]{12}\|^quarantine.*$\|^onboarding.*$\|^naf.root.*$\|^nac_segment.*$\|^l2t.root.*$\|^_default.*$)`|Text macro|
|{$NET.IF.IFOPERSTATUS.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFOPERSTATUS.NOT_MATCHES}|Ignore notPresent(6)|`^6$`|Text macro|
|{$NET.IF.IFTYPE.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFTYPE.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$SNMP_TIMEOUT}|<p>-</p>|`5m`|Text macro|

## Template links

There are no template links in this template

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces discovery|Discovering interfaces from IF-MIB.|SNMP_AGENT|net.if.discovery|
|EtherLike discovery|Discovering interfaces from IF-MIB and EtherLike-MIB. Interfaces with up(1) Operational Status are discovered.|SNMP_AGENT|net.if.duplex.discovery|

## Items collected

|Name|Description|Type|Key and additonal info|
|----|-----------|----|----|
|CPU Usage|<p>LLD</p>|`SNMP_AGENT`|fsw.cpu.usage|
|Memory total|<p>LLD</p>|`SNMP_AGENT`|fsw.mem.total|
|Memory used|<p>LLD</p>|`SNMP_AGENT`|fsw.mem.used|
|Memory utilization|<p>LLD</p>|`CALCULATED`|fsw.mem.utilization|
|Storage total|<p>LLD</p>|`SNMP_AGENT`|fsw.storage.total|
|Storage used|<p>LLD</p>|`SNMP_AGENT`|fsw.storage.used|
|Storage utilization|<p>LLD</p>|`CALCULATED`|fsw.storage.utilization|
|ICMP ping|<p>LLD</p>|`SIMPLE`|icmpping|
|ICMP loss|<p>LLD</p>|`SIMPLE`|icmppingloss|
|ICMP response time|<p>LLD</p>|`SIMPLE`|icmppingsec|
|SNMP traps (fallback)|Item is used to collect all SNMP traps unmatched by other snmptrap items|`SNMP_TRAP`|snmptrap.fallback|
|System contact details|MIB: SNMPv2-MIB The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string. |`SNMP_AGENT`|system.contact|
|System description|MIB: SNMPv2-MIB A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software. |`SNMP_AGENT`|system.descr|
|Hardware model name|MIB: ENTITY-MIB|`SNMP_AGENT`|system.hw.model|
|Hardware serial number|MIB: ENTITY-MIB|`SNMP_AGENT`|system.hw.serialnumber|
|Uptime (hardware)|MIB: HOST-RESOURCES-MIB The amount of time since this host was last initialized. Note that this is different from sysUpTime in the SNMPv2-MIB [RFC1907] because sysUpTime is the uptime of the network management portion of the system. |`SNMP_AGENT`|system.hw.uptime|
|System location|MIB: SNMPv2-MIB The physical location of this node (e.g., `telephone closet, 3rd floor').  If the location is unknown, the value is the zero-length string. |`SNMP_AGENT`|system.location|
|System name|MIB: SNMPv2-MIB An administratively-assigned name for this managed node.By convention, this is the node's fully-qualified domain name.  If the name is unknown, the value is the zero-length string. |`SNMP_AGENT`|system.name|
|Uptime (network)|MIB: SNMPv2-MIB The time (in hundredths of a second) since the network management portion of the system was last re-initialized. |`SNMP_AGENT`|system.net.uptime|
|System object ID|MIB: SNMPv2-MIB The vendor's authoritative identification of the network management subsystem contained in the entity.  This value is allocated within the SMI enterprises subtree (1.3.6.1.4.1) and provides an easy and unambiguous means for determining`what kind of box' is being managed.  For example, if vendor`Flintstones, Inc.' was assigned the subtree1.3.6.1.4.1.4242, it could assign the identifier 1.3.6.1.4.1.4242.1.1 to its `Fred Router'. |`SNMP_AGENT`|system.objectid|
|Operating system|<p>LLD</p>|`SNMP_AGENT`|system.sw.os|
|SNMP agent availability|<p>LLD</p>|`INTERNAL`|zabbix[host,snmp,available]|
|Interface {#IFNAME}({#IFDESCR}): Inbound packets discarded|MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime. |`SNMP_AGENT`|net.if.in.discards[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Inbound packets with errors|MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime. |`SNMP_AGENT`|net.if.in.errors[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): In utilization|<p>-</p>|`CALCULATED`|net.if.in.util[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Bits received|MIB: IF-MIB The total number of octets received on the interface, including framing characters. This object is a 64-bit version of ifInOctets. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime. |`SNMP_AGENT`|net.if.in[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Outbound packets discarded|MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime. |`SNMP_AGENT`|net.if.out.discards[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Outbound packets with errors|MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime. |`SNMP_AGENT`|net.if.out.errors[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Out utilization|<p>-</p>|`CALCULATED`|net.if.out.util[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Bits sent|MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. This object is a 64-bit version of ifOutOctets.Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime. |`SNMP_AGENT`|net.if.out[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Speed|MIB: IF-MIB An estimate of the interface's current bandwidth in units of 1,000,000 bits per second. If this object reports a value of `n' then the speed of the interface is somewhere in the range of `n-500,000' to`n+499,999'.  For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. For a sub-layer which has no concept of bandwidth, this object should be zero. |`SNMP_AGENT`|net.if.speed[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Operational status|MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components. |`SNMP_AGENT`|net.if.status[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Total utilization|<p>-</p>|`CALCULATED`|net.if.total.util[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Interface type|MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned Numbers Authority (IANA), through updating the syntax of the IANAifType textual convention. |`SNMP_AGENT`|net.if.type[{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFDESCR}): Duplex status|MIB: EtherLike-MIB Object name: dot3StatsDuplexStatus The current mode of operation of the MAC entity.  'unknown' indicates that the current duplex mode could not be determined.  Management control of the duplex mode is accomplished through the MAU MIB.  When an interface does not support autonegotiation, or when autonegotiation is not enabled, the duplex mode is controlled using ifMauDefaultType.  When autonegotiation is supported and enabled, duplex mode is controlled using ifMauAutoNegAdvertisedBits.  In either case, the currently operating duplex mode is reflected both in this object and in ifMauType.  Note that this object provides redundant information with ifMauType.  Normally, redundant objects are discouraged.  However, in this instance, it allows a management application to determine the duplex status of an interface without having to know every possible value of ifMauType.  This was felt to be sufficiently valuable to justify the redundancy. Reference: [IEEE 802.3 Std.], 30.3.1.1.32,aDuplexStatus. |`SNMP_AGENT`|net.if.duplex[{#SNMPINDEX}]<p>LLD</p>|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----|----|
|High CPU Utilization|<p>-</p>|<p>**Expression**: last(/Fortinet FortiSwitch by SNMP/fsw.cpu.usage)>{$CPU.UTILIZATION.CRIT}</p>|HIGH|
|High CPU Utilization|<p>-</p>|<p>**Expression**: last(/Fortinet FortiSwitch by SNMP/fsw.cpu.usage)>{$CPU.UTILIZATION.WARN}</p>|WARNING|
|High Memory Utilization|<p>-</p>|<p>**Expression**: last(/Fortinet FortiSwitch by SNMP/fsw.mem.utilization)>{$MEM.UTILIZATION.CRIT}</p>|HIGH|
|High Memory Utilization|<p>-</p>|<p>**Expression**: last(/Fortinet FortiSwitch by SNMP/fsw.mem.utilization)>{$MEM.UTILIZATION.WARN}</p>|WARNING|
|High Storage Utilization|<p>-</p>|<p>**Expression**: last(/Fortinet FortiSwitch by SNMP/fsw.storage.utilization)>=90</p>|HIGH|
|Unavailable by ICMP ping|Last three attempts returned timeout.  Please check device connectivity.|<p>**Expression**: max(/Fortinet FortiSwitch by SNMP/icmpping,#3)=0</p>|HIGH|
|High ICMP ping loss|<p>-</p>|<p>**Expression**: min(/Fortinet FortiSwitch by SNMP/icmppingloss,5m)>{$ICMP_LOSS_WARN} and min(/Fortinet FortiSwitch by SNMP/icmppingloss,5m)<100</p>|WARNING|
|High ICMP ping response time|<p>-</p>|<p>**Expression**: avg(/Fortinet FortiSwitch by SNMP/icmppingsec,5m)>{$ICMP_RESPONSE_TIME_WARN}</p>|WARNING|
|Device has been replaced|Device serial number has changed. Ack to close|<p>**Expression**: last(/Fortinet FortiSwitch by SNMP/system.hw.serialnumber,#1)<>last(/Fortinet FortiSwitch by SNMP/system.hw.serialnumber,#2) and length(last(/Fortinet FortiSwitch by SNMP/system.hw.serialnumber))>0</p>|INFO|
|System name has changed|System name has changed. Ack to close.|<p>**Expression**: last(/Fortinet FortiSwitch by SNMP/system.name,#1)<>last(/Fortinet FortiSwitch by SNMP/system.name,#2) and length(last(/Fortinet FortiSwitch by SNMP/system.name))>0</p>|INFO|
|Operating system description has changed|Operating system description has changed. Possible reasons that system has been updated or replaced. Ack to close.|<p>**Expression**: last(/Fortinet FortiSwitch by SNMP/system.sw.os,#1)<>last(/Fortinet FortiSwitch by SNMP/system.sw.os,#2) and length(last(/Fortinet FortiSwitch by SNMP/system.sw.os))>0</p>|INFO|
|No SNMP data collection|SNMP is not available for polling. Please check device connectivity and SNMP settings.|<p>**Expression**: max(/Fortinet FortiSwitch by SNMP/zabbix[host,snmp,available],{$SNMP.TIMEOUT})=0</p>|WARNING|
|Interface {#IFNAME}({#IFDESCR}): Ethernet has changed to lower speed than it was before|This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.|<p>**Expression**: change(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}])<0 and last(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}])>0 and ( last(/Fortinet FortiSwitch by SNMP/net.if.type[{#SNMPINDEX}])=6 or last(/Fortinet FortiSwitch by SNMP/net.if.type[{#SNMPINDEX}])=7 or last(/Fortinet FortiSwitch by SNMP/net.if.type[{#SNMPINDEX}])=11 or last(/Fortinet FortiSwitch by SNMP/net.if.type[{#SNMPINDEX}])=62 or last(/Fortinet FortiSwitch by SNMP/net.if.type[{#SNMPINDEX}])=69 or last(/Fortinet FortiSwitch by SNMP/net.if.type[{#SNMPINDEX}])=117 ) and (last(/Fortinet FortiSwitch by SNMP/net.if.status[{#SNMPINDEX}])<>2) </p><p>**Recovery expression**: (change(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}])>0 and last(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}],#2)>0) or (last(/Fortinet FortiSwitch by SNMP/net.if.status[{#SNMPINDEX}])=2) </p>|INFO|
|Interface {#IFNAME}({#IFDESCR}): High inbound bandwidth usage|The network interface utilization is close to its estimated maximum bandwidth.|<p>**Expression**: (avg(/Fortinet FortiSwitch by SNMP/net.if.in[{#SNMPINDEX}],15m)>({$IF.UTIL.MAX:"{#IFNAME}"}/100)*last(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}])) and last(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}])>0 </p><p>**Recovery expression**: avg(/Fortinet FortiSwitch by SNMP/net.if.in[{#SNMPINDEX}],15m)<(({$IF.UTIL.MAX:"{#IFNAME}"}-3)/100)*last(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}])</p>|WARNING|
|Interface {#IFNAME}({#IFDESCR}): High outbound bandwidth usage|The network interface utilization is close to its estimated maximum bandwidth.|<p>**Expression**: (avg(/Fortinet FortiSwitch by SNMP/net.if.out[{#SNMPINDEX}],15m)>({$IF.UTIL.MAX:"{#IFNAME}"}/100)*last(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}])) and last(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}])>0 </p><p>**Recovery expression**: avg(/Fortinet FortiSwitch by SNMP/net.if.out[{#SNMPINDEX}],15m)<(({$IF.UTIL.MAX:"{#IFNAME}"}-3)/100)*last(/Fortinet FortiSwitch by SNMP/net.if.speed[{#SNMPINDEX}])</p>|WARNING|
