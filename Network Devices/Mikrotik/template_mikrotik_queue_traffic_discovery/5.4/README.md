# Mikrotik-QUEUE

## Overview

zabbix template for graphing queue traffic on mikrotik devices


[mehdi.sadighian@hotmail.com](mailto:mehdi.sadighian@hotmail.com)


<https://msadighian.com>



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Queues|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.14988.1.1.2.1.1.2<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Queue $1 (IN)|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.14988.1.1.2.1.1.8[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Queue $1 (OUT)|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.14988.1.1.2.1.1.9[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

