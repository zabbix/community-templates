# SNMP Furukawa OLT-ONU G4S - G8S - G2500 - G1040 - LD3032

## Description

Created by Samuel Martins (https://www.linkedin.com/in/slmartins/) Last update: 2021-03-08 Based on Furukawa user's guide - NT-GPONREV00–Março2019 https://github.com/slunart Compatbile with: OLT G4S Firmware: 6.11 OLT G8S Firmware: 1.12 OLT G2500 Firmware: 6.12 OLT G1040 OLT LD3032 Firmware: 2.02

## Overview

Hello,


Template for monitoring the OLT and ONU network devices from the manufacturer Furukawa. 


This template may be compatible with the following OLT models: 


Equipments: 


* OLT G4S
* OLT G8S
* OLT G2500
* OLT G1040
* OLT LD3032


Total of: 


* 13 item prototypes
* 2 prototype triggers


Based on Furukawa user guide - NT-GPONREV00 – March2019


 


Bye!



## Author

Samuel Martins

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ONU Discovery|<p>-</p>|`SNMP agent`|fkGponOnu<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ONU Deactive Reason [OltId.OnuId]: [{#SNMPINDEX}]|<p>NTEGER {none(1), dgi(2), lofi(4), adminReset(10), adminOltConfiguration(12), adminTxOffOptic(18), adminDeactivate(19), adminOltDeactivate(20), adminRemoveOnu(23), los(100), onuDeactReasonRanging(101)}*</p>|`SNMP agent`|fkGponOnuDeactiveReason[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|ONU Description [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the description registered at ONT</p>|`SNMP agent`|fkGponOnuDescription[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|ONU Distance [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the distance of the fiber in meters from OLT to ONT</p>|`SNMP agent`|fkGponOnuDistance[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|ONU Mac Address [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the MAC of the ONT</p>|`SNMP agent`|fkGponOnuHwAddress[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|ONU Link UpTime [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the time in seconds since the last ONT activation</p>|`SNMP agent`|fkGponOnuLinkUpTime[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|ONU Model Name [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the ONT model</p>|`SNMP agent`|fkGponOnuModelName[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|ONU Firmware Active Version [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the active firmware version in the ONT</p>|`SNMP agent`|fkGponOnuNosActiveVersion[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|ONU Nos Upgrade Status [OltId.OnuId]: [{#SNMPINDEX}]|<p>-</p>|`SNMP agent`|fkGponOnuNosUpgradeStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|ONU Profile [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the name of the ONU profile associated with the ONT</p>|`SNMP agent`|fkGponOnuProfile[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|ONU Rx Power [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the optical power Rx of the ONT in deca dBm (101dBm). Limit values from -8.0 to -28.0dBm and it is recommended to define monitoring thresholds of -11.0 and -25.0dBm</p>|`SNMP agent`|fkGponOnuRxPower[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|ONU Serial [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the Serial Number of the ONT</p>|`SNMP agent`|fkGponOnuSerial[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|ONU Status [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the ONT activation state</p>|`SNMP agent`|fkGponOnuStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|ONU SysUpTime [OltId.OnuId]: [{#SNMPINDEX}]|<p>Returns the time in seconds since the last reset of the ONT</p>|`SNMP agent`|fkGponOnuSysUpTime[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|ONU  [{#SNMPINDEX}] Rx Optical Power Outside Recommended Standards|<p>Valores limitesde -8,0 a -28,0dBm sendo recomendada a definição de thresholds de monitoração de -11,0 e -25,0dBm</p>|<p>**Expression**: last(/SNMP Furukawa OLT-ONU G4S - G8S - G2500 - G1040 - LD3032/fkGponOnuRxPower[{#SNMPINDEX}])>-11 or last(/SNMP Furukawa OLT-ONU G4S - G8S - G2500 - G1040 - LD3032/fkGponOnuRxPower[{#SNMPINDEX}])<-25</p><p>**Recovery expression**: </p>|average|
|ONU [OltId.OnuId]: [{#SNMPINDEX}] is Inactive|<p>-</p>|<p>**Expression**: last(/SNMP Furukawa OLT-ONU G4S - G8S - G2500 - G1040 - LD3032/fkGponOnuStatus[{#SNMPINDEX}],#3)=1</p><p>**Recovery expression**: </p>|high|
|ONU  [{#SNMPINDEX}] Rx Optical Power Outside Recommended Standards (LLD)|<p>Valores limitesde -8,0 a -28,0dBm sendo recomendada a definição de thresholds de monitoração de -11,0 e -25,0dBm</p>|<p>**Expression**: last(/SNMP Furukawa OLT-ONU G4S - G8S - G2500 - G1040 - LD3032/fkGponOnuRxPower[{#SNMPINDEX}])>-11 or last(/SNMP Furukawa OLT-ONU G4S - G8S - G2500 - G1040 - LD3032/fkGponOnuRxPower[{#SNMPINDEX}])<-25</p><p>**Recovery expression**: </p>|average|
|ONU [OltId.OnuId]: [{#SNMPINDEX}] is Inactive (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP Furukawa OLT-ONU G4S - G8S - G2500 - G1040 - LD3032/fkGponOnuStatus[{#SNMPINDEX}],#3)=1</p><p>**Recovery expression**: </p>|high|
