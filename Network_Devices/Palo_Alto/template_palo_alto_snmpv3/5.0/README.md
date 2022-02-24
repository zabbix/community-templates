# Palo Alto SNMPv3 Auth Priv

## Overview

> Uses SNMPv3
-------------


> Predefined Auth and Priv method : SHA and AES
-----------------------------------------------


> Variables under Macros, just one time update during host addition
-------------------------------------------------------------------



## Author

hitesh-vinzoda

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Temperature Discovery - System|<p>-</p>|`SNMP agent`|entPhySystemTemp[SENSOR]<p>Update: 5m</p>|
|Fan RPM Discovery|<p>ENTITY-SENSOR-MIB::entPhySensorType The type of data returned by the associated entPhySensorValue object.</p>|`SNMP agent`|entPhySensorType[FAN]<p>Update: 5m</p>|
|Storage|<p>-</p>|`SNMP agent`|hrStorageDescr<p>Update: 5m</p>|
|Temperature Discovery - Core|<p>-</p>|`SNMP agent`|entPhyCoreTemp[SENSOR]<p>Update: 5m</p>|
|Interfaces|<p>-</p>|`SNMP agent`|ifDescr<p>Update: 5m</p>|
|Component Temperature Discovery|<p>ENTITY-SENSOR-MIB::entPhySensorType The type of data returned by the associated entPhySensorValue object.</p>|`SNMP agent`|entPhySensorType[Temp]<p>Update: 5m</p>|
|Interfaces Totals|<p>-</p>|`SNMP agent`|snmp.discoverytotal<p>Update: 5m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Core Temperature|<p>-</p>|`SNMP agent`|entPhySensorValue.4<p>Update: 1m</p>|
|System uptime|<p>-</p>|`SNMP agent`|hrSystemUptime.0<p>Update: 15m</p>|
|CPU utilization on management plane|<p>CPU load average over last 60 seconds. This value will match the value shown on the GUI dashboard-> resource information-> % CPU in PAN-OS 3.x</p>|`SNMP agent`|hrProcessorLoad1<p>Update: 5m</p>|
|Active TCP Sessions|<p>-</p>|`SNMP agent`|panSessionActiveTcp.0<p>Update: 1m</p>|
|Active UDP Sessions|<p>-</p>|`SNMP agent`|panSessionActiveUdp.0<p>Update: 1m</p>|
|Utilization of CPUs on dataplane that are used for system functions|<p>CPU load average over last 60 seconds</p>|`SNMP agent`|hrProcessorLoad2<p>Update: 1m</p>|
|System Temperature|<p>-</p>|`SNMP agent`|entPhySensorValue.3<p>Update: 1m</p>|
|System Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 1h</p>|
|Chassis Type|<p>-</p>|`SNMP agent`|panChassisType<p>Update: 1d</p>|
|Session Utilization|<p>PAN-COMMON-MIB::panSessionUtilization Session table utilization percentage.</p>|`SNMP agent`|panSessionUtilization<p>Update: 5m</p>|
|Hardware Version|<p>-</p>|`SNMP agent`|panSysHwVersion<p>Update: 1h</p>|
|Total Active Sessions|<p>-</p>|`SNMP agent`|panSessionActive.0<p>Update: 1m</p>|
|PAN-OS Version|<p>-</p>|`SNMP agent`|panSysSwVersion<p>Update: 1h</p>|
|System Temperature - Operational Status of Sensor: $1|<p>-</p>|`SNMP agent`|entPhySystemTempOperStatus[{#SENSORNAME}]<p>Update: 30s</p><p>LLD</p>|
|System Temperature - Temperature of Sensor: $1|<p>-</p>|`SNMP agent`|entPhySystemTempValue[{#SENSORNAME}]<p>Update: 30s</p><p>LLD</p>|
|Operational status of $1|<p>-</p>|`SNMP agent`|entPhySensorOperStatus[{#SNMPVALUE}]<p>Update: 30s</p><p>LLD</p>|
|Speed of $1|<p>-</p>|`SNMP agent`|entPhySensorValue[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|{#SNMPVALUE} Size|<p>-</p>|`SNMP agent`|hrStorageSize[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|{#SNMPVALUE} Used|<p>-</p>|`SNMP agent`|hrStorageUsed[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Core Temperature - Operational Status of Sensor: $1|<p>-</p>|`SNMP agent`|entPhyCoreTempOperStatus[{#SENSORNAME}]<p>Update: 30s</p><p>LLD</p>|
|Core Temperature - Temperature of Sensor: $1|<p>-</p>|`SNMP agent`|entPhyCoreTempValue[{#SENSORNAME}]<p>Update: 30s</p><p>LLD</p>|
|Interface $1 admin status|<p>-</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Incoming discarded packets on interface $1|<p>-</p>|`SNMP agent`|ifInDiscards[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Incoming packets with errors on interface $1|<p>-</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Incoming non-unicast packets on interface $1|<p>-</p>|`SNMP agent`|ifInNUcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Incoming unicast packets on interface $1|<p>-</p>|`SNMP agent`|ifInUcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Interface $1 operational status|<p>-</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Outgoing discarded packets on interface $1|<p>-</p>|`SNMP agent`|ifOutDiscards[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Outgoing packets with errors on interface $1|<p>-</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Outgoing non-unicast packets on interface $1|<p>-</p>|`SNMP agent`|ifOutNUcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>-</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Outgoing unicast packets on interface $1|<p>-</p>|`SNMP agent`|ifOutUcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Temperature of $1|<p>-</p>|`SNMP agent`|entPhySensorTemp[{#SENSORNAME}]<p>Update: 30s</p><p>LLD</p>|
|Total broadcast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCInBroadcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Total multicast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCInMulticastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Total traffic incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCInOctets[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Total unicast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCInUcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Total broadcast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCOutBroadcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Total multicast packets outgoing on interface $1|<p>-</p>|`SNMP agent`|ifHCOutMulticastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Total traffic outgoing on interface $1|<p>-</p>|`SNMP agent`|ifHCOutOctets[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Total unicast packets outgoing on interface $1|<p>-</p>|`SNMP agent`|ifHCOutUcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Broadcast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifInBroadcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Multicast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifInMulticastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Broadcast packets outgoing on interface $1|<p>-</p>|`SNMP agent`|ifOutBroadcastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Multicast packets outgoing on interface $1|<p>-</p>|`SNMP agent`|ifOutMulticastPkts[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

