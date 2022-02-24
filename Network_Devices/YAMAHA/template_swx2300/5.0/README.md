# Temp_SWX2300

## Overview

日本製のヤマハ インテリジェントL2スイッチングハブ SWX2300シリーズのテンプレートを置いておきます。


CPU・メモリーの使用率、システムの再起動の回数、ファームウェアのVerが取得できるようした上で


LLDで各ポートの状況が判る様にしました。


 ＜アップデート ＞


Ver2.2の場合でもインポートが出来る様になりましたので新しい物と差し替えます。


検証のお手伝いをしていただいた、とっとこ氏 [@**tottoko83746844**](https://twitter.com/tottoko83746844) に感謝します。


 


 



## Author

Toshihiro_SKK

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template SNMP Generic|
|Template SNMP Interfaces|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs. {$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|ifDescr<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|メモリ使用率|<p>-</p>|`SNMP agent`|yshMemoryUtil<p>Update: 180</p>|
|CPU使用率(5分間平均)|<p>-</p>|`SNMP agent`|yshCpuUtil5min<p>Update: 300</p>|
|起動コンフィグ|<p>-</p>|`SNMP agent`|ysfConfigFile<p>Update: 3600</p>|
|CPU使用率(5秒間平均)|<p>-</p>|`SNMP agent`|yshCpuUtil5sec<p>Update: 60</p>|
|Error Disable状態のトラップ通知設定|<p>-</p>|`SNMP agent`|ysedEnableTrap<p>Update: 600</p>|
|L2MSのトラップ通知設定|<p>-</p>|`SNMP agent`|ysl2msEnableTrap<p>Update: 600</p>|
|メモリサイズ|<p>-</p>|`SNMP agent`|yshMemorySize<p>Update: 7200</p>|
|FlashROMサイズ|<p>-</p>|`SNMP agent`|yshFlashROMSize<p>Update: 7200</p>|
|CPU使用率(1分間平均)|<p>-</p>|`SNMP agent`|yshCpuUtil1min<p>Update: 60</p>|
|システム再起動|<p>-</p>|`SNMP agent`|ysfRestart<p>Update: 600</p>|
|ファームウェアのバージョン|<p>-</p>|`SNMP agent`|ysfRevision<p>Update: 3600</p>|
|起動からの経過時間|<p>-</p>|`SNMP agent`|ysfUpTime<p>Update: 300</p>|
|Admin status of interface $1|<p>The desired state of the interface.</p>|`SNMP agent`|ifAdminStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Alias of interface $1|<p>-</p>|`SNMP agent`|ifAlias[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Description of interface $1|<p>A textual string containing information about the interface. This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.</p>|`SNMP agent`|ifDescr[{#SNMPVALUE}]<p>Update: 3600</p><p>LLD</p>|
|Inbound errors on interface $1|<p>For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.</p>|`SNMP agent`|ifInErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Incoming traffic on interface $1|<p>The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifInOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Operational status of interface $1|<p>The current operational state of the interface.</p>|`SNMP agent`|ifOperStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outbound errors on interface $1|<p>For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.</p>|`SNMP agent`|ifOutErrors[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Outgoing traffic on interface $1|<p>The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.</p>|`SNMP agent`|ifOutOctets[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}|<p>-</p>|<p>**Expression**: {Temp_SWX2300:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
|Operational status was changed on {HOST.NAME} interface {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Temp_SWX2300:ifOperStatus[{#SNMPVALUE}].diff(0)}=1</p><p>**Recovery expression**: </p>|information|
