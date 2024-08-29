# Eltex MES SNMPv2

## Overview

Added to the Eltex MES switches, serial number, MAC address, firmware version.


15.02.2018 Add SFP healt (C, Volt, mA, Out power [mW/dBm], Input power [mW/dBm]). 


23.02.2018 Add Screens and Aliase to Screens



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifName<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ICMP loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 2m</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 5m</p>|
|Memory Utilization Free|<p>-</p>|`SNMP agent`|eltexProcessMemoryFreePercent<p>Update: 5m</p>|
|Temperature|<p>-</p>|`SNMP agent`|rlEnvFanDataTemp<p>Update: 5m</p>|
|Device MAC|<p>MAC adress Device</p>|`SNMP agent`|rlPhdStackMacAddr<p>Update: 1h</p>|
|CPU Utilization 1sec|<p>-</p>|`SNMP agent`|rlCpuUtilDuringLastSecond<p>Update: 3m</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 1h</p>|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 1h</p>|
|Device contact details|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 1h</p>|
|ICMP ping|<p>-</p>|`Simple check`|icmpping<p>Update: 1m</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 1h</p>|
|Device firmware|<p>Version firmware</p>|`SNMP agent`|rndBrgVersion<p>Update: 1h</p>|
|ICMP response time|<p>-</p>|`Simple check`|icmppingsec<p>Update: 2m</p>|
|CPU Utilization 1min|<p>-</p>|`SNMP agent`|rlCpuUtilDuringLastMinute<p>Update: 3m</p>|
|Serial number|<p>Serial number</p>|`SNMP agent`|rlPhdUnitGenParamSerialNum<p>Update: 1h</p>|
|Number of network interfaces|<p>The number of network interfaces (regardless of their current state) present on this system.</p>|`SNMP agent`|ifNumber<p>Update: 1h</p>|
|CPU Utilization 5min|<p>-</p>|`SNMP agent`|rlCpuUtilDuringLast5Minutes<p>Update: 5m</p>|
|Admin status of interface {#SNMPVALUE}|<p>The desired state of the interface.</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Inbound errors on interface {#SNMPVALUE}|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Volt SFP of interface {#SNMPVALUE}|<p>Volt on SFP interface.</p>|`SNMP agent`|rlPhyTestGetResult.v[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Temperature SFP of interface {#SNMPVALUE}|<p>Temperature on SFP interface.</p>|`SNMP agent`|rlPhyTestGetResult.t[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Out power SFP of interface {#SNMPVALUE}|<p>Out power on SFP interface.</p>|`SNMP agent`|rlPhyTestGetResult.OutPow[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|mA SFP of interface {#SNMPVALUE}|<p>mA on SFP interface.</p>|`SNMP agent`|rlPhyTestGetResult.mA[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Input power SFP of interface {#SNMPVALUE}|<p>Input power on SFP interface.</p>|`SNMP agent`|rlPhyTestGetResult.InPow[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Outbound errors on interface {#SNMPVALUE}|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Operational status of interface {#SNMPVALUE}|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 15m</p><p>LLD</p>|
|Outgoing Unicast packets on interface {#SNMPVALUE}|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifHCOutUcastPkts[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Alias of interface {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Outgoing traffic on interface {#SNMPVALUE}|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifHCOutOctets[{#SNMPVALUE}]<p>Update: 3m</p><p>LLD</p>|
|Outgoing Multicast packets on interface {#SNMPVALUE}|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifHCOutMulticastPkts[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Outgoing Broadcast packets on interface {#SNMPVALUE}|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifHCOutBroadcastPkts[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Incoming Unicast packets on interface {#SNMPVALUE}|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifHCInUcastPkts[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Incoming traffic on interface {#SNMPVALUE}|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifHCInOctets[{#SNMPVALUE}]<p>Update: 3m</p><p>LLD</p>|
|Incoming Multicast packets on interface {#SNMPVALUE}|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifHCInMulticastPkts[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Incoming Broadcast packets on interface {#SNMPVALUE}|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifHCInBroadcastPkts[{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|Description of interface {#SNMPVALUE}|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Speed on interface {#SNMPVALUE}|<p>Mode speed on interfece.</p>|`SNMP agent`|speed_on_[{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Error IN {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Eltex MES SNMPv2/ifInErrors[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|warning|
|Error OUT {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Eltex MES SNMPv2/ifOutErrors[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|warning|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/Eltex MES SNMPv2/ifOperStatus[{#SNMPVALUE}],#1)<>last(/Eltex MES SNMPv2/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Utilization > 50% IN {HOST.NAME} interface {#SNMPVALUE} ({#IFNAME})|<p>-</p>|<p>**Expression**: (avg(/Eltex MES SNMPv2/ifHCInOctets[{#SNMPVALUE}],5m)*0.000001)>(last(/Eltex MES SNMPv2/speed_on_[{#SNMPVALUE}])/2) or (avg(/Eltex MES SNMPv2/ifHCOutOctets[{#SNMPVALUE}],5m)*0.000001)>(last(/Eltex MES SNMPv2/speed_on_[{#SNMPVALUE}])/2)</p><p>**Recovery expression**: </p>|warning|
|Затухание на SFP порту {#SNMPVALUE}|<p>Потери мощности на оптической линии.</p>|<p>**Expression**: avg(/Eltex MES SNMPv2/rlPhyTestGetResult.InPow[{#SNMPVALUE}],5m)<(avg(/Eltex MES SNMPv2/rlPhyTestGetResult.OutPow[{#SNMPVALUE}],5m)*2)</p><p>**Recovery expression**: </p>|average|
|Error IN {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex MES SNMPv2/ifInErrors[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|warning|
|Error OUT {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex MES SNMPv2/ifOutErrors[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|warning|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/Eltex MES SNMPv2/ifOperStatus[{#SNMPVALUE}],#1)<>last(/Eltex MES SNMPv2/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Utilization > 50% IN {HOST.NAME} interface {#SNMPVALUE} ({#IFNAME}) (LLD)|<p>-</p>|<p>**Expression**: (avg(/Eltex MES SNMPv2/ifHCInOctets[{#SNMPVALUE}],5m)*0.000001)>(last(/Eltex MES SNMPv2/speed_on_[{#SNMPVALUE}])/2) or (avg(/Eltex MES SNMPv2/ifHCOutOctets[{#SNMPVALUE}],5m)*0.000001)>(last(/Eltex MES SNMPv2/speed_on_[{#SNMPVALUE}])/2)</p><p>**Recovery expression**: </p>|warning|
|Затухание на SFP порту {#SNMPVALUE} (LLD)|<p>Потери мощности на оптической линии.</p>|<p>**Expression**: avg(/Eltex MES SNMPv2/rlPhyTestGetResult.InPow[{#SNMPVALUE}],5m)<(avg(/Eltex MES SNMPv2/rlPhyTestGetResult.OutPow[{#SNMPVALUE}],5m)*2)</p><p>**Recovery expression**: </p>|average|
