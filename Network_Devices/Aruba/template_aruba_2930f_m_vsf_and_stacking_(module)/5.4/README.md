# HPE_Module Aruba 2930 VSF or Stacking

## Overview

Module Template with LLD over SNMPv2 for VSF and stacking



## Author

R.P.Wimmer

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VSF Stack OS Version|<p>-</p>|`SNMP agent`|hpeVSFStackOSVersion<p>Update: 1h</p>|
|VSF Stack Status|<p>-</p>|`SNMP agent`|hpeVSFStackStatus<p>Update: 1h</p>|
|PowerSupply|<p>-</p>|`SNMP agent`|hpicfPsState<p>Update: 1h</p>|
|ChassisTemperature|<p>-</p>|`SNMP agent`|hpChassisTemperature<p>Update: 1h</p>|
|VSF Stack Member Status|<p>-</p>|`SNMP agent`|hpeVSFStackMemberStatus<p>Update: 1h</p>|
|VSF Stack SN|<p>-</p>|`SNMP agent`|hpeVSFStackSN<p>Update: 1d</p>|
|VSF Stack ROM Version|<p>-</p>|`SNMP agent`|hpeVSFStackROMVersion<p>Update: 1h</p>|
|VSF Stack Links|<p>-</p>|`SNMP agent`|hpeVSFStackLinks<p>Update: 1h</p>|
|Stacking|<p>-</p>|`SNMP agent`|hpeStacking<p>Update: 1h</p>|
|VSF Stack Model|<p>-</p>|`SNMP agent`|hpeVSFStackModel<p>Update: 1d</p>|
|FanState|<p>-</p>|`SNMP agent`|hpicfFanState<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VSF Stack OS Version $1|<p>-</p>|`SNMP agent`|hpeVSFStackOSVersion[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|VSF Stack Admin Status|<p>-</p>|`SNMP agent`|hpicfVsfVCAdminStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|VSF Stack Oper Status|<p>-</p>|`SNMP agent`|hpicfVsfVCOperStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PowerSupply $1|<p>-</p>|`SNMP agent`|hpicfPsState[{#SNMPVALUE}.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|ChassisTemperature Value $1|<p>-</p>|`SNMP agent`|hpChassisTemperatureValue[{#SNMPVALUE}.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|VSF Stack VC Member Status $1|<p>-</p>|`SNMP agent`|hpeVSFStackVCMeberStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|VSF Stack Seriennummer $1|<p>-</p>|`SNMP agent`|hpeSerialnumber[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|VSF Stack ROM Version $1|<p>-</p>|`SNMP agent`|hpeVSFStackROMVersion[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|VSF Stack Link $1|<p>-</p>|`SNMP agent`|hpeVSFStackLink[{#SNMPVALUE}]<p>Update: 1m</p><p>LLD</p>|
|Stacking Meber State $1|<p>-</p>|`SNMP agent`|hpicfVsfVCMemberState[{#SNMPVALUE}.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Stacking Admin Status|<p>-</p>|`SNMP agent`|hpStackSwitchAdminStatus.0<p>Update: 1m</p><p>LLD</p>|
|Stacking Oper Status|<p>-</p>|`SNMP agent`|hpStackSwitchOperStatus.0<p>Update: 1m</p><p>LLD</p>|
|VSF Stack Model $1|<p>-</p>|`SNMP agent`|hpeVSFStackModel[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|FanState $1|<p>-</p>|`SNMP agent`|hpicfFanState[{#SNMPVALUE}.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Temperature is over 50 °C|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpChassisTemperatureValue[{#SNMPVALUE}.{#SNMPINDEX}])>50</p><p>**Recovery expression**: </p>|high|
|Stacking Admin Status disabled|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpStackSwitchAdminStatus.0)=2</p><p>**Recovery expression**: </p>|high|
|Stacking Oper Status not active|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpStackSwitchOperStatus.0)<>2</p><p>**Recovery expression**: </p>|high|
|Keep-alive failure with peer port|<p>-</p>|<p>**Expression**: find(/HPE_Module Aruba 2930 VSF or Stacking/hpeVSFStackLink[{#SNMPVALUE}],,"like","Keep-alive failure with peer port")=1</p><p>**Recovery expression**: </p>|high|
|VSF Admin Status disabled|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfVsfVCAdminStatus[{#SNMPINDEX}])=2 and last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfVsfVCAdminStatus[{#SNMPINDEX}],#1:now-1h)=1</p><p>**Recovery expression**: </p>|high|
|VSF Oper Status not active|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfVsfVCOperStatus[{#SNMPINDEX}])<>2 and last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfVsfVCOperStatus[{#SNMPINDEX}],#1:now-1h)>1</p><p>**Recovery expression**: </p>|high|
|Fan State not OK|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfFanState[{#SNMPVALUE}.{#SNMPINDEX}])<>5</p><p>**Recovery expression**: </p>|high|
|Power Supply State not OK|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfPsState[{#SNMPVALUE}.{#SNMPINDEX}])>3</p><p>**Recovery expression**: </p>|high|
|VSF Admin Status disabled (LLD)|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfVsfVCAdminStatus[{#SNMPINDEX}])=2 and last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfVsfVCAdminStatus[{#SNMPINDEX}],#1:now-1h)=1</p><p>**Recovery expression**: </p>|high|
|VSF Oper Status not active (LLD)|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfVsfVCOperStatus[{#SNMPINDEX}])<>2 and last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfVsfVCOperStatus[{#SNMPINDEX}],#1:now-1h)>1</p><p>**Recovery expression**: </p>|high|
|Power Supply State not OK (LLD)|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfPsState[{#SNMPVALUE}.{#SNMPINDEX}])>3</p><p>**Recovery expression**: </p>|high|
|Temperature is over 50 °C (LLD)|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpChassisTemperatureValue[{#SNMPVALUE}.{#SNMPINDEX}])>50</p><p>**Recovery expression**: </p>|high|
|Keep-alive failure with peer port (LLD)|<p>-</p>|<p>**Expression**: find(/HPE_Module Aruba 2930 VSF or Stacking/hpeVSFStackLink[{#SNMPVALUE}],,"like","Keep-alive failure with peer port")=1</p><p>**Recovery expression**: </p>|high|
|Stacking Admin Status disabled (LLD)|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpStackSwitchAdminStatus.0)=2</p><p>**Recovery expression**: </p>|high|
|Stacking Oper Status not active (LLD)|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpStackSwitchOperStatus.0)<>2</p><p>**Recovery expression**: </p>|high|
|Fan State not OK (LLD)|<p>-</p>|<p>**Expression**: last(/HPE_Module Aruba 2930 VSF or Stacking/hpicfFanState[{#SNMPVALUE}.{#SNMPINDEX}])<>5</p><p>**Recovery expression**: </p>|high|
