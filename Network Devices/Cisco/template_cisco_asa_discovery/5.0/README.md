# Template Cisco ASA Discovery

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ASA Interfaces discovery|<p>-</p>|`SNMP agent`|ifDescr<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of network interfaces|<p>The number of network interfaces (regardless of their current state) present on this system.</p>|`SNMP agent`|ifNumber<p>Update: 3600</p>|
|Failover status|<p>Can be "Active Unit" or "Passive Unit"</p>|`SNMP agent`|cfwHardwareStatusDetail<p>Update: 60</p>|
|Description|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|Memory Free|<p>-</p>|`SNMP agent`|ciscoMemoryPoolFree<p>Update: 60</p>|
|ICMP response time|<p>-</p>|`Simple check`|icmppingsec<p>Update: 60</p>|
|CPU Utilization avg last 5 sec|<p>-</p>|`SNMP agent`|cpmCPUTotal5secRev<p>Update: 60</p>|
|Active SSL VPNs RemoteAccess|<p>The number of currently active SVC sessions.</p>|`SNMP agent`|crasSVCNumSessions<p>Update: 60</p>|
|ROMMON Versoin|<p>-</p>|`SNMP agent`|entPhysicalFirmwareRev<p>Update: 3600</p>|
|Max Connections Supported|<p>-</p>|`SNMP agent`|cfwConnectionStatValueHigh<p>Update: 3600</p>|
|Memory Pool Largest Free|<p>-</p>|`SNMP agent`|ciscoMemoryPoolLargestFree<p>Update: 60</p>|
|Memory Usage|<p>-</p>|`Calculated`|ciscoMemUsage<p>Update: 60</p>|
|CPU Utilization avg last 5 min|<p>-</p>|`SNMP agent`|cpmCPUTotal5minRev<p>Update: 60</p>|
|Chassis Serial Number|<p>-</p>|`SNMP agent`|entPhysicalSerialNum<p>Update: 3600</p>|
|IOS Version|<p>-</p>|`SNMP agent`|entPhysicalSoftwareRev<p>Update: 3600</p>|
|Active IPSEC VPNs RemoteAccess|<p>The number of currently active IPSEC sessions.</p>|`SNMP agent`|crasIPSecNumSessions<p>Update: 60</p>|
|Memory Used|<p>-</p>|`SNMP agent`|ciscoMemoryPoolUsed<p>Update: 60</p>|
|ICMP loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 60</p>|
|ICMP Ping|<p>-</p>|`Simple check`|icmpping<p>Update: 30</p>|
|Vendor Name|<p>-</p>|`SNMP agent`|entPhysicalMfgName<p>Update: 3600</p>|
|Chassis Version|<p>-</p>|`SNMP agent`|entPhysicalHardwareRev<p>Update: 3600</p>|
|CPU Utilization avg last 1 min|<p>-</p>|`SNMP agent`|cpmCPUTotal1minRev<p>Update: 60</p>|
|Memoty Total|<p>-</p>|`Calculated`|ciscoMemoryTotal<p>Update: 3600</p>|
|sysUpTime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 300</p>|
|Model Name|<p>-</p>|`SNMP agent`|entPhysicalModelName<p>Update: 3600</p>|
|Active VPNs Lan-To-Lan|<p>The number of currently active LAN to LAN sessions.</p>|`SNMP agent`|crasL2LNumSessions<p>Update: 60</p>|
|Connections In Use|<p>-</p>|`SNMP agent`|cfwConnectionStatValueCurrentInUse<p>Update: 60</p>|
|$1 AdminStatus|<p>The desired state of the interface.</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 Description|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|$1 InBroadcastPkts|<p>-</p>|`SNMP agent`|ifInBroadcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 InErrors|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 InMulticastPkts|<p>-</p>|`SNMP agent`|ifInMulticastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 InOctets|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 InUcastPkts|<p>-</p>|`SNMP agent`|ifInUcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 OperStatus|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 OutBroadcastPkts|<p>-</p>|`SNMP agent`|ifOutBroadcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 OutErrors|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 OutMulticastPkts|<p>-</p>|`SNMP agent`|ifOutMulticastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 OutOctets|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 OutUcastPkts|<p>-</p>|`SNMP agent`|ifOutUcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|$1 Speed|<p>-</p>|`SNMP agent`|ifSpeed[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Errors on {#SNMPVALUE}|<p>More than 100 in/out errors detected on {#SNMPVALUE}</p>|<p>**Expression**: {Template Cisco ASA Discovery:ifInErrors[{#SNMPVALUE}].last(0)}>100 or {Template Cisco ASA Discovery:ifOutErrors[{#SNMPVALUE}].last(0)}>100</p><p>**Recovery expression**: </p>|warning|
|Errors on {#SNMPVALUE} (LLD)|<p>More than 100 in/out errors detected on {#SNMPVALUE}</p>|<p>**Expression**: {Template Cisco ASA Discovery:ifInErrors[{#SNMPVALUE}].last(0)}>100 or {Template Cisco ASA Discovery:ifOutErrors[{#SNMPVALUE}].last(0)}>100</p><p>**Recovery expression**: </p>|warning|
