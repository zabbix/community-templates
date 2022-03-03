# SNMP Cisco SG500x

## Overview

PoE, port usage, uptime



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Environment Stacking|<p>The index of the stack unit to which this conceptual row corresponds. Note that the index will be the same index as the index of a 'chassis' physical entity in the entity MIB of the product.</p>|`SNMP agent`|rlPhdUnitEnvParamStackUnit<p>Update: 3600</p>|
|Network Interfaces|<p>-</p>|`SNMP agent`|ifName<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device firmware version|<p>Version number of the Firmware.</p>|`SNMP agent`|entPhysicalFirmwareRev<p>Update: 3600</p>|
|Device manufacter mame|<p>-</p>|`External check`|echo.something["Cisco Systems"]<p>Update: 3600</p>|
|Device CPU utilization|<p>Percentage of the device CPU utilization during the last 5 minutes. The value 101 is a dummy value, indicating that the CPU utilization was not measured (since measurement is disabled or was disabled during last 5 minutes).</p>|`SNMP agent`|rlCpuUtilDuringLast5Minutes<p>Update: 60</p>|
|Device contact details|<p>-</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|Device hardware version|<p>Version number of the Hardware.</p>|`SNMP agent`|entPhysicalHardwareRev<p>Update: 3600</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 300</p>|
|Device full description|<p>Full text IOS description</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software. It is mandatory that this only contain printable ASCII characters.</p>|`SNMP agent`|entPhysicalModelName<p>Update: 3600</p>|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|Device serial number|<p>-</p>|`SNMP agent`|entPhysicalSerialNum<p>Update: 3600</p>|
|Device type|<p>-</p>|`SNMP agent`|entPhysicalDescr<p>Update: 3600</p>|
|Environment fan status, unit $1|<p>The mandatory state of the FAN 1 being instrumented</p>|`SNMP agent`|rlPhdUnitEnvParamFan1Status[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Environment temp. status, unit $1|<p>Display environment monitoring chassis temperature status</p>|`SNMP agent`|rlPhdUnitEnvParamMonitorTemperatureStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Stack device id, unit $1|<p>Asset tag of the product.</p>|`SNMP agent`|rlPhdUnitGenParamServiceTag[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Stack device serial, unit $1|<p>Asset tag of the product.</p>|`SNMP agent`|rlPhdUnitGenParamSerialNum[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Stack device uptime, unit $1|<p>Up time of the unit in 100th of second (sec/100).</p>|`SNMP agent`|rlPhdUnitEnvParamUpTime[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Admin status of interface $1|<p>INTEGER {up(1), down(2), testing(3)} The desired state of the interface. The testing(3) state indicates that no operational packets can be passed. When a managed system initializes, all interfaces start with ifAdminStatus in the down(2) state. As a result of either explicit management action or per configuration information retained by the managed system, ifAdminStatus is then changed to either the up(1) or testing(3) states (or remains in the down(2) state).</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Speed of interface {#SNMPVALUE}|<p>An estimate of the interface's current bandwidth in units of 1,000,000 bits per second. If this object reports a value of `n' then the speed of the interface is somewhere in the range of `n-500,000' to `n+499,999'. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|ifHighSpeed[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Outgoing unicast packets on interface $1|<p>The total number of packets that higher-level protocols requested be transmitted, and which were not addressed to a multicast or broadcast address at this sub-layer, including those that were discarded or not sent. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifOutUcastPkts[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>-</p>|`SNMP agent`|IfHCOutOctets[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Outgoing multicast packets on interface $1|<p>The total number of packets that higher-level protocols requested be transmitted, and which were addressed to a multicast address at this sub-layer, including those that were discarded or not sent. For a MAC layer protocol, this includes both Group and Functional addresses. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifOutMulticastPkts[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Outgoing discarded packets on interface $1|<p>The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being transmitted. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifOutDiscards[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Outgoing broadcast packets on interface $1|<p>The total number of packets that higher-level protocols requested be transmitted, and which were addressed to a broadcast address at this sub-layer, including those that were discarded or not sent. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifOutBroadcastPkts[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Operational status of interface $1|<p>INTEGER {up(1), down(2), testing(3), unknown(4), dormant(5), notPresent(6), lowerLayerDown(7)} he current operational state of the interface. The testing(3) state indicates that no operational packets can be passed. If ifAdminStatus is down(2) then ifOperStatus should be down(2). If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic;it should change to dormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection);it should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state;it should remain in the notPresent(6) state if the interface has missing (typically, hardware) components.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Alias of interface $1|<p>This object is an 'alias' name for the interface as specified by a network manager, and provides a non-volatile 'handle' for the interface. On the first instantiation of an interface, the value of ifAlias associated with that interface is the zero-length string. As and when a value is written into an instance of ifAlias through a network management set operation, then the agent must retain the supplied value in the ifAlias instance associated with the same interface for as long as that interface remains instantiated, including across all re-initializations/reboots of the network management system, including those which result in a change of the interface's ifIndex value. An example of the value which a network manager might store in this object for a WAN interface is the (Telco's) circuit number/identifier of the interface. Some agents may support write-access only for interfaces having particular values of ifType. An agent which supports write access to this object is required to keep the value in non-volatile storage, but it may limit the length of new values depending on how much storage is already occupied by the current values for other interfaces.</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Incoming unicast packets on interface $1|<p>The number of packets, delivered by this sub-layer to a higher (sub-)layer, which were not addressed to a multicast or broadcast address at this sub-layer. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifInUcastPkts[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The total number of octets received on the interface, including framing characters. This object is a 64-bit version of ifInOctets. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifHCInOctets[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Incoming multicast packets on interface $1|<p>The number of packets, delivered by this sub-layer to a higher (sub-)layer, which were addressed to a multicast address at this sub-layer. For a MAC layer protocol, this includes both Group and Functional addresses. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifInMulticastPkts[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Incoming discarded packets on interface $1|<p>The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifInDiscards[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Incoming broadcast packets on interface $1|<p>The number of packets, delivered by this sub-layer to a higher (sub-)layer, which were addressed to a broadcast address at this sub-layer. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifInBroadcastPkts[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Description of interface $1|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Uptime of interface $1|<p>The value of sysUpTime at the time the interface entered its current operational state. If the current state was entered prior to the last re-initialization of the local network management subsystem, then this object contains a zero value.</p>|`SNMP agent`|ifLastChange[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} {#SNMPVALUE} fan critical|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamFan1Status[{#SNMPVALUE}].last()}=6</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME} {#SNMPVALUE} fan failed|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamFan1Status[{#SNMPVALUE}].avg(#3)}=6</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} {#SNMPVALUE} fan warning|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamFan1Status[{#SNMPVALUE}].avg(#3)}=2</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} {#SNMPVALUE} temperature critical|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamMonitorTemperatureStatus[{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME} {#SNMPVALUE} temperature high|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamMonitorTemperatureStatus[{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|high|
|Incoming use on interface {#SNMPVALUE} exceed 80% for the last 5 minutes|<p>-</p>|<p>**Expression**: ({SNMP Cisco SG500x:ifHCInOctets[{#SNMPVALUE}].avg(300s)})>({SNMP Cisco SG500x:ifHighSpeed[{#SNMPVALUE}].last()}*0.8)</p><p>**Recovery expression**: </p>|warning|
|Outgoing use on interface {#SNMPVALUE} exceed 80% for the last 5 minutes|<p>-</p>|<p>**Expression**: ({SNMP Cisco SG500x:IfHCOutOctets[{#SNMPVALUE}].avg(300s)})>({SNMP Cisco SG500x:ifHighSpeed[{#SNMPVALUE}].last()}*0.8)</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} link changed on {#SNMPVALUE}: {ITEM.VALUE1}|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:ifOperStatus[{#SNMPVALUE}].max(#1)}=2 and {SNMP Cisco SG500x:ifOperStatus[{#SNMPVALUE}].max(#2)}=2</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME} {#SNMPVALUE} fan critical (LLD)|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamFan1Status[{#SNMPVALUE}].last()}=6</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME} {#SNMPVALUE} fan failed (LLD)|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamFan1Status[{#SNMPVALUE}].avg(#3)}=6</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} {#SNMPVALUE} fan warning (LLD)|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamFan1Status[{#SNMPVALUE}].avg(#3)}=2</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} {#SNMPVALUE} temperature critical (LLD)|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamMonitorTemperatureStatus[{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME} {#SNMPVALUE} temperature high (LLD)|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:rlPhdUnitEnvParamMonitorTemperatureStatus[{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|high|
|Incoming use on interface {#SNMPVALUE} exceed 80% for the last 5 minutes (LLD)|<p>-</p>|<p>**Expression**: ({SNMP Cisco SG500x:ifHCInOctets[{#SNMPVALUE}].avg(300s)})>({SNMP Cisco SG500x:ifHighSpeed[{#SNMPVALUE}].last()}*0.8)</p><p>**Recovery expression**: </p>|warning|
|Outgoing use on interface {#SNMPVALUE} exceed 80% for the last 5 minutes (LLD)|<p>-</p>|<p>**Expression**: ({SNMP Cisco SG500x:IfHCOutOctets[{#SNMPVALUE}].avg(300s)})>({SNMP Cisco SG500x:ifHighSpeed[{#SNMPVALUE}].last()}*0.8)</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} link changed on {#SNMPVALUE}: {ITEM.VALUE1} (LLD)|<p>-</p>|<p>**Expression**: {SNMP Cisco SG500x:ifOperStatus[{#SNMPVALUE}].max(#1)}=2 and {SNMP Cisco SG500x:ifOperStatus[{#SNMPVALUE}].max(#2)}=2</p><p>**Recovery expression**: </p>|disaster|
