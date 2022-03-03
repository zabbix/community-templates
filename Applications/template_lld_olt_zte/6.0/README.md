# LLD OLT ZTE

## Overview

Template OLT ZTE com LLD


 


O QUE O TEMPLATE FAZ:


 


- Sinal TX e RX OLT


- Status up e down das onu.


 


Feito com a ajuda do **Gabriel Augusto Besteiro.**



## Author

Anderson Raber

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ONU Status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.3902.1012.3.28.1.1.2<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OLT RX Signal - {#SNMPVALUE}|<p>-</p>|`SNMP agent`|zxoltrxsignal.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|OLT TX Signal - {#SNMPVALUE}|<p>-</p>|`SNMP agent`|zxolttxsignal.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|ONU Status {#SNMPVALUE}|<p>-</p>|`SNMP agent`|zxonustatus.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|ONU {#SNMPVALUE} is Offline|<p>-</p>|<p>**Expression**: last(/LLD OLT ZTE/zxonustatus.[{#SNMPINDEX}],#24)>1</p><p>**Recovery expression**: </p>|high|
|ONU {#SNMPVALUE} is Offline (LLD)|<p>-</p>|<p>**Expression**: last(/LLD OLT ZTE/zxonustatus.[{#SNMPINDEX}],#24)>1</p><p>**Recovery expression**: </p>|high|
