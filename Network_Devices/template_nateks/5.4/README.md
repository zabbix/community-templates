# Nateks FG-ACE-CON-VF

## Overview

Nateks NETRADIO-MIB based template for monitoring radio channels.


Latest data includes:


- Channel number


- Channel IP


- Channel status


- Device Location


- Device Model



## Author

Olga Yanovskaya

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`private`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Netradio discovery|<p>-</p>|`SNMP agent`|Radio<p>Update: 60s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DeviceLocation|<p>-</p>|`SNMP agent`|DevLocation<p>Update: 60s</p>|
|DeviceModel|<p>-</p>|`SNMP agent`|DevModel<p>Update: 60s</p>|
|Channel[{#CHANNUM}][{#CHANIP}]Status|<p>-</p>|`SNMP agent`|ChanStatus[{#CHANNUM}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|RadioChannel [{#CHANNUM}] Status is not connected|<p>-</p>|<p>**Expression**: last(/Nateks FG-ACE-CON-VF/ChanStatus[{#CHANNUM}],#5)<>4</p><p>**Recovery expression**: </p>|warning|
|RadioChannel [{#CHANNUM}] Status is not connected (LLD)|<p>-</p>|<p>**Expression**: last(/Nateks FG-ACE-CON-VF/ChanStatus[{#CHANNUM}],#5)<>4</p><p>**Recovery expression**: </p>|warning|
