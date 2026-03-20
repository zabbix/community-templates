# Net RAD AirMux 400 SNMPv1

## Overview

Airmux-400 is a carrier-class, cost-effective multiple point-to-point broadband wireless transmission device. It combines legacy TDM and Ethernet services for transmission over 2.3 to 2.5 GHz, 3.5 licensed and 4.8 to 5.9 GHz bands, and is suitable for deployment in FCC, IC and ETSI-regulated countries



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`netman`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Port Bits received|<p>-</p>|`SNMP agent`|net.if.InOctets<p>Update: 60</p>|
|Device uptime|<p>-</p>|`SNMP agent`|system.uptime<p>Update: 60</p>|
|Defined Frequency|<p>-</p>|`SNMP agent`|frequency.def<p>Update: 1d</p>|
|Port Speed|<p>-</p>|`SNMP agent`|net.if.speed<p>Update: 60</p>|
|Device location|<p>-</p>|`SNMP agent`|system.location<p>Update: 86400</p>|
|Port Inbound packets with errors|<p>-</p>|`SNMP agent`|net.if.in.errors<p>Update: 60</p>|
|Port Outbound packets with errors|<p>-</p>|`SNMP agent`|net.if.out.errors<p>Update: 60</p>|
|Port Inbound packets discarded|<p>-</p>|`SNMP agent`|net.if.in.discards<p>Update: 60</p>|
|Transmit Power|<p>-</p>|`SNMP agent`|frequency.power<p>Update: 1d</p>|
|Port Device MAC|<p>-</p>|`SNMP agent`|net.mac<p>Update: 1d</p>|
|Channel bandwidth|<p>-</p>|`SNMP agent`|frequency.bandwidth<p>Update: 1d</p>|
|Device enterprises|<p>-</p>|`SNMP agent`|system.enterprises<p>Update: 86400</p>|
|Received RSSI|<p>-</p>|`SNMP agent`|frequency.rssi<p>Update: 60</p>|
|Serial number|<p>-</p>|`SNMP agent`|system.hw.serial<p>Update: 1d</p>|
|Port Odu Operational status|<p>-</p>|`SNMP agent`|net.if.status<p>Update: 60</p>|
|Device remove unit|<p>-</p>|`SNMP agent`|system.remove<p>Update: 1d</p>|
|Device name|<p>-</p>|`SNMP agent`|system.name<p>Update: 86400</p>|
|Port Outbound packets discarded|<p>-</p>|`SNMP agent`|net.if.out.discards<p>Update: 60</p>|
|Device contact details|<p>-</p>|`SNMP agent`|system.contact<p>Update: 86400</p>|
|Radio Bad Frames|<p>-</p>|`SNMP agent`|radio.bad.frames<p>Update: 60</p>|
|Port Bits sent|<p>-</p>|`SNMP agent`|net.if.OutOctets<p>Update: 60</p>|
|Device description|<p>-</p>|`SNMP agent`|system.descr<p>Update: 86400</p>|
|ESSID|<p>SELUCREH - not used</p>|`SNMP agent`|frequency.essid<p>Update: 1d</p>|
|Radio Device MAC|<p>-</p>|`SNMP agent`|radio.mac<p>Update: 1d</p>|
|Radio Total Frames|<p>-</p>|`SNMP agent`|radio.frames<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

