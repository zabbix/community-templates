# Number of Windows Updates available for installation

## Overview
The template monitors the number of available updates for installation.  
To get data about updates, the template calls a custom script `zbx.winupdate.vbs`. The script and a detailed 
description of the template connection are located in [this repository](https://github.com/onlycrab/Winupdates_vbs).

## Author
Roman Rynkovich

## Macros used
|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ZCONF}|<p>Absolute path to zabbix_agentd.conf</p>|``|Text macro|
|{$ZSENDER}|<p>Absolute path to zabbix_sender.exe</p>|``|Text macro|

## Template links
There are no template links in this template.

## Discovery rules
There are no discovery rules in this template.

## Items collected
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|WU - WinupdatesCheckLast|<p>Launch windows update check script</p>|`Zabbix agent`|system.run[c:\zabbix\plugins\zbx.winupdate.vbs "{$ZSENDER}" "{$ZCONF}",nowait]<p>Update: 4h</p>|
|WU - All|<p>All available Windows updates</p>|`Zabbix trapper`|zbx.winupdate.vbs.all|
|WU - Critical|<p>Critical Windows updates</p>|`Zabbix trapper`|zbx.winupdate.vbs.critical|
|WU - Definition|<p>Definition Windows updates</p>|`Zabbix trapper`|zbx.winupdate.vbs.definition|
|WU - Security|<p>Security Windows updates</p>|`Zabbix trapper`|zbx.winupdate.vbs.security|
|WU - ServicePacks|<p>ServicePacks Windows updates</p>|`Zabbix trapper`|zbx.winupdate.vbs.servicepacks|
|WU - UpdateRollUps|<p>UpdateRollUps Windows updates</p>|`Zabbix trapper`|zbx.winupdate.vbs.updaterollups|
|WU - WSUS availability|<p>WSUS server availability</p>|`Zabbix trapper`|zbx.winupdate.vbs.wsusavailability|
|WU reboot - Required now|<p>Is reboot required: 1 - true, 0 - false.</p>|`Zabbix trapper`|zbx.winupdate.vbs.rebootrequired|
|WUz - DateTime|<p>Return last check Date and Time</p>|`Zabbix trapper`|zbx.winupdate.vbs.datetime|
|WUz - Startup|<p>Windows Update service startup mode: 0 - automatic, 1 - automatic delayed, 2 - manual, 3 - disabled, 4 - unknown, 5 - automatic trigger start, 6 - automatic delayed trigger start, 7 - manual trigger start</p>|`Zabbix trapper`|zbx.winupdate.vbs.all|

## Triggers
|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Detected manual startup state of Windows Updates Service on {HOST.NAME}||<p>**Expression**: {windows_updates_vbscript:service.info[wuauserv,startup].last()}=2</p><p>**Recovery expression**: </p>|info|
|Windows Updates Service startup state is &quot;unknown&quot; on {HOST.NAME}||<p>**Expression**: {windows_updates_vbscript:service.info[wuauserv,startup].last()}=4</p><p>**Recovery expression**: </p>|warning|
|Windows Updates Service was been disabled on {HOST.NAME}||<p>**Expression**: {windows_updates_vbscript:service.info[wuauserv,startup].last()}=3</p><p>**Recovery expression**: </p>|warning|
|Unable to get full list of Windows updates for {HOST.NAME}|Perhaps WSUS server is unavailable|<p>**Expression**: {windows_updates_vbscript:zbx.winupdate.wsusavailability.last()}=0</p><p>**Recovery expression**: </p>|warning|
|There are many Windows updates for {HOST.NAME}||<p>**Expression**: {windows_updates_vbscript:zbx.winupdate.all.last()}>10</p><p>**Recovery expression**: </p>|average|
|There are many critical Windows updates for {HOST.NAME}||<p>**Expression**: {windows_updates_vbscript:zbx.winupdate.critical.last()}>5</p><p>**Recovery expression**: </p>|average|
|There are many security Windows updates for {HOST.NAME}||<p>**Expression**: {windows_updates_vbscript:zbx.winupdate.security.last()}>5</p><p>**Recovery expression**: </p>|average|
|Reboot required to finish installing Windows updates for {HOST.NAME}||<p>**Expression**: {windows_updates_vbscript:zbx.winupdate.rebootrequired.last()}<>0</p><p>**Recovery expression**: </p>|average|
