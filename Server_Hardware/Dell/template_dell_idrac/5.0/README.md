# Dell idrac

## Overview

Based on <https://github.com/endersonmaia/zabbix-templates/tree/master/dell/idrac> and [https://share.zabbix.com/cat-server-hardware/dell/dell-idrac-chinese](cat-server-hardware/dell/dell-idrac-chinese). Chinese version translated back to english. 


 
 
 

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fan Enumeration|<p>-</p>|`SNMP agent`|FanEnumeration<p>Update: 7200</p>|
|Temperature Enumeration|<p>-</p>|`SNMP agent`|TempEnum<p>Update: 7200</p>|
|Processor Enumeration|<p>-</p>|`SNMP agent`|ProcEnum<p>Update: 43200</p>|
|Disk Enumeration|<p>-</p>|`SNMP agent`|DiskEnumeration<p>Update: 7200</p>|
|Network Enumeration|<p>-</p>|`SNMP agent`|NetworkEnum<p>Update: 7200</p>|
|Memory Enumeration|<p>-</p>|`SNMP agent`|MemoryEnum<p>Update: 43200;50/1-7,00:00-24:00</p>|
|Voltage Table Enumeration|<p>-</p>|`SNMP agent`|VoltageTable<p>Update: 7200</p>|
|Power Supply Enumeration|<p>-</p>|`SNMP agent`|PowerSupplies<p>Update: 7200</p>|
|Disk Volume Enumeration|<p>-</p>|`SNMP agent`|VolumeEnum<p>Update: 7200</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|System Asset Tag|<p>-</p>|`SNMP agent`|idrac_assettag<p>Update: 86400</p>|
|BIOS Version|<p>-</p>|`SNMP agent`|BiosVersion<p>Update: 86400</p>|
|CMOS Battery status|<p>-</p>|`SNMP agent`|CMOSBatteryStatus<p>Update: 60</p>|
|RAID Controller : Name|<p>-</p>|`SNMP agent`|RAIDControllerName<p>Update: 86400</p>|
|BIOS Date|<p>-</p>|`SNMP agent`|BiosDate<p>Update: 86400</p>|
|Voltage Status Combined|<p>-</p>|`SNMP agent`|VoltageStatusCombined<p>Update: 120</p>|
|Global system status|<p>-</p>|`SNMP agent`|GlobalSystemStatus<p>Update: 60</p>|
|iDRAC Firmware Version|<p>-</p>|`SNMP agent`|idrac_firmwareversion<p>Update: 86400</p>|
|System BIOS Status|<p>-</p>|`SNMP agent`|SystemBiosStatus<p>Update: 60</p>|
|RAID Controller : Firmware Version|<p>-</p>|`SNMP agent`|RAIDControllerFirmware<p>Update: 86400</p>|
|Power Usage Minimum Idle Power|<p>-</p>|`SNMP agent`|PowerUsageMinIdle<p>Update: 120</p>|
|System service number|<p>-</p>|`SNMP agent`|idrac_esc<p>Update: 86400</p>|
|RAID Controller : Status|<p>-</p>|`SNMP agent`|RAIDControllerStatus<p>Update: 60</p>|
|DRAC version|<p>-</p>|`SNMP agent`|idrac_version<p>Update: 86400</p>|
|Model|<p>-</p>|`SNMP agent`|idrac_SystemModel<p>Update: 86400</p>|
|Power Usage Sensor Status|<p>-</p>|`SNMP agent`|PowerUsageSensorStatus<p>Update: 120</p>|
|iDRAC access url|<p>-</p>|`SNMP agent`|idrac_acessurl<p>Update: 86400</p>|
|Fan {#FAN} Speed|<p>-</p>|`SNMP agent`|FanSpeed.[{#SNMPINDEX}]<p>Update: 120</p><p>LLD</p>|
|Fan {#FAN} Status|<p>-</p>|`SNMP agent`|FanStatus.[{#SNMPINDEX}]<p>Update: 120</p><p>LLD</p>|
|Temperature Sensor {#TEMP} Status|<p>-</p>|`SNMP agent`|TempStatus.[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Temperature Sensor {#TEMP} Value|<p>-</p>|`SNMP agent`|TempValue.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Processor  {#SNMPINDEX} Status|<p>-</p>|`SNMP agent`|ProcStatus.[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Disk {#DISKNAME} : Manufacture Day|<p>-</p>|`SNMP agent`|DiskManufactureDay.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Disk {#SNMPINDEX} : Manufacturer|<p>-</p>|`SNMP agent`|DiskManufacturer.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Disk {#SNMPINDEX} : Manufacture Week|<p>-</p>|`SNMP agent`|DiskManufactureWeek.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Disk {#DISKNAME} : Manufacture Year|<p>-</p>|`SNMP agent`|DiskManufactureYear.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Disk {#DISKNAME} : Model Number|<p>-</p>|`SNMP agent`|DiskModel.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Disk {#DISKNAME} : Name|<p>-</p>|`SNMP agent`|DiskName.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Disk {#DISKNAME} : Serial Number |<p>-</p>|`SNMP agent`|DiskSerialNo.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Disk {#DISKNAME} : Disk Size|<p>-</p>|`SNMP agent`|DiskSize.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Disk {#DISKNAME} : Disk State|<p>-</p>|`SNMP agent`|DiskState.[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|NIC {#NETIF} : Connection Status|<p>-</p>|`SNMP agent`|NetConnStatus.[{#SNMPINDEX}]<p>Update: 120</p><p>LLD</p>|
|NIC {#NETIF} : Name|<p>-</p>|`SNMP agent`|NetName.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|NIC {#NETIF} : Slot|<p>-</p>|`SNMP agent`|NetSlot.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|NIC {#NETIF} : Status|<p>-</p>|`SNMP agent`|NetStatus.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Memory Slot {#MEM} Manufacturer|<p>-</p>|`SNMP agent`|MemManufacturer[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Memory Slot {#MEM} Serial Number|<p>-</p>|`SNMP agent`|MemSerialNo.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Memory Slot {#MEM} Size|<p>-</p>|`SNMP agent`|MemSize.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Memory Slot {#MEM} Speed|<p>-</p>|`SNMP agent`|MemSpeed.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Memory Slot {#MEM} Status|<p>-</p>|`SNMP agent`|MemStatus.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Voltage{#VOLTAGE} : Status|<p>-</p>|`SNMP agent`|VoltageStatus.[{#SNMPINDEX}]<p>Update: 120</p><p>LLD</p>|
|Power Supply {#POWER} Input Voltage|<p>-</p>|`SNMP agent`|PowerSupplyInputVoltage.[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Power Supply {#POWER} Maximum Power|<p>-</p>|`SNMP agent`|PowerSupplyMaxPower.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Power Supply {#POWER} Sensor State|<p>-</p>|`SNMP agent`|PowerSupplySensorState.[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Power Supply {#POWER} State Settings|<p>-</p>|`SNMP agent`|PowerSupplyStateSettings.[{#SNMPINDEX}]<p>Update: 120</p><p>LLD</p>|
|Volume {#VOLNAME} : Virtual Disk State|<p>-</p>|`SNMP agent`|VolumeDiskState.[{#SNMPINDEX}]<p>Update: 90</p><p>LLD</p>|
|Volume {#SNMPINDEX} : Name|<p>-</p>|`SNMP agent`|VolumeName.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Volume {#SNMPINDEX} : Size|<p>-</p>|`SNMP agent`|VolumeSize.[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Volume {#SNMPINDEX} : State |<p>-</p>|`SNMP agent`|VolumeState.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Server {HOSTNAME} Problem with FAN {#FAN}|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:FanStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|average|
|Server {HOST.NAME} Problem with memory in slot {#MEM}|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:MemStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|high|
|Server {#HOSTNAME} Connection Status has changed on NIC {#NETIF}|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:NetConnStatus.[{#SNMPINDEX}].diff(0)}=1</p><p>**Recovery expression**: </p>|warning|
|Server {HOST.NAME} Error on NIC {#NETIF}|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:NetStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|high|
|Server {HOST.NAME} Error on PSU {#POWER}|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:PowerSupplySensorState.[{#SNMPINDEX}].last(0)}<>1</p><p>**Recovery expression**: </p>|high|
|Server {HOST.NAME} Error on Processor {#SNMPINDEX}|<p>-</p>|<p>**Expression**: ({Dell iDrac SNMPV2:ProcStatus.[{#SNMPINDEX}].last(0)}<>3 and {Dell iDrac SNMPV2:ProcStatus.[{#SNMPINDEX}].last(0)}<>2) or ({Dell iDrac SNMPV2:ProcStatus.[{#SNMPINDEX}].last(86400)}<>2 and {Dell iDrac SNMPV2:ProcStatus.[{#SNMPINDEX}].last(0)}=2)</p><p>**Recovery expression**: </p>|high|
|Server {HOST.NAME} Problem with Temperature Sensor {#TEMP}|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:TempStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|high|
|Server {HOST.NAME} Error on Voltage Sensor {#VOLTAGE}|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:VoltageStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|average|
|Server {HOST.NAME} Volume {#VOLNAME} Error|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:VolumeDiskState.[{#SNMPINDEX}].last(0)}<>2</p><p>**Recovery expression**: </p>|high|
|Server {HOSTNAME} Problem with FAN {#FAN} (LLD)|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:FanStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|average|
|Server {HOST.NAME} Problem with Temperature Sensor {#TEMP} (LLD)|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:TempStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|high|
|Server {HOST.NAME} Error on Processor {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: ({Dell iDrac SNMPV2:ProcStatus.[{#SNMPINDEX}].last(0)}<>3 and {Dell iDrac SNMPV2:ProcStatus.[{#SNMPINDEX}].last(0)}<>2) or ({Dell iDrac SNMPV2:ProcStatus.[{#SNMPINDEX}].last(86400)}<>2 and {Dell iDrac SNMPV2:ProcStatus.[{#SNMPINDEX}].last(0)}=2)</p><p>**Recovery expression**: </p>|high|
|Server {#HOSTNAME} Connection Status has changed on NIC {#NETIF} (LLD)|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:NetConnStatus.[{#SNMPINDEX}].diff(0)}=1</p><p>**Recovery expression**: </p>|warning|
|Server {HOST.NAME} Error on NIC {#NETIF} (LLD)|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:NetStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|high|
|Server {HOST.NAME} Problem with memory in slot {#MEM} (LLD)|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:MemStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|high|
|Server {HOST.NAME} Error on Voltage Sensor {#VOLTAGE} (LLD)|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:VoltageStatus.[{#SNMPINDEX}].last(0)}<>3</p><p>**Recovery expression**: </p>|average|
|Server {HOST.NAME} Error on PSU {#POWER} (LLD)|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:PowerSupplySensorState.[{#SNMPINDEX}].last(0)}<>1</p><p>**Recovery expression**: </p>|high|
|Server {HOST.NAME} Volume {#VOLNAME} Error (LLD)|<p>-</p>|<p>**Expression**: {Dell iDrac SNMPV2:VolumeDiskState.[{#SNMPINDEX}].last(0)}<>2</p><p>**Recovery expression**: </p>|high|
