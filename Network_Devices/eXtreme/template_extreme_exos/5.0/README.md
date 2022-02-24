# SNMP Extreme EXOS

## Overview

HARDWARE


FIRMWARE


STACKING



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Stack Info|<p>The slot id of the stack member in the stack</p>|`SNMP agent`|extremeStackMemberSlotId<p>Update: 3600</p>|
|Memory Discovery|<p>-</p>|`SNMP agent`|memory.discovery<p>Update: 3600</p>|
|Stack port Info|<p>A unique value for each interface. Its value ranges between 1 and the value of ifNumber. The value for each interface must remain constant at least from one re-initialization of the entity's network management system to the next re- initialization.</p>|`SNMP agent`|extremeStackingPortIfIndex<p>Update: 3600</p>|
|PSU Discovery|<p>Table of status of all power supplies in the system.</p>|`SNMP agent`|psu.discovery<p>Update: 3600</p>|
|FAN Discovery|<p>-</p>|`SNMP agent`|fan.discovery<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Firmware version|<p>-</p>|`SNMP agent`|system.hw.firmware<p>Update: 3600</p>|
|Operating system|<p>MIB: EXTREME-SYSTEM-MIB The software revision of the primary image stored in this device. This string will have a zero length if the revision is unknown, invalid or not present. This will also be reported in RMON2 probeSoftwareRev if this is the software image currently running in the device</p>|`SNMP agent`|system.hw.os<p>Update: 3600</p>|
|Hardware serial number|<p>-</p>|`SNMP agent`|system.hw.serialnumber<p>Update: 3600</p>|
|Device: Temperature|<p>MIB: EXTREME-SYSTEM-MIB Temperature readings of testpoint: Device Reference: https://gtacknowledge.extremenetworks.com/articles/Q_A/Does-EXOS-support-temperature-polling-via-SNMP-on-all-nodes-in-a-stack</p>|`SNMP agent`|sensor.temp.value[extremeCurrentTemperature.0]<p>Update: 60</p>|
|CPU utilization|<p>MIB: EXTREME-SOFTWARE-MONITOR-MIB Total CPU utlization (percentage) as of last sampling.</p>|`SNMP agent`|system.cpu.util[extremeCpuMonitorTotalUtilization.0]<p>Update: 60</p>|
|Device: Temperature status|<p>MIB: EXTREME-SYSTEM-MIB Temperature status of testpoint: Device</p>|`SNMP agent`|sensor.temp.status[extremeOverTemperatureAlarm.0]<p>Update: 60</p>|
|Hardware model name|<p>-</p>|`SNMP agent`|system.hw.model<p>Update: 3600</p>|
|#{#SNMPVALUE}: Member MAC address|<p>The Mac address of the stack member</p>|`SNMP agent`|extremeStackMemberMavAddress[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|#{#SNMPVALUE}: Member mgmt ip address|<p>The fallback mgmt ip address which was configured through CLI for this stack member. This ipaddress can be used to communicate with this member, if it comes up as the master. The ipaddress is associated with the vlan configured</p>|`SNMP agent`|extremeStackMemberMgmtIpAddress[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|#{#SNMPVALUE}: Member oper status|<p>The operational status of the stack member. When the stack comes up, if there is a vector mismatch namely license mismatch or platform mismatch between the master and the member, the member remains in the mismatch state. Further communication with the member is not possible</p>|`SNMP agent`|extremeStackMemberOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|#{#SNMPVALUE}: Member role|<p>The role of the stack member as to whether it is acting as a master,backup or a slave</p>|`SNMP agent`|extremeStackMemberRole[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|#{#SNMPVALUE}: Member stack priority|<p>The stack priority of the stack member. The stack priority is used for the master election algorithm. The member with the highest priority comes up as the master. If there are more than one switch with highest priority, the member with the least MAC among them comes up as the master</p>|`SNMP agent`|extremeStackMemberStackPriority[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|#{#SNMPVALUE}: Available memory|<p>MIB: EXTREME-SOFTWARE-MONITOR-MIB Total amount of free memory in Kbytes in the system.</p>|`SNMP agent`|vm.memory.free[extremeMemoryMonitorSystemFree.{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|#{#SNMPVALUE}: Memory utilization|<p>Memory utilization in %</p>|`Calculated`|vm.memory.pused[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|#{#SNMPVALUE}: Total memory|<p>MIB: EXTREME-SOFTWARE-MONITOR-MIB Total amount of DRAM in Kbytes in the system.</p>|`SNMP agent`|vm.memory.total[extremeMemoryMonitorSystemTotal.{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Stack port {#SNMPINDEX} status|<p>The Link status of the stacking port link</p>|`SNMP agent`|extremeStackingPortLinkStatus[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|PSU {#SNMPVALUE}: Power supply status|<p>MIB: EXTREME-SYSTEM-MIB Status of the power supply {#SNMPVALUE}</p>|`SNMP agent`|sensor.psu.status[extremePowerSupplyStatus.{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Fan {#SNMPVALUE}: Fan speed|<p>MIB: EXTREME-SYSTEM-MIB The speed (RPM) of a cooling fan in the fantray {#SNMPVALUE}</p>|`SNMP agent`|sensor.fan.speed[extremeFanSpeed.{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Fan {#SNMPVALUE}: Fan status|<p>MIB: EXTREME-SYSTEM-MIB Operational status of a cooling fan.</p>|`SNMP agent`|sensor.fan.status[extremeFanOperational.{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Stack port {#SNMPVALUE}: Member is in critical state|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:extremeStackingPortLinkStatus[{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Stack {#SNMPVALUE}: Member is in critical state|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:extremeStackMemberOperStatus[{#SNMPVALUE}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Fan {#SNMPVALUE}: Fan is in critical state|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:sensor.fan.status[extremeFanOperational.{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|#{#SNMPVALUE}: High memory utilization|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:vm.memory.pused[{#SNMPVALUE}].avg(5m)}>90</p><p>**Recovery expression**: </p>|high|
|PSU {#SNMPVALUE}: Power supply is in critical state|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:sensor.psu.status[extremePowerSupplyStatus.{#SNMPINDEX}].last()}<>3</p><p>**Recovery expression**: </p>|high|
|PSU {#SNMPVALUE}: Power supply power off|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:sensor.psu.status[extremePowerSupplyStatus.{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|warning|
|Stack {#SNMPVALUE}: Member is in critical state (LLD)|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:extremeStackMemberOperStatus[{#SNMPVALUE}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|#{#SNMPVALUE}: High memory utilization (LLD)|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:vm.memory.pused[{#SNMPVALUE}].avg(5m)}>90</p><p>**Recovery expression**: </p>|high|
|Stack port {#SNMPVALUE}: Member is in critical state (LLD)|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:extremeStackingPortLinkStatus[{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|PSU {#SNMPVALUE}: Power supply is in critical state (LLD)|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:sensor.psu.status[extremePowerSupplyStatus.{#SNMPINDEX}].last()}<>3</p><p>**Recovery expression**: </p>|high|
|PSU {#SNMPVALUE}: Power supply power off (LLD)|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:sensor.psu.status[extremePowerSupplyStatus.{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|warning|
|Fan {#SNMPVALUE}: Fan is in critical state (LLD)|<p>-</p>|<p>**Expression**: {SNMP Extreme EXOS:sensor.fan.status[extremeFanOperational.{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
