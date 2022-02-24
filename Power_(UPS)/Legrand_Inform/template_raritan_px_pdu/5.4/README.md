# Raritan PDU

## Overview

Works with Raritan PDU PX2 / PX3 and ATS PX3 products


Discovery rules:


- Inlets  
- Outlets  
- Overcurrent Protectors  
- Sensors


With advanced power function (See <https://www.zabbix.com/forum/zabbix-help/385574> for more info)



## Author

eric_at_2037

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Outlets|<p>-</p>|`SNMP agent`|pduOutlet<p>Update: 3600</p>|
|Inlets|<p>-</p>|`SNMP agent`|pduInlet<p>Update: 3600</p>|
|Sensors|<p>-</p>|`SNMP agent`|externalSensor<p>Update: 3600</p>|
|Overcurrent Protectors|<p>-</p>|`SNMP agent`|overCurrentProtector<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device Manufacter Name|<p>-</p>|`SNMP agent`|Manufacturer.PDU<p>Update: 3600</p>|
|Device Serial Number|<p>-</p>|`SNMP agent`|pduSerialNumber<p>Update: 3600</p>|
|Inlet number|<p>-</p>|`SNMP agent`|inletCount<p>Update: 3600</p>|
|Device reachability using ICMP|<p>-</p>|`Simple check`|icmpping<p>Update: 3600</p>|
|Device Name|<p>-</p>|`SNMP agent`|sysName<p>Update: 3600</p>|
|Software version (full)|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 3600</p>|
|Device Power Capability|<p>-</p>|`SNMP agent`|pduRatedVA<p>Update: 3600</p>|
|Device Voltage|<p>-</p>|`SNMP agent`|pduRatedVoltage<p>Update: 3600</p>|
|Overcurrent Protector number|<p>-</p>|`SNMP agent`|overCurrentProtectorCount<p>Update: 3600</p>|
|Device Current|<p>-</p>|`SNMP agent`|pduRatedCurrent<p>Update: 3600</p>|
|Inlet Controller number|<p>-</p>|`SNMP agent`|inletControllerCount<p>Update: 3600</p>|
|Outlet number|<p>-</p>|`SNMP agent`|outletCount<p>Update: 3600</p>|
|Device Location|<p>-</p>|`SNMP agent`|sysLocation<p>Update: 3600</p>|
|Device Model Name|<p>-</p>|`SNMP agent`|pduBasicIdentModel<p>Update: 3600</p>|
|Uptime|<p>-</p>|`SNMP agent`|sysUpTime<p>Update: 300</p>|
|Outlet Controller number|<p>-</p>|`SNMP agent`|outletControllerCount<p>Update: 3600</p>|
|Device Frequency|<p>-</p>|`SNMP agent`|pduRatedFrequency<p>Update: 3600</p>|
|Contact|<p>-</p>|`SNMP agent`|sysContact<p>Update: 3600</p>|
|OnOff Status of Outlet $1|<p>-</p>|`SNMP agent`|OnOffStatus[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Current Capability of Outlet $1|<p>-</p>|`SNMP agent`|OutletCurrent[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Name of Outlet $1|<p>-</p>|`SNMP agent`|OutletName[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Type of Outlet $1|<p>-</p>|`SNMP agent`|outletReceptacleDescriptor[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Voltage Capability of Outlet $1|<p>-</p>|`SNMP agent`|OutletVolts[{#SNMPVALUE}]<p>Update: 300</p><p>LLD</p>|
|Name of Inlet $1|<p>-</p>|`SNMP agent`|InletName[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|State of powerFactor on Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorStatermspowerFactor[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|powerFactor of Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorValuermspowerFactor[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|apparentPower of Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorValuermsapparentPower[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|activePower of Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorValuermsactivePower[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|activeEnergy of Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorValuermsactiveEnergy[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Frequency of Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorValueFrequency[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Current of Inlet $1|<p>-</p>|`Calculated`|measurementsInletSensorUsableValuermsCurrent[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|State of Voltage on Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorStatermsVoltage[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|State of Current on Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorStatermsCurrent[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Type of Inlet $1|<p>-</p>|`SNMP agent`|inletPlugDescriptor[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|State of apparentPower on Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorStatermsapparentPower[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|State of activePower on Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorStatermsactivePower[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|State of activeEnergy on Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorStatermsactiveEnergy[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|State of Frequency on Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorStateFrequency[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|RAW Current of Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorRAWValuermsCurrent[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Current DecimalDigits of Inlet $1|<p>-</p>|`SNMP agent`|inletSensorDecimalDigitsrmsCurrent[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Volatage Capability of Inlet $1|<p>-</p>|`SNMP agent`|inletRatedVoltage[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Current Capability of Inlet $1|<p>-</p>|`SNMP agent`|inletRatedCurrent[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Voltage of Inlet $1|<p>-</p>|`SNMP agent`|measurementsInletSensorValuermsVoltage[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Sensor DecimalDigits of External Sensor $1|<p>-</p>|`SNMP agent`|externalSensorDecimalDigits[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Serial Number of External Sensor $1|<p>-</p>|`SNMP agent`|externalSensorSerialNumber[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Type of External Sensor $1|<p>-</p>|`SNMP agent`|externalSensorType[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Unit of External Sensor $1|<p>-</p>|`SNMP agent`|externalSensorUnits[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|RAW Value of Sensor $1|<p>-</p>|`SNMP agent`|measurementsExternalSensorRAWValue[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|State of External Sensor $1|<p>-</p>|`SNMP agent`|measurementsExternalSensorState[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Value of Sensor {#SNMPVALUE}|<p>-</p>|`Calculated`|measurementsExternalSensorUsableValue[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|State of  Overcurrent Protector $1|<p>-</p>|`SNMP agent`|measurementsOverCurrentProtectorSensorStatermsCurrent[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Current of  Overcurrent Protector $1|<p>-</p>|`SNMP agent`|measurementsOverCurrentProtectorSensorValuermsCurrent[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Name of Overcurrent Protector $1|<p>-</p>|`SNMP agent`|overCurrentProtectorName[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Capability of  Overcurrent Protector  $1|<p>-</p>|`SNMP agent`|overCurrentProtectorRatedCurrent[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Type of  Overcurrent Protector  $1|<p>-</p>|`SNMP agent`|overCurrentProtectorType[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Sensor problem on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsExternalSensorState[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Sensor problem on {#SNMPVALUE} is too high|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsExternalSensorState[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Sensor problem on {#SNMPVALUE} is too low|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsExternalSensorState[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|Current problem too high on Overcurrent Protector {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsOverCurrentProtectorSensorStatermsCurrent[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Current problem too low on Overcurrent Protector {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsOverCurrentProtectorSensorStatermsCurrent[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|State of Overcurrent Protector {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsOverCurrentProtectorSensorStatermsCurrent[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|activeEnergy problem on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsactiveEnergy[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|activePower problem on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsactivePower[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|apparentPower problem on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsapparentPower[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Current problem on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsCurrent[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Current problem too high on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsCurrent[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Current problem too low on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsCurrent[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|Frequency problem on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStateFrequency[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Frequency problem too high on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStateFrequency[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Frequency problem too low on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStateFrequency[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|powerFactor problem on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermspowerFactor[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Voltage problem on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsVoltage[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Voltage problem too high on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsVoltage[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Voltage problem too low on Inlet {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsVoltage[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|activeEnergy problem on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsactiveEnergy[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|activePower problem on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsactivePower[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|apparentPower problem on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsapparentPower[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Current problem on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsCurrent[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Current problem too high on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsCurrent[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Current problem too low on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsCurrent[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|Frequency problem on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStateFrequency[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Frequency problem too high on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStateFrequency[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Frequency problem too low on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStateFrequency[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|powerFactor problem on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermspowerFactor[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Voltage problem on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsVoltage[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Voltage problem too high on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsVoltage[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Voltage problem too low on Inlet {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsInletSensorStatermsVoltage[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|Sensor problem on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsExternalSensorState[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
|Sensor problem on {#SNMPVALUE} is too high (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsExternalSensorState[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Sensor problem on {#SNMPVALUE} is too low (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsExternalSensorState[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|Current problem too high on Overcurrent Protector {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsOverCurrentProtectorSensorStatermsCurrent[{#SNMPVALUE}])=6</p><p>**Recovery expression**: </p>|high|
|Current problem too low on Overcurrent Protector {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsOverCurrentProtectorSensorStatermsCurrent[{#SNMPVALUE}])=2</p><p>**Recovery expression**: </p>|high|
|State of Overcurrent Protector {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/Raritan PDU/measurementsOverCurrentProtectorSensorStatermsCurrent[{#SNMPVALUE}])<>4</p><p>**Recovery expression**: </p>|average|
