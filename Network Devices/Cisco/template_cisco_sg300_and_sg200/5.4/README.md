# Cisco_SG300-52-d

## Description

by padamiak, 2019.05.28, zabbix v4.0, tested on sg300 and sg200

## Overview

Hi,


 


Here is a result of my work on Cisco SG300 witch Zabbix 4.0.


- based on SNMP and LLD,


- it's working with vary numbers of interfaces,


- interface is discovered only if it's operational up (less unnecessary data),


- it also monitors CPU usage, status of temperature and fan's (if any),


- tested witch SG300 and SG200 switches,


- in case of SG200 you may consider updating firmware of your switch as older versions doesn't support SNMP


 


Have fun



## Author

deb

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Net vlan Discovery|<p>-</p>|`SNMP agent`|net.vlan.discovery<p>Update: 89m</p>|
|Fan Discovery|<p>-</p>|`SNMP agent`|fan.discovery<p>Update: 1d</p>|
|Net If Discovery|<p>-</p>|`SNMP agent`|net.if.disco<p>Update: 88m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|snmp uptime|<p>-</p>|`SNMP agent`|system.uptime<p>Update: 120</p>|
|Device contact details|<p>-</p>|`SNMP agent`|system.contact<p>Update: 1h</p>|
|Device name|<p>-</p>|`SNMP agent`|system.name<p>Update: 1h</p>|
|Device description|<p>-</p>|`SNMP agent`|system.descr<p>Update: 1h</p>|
|temperature status|<p>rlPhdUnitEnvParamMonitorTemperatureStatus 1.3.6.1.4.1.9.6.1.101.53.15.1.13 Display environment monitoring chassis temperature status ok(1), overTemperatureThreshold(2), overCriticalTemperatureThreshold(3)</p>|`SNMP agent`|system.temp.status<p>Update: 180</p>|
|CPU utilization|<p>CPU utilization for 5 seconds 1.3.6.1.4.1.9.6.1.101.1.7.0 CPU utilization for 1 minutes 1.3.6.1.4.1.9.6.1.101.1.8.0 CPU utilization for 5 minutes 1.3.6.1.4.1.9.6.1.101.1.9.0</p>|`SNMP agent`|system.cpu.util<p>Update: 60</p>|
|Device location|<p>-</p>|`SNMP agent`|system.location<p>Update: 1h</p>|
|vlan {#IFNAME} {#IFXENTRY}: RX bps|<p>-</p>|`SNMP agent`|net.vlan[ifInBits.{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: RX broadcast|<p>-</p>|`SNMP agent`|net.vlan[ifInBroadcastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: RX errors|<p>-</p>|`SNMP agent`|net.vlan[ifInErrors.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: RX multicast|<p>-</p>|`SNMP agent`|net.vlan[ifInMulticastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: RX unicast|<p>-</p>|`SNMP agent`|net.vlan[ifInUcastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: TX bps|<p>-</p>|`SNMP agent`|net.vlan[ifOutBits.{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: TX broadcast|<p>-</p>|`SNMP agent`|net.vlan[ifOutBroadcastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: TX errors|<p>-</p>|`SNMP agent`|net.vlan[ifOutErrors.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: TX multicast|<p>-</p>|`SNMP agent`|net.vlan[ifOutMulticastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: TX unicast|<p>-</p>|`SNMP agent`|net.vlan[ifOutUcastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|vlan {#IFNAME} {#IFXENTRY}: If Type|<p>-</p>|`SNMP agent`|net.vlan[ifType.{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|fan status {#SNMPINDEX}|<p>normal(1), warning(2), critical(3), shutdown(4), notPresent(5), notFunctioning(6)</p>|`SNMP agent`|system.fan[status.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: Duplex|<p>-</p>|`SNMP agent`|net.if[dot3StatsDuplexStatus.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: RX bps|<p>-</p>|`SNMP agent`|net.if[ifInBits.{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: RX broadcast|<p>-</p>|`SNMP agent`|net.if[ifInBroadcastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: RX errors|<p>-</p>|`SNMP agent`|net.if[ifInErrors.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: RX multicast|<p>-</p>|`SNMP agent`|net.if[ifInMulticastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: RX unicast|<p>-</p>|`SNMP agent`|net.if[ifInUcastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: TX bps|<p>-</p>|`SNMP agent`|net.if[ifOutBits.{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: TX broadcast|<p>-</p>|`SNMP agent`|net.if[ifOutBroadcastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: TX errors|<p>-</p>|`SNMP agent`|net.if[ifOutErrors.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: TX multicast|<p>-</p>|`SNMP agent`|net.if[ifOutMulticastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: TX unicast|<p>-</p>|`SNMP agent`|net.if[ifOutUcastPkts.{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: speed|<p>-</p>|`SNMP agent`|net.if[ifSpeed.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|{#IFNAME} {#IFXENTRY}: If Type|<p>-</p>|`SNMP agent`|net.if[ifType.{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|fan status problem|<p>-</p>|<p>**Expression**: last(/Cisco_SG300-52-d/system.fan[status.{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|warning|
|{#IFNAME} {#IFXENTRY}: high input utilization|<p>-</p>|<p>**Expression**: avg(/Cisco_SG300-52-d/net.if[ifInBits.{#SNMPINDEX}],5m)/last(/Cisco_SG300-52-d/net.if[ifSpeed.{#SNMPINDEX}])>0.9</p><p>**Recovery expression**: </p>|warning|
|{#IFNAME} {#IFXENTRY}: high output utilization|<p>-</p>|<p>**Expression**: avg(/Cisco_SG300-52-d/net.if[ifOutBits.{#SNMPINDEX}],5m)/last(/Cisco_SG300-52-d/net.if[ifSpeed.{#SNMPINDEX}])>0.9</p><p>**Recovery expression**: </p>|warning|
|{#IFNAME} {#IFXENTRY}: In half-duplex mode|<p>Last value: {ITEM.LASTVALUE1}. Please check autonegotiation settings and cabling</p>|<p>**Expression**: last(/Cisco_SG300-52-d/net.if[dot3StatsDuplexStatus.{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|information|
|{#IFNAME} {#IFXENTRY}: RX errors|<p>There have been input errors in the last 20 minutes.</p>|<p>**Expression**: max(/Cisco_SG300-52-d/net.if[ifInErrors.{#SNMPINDEX}],20m)>0</p><p>**Recovery expression**: </p>|warning|
|{#IFNAME} {#IFXENTRY}: TX errors|<p>There have been outpup errors in the last 20 minutes.</p>|<p>**Expression**: max(/Cisco_SG300-52-d/net.if[ifOutErrors.{#SNMPINDEX}],20m)>0</p><p>**Recovery expression**: </p>|warning|
|vlan {#IFNAME} {#IFXENTRY}: RX errors|<p>There have been input errors in the last 20 minutes.</p>|<p>**Expression**: max(/Cisco_SG300-52-d/net.vlan[ifInErrors.{#SNMPINDEX}],20m)>0</p><p>**Recovery expression**: </p>|warning|
|vlan {#IFNAME} {#IFXENTRY}: TX errors|<p>There have been output errors in the last 20 minutes.</p>|<p>**Expression**: max(/Cisco_SG300-52-d/net.vlan[ifOutErrors.{#SNMPINDEX}],20m)>0</p><p>**Recovery expression**: </p>|warning|
|vlan {#IFNAME} {#IFXENTRY}: RX errors (LLD)|<p>There have been input errors in the last 20 minutes.</p>|<p>**Expression**: max(/Cisco_SG300-52-d/net.vlan[ifInErrors.{#SNMPINDEX}],20m)>0</p><p>**Recovery expression**: </p>|warning|
|vlan {#IFNAME} {#IFXENTRY}: TX errors (LLD)|<p>There have been output errors in the last 20 minutes.</p>|<p>**Expression**: max(/Cisco_SG300-52-d/net.vlan[ifOutErrors.{#SNMPINDEX}],20m)>0</p><p>**Recovery expression**: </p>|warning|
|fan status problem (LLD)|<p>-</p>|<p>**Expression**: last(/Cisco_SG300-52-d/system.fan[status.{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|warning|
|{#IFNAME} {#IFXENTRY}: high input utilization (LLD)|<p>-</p>|<p>**Expression**: avg(/Cisco_SG300-52-d/net.if[ifInBits.{#SNMPINDEX}],5m)/last(/Cisco_SG300-52-d/net.if[ifSpeed.{#SNMPINDEX}])>0.9</p><p>**Recovery expression**: </p>|warning|
|{#IFNAME} {#IFXENTRY}: high output utilization (LLD)|<p>-</p>|<p>**Expression**: avg(/Cisco_SG300-52-d/net.if[ifOutBits.{#SNMPINDEX}],5m)/last(/Cisco_SG300-52-d/net.if[ifSpeed.{#SNMPINDEX}])>0.9</p><p>**Recovery expression**: </p>|warning|
|{#IFNAME} {#IFXENTRY}: In half-duplex mode (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check autonegotiation settings and cabling</p>|<p>**Expression**: last(/Cisco_SG300-52-d/net.if[dot3StatsDuplexStatus.{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|information|
|{#IFNAME} {#IFXENTRY}: RX errors (LLD)|<p>There have been input errors in the last 20 minutes.</p>|<p>**Expression**: max(/Cisco_SG300-52-d/net.if[ifInErrors.{#SNMPINDEX}],20m)>0</p><p>**Recovery expression**: </p>|warning|
|{#IFNAME} {#IFXENTRY}: TX errors (LLD)|<p>There have been outpup errors in the last 20 minutes.</p>|<p>**Expression**: max(/Cisco_SG300-52-d/net.if[ifOutErrors.{#SNMPINDEX}],20m)>0</p><p>**Recovery expression**: </p>|warning|
