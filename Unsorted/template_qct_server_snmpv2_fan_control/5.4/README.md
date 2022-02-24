# QCT Hardware Health

## Overview

QCT Server fan speed and health control template.


 


Value Mapping


unknown(1),


disable(2),


ok(3),


fail(4),


prefailure-predicted(5),


redundant-fan-failed(6),


not-manageable(7),


not-present(8),


not-available(9)


 


Reference:


https://github.com/simonjj/SnmpMibs/blob/master/S31.mib



## Author

Sami Onur Zaim

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Fan Index|<p>-</p>|`SNMP agent`|fan.index<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#FANNAME} Fan RPM|<p>-</p>|`SNMP agent`|fan.rpm.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|{#FANNAME} Fan Status|<p>-</p>|`SNMP agent`|fan.status.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

