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


# Template_Cisco_7200

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
|Temperature|<p>CISCO-ENVMON-MIB::ciscoEnvMonTemperatureStatusDescr Textual description of the testpoint being instrumented.</p>|`SNMP agent`|ciscoEnvMonTemperatureStatusDescr<p>Update: 300</p>|
|Voltage|<p>CISCO-ENVMON-MIB::ciscoEnvMonVoltageStatusDescr Textual description of the testpoint being instrumented.</p>|`SNMP agent`|ciscoEnvMonVoltageStatusDescr<p>Update: 300</p>|
|Flash Devices|<p>CISCO-FLASH-MIB::ciscoFlashDeviceDescr Description of a Flash device. The description is meant to explain what the Flash device and its purpose is. Current values are: System flash - for the primary Flash used to store full system images. Boot flash - for the secondary Flash used to store bootstrap images. The device description will always be available for a removable device, even when the device has been removed.</p>|`SNMP agent`|ciscoFlashDeviceDescr<p>Update: 300</p>|
|Memory Pool|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolName A textual name assigned to the memory pool.</p>|`SNMP agent`|ciscoMemoryPoolName<p>Update: 300</p>|
|CPU|<p>CISCO-PROCESS-MIB::cpmCPUTotalPhysicalIndex The entPhysicalIndex of the physical entity for which the CPU statistics in this entry are maintained. The physical entity can be a CPU chip, a group of CPUs, a CPU card etc. The exact type of this entity is described by its entPhysicalVendorType value. If the CPU statistics in this entry correspond to more than one physical entity (or to no physical entity), or if the entPhysicalTable is not supported on the SNMP agent, the value of this object must be zero.</p>|`SNMP agent`|cpmCPUTotalPhysicalIndex<p>Update: 300</p>|
|OSPF Interfaces|<p>OSPF-MIB::ospfIfIpAddress The IP address of this OSPF interface.</p>|`SNMP agent`|ospfIfIpAddress<p>Update: 300</p>|
|OSPF Neighbors|<p>OSPF-MIB::ospfNbrIpAddr The IP address this neighbor is using in its IP source address. Note that, on addressless links, this will not be 0.0.0.0 but the address of another of the neighbor's interfaces.</p>|`SNMP agent`|ospfNbrIpAddr<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|snmptrap (OSPF Neighbor Up/Down)|<p>-</p>|`SNMP trap`|snmptrap[1.3.6.1.2.1.14.16.2.2]<p>Update: 0</p>|
|snmptrap (BGP Neighbor Up/Down)|<p>-</p>|`SNMP trap`|snmptrap[1.3.6.1.2.1.15.3.1.2|1.3.6.1.4.1.9.9.187.1.2.5.1.3]<p>Update: 0</p>|
|snmptrap (IF Down)|<p>-</p>|`SNMP trap`|snmptrap[.1.3.6.1.6.3.1.1.5.3]<p>Update: 0</p>|
|snmptrap (IF Up)|<p>-</p>|`SNMP trap`|snmptrap[.1.3.6.1.6.3.1.1.5.4]<p>Update: 0</p>|
|BGP Peer "{#SNMPINDEX}" State|<p>-</p>|`SNMP trap`|snmptrap["(bgpEstablished|bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState\.{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"]<p>Update: 0</p><p>LLD</p>|
|BGP Peer "{#SNMPINDEX}" State|<p>-</p>|`SNMP trap`|snmptrap["(bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState\.{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"]<p>Update: 0</p><p>LLD</p>|
|Status of FAN "$1"|<p>CISCO-ENVMON-MIB::ciscoEnvMonFanState The current state of the fan being instrumented.</p>|`SNMP agent`|ciscoEnvMonFanState["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Status of Power Supply "$1"|<p>CISCO-ENVMON-MIB::ciscoEnvMonSupplyState The current state of the power supply being instrumented.</p>|`SNMP agent`|ciscoEnvMonSupplyState["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Status of Temperature "{#SNMPVALUE}"|<p>CISCO-ENVMON-MIB::ciscoEnvMonTemperatureState The current state of the testpoint being instrumented.</p>|`SNMP agent`|ciscoEnvMonTemperatureState["{#SNMPVALUE}"]<p>Update: 30</p><p>LLD</p>|
|Threshold of Temperature "{#SNMPVALUE}"|<p>CISCO-ENVMON-MIB::ciscoEnvMonTemperatureThreshold The highest value that the associated instance of the object ciscoEnvMonTemperatureStatusValue may obtain before an emergency shutdown of the managed device is initiated.</p>|`SNMP agent`|ciscoEnvMonTemperatureThreshold["{#SNMPVALUE}"]<p>Update: 3600</p><p>LLD</p>|
|Value of Temperature "{#SNMPVALUE}"|<p>CISCO-ENVMON-MIB::ciscoEnvMonTemperatureStatusValue The current measurement of the testpoint being instrumented.</p>|`SNMP agent`|ciscoEnvMonTemperatureStatusValue["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|High Threshold of Voltage "$1"|<p>CISCO-ENVMON-MIB::ciscoEnvMonVoltageThresholdHigh The highest value that the associated instance of the object ciscoEnvMonVoltageStatusValue may obtain before an emergency shutdown of the managed device is initiated.</p>|`SNMP agent`|ciscoEnvMonVoltageThresholdHigh["{#SNMPVALUE}"]<p>Update: 3600</p><p>LLD</p>|
|Low Threshold of Voltage "$1"|<p>CISCO-ENVMON-MIB::ciscoEnvMonVoltageThresholdLow The lowest value that the associated instance of the object ciscoEnvMonVoltageStatusValue may obtain before an emergency shutdown of the managed device is initiated.</p>|`SNMP agent`|ciscoEnvMonVoltageThresholdLow["{#SNMPVALUE}"]<p>Update: 3600</p><p>LLD</p>|
|Status of Voltage "$1"|<p>CISCO-ENVMON-MIB::ciscoEnvMonVoltageState The current state of the testpoint being instrumented.</p>|`SNMP agent`|ciscoEnvMonVoltageState["{#SNMPVALUE}"]<p>Update: 30</p><p>LLD</p>|
|Value of Voltage "$1"|<p>-</p>|`SNMP agent`|ciscoEnvMonVoltageStatusValue["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Size of Flash Device "$1"|<p>CISCO-FLASH-MIB::ciscoFlashDeviceSize Total size of the Flash device. For a removable device, the size will be zero if the device has been removed.</p>|`SNMP agent`|ciscoFlashDeviceSize["{#SNMPVALUE}"]<p>Update: 3600</p><p>LLD</p>|
|Free memory on Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolFree Indicates the number of bytes from the memory pool that are currently unused on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolFree["{#SNMPVALUE}"]<p>Update: 60</p><p>LLD</p>|
|Name of Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolName A textual name assigned to the memory pool.</p>|`SNMP agent`|ciscoMemoryPoolName["{#SNMPVALUE}"]<p>Update: 3600</p><p>LLD</p>|
|Total Memory Pool "$1"|<p>-</p>|`Calculated`|ciscoMemoryPoolTotal["{#SNMPVALUE}"]<p>Update: 3600</p><p>LLD</p>|
|Used memory on Memory Pool "$1"|<p>CISCO-MEMORY-POOL-MIB::ciscoMemoryPoolUsed Indicates the number of bytes from the memory pool that are currently in use by applications on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolUsed["{#SNMPVALUE}"]<p>Update: 300</p><p>LLD</p>|
|CPU #$1 Usage 1min Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal1minRev The overall CPU busy percentage in the last 1 minute period. This object deprecates the object cpmCPUTotal1min and increases the value range to (0..100).</p>|`SNMP agent`|cpmCPUTotal1minRev[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|CPU #$1 Usage 5min Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal5minRev The overall CPU busy percentage in the last 5 minute period. This object deprecates the object cpmCPUTotal5min and increases the value range to (0..100).</p>|`SNMP agent`|cpmCPUTotal5minRev[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|CPU #$1 Usage 5sec Rev|<p>CISCO-PROCESS-MIB::cpmCPUTotal5secRev The overall CPU busy percentage in the last 5 second period. This object deprecates the object cpmCPUTotal5sec and increases the value range to (0..100). This object is deprecated by cpmCPUTotalMonIntervalValue.</p>|`SNMP agent`|cpmCPUTotal5secRev[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|OSPF Interface "{SNMPVALUE}" State|<p>-</p>|`SNMP trap`|snmptrap["ospfIfStateChange.+ospfIfIpAddress[[:space:]]{#SNMPVALUE}[[:space:]].+ospfIfState[[:space:]][a-zA-Z]+"]<p>Update: 0</p><p>LLD</p>|
|OSPF "{#SNMPVALUE}" Neighbour State|<p>-</p>|`SNMP trap`|snmptrap["(ospfNbrStateChange).*ospfNbrIpAddr[[:space:]]{#SNMPVALUE}[[:space:]].*[[:space:]][a-zA-Z]+[[:space:]]$"]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:snmptrap["(bgpEstablished|bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:snmptrap["(bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Interface "{#SNMPVALUE}" State has been changed|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:snmptrap["ospfIfStateChange.+ospfIfIpAddress[[:space:]]{#SNMPVALUE}[[:space:]].+ospfIfState[[:space:]][a-zA-Z]+"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Neighbor {#SNMPVALUE} has been changed|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:snmptrap["(ospfNbrStateChange).*ospfNbrIpAddr[[:space:]]{#SNMPVALUE}[[:space:]].*[[:space:]][a-zA-Z]+[[:space:]]$"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|High CPU #{#SNMPINDEX} Usage|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:cpmCPUTotal5minRev[{#SNMPINDEX}].last()}>95</p><p>**Recovery expression**: </p>|high|
|Status of FAN "{#SNMPVALUE}" is critical|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is non-operable|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of FAN "{#SNMPVALUE}" is not functioning|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is shutdown|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|High utilization of Memory Pool "{#SNMPVALUE}"|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoMemoryPoolUsed["{#SNMPVALUE}"].last()}>{Template_Cisco_7200:ciscoMemoryPoolTotal["{#SNMPVALUE}"].last()}*0.9</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is critical|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is non-operable|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of Power Supply "{#SNMPVALUE}" is not functioning|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is shutdown|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|Status of Temperature "{#SNMPVALUE}" is critical|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonTemperatureState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of Temperature "{#SNMPVALUE}" is non-operable|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonTemperatureState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of Temperature "{#SNMPVALUE}" is not functioning|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonTemperatureState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of Temperature "{#SNMPVALUE}" is shutdown|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonTemperatureState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|Status of Voltage "{#SNMPVALUE}" is critical|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonVoltageState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of Voltage "{#SNMPVALUE}" is non-operable|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonVoltageState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of Voltage "{#SNMPVALUE}" is not functioning|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonVoltageState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of Voltage "{#SNMPVALUE}" is shutdown|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonVoltageState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:snmptrap["(bgpEstablished|bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|BGP Peer "{#SNMPINDEX}"->"{#SNMPVALUE}" State changed (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:snmptrap["(bgpBackwardTransition|cbgpFsmStateChange).*bgpPeerState .{#SNMPINDEX}[[:space:]][a-zA-Z]+[[:space:]]"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is critical (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is non-operable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of FAN "{#SNMPVALUE}" is not functioning (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of FAN "{#SNMPVALUE}" is shutdown (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonFanState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|Status of Power Supply "{#SNMPVALUE}" is critical (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is non-operable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of Power Supply "{#SNMPVALUE}" is not functioning (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of Power Supply "{#SNMPVALUE}" is shutdown (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonSupplyState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|Status of Temperature "{#SNMPVALUE}" is critical (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonTemperatureState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of Temperature "{#SNMPVALUE}" is non-operable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonTemperatureState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of Temperature "{#SNMPVALUE}" is not functioning (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonTemperatureState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of Temperature "{#SNMPVALUE}" is shutdown (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonTemperatureState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|Status of Voltage "{#SNMPVALUE}" is critical (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonVoltageState["{#SNMPVALUE}"].last()}=3</p><p>**Recovery expression**: </p>|average|
|Status of Voltage "{#SNMPVALUE}" is non-operable (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonVoltageState["{#SNMPVALUE}"].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Status of Voltage "{#SNMPVALUE}" is not functioning (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonVoltageState["{#SNMPVALUE}"].last()}=6</p><p>**Recovery expression**: </p>|average|
|Status of Voltage "{#SNMPVALUE}" is shutdown (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoEnvMonVoltageState["{#SNMPVALUE}"].last()}=4</p><p>**Recovery expression**: </p>|high|
|High utilization of Memory Pool "{#SNMPVALUE}" (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:ciscoMemoryPoolUsed["{#SNMPVALUE}"].last()}>{Template_Cisco_7200:ciscoMemoryPoolTotal["{#SNMPVALUE}"].last()}*0.9</p><p>**Recovery expression**: </p>|average|
|High CPU #{#SNMPINDEX} Usage (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:cpmCPUTotal5minRev[{#SNMPINDEX}].last()}>95</p><p>**Recovery expression**: </p>|high|
|OSPF Interface "{#SNMPVALUE}" State has been changed (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:snmptrap["ospfIfStateChange.+ospfIfIpAddress[[:space:]]{#SNMPVALUE}[[:space:]].+ospfIfState[[:space:]][a-zA-Z]+"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|
|OSPF Neighbor {#SNMPVALUE} has been changed (LLD)|<p>-</p>|<p>**Expression**: {Template_Cisco_7200:snmptrap["(ospfNbrStateChange).*ospfNbrIpAddr[[:space:]]{#SNMPVALUE}[[:space:]].*[[:space:]][a-zA-Z]+[[:space:]]$"].nodata(10m)}=0</p><p>**Recovery expression**: </p>|average|


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

