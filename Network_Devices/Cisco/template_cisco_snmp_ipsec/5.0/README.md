# SNMP Cisco IPSec

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IPSec Phase1  Tunnel discovery|<p>-</p>|`SNMP agent`|cikeTunIndex<p>Update: 60</p>|
|IPSec Phase2 Tunnel discovery|<p>The IP address of the remote endpoint for the IPsec Phase-2 Tunnel.</p>|`SNMP agent`|cipSecTunIndex<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Incoming traffic on active IPSec Phase2 Tunnels|<p>The total number of octets received by all current and previous IPsec Phase-2 Tunnels. This value is accumulated BEFORE determining whether or not the packet should be decompressed. See also cipSecGlobalInOctWraps for the number of times this counter has wrapped.</p>|`SNMP agent`|cipSecGlobalInOctets<p>Update: 60</p>|
|Incoming traffic on active IPSec Phase1 Tunnels|<p>The total number of octets received by all currently and previously active IPsec Phase-1 IKE Tunnels.</p>|`SNMP agent`|cikeGlobalInOctets<p>Update: 60</p>|
|Outgoing traffic on active IPSec Phase2 Tunnels|<p>The total number of octets sent by all current and previous IPsec Phase-2 Tunnels. This value is accumulated AFTER determining whether or not the packet should be compressed. See also cipSecGlobalOutOctWraps for the number of times this counter has wrapped.</p>|`SNMP agent`|cipSecGlobalOutOctets<p>Update: 60</p>|
|Number of currently active IPsec Phase2 Tunnels|<p>The total number of currently active IPsec Phase-2 Tunnels.</p>|`SNMP agent`|cipSecGlobalActiveTunnels<p>Update: 60</p>|
|Outgoing traffic on active IPSec Phase1  Tunnels|<p>The total number of octets sent by all currently and previously active and IPsec Phase-1 IKE Tunnels.</p>|`SNMP agent`|cikeGlobalOutOctets<p>Update: 60</p>|
|Number of currently active IPsec Phase1  Tunnels|<p>The number of currently active IPsec Phase-1 IKE Tunnels.</p>|`SNMP agent`|cikeGlobalActiveTunnels<p>Update: 60</p>|
|Phase1 Peer {#SNMPVALUE} tunnel active time|<p>The length of time the IPsec Phase-1 IKE tunnel has been active in hundredths of seconds.</p>|`SNMP agent`|cikeTunActiveTime[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Phase1 Peer {#SNMPVALUE} inbound traffic|<p>The total number of octets received by this IPsec Phase-1 IKE Tunnel.</p>|`SNMP agent`|cikeTunInOctets[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Phase1 Peer {#SNMPVALUE} local peer identity|<p>The value of the local peer identity. If the local peer type is an IP Address, then this is the IP Address used to identify the local peer. If the local peer type is a host name, then this is the host name used to identify the local peer.</p>|`SNMP agent`|cikeTunLocalValue[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Phase1 Peer {#SNMPVALUE} outbound traffic|<p>The total number of octets sent by this IPsec Phase-1 IKE Tunnel.</p>|`SNMP agent`|cikeTunOutOctets[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Phase1 Peer {#SNMPVALUE} remote peer identity|<p>The value of the remote peer identity. If the remote peer type is an IP Address, then this is the IP Address used to identify the remote peer. If the remote peer type is a host name, then this is the host name used to identify the remote peer.</p>|`SNMP agent`|cikeTunRemoteValue[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Phase2 Peer {#SNMPVALUE} tunnel active time|<p>The length of time the IPsec Phase-2 Tunnel has been active in hundredths of seconds.</p>|`SNMP agent`|cipSecTunActiveTime[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Phase2 Peer {#SNMPVALUE} inbound traffic|<p>The total number of octets received by this IPsec Phase-2 Tunnel. This value is accumulated BEFORE determining whether or not the packet should be decompressed. See also cipSecTunInOctWraps for the number of times this counter has wrapped.</p>|`SNMP agent`|cipSecTunInOctets[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Phase2 Peer {#SNMPVALUE} tunnel local address|<p>The IP address of the local endpoint for the IPsec Phase-2 Tunnel.</p>|`SNMP agent`|cipSecTunLocalAddr[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Phase2 Peer {#SNMPVALUE} outbound traffic|<p>The total number of octets sent by this IPsec Phase-2 Tunnel. This value is accumulated AFTER determining whether or not the packet should be compressed. See also cipSecTunOutOctWraps for the number of times this counter has wrapped.</p>|`SNMP agent`|cipSecTunOutOctets[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Phase2 Peer {#SNMPVALUE} tunnel remoteaddress|<p>The IP address of the remote endpoint for the IPsec Phase-2 Tunnel.</p>|`SNMP agent`|cipSecTunRemoteAddr[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

