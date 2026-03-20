# LSI JSON discovery

## Overview

Description
-----------


This template is for discovering and monitoring LSI (Avago, Broadcom) storage controllers by using json outputs of storcli tool. Now it works only with zabbix 4.2


Main features
-------------


* Discovery of controllers, logical discs, physical discs, batteries (bbu an cv) without scripts on servers side (it uses parsing of json and java scripts on zabbix side)
* Monitoring controllers, logical, physical discs, batteries
* Useful with OS, where storcli works
* Comfortable changing of time intervals by macroses.


Notes
-----


* Please follow link for the newest version and instruction

<

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ADAP_THROTTLING_HB_PERIOD}|<p>-</p>|`10800`|Text macro|
|{$INTERNAL_ITEMS_HISTORY_PEIOD}|<p>-</p>|`0`|Text macro|
|{$LD_THROTTLING_HB_PERIOD}|<p>-</p>|`10800`|Text macro|
|{$PD_THROTTLING_HB_PERIOD}|<p>-</p>|`10800`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Controllers discovery|<p>-</p>|`Zabbix agent`|lsi.ctllld<p>Update: {$ADAP_DISCOVERY_PERIOD}</p>|
|Logical disks discovery|<p>-</p>|`Zabbix agent`|lsi.ldlld<p>Update: {$LD_DISCOVERY_PERIOD}</p>|
|Physical disks discovery|<p>-</p>|`Zabbix agent`|lsi.pdlld<p>Update: {$PD_DISCOVERY_PERIOD}</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|All bbus info|<p>-</p>|`Zabbix agent`|lsi.bbusinfo<p>Update: {$ADAP_REQUEST_PERIOD}</p>|
|All Lds info|<p>-</p>|`Zabbix agent`|lsi.ldsinfo<p>Update: {$LD_REQUEST_PERIOD}</p>|
|All cvs info|<p>-</p>|`Zabbix agent`|lsi.cvsinfo<p>Update: {$ADAP_REQUEST_PERIOD}</p>|
|All Ctls info|<p>-</p>|`Zabbix agent`|lsi.ctlsinfo<p>Update: {$ADAP_REQUEST_PERIOD}</p>|
|All Pds info|<p>-</p>|`Zabbix agent`|lsi.pdsinfo<p>Update: {$PD_REQUEST_PERIOD}</p>|
|Controller "{#CTLID}" cache vault data|<p>-</p>|`Dependent item`|lsi.ctl.cvdata.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" cache bbu data|<p>-</p>|`Dependent item`|lsi.ctl.bbu.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" model|<p>-</p>|`Dependent item`|lsi.ctl.model.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" serial number|<p>-</p>|`Dependent item`|lsi.ctl.sn.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" state (health)|<p>-</p>|`Dependent item`|lsi.ctl.state.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" bbu low charge level|<p>-</p>|`Dependent item`|lsi.ctl.bbulowcharge.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" bbu need to replace|<p>-</p>|`Dependent item`|lsi.ctl.bbureplace.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" bbu serial number|<p>-</p>|`Dependent item`|lsi.ctl.bbusn.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" bbu state|<p>-</p>|`Dependent item`|lsi.ctl.bbustate.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" bbu type|<p>-</p>|`Dependent item`|lsi.ctl.bbutype.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" cache vault need to replace|<p>-</p>|`Dependent item`|lsi.ctl.cvreplace.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" cache vault serial number|<p>-</p>|`Dependent item`|lsi.ctl.cvsn.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" cache vault state|<p>-</p>|`Dependent item`|lsi.ctl.cvstate.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Controller "{#CTLID}" cache vault type|<p>-</p>|`Dependent item`|lsi.ctl.cvtype.["{#CTLID}"]<p>Update: 0</p><p>LLD</p>|
|Logical disk "{#LDNAME}" (id {#LDID}) level|<p>-</p>|`Dependent item`|lsi.ld.level.["{#LDID}"]<p>Update: 0</p><p>LLD</p>|
|Logical disk "{#LDNAME}" (id {#LDID})  state|<p>-</p>|`Dependent item`|lsi.ld.state.["{#LDID}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#PDID}" media error count|<p>-</p>|`Dependent item`|lsi.pd.merrcount.["{#PDID}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#PDID}" model|<p>-</p>|`Dependent item`|lsi.pd.model.["{#PDID}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#PDID}" other error count|<p>-</p>|`Dependent item`|lsi.pd.otherrcount.["{#PDID}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#PDID}" predictive failure count|<p>-</p>|`Dependent item`|lsi.pd.predicterrcount.["{#PDID}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#PDID}" SMART flag|<p>-</p>|`Dependent item`|lsi.pd.smartflag.["{#PDID}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#PDID}" serial number|<p>-</p>|`Dependent item`|lsi.pd.sn.["{#PDID}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#PDID}" state|<p>-</p>|`Dependent item`|lsi.pd.state.["{#PDID}"]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|LSI controller {#CTLID} battery charge level is low|<p>-</p>|<p>**Expression**: find(/LSI JSON discovery/lsi.ctl.bbulowcharge.["{#CTLID}"],,"like","No")=0 and length(last(/LSI JSON discovery/lsi.ctl.bbulowcharge.["{#CTLID}"]))>0</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} bbu battery is need to be replaced|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.ctl.bbureplace.["{#CTLID}"],,"like","No")=0 and length(last(/LSI JSON discovery/lsi.ctl.bbureplace.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} bbu battery state is {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.ctl.bbustate.["{#CTLID}"],,"like","Optimal")=0 and length(last(/LSI JSON discovery/lsi.ctl.bbustate.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} bbu battery was replaced|<p>-</p>|<p>**Expression**: ((last(/LSI JSON discovery/lsi.ctl.bbusn.["{#CTLID}"],#1)<>last(/LSI JSON discovery/lsi.ctl.bbusn.["{#CTLID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.ctl.bbusn.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|information|
|LSI controller {#CTLID} cachevault battery is need to be replaced|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.ctl.cvreplace.["{#CTLID}"],,"like","No")=0 and length(last(/LSI JSON discovery/lsi.ctl.cvreplace.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} cachevault battery state is {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.ctl.cvstate.["{#CTLID}"],,"like","Optimal")=0 and length(last(/LSI JSON discovery/lsi.ctl.cvstate.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} cachevault battery was replaced|<p>-</p>|<p>**Expression**: ((last(/LSI JSON discovery/lsi.ctl.cvsn.["{#CTLID}"],#1)<>last(/LSI JSON discovery/lsi.ctl.cvsn.["{#CTLID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.ctl.cvsn.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|information|
|LSI controller {#CTLID} status is {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: find(/LSI JSON discovery/lsi.ctl.state.["{#CTLID}"],,"like","Opt")=0</p><p>**Recovery expression**: find(/LSI JSON discovery/lsi.ctl.state.["{#CTLID}"],,"like","Opt")=1</p>|high|
|LSI controller {#CTLID} was replaced|<p>-</p>|<p>**Expression**: (last(/LSI JSON discovery/lsi.ctl.sn.["{#CTLID}"],#1)<>last(/LSI JSON discovery/lsi.ctl.sn.["{#CTLID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.ctl.sn.["{#CTLID}"]))>0</p><p>**Recovery expression**: </p>|information|
|LSI logical disk "{#LDNAME}" ("{#LDID}") state is "{ITEM.LASTVALUE}"|<p>-</p>|<p>**Expression**: find(/LSI JSON discovery/lsi.ld.state.["{#LDID}"],,"like","Optimal")=0</p><p>**Recovery expression**: find(/LSI JSON discovery/lsi.ld.state.["{#LDID}"],,"like","Optimal")=1</p>|high|
|LSI physical disk "{#PDID}" is "{ITEM.LASTVALUE}"|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Unconfigured-Bad")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Unconfigured-Good")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Missing")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Offline")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Foreign")=1) and (last(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],#1)<>last(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.pd.state.["{#PDID}"]))>0</p><p>**Recovery expression**: find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Unconfigured-Good")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Online")=1</p>|high|
|LSI physical disk "{#PDID}" media error count is "{ITEM.LASTVALUE}"|<p>-</p>|<p>**Expression**: last(/LSI JSON discovery/lsi.pd.merrcount.["{#PDID}"])>0</p><p>**Recovery expression**: last(/LSI JSON discovery/lsi.pd.merrcount.["{#PDID}"])=0</p>|average|
|LSI physical disk "{#PDID}" predictive failure count is "{ITEM.LASTVALUE}"|<p>-</p>|<p>**Expression**: last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"])>0</p><p>**Recovery expression**: last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"])=0</p>|warning|
|LSI physical disk "{#PDID}" predictive failure count is "{ITEM.LASTVALUE}". Growing up|<p>-</p>|<p>**Expression**: last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"])>0 and (last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"],#1)<>last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"],#2))=1</p><p>**Recovery expression**: last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"])=0</p>|warning|
|LSI physical disk "{#PDID}" was replaced by sn  "{ITEM.LASTVALUE1}".  Previous sn: "{ITEM.LASTVALUE2}"|<p>-</p>|<p>**Expression**: (last(/LSI JSON discovery/lsi.pd.sn.["{#PDID}"],#1)<>last(/LSI JSON discovery/lsi.pd.sn.["{#PDID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.pd.sn.["{#PDID}"],#2))>0</p><p>**Recovery expression**: </p>|information|
|LSI physical disk: SMART flag was raised up on "{#PDID}"|<p>-</p>|<p>**Expression**: find(/LSI JSON discovery/lsi.pd.smartflag.["{#PDID}"],,"like","Yes")=1</p><p>**Recovery expression**: find(/LSI JSON discovery/lsi.pd.smartflag.["{#PDID}"],,"like","No")=1</p>|average|
|LSI controller {#CTLID} battery charge level is low (LLD)|<p>-</p>|<p>**Expression**: find(/LSI JSON discovery/lsi.ctl.bbulowcharge.["{#CTLID}"],,"like","No")=0 and length(last(/LSI JSON discovery/lsi.ctl.bbulowcharge.["{#CTLID}"]))>0</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} bbu battery is need to be replaced (LLD)|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.ctl.bbureplace.["{#CTLID}"],,"like","No")=0 and length(last(/LSI JSON discovery/lsi.ctl.bbureplace.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} bbu battery state is {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.ctl.bbustate.["{#CTLID}"],,"like","Optimal")=0 and length(last(/LSI JSON discovery/lsi.ctl.bbustate.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} bbu battery was replaced (LLD)|<p>-</p>|<p>**Expression**: ((last(/LSI JSON discovery/lsi.ctl.bbusn.["{#CTLID}"],#1)<>last(/LSI JSON discovery/lsi.ctl.bbusn.["{#CTLID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.ctl.bbusn.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|information|
|LSI controller {#CTLID} cachevault battery is need to be replaced (LLD)|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.ctl.cvreplace.["{#CTLID}"],,"like","No")=0 and length(last(/LSI JSON discovery/lsi.ctl.cvreplace.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} cachevault battery state is {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.ctl.cvstate.["{#CTLID}"],,"like","Optimal")=0 and length(last(/LSI JSON discovery/lsi.ctl.cvstate.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|average|
|LSI controller {#CTLID} cachevault battery was replaced (LLD)|<p>-</p>|<p>**Expression**: ((last(/LSI JSON discovery/lsi.ctl.cvsn.["{#CTLID}"],#1)<>last(/LSI JSON discovery/lsi.ctl.cvsn.["{#CTLID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.ctl.cvsn.["{#CTLID}"]))>0)</p><p>**Recovery expression**: </p>|information|
|LSI controller {#CTLID} status is {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: find(/LSI JSON discovery/lsi.ctl.state.["{#CTLID}"],,"like","Opt")=0</p><p>**Recovery expression**: find(/LSI JSON discovery/lsi.ctl.state.["{#CTLID}"],,"like","Opt")=1</p>|high|
|LSI controller {#CTLID} was replaced (LLD)|<p>-</p>|<p>**Expression**: (last(/LSI JSON discovery/lsi.ctl.sn.["{#CTLID}"],#1)<>last(/LSI JSON discovery/lsi.ctl.sn.["{#CTLID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.ctl.sn.["{#CTLID}"]))>0</p><p>**Recovery expression**: </p>|information|
|LSI logical disk "{#LDNAME}" ("{#LDID}") state is "{ITEM.LASTVALUE}" (LLD)|<p>-</p>|<p>**Expression**: find(/LSI JSON discovery/lsi.ld.state.["{#LDID}"],,"like","Optimal")=0</p><p>**Recovery expression**: find(/LSI JSON discovery/lsi.ld.state.["{#LDID}"],,"like","Optimal")=1</p>|high|
|LSI physical disk "{#PDID}" is "{ITEM.LASTVALUE}" (LLD)|<p>-</p>|<p>**Expression**: (find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Unconfigured-Bad")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Unconfigured-Good")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Missing")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Offline")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Foreign")=1) and (last(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],#1)<>last(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.pd.state.["{#PDID}"]))>0</p><p>**Recovery expression**: find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Unconfigured-Good")=1 or find(/LSI JSON discovery/lsi.pd.state.["{#PDID}"],,"like","Online")=1</p>|high|
|LSI physical disk "{#PDID}" media error count is "{ITEM.LASTVALUE}" (LLD)|<p>-</p>|<p>**Expression**: last(/LSI JSON discovery/lsi.pd.merrcount.["{#PDID}"])>0</p><p>**Recovery expression**: last(/LSI JSON discovery/lsi.pd.merrcount.["{#PDID}"])=0</p>|average|
|LSI physical disk "{#PDID}" predictive failure count is "{ITEM.LASTVALUE}" (LLD)|<p>-</p>|<p>**Expression**: last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"])>0</p><p>**Recovery expression**: last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"])=0</p>|warning|
|LSI physical disk "{#PDID}" predictive failure count is "{ITEM.LASTVALUE}". Growing up (LLD)|<p>-</p>|<p>**Expression**: last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"])>0 and (last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"],#1)<>last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"],#2))=1</p><p>**Recovery expression**: last(/LSI JSON discovery/lsi.pd.predicterrcount.["{#PDID}"])=0</p>|warning|
|LSI physical disk "{#PDID}" was replaced by sn  "{ITEM.LASTVALUE1}".  Previous sn: "{ITEM.LASTVALUE2}" (LLD)|<p>-</p>|<p>**Expression**: (last(/LSI JSON discovery/lsi.pd.sn.["{#PDID}"],#1)<>last(/LSI JSON discovery/lsi.pd.sn.["{#PDID}"],#2))=1 and length(last(/LSI JSON discovery/lsi.pd.sn.["{#PDID}"],#2))>0</p><p>**Recovery expression**: </p>|information|
|LSI physical disk: SMART flag was raised up on "{#PDID}" (LLD)|<p>-</p>|<p>**Expression**: find(/LSI JSON discovery/lsi.pd.smartflag.["{#PDID}"],,"like","Yes")=1</p><p>**Recovery expression**: find(/LSI JSON discovery/lsi.pd.smartflag.["{#PDID}"],,"like","No")=1</p>|average|
