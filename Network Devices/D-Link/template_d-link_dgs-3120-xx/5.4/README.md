# SNMP D-link DGS-3120-xx

## Description

D-link do something realy wierd with swTemperatureTable. So it's values not discovered but set manualy as items

## Overview

Based on MIB from vendor. Checked on local single and stacked DGS/DWS-3120-xx devices.


Main system Items, Ttiggers and Graphs.


LLD Network interfaces.


LLD Memory, Temperature and Fan values (though D-link does something weird with fan and temperature OIDs, probably depends on firmware, so this prototypes was added semi-manualy).


 


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Environment management|<p>-</p>|`SNMP agent`|agentDRAMutilizationUnitID<p>Update: 3600</p>|
|Network Interfaces|<p>-</p>|`SNMP agent`|ifIndex<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device firmware version|<p>Version number of the Firmware.</p>|`SNMP agent`|sysFirmwareVersion<p>Update: 3600</p>|
|Device hardware version|<p>Version number of the Hardware.</p>|`SNMP agent`|sysHardwareVersion<p>Update: 3600</p>|
|Device location|<p>The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software. It is mandatory that this only contain printable ASCII characters.</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|Device serial number|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software. It is mandatory that this only contain printable ASCII characters.</p>|`SNMP agent`|agentSerialNumber<p>Update: 3600</p>|
|Device contact details|<p>-</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 300</p>|
|Device CPU utilization|<p>The time scale is set at 5 minute intervals. The value will be between 0% (idle) and 100% (very busy).</p>|`SNMP agent`|agentCPUutilizationIn5min<p>Update: 300</p>|
|Device fan $1-1|<p>-</p>|`SNMP agent`|swFanSpeed.1.[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Device fan $1-2|<p>-</p>|`SNMP agent`|swFanSpeed.2.[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Device memory total, unit $1|<p>-</p>|`SNMP agent`|agentDRAMutilizationTotalDRAM[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Device memory used, unit $1|<p>-</p>|`SNMP agent`|agentDRAMutilizationUsedDRAM[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Device memory utilization, unit $1|<p>-</p>|`SNMP agent`|agentDRAMutilization[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Device temperature, unit $1|<p>-</p>|`SNMP agent`|swTemperatureCurrent[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Inbound errors on interface $1|<p>The number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The total number of octets received on the interface, including framing characters.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface. The testing(3) state indicates that no operational packets can be passed.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The total number of octets transmitted out of the interface, including framing characters.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Speed of interface $1|<p>An estimate of the interface's current bandwidth in bits per second. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth.</p>|`SNMP agent`|ifSpeed[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} unit {#SNMPVALUE} - 1st fan failed|<p>-</p>|<p>**Expression**: {SNMP D-link DGS-3120-xx:swFanSpeed.1.[{#SNMPVALUE}].max(30m)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} unit {#SNMPVALUE} - 2nd fan failed|<p>-</p>|<p>**Expression**: {SNMP D-link DGS-3120-xx:swFanSpeed.2.[{#SNMPVALUE}].max(30m)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} unit {#SNMPVALUE} - temperature high|<p>-</p>|<p>**Expression**: {SNMP D-link DGS-3120-xx:swTemperatureCurrent[{#SNMPVALUE}].avg(#3)}=40</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} unit {#SNMPVALUE} - 1st fan failed (LLD)|<p>-</p>|<p>**Expression**: {SNMP D-link DGS-3120-xx:swFanSpeed.1.[{#SNMPVALUE}].max(30m)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} unit {#SNMPVALUE} - 2nd fan failed (LLD)|<p>-</p>|<p>**Expression**: {SNMP D-link DGS-3120-xx:swFanSpeed.2.[{#SNMPVALUE}].max(30m)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} unit {#SNMPVALUE} - temperature high (LLD)|<p>-</p>|<p>**Expression**: {SNMP D-link DGS-3120-xx:swTemperatureCurrent[{#SNMPVALUE}].avg(#3)}=40</p><p>**Recovery expression**: </p>|high|
