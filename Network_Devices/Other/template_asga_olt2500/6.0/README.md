# SNMP  AsGa OLT2500

## Overview

- Discovery ONUs - 15 Items - 3 Triggers by Onu


- Disconvery PON Interfaces - 8 Items


- Discovery SFP Interfaces - 12 Items - 1 Trigger by Interface


- Discovery XFP Interfaces - 12 Items - 1 Trigger by Interface


I will update in some days, I wait your Suggestions.


 


Thanks!!



## Author

Reginaldo F Lopes

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery ONUs|<p>-</p>|`SNMP agent`|onuDiscoveryONUsQTD<p>Update: 3600</p>|
|Discovery SFP Interfaces|<p>-</p>|`SNMP agent`|oltSFPInvDiscoveryInterfaces<p>Update: 3600</p>|
|Discovery XFP Interfaces|<p>-</p>|`SNMP agent`|oltXFPInvDiscoveryInterfaces<p>Update: 3600</p>|
|Discovery PON Interfaces|<p>-</p>|`SNMP agent`|oltPonInvDiscoveryInterfaces<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Hostname|<p>-</p>|`SNMP agent`|oltGenInfoHostname<p>Update: 3600</p>|
|System Uptime|<p>-</p>|`SNMP agent`|sysUpTime.0<p>Update: 60</p>|
|Discovery ONU Number|<p>-</p>|`SNMP agent`|onuDiscoveryONUsNumber<p>Update: 3600</p>|
|Backup Power Supply State|<p>-</p>|`SNMP agent`|oltGenInfoBackupPowerSupplyState<p>Update: 60</p>|
|Shipping Date|<p>-</p>|`SNMP agent`|oltInvShippingDate<p>Update: 3600</p>|
|CPU temperature|<p>-</p>|`SNMP agent`|oltGenInfoCPUTemperatureValue<p>Update: 60</p>|
|System Location|<p>-</p>|`SNMP agent`|sysLocation.0<p>Update: 3600</p>|
|System Contact|<p>-</p>|`SNMP agent`|sysContact.0<p>Update: 3600</p>|
|System Version|<p>-</p>|`SNMP agent`|oltInvSystemVersion<p>Update: 60</p>|
|Serial Number|<p>-</p>|`SNMP agent`|oltInvSerialNumber<p>Update: 3600</p>|
|MAC Address|<p>-</p>|`SNMP agent`|oltInvMACAddress<p>Update: 3600</p>|
|Main Power Supply State|<p>-</p>|`SNMP agent`|oltGenInfoMainPowerSupplyState<p>Update: 60</p>|
|Hardware Version|<p>-</p>|`SNMP agent`|oltInvHardwareVersion<p>Update: 3600</p>|
|Status ONU  $1|<p>-</p>|`SNMP agent`|onuGenActivationState[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Distance ONU $1|<p>-</p>|`SNMP agent`|onuGenDistance[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Last Alarm Date ONU  $1|<p>-</p>|`SNMP agent`|onuGenLastAlarmDateTime[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Last Alarm ONU  $1|<p>-</p>|`SNMP agent`|onuGenLastAlarm[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Serial ONU  $1|<p>-</p>|`SNMP agent`|onuIdentificationSerialNumber[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Model ONU  $1|<p>-</p>|`SNMP agent`|onuIdentificationType[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Temperature ONU $1|<p>-</p>|`SNMP agent`|onuIfInvInternalTemperature[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|RX Power  ONU  $1|<p>-</p>|`SNMP agent`|onuIfInvRxInputPowerValue[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|TX Power  ONU  $1|<p>-</p>|`SNMP agent`|onuIfInvTxOutputPowerValue[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|MAC Address ONU  $1|<p>-</p>|`SNMP agent`|onuInvMacAddress[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|System Version ONU  $1|<p>-</p>|`SNMP agent`|onuInvSystemVersion[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|MGT IP ONU  $1|<p>-</p>|`SNMP agent`|onuMngIpAddress[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Profile Name ONU  $1|<p>-</p>|`SNMP agent`|onuMngProfileName[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Profile Reason ONU  $1|<p>-</p>|`SNMP agent`|onuMngProfileReason[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Profile Status ONU  $1|<p>-</p>|`SNMP agent`|onuMngProfileStatus[{#SNMPVALUE}]<p>Update: 10</p><p>LLD</p>|
|Admin status of interface $1|<p>-</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Download $1|<p>-</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Operational status of interface $1|<p>-</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Upload $1|<p>-</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|SFP Internal Temperature Interface $1|<p>-</p>|`SNMP agent`|oltEthInvInternalTemperature[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|SFP Laser Wave Lenght Interface $1|<p>-</p>|`SNMP agent`|oltEthInvLaserWaveLength[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|SFP Part Number Interface $1|<p>-</p>|`SNMP agent`|oltEthInvPartNumber[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|SFP Revision Level Interface $1|<p>-</p>|`SNMP agent`|oltEthInvRevisionLevel[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|SFP RX Power Interface $1|<p>-</p>|`SNMP agent`|oltEthInvRxPowerValue[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|SFP Serial Number Interface $1|<p>-</p>|`SNMP agent`|oltEthInvSerialNumber[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|SFP TX Power Interface $1|<p>-</p>|`SNMP agent`|oltEthInvTxPowerValue[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|SFP Vendor Name Interface $1|<p>-</p>|`SNMP agent`|oltEthInvVendorName[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Admin status of interface $1|<p>-</p>|`SNMP agent`|ifAdminStatusXFP[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Download {#SNMPVALUE}|<p>-</p>|`SNMP agent`|ifInOctetsXFP[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Operational status of interface $1|<p>-</p>|`SNMP agent`|ifOperStatusXFP[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Upload $1|<p>-</p>|`SNMP agent`|ifOutOctetsXFP[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|XFP Internal Temperature Interface $1|<p>-</p>|`SNMP agent`|oltXFPInvInternalTemperature[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|XFP Laser Wave Lenght Interface $1|<p>-</p>|`SNMP agent`|oltXFPInvLaserWaveLength[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|XFP Part Number Interface $1|<p>-</p>|`SNMP agent`|oltXFPInvPartNumber[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|XFP Revision Level Interface $1|<p>-</p>|`SNMP agent`|oltXFPInvRevisionLevel[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|XFP RX Power Interface $1|<p>-</p>|`SNMP agent`|oltXFPInvRxPowerValue[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|XFP Serial Number Interface $1|<p>-</p>|`SNMP agent`|oltXFPInvSerialNumber[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|XFP TX Power Interface $1|<p>-</p>|`SNMP agent`|oltXFPInvTxPowerValue[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|XFP Vendor Name Interface $1|<p>-</p>|`SNMP agent`|oltXFPInvVendorName[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|PON Internal Temperature  Interface $1|<p>-</p>|`SNMP agent`|oltPONInvInternalTemperature[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|PON Laser Wave Lenght  Interface $1|<p>-</p>|`SNMP agent`|oltPONInvLaserWaveLength[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|PON PartNumber  Interface $1|<p>-</p>|`SNMP agent`|oltPONInvPartNumber[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|PON Revision Level  Interface $1|<p>-</p>|`SNMP agent`|oltPONInvRevisionLevel[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|PON RX Power Interface $1|<p>-</p>|`SNMP agent`|oltPONInvRxOutputPowerValue[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|PON Serial Number  Interface $1|<p>-</p>|`SNMP agent`|oltPONInvSerialNumber[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|PON TX Power Interface $1|<p>-</p>|`SNMP agent`|oltPONInvTxOutputPowerValue[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|PON Vendor Name  Interface $1|<p>-</p>|`SNMP agent`|oltPONInvVendorName[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/SNMP AsGa OLT2500/ifOperStatus[{#SNMPVALUE}],#1)<>last(/SNMP AsGa OLT2500/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: (last(/SNMP AsGa OLT2500/ifOperStatusXFP[{#SNMPVALUE}],#1)<>last(/SNMP AsGa OLT2500/ifOperStatusXFP[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Operational status {HOST.NAME} ONU  {#SNMPVALUE} Gen Down|<p>-</p>|<p>**Expression**: last(/SNMP AsGa OLT2500/onuGenActivationState[{#SNMPVALUE}])<>10</p><p>**Recovery expression**: </p>|high|
|Operational status {HOST.NAME} ONU  {#SNMPVALUE} Profile Down|<p>-</p>|<p>**Expression**: last(/SNMP AsGa OLT2500/onuMngProfileStatus[{#SNMPVALUE}])<>7</p><p>**Recovery expression**: </p>|high|
|Operational status {HOST.NAME} ONU  {#SNMPVALUE}  RX Loss or Satured|<p>-</p>|<p>**Expression**: (last(/SNMP AsGa OLT2500/onuIfInvRxInputPowerValue[{#SNMPVALUE}])>-8) or last(/SNMP AsGa OLT2500/onuIfInvRxInputPowerValue[{#SNMPVALUE}])<-28</p><p>**Recovery expression**: </p>|warning|
|Operational status {HOST.NAME} ONU  {#SNMPVALUE} Gen Down (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP AsGa OLT2500/onuGenActivationState[{#SNMPVALUE}])<>10</p><p>**Recovery expression**: </p>|high|
|Operational status {HOST.NAME} ONU  {#SNMPVALUE} Profile Down (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP AsGa OLT2500/onuMngProfileStatus[{#SNMPVALUE}])<>7</p><p>**Recovery expression**: </p>|high|
|Operational status {HOST.NAME} ONU  {#SNMPVALUE}  RX Loss or Satured (LLD)|<p>-</p>|<p>**Expression**: (last(/SNMP AsGa OLT2500/onuIfInvRxInputPowerValue[{#SNMPVALUE}])>-8) or last(/SNMP AsGa OLT2500/onuIfInvRxInputPowerValue[{#SNMPVALUE}])<-28</p><p>**Recovery expression**: </p>|warning|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/SNMP AsGa OLT2500/ifOperStatus[{#SNMPVALUE}],#1)<>last(/SNMP AsGa OLT2500/ifOperStatus[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: (last(/SNMP AsGa OLT2500/ifOperStatusXFP[{#SNMPVALUE}],#1)<>last(/SNMP AsGa OLT2500/ifOperStatusXFP[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|information|
