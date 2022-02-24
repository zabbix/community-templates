# Template_Palo_Alto_PA200

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|$1 Discovery|<p>ENTITY-SENSOR-MIB::entPhySensorType The type of data returned by the associated entPhySensorValue object.</p>|`SNMP agent`|entPhySensorType[FAN]<p>Update: 300</p>|
|Storage|<p>-</p>|`SNMP agent`|hrStorageDescr<p>Update: 300</p>|
|Interfaces|<p>-</p>|`SNMP agent`|snmp.discovery<p>Update: 300</p>|
|Interfaces Totals|<p>-</p>|`SNMP agent`|snmp.discoverytotal<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Active TCP Sessions|<p>-</p>|`SNMP agent`|panSessionActiveTcp.0<p>Update: 60</p>|
|Active UDP Sessions|<p>-</p>|`SNMP agent`|panSessionActiveUdp.0<p>Update: 60</p>|
|Session Utilization|<p>PAN-COMMON-MIB::panSessionUtilization Session table utilization percentage.</p>|`SNMP agent`|panSessionUtilization<p>Update: 300</p>|
|Hardware Version|<p>-</p>|`SNMP agent`|panSysHwVersion<p>Update: 3600</p>|
|PAN-OS Version|<p>-</p>|`SNMP agent`|panSysSwVersion<p>Update: 3600</p>|
|System Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|System Temperature|<p>-</p>|`SNMP agent`|entPhySensorValue.3<p>Update: 60</p>|
|Core Temperature|<p>-</p>|`SNMP agent`|entPhySensorValue.4<p>Update: 60</p>|
|CPU utilization on management plane|<p>CPU load average over last 60 seconds. This value will match the value shown on the GUI dashboard-> resource information-> % CPU in PAN-OS 3.x</p>|`SNMP agent`|hrProcessorLoad1<p>Update: 300</p>|
|Utilization of CPUs on dataplane that are used for system functions|<p>CPU load average over last 60 seconds</p>|`SNMP agent`|hrProcessorLoad2<p>Update: 60</p>|
|System uptime|<p>-</p>|`SNMP agent`|hrSystemUptime.0<p>Update: 900</p>|
|Chassis Type|<p>-</p>|`SNMP agent`|panChassisType<p>Update: 86400</p>|
|Total Active Sessions|<p>-</p>|`SNMP agent`|panSessionActive.0<p>Update: 60</p>|
|Operational status of FAN $1|<p>-</p>|`SNMP agent`|entPhySensorOperStatus[{#SNMPVALUE},FAN]<p>Update: 30</p><p>LLD</p>|
|Current speed of $2 $1|<p>-</p>|`SNMP agent`|entPhySensorValue[{#SNMPVALUE},FAN]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} Size|<p>-</p>|`SNMP agent`|hrStorageSize[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|{#SNMPVALUE} Used|<p>-</p>|`SNMP agent`|hrStorageUsed[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Interface $1 admin status|<p>-</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming discarded packets on interface $1|<p>-</p>|`SNMP agent`|ifInDiscards[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming packets with errors on interface $1|<p>-</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming non-unicast packets on interface $1|<p>-</p>|`SNMP agent`|ifInNUcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming unicast packets on interface $1|<p>-</p>|`SNMP agent`|ifInUcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Interface $1 operational status|<p>-</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing discarded packets on interface $1|<p>-</p>|`SNMP agent`|ifOutDiscards[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing packets with errors on interface $1|<p>-</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing non-unicast packets on interface $1|<p>-</p>|`SNMP agent`|ifOutNUcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>-</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing unicast packets on interface $1|<p>-</p>|`SNMP agent`|ifOutUcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Total broadcast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCInBroadcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Total multicast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCInMulticastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Total traffic incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Total unicast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCInUcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Total broadcast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifHCOutBroadcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Total multicast packets outgoing on interface $1|<p>-</p>|`SNMP agent`|ifHCOutMulticastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Total traffic outgoing on interface $1|<p>-</p>|`SNMP agent`|ifHCOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Total unicast packets outgoing on interface $1|<p>-</p>|`SNMP agent`|ifHCOutUcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Broadcast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifInBroadcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Multicast packets incoming on interface $1|<p>-</p>|`SNMP agent`|ifInMulticastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Broadcast packets outgoing on interface $1|<p>-</p>|`SNMP agent`|ifOutBroadcastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Multicast packets outgoing on interface $1|<p>-</p>|`SNMP agent`|ifOutMulticastPkts[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|FAN #{#SNMPINDEX} is nonoperational|<p>-</p>|<p>**Expression**: last(/Template_Palo_Alto_PA200/entPhySensorOperStatus[{#SNMPVALUE},FAN])=3</p><p>**Recovery expression**: </p>|high|
|FAN #{#SNMPINDEX} is unavailable|<p>-</p>|<p>**Expression**: last(/Template_Palo_Alto_PA200/entPhySensorOperStatus[{#SNMPVALUE},FAN])=2</p><p>**Recovery expression**: </p>|average|
|#{#SNMPVALUE} usage is high [{ITEM.LASTVALUE1}]|<p>-</p>|<p>**Expression**: avg(/Template_Palo_Alto_PA200/hrStorageUsed[{#SNMPINDEX}],5m)>last(/Template_Palo_Alto_PA200/hrStorageSize[{#SNMPINDEX}])*0.9</p><p>**Recovery expression**: </p>|average|
|Interface {#SNMPVALUE} status on {HOSTNAME} is down|<p>-</p>|<p>**Expression**: last(/Template_Palo_Alto_PA200/ifOperStatus[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|information|
|Operational status was changed on {HOSTNAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/Template_Palo_Alto_PA200/ifOperStatus[{#SNMPVALUE}],#1)<>last(/Template_Palo_Alto_PA200/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|average|
|FAN #{#SNMPINDEX} is nonoperational (LLD)|<p>-</p>|<p>**Expression**: last(/Template_Palo_Alto_PA200/entPhySensorOperStatus[{#SNMPVALUE},FAN])=3</p><p>**Recovery expression**: </p>|high|
|FAN #{#SNMPINDEX} is unavailable (LLD)|<p>-</p>|<p>**Expression**: last(/Template_Palo_Alto_PA200/entPhySensorOperStatus[{#SNMPVALUE},FAN])=2</p><p>**Recovery expression**: </p>|average|
|#{#SNMPVALUE} usage is high [{ITEM.LASTVALUE1}] (LLD)|<p>-</p>|<p>**Expression**: avg(/Template_Palo_Alto_PA200/hrStorageUsed[{#SNMPINDEX}],5m)>last(/Template_Palo_Alto_PA200/hrStorageSize[{#SNMPINDEX}])*0.9</p><p>**Recovery expression**: </p>|average|
|Interface {#SNMPVALUE} status on {HOSTNAME} is down (LLD)|<p>-</p>|<p>**Expression**: last(/Template_Palo_Alto_PA200/ifOperStatus[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|information|
|Operational status was changed on {HOSTNAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/Template_Palo_Alto_PA200/ifOperStatus[{#SNMPVALUE}],#1)<>last(/Template_Palo_Alto_PA200/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|average|
