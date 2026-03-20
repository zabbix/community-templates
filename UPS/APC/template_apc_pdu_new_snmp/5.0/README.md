# SNMP APC PDU

## Overview

UPDATE: Uploaded V2 to fix one of the power ratings that was the wrong OID. It was collecting watts incorrectly. All fixed now!


This APC Template contains outlet discovery and should work with any managed or switched APC PDU.


Contains sane triggers, load status, graphs, etc.


Triggers: APC Load State, Load Change, Power Alarm, etc.


Items: Basic information (model, name, firmware, etc), Power load/peak/etc, Master States (Enable for older units), All APC value mappings, and much more.


Graphs: Load and Current


Outlet Status (Dynamic Discovery)


Please enjoy and vote!



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Outlets|<p>-</p>|`SNMP agent`|rPDU2Outlet<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|rPDU2PhaseStatusPeakCurrent.1|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusPeakCurrent.1<p>Update: 30</p>|
|rPDU2DeviceStatusPowerSupplyAlarm.1|<p>-</p>|`SNMP agent`|rPDU2DeviceStatusPowerSupplyAlarm.1<p>Update: 30</p>|
|sPDUIdentModelNumber.0|<p>-</p>|`SNMP agent`|sPDUIdentModelNumber.0<p>Update: 86400</p>|
|rPDU2PhaseStatusPeakCurrentTimestamp.1|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusPeakCurrentTimestamp.1<p>Update: 300</p>|
|rPDU2IdentLocation.1|<p>-</p>|`SNMP agent`|rPDU2IdentLocation.1<p>Update: 86400</p>|
|sPDUMasterState.0|<p>-</p>|`SNMP agent`|sPDUMasterState.0<p>Update: 60</p>|
|sPDUMasterPending.0|<p>-</p>|`SNMP agent`|sPDUMasterPending.0<p>Update: 60</p>|
|rPDU2GroupTotalEnergy.0|<p>-</p>|`SNMP agent`|rPDU2GroupTotalEnergy.0<p>Update: 30</p>|
|rPDU2PhaseStatusVoltage.1|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusVoltage.1<p>Update: 30</p>|
|rPDU2DeviceStatusPeakPower.1|<p>-</p>|`SNMP agent`|rPDU2DeviceStatusPeakPower.1<p>Update: 300</p>|
|rPDU2IdentFirmwareRev.1|<p>-</p>|`SNMP agent`|rPDU2IdentFirmwareRev.1<p>Update: 600</p>|
|rPDU2IdentModelNumber.1|<p>-</p>|`SNMP agent`|rPDU2IdentModelNumber.1<p>Update: 86400</p>|
|rPDU2DeviceStatusPeakPowerTimestamp.1|<p>-</p>|`SNMP agent`|rPDU2DeviceStatusPeakPowerTimestamp.1<p>Update: 300</p>|
|rPDU2DeviceStatusLoadState.1|<p>-</p>|`SNMP agent`|rPDU2DeviceStatusLoadState.1<p>Update: 30</p>|
|rPDU2PhaseStatusCurrent.1|<p>-</p>|`SNMP agent`|rPDU2PhaseStatusCurrent.1<p>Update: 30</p>|
|rPDU2DeviceStatusPower.1|<p>-</p>|`SNMP agent`|rPDU2DeviceStatusPower.1<p>Update: 30</p>|
|sPDUIdentFirmwareRev.0|<p>-</p>|`SNMP agent`|sPDUIdentFirmwareRev.0<p>Update: 600</p>|
|rPDU2DevicePropertiesMaxPhaseCurrentRating.1|<p>-</p>|`SNMP agent`|rPDU2DevicePropertiesMaxPhaseCurrentRating.1<p>Update: 86400</p>|
|rPDU2IdentName.1|<p>-</p>|`SNMP agent`|rPDU2IdentName.1<p>Update: 86400</p>|
|rPDU2IdentSerialNumber.1|<p>-</p>|`SNMP agent`|rPDU2IdentSerialNumber.1<p>Update: 86400</p>|
|Outlet $1 Name|<p>-</p>|`SNMP agent`|rPDU2OutletSwitchedConfigName[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Outlet $1 Bank|<p>-</p>|`SNMP agent`|rPDU2OutletSwitchedPropertiesBank[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Outlet $1 State|<p>-</p>|`SNMP agent`|rPDU2OutletSwitchedStatusState[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Outlet {#SNMPVALUE} State Change|<p>-</p>|<p>**Expression**: {SNMP APC PDU:rPDU2OutletSwitchedStatusState[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Outlet {#SNMPVALUE} State Change (LLD)|<p>-</p>|<p>**Expression**: {SNMP APC PDU:rPDU2OutletSwitchedStatusState[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|


# SNMP Tripplite

## Overview

UPDATE: Uploaded V2 to fix one of the power ratings that was the wrong OID. It was collecting watts incorrectly. All fixed now!


This APC Template contains outlet discovery and should work with any managed or switched APC PDU.


Contains sane triggers, load status, graphs, etc.


Triggers: APC Load State, Load Change, Power Alarm, etc.


Items: Basic information (model, name, firmware, etc), Power load/peak/etc, Master States (Enable for older units), All APC value mappings, and much more.


Graphs: Load and Current


Outlet Status (Dynamic Discovery)


Please enjoy and vote!



## Overview

UPDATE: Uploaded V2 to fix one of the power ratings that was the wrong OID. It was collecting watts incorrectly. All fixed now!


This APC Template contains outlet discovery and should work with any managed or switched APC PDU.


Contains sane triggers, load status, graphs, etc.


Triggers: APC Load State, Load Change, Power Alarm, etc.


Items: Basic information (model, name, firmware, etc), Power load/peak/etc, Master States (Enable for older units), All APC value mappings, and much more.


Graphs: Load and Current


Outlet Status (Dynamic Discovery)


Please enjoy and vote!



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|upsBatteryStatus|<p>-</p>|`SNMP agent`|upsBatteryStatus<p>Update: 30</p>|
|upsInputVoltage.1|<p>-</p>|`SNMP agent`|upsInputVoltage.1<p>Update: 30</p>|
|upsIdentModel|<p>-</p>|`SNMP agent`|upsIdentModel<p>Update: 86400</p>|
|upsBatteryTemperature|<p>-</p>|`SNMP agent`|upsBatteryTemperature<p>Update: 60</p>|
|upsOutputPercentLoad.1|<p>-</p>|`SNMP agent`|upsOutputPercentLoad.1<p>Update: 30</p>|
|upsOutputVoltage.1|<p>-</p>|`SNMP agent`|upsOutputVoltage.1<p>Update: 30</p>|
|upsBypassFrequency|<p>-</p>|`SNMP agent`|upsBypassFrequency<p>Update: 30</p>|
|upsEstimatedMinutesRemaining|<p>-</p>|`SNMP agent`|upsEstimatedMinutesRemaining<p>Update: 30</p>|
|upsInputFrequency.1|<p>-</p>|`SNMP agent`|upsInputFrequency.1<p>Update: 30</p>|
|upsBypassCurrent.1|<p>-</p>|`SNMP agent`|upsBypassCurrent.1<p>Update: 30</p>|
|upsOutputPower.1|<p>-</p>|`SNMP agent`|upsOutputPower.1<p>Update: 30</p>|
|upsOutputSource|<p>-</p>|`SNMP agent`|upsOutputSource<p>Update: 30</p>|
|upsSecondsOnBattery|<p>-</p>|`SNMP agent`|upsSecondsOnBattery<p>Update: 30</p>|
|upsAlarmsPresent|<p>-</p>|`SNMP agent`|upsAlarmsPresent<p>Update: 30</p>|
|upsBypassVoltage.1|<p>-</p>|`SNMP agent`|upsBypassVoltage.1<p>Update: 30</p>|
|upsEstimatedChargeRemaining|<p>-</p>|`SNMP agent`|upsEstimatedChargeRemaining<p>Update: 60</p>|
|upsBatteryVoltage|<p>-</p>|`SNMP agent`|upsBatteryVoltage<p>Update: 60</p>|
|upsBypassPower.1|<p>-</p>|`SNMP agent`|upsBypassPower.1<p>Update: 30</p>|
|upsInputLineBads|<p>-</p>|`SNMP agent`|upsInputLineBads<p>Update: 30</p>|
|upsIdentUPSSoftwareVersion|<p>-</p>|`SNMP agent`|upsIdentUPSSoftwareVersion<p>Update: 600</p>|
|upsIdentAgentSoftwareVersion|<p>-</p>|`SNMP agent`|upsIdentAgentSoftwareVersion<p>Update: 600</p>|
|upsOutputCurrent.1|<p>-</p>|`SNMP agent`|upsOutputCurrent.1<p>Update: 30</p>|
|upsOutputFrequency|<p>-</p>|`SNMP agent`|upsOutputFrequency<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

