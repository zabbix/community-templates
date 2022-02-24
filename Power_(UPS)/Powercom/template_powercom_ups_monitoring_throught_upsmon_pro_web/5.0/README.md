# UPSMON Pro

## Overview

**Description:**


To work this solution you have to install on Windows Host - **UPSMON PRO 2.4** Appliction.


Zabbix template will grab data from UPSMON PRO WEB and store data in Zabbix.


**Items:**


* Input, V
* Output, V
* Frequency, Hz
* Load, %
* Battery Level, %
* Temperatue, C


**Triggers**:


* Battery is less than 50%;
* Battery is less than 20%;
* Input is less than 220V;
* Input is less than 200V;
* Input is less than 180V;
* Output is less than 200V;
* Temperature more than 30C;
* Temperature more than 35C.


 


Full description and required application can be found on GitHub: <https://github.com/ilianapro/zabbix_powercom_monitoring/>


Tested with **P****owercom Raptor RPT-1000AP**


 


Created by Ilias Aidar - 23/05/2020  
E-Mail: [ilias@ilianapro.com](mailto:ilias@ilianapro.com)  
Telegram: @iSmartyPro 



## Author

Ilias Aidar

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$URL}|<p>Here should be your UPSMON Pro URL</p>|`http://rd-kirovsk.gencoindustry.com:8000/ups.txt`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Frequency|<p>-</p>|`Dependent item`|UPS.Frequency<p>Update: 0</p>|
|Load|<p>-</p>|`Dependent item`|UPS.Load<p>Update: 0</p>|
|Log|<p>-</p>|`HTTP agent`|Log<p>Update: 1m</p>|
|Output|<p>-</p>|`Dependent item`|UPS.Output<p>Update: 0</p>|
|Battery Level|<p>-</p>|`Dependent item`|UPS.Battery<p>Update: 0</p>|
|Input|<p>-</p>|`Dependent item`|UPS.Input<p>Update: 0</p>|
|Temperature|<p>-</p>|`Dependent item`|UPS.Temperature<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

