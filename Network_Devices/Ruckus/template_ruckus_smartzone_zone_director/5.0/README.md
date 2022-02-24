# Template SNMP Ruckus Zonedirector

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Ruckus APs|<p>-</p>|`SNMP agent`|AP-[{#SNMPVALUE}]<p>Update: 3600</p>|
|Ruckus APs NN|<p>Not normalized discovery, to use with Grafana.</p>|`SNMP agent`|APNN-[{#SNMPVALUE}]<p>Update: 3600</p>|
|ssids|<p>-</p>|`SNMP agent`|ssid-[{#SNMPVALUE}]<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Total Tx Bytes|<p>-</p>|`SNMP agent`|ruckusSZSystemStatsWLANTotalTxBytes<p>Update: 1200</p>|
|Total Users|<p>-</p>|`SNMP agent`|ruckusSZSystemStatsNumSta<p>Update: 300</p>|
|Total Access Points|<p>-</p>|`SNMP agent`|ruckusSZSystemStatsNumAP<p>Update: 3600</p>|
|Total Rx Bytes|<p>-</p>|`SNMP agent`|ruckusSZSystemStatsWLANTotalRxBytes<p>Update: 1200</p>|
|AP $1 : Auth Clients|<p>-</p>|`SNMP agent`|ruckusZDWLANAPNumSta[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|AP $1 : Status|<p>-</p>|`SNMP agent`|ruckusZDWLANAPStatus[{#SNMPVALUE}]<p>Update: 360</p><p>LLD</p>|
|AP $1 : Count|<p>-</p>|`Calculated`|ruckusZDWLANAPCount[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|AP $1 : Description|<p>-</p>|`SNMP agent`|ruckusZDWLANAPDescription[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : External IP|<p>-</p>|`SNMP agent`|ruckusZDWLANAPExternalIp[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : External Port|<p>-</p>|`SNMP agent`|ruckusZDWLANAPExternalPort[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : Firmware Version|<p>-</p>|`SNMP agent`|ruckusZDWLANAPFirmwareVersion[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : Group|<p>-</p>|`SNMP agent`|ruckusZDWLANAPGroup[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : IP Type|<p>-</p>|`SNMP agent`|ruckusZDWLANAPIpType[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : IP|<p>-</p>|`SNMP agent`|ruckusZDWLANAPIp[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : Location|<p>-</p>|`SNMP agent`|ruckusZDWLANAPLocation[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : Model|<p>-</p>|`SNMP agent`|ruckusZDWLANAPModel[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : Name|<p>-</p>|`SNMP agent`|ruckusZDWLANAPName[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|AP $1 : Serial|<p>-</p>|`SNMP agent`|ruckusZDWLANAPSerial[{#SNMPVALUE}]<p>Update: 36000</p><p>LLD</p>|
|AP $1 : Uptime|<p>-</p>|`SNMP agent`|ruckusZDWLANAPUpTime[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|AP $1#{#GROUP}#{#DESCRIPTION}#{#NAME} : Auth Clients|<p>-</p>|`SNMP agent`|ruckusZDWLANAPNumStaNN[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|SSID $1 : Clients|<p>-</p>|`SNMP agent`|ruckusSZWLANNumSta[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|SSID $1 : Name|<p>-</p>|`SNMP agent`|ruckusSZWLANSSID[{#SNMPVALUE}]<p>Update: 21600</p><p>LLD</p>|
|SSID $1 : Rx Bytes|<p>-</p>|`SNMP agent`|ruckusZDWLANRxBytes[{#SNMPVALUE}]<p>Update: 1200</p><p>LLD</p>|
|SSID $1 : Tx Bytes|<p>-</p>|`SNMP agent`|ruckusZDWLANTxBytes[{#SNMPVALUE}]<p>Update: 1200</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Wifi {ITEM.VALUE2} indisponível. Endereço físico {#SNMPVALUE}. Grupo {ITEM.VALUE3}|<p>-</p>|<p>**Expression**: ({Template SNMP Ruckus Zonedirector:ruckusZDWLANAPStatus[{#SNMPVALUE}].regexp(^Connect$)}=0)or({Template SNMP Ruckus Zonedirector:ruckusZDWLANAPName[{#SNMPVALUE}].regexp($blablablabla^)}=1) or ({Template SNMP Ruckus Zonedirector:ruckusZDWLANAPGroup[{#SNMPVALUE}].regexp($blablablabla^)}=1)</p><p>**Recovery expression**: </p>|warning|
|Wifi {ITEM.VALUE2} indisponível. Endereço físico {#SNMPVALUE}. Grupo {ITEM.VALUE3} (LLD)|<p>-</p>|<p>**Expression**: ({Template SNMP Ruckus Zonedirector:ruckusZDWLANAPStatus[{#SNMPVALUE}].regexp(^Connect$)}=0)or({Template SNMP Ruckus Zonedirector:ruckusZDWLANAPName[{#SNMPVALUE}].regexp($blablablabla^)}=1) or ({Template SNMP Ruckus Zonedirector:ruckusZDWLANAPGroup[{#SNMPVALUE}].regexp($blablablabla^)}=1)</p><p>**Recovery expression**: </p>|warning|
