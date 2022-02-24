# SNMP D-link DGS-1100-10/ME revA1

## Overview

Based on official D-link MIB. Generic device data.


Auto-discovery for Network Interfaces.


Fills possible host inventory fields.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network Interfaces|<p>-</p>|`SNMP agent`|ifIndex<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device name|<p>-</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Device memory utilization|<p>Indicates the average RAM usage in last 5 minute of the switch in percentage</p>|`SNMP agent`|ramLast5MinUsage<p>Update: 60</p>|
|Device contact details|<p>System name used for identification of the device. The following characters are allowed to input. 0 ~9 / a ~z / A ~Z Special character:( ) ¡V + _ =.</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|Device serial number|<p>The serial number assigned to this nvram sub-unit</p>|`SNMP agent`|sysSerialNumber<p>Update: 3600</p>|
|Device hardware version|<p>Version number of the Hardware.</p>|`SNMP agent`|sysHardwareVersion<p>Update: 3600</p>|
|Device description|<p>A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDeviceType<p>Update: 3600</p>|
|Device CPU utilization|<p>Indicates the average CPU usage in last 5 minute of the switch in percentage</p>|`SNMP agent`|cpuLast5MinUsage<p>Update: 60</p>|
|Device firmware version|<p>Version number of the Firmware.</p>|`SNMP agent`|sysFirmwareVersion<p>Update: 3600</p>|
|Device location|<p>The location name of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocationName<p>Update: 3600</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 300</p>|
|Inbound errors on interface $1|<p>The number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The total number of octets received on the interface, including framing characters.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface. The testing(3) state indicates that no operational packets can be passed.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The total number of octets transmitted out of the interface, including framing characters.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Speed of interface $1|<p>An estimate of the interface's current bandwidth in bits per second. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth.</p>|`SNMP agent`|ifSpeed[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Uptime of interface $1|<p>The value of sysUpTime at the time the interface entered its current operational state. If the current state was entered prior to the last re-initialization of the local network management subsystem, then this object contains a zero value.</p>|`SNMP agent`|ifLastChange[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

