# Rittal_PDU 1Phase EN

## Description

IT Infrastructure Monitoring.

## Overview

Template for Rittal PDU 7955 1-phase (4.4) and 3-pases (5.0) with sensors (temperature, humidity, input, etc.)



## Author

RPW

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|
|Template Module Generic SNMP|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery Analog|<p>-</p>|`SNMP agent`|cmcIIIVarName.Analog<p>Update: 1h</p>|
|Discovery Unit Energy|<p>-</p>|`SNMP agent`|cmcIIIVarName.Unit.Energy<p>Update: 1h</p>|
|Phase L1 Power|<p>-</p>|`SNMP agent`|cmcIIIVarName.PhaseL1.Power<p>Update: 1h</p>|
|Energy Meter 2|<p>-</p>|`SNMP agent`|cmcIIIVarName.EnergyMeter2<p>Update: 1h</p>|
|Phase L1 Energy|<p>-</p>|`SNMP agent`|cmcIIIVarName.PhaseL1.Energy<p>Update: 1h</p>|
|Discovery Input 1|<p>-</p>|`SNMP agent`|cmcIIIVarName.Input1<p>Update: 1h</p>|
|Discovery Humidity|<p>-</p>|`SNMP agent`|cmcIIIVarName.Humidity<p>Update: 1h</p>|
|Discovery Leakage|<p>-</p>|`SNMP agent`|cmcIIIVarName.Leakage<p>Update: 1h</p>|
|Discovery cmsIIIVarName Settings|<p>-</p>|`SNMP agent`|cmsIIIVarNames.WalkSNMP<p>Update: 1h</p>|
|Discovery Unit Power|<p>-</p>|`SNMP agent`|cmcIIIVarName.Unit.Power<p>Update: 1h</p>|
|Discovery Climate|<p>-</p>|`SNMP agent`|cmcIIIVarName.Climate<p>Update: 1h</p>|
|Discovery Access|<p>-</p>|`SNMP agent`|cmcIIIVarName.Access<p>Update: 1h</p>|
|Discovery Temperature|<p>-</p>|`SNMP agent`|cmcIIIVarName.Temperature<p>Update: 1h</p>|
|Energy Meter 1|<p>-</p>|`SNMP agent`|cmcIIIVarName.EnergyMeter1<p>Update: 1h</p>|
|Discovery Input 2|<p>-</p>|`SNMP agent`|cmcIIIVarName.Input2<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Serial number|<p>-</p>|`SNMP agent`|entPhysicalSerialNum<p>Update: 1h</p>|
|Firmware|<p>-</p>|`SNMP agent`|entPhysicalSoftwareRev<p>Update: 1h</p>|
|Analog DescName|<p>-</p>|`SNMP agent`|cmcIIIVarValueStrg.Analog.DescName[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Analog Status - AirFlow|<p>-</p>|`SNMP agent`|cmcIIIVarValueStrg.Analog.Status[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Unit Energie Custom kWh|<p>-</p>|`SNMP agent`|Unit.Energy.Active.Custom.Value[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Unit Energie Runtime|<p>-</p>|`SNMP agent`|Unit.Energy.Active.Runtime.Value[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Unit Energie Active kWh|<p>-</p>|`SNMP agent`|Unit.Energy.Active.Value[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Phase L1 Current Status|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.PhaseL1.Current.Status[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Phase L1 Current Value|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.PhaseL1.Current.Value[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Phase L1 Power Active Status|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.PhaseL1.Power.Active.Status[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Phase L1 Power Active Value|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.PhaseL1.Power.Active.Value[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Phase L1 Voltage Status|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.PhaseL1.Voltage.Status[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Phase L1 Voltage Value|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.PhaseL1.Voltage.Value[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Energy Meter 2 status|<p>-</p>|`SNMP agent`|cmcIIIVarValueStrg.EnergyMeter2.Status[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Energy Meter 2 value|<p>-</p>|`SNMP agent`|cmcIIIVarValueStrg.EnergyMeter2.Value[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|L1 Energy Active Custom Value|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.L1.Energy.Active.Custom.Value<p>Update: 5m</p><p>LLD</p>|
|L1 Energy Active Value|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.L1.Energy.Active.Value<p>Update: 5m</p><p>LLD</p>|
|L1 Energy Apparent Value|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.L1.Energy.Apparent.Value<p>Update: 5m</p><p>LLD</p>|
|Input 1.DescName|<p>-</p>|`SNMP agent`|cmcIIIVarStrg.Input1.DescName[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Input 1 Status|<p>-</p>|`SNMP agent`|cmcIIIVarStrg.Input1.Status[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Input 1 Value|<p>-</p>|`SNMP agent`|cmcIIIVarStrg.Input1.Value[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Humidity Status|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.Humidity.Status[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Humidity Value|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Leakage Status|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.Leakage.Status[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|$1|<p>-</p>|`SNMP agent`|Walk-SNMP[{#SNMPVALUE} ({#SNMPINDEX})]<p>Update: 1m</p><p>LLD</p>|
|Unit Power Active Status|<p>-</p>|`SNMP agent`|Unit.Power.Active.Status[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Unit Power Active Value|<p>-</p>|`SNMP agent`|Unit.Power.Active.Value[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Climate Status|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.Climate[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Door status|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.Access.Status<p>Update: 1m</p><p>LLD</p>|
|Access DescName|<p>-</p>|`SNMP agent`|cmcIIIVarValueStrg.Access.DescName<p>Update: 1h</p><p>LLD</p>|
|Temperature Status|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.Temperature.Status[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Temperature Value|<p>-</p>|`SNMP agent`|cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Energy Meter 1 status|<p>-</p>|`SNMP agent`|cmcIIIVarValueStrg.EnergyMeter1.Status[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Energy Meter 1 value|<p>-</p>|`SNMP agent`|cmcIIIVarValueStrg.EnergyMeter1.Value[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Input 2.DescName|<p>-</p>|`SNMP agent`|cmcIIIVarStrg.Input2.DescName[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Input 2 Status|<p>-</p>|`SNMP agent`|cmcIIIVarStrg.Input2.Status[{#SNMPINDEX}]<p>Update: 2m</p><p>LLD</p>|
|Input 2 Value|<p>-</p>|`SNMP agent`|cmcIIIVarStrg.Input2.Value[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Open door warning|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Access.Status.last()}<>13</p><p>**Recovery expression**: </p>|warning|
|AirFlow Status alarm|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueStrg.Analog.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|high|
|Climate alarm HIGH {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Climate[{#SNMPINDEX}].last()}>=40</p><p>**Recovery expression**: </p>|disaster|
|Climate alarm {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Climate[{#SNMPINDEX}].last()}>=35</p><p>**Recovery expression**: </p>|high|
|Alarm Humidity Status|<p>The humidity status is not OK</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|high|
|Humidity Above Normal {ITEM.LASTVALUE}|<p>The humidity is above normal</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}>75 and {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}<80</p><p>**Recovery expression**: </p>|average|
|Humidity Below Normal {ITEM.LASTVALUE}|<p>The humidity is below normal</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}<=30 and {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}>25</p><p>**Recovery expression**: </p>|average|
|Humidity Very Above Normal {ITEM.LASTVALUE}|<p>Humidity is too high</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}>=80</p><p>**Recovery expression**: </p>|high|
|Humidity Very Below Normal {ITEM.LASTVALUE}|<p>Humidity is too low</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}<=25</p><p>**Recovery expression**: </p>|high|
|Input 1 status alarm|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarStrg.Input1.Status[{#SNMPINDEX}].last()}=4 and {Rittal_PDU 1Phase EN:cmcIIIVarStrg.Input1.Value[{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Input 2 status alarm|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarStrg.Input2.Status[{#SNMPINDEX}].last()}=4 and {Rittal_PDU 1Phase EN:cmcIIIVarStrg.Input2.Value[{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Alarm Leakage Status|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Leakage.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|disaster|
|Alarm Current Status Phase L1|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.PhaseL1.Current.Status[{#SNMPINDEX}].last()}<>10</p><p>**Recovery expression**: </p>|high|
|Alarm Power Status Phase L1|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.PhaseL1.Current.Status[{#SNMPINDEX}].last()}<>10</p><p>**Recovery expression**: </p>|high|
|Alarm Voltage Status Phase L1|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.PhaseL1.Voltage.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|high|
|Temparture status alarm|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|high|
|Temperature Above Normal {ITEM.LASTVALUE}°C|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}>=25 and {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}<26</p><p>**Recovery expression**: </p>|average|
|Temperature Below Normal {ITEM.LASTVALUE}°C|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}<=15 and {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}>13</p><p>**Recovery expression**: </p>|average|
|Temperature Far Below Normal {ITEM.LASTVALUE}°C|<p>Temperature too low</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}<=13</p><p>**Recovery expression**: </p>|high|
|Temperature Very Above Normal {ITEM.LASTVALUE}°C|<p>Temperature too high</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}>=26</p><p>**Recovery expression**: </p>|high|
|PDU has been restartet (uptime < 5m)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:Unit.Energy.Active.Runtime.Value[{#SNMPINDEX}].last()}<5m</p><p>**Recovery expression**: </p>|average|
|Alarm Unit Power Active Status|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:Unit.Power.Active.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME} $1|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:Walk-SNMP[{#SNMPVALUE} ({#SNMPINDEX})].str(OK)}<>1</p><p>**Recovery expression**: </p>|disaster|
|AirFlow Status alarm (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueStrg.Analog.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|high|
|PDU has been restartet (uptime < 5m) (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:Unit.Energy.Active.Runtime.Value[{#SNMPINDEX}].last()}<5m</p><p>**Recovery expression**: </p>|average|
|Alarm Current Status Phase L1 (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.PhaseL1.Current.Status[{#SNMPINDEX}].last()}<>10</p><p>**Recovery expression**: </p>|high|
|Alarm Power Status Phase L1 (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.PhaseL1.Current.Status[{#SNMPINDEX}].last()}<>10</p><p>**Recovery expression**: </p>|high|
|Alarm Voltage Status Phase L1 (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.PhaseL1.Voltage.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|high|
|Input 1 status alarm (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarStrg.Input1.Status[{#SNMPINDEX}].last()}=4 and {Rittal_PDU 1Phase EN:cmcIIIVarStrg.Input1.Value[{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Alarm Humidity Status (LLD)|<p>The humidity status is not OK</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|high|
|Humidity Above Normal {ITEM.LASTVALUE} (LLD)|<p>The humidity is above normal</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}>75 and {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}<80</p><p>**Recovery expression**: </p>|average|
|Humidity Below Normal {ITEM.LASTVALUE} (LLD)|<p>The humidity is below normal</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}<=30 and {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}>25</p><p>**Recovery expression**: </p>|average|
|Humidity Very Above Normal {ITEM.LASTVALUE} (LLD)|<p>Humidity is too high</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}>=80</p><p>**Recovery expression**: </p>|high|
|Humidity Very Below Normal {ITEM.LASTVALUE} (LLD)|<p>Humidity is too low</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Humidity.Value[{#SNMPINDEX}].last()}<=25</p><p>**Recovery expression**: </p>|high|
|Alarm Leakage Status (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Leakage.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|disaster|
|{HOST.NAME} $1 (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:Walk-SNMP[{#SNMPVALUE} ({#SNMPINDEX})].str(OK)}<>1</p><p>**Recovery expression**: </p>|disaster|
|Alarm Unit Power Active Status (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:Unit.Power.Active.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|disaster|
|Climate alarm HIGH {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Climate[{#SNMPINDEX}].last()}>=40</p><p>**Recovery expression**: </p>|disaster|
|Climate alarm {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Climate[{#SNMPINDEX}].last()}>=35</p><p>**Recovery expression**: </p>|high|
|Open door warning (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Access.Status.last()}<>13</p><p>**Recovery expression**: </p>|warning|
|Temparture status alarm (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Status[{#SNMPINDEX}].last()}<>4</p><p>**Recovery expression**: </p>|high|
|Temperature Above Normal {ITEM.LASTVALUE}°C (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}>=25 and {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}<26</p><p>**Recovery expression**: </p>|average|
|Temperature Below Normal {ITEM.LASTVALUE}°C (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}<=15 and {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}>13</p><p>**Recovery expression**: </p>|average|
|Temperature Far Below Normal {ITEM.LASTVALUE}°C (LLD)|<p>Temperature too low</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}<=13</p><p>**Recovery expression**: </p>|high|
|Temperature Very Above Normal {ITEM.LASTVALUE}°C (LLD)|<p>Temperature too high</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarValueInt.Temperature.Value[{#SNMPINDEX}].last()}>=26</p><p>**Recovery expression**: </p>|high|
|Input 2 status alarm (LLD)|<p>-</p>|<p>**Expression**: {Rittal_PDU 1Phase EN:cmcIIIVarStrg.Input2.Status[{#SNMPINDEX}].last()}=4 and {Rittal_PDU 1Phase EN:cmcIIIVarStrg.Input2.Value[{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
