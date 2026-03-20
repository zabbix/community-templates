# Net BreezeNet SNMPv1

## Overview

The unofficial template for Alvarion BreezeNET (testing B10, B14, B28) is a comprehensive and highly-proficient portfolio of wireless point-to-point bridging solutions for license-exempt frequency bands. It offers long range and high-capacity support for high bandwidth applications.


The template is for us and is still used. All parameters are requirements for the operation of our network and may not suit you



## Author

Asert

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`private`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Hardware model|<p>-</p>|`SNMP agent`|system.hw.model<p>Update: 1d</p>|
|ESSID|<p>-</p>|`SNMP agent`|system.essid<p>Update: 1d</p>|
|Radio :Inbound packets with errors (CRC)|<p>-</p>|`SNMP agent`|ifInErrors.1<p>Update: 60</p>|
|Device MAC|<p>-</p>|`SNMP agent`|system.mac<p>Update: 1d</p>|
|Modulation Level|<p>-</p>|`SNMP agent`|modulation.level<p>Update: 60s</p>|
|Device location|<p>-</p>|`SNMP agent`|system.location<p>Update: 1d</p>|
|FastEthernet  :Bits received|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 180</p>|
|Received RSSI BU|<p>-</p>|`SNMP agent`|received.rssi.bu<p>Update: 60s</p>|
|FastEtherenet   :Inbound packets discarded|<p>-</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.2]<p>Update: 300</p>|
|FastEtehernet  :Inbound packets with errors|<p>-</p>|`SNMP agent`|ifInErrors.2<p>Update: 300</p>|
|FastEthernet :Outbound packets with errors|<p>-</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.2]<p>Update: 300</p>|
|FastEthernet : Operational status|<p>-</p>|`SNMP agent`|net.if.status[ifOperStatus.2]<p>Update: 180</p>|
|FastEthernet  : Speed|<p>-</p>|`SNMP agent`|net.if.speed[ifHighSpeed.2]<p>Update: 300</p>|
|Received RSSI|<p>-</p>|`SNMP agent`|received.rssi<p>Update: 60s</p>|
|FastEthernet :Bits sent|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 180</p>|
|Received SNR BU|<p>-</p>|`SNMP agent`|bu.received.snr<p>Update: 60</p>|
|SNMP availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 180</p>|
|Device uptime|<p>-</p>|`SNMP agent`|system.uptime<p>Update: 6h</p>|
|Device name|<p>-</p>|`SNMP agent`|system.name<p>Update: 1d</p>|
|Serial number|<p>-</p>|`SNMP agent`|system.hw.serial<p>Update: 1d</p>|
|Sub Band Select|<p>-</p>|`SNMP agent`|sub.band<p>Update: 1d</p>|
|Received SNR|<p>-</p>|`SNMP agent`|received.snr<p>Update: 60s</p>|
|Access vlan|<p>-</p>|`SNMP agent`|access.vlan<p>Update: 1d</p>|
|Transmit Power|<p>-</p>|`SNMP agent`|transmit.power<p>Update: 1d</p>|
|Defined Frequency|<p>-</p>|`SNMP agent`|freq.def<p>Update: 1d</p>|
|FastEtehernet : Outbound packets discarded|<p>-</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.2]<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

