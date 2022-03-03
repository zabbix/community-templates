# Ubiquiti LTU-rocket wireless

## Overview

Zabbix version 5.  
  
SNMPv2  
  
Items for AP: Wireless Role, Wireless channel bandwidth, Tx power EIRP, Tx modulation, The percentage of total memory usage, The percentage of total CPU usage, The main frequency to use, The MAC address of this device, The list of alternative frequencies, The firmware version running, The device name, The device model, Radio SSID, Radio connected, Packet per second for tx, Packet per second for rx, GPS status, GPS Satellites Visible, GPS Satellites Tracked, GPS Longitude, GPS Latitude, GPS Horizontal Dilution of Precision, GPS Fix Obtained, GPS Altitude (m), GPS Altitude (ft), Ethernet packet per second for tx, Ethernet packet per second for rx, Ethernet Data port plugged, Cable loss, Automatic Tx modulation selection, Antenna gain.  
  
Items for CPE discovery: Device Model, Device Name, Distance, Firmware, IdealRxPower0 (ap), IdealRxPower1 (ap), Last IP address, Latency, Registration Attempts, Rx Capacity, RxIdealPower0 (cpe), RxIdealPower1 (cpe), RxPower0 (ap), RxPower0 (cpe), RxPower1 (ap), RxPower1 (cpe), RxPowerLevel0 (ap), RxPowerLevel0 (cpe), RxPowerLevel1 (ap), RxPowerLevel1 (cpe), RxRate, Tx Capacity, TxPower EIRP (cpe), TxRate.  
  
  
Just data retrieval. Template has no triggers, graphs or screens.



## Author

Kari Karvonen

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPE discovery|<p>-</p>|`SNMP agent`|ubnt.cpe.discovery<p>Update: 60m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|The MAC address of this device|<p>-</p>|`SNMP agent`|afLTUMac.0<p>Update: 24h</p>|
|Radio connected|<p>-</p>|`SNMP agent`|afLTUConnected.0<p>Update: 5m</p>|
|The device model|<p>-</p>|`SNMP agent`|afLTUDevModel.0<p>Update: 24h</p>|
|Ethernet packet per second for tx|<p>-</p>|`SNMP agent`|afLTUethTxPps.0<p>Update: 1m</p>|
|Radio SSID|<p>-</p>|`SNMP agent`|afLTUSsid.0<p>Update: 60m</p>|
|The main frequency to use|<p>-</p>|`SNMP agent`|afLTUFrequency.0<p>Update: 60m</p>|
|The percentage of total CPU usage|<p>-</p>|`SNMP agent`|afLTUCpuUsage.0<p>Update: 5m</p>|
|Cable loss|<p>-</p>|`SNMP agent`|afLTUCableLoss.0<p>Update: 60m</p>|
|GPS Altitude (ft)|<p>-</p>|`SNMP agent`|afLTUgpsAltFeet.0<p>Update: 5m</p>|
|The percentage of total memory usage|<p>-</p>|`SNMP agent`|afLTUMemoryUsage.0<p>Update: 5m</p>|
|Wireless channel bandwidth|<p>bw10M(10),bw20M(20),bw30M(30),bw40M(40),bw50M(50),bw60M(60),bw80M(80),bw100M(100)</p>|`SNMP agent`|afLTUBandwidth.0<p>Update: 60m</p>|
|GPS Fix Obtained|<p>-</p>|`SNMP agent`|afLTUgpsDimensions.0<p>Update: 5m</p>|
|The list of alternative frequencies|<p>Multiple frequencies should be separated with commas. For example: '5250,5670,5800'.</p>|`SNMP agent`|afLTUAltFreqList.0<p>Update: 60m</p>|
|Automatic Tx modulation selection|<p>-</p>|`SNMP agent`|afLTUTxRateAuto.0<p>Update: 60m</p>|
|Antenna gain|<p>-</p>|`SNMP agent`|afLTUAntennaGain.0<p>Update: 60m</p>|
|GPS Altitude (m)|<p>-</p>|`SNMP agent`|afLTUgpsAltMeter.0<p>Update: 5m</p>|
|Tx power EIRP|<p>-</p>|`SNMP agent`|afLTUTxEIRP.0<p>Update: 60m</p>|
|Packet per second for tx|<p>-</p>|`SNMP agent`|afLTUTxPps.0<p>Update: 1m</p>|
|The firmware version running|<p>-</p>|`SNMP agent`|afLTUFirmwareVersion.0<p>Update: 1h</p>|
|Ethernet Data port plugged|<p>-</p>|`SNMP agent`|afLTUethConnected.0<p>Update: 5m</p>|
|GPS Satellites Tracked|<p>-</p>|`SNMP agent`|afLTUgpsSatsTracked.0<p>Update: 5m</p>|
|Packet per second for rx|<p>-</p>|`SNMP agent`|afLTURxPps.0<p>Update: 1m</p>|
|Tx modulation|<p>-</p>|`SNMP agent`|afLTUTxRate.0<p>Update: 60m</p>|
|GPS Longitude|<p>-</p>|`SNMP agent`|afLTUgpsLon.0<p>Update: 5m</p>|
|GPS Satellites Visible|<p>-</p>|`SNMP agent`|afLTUgpsSatsVisible.0<p>Update: 5m</p>|
|GPS status|<p>-</p>|`SNMP agent`|afLTUgpsStatus.0<p>Update: 5m</p>|
|Wireless Role|<p>-</p>|`SNMP agent`|afLTURole.0<p>Update: 60m</p>|
|Ethernet packet per second for rx|<p>-</p>|`SNMP agent`|afLTUethRxPps.0<p>Update: 1m</p>|
|The device name|<p>-</p>|`SNMP agent`|afLTUDevName.0<p>Update: 24h</p>|
|GPS Horizontal Dilution of Precision|<p>-</p>|`SNMP agent`|afLTUgpsHDOP.0<p>Update: 5m</p>|
|GPS Latitude|<p>-</p>|`SNMP agent`|afLTUgpsLat.0<p>Update: 5m</p>|
|CPE {#REMOTEMAC} Distance|<p>-</p>|`SNMP agent`|Distance[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxPowerLevel0 (cpe)|<p>-</p>|`SNMP agent`|RemoteRxPowerLevel0[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} Tx Capacity|<p>-</p>|`SNMP agent`|TxCapacity[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxRate|<p>-</p>|`SNMP agent`|RxRate[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxPowerLevel1 (ap)|<p>-</p>|`SNMP agent`|RxPowerLevel1[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxPowerLevel0 (ap)|<p>-</p>|`SNMP agent`|RxPowerLevel0[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxPower1 (ap)|<p>-</p>|`SNMP agent`|RxPower1[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxPower0 (ap)|<p>-</p>|`SNMP agent`|RxPower0[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} Rx Capacity|<p>-</p>|`SNMP agent`|RxCapacity[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} TxPower EIRP (cpe)|<p>-</p>|`SNMP agent`|RemoteTxEIRP[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxPowerLevel1 (cpe)|<p>-</p>|`SNMP agent`|RemoteRxPowerLevel1[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxPower1 (cpe)|<p>-</p>|`SNMP agent`|RemoteRxPower1[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} IdealRxPower0 (ap)|<p>-</p>|`SNMP agent`|IdealRxPower0[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxPower0 (cpe)|<p>-</p>|`SNMP agent`|RemoteRxPower0[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxIdealPower1 (cpe)|<p>-</p>|`SNMP agent`|RemoteIdealRxPower1[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} RxIdealPower0 (cpe)|<p>-</p>|`SNMP agent`|RemoteIdealRxPower0[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} Firmware|<p>-</p>|`SNMP agent`|RemoteFirmwareVersion[{#SNMPINDEX}]<p>Update: 60m</p><p>LLD</p>|
|CPE {#REMOTEMAC} Device Name|<p>-</p>|`SNMP agent`|RemoteDevName[{#SNMPINDEX}]<p>Update: 60m</p><p>LLD</p>|
|CPE {#REMOTEMAC} Device Model|<p>-</p>|`SNMP agent`|RemoteDevModel[{#SNMPINDEX}]<p>Update: 60m</p><p>LLD</p>|
|CPE {#REMOTEMAC} Registration Attempts|<p>-</p>|`SNMP agent`|RegistrationAttempts[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} Latency|<p>-</p>|`SNMP agent`|Latency[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} Last IP address|<p>-</p>|`SNMP agent`|LastIpAddress[{#SNMPINDEX}]<p>Update: 15m</p><p>LLD</p>|
|CPE {#REMOTEMAC} IdealRxPower1 (ap)|<p>-</p>|`SNMP agent`|IdealRxPower1[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|CPE {#REMOTEMAC} TxRate|<p>-</p>|`SNMP agent`|TxRate[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

