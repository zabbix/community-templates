# Cisco AXL License data

## Overview

Запрос кол-ва лицензий для Cisco UCM 11.5 через HTTP Agent.


 


На CUCM необходим application user с правами на чтение AXL.


В шаблоне использованы макросы:


логин для Application user: {$ZABBIX\_APIUSER\_UC}


пароль для Application user: {$ZABBIX\_APIPASS\_UC}


 


 


 



## Author

Yaazard

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|LicenseList|<p>-</p>|`HTTP agent`|uclicense<p>Update: 300s</p>|
|CUWL|<p>-</p>|`Dependent item`|uclicense_cuwl<p>Update: 0</p>|
|Basic|<p>-</p>|`Dependent item`|uclicense_basic<p>Update: 0</p>|
|Enhanced|<p>-</p>|`Dependent item`|uclicense_Enhanced<p>Update: 0</p>|
|EnhancedPlus|<p>-</p>|`Dependent item`|uclicense_enhp<p>Update: 0</p>|
|Essential|<p>-</p>|`Dependent item`|uclicense_Essential<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

