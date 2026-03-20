# Adaptec PS

## Overview

Description
-----------


This template is for discovering and monitoring adaptec storage controllers by using outputs of arcconf cli tool. Useful only if you have one adaptec adapter in server (i don't have servers with more fore testing). Now it works only with zabbix 4.2


Main features
-------------


* Discovery of controllers, logical discs, physical discs, batteries
* Monitoring controllers, logical, physical discs, batteries
* Comfortable changing of time intervals by macroses.


## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Logical disks discovery|<p>-</p>|`Zabbix agent`|adaptec.raid[lld,ld]<p>Update: {$LD_DISCOVERY_PERIOD}</p>|
|Physical disks discovery|<p>-</p>|`Zabbix agent`|adaptec.raid[lld,pd]<p>Update: {$PD_DISCOVERY_PERIOD}</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|All Pds info|<p>-</p>|`Zabbix agent`|adaptec.raid[info,pd]<p>Update: {$PD_REQUEST_PERIOD}</p>|
|All Ctls info|<p>-</p>|`Zabbix agent`|adaptec.raid[info,ad]<p>Update: {$ADAP_REQUEST_PERIOD}</p>|
|All Lds info|<p>-</p>|`Zabbix agent`|adaptec.raid[info,ld]<p>Update: {$LD_REQUEST_PERIOD}</p>|
|Controller battery state|<p>-</p>|`Dependent item`|adaptec.zmm.state<p>Update: 0</p>|
|Controller model|<p>-</p>|`Dependent item`|adaptec.ctl.model<p>Update: 0</p>|
|Controller state|<p>-</p>|`Dependent item`|adaptec.ctl.state<p>Update: 0</p>|
|Controller serial number|<p>-</p>|`Dependent item`|adaptec.ctl.sn<p>Update: 0</p>|
|Logical disk "{#LDNAME}" level|<p>-</p>|`Dependent item`|adaptec.raid.level.[{#LDNAME}]<p>Update: 0</p><p>LLD</p>|
|Logical disk "{#LDNAME}" state|<p>-</p>|`Dependent item`|adaptec.raid.state.[{#LDNAME}]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#SLOT}" model|<p>-</p>|`Dependent item`|adaptec.pd.model.["{#SLOT}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#SLOT}" SMART warnings|<p>-</p>|`Dependent item`|adaptec.pd.smartwarn.["{#SLOT}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#SLOT}" serial number|<p>-</p>|`Dependent item`|adaptec.pd.sn.["{#SLOT}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#SLOT}" state|<p>-</p>|`Dependent item`|adaptec.pd.state.["{#SLOT}"]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Adaptec logical disk "{#LDNAME}"  is {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Adaptec PS:adaptec.raid.state.[{#LDNAME}].str(Optimal)}=0</p><p>**Recovery expression**: {Adaptec PS:adaptec.raid.state.[{#LDNAME}].str(Optimal)}=1</p>|high|
|Adaptec physical disk "{#SLOT}" has {ITEM.LASTVALUE} smart warnings|<p>-</p>|<p>**Expression**: {Adaptec PS:adaptec.pd.smartwarn.["{#SLOT}"].last()}>0</p><p>**Recovery expression**: {Adaptec PS:adaptec.pd.smartwarn.["{#SLOT}"].last()}=0</p>|average|
|Adaptec physical disk "{#SLOT}" state is {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Adaptec PS:adaptec.pd.state.["{#SLOT}"].str(Online)}=0 and {Adaptec PS:adaptec.pd.state.["{#SLOT}"].str(Global Hot-Spare)}=0</p><p>**Recovery expression**: {Adaptec PS:adaptec.pd.state.["{#SLOT}"].str(Online)}=1 or {Adaptec PS:adaptec.pd.state.["{#SLOT}"].str(Global Hot-Spare)}=1</p>|average|
|Adaptec physical disk "{#SLOT}" was replaced by: {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Adaptec PS:adaptec.pd.sn.["{#SLOT}"].diff()}=1 and {Adaptec PS:adaptec.pd.sn.["{#SLOT}"].strlen()}>0</p><p>**Recovery expression**: </p>|information|
|Adaptec logical disk "{#LDNAME}"  is {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adaptec PS:adaptec.raid.state.[{#LDNAME}].str(Optimal)}=0</p><p>**Recovery expression**: {Adaptec PS:adaptec.raid.state.[{#LDNAME}].str(Optimal)}=1</p>|high|
|Adaptec physical disk "{#SLOT}" has {ITEM.LASTVALUE} smart warnings (LLD)|<p>-</p>|<p>**Expression**: {Adaptec PS:adaptec.pd.smartwarn.["{#SLOT}"].last()}>0</p><p>**Recovery expression**: {Adaptec PS:adaptec.pd.smartwarn.["{#SLOT}"].last()}=0</p>|average|
|Adaptec physical disk "{#SLOT}" state is {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adaptec PS:adaptec.pd.state.["{#SLOT}"].str(Online)}=0 and {Adaptec PS:adaptec.pd.state.["{#SLOT}"].str(Global Hot-Spare)}=0</p><p>**Recovery expression**: {Adaptec PS:adaptec.pd.state.["{#SLOT}"].str(Online)}=1 or {Adaptec PS:adaptec.pd.state.["{#SLOT}"].str(Global Hot-Spare)}=1</p>|average|
|Adaptec physical disk "{#SLOT}" was replaced by: {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Adaptec PS:adaptec.pd.sn.["{#SLOT}"].diff()}=1 and {Adaptec PS:adaptec.pd.sn.["{#SLOT}"].strlen()}>0</p><p>**Recovery expression**: </p>|information|
