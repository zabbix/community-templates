# LANTRONIX-UDS1100

## Description

Simple LANTRONIX-UDS1100 template by Federico Coppola

## Overview

It is a very simple template to monitor Lantronix UDS1100 device.


Using this template you can monitor:


* Ethernet port status
* Input/output bytes
* Operational mode
* Admin console and web console service


This template create graphs about this checks.


I have created and tested it using Zabbix 4.0.5



## Author

Federico Coppola

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Ethernet Input Bytes|<p>Counter input bytes (received bytes)</p>|`SNMP agent`|eth.input.bytes<p>Update: 60s</p>|
|Ethernet Output Bytes|<p>Counter output bytes (transmitted bytes)</p>|`SNMP agent`|eth.output.bytes<p>Update: 60s</p>|
|TELNET Check TCP 9999|<p>Check admin console Telnet TCP-9999</p>|`Simple check`|net.tcp.service[tcp,,9999]<p>Update: 60s</p>|
|Operational Mode|<p>Operational modality Value: forwarding (1), --> acting as a router Value: notForwarding(2) --> NOT acting as a router Usually value for Lantronix is 2</p>|`SNMP agent`|operational.mode<p>Update: 30s</p>|
|Ethernet Operational Status|<p>Operational Interface Status Value = 1 (UP) Value = 0 (DOWN)</p>|`SNMP agent`|eth.operational.status<p>Update: 30s</p>|
|SNMP Check UDP 161|<p>-</p>|`Simple check`|net.udp.service[ntp,,161]<p>Update: 30s</p>|
|Ethernet Interface Status|<p>Ethernet Interface status Value = 1 (UP) Value = 0 (DOWN)</p>|`SNMP agent`|eth.int.status<p>Update: 30s</p>|
|HTTP Check TCP 80|<p>HTTP Web Server Check</p>|`Simple check`|net.tcp.service[http]<p>Update: 60s</p>|


## Triggers

There are no triggers in this template.

