# Adva SNMP Autodiscovery

## Description

Autodiscovery ADVA Dwdm (especially FSP3000 r7)

## Overview

Template to autodiscover Adva fsp3000 R7 base system


It actually has autodiscovery for


network port


client port


edf amplifier


 


If you have additional module pls be kind and add related autodiscovery


Use snmptt for having traps


syntax for the translated traps should be like that


*EVENT alarmCfmOosDisabled .1.3.6.1.4.1.2544.1.11.6.1.2.0.13000 "Status Events" Normal*  
*FORMAT ZBXTRAP $aA Non-Specific Disablement of Management Access |$**  
*REGEX ((.+) \|(\d+).*\|(.+)$)($1 severity:$2 object:$3)*


 


Value Maps are the following


 




|  | [Adva Administrative state](http://nm01-lrd.pop01.ch.m2b.int/zabbix/adm.valuemapping.php?form=update&valuemapid=50) | 0 ⇒ Undefined1 ⇒ Unassigned2 ⇒ In Service3 ⇒ Automatic In Service4 ⇒ Management5 ⇒ Maintanance6 ⇒ Disabled7 ⇒ Path Protection State |  |
|  | [Adva Operational State](http://nm01-lrd.pop01.ch.m2b.int/zabbix/adm.valuemapping.php?form=update&valuemapid=49) | 0 ⇒ Undefined1 ⇒ Normal2 ⇒ Abnormal3 ⇒ Out of Service4 ⇒ Unreachable |  |
|  | [Adva Row State](http://nm01-lrd.pop01.ch.m2b.int/zabbix/adm.valuemapping.php?form=update&valuemapid=51) | 0 ⇒ undefined1 ⇒ active2 ⇒ notInService3 ⇒ notReady4 ⇒ createAndGo5 ⇒ createAndWait6 ⇒ destroy |  |




|  |  |  |
|  |  |  |  |
|  |  |  |



## Author

Marco Agostani

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Expansion module|<p>-</p>|`SNMP agent`|scu_advaInventoryUnitName<p>Update: 3600</p>|
|Psu|<p>-</p>|`SNMP agent`|psu_advaInventoryUnitName<p>Update: 3600</p>|
|Mgmt module|<p>-</p>|`SNMP agent`|ncu_advaInventoryUnitName<p>Update: 3600</p>|
|Erbian Doped Amplifier|<p>-</p>|`SNMP agent`|edfa_advaInventoryUnitName<p>Update: 3600</p>|
|Optical Transport|<p>-</p>|`SNMP agent`|ot_advaInventoryUnitName<p>Update: 3600</p>|
|Network Port|<p>-</p>|`SNMP agent`|IF-Net-name<p>Update: 3600</p>|
|Optical Mux|<p>-</p>|`SNMP agent`|FA-port-name<p>Update: 3600</p>|
|Fan|<p>-</p>|`SNMP agent`|fan_advaInventoryUnitName<p>Update: 3600</p>|
|Client Port|<p>-</p>|`SNMP agent`|IF-Client-Name<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Shelf  Type|<p>-</p>|`SNMP agent`|advaInventoryUnitName.1.0.0.0.shelf<p>Update: 86400</p>|
|Shelf  firmware Rev.|<p>-</p>|`SNMP agent`|advaInventoryFirmwarePackageRev.1.0.0.0.shelf<p>Update: 86400</p>|
|Shelf S/N|<p>-</p>|`SNMP agent`|advaInventorySerialNum.1.0.0.0.shelf<p>Update: 86400</p>|
|Shelf Operational Status|<p>-</p>|`SNMP agent`|shelfOperState.1.0.0.0.shelf<p>Update: 30</p>|
|Shelf  Power Usage|<p>-</p>|`SNMP agent`|eqptPhysInstValuePwrUse<p>Update: 30</p>|
|Shelf hardware Rev.|<p>-</p>|`SNMP agent`|advaInventoryHardwareRev.1.0.0.0.shelf<p>Update: 86400</p>|
|Shelf P/N|<p>-</p>|`SNMP agent`|advaInventoryPartnumber.1.0.0.0.shelf<p>Update: 86400</p>|
|Snmp Trap Fallback|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|Shelf Temperature|<p>-</p>|`SNMP agent`|eqptPhysInstValueTemp.1.0.0.0.shelf<p>Update: 30</p>|
|Shelf  Row Status|<p>-</p>|`SNMP agent`|shelfRowStatus.1.0.0.0.shelf<p>Update: 30</p>|
|Shelf Admin Status|<p>-</p>|`SNMP agent`|shelfAdmin.1.0.0.0.shelf<p>Update: 30</p>|
|Firmware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|scadvaInventoryFirmwarePackageRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Hardware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|scadvaInventoryHardwareRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|P/N for  $2 ($1)|<p>-</p>|`SNMP agent`|scadvaInventoryPartnumber[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|S/N for  $2 ($1)|<p>-</p>|`SNMP agent`|scadvaInventorySerialNum[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Temperature for  $2 ($1)|<p>-</p>|`SNMP agent`|sceqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Administrative State for  $2 ($1)|<p>-</p>|`SNMP agent`|scmoduleAdmin[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Operational State for  $2 ($1)|<p>-</p>|`SNMP agent`|scmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Row Status for  $2 ($1)|<p>-</p>|`SNMP agent`|scmoduleRowStatus[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Firmware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|psadvaInventoryFirmwarePackageRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Hardware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|psadvaInventoryHardwareRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|P/N for  $2 ($1)|<p>-</p>|`SNMP agent`|psadvaInventoryPartnumber[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|S/N for  $2 ($1)|<p>-</p>|`SNMP agent`|psadvaInventorySerialNum[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Supplied Current  from  $2 ($1)|<p>-</p>|`SNMP agent`|pseqptPhysInstValueAmpere[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Input Current  to $2 ($1)|<p>-</p>|`SNMP agent`|pseqptPhysInstValuePsuAmpere[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Input Voltage to $2 ($1)|<p>-</p>|`SNMP agent`|pseqptPhysInstValuePsuVoltIn[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Temperature for  $2 ($1)|<p>-</p>|`SNMP agent`|pseqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Administrative State for  $2 ($1)|<p>-</p>|`SNMP agent`|psmoduleAdmin[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Operational State for  $2 ($1)|<p>-</p>|`SNMP agent`|psmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Row Status for  $2 ($1)|<p>-</p>|`SNMP agent`|psmoduleRowStatus[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Firmware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|ncadvaInventoryFirmwarePackageRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Hardware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|ncadvaInventoryHardwareRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|P/N for  $2 ($1)|<p>-</p>|`SNMP agent`|ncadvaInventoryPartnumber[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|S/N for  $2 ($1)|<p>-</p>|`SNMP agent`|ncadvaInventorySerialNum[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Temperature for  $2 ($1)|<p>-</p>|`SNMP agent`|nceqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Administrative State for  $2 ($1)|<p>-</p>|`SNMP agent`|ncmoduleAdmin[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Operational State for  $2 ($1)|<p>-</p>|`SNMP agent`|ncmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Row Status for  $2 ($1)|<p>-</p>|`SNMP agent`|ncmoduleRowStatus[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Firmware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|faadvaInventoryFirmwarePackageRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Hardware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|faadvaInventoryHardwareRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|P/N for  $2 ($1)|<p>-</p>|`SNMP agent`|faadvaInventoryPartnumber[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|S/N for  $2 ($1)|<p>-</p>|`SNMP agent`|faadvaInventorySerialNum[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Temperature for  $2 ($1)|<p>-</p>|`SNMP agent`|faeqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Administrative State for  $2 ($1)|<p>-</p>|`SNMP agent`|famoduleAdmin[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Operational State for  $2 ($1)|<p>-</p>|`SNMP agent`|famoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Row Status for  $2 ($1)|<p>-</p>|`SNMP agent`|famoduleRowStatus[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Firmware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|5wadvaInventoryFirmwarePackageRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Hardware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|5wadvaInventoryHardwareRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|P/N for  $2 ($1)|<p>-</p>|`SNMP agent`|5wadvaInventoryPartnumber[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|S/N for  $2 ($1)|<p>-</p>|`SNMP agent`|5wadvaInventorySerialNum[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Temperature for  $2 ($1)|<p>-</p>|`SNMP agent`|5weqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Administrative State for  $2 ($1)|<p>-</p>|`SNMP agent`|5wmoduleAdmin[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Operational State for  $2 ($1)|<p>-</p>|`SNMP agent`|5wmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Row Status for  $2 ($1)|<p>-</p>|`SNMP agent`|5wmoduleRowStatus[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Administrative State for  $1|<p>-</p>|`SNMP agent`|npentityStateAdmin[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Operational State for  $1|<p>-</p>|`SNMP agent`|npentityStateOper[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Input power for $1|<p>-</p>|`SNMP agent`|npopticalIfDiagInputPower[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Laser Bias current on $1|<p>-</p>|`SNMP agent`|npopticalIfDiagLaserBiasCurrentLevel[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Output power for $1|<p>-</p>|`SNMP agent`|npopticalIfDiagOutputPower[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Channel frequency for  $1|<p>-</p>|`SNMP agent`|opticalIfDataFrequency[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Lamba of $1|<p>-</p>|`SNMP agent`|opticalIfDataTransmitWavelength[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Laser end of life  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmLaserEndOfLif.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Loss Of Signal for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmLossOfSigna.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Input Power too high for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooHig.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Input Power too Low for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooLo.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Output Power too high for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooHig.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Output Power too low for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooLo.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|edfa tilt for  $1|<p>-</p>|`SNMP agent`|edfaConfigTilt[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Laser operating hours for  $1|<p>-</p>|`SNMP agent`|opticalAmplifierInterfaceDiagnosticsOperatingHours[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Output Power too high for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooHi.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Input Power too Low for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooL.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Input Power too high for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooHi.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Loss Of Signal for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmLossOfSign.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Laser end of life  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmLaserEndOfLi.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Laser temp for  $1|<p>-</p>|`SNMP agent`|opticalIfDiagLaserTemp[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Laser bias current for  $1|<p>-</p>|`SNMP agent`|opticalAmplifierInterfaceDiagnosticsLaserBiasCurrentLevelAverage[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|edfa gain for  $1|<p>-</p>|`SNMP agent`|edfaConfigVariableGain[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|External loss for  $1|<p>-</p>|`SNMP agent`|opticalAmplifierInterfaceDiagnosticsAttenuation[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Attenuation for  $1|<p>-</p>|`SNMP agent`|opticalAmplifierInterfaceDiagnosticsAttenuationVoa[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Output power for $1|<p>-</p>|`SNMP agent`|faopticalIfDiagOutputPower[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Input power for $1|<p>-</p>|`SNMP agent`|faopticalIfDiagInputPower[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Operational State for  $1|<p>-</p>|`SNMP agent`|faentityStateOper[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Administrative State for  $1|<p>-</p>|`SNMP agent`|faentityStateAdmin[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Output Power too low for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooL.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Administrative State for  $2 ($1)|<p>-</p>|`SNMP agent`|FanAdmin[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Firmware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|fanadvaInventoryFirmwarePackageRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Hardware Revision for  $2 ($1)|<p>-</p>|`SNMP agent`|fanadvaInventoryHardwareRev[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|P/N for  $2 ($1)|<p>-</p>|`SNMP agent`|fanadvaInventoryPartnumber[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|S/N for  $2 ($1)|<p>-</p>|`SNMP agent`|fanadvaInventorySerialNum[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 86400</p><p>LLD</p>|
|Temperature for  $2 ($1)|<p>-</p>|`SNMP agent`|faneqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Operational State for  $2 ($1)|<p>-</p>|`SNMP agent`|FanOperState[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Row Status for  $2 ($1)|<p>-</p>|`SNMP agent`|FanRowStatus[{#SNMPVALUE},{#SNMPVALUE2}]<p>Update: 30</p><p>LLD</p>|
|Administrative State for  $1|<p>-</p>|`SNMP agent`|cpentityStateAdmin[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Operational State for  $1|<p>-</p>|`SNMP agent`|cpentityStateOper[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Input power for $1|<p>-</p>|`SNMP agent`|cpopticalIfDiagInputPower[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Laser Bias current on $1|<p>-</p>|`SNMP agent`|cpopticalIfDiagLaserBiasCurrentLevel[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Output power for $1|<p>-</p>|`SNMP agent`|cpopticalIfDiagOutputPower[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Laser end of life  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmLaserEndOfLife.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Loss Of Signal for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmLossOfSignal.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Input Power too high for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooHigh.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Input Power too Low for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooLow.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Output Power too high for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooHigh.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|
|Output Power too low for  {#SNMPVALUE}|<p>-</p>|`SNMP trap`|snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooLow.* object:{#SNMPVALUE}"]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME}  High Temperature on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:faeqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:famoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Operational state problem on   {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:faentityStateOper[{#SNMPVALUE}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  Input Power too high on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooHi.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Input Power too low on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooL.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Laser near to end of Life  on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLaserEndOfLi.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME}  Loss of signal on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLossOfSign.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too high on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooHi.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too low on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooL.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:FanOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  Input Power too high on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooHigh.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Input Power too low on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooLow.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Laser near to end of Life  on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLaserEndOfLife.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME}  Loss of signal on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLossOfSignal.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} operational state problem on   {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:cpentityStateOper[{#SNMPVALUE}].last()}<>1</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME} Output Power too high on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooHigh.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too low on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooLow.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  operational state problem on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:npentityStateOper[{#SNMPVALUE}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  Input Power too high on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooHig.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Input Power too low on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooLo.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Laser near to end of Life  on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLaserEndOfLif.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME}  Loss of signal on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLossOfSigna.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too high on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooHig.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too low on  {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooLo.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:ncmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOSTNAME}  High Temperature on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:nceqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  High Temperature on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:5weqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:5wmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  High Temperature on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:pseqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} operation state problem on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:psmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  High Temperature on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:sceqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2}|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:scmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  High Temperature on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:sceqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:scmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  High Temperature on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:pseqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} operation state problem on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:psmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:ncmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOSTNAME}  High Temperature on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:nceqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  High Temperature on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:faeqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:famoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  High Temperature on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:5weqptPhysInstValueTemp[{#SNMPVALUE},{#SNMPVALUE2}].last()}>75</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:5wmoduleOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  operational state problem on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:npentityStateOper[{#SNMPVALUE}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  Input Power too high on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooHig.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Input Power too low on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooLo.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Laser near to end of Life  on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLaserEndOfLif.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME}  Loss of signal on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLossOfSigna.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too high on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooHig.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too low on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooLo.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Operational state problem on   {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:faentityStateOper[{#SNMPVALUE}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  Input Power too high on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooHi.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Input Power too low on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooL.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Laser near to end of Life  on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLaserEndOfLi.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME}  Loss of signal on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLossOfSign.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too high on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooHi.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too low on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooL.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  operational state problem on {#SNMPVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:FanOperState[{#SNMPVALUE},{#SNMPVALUE2}].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME}  Input Power too high on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooHigh.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Input Power too low on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptInputPwrReceivedTooLow.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME}  Laser near to end of Life  on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLaserEndOfLife.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME}  Loss of signal on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmLossOfSignal.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} operational state problem on   {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:cpentityStateOper[{#SNMPVALUE}].last()}<>1</p><p>**Recovery expression**: </p>|average|
|{HOST.NAME} Output Power too high on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooHigh.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Output Power too low on  {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adva SNMP Autodiscovery:snmptrap["ADVA-FSPR7-MIB::alarmOptOutputPowerTransTooLow.* object:{#SNMPVALUE}"].str(severity:6)}=0</p><p>**Recovery expression**: </p>|high|
