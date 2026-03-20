# NETAPP_FAS_ONTAP_9.1

## Description

Template Ontap 9.1

## Overview

Don't hesitate to tell me how improve this template.


 


 


Best regard.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Volumes|<p>-</p>|`SNMP agent`|volume<p>Update: 3600</p>|
|Enclosure info|<p>-</p>|`SNMP agent`|enclosure<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU %|<p>-</p>|`SNMP agent`|cpuTimePerCent<p>Update: 1m</p>|
|Uptime|<p>-</p>|`SNMP agent`|uptime<p>Update: 5m</p>|
|Total disk number|<p>-</p>|`SNMP agent`|nbTotalDisk<p>Update: 3600</p>|
|Auto-support status|<p>-</p>|`SNMP agent`|autosupportStatus<p>Update: 3600</p>|
|Firmware|<p>-</p>|`SNMP agent`|productFirmwareVersion<p>Update: 60m</p>|
|Disk pre-fail|<p>-</p>|`SNMP agent`|preFail<p>Update: 30s</p>|
|Disk fail|<p>-</p>|`SNMP agent`|failDisk<p>Update: 30s</p>|
|Volume[{#VOLNAME}] TotalSize 64 bits|<p>-</p>|`SNMP agent`|df64TotalKBytesVol[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Volume[{#VOLNAME}] Used 64 bits|<p>-</p>|`SNMP agent`|df64UsedKBytesVol[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Pourcentage [{#VOLNAME}]  vol used|<p>-</p>|`Calculated`|Pvolused-[{#VOLNAME}]<p>Update: 3600</p><p>LLD</p>|
|Enclosure {#SNMPINDEX} power fail|<p>-</p>|`SNMP agent`|ElecFail.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Enclosure {#SNMPINDEX}  fail|<p>-</p>|`SNMP agent`|FanFail.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Enclosure {#SNMPINDEX} sensors fail|<p>-</p>|`SNMP agent`|SensorFail.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Enclosure {#SNMPINDEX} temp over|<p>-</p>|`SNMP agent`|TempOver.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Enclosure {#SNMPINDEX} power fail|<p>-</p>|`SNMP agent`|TempWarn.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} Enclosure {#SNMPINDEX} Electronic failure|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/ElecFail.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Enclosure {#SNMPINDEX} Fan fail|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/FanFail.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Enclosure {#SNMPINDEX} Sensor failure|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/SensorFail.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Enclosure {#SNMPINDEX} Temp Alert|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/TempOver.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Enclosure {#SNMPINDEX} Temperature Warning|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/TempWarn.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME} [{#VOLNAME}] used over 95 %|<p>-</p>|<p>**Expression**: last(/NETAPP_FAS_ONTAP_9.1/Pvolused-[{#VOLNAME}])>95</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME} [{#VOLNAME}] used over 95 % (LLD)|<p>-</p>|<p>**Expression**: last(/NETAPP_FAS_ONTAP_9.1/Pvolused-[{#VOLNAME}])>95</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME} Enclosure {#SNMPINDEX} Electronic failure (LLD)|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/ElecFail.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Enclosure {#SNMPINDEX} Fan fail (LLD)|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/FanFail.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Enclosure {#SNMPINDEX} Sensor failure (LLD)|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/SensorFail.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Enclosure {#SNMPINDEX} Temp Alert (LLD)|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/TempOver.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Enclosure {#SNMPINDEX} Temperature Warning (LLD)|<p>-</p>|<p>**Expression**: length(last(/NETAPP_FAS_ONTAP_9.1/TempWarn.[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|average|
