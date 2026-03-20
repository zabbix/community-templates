# Template_APC_Monitor_RackPDU

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`CMPublic`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Phase 1|<p>PDU load in Amps by Phase</p>|`SNMP agent`|Load1Amps.rPDU<p>Update: 60;50/1-7,00:00-24:00</p>|
|High_3_Load_Point|<p>High Load Threshold by Phase</p>|`SNMP agent`|High3Load.rPDU<p>Update: 3600</p>|
|Phase 3|<p>PDU load in Amps by Phase</p>|`SNMP agent`|Load3Amps.rPDU<p>Update: 60</p>|
|High_2_Load_Point|<p>High Load Threshold by Phase</p>|`SNMP agent`|High2Load.rPDU<p>Update: 3600</p>|
|Near_High_3_Load_Point|<p>Near High Load Threshold by Phase</p>|`SNMP agent`|NHigh3Load.rPDU<p>Update: 3600</p>|
|Near_High_2_Load_Point|<p>Near High Load Threshold by Phase</p>|`SNMP agent`|NHigh2Load.rPDU<p>Update: 3600</p>|
|Low_1_Load_Point|<p>Low Load Threshold by Phase</p>|`SNMP agent`|Low1Load.rPDU<p>Update: 3600</p>|
|Low_3_Load_Point|<p>Low Load Threshold by Phase</p>|`SNMP agent`|Low3Load.rPDU<p>Update: 3600</p>|
|Low_2_Load_Point|<p>Low Load Threshold by Phase</p>|`SNMP agent`|Low2Load.rPDU<p>Update: 3600</p>|
|High_1_Load_Point|<p>High Load Threshold by Phase</p>|`SNMP agent`|High1Load.rPDU<p>Update: 3600</p>|
|State 2 Phase Load|<p>PhaseLoadNormal(1) = operating between high and low threshold OID values. phaseLoadLow(2) = dropped below low OID value. phaseLoadNearOverload(3) = is greater than or equal to the near overload value phaseLoadOverload(4) = load is greater than or equal to the high load OID value.</p>|`SNMP agent`|State2Load.rPDU<p>Update: 1800</p>|
|Phase 2|<p>PDU load in Amps by Phase</p>|`SNMP agent`|Load2Amps.rPDU<p>Update: 60</p>|
|Near_High_1_Load_Point|<p>Near High Load Threshold by Phase</p>|`SNMP agent`|NHigh1Load.rPDU<p>Update: 3600</p>|
|State 3 Phase Load|<p>PhaseLoadNormal(1) = operating between high and low threshold OID values. phaseLoadLow(2) = dropped below low OID value. phaseLoadNearOverload(3) = is greater than or equal to the near overload value phaseLoadOverload(4) = load is greater than or equal to the high load OID value.</p>|`SNMP agent`|State3Load.rPDU<p>Update: 1800</p>|
|State 1 Phase Load|<p>PhaseLoadNormal(1) = operating between high and low threshold OID values. phaseLoadLow(2) = dropped below low OID value. phaseLoadNearOverload(3) = is greater than or equal to the near overload value phaseLoadOverload(4) = load is greater than or equal to the high load OID value.</p>|`SNMP agent`|State1Load.rPDU<p>Update: 1800</p>|


## Triggers

There are no triggers in this template.

