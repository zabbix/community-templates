# Stornext Quota

## Overview

Template for get Quotas from Stornext 5 WebAPI 


Just write macro values in host configuration.


{$USERNAME\_VALUE\_STORNEXT}


{$PASSWORD\_VALUE\_STORNEXT}


{$FSNAME\_VALUE\_STORNEXT}


 


Template have dependent items which use main item.


Dependent items will create by discovery process.


- Current Size in TB


- Grace Period in weeks


- Hard Limit in TB


- Soft Limit in TB


- Used Space in percents


 


Warning and average triggers by 5% and 0%


 


It use GET to 


https://IP/sws/v2/quota/snquota?username=USER&password=PASSWORD&fsname=NAME&action=listall&format=json


 



## Author

Kirill Savin, Nikita Kuznetsov

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$FSNAME_VALUE_STORNEXT}|<p>-</p>|``|Text macro|
|{$PASSWORD_VALUE_STORNEXT}|<p>-</p>|``|Text macro|
|{$USERNAME_VALUE_STORNEXT}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Quotas|<p>-</p>|`HTTP agent`|snquotas.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Quota on all filesystems|<p>-</p>|`HTTP agent`|snquotas.onfs.all<p>Update: 30m</p>|
|Used space on fs {#SNQUOTAID}|<p>-</p>|`Calculated`|snquotas.onfs.curSize.percent.[calc,{#SNQUOTAID}]<p>Update: 30m</p><p>LLD</p>|
|Quota on fs {#SNQUOTAID} Current Size|<p>-</p>|`Dependent item`|snquotas.onfs.curSize.[{#SNQUOTAID}]<p>Update: 0</p><p>LLD</p>|
|Quota on fs {#SNQUOTAID} Grace Period|<p>-</p>|`Dependent item`|snquotas.onfs.gracePeriod.[{#SNQUOTAID}]<p>Update: 0</p><p>LLD</p>|
|Quota on fs {#SNQUOTAID} Hard Limit|<p>-</p>|`Dependent item`|snquotas.onfs.hardLimit.[{#SNQUOTAID}]<p>Update: 0</p><p>LLD</p>|
|Quota on fs {#SNQUOTAID} Soft Limit|<p>-</p>|`Dependent item`|snquotas.onfs.softLimit.[{#SNQUOTAID}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Free disk quota is less than 0% on fs {#SNQUOTAID}|<p>-</p>|<p>**Expression**: {Stornext Quota:snquotas.onfs.curSize.percent.[calc,{#SNQUOTAID}].last()}>=100</p><p>**Recovery expression**: </p>|average|
|Free disk quota is less than 5% on fs {#SNQUOTAID}|<p>-</p>|<p>**Expression**: {Stornext Quota:snquotas.onfs.curSize.percent.[calc,{#SNQUOTAID}].last()}>=95</p><p>**Recovery expression**: </p>|warning|
|Free disk quota is less than 0% on fs {#SNQUOTAID} (LLD)|<p>-</p>|<p>**Expression**: {Stornext Quota:snquotas.onfs.curSize.percent.[calc,{#SNQUOTAID}].last()}>=100</p><p>**Recovery expression**: </p>|average|
|Free disk quota is less than 5% on fs {#SNQUOTAID} (LLD)|<p>-</p>|<p>**Expression**: {Stornext Quota:snquotas.onfs.curSize.percent.[calc,{#SNQUOTAID}].last()}>=95</p><p>**Recovery expression**: </p>|warning|
