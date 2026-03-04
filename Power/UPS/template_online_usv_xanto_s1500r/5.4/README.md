# Xanto S1500R

## Overview

Template for Online USV - XANTO S1500R


tested with xabbix 3.2 via SNMP


 


Monitoring and triggers for


- Current Battery load in %


- Battery capacity


- remaining runtime in min


- temperature


- Voltage Input / Output


- MAC, USV Model, system runtime....


 


including triggers and graphs



## Author

stschu

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Voltage Output|<p>-</p>|`SNMP agent`|VoltageOut<p>Update: 30</p>|
|Temperature|<p>Temp</p>|`SNMP agent`|Temp<p>Update: 30</p>|
|Runtime|<p>remaining runtime in min</p>|`SNMP agent`|Time<p>Update: 30</p>|
|Voltage Input|<p>-</p>|`SNMP agent`|VoltageIN<p>Update: 30</p>|
|Load Current %|<p>current load in %</p>|`SNMP agent`|Load<p>Update: 30</p>|
|Battery Capacity|<p>-</p>|`SNMP agent`|Battery<p>Update: 30</p>|
|USV Model|<p>-</p>|`SNMP agent`|USVVersion<p>Update: 86400</p>|
|MAC|<p>-</p>|`SNMP agent`|deviceMAC<p>Update: 86400</p>|
|system uptime|<p>-</p>|`SNMP agent`|system.up<p>Update: 86400</p>|


## Triggers

There are no triggers in this template.

