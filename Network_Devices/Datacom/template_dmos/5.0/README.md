# DM DmOS

## Overview

SNMP - General Informations  
 SNMP Discovery - Interfaces  
 SNMP Discovery - CPU Cores  
 SNMP Discovery - CPU Load  
 SNMP Discovery - Fan SNMP  
SNMP Discovery - Temperature Sensor


### Template DmOS-BGP4-MIB, please download from [Datacom github](https://github.com/datacom-teracom/dmos-zabbix-template)


* Auto-discovering
* Supports IPv4 and IPv6 BGP sessions
* Supports IPv4 Unicast, IPv6 Unicast and MPLS VPN objects
* Supports SNMPv1 and SNMPv2c
* Supports BGP4-MIB standard MIB and DmOS-BGP4-MIB proprietary MIB


 



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|SNMP Discovery - CPU Load|<p>-</p>|`SNMP agent`|snmp.discovery.cpu.load<p>Update: 60</p>|
|SNMP Discovery - Memory|<p>-</p>|`SNMP agent`|snmp.discovery.memory<p>Update: 60</p>|
|SNMP Discovery - Fan|<p>-</p>|`SNMP agent`|snmp.discovery.fan<p>Update: 60</p>|
|SNMP Discovery - Interfaces|<p>-</p>|`SNMP agent`|snmp.discovery<p>Update: 60</p>|
|SNMP Discovery - Temperature Sensor|<p>-</p>|`SNMP agent`|snmp.discovery.temp.sensor<p>Update: 60</p>|
|SNMP Discovery - CPU Cores|<p>-</p>|`SNMP agent`|snmp.discovery.cpu.cores<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DmOS - cpuCore1FiveSecondsActive|<p>-</p>|`SNMP agent`|cpuCoreOneMinuteActive<p>Update: 30</p>|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|DmOS - memoryFiveSecondsFree|<p>-</p>|`SNMP agent`|memoryFiveSecondsFree<p>Update: 30</p>|
|DmOS - memoryFiveSecondsSlabRecl|<p>-</p>|`SNMP agent`|memoryFiveSecondsSlabRecl<p>Update: 30</p>|
|DmOS - memoryFiveSecondsUsed|<p>-</p>|`SNMP agent`|memoryFiveSecondsUsed<p>Update: 30</p>|
|DmOS - memoryFiveSecondsSlabUnrecl|<p>-</p>|`SNMP agent`|memoryFiveSecondsSlabUnrecl<p>Update: 30</p>|
|DmOS - cpuLoadFiveSecondsActive|<p>-</p>|`SNMP agent`|cpuLoadFiveSecondsActive<p>Update: 30</p>|
|DmOS - memoryFiveSecondsBuffered|<p>-</p>|`SNMP agent`|memoryFiveSecondsBuffered<p>Update: 30</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Device contact details|<p>The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 100</p>|
|DmOS - memoryFiveSecondsTotal|<p>-</p>|`SNMP agent`|memoryFiveSecondsTotal<p>Update: 30</p>|
|DmOS - memoryFiveSecondsCached|<p>-</p>|`SNMP agent`|memoryFiveSecondsCached<p>Update: 30</p>|
|DmOS - memoryFiveSecondsAvailable|<p>-</p>|`SNMP agent`|memoryFiveSecondsAvailable<p>Update: 30</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 60</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|DmOS - cpuCore0FiveSecondsActive|<p>-</p>|`SNMP agent`|cpuCoreFiveSecondsActive<p>Update: 30</p>|
|DmOS - cpuLoadFiveSecondsIdle|<p>-</p>|`SNMP agent`|cpuLoadFiveSecondsIdle<p>Update: 30</p>|
|Active CPU load last 5 minutes|<p>-</p>|`SNMP agent`|cpuLoadFiveMinutesActive[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Idle CPU load last 5 minutes|<p>-</p>|`SNMP agent`|cpuLoadFiveMinutesIdle[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Active CPU load last 5 seconds|<p>-</p>|`SNMP agent`|cpuLoadFiveSecondsActive[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Idle CPU load last 5 seconds|<p>-</p>|`SNMP agent`|cpuLoadFiveSecondsIdle[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Active CPU load last 1 minute|<p>-</p>|`SNMP agent`|cpuLoadOneMinuteActive[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Idle CPU load last 1 minute|<p>-</p>|`SNMP agent`|cpuLoadOneMinuteIdle[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Available memory last 5 seconds|<p>-</p>|`SNMP agent`|memoryFiveSecondsAvailable[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Buffered memory last 5 seconds|<p>-</p>|`SNMP agent`|memoryFiveSecondsBuffered[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Cached memory last 5 seconds|<p>-</p>|`SNMP agent`|memoryFiveSecondsCached[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Free memory last 5 seconds|<p>-</p>|`SNMP agent`|memoryFiveSecondsFree[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Slab Reclaimed last 5 seconds|<p>-</p>|`SNMP agent`|memoryFiveSecondsSlabRecl[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Slab Unreclaimed last 5 seconds|<p>-</p>|`SNMP agent`|memoryFiveSecondsSlabUnrecl[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Total memory last 5 seconds|<p>-</p>|`SNMP agent`|memoryFiveSecondsTotal[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Used memory last 5 seconds|<p>-</p>|`SNMP agent`|memoryFiveSecondsUsed[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|{#SNMPVALUE} - Power|<p>-</p>|`SNMP agent`|fanControl[{#SNMPINDEX}]<p>Update: 10</p><p>LLD</p>|
|{#SNMPVALUE} - Description|<p>-</p>|`SNMP agent`|fanDescription[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Read Error|<p>-</p>|`SNMP agent`|fanSpeedReadError[{#SNMPINDEX}]<p>Update: 10</p><p>LLD</p>|
|{#SNMPVALUE} - Status|<p>-</p>|`SNMP agent`|fanSpeedStatus[{#SNMPINDEX}]<p>Update: 10</p><p>LLD</p>|
|{#SNMPVALUE} - Speed|<p>-</p>|`SNMP agent`|fanSpeed[{#SNMPINDEX}]<p>Update: 10</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Total In|<p>-</p>|`SNMP agent`|ifHCInOctets.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Total Out|<p>-</p>|`SNMP agent`|ifHCOutOctets.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Speed|<p>-</p>|`SNMP agent`|ifHighSpeed.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Bcast In|<p>-</p>|`SNMP agent`|ifInBroadcastPkts.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Discards In|<p>-</p>|`SNMP agent`|ifInDiscards.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Errors In|<p>-</p>|`SNMP agent`|ifInErrors.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Mcast In|<p>-</p>|`SNMP agent`|ifInMulticastPkts.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Ucast In|<p>-</p>|`SNMP agent`|ifInUcastPkts.[{#SNMPINDEX}]<p>Update: 60;50/1-7,00:00-24:00</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Bcast Out|<p>-</p>|`SNMP agent`|ifOutBroadcastPkts.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Discards Out|<p>-</p>|`SNMP agent`|ifOutDiscards.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Errors Out|<p>-</p>|`SNMP agent`|ifOutErrors.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Mcast Out|<p>-</p>|`SNMP agent`|ifOutMulticastPkts.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interface {#SNMPVALUE} - Ucast Out|<p>-</p>|`SNMP agent`|ifOutUcastPkts.[{#SNMPINDEX}]<p>Update: 60;50/1-7,00:00-24:00</p><p>LLD</p>|
|{#SNMPVALUE} - Current Temperature|<p>-</p>|`SNMP agent`|temperatureSensorCurrentTemperature[{#SNMPINDEX}]<p>Update: 10</p><p>LLD</p>|
|{#SNMPVALUE} - Description|<p>-</p>|`SNMP agent`|temperatureSensorDescription[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Hyst Temperature|<p>-</p>|`SNMP agent`|temperatureSensorHysteresis[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Max Temperature|<p>-</p>|`SNMP agent`|temperatureSensorMaxTemperature[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Min Temperature|<p>-</p>|`SNMP agent`|temperatureSensorMinTemperature[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Read Error|<p>-</p>|`SNMP agent`|temperatureSensorTemperatureReadError[{#SNMPINDEX}]<p>Update: 10</p><p>LLD</p>|
|Active CPU core last 5 minutes|<p>-</p>|`SNMP agent`|cpuCoreFiveMinutesActive[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|System CPU core last 5 seconds|<p>-</p>|`SNMP agent`|cpuCoreFiveSecondsSystem[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|User CPU core last 1 minute|<p>-</p>|`SNMP agent`|cpuCoreOneMinuteUser[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|System CPU core last 1 minute|<p>-</p>|`SNMP agent`|cpuCoreOneMinuteSystem[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Softirq CPU core last 1 minute|<p>-</p>|`SNMP agent`|cpuCoreOneMinuteSoftirq[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Nice CPU core last 1 minute|<p>-</p>|`SNMP agent`|cpuCoreOneMinuteNice[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interrupt CPU core last 1 minute|<p>-</p>|`SNMP agent`|cpuCoreOneMinuteInterrupt[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Idle CPU core last 1 minute|<p>-</p>|`SNMP agent`|cpuCoreOneMinuteIdle[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Active CPU core last 1 minute|<p>-</p>|`SNMP agent`|cpuCoreOneMinuteActive[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Wait CPU core last 5 seconds|<p>-</p>|`SNMP agent`|cpuCoreFiveSecondsWait[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|User CPU core last 5 seconds|<p>-</p>|`SNMP agent`|cpuCoreFiveSecondsUser[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Softirq CPU core last 5 seconds|<p>-</p>|`SNMP agent`|cpuCoreFiveSecondsSoftirq[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Idle CPU core last 5 minutes|<p>-</p>|`SNMP agent`|cpuCoreFiveMinutesIdle[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Nice CPU core last 5 seconds|<p>-</p>|`SNMP agent`|cpuCoreFiveSecondsNice[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Interrupt CPU core last 5 seconds|<p>-</p>|`SNMP agent`|cpuCoreFiveSecondsInterrupt[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Idle CPU core last 5 seconds|<p>-</p>|`SNMP agent`|cpuCoreFiveSecondsIdle[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Active CPU core last 5 seconds|<p>-</p>|`SNMP agent`|cpuCoreFiveSecondsActive[{#SNMPINDEX}]<p>Update: 5</p><p>LLD</p>|
|Wait CPU core last 5 minutes|<p>-</p>|`SNMP agent`|cpuCoreFiveMinutesWait[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|User CPU core last 5 minutes|<p>-</p>|`SNMP agent`|cpuCoreFiveMinutesUser[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|System CPU core last 5 minutes|<p>-</p>|`SNMP agent`|cpuCoreFiveMinutesSystem[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Softirq CPU core last 5 minutes|<p>-</p>|`SNMP agent`|cpuCoreFiveMinutesSoftirq[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Nice CPU core last 5 minutes|<p>-</p>|`SNMP agent`|cpuCoreFiveMinutesNIce[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Interrupt CPU core last 5 minutes|<p>-</p>|`SNMP agent`|cpuCoreFiveMinutesInterrupt[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Wait CPU core last 1 minute|<p>-</p>|`SNMP agent`|cpuCoreOneMinuteWait[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|HIGH - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} In overloaded|<p>-</p>|<p>**Expression**: {DM DmOS:ifHCInOctets.[{#SNMPINDEX}].last(0)}>0.90/{DM DmOS:ifHighSpeed.[{#SNMPINDEX}].last(0)}</p><p>**Recovery expression**: </p>|high|
|HIGH - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} Out overloaded|<p>-</p>|<p>**Expression**: {DM DmOS:ifHCOutOctets.[{#SNMPINDEX}].last(0)}>0.90/{DM DmOS:ifHighSpeed.[{#SNMPINDEX}].last(0)}</p><p>**Recovery expression**: </p>|high|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} In discards|<p>-</p>|<p>**Expression**: {DM DmOS:ifInDiscards.[{#SNMPINDEX}].change(0)}>1</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} In errors|<p>-</p>|<p>**Expression**: {DM DmOS:ifInErrors.[{#SNMPINDEX}].change(0)}>1</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} In overloaded|<p>-</p>|<p>**Expression**: {DM DmOS:ifHCInOctets.[{#SNMPINDEX}].last(0)}>0.60/{DM DmOS:ifHighSpeed.[{#SNMPINDEX}].last(0)}</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} Out discards|<p>-</p>|<p>**Expression**: {DM DmOS:ifOutDiscards.[{#SNMPINDEX}].change(0)}>1</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} Out errors|<p>-</p>|<p>**Expression**: {DM DmOS:ifOutErrors.[{#SNMPINDEX}].change(0)}>1</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} Out overloaded|<p>-</p>|<p>**Expression**: {DM DmOS:ifHCOutOctets.[{#SNMPINDEX}].last(0)}>0.60/{DM DmOS:ifHighSpeed.[{#SNMPINDEX}].last(0)}</p><p>**Recovery expression**: </p>|warning|
|HIGH - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} In overloaded (LLD)|<p>-</p>|<p>**Expression**: {DM DmOS:ifHCInOctets.[{#SNMPINDEX}].last(0)}>0.90/{DM DmOS:ifHighSpeed.[{#SNMPINDEX}].last(0)}</p><p>**Recovery expression**: </p>|high|
|HIGH - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} Out overloaded (LLD)|<p>-</p>|<p>**Expression**: {DM DmOS:ifHCOutOctets.[{#SNMPINDEX}].last(0)}>0.90/{DM DmOS:ifHighSpeed.[{#SNMPINDEX}].last(0)}</p><p>**Recovery expression**: </p>|high|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} In discards (LLD)|<p>-</p>|<p>**Expression**: {DM DmOS:ifInDiscards.[{#SNMPINDEX}].change(0)}>1</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} In errors (LLD)|<p>-</p>|<p>**Expression**: {DM DmOS:ifInErrors.[{#SNMPINDEX}].change(0)}>1</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} In overloaded (LLD)|<p>-</p>|<p>**Expression**: {DM DmOS:ifHCInOctets.[{#SNMPINDEX}].last(0)}>0.60/{DM DmOS:ifHighSpeed.[{#SNMPINDEX}].last(0)}</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} Out discards (LLD)|<p>-</p>|<p>**Expression**: {DM DmOS:ifOutDiscards.[{#SNMPINDEX}].change(0)}>1</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} Out errors (LLD)|<p>-</p>|<p>**Expression**: {DM DmOS:ifOutErrors.[{#SNMPINDEX}].change(0)}>1</p><p>**Recovery expression**: </p>|warning|
|WARNING - Host {HOST.NAME} - Interface ethernet {#SNMPVALUE} Out overloaded (LLD)|<p>-</p>|<p>**Expression**: {DM DmOS:ifHCOutOctets.[{#SNMPINDEX}].last(0)}>0.60/{DM DmOS:ifHighSpeed.[{#SNMPINDEX}].last(0)}</p><p>**Recovery expression**: </p>|warning|
