# Template_Palo_Alto_Firewall

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Memory|<p>-</p>|`SNMP agent`|hrStorageDescr[memory]<p>Update: 300</p>|
|$1 Discovery|<p>ENTITY-SENSOR-MIB::entPhySensorType The type of data returned by the associated entPhySensorValue object.</p>|`SNMP agent`|entPhySensorType[FAN]<p>Update: 300</p>|
|$1 Discovery|<p>ENTITY-SENSOR-MIB::entPhySensorType The type of data returned by the associated entPhySensorValue object.</p>|`SNMP agent`|entPhySensorType[Temperature]<p>Update: 300</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Max Possible Sessions|<p>PAN-COMMON-MIB::panSessionMax Total number of sessions supported.</p>|`SNMP agent`|panSessionMax<p>Update: 3600</p>|
|Hardware Version|<p>PAN-COMMON-MIB::panSysHwVersion Hardware version of the unit.</p>|`SNMP agent`|panSysHwVersion<p>Update: 3600</p>|
|Session Utilization|<p>PAN-COMMON-MIB::panSessionUtilization Session table utilization percentage.</p>|`SNMP agent`|panSessionUtilization<p>Update: 300</p>|
|Software Version|<p>PAN-COMMON-MIB::panSysSwVersion Full software version. The first two components of the full version are the major and minor versions. The third component indicates the maintenance release number and the fourth, the build number.</p>|`SNMP agent`|panSysSwVersion<p>Update: 3600</p>|
|Chassis Type|<p>PAN-COMMON-MIB::panChassisType Chassis type for this Palo Alto device.</p>|`SNMP agent`|panChassisType<p>Update: 86400</p>|
|{#SNMPVALUE} Size|<p>-</p>|`SNMP agent`|hrStorageSize[memory,{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|{#SNMPVALUE} Used|<p>-</p>|`SNMP agent`|hrStorageUsed[memory,{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Current speed of $2 $1|<p>ENTITY-SENSOR-MIB::entPhySensorValue The most recent measurement obtained by the agent for this sensor.</p>|`SNMP agent`|entPhySensorValue[{#SNMPVALUE},FAN]<p>Update: 60</p><p>LLD</p>|
|Operational status of FAN $1|<p>ENTITY-SENSOR-MIB::entPhySensorOperStatus The operational status of the sensor.</p>|`SNMP agent`|entPhySensorOperStatus[{#SNMPVALUE},FAN]<p>Update: 30</p><p>LLD</p>|
|Operational status of $2 Sensor $1|<p>ENTITY-SENSOR-MIB::entPhySensorOperStatus The operational status of the sensor.</p>|`SNMP agent`|entPhySensorOperStatus[{#SNMPVALUE},Temperature]<p>Update: 30</p><p>LLD</p>|
|Temperature on Sensor #$1|<p>ENTITY-SENSOR-MIB::entPhySensorValue The most recent measurement obtained by the agent for this sensor.</p>|`SNMP agent`|entPhySensorValue[{#SNMPVALUE},Temperature]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|FAN #{#SNMPINDEX} is nonoperational|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:entPhySensorOperStatus[{#SNMPVALUE},FAN].last()}=3</p><p>**Recovery expression**: </p>|high|
|FAN #{#SNMPINDEX} is unavailable|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:entPhySensorOperStatus[{#SNMPVALUE},FAN].last()}=2</p><p>**Recovery expression**: </p>|average|
|Temperature Sensor #{#SNMPINDEX} is nonoperational|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:entPhySensorOperStatus[{#SNMPVALUE},Temperature].last()}=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor #{#SNMPINDEX} is unavailable|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:entPhySensorOperStatus[{#SNMPVALUE},Temperature].last()}=2</p><p>**Recovery expression**: </p>|average|
|#{#SNMPVALUE} usage is high [{ITEM.LASTVALUE1}]|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:hrStorageUsed[memory,{#SNMPINDEX}].avg(5m)}>{Template_Palo_Alto_Firewall:hrStorageSize[memory,{#SNMPINDEX}].last()}*0.9</p><p>**Recovery expression**: </p>|average|
|#{#SNMPVALUE} usage is high [{ITEM.LASTVALUE1}] (LLD)|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:hrStorageUsed[memory,{#SNMPINDEX}].avg(5m)}>{Template_Palo_Alto_Firewall:hrStorageSize[memory,{#SNMPINDEX}].last()}*0.9</p><p>**Recovery expression**: </p>|average|
|FAN #{#SNMPINDEX} is nonoperational (LLD)|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:entPhySensorOperStatus[{#SNMPVALUE},FAN].last()}=3</p><p>**Recovery expression**: </p>|high|
|FAN #{#SNMPINDEX} is unavailable (LLD)|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:entPhySensorOperStatus[{#SNMPVALUE},FAN].last()}=2</p><p>**Recovery expression**: </p>|average|
|Temperature Sensor #{#SNMPINDEX} is nonoperational (LLD)|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:entPhySensorOperStatus[{#SNMPVALUE},Temperature].last()}=3</p><p>**Recovery expression**: </p>|high|
|Temperature Sensor #{#SNMPINDEX} is unavailable (LLD)|<p>-</p>|<p>**Expression**: {Template_Palo_Alto_Firewall:entPhySensorOperStatus[{#SNMPVALUE},Temperature].last()}=2</p><p>**Recovery expression**: </p>|average|
