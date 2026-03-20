# Cisco ASA 515

## Overview

Cisco ASA 515



## Author

leonardog50

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|EtherLike-MIB Discovery|<p>Discovering interfaces from IF-MIB and EtherLike-MIB. Interfaces with up(1) Operational Status are discovered.</p>|`SNMP agent`|net.if.duplex.discovery<p>Update: 30s</p>|
|Temperature Discovery|<p>Discovery of ciscoEnvMonTemperatureTable (ciscoEnvMonTemperatureDescr), a table of ambient temperature status maintained by the environmental monitor.</p>|`SNMP agent`|temperature.discovery<p>Update: 30s</p>|
|CPU Discovery|<p>If your IOS device has several CPUs, you must use CISCO-PROCESS-MIB and its object cpmCPUTotal5minRev from the table called cpmCPUTotalTable , indexed with cpmCPUTotalIndex . This table allows CISCO-PROCESS-MIB to keep CPU statistics for different physical entities in the router, like different CPU chips, group of CPUs, or CPUs in different modules/cards. In case of a single CPU, cpmCPUTotalTable has only one entry.</p>|`SNMP agent`|cpu.discovery<p>Update: 10s</p>|
|ASA Interfaces discovery|<p>-</p>|`SNMP agent`|ifDescr<p>Update: 3600</p>|
|FAN Discovery|<p>The table of fan status maintained by the environmental monitor.</p>|`SNMP agent`|fan.discovery<p>Update: 30s</p>|
|Entity Serial Numbers Discovery|<p>-</p>|`SNMP agent`|entity_sn.discovery<p>Update: 30s</p>|
|PSU Discovery|<p>The table of power supply status maintained by the environmental monitor card.</p>|`SNMP agent`|psu.discovery<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|sysContact|<p>-</p>|`SNMP agent`|sysContact.<p>Update: 300</p>|
|CPU 1 avgBusy1|<p>-</p>|`SNMP agent`|avgBusy1<p>Update: 60s</p>|
|IOS Version|<p>-</p>|`SNMP agent`|ciscoIOS<p>Update: 3600</p>|
|Port asa_mgmt_plane Interface|<p>-</p>|`SNMP agent`|ifDescr.2<p>Update: 10s</p>|
|sysLocation|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 300</p>|
|ICMP response time|<p>-</p>|`Simple check`|icmppingsec<p>Update: 60</p>|
|CPU Loading 1 Minutes|<p>-</p>|`SNMP agent`|cMTSystemMetricCpuOneMinuteUtilization<p>Update: 10s</p>|
|CPU Loading Total 1 Minutes|<p>-</p>|`SNMP agent`|cpmcpuTOTAL1min<p>Update: 60s</p>|
|Interface Inside WAN - Traffic In|<p>-</p>|`SNMP agent`|ifInOctets.3<p>Update: 10s</p>|
|Model Name|<p>-</p>|`SNMP agent`|deviceModel<p>Update: 3600</p>|
|ASA CPU utilization|<p>MIB: OLD-CISCO-CPU-MIB 5 minute exponentially-decayed moving average of the CPU busy percentage. Reference: http://www.cisco.com/c/en/us/support/docs/ip/simple-network-management-protocol-snmp/15215-collect-cpu-util-snmp.html</p>|`SNMP agent`|system.cpu.util[avgBusy5]<p>Update: 30s</p>|
|CPU utilization|<p>MIB: FOUNDRY-SN-AGENT-MIB The statistics collection of 1 minute CPU utilization.</p>|`SNMP agent`|system.cpu.util[snAgGblCpuUtil1MinAvg.0]<p>Update: 30s</p>|
|Administrative State Of Inside Status - MGMT|<p>-</p>|`SNMP agent`|ifAdminStatus.2<p>Update: 10s</p>|
|cpmCPUTotalPhysicalIndex|<p>-</p>|`SNMP agent`|cpmCPUTotalPhysicalIndex<p>Update: 30s</p>|
|Port DMZ2 Interface|<p>-</p>|`SNMP agent`|ifDescr.6<p>Update: 10s</p>|
|Operating system|<p>MIB: SNMPv2-MIB</p>|`SNMP agent`|system.sw.os<p>Update: 30s</p>|
|Operational State of Inside Interface - MGMT|<p>-</p>|`SNMP agent`|ifOperStatus.2<p>Update: 10s</p>|
|Interface Outside DMZ - Traffic In|<p>-</p>|`SNMP agent`|ifInOctets.4<p>Update: 10s</p>|
|Port LAN Interface|<p>-</p>|`SNMP agent`|ifDescr.5<p>Update: 10s</p>|
|Memory utilization|<p>MIB: FOUNDRY-SN-AGENT-MIB The system dynamic memory utilization, in unit of percentage. Deprecated: Refer to snAgSystemDRAMUtil. For NI platforms, refer to snAgentBrdMemoryUtil100thPercent</p>|`SNMP agent`|vm.memory.pused[snAgGblDynMemUtil.0]<p>Update: 30s</p>|
|CPU Utilization avg last 5 min|<p>-</p>|`SNMP agent`|cpmCPUTotal5minRev<p>Update: 300s</p>|
|Interface Inside asa_mgmt_plane - Traffic In|<p>-</p>|`SNMP agent`|ifInOctets.2<p>Update: 10s</p>|
|SNMP availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 30s</p>|
|Memory Free|<p>-</p>|`SNMP agent`|ciscoMemoryPoolFree<p>Update: 60</p>|
|Hardware model name|<p>MIB: ENTITY-MIB</p>|`SNMP agent`|system.hw.model<p>Update: 30s</p>|
|ROMMON Versoin|<p>-</p>|`SNMP agent`|ciscoROMMON<p>Update: 3600</p>|
|ICMP Ping|<p>-</p>|`Simple check`|icmpping<p>Update: 10s</p>|
|CPU Utilization avg last 5 sec|<p>-</p>|`SNMP agent`|cpmCPUTotal5secRev<p>Update: 5s</p>|
|Operational State of DMZ2 Interface|<p>-</p>|`SNMP agent`|ifOperStatus.6<p>Update: 10s</p>|
|Memory Usage|<p>-</p>|`Calculated`|ciscoMemUsage<p>Update: 60</p>|
|Port WAN Interface|<p>-</p>|`SNMP agent`|ifDescr.3<p>Update: 10s</p>|
|Memory Pool Largest Free|<p>-</p>|`SNMP agent`|ciscoMemoryPoolLargestFree<p>Update: 60</p>|
|Overall CPU busy percentage in the last 5 minute period|<p>-</p>|`SNMP agent`|cpmCPUTotal5min<p>Update: 300s</p>|
|Interface Inside DMZ2 - Traffic In|<p>-</p>|`SNMP agent`|ifInOctets.6<p>Update: 10s</p>|
|Administrative State Of LAN Status|<p>-</p>|`SNMP agent`|ifAdminStatus.5<p>Update: 10s</p>|
|Port DMZ Interface|<p>-</p>|`SNMP agent`|ifDescr.4<p>Update: 10s</p>|
|Administrative State Of Outsid Status - DMZ2|<p>-</p>|`SNMP agent`|ifAdminStatus.6<p>Update: 10s</p>|
|agentCurrentCPUUtilization|<p>-</p>|`SNMP agent`|agentCurrentCPUUtilization<p>Update: 10s</p>|
|Interface LAN - Traffic Out|<p>-</p>|`SNMP agent`|ifOutOctets.5<p>Update: 10s</p>|
|Hardware serial number|<p>MIB: ENTITY-MIB</p>|`SNMP agent`|system.hw.serialnumber<p>Update: 30s</p>|
|Operational State of LAN Interface|<p>-</p>|`SNMP agent`|ifOperStatus.5<p>Update: 10s</p>|
|Operational State of Outside Interface - DMZ|<p>-</p>|`SNMP agent`|ifOperStatus.4<p>Update: 10s</p>|
|Memory Used|<p>-</p>|`SNMP agent`|ciscoMemoryPoolUsed<p>Update: 60</p>|
|Interface Outside DMZ - Traffic Out|<p>-</p>|`SNMP agent`|ifOutOctets.4<p>Update: 10s</p>|
|snmpInPkts - Pacotes Entrada|<p>-</p>|`SNMP agent`|snmpInPkts<p>Update: 300</p>|
|CPU Utilization avg last 5 sec|<p>-</p>|`SNMP agent`|cpmCPUMonIntervalValue<p>Update: 60</p>|
|Chassis Version|<p>-</p>|`SNMP agent`|deviceChassis<p>Update: 3600</p>|
|CPU Utilization avg last 1 min|<p>-</p>|`SNMP agent`|cpmCPUTotal1minRev<p>Update: 60</p>|
|Temperatura CPU|<p>-</p>|`SNMP agent`|alHardwareCpuTemp<p>Update: 10s</p>|
|Interface LAN - Trafic In|<p>-</p>|`SNMP agent`|ifInOctets.5<p>Update: 10s</p>|
|Administrative State Of Outsid Status - DMZ|<p>-</p>|`SNMP agent`|ifAdminStatus.4<p>Update: 10s</p>|
|sysUpTime|<p>-</p>|`SNMP agent`|sysUpTimeInstance<p>Update: 300</p>|
|cLApCpuAverageUsage|<p>"This object indicates the percent of average CPU usage of the access point. The statistics window is defined by clsSysStatisticsInterval."</p>|`SNMP agent`|cLApCpuAverageUsage<p>Update: 10s</p>|
|ICMP loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 60</p>|
|Active IKE Peers|<p>-</p>|`SNMP agent`|ciscoIKEPeers<p>Update: 60</p>|
|CPU Loading Total 5 Minutes|<p>-</p>|`SNMP agent`|cpmcpuTOTAL5min<p>Update: 300s</p>|
|Interface Inside  DMZ2 - Traffic Out|<p>-</p>|`SNMP agent`|ifOutOctets.6<p>Update: 10s</p>|
|Description|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|Administrative State Of Inside Status - WAN|<p>-</p>|`SNMP agent`|ifAdminStatus.3<p>Update: 10s</p>|
|Chassis Serial Number|<p>-</p>|`SNMP agent`|deviceSerialNum<p>Update: 3600</p>|
|snmpOutPkts - Pacotes Saida|<p>-</p>|`SNMP agent`|snmpOutPkts<p>Update: 300</p>|
|sysName|<p>-</p>|`SNMP agent`|sysName<p>Update: 300</p>|
|Interface Inside asa_mgmt_plane - Traffic Out|<p>-</p>|`SNMP agent`|ifOutOctets.2<p>Update: 10s</p>|
|Vendor Name|<p>-</p>|`SNMP agent`|deviceVendor<p>Update: 3600</p>|
|Operational State of Inside Interface - WAN|<p>-</p>|`SNMP agent`|ifOperStatus.3<p>Update: 10s</p>|
|Memoty Total|<p>-</p>|`Calculated`|ciscoMemoryTotal<p>Update: 3600</p>|
|CPU Utilization avg last 5 m|<p>-</p>|`SNMP agent`|avgBusy5<p>Update: 300s</p>|
|Interface Inside  WAN - Traffic Out|<p>-</p>|`SNMP agent`|ifOutOctets.3<p>Update: 10s</p>|
|Number of network interfaces|<p>The number of network interfaces (regardless of their current state) present on this system.</p>|`SNMP agent`|ifNumber<p>Update: 3600</p>|
|Carga CPU|<p>"The value of the CPU Utilization gauge which indicates percentage of CPU utilized."</p>|`SNMP agent`|alGeneralGaugeCpuUtil<p>Update: 10s</p>|
|Interface {#IFNAME}({#IFALIAS}): Duplex status|<p>MIB: EtherLike-MIB The current mode of operation of the MAC entity. 'unknown' indicates that the current duplex mode could not be determined. Management control of the duplex mode is accomplished through the MAU MIB. When an interface does not support autonegotiation, or when autonegotiation is not enabled, the duplex mode is controlled using ifMauDefaultType. When autonegotiation is supported and enabled, duplex mode is controlled using ifMauAutoNegAdvertisedBits. In either case, the currently operating duplex mode is reflected both in this object and in ifMauType. Note that this object provides redundant information with ifMauType. Normally, redundant objects are discouraged. However, in this instance, it allows a management application to determine the duplex status of an interface without having to know every possible value of ifMauType. This was felt to be sufficiently valuable to justify the redundancy. Reference: [IEEE 802.3 Std.], 30.3.1.1.32,aDuplexStatus.</p>|`SNMP agent`|net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE}: Temperature status|<p>MIB: CISCO-ENVMON-MIB The current state of the test point being instrumented.</p>|`SNMP agent`|sensor.temp.status[ciscoEnvMonTemperatureState.{#SNMPINDEX}]<p>Update: 180s</p><p>LLD</p>|
|{#SNMPVALUE}: Temperature|<p>MIB: CISCO-ENVMON-MIB The current measurement of the test point being instrumented.</p>|`SNMP agent`|sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}]<p>Update: 180s</p><p>LLD</p>|
|{#SNMPVALUE}: CPU utilization|<p>MIB: CISCO-PROCESS-MIB The overall CPU busy percentage in the last 5 minute period. This object deprecates the avgBusy5 object from the OLD-CISCO-SYSTEM-MIB. This object is deprecated by cpmCPUTotal5minRev which has the changed range of value (0..100) Reference: http://www.cisco.com/c/en/us/support/docs/ip/simple-network-management-protocol-snmp/15215-collect-cpu-util-snmp.html</p>|`SNMP agent`|system.cpu.util[cpmCPUTotal5min.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
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
|{#SENSOR_INFO}: Fan status|<p>MIB: CISCO-ENVMON-MIB</p>|`SNMP agent`|sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#ENT_NAME}: Hardware serial number|<p>MIB: ENTITY-MIB</p>|`SNMP agent`|system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SENSOR_INFO}: Power supply status|<p>MIB: CISCO-ENVMON-MIB</p>|`SNMP agent`|sensor.psu.status[ciscoEnvMonSupplyState.{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#SNMPVALUE}: High CPU utilization|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: {Cisco ASA 515:system.cpu.util[cpmCPUTotal5min.{#SNMPINDEX}].avg(5m)}>{$CPU_UTIL_MAX}</p><p>**Recovery expression**: </p>|high|
|{#ENT_NAME}: Device has been replaced (new serial number received)|<p>Last value: {ITEM.LASTVALUE1}. Device serial number has changed. Ack to close</p>|<p>**Expression**: {Cisco ASA 515:system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}].diff()}=1 and {Cisco ASA 515:system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}].strlen()}>0</p><p>**Recovery expression**: </p>|information|
|{#SENSOR_INFO}: Fan is in critical state|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: {Cisco ASA 515:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_CRIT_STATUS:"critical"},eq)}=1 or {Cisco ASA 515:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_CRIT_STATUS:"shutdown"},eq)}=1</p><p>**Recovery expression**: </p>|disaster|
|{#SENSOR_INFO}: Fan is in warning state|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: {Cisco ASA 515:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_WARN_STATUS:"warning"},eq)}=1 or {Cisco ASA 515:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_WARN_STATUS:"notFunctioning"},eq)}=1</p><p>**Recovery expression**: </p>|warning|
|Errors on {#SNMPVALUE}|<p>More than 100 in/out errors detected on {#SNMPVALUE}</p>|<p>**Expression**: {Cisco ASA 515:ifInErrors[{#SNMPVALUE}].last(0)}>100 or {Cisco ASA 515:ifOutErrors[{#SNMPVALUE}].last(0)}>100</p><p>**Recovery expression**: </p>|warning|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode|<p>Last value: {ITEM.LASTVALUE1}. Please check autonegotiation settings and cabling</p>|<p>**Expression**: {Cisco ASA 515:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|high|
|{#SENSOR_INFO}: Power supply is in critical state|<p>Last value: {ITEM.LASTVALUE1}. Please check the power supply unit for errors</p>|<p>**Expression**: {Cisco ASA 515:sensor.psu.status[ciscoEnvMonSupplyState.{#SNMPINDEX}].count(#1,{$PSU_CRIT_STATUS:"critical"},eq)}=1 or {Cisco ASA 515:sensor.psu.status[ciscoEnvMonSupplyState.{#SNMPINDEX}].count(#1,{$PSU_CRIT_STATUS:"shutdown"},eq)}=1</p><p>**Recovery expression**: </p>|disaster|
|{#SENSOR_INFO}: Power supply is in warning state|<p>Last value: {ITEM.LASTVALUE1}. Please check the power supply unit for errors</p>|<p>**Expression**: {Cisco ASA 515:sensor.psu.status[ciscoEnvMonSupplyState.{#SNMPINDEX}].count(#1,{$PSU_WARN_STATUS:"warning"},eq)}=1 or {Cisco ASA 515:sensor.psu.status[ciscoEnvMonSupplyState.{#SNMPINDEX}].count(#1,{$PSU_WARN_STATUS:"notFunctioning"},eq)}=1</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:""}|<p>Last value: {ITEM.LASTVALUE1}. This trigger uses temperature sensor values as well as temperature sensor status if available</p>|<p>**Expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].avg(5m)}>{$TEMP_CRIT:""} or {Cisco ASA 515:sensor.temp.status[ciscoEnvMonTemperatureState.{#SNMPINDEX}].last(0)}={$TEMP_CRIT_STATUS} or {Cisco ASA 515:sensor.temp.status[ciscoEnvMonTemperatureState.{#SNMPINDEX}].last(0)}={$TEMP_DISASTER_STATUS}</p><p>**Recovery expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].max(5m)}<{$TEMP_CRIT:""}-3</p>|disaster|
|{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:""}|<p>Last value: {ITEM.LASTVALUE1}. This trigger uses temperature sensor values as well as temperature sensor status if available</p>|<p>**Expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].avg(5m)}>{$TEMP_WARN:""} or {Cisco ASA 515:sensor.temp.status[ciscoEnvMonTemperatureState.{#SNMPINDEX}].last(0)}={$TEMP_WARN_STATUS}</p><p>**Recovery expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].max(5m)}<{$TEMP_WARN:""}-3</p>|warning|
|{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:""}|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].avg(5m)}<{$TEMP_CRIT_LOW:""}</p><p>**Recovery expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].min(5m)}>{$TEMP_CRIT_LOW:""}+3</p>|average|
|Interface {#IFNAME}({#IFALIAS}): In half-duplex mode (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check autonegotiation settings and cabling</p>|<p>**Expression**: {Cisco ASA 515:net.if.duplex[dot3StatsDuplexStatus.{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:""} (LLD)|<p>Last value: {ITEM.LASTVALUE1}. This trigger uses temperature sensor values as well as temperature sensor status if available</p>|<p>**Expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].avg(5m)}>{$TEMP_CRIT:""} or {Cisco ASA 515:sensor.temp.status[ciscoEnvMonTemperatureState.{#SNMPINDEX}].last(0)}={$TEMP_CRIT_STATUS} or {Cisco ASA 515:sensor.temp.status[ciscoEnvMonTemperatureState.{#SNMPINDEX}].last(0)}={$TEMP_DISASTER_STATUS}</p><p>**Recovery expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].max(5m)}<{$TEMP_CRIT:""}-3</p>|disaster|
|{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:""} (LLD)|<p>Last value: {ITEM.LASTVALUE1}. This trigger uses temperature sensor values as well as temperature sensor status if available</p>|<p>**Expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].avg(5m)}>{$TEMP_WARN:""} or {Cisco ASA 515:sensor.temp.status[ciscoEnvMonTemperatureState.{#SNMPINDEX}].last(0)}={$TEMP_WARN_STATUS}</p><p>**Recovery expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].max(5m)}<{$TEMP_WARN:""}-3</p>|warning|
|{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:""} (LLD)|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].avg(5m)}<{$TEMP_CRIT_LOW:""}</p><p>**Recovery expression**: {Cisco ASA 515:sensor.temp.value[ciscoEnvMonTemperatureValue.{#SNMPINDEX}].min(5m)}>{$TEMP_CRIT_LOW:""}+3</p>|average|
|{#SNMPVALUE}: High CPU utilization (LLD)|<p>Last value: {ITEM.LASTVALUE1}.</p>|<p>**Expression**: {Cisco ASA 515:system.cpu.util[cpmCPUTotal5min.{#SNMPINDEX}].avg(5m)}>{$CPU_UTIL_MAX}</p><p>**Recovery expression**: </p>|high|
|Errors on {#SNMPVALUE} (LLD)|<p>More than 100 in/out errors detected on {#SNMPVALUE}</p>|<p>**Expression**: {Cisco ASA 515:ifInErrors[{#SNMPVALUE}].last(0)}>100 or {Cisco ASA 515:ifOutErrors[{#SNMPVALUE}].last(0)}>100</p><p>**Recovery expression**: </p>|warning|
|{#SENSOR_INFO}: Fan is in critical state (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: {Cisco ASA 515:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_CRIT_STATUS:"critical"},eq)}=1 or {Cisco ASA 515:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_CRIT_STATUS:"shutdown"},eq)}=1</p><p>**Recovery expression**: </p>|disaster|
|{#SENSOR_INFO}: Fan is in warning state (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check the fan unit</p>|<p>**Expression**: {Cisco ASA 515:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_WARN_STATUS:"warning"},eq)}=1 or {Cisco ASA 515:sensor.fan.status[ciscoEnvMonFanState.{#SNMPINDEX}].count(#1,{$FAN_WARN_STATUS:"notFunctioning"},eq)}=1</p><p>**Recovery expression**: </p>|warning|
|{#ENT_NAME}: Device has been replaced (new serial number received) (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Device serial number has changed. Ack to close</p>|<p>**Expression**: {Cisco ASA 515:system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}].diff()}=1 and {Cisco ASA 515:system.hw.serialnumber[entPhysicalSerialNum.{#SNMPINDEX}].strlen()}>0</p><p>**Recovery expression**: </p>|information|
|{#SENSOR_INFO}: Power supply is in critical state (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check the power supply unit for errors</p>|<p>**Expression**: {Cisco ASA 515:sensor.psu.status[ciscoEnvMonSupplyState.{#SNMPINDEX}].count(#1,{$PSU_CRIT_STATUS:"critical"},eq)}=1 or {Cisco ASA 515:sensor.psu.status[ciscoEnvMonSupplyState.{#SNMPINDEX}].count(#1,{$PSU_CRIT_STATUS:"shutdown"},eq)}=1</p><p>**Recovery expression**: </p>|disaster|
|{#SENSOR_INFO}: Power supply is in warning state (LLD)|<p>Last value: {ITEM.LASTVALUE1}. Please check the power supply unit for errors</p>|<p>**Expression**: {Cisco ASA 515:sensor.psu.status[ciscoEnvMonSupplyState.{#SNMPINDEX}].count(#1,{$PSU_WARN_STATUS:"warning"},eq)}=1 or {Cisco ASA 515:sensor.psu.status[ciscoEnvMonSupplyState.{#SNMPINDEX}].count(#1,{$PSU_WARN_STATUS:"notFunctioning"},eq)}=1</p><p>**Recovery expression**: </p>|warning|
