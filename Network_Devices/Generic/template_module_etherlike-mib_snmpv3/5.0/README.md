# Module EtherLike-MIB SNMPv3

## Description

Template Module EtherLike-MIB SNMPv3 Template used Template Module EtherLike-MIB SNMPv2 Ville Leinonen https://www.hacknetwork.org Version 1.1

## Overview

UPDATED: There was a bug in version 1.0


 


Linked for Template Net HP and Aruba Enterprise Switch SNMPv3, but works also individually.


SNMPv3 support added, new macros:


{$SECURITY\_NAME} = Username


{$AUTH\_PASSPHRASE} = Authentication password


{$PRIV\_PASSPHRASE} = Encryption password


 


Template is just like V2 templates, but changed to support SNMPv3, please use SHA and AES128.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|EtherLike-MIB Discovery|<p>Discovering interfaces from IF-MIB and EtherLike-MIB. Interfaces with up(1) Operational Status are discovered.</p>|`SNMP agent`|net.if.duplex.discoveryV3<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interface {#IFNAME}({#IFALIAS}): Duplex status|<p>MIB: EtherLike-MIB The current mode of operation of the MAC entity. 'unknown' indicates that the current duplex mode could not be determined. Management control of the duplex mode is accomplished through the MAU MIB. When an interface does not support autonegotiation, or when autonegotiation is not enabled, the duplex mode is controlled using ifMauDefaultType. When autonegotiation is supported and enabled, duplex mode is controlled using ifMauAutoNegAdvertisedBits. In either case, the currently operating duplex mode is reflected both in this object and in ifMauType. Note that this object provides redundant information with ifMauType. Normally, redundant objects are discouraged. However, in this instance, it allows a management application to determine the duplex status of an interface without having to know every possible value of ifMauType. This was felt to be sufficiently valuable to justify the redundancy. Reference: [IEEE 802.3 Std.], 30.3.1.1.32,aDuplexStatus.</p>|`SNMP agent`|net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode|<p>Please check autonegotiation settings and cabling</p>|<p>**Expression**: {Module EtherLike-MIB SNMPv3:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode (LLD)|<p>Please check autonegotiation settings and cabling</p>|<p>**Expression**: {Module EtherLike-MIB SNMPv3:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
