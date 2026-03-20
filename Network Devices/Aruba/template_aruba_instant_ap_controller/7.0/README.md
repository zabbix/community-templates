# Aruba Instant AP Wireless Controller by SNMP

## Overview

Aruba Instant AP Wireless controller integration for Zabbix 7.0.

May also work with Zabbix 6.4 because it is using the new walk[] master and dependent items logic, but have not tested yet.

Monitors: 
- Controller version
- Operating system
- System name, location, object ID etc
- ICMP checks
- Managed Access Points
- Access Points clients
- Network interfaces
- Managed SSIDs


## Author

Christos Diamantis (christos-diamantis)

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU.UTIL.CRIT}|<p>-</p>|`80`|Text macro|
|{$ICMP_LOSS_WARN}|<p>-</p>|`20`|Text macro|
|{$ICMP_RESPONSE_TIME_WARN}|<p>-</p>|`0.15`|Text macro|
|{$IF.ERRORS.WARN}|<p>-</p>|`2`|Text macro|
|{$IF.UTIL.MAX}|<p>-</p>|`90`|Text macro|
|{$MEMORY.UTIL.MAX}|<p>-</p>|`1`|Text macro|
|{$NET.IF.IFADMINSTATUS.MATCHES}|<p>-</p>|`^.*`|Text macro|
|{$NET.IF.IFADMINSTATUS.NOT_MATCHES}|Ignore down(2) administrative status|`^2$`|Text macro|
|{$NET.IF.IFALIAS.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFALIAS.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$NET.IF.IFDESCR.MATCHES}|<p>-</p>|`.*`|Text macro|
|{$NET.IF.IFDESCR.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$NET.IF.IFNAME.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFNAME.NOT_MATCHES}|Filter out loopbacks, nulls, docker veth links and docker0 bridge by default|`(^Software Loopback Interface\|^NULL[0-9.]*$\|^[Ll]o[0-9.]*$\|^[Ss]ystem$\|^Nu[0-9.]*$\|^veth[0-9a-z]+$\|docker[0-9]+\|br-[a-z0-9]{12})`|Text macro|
|{$NET.IF.IFOPERSTATUS.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFOPERSTATUS.NOT_MATCHES}|Ignore notPresent(6)|`^6$`|Text macro|
|{$NET.IF.IFTYPE.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFTYPE.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$SNMP.TIMEOUT}|The time interval for SNMP agent availability trigger expression.|`5m`|Text macro|

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Access point clients discovery|<p>-</p>|`Dependent item`|aruba.ap.clients.discovery|
|APs discovery|<p>-</p>|`Dependent item`|aruba.ap.discovery|
|Network interfaces discovery|<p>-</p>|`Dependent item`|net.if.discovery|
|SSID discovery|<p>-</p>|`Dependent item`|aruba.ssid.discovery|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Aruba AP Controller: Uptime (network)|MIB: SNMPv2-MIB<p>The time (in hundredths of a second) since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|system.net.uptime[sysUpTime.0]|
|Aruba AP Controller: Uptime (hardware)|MIB: HOST-RESOURCES-MIB<p>The amount of time since this host was last initialized. Note that this is different from sysUpTime in the SNMPv2-MIB [RFC1907] because sysUpTime is the uptime of the network management portion of the system.</p>|`SNMP agent`|system.hw.uptime[hrSystemUptime.0]|
|Aruba AP Controller: System object ID|MIB: SNMPv2-MIB<p>The vendor's authoritative identification of the network management subsystem contained in the entity.  This value is allocated within the SMI enterprises subtree (1.3.6.1.4.1) and provides an easy and unambiguous means for determining`what kind of box' is being managed.  For example, if vendor`Flintstones, Inc.' was assigned the subtree1.3.6.1.4.1.4242, it could assign the identifier 1.3.6.1.4.1.4242.1.1 to its `Fred Router'.</p>|`SNMP agent`|system.objectid[sysObjectID.0]|
|Aruba AP Controller: System name|MIB: SNMPv2-MIB<p>An administratively-assigned name for this managed node.By convention, this is the node's fully-qualified domain name.  If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.name|
|Aruba AP Controller: System location|MIB: SNMPv2-MIB<p>The physical location of this node (e.g., `telephone closet, 3rd floor').  If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|system.location[sysLocation.0]|
|Aruba AP Controller: System description|MIB: SNMPv2-MIB<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|system.descr[sysDescr.0]|
|Aruba AP Controller: System contact details|MIB: SNMPv2-MIB<p>The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|system.contact[sysContact.0]|
|Aruba AP Controller: SNMP walk SSIDs|Discovering SSIDs from AI-AP-MIB.|`SNMP agent`|aruba.ssid.walk|
|Aruba AP Controller: SNMP walk network interfaces|Discovering interfaces from IF-MIB.|`SNMP agent`|net.if.walk|
|Aruba AP Controller: SNMP walk AP clients|Discovering Access point clients from AI-AP-MIB.|`SNMP agent`|aruba.ap.clients.walk|
|Aruba AP Controller: SNMP walk access points|Discovering Access Points from AI-AP-MIB.|`SNMP agent`|aruba.ap.walk|
|Aruba AP Controller: SNMP traps (fallback)|The item is used to collect all SNMP traps unmatched by other snmptrap items|`SNMP trap`|snmptrap.fallback|
|Aruba AP Controller: SNMP agent availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]|
|Aruba AP Controller: Operating system|MIB: SNMPv2-MIB|`SNMP agent`|system.sw.os[sysDescr.0]|
|Aruba AP Controller: ICMP response time|<p>-</p>|`Simple check`|icmppingsec|
|Aruba AP Controller: ICMP ping|<p>-</p>|`Simple check`|icmpping|
|Aruba AP Controller: ICMP loss|<p>-</p>|`Simple check`|icmppingloss|
|Aruba AP Controller: Controller version|MIB: ENTITY-MIB|`SNMP agent`|aruba.ap.ctrl.version|
|Client: {#CLIENT.NAME} ({#CLIENT.IP.ADDR}): Bits received|AI-AP-MIB<p>Bits rate received by the client.</p>|`Dependent item`|aruba.ap.clients[bits.in.{#CLIENT.MAC.ADDR}]<p>LLD</p>|
|Client: {#CLIENT.NAME} ({#CLIENT.IP.ADDR}): Bits sent|AI-AP-MIB<p>Bits rate transmitted by the client.</p>|`Dependent item`|aruba.ap.clients[bits.out.{#CLIENT.MAC.ADDR}]<p>LLD</p>|
|Client: {#CLIENT.NAME} ({#CLIENT.IP.ADDR}): Operating System|AI-AP-MIB<p>Operating system of client</p>|`Dependent item`|aruba.ap.clients[os.{#CLIENT.MAC.ADDR}]<p>LLD</p>|
|Client: {#CLIENT.NAME} ({#CLIENT.IP.ADDR}): SNR|AI-AP-MIB<p>Signal to noise ratio of client connection to the access point</p>|`Dependent item`|aruba.ap.clients[snr.{#CLIENT.MAC.ADDR}]<p>LLD</p>|
|Client: {#CLIENT.NAME} ({#CLIENT.IP.ADDR}): Uptime|AI-AP-MIB<p>Client uptime. On mobility event, all counters are reset to zero (0) and uptime is set to zero (0).</p>|`Dependent item`|aruba.ap.clients[uptime.{#CLIENT.MAC.ADDR}]<p>LLD</p>|
|AP: {#AP.NAME}: CPU utilization|AI-AP-MIB<p>Access Point CPU utilization.</p>|`Dependent item`|aruba.ap[cpu.utilization.{#AP.MAC.ADDR}]<p>LLD</p>|
|AP: {#AP.NAME}: Free memory|AI-AP-MIB<p>Amount of memory free in AP in bytes.</p>|`Dependent item`|aruba.ap[memory.free.{#AP.MAC.ADDR}]<p>LLD</p>|
|AP: {#AP.NAME}: ICMP ping|ICMP ping of Access Point|`Simple check`|icmpping[{#AP.IP.ADDR}]<p>LLD</p>|
|AP: {#AP.NAME}: Memory utilization|Memory utilization of AP.|`Calculated`|aruba.ap[memory.util.{#AP.MAC.ADDR}]<p>LLD</p>|
|AP: {#AP.NAME}: Status|AI-AP-MIB<p>Indicates the Access Point status.</p>|`Dependent item`|aruba.ap[status.{#AP.MAC.ADDR}]<p>LLD</p>|
|AP: {#AP.NAME}: Total memory|AI-AP-MIB<p>Total amount of memory available in AP in bytes.</p>|`Dependent item`|aruba.ap[memory.total.{#AP.MAC.ADDR}]<p>LLD</p>|
|AP: {#AP.NAME}: Uptime|AI-AP-MIB<p>Access Point uptime.</p>|`Dependent item`|aruba.ap[uptime.{#AP.MAC.ADDR}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|MIB: IF-MIB<p>The total number of octets received on the interface, including framing characters. This object is a 64-bit version of ifInOctets. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`Dependent item`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|MIB: IF-MIB<p>The total number of octets transmitted out of the interface, including framing characters. This object is a 64-bit version of ifOutOctets.Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`Dependent item`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|MIB: IF-MIB<p>The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`Dependent item`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|MIB: IF-MIB<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`Dependent item`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|MIB: IF-MIB<p>The type of interface. Additional values for ifType are assigned by the Internet Assigned Numbers Authority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`Dependent item`|net.if.type[ifType.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|MIB: IF-MIB<p>The current operational state of the interface.<p>- The testing(3) state indicates that no operational packet scan be passed</p><p>- If ifAdminStatus is down(2) then ifOperStatus should be down(2)</p><p>- If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic</p><p>- It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection)</p><p>- It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state</p><p>- It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`Dependent item`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|MIB: IF-MIB<p>The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`Dependent item`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|MIB: IF-MIB<p>For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`Dependent item`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|MIB: IF-MIB<p>An estimate of the interface's current bandwidth in units of 1,000,000 bits per second. If this object reports a value of `n' then the speed of the interface is somewhere in the range of `n-500,000' to`n+499,999'.  For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`Dependent item`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>LLD</p>|
|SSID: {#SSID.NAME}: Hide status|AI-AP-MIB<p>Indicates whether the SSID hide is enabled(0) or disabled(1)</p>|`Dependent item`|aruba.ssid[status.hide.{#SSID.NAME}]<p>LLD</p>|
|SSID: {#SSID.NAME}: Number of clients|AI-AP-MIB<p>Number of clients connected to the SSID.</p>|`Dependent item`|aruba.ssid[clients.num.{#SSID.NAME}]<p>LLD</p>|
|SSID: {#SSID.NAME}: Status|AI-AP-MIB<p>Indicates whether the SSID is enabled(0) or disabled(1)</p>|`Dependent item`|aruba.ssid[status.{#SSID.NAME}]<p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Aruba AP Controller: High ICMP ping loss|<p>-</p>|<p>**Expression**: min(/ADAPTERA - Aruba Instant AP Controller by SNMP/icmppingloss,5m)>{$ICMP_LOSS_WARN} and min(/ADAPTERA - Aruba Instant AP Controller by SNMP/icmppingloss,5m)<100</p><p>**Recovery expression**: </p>|warning|
|Aruba AP Controller: High ICMP ping response time|<p>-</p>|<p>**Expression**: avg(/ADAPTERA - Aruba Instant AP Controller by SNMP/icmppingsec,5m)>{$ICMP_RESPONSE_TIME_WARN}</p><p>**Recovery expression**: </p>|warning|
|Aruba AP Controller: No SNMP data collection|<p>-</p>|<p>**Expression**: max(/ADAPTERA - Aruba Instant AP Controller by SNMP/zabbix[host,snmp,available],{$SNMP.TIMEOUT})=0</p><p>**Recovery expression**: </p>|warning|
|Aruba AP Controller: Operating system description has changed|<p>-</p>|<p>**Expression**: last(/ADAPTERA - Aruba Instant AP Controller by SNMP/system.sw.os[sysDescr.0],#1)<>last(/ADAPTERA - Aruba Instant AP Controller by SNMP/system.sw.os[sysDescr.0],#2) and length(last(/ADAPTERA - Aruba Instant AP Controller by SNMP/system.sw.os[sysDescr.0]))>0</p><p>**Recovery expression**: </p>|information|
|Aruba AP Controller: System name has changed|<p>-</p>|<p>**Expression**: last(/ADAPTERA - Aruba Instant AP Controller by SNMP/system.name,#1)<>last(/ADAPTERA - Aruba Instant AP Controller by SNMP/system.name,#2) and length(last(/ADAPTERA - Aruba Instant AP Controller by SNMP/system.name))>0</p><p>**Recovery expression**: </p>|information|
|Aruba AP Controller: Unavailable by ICMP ping|<p>-</p>|<p>**Expression**: max(/ADAPTERA - Aruba Instant AP Controller by SNMP/icmpping,#3)=0</p><p>**Recovery expression**: </p>|high|
|AP: {#AP.NAME} High CPU utilization|<p>Machine is experiencing high CPU usage. Might be slow to respond.</p>|<p>**Expression**: min(/ADAPTERA - Aruba Instant AP Controller by SNMP/aruba.ap[cpu.utilization.{#AP.MAC.ADDR}],5m)>{$CPU.UTIL.CRIT}</p><p>**Recovery expression**: </p>|average|
|AP: {#AP.NAME} High memory utilization|<p>Machine is experiencing high memory usage.</p>|<p>**Expression**: min(/ADAPTERA - Aruba Instant AP Controller by SNMP/aruba.ap[memory.util.{#AP.MAC.ADDR}],5m)>{$MEMORY.UTIL.MAX}</p><p>**Recovery expression**: </p>|average|
|AP: {#AP.NAME} status is down|<p>AP controller is reporting the AP as down for 2 minutes. Please check device connectivity with the controller.</p>|<p>**Expression**: last(/ADAPTERA - Aruba Instant AP Controller by SNMP/aruba.ap[status.{#AP.MAC.ADDR}],#2)=2</p><p>**Recovery expression**: </p>|high|
|AP: {#AP.NAME} Unavailable by ICMP ping|<p>Last three attempts returned timeout.  Please check device connectivity.</p>|<p>**Expression**: max(/ADAPTERA - Aruba Instant AP Controller by SNMP/icmpping[{#AP.IP.ADDR}],#3)=0</p><p>**Recovery expression**: </p>|high|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Acknowledge to close the problem manually.</p>|<p>**Expression**: change(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.speed[ifHighSpeed.{#SNMPINDEX}])<0 and last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.speed[ifHighSpeed.{#SNMPINDEX}])>0 and (last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.type[ifType.{#SNMPINDEX}])=6 or last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.type[ifType.{#SNMPINDEX}])=7 or last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.type[ifType.{#SNMPINDEX}])=11 or last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.type[ifType.{#SNMPINDEX}])=62 or last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.type[ifType.{#SNMPINDEX}])=69 or last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.type[ifType.{#SNMPINDEX}])=117 ) and (last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.status[ifOperStatus.{#SNMPINDEX}])<>2)</p><p>**Recovery expression**: (change(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.speed[ifHighSpeed.{#SNMPINDEX}])>0 and last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.speed[ifHighSpeed.{#SNMPINDEX}],#2)>0) or (last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.status[ifOperStatus.{#SNMPINDEX}])=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage|<p>The utilization of the network interface is close to its estimated maximum bandwidth.</p>|<p>**Expression**: (avg(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.in[ifHCInOctets.{#SNMPINDEX}],15m)>({$IF.UTIL.MAX:"{#IFNAME}"}/100)*last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.speed[ifHighSpeed.{#SNMPINDEX}]) or avg(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.out[ifHCOutOctets.{#SNMPINDEX}],15m)>({$IF.UTIL.MAX:"{#IFNAME}"}/100)*last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.speed[ifHighSpeed.{#SNMPINDEX}])) and last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.speed[ifHighSpeed.{#SNMPINDEX}])>0</p><p>**Recovery expression**: avg(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.in[ifHCInOctets.{#SNMPINDEX}],15m)<(({$IF.UTIL.MAX:"{#IFNAME}"}-3)/100)*last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.speed[ifHighSpeed.{#SNMPINDEX}]) and avg(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.out[ifHCOutOctets.{#SNMPINDEX}],15m)<(({$IF.UTIL.MAX:"{#IFNAME}"}-3)/100)*last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.speed[ifHighSpeed.{#SNMPINDEX}])</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate|<p>It recovers when it is below 80% of the `{$IF.ERRORS.WARN:"{#IFNAME}"}` threshold.</p>|<p>min(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.in.errors[ifInErrors.{#SNMPINDEX}],5m)>{$IF.ERRORS.WARN:"{#IFNAME}"} or min(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.out.errors[ifOutErrors.{#SNMPINDEX}],5m)>{$IF.ERRORS.WARN:"{#IFNAME}"}</p><p>**Recovery expression**: max(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.in.errors[ifInErrors.{#SNMPINDEX}],5m)<{$IF.ERRORS.WARN:"{#IFNAME}"}*0.8 and max(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.out.errors[ifOutErrors.{#SNMPINDEX}],5m)<{$IF.ERRORS.WARN:"{#IFNAME}"}*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>This trigger expression works as follows: 1. It can be triggered if the operations status is down. 2. `{$IFCONTROL:"{#IFNAME}"}=1` - a user can redefine context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. `{TEMPLATE_NAME:METRIC.diff()}=1` - the trigger fires only if the operational status was up to (1) sometime before (so, do not fire for the 'eternal off' interfaces.) WARNING: if closed manually - it will not fire again on the next poll, because of .diff.</p>|<p>**Expression**: {$IFCONTROL:"{#IFNAME}"}=1 and last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.status[ifOperStatus.{#SNMPINDEX}])=2 and (last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.status[ifOperStatus.{#SNMPINDEX}],#1)<>last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.status[ifOperStatus.{#SNMPINDEX}],#2))</p><p>**Recovery expression**: last(/ADAPTERA - Aruba Instant AP Controller by SNMP/net.if.status[ifOperStatus.{#SNMPINDEX}])<>2 or {$IFCONTROL:"{#IFNAME}"}=0</p>|average|


