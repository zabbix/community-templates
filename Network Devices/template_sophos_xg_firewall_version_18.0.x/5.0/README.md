# Sophos XG FW 18 SNMPv2

## Description

Template for SOPHOS XG (Version 18) series Firewall. (Tested on XG260 with Zabbix 5.0) Used MIB: SFOS-FIREWALL-MIB

## Overview

 SNMPv2 template for XG series (Version 18) Sophos Firewall


  
64 static items and 37 triggers + discovered interface items and triggers  
  
It using (linked) default zabbix templates:


 Template Module Generic SNMP  
 Template Module Interfaces SNMP  
 Template Module HOST-RESOURCES-MIB CPU SNMP  
  
  
Necessary MIB:


 SOPHOS-XG-MIB18.txt - you have to upload it on monitoring endpoint server or proxy (for CentOS /usr/share/snmp/mib)  
 https://docs.sophos.com/nsg/sophos-firewall/MIB/SOPHOS-XG-MIB.zip  
  
Mandatory default macros:  
  
 {$SNMP\_COMMUNITY}  
  
Optional macroses that can be overloaded per device:  
  
 {$CPU.UTIL.CRIT}  
 {$DISK\_UTIL\_MAX}  
 {$MEMORY\_UTIL\_MAX}  
 {$SWAP\_UTIL\_MAX}  
  
Tested on XG106 (FW 18.0.2 MR-2) with zabbix 5.0.x (Probably can be ported to 4.0 and lower)



## Author

R.P.Wimmer

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU_UTIL_MAX}|<p>-</p>|`95`|Text macro|
|{$DISK_UTIL_MAX}|<p>-</p>|`90`|Text macro|
|{$MEMORY_UTIL_MAX}|<p>-</p>|`90`|Text macro|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|
|{$SWAP_UTIL_MAX}|<p>-</p>|`90`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|
|Template Module Interfaces SNMP|
|Template Module Generic SNMP|
|Template Module HOST-RESOURCES-MIB CPU SNMP|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces discovery|<p>Discovering interfaces from IF-MIB.</p>|`SNMP agent`|net.if.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory utilization|<p>-</p>|`SNMP agent`|memoryPercentUsage<p>Update: 1m</p>|
|IDS version|<p>Version of Intrusion Detection and Prevention (IDP)</p>|`SNMP agent`|ipsVersion<p>Update: 1h</p>|
|Device type|<p>-</p>|`SNMP agent`|applianceType<p>Update: 1h</p>|
|Firmware version|<p>Version of Intrusion Detection and Prevention (IDP)</p>|`SNMP agent`|firewallVersion<p>Update: 1h</p>|
|POP3 Hits|<p>-</p>|`SNMP agent`|pop3Hits<p>Update: 3m</p>|
|Service tomcat status|<p>-</p>|`SNMP agent`|tomcatService<p>Update: 5m</p>|
|Sandstrom license reg status|<p>Sandstrom Protection Iicense status.</p>|`SNMP agent`|sandstromLicRegStatus<p>Update: 1h</p>|
|Live user count|<p>-</p>|`SNMP agent`|liveUserCount<p>Update: 3m</p>|
|Service network status|<p>-</p>|`SNMP agent`|networkService<p>Update: 5m</p>|
|WebServer Protection license expire date|<p>WebServer Protection Iicense Expiry Date.</p>|`SNMP agent`|webServerProtectionLicExpiryDate<p>Update: 1h</p>|
|Service POP3 status|<p>-</p>|`SNMP agent`|pop3Service<p>Update: 5m</p>|
|IMAP Hits|<p>-</p>|`SNMP agent`|imapHits<p>Update: 3m</p>|
|Service IMAP4 status|<p>-</p>|`SNMP agent`|imap4Service<p>Update: 5m</p>|
|Service database status|<p>-</p>|`SNMP agent`|databaseService<p>Update: 5m</p>|
|Sandstrom license expire date|<p>Sandstrom Protection Iicense Expiry Date.</p>|`SNMP agent`|sandstromLicExpiryDate<p>Update: 1h</p>|
|Device name|<p>-</p>|`SNMP agent`|applianceName<p>Update: 1h</p>|
|Service HTTP status|<p>-</p>|`SNMP agent`|httpService<p>Update: 5m</p>|
|Device serial number|<p>-</p>|`SNMP agent`|applianceKey<p>Update: 1h</p>|
|Swap capacity|<p>-</p>|`SNMP agent`|swapCapacity<p>Update: 1h</p>|
|Disk utilization|<p>-</p>|`SNMP agent`|diskPercentUsage<p>Update: 5m</p>|
|Service sshd status|<p>-</p>|`SNMP agent`|sshdService<p>Update: 5m</p>|
|Webcat version|<p>Version of Webcat</p>|`SNMP agent`|webcatVersion<p>Update: 1h</p>|
|Web Protection license reg status|<p>Web Protection registration license status.</p>|`SNMP agent`|webProtectionLicRegStatus<p>Update: 1h</p>|
|Service Dgd status|<p>-</p>|`SNMP agent`|dgdService<p>Update: 5m</p>|
|Swap utilization|<p>-</p>|`SNMP agent`|swapPercentUsage<p>Update: 5m</p>|
|Service SMTP status|<p>-</p>|`SNMP agent`|smtpService<p>Update: 5m</p>|
|HTTP Hits|<p>-</p>|`SNMP agent`|httpHits<p>Update: 3m</p>|
|HA current status|<p>Textual Convention: HaStatus Values: notapplicable( 0 ), auxiliary( 1 ), standAlone( 2 ), primary( 3 ), faulty( 4 ), ready ( 5 )</p>|`SNMP agent`|currentHAStatus<p>Update: 5m</p>|
|HA mode|<p>Textual Convention: HaStatusType Values: disabled(0), enabled(1)</p>|`SNMP agent`|haMode<p>Update: 5m</p>|
|Service IP-Sec VPN status|<p>-</p>|`SNMP agent`|ipSecVpnService<p>Update: 5m</p>|
|Service NTP status|<p>-</p>|`SNMP agent`|ntpService<p>Update: 5m</p>|
|Network Protection reg license status|<p>Network Protection registration license status</p>|`SNMP agent`|netProtectionLicRegStatus<p>Update: 1h</p>|
|Network Protection license expire date|<p>Network Protection Iicense Expiry Date.</p>|`SNMP agent`|netProtectionLicExpiryDate<p>Update: 1h</p>|
|WebServer Protection license reg status|<p>WebServer Protection license status.</p>|`SNMP agent`|webServerProtectionLicRegStatus<p>Update: 1h</p>|
|Service IPS status|<p>-</p>|`SNMP agent`|ipsService<p>Update: 5m</p>|
|Memory capacity|<p>-</p>|`SNMP agent`|memoryCapacity<p>Update: 1h</p>|
|Base license reg status|<p>Base Firewall protection license status.</p>|`SNMP agent`|baseFWLicRegStatus<p>Update: 1h</p>|
|Service garner status|<p>-</p>|`SNMP agent`|garnerService<p>Update: 5m</p>|
|Service FTP status|<p>-</p>|`SNMP agent`|ftpService<p>Update: 5m</p>|
|Service AS status|<p>-</p>|`SNMP agent`|asService<p>Update: 5m</p>|
|Service AV status|<p>-</p>|`SNMP agent`|avService<p>Update: 5m</p>|
|Service drouting status|<p>-</p>|`SNMP agent`|droutingService<p>Update: 5m</p>|
|Mail Protection license reg status|<p>EMail Protection license status.</p>|`SNMP agent`|mailProtectionLicRegStatus<p>Update: 1h</p>|
|Service dns status|<p>-</p>|`SNMP agent`|dnsService<p>Update: 5m</p>|
|SMTP Hits|<p>-</p>|`SNMP agent`|smtpHits<p>Update: 3m</p>|
|Service SSL-VPN status|<p>-</p>|`SNMP agent`|sslvpnService<p>Update: 5m</p>|
|Disk capacity|<p>-</p>|`SNMP agent`|diskCapacity<p>Update: 1h</p>|
|Service HA status|<p>-</p>|`SNMP agent`|haService<p>Update: 5m</p>|
|Base license expire date|<p>Base Firewall protection license expiry date.</p>|`SNMP agent`|baseFWLicExpiryDate<p>Update: 1h</p>|
|Web Protection license expire date|<p>Web Protection license expiry date.</p>|`SNMP agent`|webProtectionLicExpiryDate<p>Update: 1h</p>|
|Mail Protection license expire date|<p>EMail Protection Iicense Expiry Date.</p>|`SNMP agent`|mailProtectionLicExpiryDate<p>Update: 1h</p>|
|Service apache status|<p>-</p>|`SNMP agent`|apacheService<p>Update: 5m</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|<p>MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>MIB: IF-MIB The total number of octets received on the interface, including framing characters. This object is a 64-bit version of ifInOctets. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|<p>MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. This object is a 64-bit version of ifOutOctets.Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>MIB: IF-MIB An estimate of the interface's current bandwidth in units of 1,000,000 bits per second. If this object reports a value of `n' then the speed of the interface is somewhere in the range of `n-500,000' to`n+499,999'. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|<p>MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned NumbersAuthority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% )|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({Sophos XG FW 18 SNMPv2:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {Sophos XG FW 18 SNMPv2:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Sophos XG FW 18 SNMPv2:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {Sophos XG FW 18 SNMPv2:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Sophos XG FW 18 SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {Sophos XG FW 18 SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {Sophos XG FW 18 SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {Sophos XG FW 18 SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {Sophos XG FW 18 SNMPv2:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Sophos XG FW 18 SNMPv2:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% ) (LLD)|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({Sophos XG FW 18 SNMPv2:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {Sophos XG FW 18 SNMPv2:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Sophos XG FW 18 SNMPv2:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {Sophos XG FW 18 SNMPv2:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Sophos XG FW 18 SNMPv2:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m) (LLD)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Sophos XG FW 18 SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {Sophos XG FW 18 SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {Sophos XG FW 18 SNMPv2:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {Sophos XG FW 18 SNMPv2:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
