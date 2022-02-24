# SNMP NetApp cDot

## Overview

For Netapp Ontape 9.5 and later.


Discovery rules:


- Aggregates  
- Enclosures  
- LIFs   
- Nodes   
- SnapMirror (New)  
- Volumes


Based on "NETAPP ONTAP 9.1" edited by "[zabbiJ](owner/zabbiJ)".



## Author

eric_at_2037

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Enclosures|<p>-</p>|`SNMP agent`|encl<p>Update: 12h</p>|
|Nodes|<p>-</p>|`SNMP agent`|node<p>Update: 12h</p>|
|SnapMirror|<p>-</p>|`SNMP agent`|snapmirror<p>Update: 300s</p>|
|LIFs|<p>-</p>|`SNMP agent`|lif<p>Update: 12h</p>|
|Volumes|<p>-</p>|`SNMP agent`|volume<p>Update: 12h</p>|
|Aggregates|<p>-</p>|`SNMP agent`|aggr<p>Update: 12h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of Disks|<p>-</p>|`SNMP agent`|diskTotalCount<p>Update: 30m</p>|
|Autosupport Failed Sends|<p>-</p>|`SNMP agent`|autosupportFailedSends<p>Update: 5m</p>|
|Number of reconstructing parity Disks|<p>-</p>|`SNMP agent`|diskReconstructingParityCount<p>Update: 1m</p>|
|Autosupport Status Message|<p>-</p>|`SNMP agent`|autosupportStatusMessage<p>Update: 5m</p>|
|Number of verifying parity Disks|<p>-</p>|`SNMP agent`|diskVerifyingParityCount<p>Update: 1m</p>|
|Number of spare Disks|<p>-</p>|`SNMP agent`|diskSpareCount<p>Update: 30m</p>|
|Failed Disks Count|<p>-</p>|`SNMP agent`|diskFailedCount<p>Update: 1m</p>|
|Prefailed Disks Count|<p>-</p>|`SNMP agent`|diskPrefailedCount<p>Update: 1m</p>|
|Disk Failed Message|<p>-</p>|`SNMP agent`|diskFailedMessage<p>Update: 1m</p>|
|Product Version|<p>-</p>|`SNMP agent`|productVersio<p>Update: 30m</p>|
|Autosupport Status|<p>-</p>|`SNMP agent`|autosupportStatus<p>Update: 5m</p>|
|CPU usage (%)|<p>-</p>|`SNMP agent`|cpuBusyTimePerCent<p>Update: 1m</p>|
|Autosupport Successful Sends|<p>-</p>|`SNMP agent`|autosupportSuccessfulSends<p>Update: 5m</p>|
|CPU Count|<p>-</p>|`SNMP agent`|cpuCount<p>Update: 30m</p>|
|Enclosure[{#ENCLNUM}] Failed Electronic|<p>-</p>|`SNMP agent`|enclElectronicsFailed[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Over Temperature warn|<p>-</p>|`SNMP agent`|enclTempSensorsOverTempWarn[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Under Voltage fail|<p>-</p>|`SNMP agent`|enclVoltSensorsUnderVoltFail[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Over Voltage warn|<p>-</p>|`SNMP agent`|enclVoltSensorsOverVoltWarn[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Over Voltage fail|<p>-</p>|`SNMP agent`|enclVoltSensorsOverVoltFail[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Current Voltage|<p>-</p>|`SNMP agent`|enclVoltSensorsCurrentVolt[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Under Temperature warn|<p>-</p>|`SNMP agent`|enclTempSensorsUnderTempWarn[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Under Temperature fail|<p>-</p>|`SNMP agent`|enclTempSensorsUnderTempFail[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Over Temperature fail|<p>-</p>|`SNMP agent`|enclTempSensorsOverTempFail[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Electronic|<p>-</p>|`SNMP agent`|enclElectronicsPresent[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Current Temperature|<p>-</p>|`SNMP agent`|enclTempSensorsCurrentTemp[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Product Model|<p>-</p>|`SNMP agent`|enclProductModel[{#SNMPINDEX}]<p>Update: 12h</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Product ID|<p>-</p>|`SNMP agent`|enclProductID[{#SNMPINDEX}]<p>Update: 12h</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Failed Power Supplies|<p>-</p>|`SNMP agent`|enclPowerSuppliesFailed[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Fans Speed|<p>-</p>|`SNMP agent`|enclFansSpeed[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Failed Fans|<p>-</p>|`SNMP agent`|enclFansFailed[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Enclosure[{#ENCLNUM}] Under Voltage warn|<p>-</p>|`SNMP agent`|enclVoltSensorsUnderVoltWarn[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Node[{#NODENAME}] cannot take over cause|<p>-</p>|`SNMP agent`|haCannotTakeoverCause[{#NODENAME}]<p>Update: 1m</p><p>LLD</p>|
|Node[{#NODENAME}] HA Interconnect Status|<p>-</p>|`SNMP agent`|haInterconnectStatus[{#NODENAME}]<p>Update: 1m</p><p>LLD</p>|
|Node[{#NODENAME}] HA Partner Name|<p>-</p>|`SNMP agent`|haPartnerName[{#NODENAME}]<p>Update: 12h</p><p>LLD</p>|
|Node[{#NODENAME}] HA Partner Status|<p>-</p>|`SNMP agent`|haPartnerStatus[{#NODENAME}]<p>Update: 1m</p><p>LLD</p>|
|Node[{#NODENAME}] HA Settings|<p>-</p>|`SNMP agent`|haSettings[{#NODENAME}]<p>Update: 1m</p><p>LLD</p>|
|Node[{#NODENAME}] HA State|<p>-</p>|`SNMP agent`|haState[{#NODENAME}]<p>Update: 1m</p><p>LLD</p>|
|SnapMirror [{#SNAPINDEX}] Destination Path|<p>-</p>|`SNMP agent`|snapmirrorRelDestPath[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|SnapMirror [{#SNAPINDEX}] Healthy|<p>-</p>|`SNMP agent`|snapmirrorRelHealthy[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|SnapMirror [{#SNAPINDEX}] Lag|<p>-</p>|`SNMP agent`|snapmirrorRelLag[{#SNMPINDEX}]<p>Update: 300s</p><p>LLD</p>|
|SnapMirror {#SNAPINDEX} Last Transfer Size|<p>-</p>|`SNMP agent`|snapmirrorRelLastTransferSize[{#SNMPINDEX}]<p>Update: 300s</p><p>LLD</p>|
|SnapMirror {#SNAPINDEX} Last Transfer Time|<p>-</p>|`SNMP agent`|snapmirrorRelLastTransferTime[{#SNMPINDEX}]<p>Update: 300s</p><p>LLD</p>|
|SnapMirror {#SNAPINDEX}  Source Path|<p>-</p>|`SNMP agent`|snapmirrorRelSrcPath[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|SnapMirror {#SNAPINDEX} State|<p>-</p>|`SNMP agent`|snapmirrorRelState[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|SnapMirror {#SNAPINDEX} Status|<p>-</p>|`SNMP agent`|snapmirrorRelStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|VIF[{#VIF}] is Home|<p>-</p>|`SNMP agent`|logicalInterfaceIsHome[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume[{#VOLNAME}] Size|<p>-</p>|`SNMP agent`|df64TotalKBytesVol[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume[{#VOLNAME}] Used|<p>-</p>|`SNMP agent`|df64UsedKBytesVol[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume[{#VOLNAME}] Used (%)|<p>-</p>|`SNMP agent`|dfPerCentKBytesCapacityVol[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume[{#VOLNAME}] Used Inode %|<p>-</p>|`SNMP agent`|dfVolInodePercent[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Volume[{#VOLNAME}] Aggregate|<p>-</p>|`SNMP agent`|volAggrName[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|Volume[{#VOLNAME}] NV Failed State|<p>Indicates whether the volume is in nvfailed state. This is only applicable to cluster-mode volumes.</p>|`SNMP agent`|volInNvfailedState[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume[{#VOLNAME}] Language|<p>-</p>|`SNMP agent`|volLanguage[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|Volume[{#VOLNAME}] NV Failed enabled|<p>Indicates whether nvfail option is enabled on this volume.</p>|`SNMP agent`|volNvfail[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume[{#VOLNAME}] Space Guarantee enabled|<p>.</p>|`SNMP agent`|volSpaceGuaranteeEnabled[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|Volume[{#VOLNAME}] Space Guarantee|<p>.</p>|`SNMP agent`|volSpaceGuarantee[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|Volume[{#VOLNAME}] State|<p>-</p>|`SNMP agent`|volState[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Volume[{#VOLNAME}] Type|<p>Type of this volume, older volumes are traditional while newer volumes contained in aggregates are flexible.</p>|`SNMP agent`|volType[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|Volume[{#VOLNAME}] Vserver|<p>-</p>|`SNMP agent`|volVserver[{#SNMPINDEX}]<p>Update: 3h</p><p>LLD</p>|
|Aggregate Owners[{#AGGRNAME}]|<p>-</p>|`SNMP agent`|aggrOwners[{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|
|Aggregate Raidtype[{#AGGRNAME}]|<p>-</p>|`SNMP agent`|aggrRaidType[{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|
|Aggregate State[{#AGGRNAME}]|<p>-</p>|`SNMP agent`|aggrState[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Aggregate Status[{#AGGRNAME}]|<p>-</p>|`SNMP agent`|aggrStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Aggregate Type[{#AGGRNAME}]|<p>-</p>|`SNMP agent`|aggrType[{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|
|Aggregate Size[{#AGGRNAME}]|<p>-</p>|`SNMP agent`|df64TotalKBytes[{#SNMPINDEX}]<p>Update: 30m</p><p>LLD</p>|
|Aggregate Used Size[{#AGGRNAME}]|<p>-</p>|`SNMP agent`|df64UsedKBytes[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Aggregate Size Free (%)[{#AGGRNAME}]|<p>-</p>|`SNMP agent`|dfPerCentKBytesCapacity[{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Aggregate Filesystem Status[{#AGGRNAME}]|<p>-</p>|`SNMP agent`|dfStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Filesystem {#AGGRNAME} not mounted|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfStatus[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|average|
|Free Size on {#AGGRNAME} less than 10%|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfPerCentKBytesCapacity[{#SNMPINDEX}])<10</p><p>**Recovery expression**: </p>|high|
|Free Size on {#AGGRNAME} less than 20%|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfPerCentKBytesCapacity[{#SNMPINDEX}])<20</p><p>**Recovery expression**: </p>|average|
|Failed electric: {ITEM.LASTVALUE} on Enclosure[{#ENCLNUM}]|<p>-</p>|<p>**Expression**: length(last(/SNMP NetApp cDot/enclElectronicsFailed[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|Failed fans: {ITEM.LASTVALUE} on Enclosure[{#ENCLNUM}]|<p>-</p>|<p>**Expression**: length(last(/SNMP NetApp cDot/enclFansFailed[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|Failed power supply: {ITEM.LASTVALUE} on Enclosure[{#ENCLNUM}]|<p>-</p>|<p>**Expression**: length(last(/SNMP NetApp cDot/enclPowerSuppliesFailed[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|LIF[{#VIF}] on {HOST.NAME} not at home port|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/logicalInterfaceIsHome[{#SNMPINDEX}])>1</p><p>**Recovery expression**: </p>|average|
|{HOST.HOST} can not takeover|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/haState[{#NODENAME}])<>2</p><p>**Recovery expression**: </p>|high|
|{HOST.HOST} HA disabled|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/haSettings[{#NODENAME}])<>2</p><p>**Recovery expression**: </p>|high|
|{HOST.HOST} Interconnect status not up|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/haInterconnectStatus[{#NODENAME}])<>4</p><p>**Recovery expression**: </p>|average|
|{HOST.HOST} Partner status not ok|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/haPartnerStatus[{#NODENAME}])<>2</p><p>**Recovery expression**: </p>|average|
|SnapMirror [{#SNAPINDEX}] is not Healthy|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelHealthy[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|SnapMirror [{#SNAPINDEX}] Lag is greater than 1 day|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelLag[{#SNMPINDEX}])>86400</p><p>**Recovery expression**: </p>|average|
|SnapMirror [{#SNAPINDEX}] Lag is greater than 2 days|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelLag[{#SNMPINDEX}])>172800</p><p>**Recovery expression**: </p>|high|
|SnapMirror [{#SNAPINDEX}] Lag is greater than 5 days|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelLag[{#SNMPINDEX}])>432000</p><p>**Recovery expression**: </p>|disaster|
|SnapMirror {#SNAPINDEX} is having problems|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelStatus[{#SNMPINDEX}])>=11</p><p>**Recovery expression**: </p>|high|
|SnapMirror {#SNAPINDEX} is not idle|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelStatus[{#SNMPINDEX}])<>0</p><p>**Recovery expression**: </p>|information|
|Free Inode on Volume[{#VOLNAME}] less than 10%|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfVolInodePercent[{#SNMPINDEX}])>89</p><p>**Recovery expression**: </p>|disaster|
|Free Inode on Volume[{#VOLNAME}] less than 25%|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfVolInodePercent[{#SNMPINDEX}])>84</p><p>**Recovery expression**: </p>|high|
|Free Size on Volume[{#VOLNAME}] less than 10%|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfPerCentKBytesCapacityVol[{#SNMPINDEX}])>90</p><p>**Recovery expression**: </p>|high|
|Free Size on Volume[{#VOLNAME}] less than 20%|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfPerCentKBytesCapacityVol[{#SNMPINDEX}])>80</p><p>**Recovery expression**: </p>|average|
|Failed electric: {ITEM.LASTVALUE} on Enclosure[{#ENCLNUM}] (LLD)|<p>-</p>|<p>**Expression**: length(last(/SNMP NetApp cDot/enclElectronicsFailed[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|Failed fans: {ITEM.LASTVALUE} on Enclosure[{#ENCLNUM}] (LLD)|<p>-</p>|<p>**Expression**: length(last(/SNMP NetApp cDot/enclFansFailed[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|Failed power supply: {ITEM.LASTVALUE} on Enclosure[{#ENCLNUM}] (LLD)|<p>-</p>|<p>**Expression**: length(last(/SNMP NetApp cDot/enclPowerSuppliesFailed[{#SNMPINDEX}]))>0</p><p>**Recovery expression**: </p>|high|
|{HOST.HOST} can not takeover (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/haState[{#NODENAME}])<>2</p><p>**Recovery expression**: </p>|high|
|{HOST.HOST} HA disabled (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/haSettings[{#NODENAME}])<>2</p><p>**Recovery expression**: </p>|high|
|{HOST.HOST} Interconnect status not up (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/haInterconnectStatus[{#NODENAME}])<>4</p><p>**Recovery expression**: </p>|average|
|{HOST.HOST} Partner status not ok (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/haPartnerStatus[{#NODENAME}])<>2</p><p>**Recovery expression**: </p>|average|
|SnapMirror [{#SNAPINDEX}] is not Healthy (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelHealthy[{#SNMPINDEX}])<>1</p><p>**Recovery expression**: </p>|high|
|SnapMirror [{#SNAPINDEX}] Lag is greater than 1 day (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelLag[{#SNMPINDEX}])>86400</p><p>**Recovery expression**: </p>|average|
|SnapMirror [{#SNAPINDEX}] Lag is greater than 2 days (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelLag[{#SNMPINDEX}])>172800</p><p>**Recovery expression**: </p>|high|
|SnapMirror [{#SNAPINDEX}] Lag is greater than 5 days (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelLag[{#SNMPINDEX}])>432000</p><p>**Recovery expression**: </p>|disaster|
|SnapMirror {#SNAPINDEX} is having problems (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelStatus[{#SNMPINDEX}])>=11</p><p>**Recovery expression**: </p>|high|
|SnapMirror {#SNAPINDEX} is not idle (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/snapmirrorRelStatus[{#SNMPINDEX}])<>0</p><p>**Recovery expression**: </p>|information|
|LIF[{#VIF}] on {HOST.NAME} not at home port (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/logicalInterfaceIsHome[{#SNMPINDEX}])>1</p><p>**Recovery expression**: </p>|average|
|Free Inode on Volume[{#VOLNAME}] less than 10% (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfVolInodePercent[{#SNMPINDEX}])>89</p><p>**Recovery expression**: </p>|disaster|
|Free Inode on Volume[{#VOLNAME}] less than 25% (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfVolInodePercent[{#SNMPINDEX}])>84</p><p>**Recovery expression**: </p>|high|
|Free Size on Volume[{#VOLNAME}] less than 10% (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfPerCentKBytesCapacityVol[{#SNMPINDEX}])>90</p><p>**Recovery expression**: </p>|high|
|Free Size on Volume[{#VOLNAME}] less than 20% (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfPerCentKBytesCapacityVol[{#SNMPINDEX}])>80</p><p>**Recovery expression**: </p>|average|
|Filesystem {#AGGRNAME} not mounted (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfStatus[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|average|
|Free Size on {#AGGRNAME} less than 10% (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfPerCentKBytesCapacity[{#SNMPINDEX}])<10</p><p>**Recovery expression**: </p>|high|
|Free Size on {#AGGRNAME} less than 20% (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP NetApp cDot/dfPerCentKBytesCapacity[{#SNMPINDEX}])<20</p><p>**Recovery expression**: </p>|average|
