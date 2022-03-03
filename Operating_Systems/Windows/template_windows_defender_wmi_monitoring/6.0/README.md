# Windows Defender WMI

## Overview

Template utilizes **MSFT\_MpComputerStatus** class in Windows WMI to collect information about Windows Defender, such as:


* Antivirus Enabled/Disabled
* RealTimeProtection Enabled/Disabled
* BehaviorMonitor Enabled/Disabled
* OnAccessProtection Enabled/Disabled
* IoavProtection Enabled/Disabled
* Antispyware Enabled/Disabled
* RealTimeProtection Enabled/Disabled
* NIS Enabled/Disabled
* Age of last Full/Quick scans
* Last Date of scans
* Computer State
* Age of Signatures


All WMI information is gathered from official Microsoft documentation.


Keep in mind, that his might not work with Older Windows versions.


I checked the Min. Zabbix version 3.4, because some items have Regular expression pre-processing. However that could be removed, and template adapted to older Zabbix versions.



## Author

Zabbix CookBook

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|NIIS Signature age in days|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select NISSignatureAge from MSFT_MpComputerStatus"]<p>Update: 3h</p>|
|Anti Virus Enabled|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select AntivirusEnabled from MSFT_MpComputerStatus"]<p>Update: 1h</p>|
|AntiVirus Signature Age|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select AntivirusSignatureAge from MSFT_MpComputerStatus"]<p>Update: 3h</p>|
|Ioav Protection Enabled|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select IoavProtectionEnabled from MSFT_MpComputerStatus"]<p>Update: 1h</p>|
|AntiVirus Signature Last updated|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select AntivirusSignatureLastUpdated from MSFT_MpComputerStatus"]<p>Update: 3h</p>|
|Anti Spyware Protection Enabled|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select AntispywareEnabled from MSFT_MpComputerStatus"]<p>Update: 1h</p>|
|Current computer state|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select ComputerState  from MSFT_MpComputerStatus"]<p>Update: 10m</p>|
|Behavior Monitor Enabled|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select BehaviorMonitorEnabled from MSFT_MpComputerStatus"]<p>Update: 1h</p>|
|Quick Scan Age|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select QuickScanAge  from MSFT_MpComputerStatus"]<p>Update: 3h</p>|
|AntiSpyware Signature Last updated|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select AntispywareSignatureLastUpdated from MSFT_MpComputerStatus"]<p>Update: 3h</p>|
|OnAccess Protection Enabled|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select OnAccessProtectionEnabled from MSFT_MpComputerStatus"]<p>Update: 1h</p>|
|NIS Protection Enabled|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select NISEnabled from MSFT_MpComputerStatus"]<p>Update: 1h</p>|
|AntiSpyware Signature age in days|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select AntispywareSignatureAge from MSFT_MpComputerStatus"]<p>Update: 3h</p>|
|Full Scan Age|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select FullScanAge from MSFT_MpComputerStatus"]<p>Update: 3h</p>|
|Real Time Protection Enabled|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select RealTimeProtectionEnabled from MSFT_MpComputerStatus"]<p>Update: 1h</p>|
|NIS Signature Last updated|<p>-</p>|`Zabbix agent`|wmi.get["root\microsoft\windows\defender","select NISSignatureLastUpdated from MSFT_MpComputerStatus"]<p>Update: 3h</p>|


## Triggers

There are no triggers in this template.

