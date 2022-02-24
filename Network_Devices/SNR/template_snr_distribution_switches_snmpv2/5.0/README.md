# SNR Broadcast-Multicast-Unicast

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Broadcast/Multicast/Unicast  - Statistic on interfaces|<p>-</p>|`SNMP agent`|ifInterbmu<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Inbound broadcast packets on interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifHCInBroadcastPkts.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Inbound multicast packets on interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifHCInMulticastPkts.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Inbound unicast packets on interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifHCInUcastPkts.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Outbound broadcast packets on interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifHCOutBroadcastPkts.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Outbound multicast packets on interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifHCOutMulticastPkts.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Outbound unicast packets on interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifHCOutUcastPkts.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

# SNR CPU Usage

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU - Usage|<p>-</p>|`SNMP agent`|sys.cpuusage<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

# SNR DDM Statistic

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DDM - Statistic RX/TX Power|<p>-</p>|`SNMP agent`|ddmstat.sys<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DDM - Statistic RX Port:{#SNMPINDEX}|<p>-</p>|`SNMP agent`|ddmstatrx[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|DDM - Statistic TX Port:{#SNMPINDEX}|<p>-</p>|`SNMP agent`|ddmstattx[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

# SNR Error and Discared Packets

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$IF_ERRORS_WARN}|<p>-</p>|`2`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces Error and Discard Discovery|<p>-</p>|`SNMP agent`|error.if.discovery<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|<p>-</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|<p>-</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|<p>-</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|<p>-</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): High error rate|<p>-</p>|<p>**Expression**: {SNR Error and Discared Packets:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}>2 or {SNR Error and Discared Packets:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}>2</p><p>**Recovery expression**: {SNR Error and Discared Packets:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}<2*0.8 and {SNR Error and Discared Packets:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate (LLD)|<p>-</p>|<p>**Expression**: {SNR Error and Discared Packets:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}>2 or {SNR Error and Discared Packets:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}>2</p><p>**Recovery expression**: {SNR Error and Discared Packets:net.if.in.errors[ifInErrors.{#SNMPINDEX}].avg(5m)}<2*0.8 and {SNR Error and Discared Packets:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].avg(5m)}<2*0.8</p>|warning|


# SNR Interfaces Statistic

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$IFCONTROL}|<p>-</p>|`1`|Text macro|
|{$IF_UTIL_MAX}|<p>-</p>|`90`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces Statistic Discovery|<p>-</p>|`SNMP agent`|net.if.discovery<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>-</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>-</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>-</p>|`SNMP agent`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>-</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|<p>-</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>-</p>|<p>**Expression**: {SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:"{#IFNAME}"}%|<p>-</p>|<p>**Expression**: ({SNR Interfaces Statistic:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {SNR Interfaces Statistic:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {SNR Interfaces Statistic:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {SNR Interfaces Statistic:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>-</p>|<p>**Expression**: 1=1 and ({SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|average|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>-</p>|<p>**Expression**: {SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {SNR Interfaces Statistic:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:"{#IFNAME}"}% (LLD)|<p>-</p>|<p>**Expression**: ({SNR Interfaces Statistic:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {SNR Interfaces Statistic:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {SNR Interfaces Statistic:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {SNR Interfaces Statistic:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{SNR Interfaces Statistic:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>-</p>|<p>**Expression**: 1=1 and ({SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {SNR Interfaces Statistic:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2</p>|average|


# SNR Memory Information

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory - Busy|<p>-</p>|`SNMP agent`|sys.memorybusy<p>Update: 30</p>|
|Memory - Size|<p>-</p>|`SNMP agent`|sys.memoryusage<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

# SNR POE Power

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|POE - Power on Ports|<p>-</p>|`SNMP agent`|poe.ports<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|POE - General Power|<p>-</p>|`SNMP agent`|poepower.general<p>Update: 30</p>|
|POE - Power Current on Port:{#SNMPINDEX}|<p>-</p>|`SNMP agent`|poepower.current[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|POE - Max Power on Port:{#SNMPINDEX}|<p>-</p>|`SNMP agent`|poepowermax.onport[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

# SNR Switch Temperature

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Overview

 Official Zabbix templates for SNR switches.
Recommended for distribution switches.
 
If you have any questions, please contact support@nag.ru.

## Author

SNR-TEAM

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Switch - Temperature System|<p>-</p>|`SNMP agent`|sys.temperature<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

