# Enhanced SNMP Interface Discovery

## Description

Enhanced SNMP interface discovery 1.0.1 Template made by Twan Kamans. https://www.twan-it.nl This template searches for 4 different categories: - Interfaces that are administratively disabled - Interfaces that are working onder normal condition - Interfaces with priority, such as switch uplink - Virtual interfaces such as tunnel, port channel and vlan interfaces. Revision 0.7 - Added support for virtual interfaces Revision 0.7.1 - Added support for (filtering) stack switch ports - Fixed a bug in which VLAN interfaces with the number 0 in them would still be discovered by the normal LLD rule Revision 0.7.2 - Filtering VLAN's 1002 - 1005 interfaces - Added support for subinterfaces for Junos Revision 0.8 - Completely revisited the filtering of items using Regex due to introduction of Junos devices. You can adjust the regex for physical devices using a macro. Revision 0.9 - Added support for enduser ports. Triggers will not activate if port description contains macro value. Revision 1.0 - Tested template on posible errors. Revision 1.0.1 - Added bandwidth statistics for virtual interfaces. Revision 1.0.2 - Bandwidth triggers now make use of user macro context, making individual port bandwidth limits posible. - The interface changed state severity has been lowered by default. The new default severity for all interfaces is "warning". Exceptions to this are the priority interfaces which are "average".

## Overview

This template is a replacement for the great default SNMP interface template. It uses the default SNMP interface library and OID's, meaning that it's compatible with a lot of devices.


The template has the following features:


* Priority interfaces (assign higher severity triggers to your important interfaces)
* Get notified when a user no-shut’s a port
* Get notified when a port is in the not-connected state
* Get notified when the bandwidth of a port reaches a specific threshold in percentage (port specific using user macro context)
* Get notified when a port changes that (up / down)
* Adjustable LLD timer for working on port configurations which quickly need to be discovered by Zabbix
* Only gather data for items and interfaces that are important: i don’t want to monitor loopback interfaces and the amount of incoming errors on a port-channel (notsupported items)
* Don’t trigger on (switch)ports which have users behind them. I don’t want to know when someone turns their computer off.


Most of these features can be adjusted and enabled / disabled using macro's:


* {$INT\_BANDWIDTH\_WARNING}
* {$INT\_ERRORS\_WARN}
* {$INT\_LLD\_UPDATE\_INTERVAL}
* {$INT\_NAME\_PHYSICAL}
* {$INT\_NO\_TRIGGER\_STRING}
* {$INT\_PRIO\_STRING}
* {$SEARCH\_FOR\_INACTIVE\_PORTS}




| Macro name | Default value | Type | Description |
| {$INT\_BANDWIDTH\_WARNING} | 80 | Percentage | Percentage when trigger fires |
| {$INT\_ERRORS\_WARM} | 2 | #Amount | Max error value for "interface errors trigger" |
| {$INT\_LLD\_UPDATE\_INTERVAL} | 30m | Time | Update interval for LLD rules |
| {$INT\_NAME\_PHYSICAL} | ^[A-Z|a-z]{2}-?[0-9]+\/[0-9]{1,2}(\/[0-9]+)?$ | Regex | Regex that filters the physical interfaces |
| {$INT\_NO\_TRIGGER\_STRING} | ^(EDGEPORT)$ | Regex | Regex for edge ports (computers turning on / off) |
| {$INT\_PRIO\_STRING} | UPLINK | Regex | Description keyword for priority interfaces |
| {$SEARCH\_FOR\_INACTIVE\_PORTS} | 0 | Bolean |  0 = Does not trigger for notconnected ports (1 does) |


With the default values, interface descriptions that start with "UPLINK" will be discovered by the Priority LLD. Interfaces that contain the keyword EDGEPORT will not generate a trigger when turned on / off.


If you miss some interfaces: run a SNMPWALK over the device to check if it matches the {$INT\_NAME\_PHYSICAL} regex!  




## Author

Twan Kamans

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$INT_BANDWIDTH_WARNING}|<p>-</p>|`80`|Text macro|
|{$INT_ERRORS_WARN}|<p>-</p>|`2`|Text macro|
|{$INT_LLD_UPDATE_INTERVAL}|<p>-</p>|`30m`|Text macro|
|{$INT_NAME_PHYSICAL}|<p>-</p>|`^[A-Z|a-z]{2}-?[0-9]+\/[0-9]{1,2}(\/[0-9]+)?$`|Text macro|
|{$INT_NO_TRIGGER_STRING}|<p>-</p>|`^(EDGEPORT)$`|Text macro|
|{$INT_PRIO_STRING}|<p>-</p>|`UPLINK`|Text macro|
|{$SEARCH_FOR_INACTIVE_PORTS}|<p>-</p>|`0`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces Discovery - Priority|<p>-</p>|`SNMP agent`|net.if.prio.discovery<p>Update: {$INT_LLD_UPDATE_INTERVAL}</p>|
|Network Interfaces Discovery - Virtual|<p>-</p>|`SNMP agent`|net.if.virt.discovery<p>Update: {$INT_LLD_UPDATE_INTERVAL}</p>|
|Network Interfaces Discovery - Disabled|<p>-</p>|`SNMP agent`|net.if.down.discovery<p>Update: {$INT_LLD_UPDATE_INTERVAL}</p>|
|Network Interfaces Discovery - Normal|<p>-</p>|`SNMP agent`|net.if.discovery<p>Update: {$INT_LLD_UPDATE_INTERVAL}</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Total amount of interfaces|<p>Shows the total amount of interfaces.</p>|`SNMP agent`|net.if.total<p>Update: 10m</p>|
|Interface {#IFNAME} (priority): Admin status|<p>-</p>|`SNMP agent`|net.if.prio.status[ifAdminStatus.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Interface {#IFNAME} (priority): Alias|<p>-</p>|`SNMP agent`|net.if.prio.status[ifDescription.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Interface {#IFNAME} (priority): Inbound packets discarded|<p>-</p>|`SNMP agent`|net.if.prio.status[ifInDiscards.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME} (priority): Inbound packets with errors|<p>-</p>|`SNMP agent`|net.if.prio.status[ifInErrors.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME} (priority): Bits received|<p>-</p>|`SNMP agent`|net.if.prio.status[ifInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME} (priority): Operational status|<p>-</p>|`SNMP agent`|net.if.prio.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Interface {#IFNAME} (priority): Outbound packets discarded|<p>-</p>|`SNMP agent`|net.if.prio.status[ifOutDiscards.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME} (priority): Outbound packets with errors|<p>-</p>|`SNMP agent`|net.if.prio.status[ifOutErrors.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME} (priority): Bits sent|<p>-</p>|`SNMP agent`|net.if.prio.status[ifOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME} (priority): Speed|<p>-</p>|`SNMP agent`|net.if.prio.status[ifSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}: Admin status|<p>-</p>|`SNMP agent`|net.if.virt.status[ifAdminStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}: Alias|<p>-</p>|`SNMP agent`|net.if.virt.status[ifAlias.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Interface {#IFNAME}: Bits received|<p>-</p>|`SNMP agent`|net.if.virt.status[ifInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}: Operational status|<p>-</p>|`SNMP agent`|net.if.virt.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}: Bits sent|<p>-</p>|`SNMP agent`|net.if.virt.status[ifOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}: Admin status|<p>Shows if interface is administrative disabled.</p>|`SNMP agent`|net.if.down.status[ifAdminStatus.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}: Admin status|<p>-</p>|`SNMP agent`|net.if.status[ifAdminStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}: Alias|<p>-</p>|`SNMP agent`|net.if.status[ifAlias.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Interface {#IFNAME}: Inbound packets discarded|<p>-</p>|`SNMP agent`|net.if.status[ifInDiscards.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}: Inbound packets with errors|<p>-</p>|`SNMP agent`|net.if.status[ifInErrors.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}: Bits received|<p>-</p>|`SNMP agent`|net.if.status[ifInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}: Operational status|<p>-</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}: Outbound packets discarded|<p>-</p>|`SNMP agent`|net.if.status[ifOutDiscards.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}: Outbound packets with errors|<p>-</p>|`SNMP agent`|net.if.status[ifOutErrors.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}: Bits sent|<p>-</p>|`SNMP agent`|net.if.status[ifOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}: Speed|<p>Speed of the interface</p>|`SNMP agent`|net.if.status[ifSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface status has changed on port {#IFNAME}|<p>Triggers when the interface state changes.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.status[ifOperStatus.{#SNMPINDEX}],3600s)<>2 and last(/enhanced_snmp_interface_discovery/net.if.status[ifOperStatus.{#SNMPINDEX}])=2 and find(/enhanced_snmp_interface_discovery/net.if.status[ifAlias.{#SNMPINDEX}],#3,"regexp","^(EDGEPORT)$")=0</p><p>**Recovery expression**: last(/enhanced_snmp_interface_discovery/net.if.status[ifOperStatus.{#SNMPINDEX}],#5)<>2</p>|warning|
|Interface {#IFNAME}: Bandwidth usage over {$INT_BANDWIDTH_WARNING:"{#IFNAME}"}%|<p>Triggers when incoming or outgoing traffic exceeds limit of the INT_BANDWIDTH_WARNING macro.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.status[ifInOctets.{#SNMPINDEX}],10m)>((80/100)*last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}])) or avg(/enhanced_snmp_interface_discovery/net.if.status[ifOutOctets.{#SNMPINDEX}],10m)>((80/100)*last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}])) and last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}])>0</p><p>**Recovery expression**: avg(/enhanced_snmp_interface_discovery/net.if.status[ifInOctets.{#SNMPINDEX}],10m)<(((80-3)/100)*last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}])) or avg(/enhanced_snmp_interface_discovery/net.if.status[ifOutOctets.{#SNMPINDEX}],10m)<(((80-3)/100)*last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}]))</p>|warning|
|Interface {#IFNAME}: High error rate|<p>Triggers when incoming or outgoing errors exceeds limit of the INT_ERRORS_WARN macro.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.status[ifInErrors.{#SNMPINDEX}],5m)>2 or avg(/enhanced_snmp_interface_discovery/net.if.status[ifOutErrors.{#SNMPINDEX}],5m)>2</p><p>**Recovery expression**: </p>|warning|
|Port {#IFNAME} is enabled but not connected!|<p>Zabbix detects a "notconnected" port on {HOST.NAME} Interface {#IFNAME}.</p>|<p>**Expression**: last(/enhanced_snmp_interface_discovery/net.if.status[ifAdminStatus.{#SNMPINDEX}])<>2 and avg(/enhanced_snmp_interface_discovery/net.if.status[ifOperStatus.{#SNMPINDEX}],1w)=2 and 0=1</p><p>**Recovery expression**: </p>|information|
|Port {#IFNAME} has gone UP!|<p>Interface state has changed. This is most likely due to enabeling an interface.</p>|<p>**Expression**: last(/enhanced_snmp_interface_discovery/net.if.down.status[ifAdminStatus.{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|information|
|Interface status has changed on host {HOST.NAME} port {#IFNAME}: {#SNMPVALUE}|<p>-</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOperStatus.{#SNMPINDEX}],3600s)<>2 and last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOperStatus.{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|average|
|Interface {#IFNAME}: Bandwidth usage over {$INT_BANDWIDTH_WARNING:"{#IFNAME}"}%|<p>Triggers when incoming or outgoing traffic exceeds limit of the INT_BANDWIDTH_WARNING macro.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifInOctets.{#SNMPINDEX}],10m)>((80/100)*last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}])) or avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOutOctets.{#SNMPINDEX}],10m)>((80/100)*last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}])) and last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}])>0</p><p>**Recovery expression**: avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifInOctets.{#SNMPINDEX}],10m)<(((80-3)/100)*last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}])) or avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOutOctets.{#SNMPINDEX}],10m)<(((80-3)/100)*last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}]))</p>|warning|
|Interface {#IFNAME}: High error rate|<p>-</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifInErrors.{#SNMPINDEX}],5m)>2 or avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOutErrors.{#SNMPINDEX}],5m)>2</p><p>**Recovery expression**: </p>|warning|
|Interface status has changed on port {#IFNAME}|<p>Triggers when the interface state changes.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.virt.status[ifOperStatus.{#SNMPINDEX}],3600s)<>2 and last(/enhanced_snmp_interface_discovery/net.if.virt.status[ifOperStatus.{#SNMPINDEX}])=2</p><p>**Recovery expression**: last(/enhanced_snmp_interface_discovery/net.if.virt.status[ifOperStatus.{#SNMPINDEX}])<>2</p>|warning|
|Interface status has changed on host {HOST.NAME} port {#IFNAME}: {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOperStatus.{#SNMPINDEX}],3600s)<>2 and last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOperStatus.{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|average|
|Interface {#IFNAME}: Bandwidth usage over {$INT_BANDWIDTH_WARNING:"{#IFNAME}"}% (LLD)|<p>Triggers when incoming or outgoing traffic exceeds limit of the INT_BANDWIDTH_WARNING macro.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifInOctets.{#SNMPINDEX}],10m)>((80/100)*last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}])) or avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOutOctets.{#SNMPINDEX}],10m)>((80/100)*last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}])) and last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}])>0</p><p>**Recovery expression**: avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifInOctets.{#SNMPINDEX}],10m)<(((80-3)/100)*last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}])) or avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOutOctets.{#SNMPINDEX}],10m)<(((80-3)/100)*last(/enhanced_snmp_interface_discovery/net.if.prio.status[ifSpeed.{#SNMPINDEX}]))</p>|warning|
|Interface {#IFNAME}: High error rate (LLD)|<p>-</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifInErrors.{#SNMPINDEX}],5m)>2 or avg(/enhanced_snmp_interface_discovery/net.if.prio.status[ifOutErrors.{#SNMPINDEX}],5m)>2</p><p>**Recovery expression**: </p>|warning|
|Interface status has changed on port {#IFNAME} (LLD)|<p>Triggers when the interface state changes.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.virt.status[ifOperStatus.{#SNMPINDEX}],3600s)<>2 and last(/enhanced_snmp_interface_discovery/net.if.virt.status[ifOperStatus.{#SNMPINDEX}])=2</p><p>**Recovery expression**: last(/enhanced_snmp_interface_discovery/net.if.virt.status[ifOperStatus.{#SNMPINDEX}])<>2</p>|warning|
|Port {#IFNAME} has gone UP! (LLD)|<p>Interface state has changed. This is most likely due to enabeling an interface.</p>|<p>**Expression**: last(/enhanced_snmp_interface_discovery/net.if.down.status[ifAdminStatus.{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|information|
|Interface status has changed on port {#IFNAME} (LLD)|<p>Triggers when the interface state changes.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.status[ifOperStatus.{#SNMPINDEX}],3600s)<>2 and last(/enhanced_snmp_interface_discovery/net.if.status[ifOperStatus.{#SNMPINDEX}])=2 and find(/enhanced_snmp_interface_discovery/net.if.status[ifAlias.{#SNMPINDEX}],#3,"regexp","^(EDGEPORT)$")=0</p><p>**Recovery expression**: last(/enhanced_snmp_interface_discovery/net.if.status[ifOperStatus.{#SNMPINDEX}],#5)<>2</p>|warning|
|Interface {#IFNAME}: Bandwidth usage over {$INT_BANDWIDTH_WARNING:"{#IFNAME}"}% (LLD)|<p>Triggers when incoming or outgoing traffic exceeds limit of the INT_BANDWIDTH_WARNING macro.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.status[ifInOctets.{#SNMPINDEX}],10m)>((80/100)*last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}])) or avg(/enhanced_snmp_interface_discovery/net.if.status[ifOutOctets.{#SNMPINDEX}],10m)>((80/100)*last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}])) and last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}])>0</p><p>**Recovery expression**: avg(/enhanced_snmp_interface_discovery/net.if.status[ifInOctets.{#SNMPINDEX}],10m)<(((80-3)/100)*last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}])) or avg(/enhanced_snmp_interface_discovery/net.if.status[ifOutOctets.{#SNMPINDEX}],10m)<(((80-3)/100)*last(/enhanced_snmp_interface_discovery/net.if.status[ifSpeed.{#SNMPINDEX}]))</p>|warning|
|Interface {#IFNAME}: High error rate (LLD)|<p>Triggers when incoming or outgoing errors exceeds limit of the INT_ERRORS_WARN macro.</p>|<p>**Expression**: avg(/enhanced_snmp_interface_discovery/net.if.status[ifInErrors.{#SNMPINDEX}],5m)>2 or avg(/enhanced_snmp_interface_discovery/net.if.status[ifOutErrors.{#SNMPINDEX}],5m)>2</p><p>**Recovery expression**: </p>|warning|
|Port {#IFNAME} is enabled but not connected! (LLD)|<p>Zabbix detects a "notconnected" port on {HOST.NAME} Interface {#IFNAME}.</p>|<p>**Expression**: last(/enhanced_snmp_interface_discovery/net.if.status[ifAdminStatus.{#SNMPINDEX}])<>2 and avg(/enhanced_snmp_interface_discovery/net.if.status[ifOperStatus.{#SNMPINDEX}],1w)=2 and 0=1</p><p>**Recovery expression**: </p>|information|
