# HP A5120

## Overview

Template for HP A5120 switch with SNMP v3 authPriv.


Included items:


* CPU usage
* Memory usage
* Temperature
* Fan status
* PSU status
* Device name, location, description, contact details
* Interface discovery: bandwidth in/out (64-bit counters), speed, admin/operational status, CRC errors
* Link down trigger: only fires when an interface goes from up to down while admin status is up. Interfaces that are already down or shut down by an administrator are ignored.
* High bandwidth usage trigger: 15-minute average in or out > `{$IF.UTIL.MAX}`% (default 90%) of interface speed.


No links to other templates.


I use SNMP V3 with authPriv security level, SHA authentication protocol, AES privacy protocol.


It is required to fill these variables with correct values using host macros and reference them in the SNMP interface of the host.


* Security name: {$SNMP\_V3\_USER}
* Authentication passphrase: {$SNMP\_V3\_AUTHPASSPHRASE}
* Privacy passphrase: {$SNMP\_V3\_PRIVPASSPHRASE}


 Created on Zabbix 3.0, updated for Zabbix 7.0.

## Tested on

Successfully tested on:

* Device: HP A5120-48G EI
* Zabbix version: 7.0.29

## Interface monitoring

All interface data (ifDescr, ifType, ifAdminStatus, ifOperStatus, ifName, ifHCInOctets, ifHCOutOctets,
ifHighSpeed, ifAlias) is collected by one master item `net.if.walk` (SNMP `walk[]`, bulk request, every 1m).
Discovery and all per-interface items are dependent items of this master item, so the admin status and
the operational status of an interface always come from the same poll.

Interfaces are filtered by ifType with macro `{$NET.IF.IFTYPE.MATCHES}`:

* `6` = ethernetCsmacd (GigabitEthernet, Ten-GigabitEthernet)
* `136` = l3ipvlan (Vlan-interface)
* `161` = ieee8023adLag (Bridge-Aggregation)

Default: `^(6|136|161)$`.

### VLAN interfaces

Interfaces whose ifType matches `{$NET.IF.NO_TRAFFIC.IFTYPE.MATCHES}` (default `^136$` = Vlan-interface)
are monitored for **status only** (admin status, operational status, link down trigger).
An LLD override disables for them:

* items: Bits received, Bits sent, Speed, CRC errors
* triggers: High bandwidth usage, CRC errors
* graph: Network traffic

To also monitor bandwidth on Vlan-interfaces, set `{$NET.IF.NO_TRAFFIC.IFTYPE.MATCHES}` to a value that
matches nothing, for example `^$`.

### Link down

The link down trigger fires only when all of these are true:

* admin status is `up` (1), the port is not shut down by an administrator
* the previous operational status was `up` (1)
* the current operational status is `down` (2)

If an interface is already down when it is discovered or when the template is linked, no alert is raised.
If an administrator shuts the port down (`shutdown`), no alert is raised.
The problem is resolved when the interface is no longer down, or when it is shut down by an administrator.

To disable the link down trigger for one interface, add a host macro with context, for example
`{$IFCONTROL:"GigabitEthernet1/0/24"}` = `0`.

### High bandwidth usage

The trigger fires when the 15-minute average of inbound **or** outbound traffic is above
`{$IF.UTIL.MAX}`% (default `90`) of the interface speed (`ifHighSpeed`).
It is resolved when both directions drop below `{$IF.UTIL.MAX}` - 3 %.
Interfaces reporting speed 0 are ignored.

The threshold can be changed per interface, for example `{$IF.UTIL.MAX:"Ten-GigabitEthernet1/1/1"}` = `80`.

## Changes for Zabbix 7.0

* Export format `7.0` (`template_groups`, no `date` field).
* Discovery uses bulk `walk[]` + `SNMP_WALK_TO_JSON` preprocessing instead of legacy `discovery[]`.
* Removed positional macro `$1` in item prototype name (not supported since Zabbix 6.0).
* Fixed memory trigger (it was checking CPU item instead of memory).
* CRC item now uses `EtherLike-MIB::dot3StatsFCSErrors` (previously `dot3StatsAlignmentErrors`).
* Temperature trigger hysteresis uses recovery expression instead of `{TRIGGER.VALUE}`.
* `Application` tags replaced by `component` tags, `scope` tags added on triggers.
* Value map `HH3C-LSW-DEV-ADM-MIB::DevStatus` for fan / power supply status.
* Deprecated `{HOSTNAME}` macro replaced by `{HOST.NAME}`.
* Removed item `Power Supply Sensor` (it polled the same OID as `Internal Power Supply 1`).
* Added triggers for fan and power supply status `deactive` (value 2). `not-install` (value 3) does not raise an alert.
* Added interface bandwidth (bits received / sent), speed, admin and operational status, traffic graph per interface.
* Added link down trigger (up to down, admin status up) and high bandwidth usage trigger.
* Vlan-interfaces are discovered by default, status only (LLD override excludes bandwidth, speed and CRC).



## Author

Jakub Samek

## Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$IF.UTIL.MAX}|<p>Bandwidth usage threshold in % of interface speed (15-minute average, inbound or outbound). Override per interface with context, e.g. {$IF.UTIL.MAX:"Ten-GigabitEthernet1/1/1"}=80.</p>|`90`|
|{$IFCONTROL}|<p>Link down trigger: 1 = enabled, 0 = disabled. Override per interface with context, e.g. {$IFCONTROL:"GigabitEthernet1/0/1"}=0.</p>|`1`|
|{$NET.IF.IFTYPE.MATCHES}|<p>Regex of ifType values to discover. 6 = ethernetCsmacd, 136 = l3ipvlan (Vlan-interface), 161 = ieee8023adLag (Bridge-Aggregation).</p>|`^(6|136|161)$`|
|{$NET.IF.NO_TRAFFIC.IFTYPE.MATCHES}|<p>Regex of ifType values that are discovered for status only: no bandwidth, speed, CRC items and no bandwidth / CRC triggers. Default 136 = l3ipvlan (Vlan-interface).</p>|`^136$`|

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces discovery|<p>Discovers interfaces from IF-MIB (ifDescr, ifName, ifAlias, ifType). Interfaces are filtered by ifType using macro {$NET.IF.IFTYPE.MATCHES}.</p>|`Dependent item`|net.if.discovery<p>Master item: net.if.walk</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 1h</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 1h</p>|
|Device contact details|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 1h</p>|
|Internal Power Supply 1|<p>-</p>|`SNMP agent`|Int.Power.Supply1<p>Update: 1m</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 1h</p>|
|Memory usage|<p>-</p>|`SNMP agent`|switch.memory<p>Update: 1m</p>|
|CPU usage|<p>-</p>|`SNMP agent`|switch.cpu<p>Update: 1m</p>|
|SysUptime|<p>-</p>|`SNMP agent`|SysUptime<p>Update: 5m</p>|
|External Power Supply 1|<p>-</p>|`SNMP agent`|Ext.Power.Supply<p>Update: 1m</p>|
|Switch Temperature|<p>-</p>|`SNMP agent`|switch.temp<p>Update: 1m</p>|
|Fan 1|<p>-</p>|`SNMP agent`|fan1.status<p>Update: 1m</p>|
|Network interfaces: SNMP walk|<p>Master item: collects IF-MIB interface data in one bulk request. History is not stored.</p>|`SNMP agent`|net.if.walk<p>Update: 1m</p>|
|Interface {#IFNAME}({#IFALIAS}): Admin status|<p>IF-MIB::ifAdminStatus - the desired (configured) state of the interface. down = shutdown by administrator.</p>|`Dependent item`|net.if.adminstatus[ifAdminStatus.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>IF-MIB::ifOperStatus - the current operational state of the interface.</p>|`Dependent item`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>IF-MIB::ifHCInOctets - incoming traffic on the interface (64-bit counter).</p>|`Dependent item`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>IF-MIB::ifHCOutOctets - outgoing traffic on the interface (64-bit counter).</p>|`Dependent item`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>IF-MIB::ifHighSpeed - current bandwidth of the interface (reported in Mbps, converted to bps).</p>|`Dependent item`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): CRC errors|<p>EtherLike-MIB::dot3StatsFCSErrors - frames received that failed the FCS (CRC) check.</p>|`SNMP agent`|CRC.Errors[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CPU usage on {HOST.NAME} > 80%|<p>-</p>|<p>**Expression**: last(/HP A5120/switch.cpu)>80</p><p>**Recovery expression**: </p>|high|
|Memory usage on {HOST.NAME} > 80%|<p>-</p>|<p>**Expression**: last(/HP A5120/switch.memory)>80</p><p>**Recovery expression**: </p>|high|
|Temperature on {HOST.NAME} is > 45°C|<p>Temperature too high! Problem resolves when the temperature drops to 40°C or below.</p>|<p>**Expression**: last(/HP A5120/switch.temp)>45</p><p>**Recovery expression**: last(/HP A5120/switch.temp)<=40</p>|high|
|External Power Supply 1 on {HOST.NAME} is deactive|<p>The external power supply is installed but not working (status: deactive).</p>|<p>**Expression**: last(/HP A5120/Ext.Power.Supply)=2</p><p>**Recovery expression**: </p>|high|
|Fan 1 on {HOST.NAME} is deactive|<p>The fan is installed but not working (status: deactive).</p>|<p>**Expression**: last(/HP A5120/fan1.status)=2</p><p>**Recovery expression**: </p>|high|
|Internal Power Supply 1 on {HOST.NAME} is deactive|<p>The internal power supply is installed but not working (status: deactive).</p>|<p>**Expression**: last(/HP A5120/Int.Power.Supply1)=2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} has been restarted (uptime < 10m)|<p>-</p>|<p>**Expression**: last(/HP A5120/SysUptime)<10m</p><p>**Recovery expression**: </p>|info|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>The interface changed from up to down while its admin status is up (not shutdown). Interfaces that were already down, or that were shut down by an administrator, are ignored.</p>|<p>**Expression**: {$IFCONTROL:"{#IFNAME}"}=1 and last(/HP A5120/net.if.adminstatus[ifAdminStatus.{#SNMPINDEX}])=1 and last(/HP A5120/net.if.status[ifOperStatus.{#SNMPINDEX}])=2 and last(/HP A5120/net.if.status[ifOperStatus.{#SNMPINDEX}],#2)=1</p><p>**Recovery expression**: last(/HP A5120/net.if.status[ifOperStatus.{#SNMPINDEX}])<>2 or last(/HP A5120/net.if.adminstatus[ifAdminStatus.{#SNMPINDEX}])=2 or {$IFCONTROL:"{#IFNAME}"}=0</p>|average|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage (>{$IF.UTIL.MAX:"{#IFNAME}"}%) (LLD)|<p>The 15-minute average of inbound or outbound traffic exceeds {$IF.UTIL.MAX:"{#IFNAME}"}% of the interface speed. The problem is resolved when both directions drop below ({$IF.UTIL.MAX:"{#IFNAME}"} - 3)%.</p>|<p>**Expression**: (avg(/HP A5120/net.if.in[ifHCInOctets.{#SNMPINDEX}],15m)>({$IF.UTIL.MAX:"{#IFNAME}"}/100)*last(/HP A5120/net.if.speed[ifHighSpeed.{#SNMPINDEX}]) or avg(/HP A5120/net.if.out[ifHCOutOctets.{#SNMPINDEX}],15m)>({$IF.UTIL.MAX:"{#IFNAME}"}/100)*last(/HP A5120/net.if.speed[ifHighSpeed.{#SNMPINDEX}])) and last(/HP A5120/net.if.speed[ifHighSpeed.{#SNMPINDEX}])>0</p><p>**Recovery expression**: avg(/HP A5120/net.if.in[ifHCInOctets.{#SNMPINDEX}],15m)<(({$IF.UTIL.MAX:"{#IFNAME}"}-3)/100)*last(/HP A5120/net.if.speed[ifHighSpeed.{#SNMPINDEX}]) and avg(/HP A5120/net.if.out[ifHCOutOctets.{#SNMPINDEX}],15m)<(({$IF.UTIL.MAX:"{#IFNAME}"}-3)/100)*last(/HP A5120/net.if.speed[ifHighSpeed.{#SNMPINDEX}])</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): CRC errors on {HOST.NAME} (LLD)|<p>A Cyclic Redundancy Check (CRC) are a hash function designed to detect accidental changes to raw computer data. A CRC is a short binary sequence present on each block of data. When a block of data is read or received, the device repeats the calculation to check for a match. If the new CRC does not match the original CRC, then a data error is logged and the device can attempt to correct the data error by re-reading or requesting the block of data.</p>|<p>**Expression**: change(/HP A5120/CRC.Errors[{#SNMPINDEX}])>1</p><p>**Recovery expression**: </p>|average|
