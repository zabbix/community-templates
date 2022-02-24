# Template Cisco General

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OSPF Neighbors|<p>OSPF-MIB::ospfNbrIpAddr The IP address this neighbor is using in its IP source address. Note that, on addressless links, this will not be 0.0.0.0 but the address of another of the neighbor's interfaces.</p>|`SNMP agent`|ospfNbrIpAddr<p>Update: 300</p>|
|BGP Peers|<p>BGP4-MIB::bgpPeerIdentifier</p>|`SNMP agent`|bgpPeerIdentifier<p>Update: 300</p>|
|OSPF Interfaces|<p>OSPF-MIB::ospfIfIpAddress The IP address of this OSPF interface.</p>|`SNMP agent`|ospfIfIpAddress<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OSPF "{#SNMPVALUE}" Neighbour State|<p>-</p>|`SNMP trap`|snmptrap["(ospfNbrStateChange).*ospfNbrIpAddr[[:space:]]{#SNMPVALUE}[[:space:]].*[[:space:]][a-zA-Z]+[[:space:]]$"]<p>Update: 0</p><p>LLD</p>|
|BGP Peer "{#SNMPINDEX}" State|<p>-</p>|`SNMP trap`|snmptrap["(bgpEstablished|bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState\.{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"]<p>Update: 0</p><p>LLD</p>|
|BGP Peer "{#SNMPINDEX}" State|<p>-</p>|`SNMP trap`|snmptrap["(bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState\.{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"]<p>Update: 0</p><p>LLD</p>|
|OSPF Interface "{SNMPVALUE}" State|<p>-</p>|`SNMP trap`|snmptrap["ospfIfStateChange.+ospfIfIpAddress[[:space:]]{#SNMPVALUE}[[:space:]].+ospfIfState[[:space:]][a-zA-Z]+"]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed|<p>-</p>|<p>**Expression**: {Template Cisco General:snmptrap["(bgpEstablished|bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed|<p>-</p>|<p>**Expression**: {Template Cisco General:snmptrap["(bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Interface "{#SNMPVALUE}" State has been changed|<p>-</p>|<p>**Expression**: {Template Cisco General:snmptrap["ospfIfStateChange.+ospfIfIpAddress[[:space:]]{#SNMPVALUE}[[:space:]].+ospfIfState[[:space:]][a-zA-Z]+"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Neighbor {#SNMPVALUE} has been changed|<p>-</p>|<p>**Expression**: {Template Cisco General:snmptrap["(ospfNbrStateChange).*ospfNbrIpAddr[[:space:]]{#SNMPVALUE}[[:space:]].*[[:space:]][a-zA-Z]+[[:space:]]$"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Neighbor {#SNMPVALUE} has been changed (LLD)|<p>-</p>|<p>**Expression**: {Template Cisco General:snmptrap["(ospfNbrStateChange).*ospfNbrIpAddr[[:space:]]{#SNMPVALUE}[[:space:]].*[[:space:]][a-zA-Z]+[[:space:]]$"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed (LLD)|<p>-</p>|<p>**Expression**: {Template Cisco General:snmptrap["(bgpEstablished|bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed (LLD)|<p>-</p>|<p>**Expression**: {Template Cisco General:snmptrap["(bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Interface "{#SNMPVALUE}" State has been changed (LLD)|<p>-</p>|<p>**Expression**: {Template Cisco General:snmptrap["ospfIfStateChange.+ospfIfIpAddress[[:space:]]{#SNMPVALUE}[[:space:]].+ospfIfState[[:space:]][a-zA-Z]+"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|


# Template_Cisco_7600

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Cisco General|
|Template_Cisco_Traps|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP Peers|<p>BGP4-MIB::bgpPeerIdentifier</p>|`SNMP agent`|bgpPeerIdentifier<p>Update: 300</p>|
|FAN|<p>CISCO-ENVMON-MIB::ciscoEnvMonFanStatusDescr Textual description of the fan being instrumented.</p>|`SNMP agent`|ciscoEnvMonFanStatusDescr<p>Update: 300</p>|
|Power Supplies|<p>CISCO-ENVMON-MIB::ciscoEnvMonSupplyStatusDescr Textual description of the power supply being instrumented.</p>|`SNMP agent`|ciscoEnvMonSupplyStatusDescr<p>Update: 300</p>|
|Flash Devices|<p>CISCO-FLASH-MIB::ciscoFlashDeviceDescr Description of a Flash device. The description is meant to explain what the Flash device and its purpose is. Current values are: System flash - for the primary Flash used to store full system images. Boot flash - for the secondary Flash used to store bootstrap images. The device description will always be available for a removable device, even when the device has been removed.</p>|`SNMP agent`|ciscoFlashDeviceDescr<p>Update: 300</p>|
|Memory Pool|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolName A textual name assigned to the memory pool.</p>|`SNMP agent`|ciscoMemoryPoolName<p>Update: 300</p>|
|CPU|<p>CISCO-PROCESS-MIB::cpmCPUTotalPhysicalIndex The entPhysicalIndex of the physical entity for which the CPU statistics in this entry are maintained. The physical entity can be a CPU chip, a group of CPUs, a CPU card etc. The exact type of this entity is described by its entPhysicalVendorType value. If the CPU statistics in this entry correspond to more than one physical entity (or to no physical entity), or if the entPhysicalTable is not supported on the SNMP agent, the value of this object must be zero.</p>|`SNMP agent`|cpmCPUTotalPhysicalIndex<p>Update: 300</p>|
|$1 Sensors|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName[Amperage]<p>Update: 300</p>|
|$1 Sensors|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName["Fan Tray"]<p>Update: 300</p>|
|$1 Sensors|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName[Load]<p>Update: 300</p>|
|$1 Sensors|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName[Module]<p>Update: 300</p>|
|$1 Sensors|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName[Temperature]<p>Update: 300</p>|
|$1 Sensors|<p>The textual name of the physical entity.</p>|`SNMP agent`|entPhysicalName[Voltage]<p>Update: 300</p>|
|OSPF Interfaces|<p>OSPF-MIB::ospfIfIpAddress The IP address of this OSPF interface.</p>|`SNMP agent`|ospfIfIpAddress<p>Update: 300</p>|
|OSPF Neighbors|<p>OSPF-MIB::ospfNbrIpAddr The IP address this neighbor is using in its IP source address. Note that, on addressless links, this will not be 0.0.0.0 but the address of another of the neighbor's interfaces.</p>|`SNMP agent`|ospfNbrIpAddr<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP Peer "{#SNMPINDEX}" State|<p>-</p>|`SNMP trap`|snmptrap["(bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState\.{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"]<p>Update: 0</p><p>LLD</p>|
|BGP Peer "{#SNMPINDEX}" State|<p>-</p>|`SNMP trap`|snmptrap["(bgpEstablished|bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState\.{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"]<p>Update: 0</p><p>LLD</p>|
|Status of FAN "$1"|<p>CISCO-ENVMON-MIB::ciscoEnvMonFanState The current state of the fan being instrumented.</p>|`SNMP agent`|ciscoEnvMonFanState["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Status of Power Supply "$1"|<p>CISCO-ENVMON-MIB::ciscoEnvMonSupplyState The current state of the power supply being instrumented.</p>|`SNMP agent`|ciscoEnvMonSupplyState["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Size of Flash Device "$1"|<p>CISCO-FLASH-MIB::ciscoFlashDeviceSize Total size of the Flash device.</p>|`SNMP agent`|ciscoFlashDeviceSize["{#SNMPVALUE}"]<p>Update: 3600</p><p>LLD</p>|
|Free memory on Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolFree Indicates the number of bytes from the memory pool that are currently unused on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolFree["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Name of Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolName A textual name assigned to the memory pool.</p>|`SNMP agent`|ciscoMemoryPoolName["{#SNMPVALUE}"]<p>Update: 3600</p><p>LLD</p>|
|Total Memory Pool "$1"|<p>-</p>|`Calculated`|ciscoMemoryPoolTotal["{#SNMPVALUE}"]<p>Update: 3600</p><p>LLD</p>|
|Used memory on Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolUsed Indicates the number of bytes from the memory pool that are currently in use by applications on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolUsed["{#SNMPVALUE}"]<p>Update: 300</p><p>LLD</p>|
|CPU #$1 Usage 1min Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal1minRev The overall CPU busy percentage in the last 1 minute period. This object deprecates the object cpmCPUTotal1min and increases the value range to (0..100).</p>|`SNMP agent`|cpmCPUTotal1minRev[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|CPU #$1 Usage 5min Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal5minRev The overall CPU busy percentage in the last 5 minute period. This object deprecates the object cpmCPUTotal5min and increases the value range to (0..100).</p>|`SNMP agent`|cpmCPUTotal5minRev[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|CPU #$1 Usage 5sec Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal5secRev The overall CPU busy percentage in the last 5 second period. This object deprecates the object cpmCPUTotal5sec and increases the value range to (0..100). This object is deprecated by cpmCPUTotalMonIntervalValue.</p>|`SNMP agent`|cpmCPUTotal5secRev[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|$2 of Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorValue This variable reports the most recent measurement seen by the sensor.</p>|`SNMP agent`|entSensorValue["{#SNMPVALUE}",Amperage]<p>Update: 60</p><p>LLD</p>|
|Status of $2 Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorStatus This variable indicates the present operational status of the sensor.</p>|`SNMP agent`|entSensorStatus["{#SNMPVALUE}",Amperage]<p>Update: 60</p><p>LLD</p>|
|Manufacturer of $2 "$1"|<p>ENTITY-MIB::entPhysicalMfgName The name of the manufacturer of this physical component. The preferred value is the manufacturer name string actually printed on the component itself (if present).</p>|`SNMP agent`|entPhysicalMfgName["{#SNMPVALUE}","Fan Tray"]<p>Update: 86400</p><p>LLD</p>|
|Model Name of $2 "$1"|<p>ENTITY-MIB::entPhysicalModelName The vendor-specific model name identifier string associated with this physical component. The preferred value is the customer-visible part number, which may be printed on the component itself.</p>|`SNMP agent`|entPhysicalModelName["{#SNMPVALUE}","Fan Tray"]<p>Update: 86400</p><p>LLD</p>|
|Operational Status of $2 "$1"|<p>CISCO-ENTITY-FRU-CONTROL-MIB::cefcFanTrayOperStatus The operational state of the fan or fan tray.</p>|`SNMP agent`|cefcFanTrayOperStatus["{#SNMPVALUE}","Fan Tray"]<p>Update: 60</p><p>LLD</p>|
|Serial Number of $2 "$1"|<p>ENTITY-MIB::entPhysicalSerialNum The vendor-specific serial number string for the physical entity. The preferred value is the serial number string actually printed on the component itself (if present).</p>|`SNMP agent`|entPhysicalSerialNum["{#SNMPVALUE}","Fan Tray"]<p>Update: 3600</p><p>LLD</p>|
|Status of $2 Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorStatus This variable indicates the present operational status of the sensor.</p>|`SNMP agent`|entSensorStatus["{#SNMPVALUE}",Load]<p>Update: 60</p><p>LLD</p>|
|Value of $2 Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorValue This variable reports the most recent measurement seen by the sensor.</p>|`SNMP agent`|entSensorValue["{#SNMPVALUE}",Load]<p>Update: 60</p><p>LLD</p>|
|Manufacturer of $2 "$1"|<p>ENTITY-MIB::entPhysicalMfgName The name of the manufacturer of this physical component. The preferred value is the manufacturer name string actually printed on the component itself (if present).</p>|`SNMP agent`|entPhysicalMfgName["{#SNMPVALUE}","Module"]<p>Update: 86400</p><p>LLD</p>|
|Model Name of $2 "$1"|<p>ENTITY-MIB::entPhysicalModelName The vendor-specific model name identifier string associated with this physical component. The preferred value is the customer-visible part number, which may be printed on the component itself.</p>|`SNMP agent`|entPhysicalModelName["{#SNMPVALUE}","Module"]<p>Update: 86400</p><p>LLD</p>|
|Module Trap Status|<p>-</p>|`SNMP trap`|snmptrap["cefcModuleStatusChange.*cefcModuleOperStatus\.{#SNMPINDEX}[[:space:]]"]<p>Update: 0</p><p>LLD</p>|
|Operational Status of $2 "$1"|<p>CISCO-ENTITY-FRU-CONTROL-MIB::cefcModuleOperStatus</p>|`SNMP agent`|cefcModuleOperStatus["{#SNMPVALUE}","Module"]<p>Update: 60</p><p>LLD</p>|
|Serial Number of $2 "$1"|<p>ENTITY-MIB::entPhysicalSerialNum The vendor-specific serial number string for the physical entity. The preferred value is the serial number string actually printed on the component itself (if present).</p>|`SNMP agent`|entPhysicalSerialNum["{#SNMPVALUE}","Module"]<p>Update: 3600</p><p>LLD</p>|
|$2 on Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorValue This variable reports the most recent measurement seen by the sensor.</p>|`SNMP agent`|entSensorValue["{#SNMPVALUE}",Temperature]<p>Update: 60</p><p>LLD</p>|
|Status of $2 Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorStatus This variable indicates the present operational status of the sensor.</p>|`SNMP agent`|entSensorStatus["{#SNMPVALUE}",Temperature]<p>Update: 60</p><p>LLD</p>|
|$2 on Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorValue This variable reports the most recent measurement seen by the sensor.</p>|`SNMP agent`|entSensorValue["{#SNMPVALUE}",Voltage]<p>Update: 60</p><p>LLD</p>|
|Status of $2 Sensor "$1"|<p>CISCO-ENTITY-SENSOR-MIB::entSensorStatus This variable indicates the present operational status of the sensor.</p>|`SNMP agent`|entSensorStatus["{#SNMPVALUE}",Voltage]<p>Update: 60</p><p>LLD</p>|
|OSPF Interface "{SNMPVALUE}" State|<p>-</p>|`SNMP trap`|snmptrap["ospfIfStateChange.+ospfIfIpAddress[[:space:]]{#SNMPVALUE}[[:space:]].+ospfIfState[[:space:]][a-zA-Z]+"]<p>Update: 0</p><p>LLD</p>|
|OSPF "{#SNMPVALUE}" Neighbour State|<p>-</p>|`SNMP trap`|snmptrap["(ospfNbrStateChange).*ospfNbrIpAddr[[:space:]]{#SNMPVALUE}[[:space:]].*[[:space:]][a-zA-Z]+[[:space:]]$"]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:snmptrap["(bgpEstablished|bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:snmptrap["(bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Interface "{#SNMPVALUE}" State has been changed|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:snmptrap["ospfIfStateChange.+ospfIfIpAddress[[:space:]]{#SNMPVALUE}[[:space:]].+ospfIfState[[:space:]][a-zA-Z]+"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Neighbor {#SNMPVALUE} has been changed|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:snmptrap["(ospfNbrStateChange).*ospfNbrIpAddr[[:space:]]{#SNMPVALUE}[[:space:]].*[[:space:]][a-zA-Z]+[[:space:]]$"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|Load Sensor "{#SNMPVALUE}" is nonoperational|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Load].last()}=3</p><p>**Recovery expression**: </p>|high|
|Load Sensor "{#SNMPVALUE}" is unavailable|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Load].last()}=2</p><p>**Recovery expression**: </p>|average|
|Module "{#SNMPVALUE}" is powered down|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cefcModuleOperStatus["{#SNMPVALUE}","Module"].last()}=15</p><p>**Recovery expression**: </p>|high|
|Module "{#SNMPVALUE}" is unstable [{ITEM.LASTVALUE1}]|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cefcModuleOperStatus["{#SNMPVALUE}","Module"].last()}>3 and {Template_Cisco_7600:cefcModuleOperStatus["{#SNMPVALUE}","Module"].last()}<>15</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is nonoperational|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Temperature].last()}=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is unavailable|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Temperature].last()}=2</p><p>**Recovery expression**: </p>|average|
|Voltage Sensor "{#SNMPVALUE}" is nonoperational|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Voltage].last()}=3</p><p>**Recovery expression**: </p>|high|
|Voltage Sensor "{#SNMPVALUE}" is unavailable|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Voltage].last()}=2</p><p>**Recovery expression**: </p>|average|
|Amperage Sensor "{#SNMPVALUE}" is nonoperational|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Amperage].last()}=3</p><p>**Recovery expression**: </p>|high|
|Amperage Sensor "{#SNMPVALUE}" is unavailable|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Amperage].last()}=2</p><p>**Recovery expression**: </p>|average|
|Status of Fan Tray "{#SNMPVALUE}" is in partial failure|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cefcFanTrayOperStatus["{#SNMPVALUE}","Fan Tray"].last()}=4</p><p>**Recovery expression**: </p>|warning|
|Status of Fan Tray "{#SNMPVALUE}" is powered down|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cefcFanTrayOperStatus["{#SNMPVALUE}","Fan Tray"].last()}=3</p><p>**Recovery expression**: </p>|high|
|High CPU #{#SNMPINDEX} Usage|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cpmCPUTotal5minRev[{#SNMPINDEX}].last()}>95</p><p>**Recovery expression**: </p>|high|
|Status of FAN "{#SNMPVALUE}" is critical|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is non-operable|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of FAN "{#SNMPVALUE}" is not functioning|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is shutdown|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|High utilization of Memory Pool "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoMemoryPoolUsed["{#SNMPVALUE}"].last()}>{Template_Cisco_7600:ciscoMemoryPoolTotal["{#SNMPVALUE}"].last()}*0.9</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is critical|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is non-operable|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of Power Supply "{#SNMPVALUE}" is not functioning|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is shutdown|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:snmptrap["(bgpEstablished|bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:snmptrap["(bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is critical (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is non-operable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of FAN "{#SNMPVALUE}" is not functioning (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is shutdown (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|Status of Power Supply "{#SNMPVALUE}" is critical (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is non-operable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of Power Supply "{#SNMPVALUE}" is not functioning (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is shutdown (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|High utilization of Memory Pool "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:ciscoMemoryPoolUsed["{#SNMPVALUE}"].last()}>{Template_Cisco_7600:ciscoMemoryPoolTotal["{#SNMPVALUE}"].last()}*0.9</p><p>**Recovery expression**: </p>|average|
|High CPU #{#SNMPINDEX} Usage (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cpmCPUTotal5minRev[{#SNMPINDEX}].last()}>95</p><p>**Recovery expression**: </p>|high|
|Amperage Sensor "{#SNMPVALUE}" is nonoperational (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Amperage].last()}=3</p><p>**Recovery expression**: </p>|high|
|Amperage Sensor "{#SNMPVALUE}" is unavailable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Amperage].last()}=2</p><p>**Recovery expression**: </p>|average|
|Status of Fan Tray "{#SNMPVALUE}" is in partial failure (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cefcFanTrayOperStatus["{#SNMPVALUE}","Fan Tray"].last()}=4</p><p>**Recovery expression**: </p>|warning|
|Status of Fan Tray "{#SNMPVALUE}" is powered down (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cefcFanTrayOperStatus["{#SNMPVALUE}","Fan Tray"].last()}=3</p><p>**Recovery expression**: </p>|high|
|Load Sensor "{#SNMPVALUE}" is nonoperational (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Load].last()}=3</p><p>**Recovery expression**: </p>|high|
|Load Sensor "{#SNMPVALUE}" is unavailable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Load].last()}=2</p><p>**Recovery expression**: </p>|average|
|Module "{#SNMPVALUE}" is powered down (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cefcModuleOperStatus["{#SNMPVALUE}","Module"].last()}=15</p><p>**Recovery expression**: </p>|high|
|Module "{#SNMPVALUE}" is unstable [{ITEM.LASTVALUE1}] (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:cefcModuleOperStatus["{#SNMPVALUE}","Module"].last()}>3 and {Template_Cisco_7600:cefcModuleOperStatus["{#SNMPVALUE}","Module"].last()}<>15</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is nonoperational (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Temperature].last()}=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor "{#SNMPVALUE}" is unavailable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Temperature].last()}=2</p><p>**Recovery expression**: </p>|average|
|Voltage Sensor "{#SNMPVALUE}" is nonoperational (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Voltage].last()}=3</p><p>**Recovery expression**: </p>|high|
|Voltage Sensor "{#SNMPVALUE}" is unavailable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:entSensorStatus["{#SNMPVALUE}",Voltage].last()}=2</p><p>**Recovery expression**: </p>|average|
|OSPF Interface "{#SNMPVALUE}" State has been changed (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:snmptrap["ospfIfStateChange.+ospfIfIpAddress[[:space:]]{#SNMPVALUE}[[:space:]].+ospfIfState[[:space:]][a-zA-Z]+"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Neighbor {#SNMPVALUE} has been changed (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7600:snmptrap["(ospfNbrStateChange).*ospfNbrIpAddr[[:space:]]{#SNMPVALUE}[[:space:]].*[[:space:]][a-zA-Z]+[[:space:]]$"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|


# Template_Cisco_Traps

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP Peer State|<p>BGP4-MIB::bgpPeerState CISCO-BGP4-MIB::cbgpPeer2State The BGP peer connection state.</p>|`SNMP trap`|snmptrap["bgpPeerState|cbgpPeer2State"]<p>Update: 0</p>|
|LSA has been originated|<p>OSPF-TRAP-MIB::ospfOriginateLsa</p>|`SNMP trap`|snmptrap["ospfOriginateLsa"]<p>Update: 0</p>|
|Source of Command|<p>-</p>|`SNMP trap`|snmptrap["ccmHistoryEventCommandSource"]<p>Update: 0</p>|
|OSPF Interface State|<p>OSPF-MIB::ospfIfState The OSPF Interface State.</p>|`SNMP trap`|snmptrap["ospfIfState"]<p>Update: 0</p>|
|OSPF neighbour state|<p>1 : down 2 : attempt 3 : init 4 : twoWay 5 : exchangeStart 6 : exchange 7 : loading 8 : full</p>|`SNMP trap`|snmptrap["ospfNbrStateChange.*ospfNbrState[[:space:]]"]<p>Update: 0</p>|
|SSH Sessions|<p>CISCO-SECURE-SHELL-MIB::cssSessionHostAddr</p>|`SNMP trap`|snmptrap["cssSessionHostAddr"]<p>Update: 0</p>|
|Type of remote session|<p>-</p>|`SNMP trap`|snmptrap["tslineSesType"]<p>Update: 0</p>|
|LSA aged to MaxAge|<p>-</p>|`SNMP trap`|snmptrap["ospfMaxAgeLsa"]<p>Update: 0</p>|
|Status of Attack Filter|<p>-</p>|`SNMP trap`|snmptrap["cscaFilterStatus"]<p>Update: 0</p>|
|BFD Sessions|<p>CISCO-IETF-BFD-MIB::ciscoBfdSessDown and ciscoBfdSessUp</p>|`SNMP trap`|snmptrap["ciscoBfdSess(Up|Down)"]<p>Update: 0</p>|
|MPLS L3 State|<p>MPLS-L3VPN-STD-MIB::mplsL3VpnVrfUp MPLS-L3VPN-STD-MIB::mplsL3VpnVrfDown</p>|`SNMP trap`|snmptrap["mplsL3VpnVrf[Up|Down]"]<p>Update: 0</p>|
|Attack Filter changes|<p>The system generates this notification to indicate that the cscaFilterStatus of the attack filter for cscaType has changed due to the reason determined by cscaDescription. The system limits the generation of this notifications for the same cscaType to a five-second interval.</p>|`SNMP trap`|snmptrap["cscaFilterChange"]<p>Update: 0</p>|
|OSP TX Retransmits|<p>-</p>|`SNMP trap`|snmptrap["ospfTxRetransmit"]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

