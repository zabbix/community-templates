# Intel RST with js

## Overview

This template is for discovering and monitoring Intel RST (Intel VROC) storage controllers. Works with zabbix 4.2 and higher. Template uses action with zabbix API.


Instuctions is on github page


 


<https://github.com/mykolq/zabbix_intel_rst_template>



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$INTERNAL_ITEMS_HISTORY_PERIOD}|<p>Time interval for saving data. For debagging use you can set not null</p>|`0`|Text macro|
|{$INTERNAL_ITEMS_REQUEST_PERIOD}|<p>Time interval for getting internal information for template. Like driver version for controllers</p>|`60m`|Text macro|
|{$LD_HIGH_SEVERITY_STATES}|<p>Logical disks high severity states (using in regex of triggers)</p>|`Degraded|Failed`|Text macro|
|{$LD_INFORMATION_SEVERITY_STATES}|<p>Logical disks information severity states (using in regex of triggers)</p>|`Initializing`|Text macro|
|{$LD_RECOVERY_STATES}|<p>Logical disks recovery states (using in regex of triggers)</p>|`Normal`|Text macro|
|{$LD_THROTTLING_HB_PERIOD}|<p>Logical disk throttling heartbeat period</p>|`3h`|Text macro|
|{$LD_WARNING_SEVERITY_STATES}|<p>Logical disks warning severity states (using in regex of triggers)</p>|`Rebuilding|Verify and Fix`|Text macro|
|{$PD_HIGH_SEVERITY_STATES}|<p>Physical disks high severity states (using in regex of triggers)</p>|`Missing|Failed|Smart event triggered`|Text macro|
|{$PD_INFORMATION_SEVERITY_STATES}|<p>Physical disks information severity states</p>|`need to set it`|Text macro|
|{$PD_RECOVERY_STATES}|<p>Physicall disks recovery states (using in regex of triggers)</p>|`Normal`|Text macro|
|{$PD_THROTTLING_HB_PERIOD}|<p>Physical disk throttling heartbeat period</p>|`3h`|Text macro|
|{$PD_WARNING_SEVERITY_STATES}|<p>Physicall disks warning severity states (using in regex of triggers)</p>|`Verify|Rebuilding`|Text macro|
|{$STOR_CTRL_REQUEST_PERIOD}|<p>Time interval for getting all information from storage contrroller</p>|`5m`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Logical disks discovery|<p>-</p>|`Dependent item`|ldlld<p>Update: 0</p>|
|Physical disks discovery|<p>-</p>|`Dependent item`|pdlld<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|RST cli path|<p>Path to needed version of utility (depends on driver version)</p>|`Zabbix agent`|wmi.get[root\cimv2,select DriverVersion from Win32_PnPSignedDriver WHERE DriverProviderName like '%Intel%' and DeviceClass like 'SCSIADAPTER' and not DeviceName like '%Ethernet Virtual Storage%']<p>Update: {$INTERNAL_ITEMS_REQUEST_PERIOD}</p>|
|Intel RST All Info|<p>Get all info from rst controller(cli path + 'I' key)</p>|`Zabbix agent`|irst.allinfo[{$IRST_CLI}]<p>Update: {$STOR_CTRL_REQUEST_PERIOD}</p>|
|Intel RST All Pds LLD info|<p>JSON for lld of physical disks and for SMART template</p>|`Dependent item`|irst.SMART.lld<p>Update: 0</p>|
|Intel RST All Lds info|<p>-</p>|`Dependent item`|irst.ld<p>Update: 0</p>|
|Intel RST All Pds info|<p>-</p>|`Dependent item`|irst.pd<p>Update: 0</p>|
|Logical disk "{#LDNAME}" level|<p>-</p>|`Dependent item`|irst.raid.level.[{#LDNAME}]<p>Update: 0</p><p>LLD</p>|
|Logical disk "{#LDNAME}" disks count|<p>-</p>|`Dependent item`|irst.raid.pdcount.[{#LDNAME}]<p>Update: 0</p><p>LLD</p>|
|Logical disk "{#LDNAME}" state|<p>-</p>|`Dependent item`|irst.raid.state.[{#LDNAME}]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#SLOT}" serial number|<p>-</p>|`Dependent item`|irst.pd.sn.["{#SLOT}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#SLOT}" state|<p>-</p>|`Dependent item`|irst.pd.state.["{#SLOT}"]<p>Update: 0</p><p>LLD</p>|
|Physical disk "{#SLOT}" usage|<p>-</p>|`Dependent item`|irst.pd.usage.["{#SLOT}"]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Intel RST: Logical disk "{#LDNAME}" is "{ITEM.VALUE1}". LD level: {ITEM.VALUE2} Disks count: {ITEM.VALUE3}|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Degraded|Failed")=1 and last(/Intel RST with js/irst.raid.level.[{#LDNAME}])>0 and last(/Intel RST with js/irst.raid.pdcount.[{#LDNAME}])>0</p><p>**Recovery expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Normal")=1</p>|high|
|Intel RST: Logical disk "{#LDNAME}" is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Initializing")=1</p><p>**Recovery expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Normal")=1</p>|information|
|Intel RST: Logical disk "{#LDNAME}" is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#1,"regexp","Rebuilding|Verify and Fix")=1 and find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#3,"regexp","Degraded|Failed")=0</p><p>**Recovery expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Normal")=1</p>|warning|
|Intel RST: Logical disk "{#LDNAME}" state was changed from "Degraded" state to  "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#1,"regexp","Rebuilding|Verify and Fix")=1 and find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#2,"regexp","Degraded")=1</p><p>**Recovery expression**: </p>|information|
|Intel RST: Logical disk "{#LDNAME}" state was changed from "Failed" state to  "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#1,"regexp","Rebuilding|Verify and Fix")=1 and find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#2,"regexp","Failed")=1</p><p>**Recovery expression**: </p>|information|
|Intel RST: Physical disk "{#SLOT}" is "{ITEM.VALUE1}". Disk SN is "{ITEM.VALUE2}"|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","need to set it")=1 and length(last(/Intel RST with js/irst.pd.sn.["{#SLOT}"]))>0</p><p>**Recovery expression**: </p>|information|
|Intel RST: Physical disk "{#SLOT}" is "{ITEM.VALUE1}". Disk SN is "{ITEM.VALUE2}"|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","Verify|Rebuilding")=1 and length(last(/Intel RST with js/irst.pd.sn.["{#SLOT}"]))>0</p><p>**Recovery expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","Normal")=1</p>|warning|
|Intel RST: Physical disk "{#SLOT}" is "{ITEM.VALUE}". Disk SN is "{ITEM.VALUE2}"|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","Missing|Failed|Smart event triggered")=1 and length(last(/Intel RST with js/irst.pd.sn.["{#SLOT}"]))>0</p><p>**Recovery expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","Normal")=1</p>|high|
|Intel RST: Physical disk "{#SLOT}" was replaced by  sn "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: (last(/Intel RST with js/irst.pd.sn.["{#SLOT}"],#1)<>last(/Intel RST with js/irst.pd.sn.["{#SLOT}"],#2))=1 and length(last(/Intel RST with js/irst.pd.sn.["{#SLOT}"]))>2</p><p>**Recovery expression**: </p>|information|
|Intel RST: Logical disk "{#LDNAME}" is "{ITEM.VALUE1}". LD level: {ITEM.VALUE2} Disks count: {ITEM.VALUE3} (LLD)|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Degraded|Failed")=1 and last(/Intel RST with js/irst.raid.level.[{#LDNAME}])>0 and last(/Intel RST with js/irst.raid.pdcount.[{#LDNAME}])>0</p><p>**Recovery expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Normal")=1</p>|high|
|Intel RST: Logical disk "{#LDNAME}" is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Initializing")=1</p><p>**Recovery expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Normal")=1</p>|information|
|Intel RST: Logical disk "{#LDNAME}" is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#1,"regexp","Rebuilding|Verify and Fix")=1 and find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#3,"regexp","Degraded|Failed")=0</p><p>**Recovery expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],,"regexp","Normal")=1</p>|warning|
|Intel RST: Logical disk "{#LDNAME}" state was changed from "Degraded" state to  "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#1,"regexp","Rebuilding|Verify and Fix")=1 and find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#2,"regexp","Degraded")=1</p><p>**Recovery expression**: </p>|information|
|Intel RST: Logical disk "{#LDNAME}" state was changed from "Failed" state to  "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#1,"regexp","Rebuilding|Verify and Fix")=1 and find(/Intel RST with js/irst.raid.state.[{#LDNAME}],#2,"regexp","Failed")=1</p><p>**Recovery expression**: </p>|information|
|Intel RST: Physical disk "{#SLOT}" is "{ITEM.VALUE1}". Disk SN is "{ITEM.VALUE2}" (LLD)|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","need to set it")=1 and length(last(/Intel RST with js/irst.pd.sn.["{#SLOT}"]))>0</p><p>**Recovery expression**: </p>|information|
|Intel RST: Physical disk "{#SLOT}" is "{ITEM.VALUE1}". Disk SN is "{ITEM.VALUE2}" (LLD)|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","Verify|Rebuilding")=1 and length(last(/Intel RST with js/irst.pd.sn.["{#SLOT}"]))>0</p><p>**Recovery expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","Normal")=1</p>|warning|
|Intel RST: Physical disk "{#SLOT}" is "{ITEM.VALUE}". Disk SN is "{ITEM.VALUE2}" (LLD)|<p>-</p>|<p>**Expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","Missing|Failed|Smart event triggered")=1 and length(last(/Intel RST with js/irst.pd.sn.["{#SLOT}"]))>0</p><p>**Recovery expression**: find(/Intel RST with js/irst.pd.state.["{#SLOT}"],,"iregexp","Normal")=1</p>|high|
|Intel RST: Physical disk "{#SLOT}" was replaced by  sn "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: (last(/Intel RST with js/irst.pd.sn.["{#SLOT}"],#1)<>last(/Intel RST with js/irst.pd.sn.["{#SLOT}"],#2))=1 and length(last(/Intel RST with js/irst.pd.sn.["{#SLOT}"]))>2</p><p>**Recovery expression**: </p>|information|
