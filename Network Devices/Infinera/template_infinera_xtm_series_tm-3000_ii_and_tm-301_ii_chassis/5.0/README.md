# ZBX-INFINERA-XTM-SERIES-MONITORING

## Overview

README: <https://github.com/hacktivism-github/zbx-templates-repository/blob/master/zbx-infinera/README.md>


 


 ![Infinera XTM Series Template in Production](media/com_mtree/images/listings/m/481.png)



## Author

Bruno Teixeira

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|XTM Series::Equipment Status::Power Supply Status|<p>-</p>|`SNMP agent`|equipmentPowerName<p>Update: 300</p>|
|XTM Series::PM EthTD::Current Meters and Configuration|<p>-</p>|`SNMP agent`|pmEthTdName<p>Update: 300</p>|
|XTM Series::Equipment Status::Fan status|<p>-</p>|`SNMP agent`|equipmentFanName<p>Update: 300</p>|
|XTM Series::PM Rx/Tx Power Levels::Current Meters and Configuration|<p>-</p>|`SNMP agent`|pmIfName<p>Update: 300</p>|
|XTM Series::Equipment Status::Board Configuration and Status|<p>-</p>|`SNMP agent`|equipmentBoardName<p>Update: 300</p>|
|XTM Series::Equipment Status::Subrack Status|<p>-</p>|`SNMP agent`|equipmentSubrackName<p>Update: 300</p>|
|XTM Series::Client Interfaces::EMXPxxx|<p>-</p>|`SNMP agent`|clientIfName<p>Update: 300</p>|
|XTM Series::Optical Amplifiers|<p>-</p>|`SNMP agent`|oaIfName<p>Update: 300</p>|
|XTM Series::DCN::CU SFP/II::Optical Supervisory Channel|<p>-</p>|`SNMP agent`|dcnIfName<p>Update: 300</p>|
|XTM Series::Metro Ethernet Services|<p>-</p>|`SNMP agent`|mesErrorPropName<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|XTM Series | Unsaved Changes Alarm|<p>-</p>|`SNMP agent`|backupGeneralUnsavedChangesAlarm<p>Update: 300</p>|
|XTM Series | equipmentPowerDCPowerFailedSeverity $1|<p>-</p>|`SNMP agent`|equipmentPowerDCPowerFailedSeverity[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | equipmentPowerDCPowerFailed $1|<p>-</p>|`SNMP agent`|equipmentPowerDCPowerFailed[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | equipmentPowerName $1|<p>-</p>|`SNMP agent`|equipmentPowerName[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|XTM Series | equipmentPowerOperStatus $1|<p>-</p>|`SNMP agent`|equipmentPowerOperStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | equipmentPowerType $1|<p>-</p>|`SNMP agent`|equipmentPowerType[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|XTM Series | Rx Ethernet Traffic Data on $1|<p>-</p>|`SNMP agent`|pmEthTdCurrentContRxOctets[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Tx Ethernet Traffic Data on $1|<p>-</p>|`SNMP agent`|pmEthTdCurrentContTxOctets[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmEthTdName $1|<p>-</p>|`SNMP agent`|pmEthTdName[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | equipmentFanName $1|<p>-</p>|`SNMP agent`|equipmentFanName[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|XTM Series | equipmentFanOperStatus $1|<p>-</p>|`SNMP agent`|equipmentFanOperStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | equipmentFanUnitFailed $1|<p>-</p>|`SNMP agent`|equipmentFanUnitFailed[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmIfAdminStatus $1|<p>-</p>|`SNMP agent`|pmIfAdminStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmIfName $1|<p>-</p>|`SNMP agent`|pmIfName[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmIfOperStatus $1|<p>-</p>|`SNMP agent`|pmIfOperStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmIfRx24hCurrentUAS on $1|<p>-</p>|`SNMP agent`|pmIfRx24hCurrentUAS[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmIfRx24hUASThreshold on $1|<p>-</p>|`SNMP agent`|pmIfRx24hUASThreshold[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmIfRx24hUAS on $1|<p>-</p>|`SNMP agent`|pmIfRx24hUAS[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Rx Power Level on $1|<p>-</p>|`SNMP agent`|pmIfRxPowerLevel[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmIfTx24hCurrentUAS on $1|<p>-</p>|`SNMP agent`|pmIfTx24hCurrentUAS[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmIfTx24hUASThreshold on $1|<p>-</p>|`SNMP agent`|pmIfTx24hUASThreshold[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | pmIfTx24hUAS on $1|<p>-</p>|`SNMP agent`|pmIfTx24hUAS[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Tx Power Level on $1|<p>-</p>|`SNMP agent`|pmIfTxPowerLevel[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | CU-SFP/II | Communication Failure on $1|<p>-</p>|`SNMP agent`|equipmentBoardCommunicationFailure[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | equipmentBoardName $1|<p>-</p>|`SNMP agent`|equipmentBoardName[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|XTM Series | equipmentBoardOperStatus $1|<p>-</p>|`SNMP agent`|equipmentBoardOperStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Secondary DC Power Failed on $1|<p>-</p>|`SNMP agent`|equipmentBoardSecondaryPowerFailed[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | High Board Temperature on $1|<p>-</p>|`SNMP agent`|equipmentBoardTempHighExceeded[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Equipment Board Temp Low Threshold on $1|<p>-</p>|`SNMP agent`|equipmentBoardTempLowThreshold[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Equipment Board Temp Low on $1|<p>-</p>|`SNMP agent`|equipmentBoardTempLow[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Equipment Board Temp Threshold on $1|<p>-</p>|`SNMP agent`|equipmentBoardTempThreshold[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Equipment Board Temp Very High on $1|<p>-</p>|`SNMP agent`|equipmentBoardTempVeryHigh[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | equipmentBoardUnderMaintenance $1|<p>-</p>|`SNMP agent`|equipmentBoardUnderMaintenance[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | equipmentSubrackName $1|<p>-</p>|`SNMP agent`|equipmentSubrackName[{#SNMPVALUE}]<p>Update: 86400</p><p>LLD</p>|
|XTM Series | equipmentSubrackOperStatus on $1|<p>-</p>|`SNMP agent`|equipmentSubrackOperStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | equipmentSubrackTempHighExceeded on $1|<p>-</p>|`SNMP agent`|equipmentSubrackTempHighExceeded[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Equipment Subrack Temperature Threshold on $1|<p>-</p>|`SNMP agent`|equipmentSubrackTempThreshold[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Equipment Subrack Temperature on $1|<p>-</p>|`SNMP agent`|equipmentSubrackTemp[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | clientIfAdminStatus $1|<p>-</p>|`SNMP agent`|clientIfAdminStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | Description on interface $1|<p>-</p>|`SNMP agent`|clientIfDescr[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|TM-3000/II Chassis | clientIfLossOfSignal $1|<p>-</p>|`SNMP agent`|clientIfLossOfSignal[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|TM-3000/II Chassis | clientIfName $1|<p>-</p>|`SNMP agent`|clientIfName[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | clientIfOperStatus $1|<p>-</p>|`SNMP agent`|clientIfOperStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | clientIfPowerLevelLowRelativeThreshold $1|<p>-</p>|`SNMP agent`|clientIfPowerLevelLowRelativeThreshold[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | clientIfPowerLevel $1|<p>-</p>|`SNMP agent`|clientIfPowerLevel[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|TM-3000/II Chassis | clientIfReceivedPowerHigh $1|<p>-</p>|`SNMP agent`|clientIfReceivedPowerHigh[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|TM-3000/II Chassis | clientIfReceivedPowerLow on $1|<p>-</p>|`SNMP agent`|clientIfReceivedPowerLow[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | clientIfReceiverSensitivity $1|<p>LUM-CLIENT-MIB::clientIfReceiverSensitivity The lowest power that the receiver is guaranteed to handle, in units of 0.1 dBm.</p>|`SNMP agent`|clientIfReceiverSensitivity[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | clientIfRxSignalStatus $1|<p>-</p>|`SNMP agent`|clientIfRxSignalStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Adminintrative State for the interface  $1|<p>-</p>|`SNMP agent`|oaIfAdminStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA interface Description for $1|<p>-</p>|`SNMP agent`|oaIfDescr[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Laser Bias High on $1|<p>-</p>|`SNMP agent`|oaIfLaserBiasHigh[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Loss Of Signal on $1|<p>-</p>|`SNMP agent`|oaIfLossOfSignal[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA interface $1|<p>-</p>|`SNMP agent`|oaIfName.me[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Operational State for the interface  $1|<p>-</p>|`SNMP agent`|oaIfOperStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Output Power Fail on $1|<p>-</p>|`SNMP agent`|oaIfOutputPowerFail[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Pump Laser Temp Low on $1|<p>-</p>|`SNMP agent`|oaIfPumpLaserTempLow[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Received Power Low on $1|<p>-</p>|`SNMP agent`|oaIfReceivedPowerLow[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Rx Power Level Low Threshold on $1|<p>-</p>|`SNMP agent`|oaIfRxPowerLevelLowThreshold[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Rx power level on $1|<p>-</p>|`SNMP agent`|oaIfRxPowerLevel[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Saturation Fault on $1|<p>-</p>|`SNMP agent`|oaIfSaturationFault[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Tx Power Level Low Threshold on $1|<p>-</p>|`SNMP agent`|oaIfTxPowerLevelLowThreshold[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | OA Tx power level on $1|<p>-</p>|`SNMP agent`|oaIfTxPowerLevel[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|TM-3000/II Chassis | CU SFP/II | dcnIfDescr $1|<p>-</p>|`SNMP agent`|dcnIfDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|TM-3000/II Chassis | CU SFP/II | dcnIfName $1|<p>-</p>|`SNMP agent`|dcnIfName[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|TM-3000/II Chassis | CU SFP/II | dcnIfOperStatus $1|<p>-</p>|`SNMP agent`|dcnIfOperStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|TM-3000/II Chassis | CU SFP/II | dcnIfPowerLevel $1|<p>-</p>|`SNMP agent`|dcnIfPowerLevel[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|TM-3000/II Chassis | CU SFP/II | dcnIfReceivedPowerHigh $1|<p>-</p>|`SNMP agent`|dcnIfReceivedPowerHigh[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|TM-3000/II Chassis | CU SFP/II | dcnIfReceivedPowerLow $1|<p>-</p>|`SNMP agent`|dcnIfReceivedPowerLow[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|XTM Series | MES Error Propagation Fault on $1|<p>-</p>|`SNMP agent`|mesErrorPropFault[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|[10.002] EMXP240/IIE | Low Rx Optical Power on {#SNMPVALUE} : {ITEM.VALUE2}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfReceivedPowerLow[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|warning|
|[10.002] High Rx Optical Power on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfPowerLevel[{#SNMPVALUE}].last(#1)}>=-10</p><p>**Recovery expression**: </p>|high|
|[10.002] Low Rx Optical Power on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfPowerLevel[{#SNMPVALUE}].last(#1)}<=-9</p><p>**Recovery expression**: </p>|warning|
|[10.003] EMXP240/IIE | Loss of Signal on {#SNMPVALUE} : {ITEM.VALUE2}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfLossOfSignal[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|high|
|[10.002] CU SFP/II | High Rx Optical Power on {#SNMPVALUE} : {ITEM.VALUE2}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:dcnIfReceivedPowerHigh[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:dcnIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|high|
|[10.002] CU SFP/II | Low Rx Optical Power on {#SNMPVALUE} : {ITEM.VALUE2}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:dcnIfReceivedPowerLow[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:dcnIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|warning|
|[10.004] Board Under Maintenance {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardUnderMaintenance[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|information|
|[] CU SFP/II Communication Failure with {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardCommunicationFailure[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[] Equipment Board Temperature Very High on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardTempVeryHigh[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|[] High Board Temperature on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardTempHighExceeded[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[] Secondary DC Power Failed on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardSecondaryPowerFailed[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[02.009] {#SNMPVALUE} Fan Unit Failed|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentFanUnitFailed[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|[04.104]  {#SNMPVALUE} DC Power Supply Failed|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentPowerDCPowerFailed[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[02.010] High Subrack Temperature $1|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentSubrackTempHighExceeded[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|[10.005] EMXP240/IIE | Error Propagation Active on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:mesErrorPropFault[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|[10.003] OA2 LG 20/20C | Loss of Signal on interface {#SNMPVALUE} : {ITEM.VALUE2}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfLossOfSignal[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|high|
|[10.006] OA Low Received Optical Power on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfReceivedPowerLow[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|[] OA Amplifier Saturation alarm on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfSaturationFault[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|information|
|[] OA High Laser Bias on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfLaserBiasHigh[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|information|
|[] OA interface {#SNMPVALUE} changed its Operational state to DOWN|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfOperStatus[{#SNMPVALUE}].last(#1)}<>3</p><p>**Recovery expression**: </p>|high|
|[] OA Output power failed on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfOutputPowerFail[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[] OA Pump Laser Temp Low on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfPumpLaserTempLow[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|UAS Rx 24 hour Threshold Exceeded on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:pmIfRx24hCurrentUAS[{#SNMPVALUE}].last(#1)}>300</p><p>**Recovery expression**: </p>|warning|
|UAS Tx 24 hour Threshold Exceeded on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:pmIfAdminStatus[{#SNMPVALUE}].last(#1)}=2 or {ZBX-INFINERA-XTM-SERIES-MONITORING:pmIfAdminStatus[{#SNMPVALUE}].last(#1)}=3 and {ZBX-INFINERA-XTM-SERIES-MONITORING:pmIfTx24hCurrentUAS[{#SNMPVALUE}].last(#1)}>300</p><p>**Recovery expression**: </p>|warning|
|[04.104]  {#SNMPVALUE} DC Power Supply Failed (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentPowerDCPowerFailed[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[02.009] {#SNMPVALUE} Fan Unit Failed (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentFanUnitFailed[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|UAS Rx 24 hour Threshold Exceeded on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:pmIfRx24hCurrentUAS[{#SNMPVALUE}].last(#1)}>300</p><p>**Recovery expression**: </p>|warning|
|UAS Tx 24 hour Threshold Exceeded on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:pmIfAdminStatus[{#SNMPVALUE}].last(#1)}=2 or {ZBX-INFINERA-XTM-SERIES-MONITORING:pmIfAdminStatus[{#SNMPVALUE}].last(#1)}=3 and {ZBX-INFINERA-XTM-SERIES-MONITORING:pmIfTx24hCurrentUAS[{#SNMPVALUE}].last(#1)}>300</p><p>**Recovery expression**: </p>|warning|
|[10.004] Board Under Maintenance {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardUnderMaintenance[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|information|
|[] CU SFP/II Communication Failure with {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardCommunicationFailure[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[] Equipment Board Temperature Very High on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardTempVeryHigh[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|[] High Board Temperature on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardTempHighExceeded[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[] Secondary DC Power Failed on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentBoardSecondaryPowerFailed[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[02.010] High Subrack Temperature $1 (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:equipmentSubrackTempHighExceeded[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|[10.002] EMXP240/IIE | Low Rx Optical Power on {#SNMPVALUE} : {ITEM.VALUE2} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfReceivedPowerLow[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|warning|
|[10.002] High Rx Optical Power on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfPowerLevel[{#SNMPVALUE}].last(#1)}>=-10</p><p>**Recovery expression**: </p>|high|
|[10.002] Low Rx Optical Power on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfPowerLevel[{#SNMPVALUE}].last(#1)}<=-9</p><p>**Recovery expression**: </p>|warning|
|[10.003] EMXP240/IIE | Loss of Signal on {#SNMPVALUE} : {ITEM.VALUE2} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfLossOfSignal[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:clientIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|high|
|[10.003] OA2 LG 20/20C | Loss of Signal on interface {#SNMPVALUE} : {ITEM.VALUE2} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfLossOfSignal[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|high|
|[10.006] OA Low Received Optical Power on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfReceivedPowerLow[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|[] OA Amplifier Saturation alarm on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfSaturationFault[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|information|
|[] OA High Laser Bias on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfLaserBiasHigh[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|information|
|[] OA interface {#SNMPVALUE} changed its Operational state to DOWN (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfOperStatus[{#SNMPVALUE}].last(#1)}<>3</p><p>**Recovery expression**: </p>|high|
|[] OA Output power failed on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfOutputPowerFail[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|high|
|[] OA Pump Laser Temp Low on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:oaIfPumpLaserTempLow[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
|[10.002] CU SFP/II | High Rx Optical Power on {#SNMPVALUE} : {ITEM.VALUE2} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:dcnIfReceivedPowerHigh[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:dcnIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|high|
|[10.002] CU SFP/II | Low Rx Optical Power on {#SNMPVALUE} : {ITEM.VALUE2} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:dcnIfReceivedPowerLow[{#SNMPVALUE}].last(#1)}<>1 and {ZBX-INFINERA-XTM-SERIES-MONITORING:dcnIfDescr[{#SNMPVALUE}].str(this_does_not_exist)}=0</p><p>**Recovery expression**: </p>|warning|
|[10.005] EMXP240/IIE | Error Propagation Active on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {ZBX-INFINERA-XTM-SERIES-MONITORING:mesErrorPropFault[{#SNMPVALUE}].last(#1)}<>1</p><p>**Recovery expression**: </p>|warning|
