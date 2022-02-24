# App Citrix License Sever

## Overview

This Template doesn't require any scripts on the target machine.


It is able to enumerate and discover the installed licenses.


Following properties will be monitored (to be extended):


* List of installed licenses
* License expiration


## Author

WorkSimple GmbH

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CITRIX_LIC.EXPIRY.CRITICAL}|<p>The critical threshold of time for a license to expire in seconds.</p>|`691200`|Text macro|
|{$CITRIX_LIC.EXPIRY.WARN}|<p>The warning threshold of time for a license to expire in seconds.</p>|`1209600`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Citrix Licenses discovery|<p>-</p>|`Zabbix agent`|wmi.getall["ROOT\CitrixLicensing","SELECT SerialNumber FROM Citrix_GT_License WHERE SerialNumber <> ''"]<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Citrix License {#CITRIX_LIC} validity period|<p>-</p>|`Zabbix agent`|wmi.get["ROOT\CitrixLicensing","SELECT ExpirationDate FROM Citrix_GT_License WHERE SerialNumber = '{#CITRIX_LIC}'"]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Citrix License {#CITRIX_LIC} is about to expire|<p>-</p>|<p>**Expression**: {App Citrix License Sever:wmi.get["ROOT CitrixLicensing","SELECT ExpirationDate FROM Citrix_GT_License WHERE SerialNumber = '{#CITRIX_LIC}'"].avg(#3)}<1209600</p><p>**Recovery expression**: </p>|warning|
|Citrix License {#CITRIX_LIC} is about to expire (LLD)|<p>-</p>|<p>**Expression**: {App Citrix License Sever:wmi.get["ROOT CitrixLicensing","SELECT ExpirationDate FROM Citrix_GT_License WHERE SerialNumber = '{#CITRIX_LIC}'"].avg(#3)}<1209600</p><p>**Recovery expression**: </p>|warning|
