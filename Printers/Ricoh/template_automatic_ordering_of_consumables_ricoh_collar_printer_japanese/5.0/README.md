# Ricoh color printer

## Overview

Ricoh社のジェルジェットカラープリンター用のインク残量監視テンプレートです。


5%以下になると警告のトリガーが発動し


インク残量が0%になった後でカートリッジを交換して残量が＋方向に増えた時に「軽度の障害」のトリガーが発動します。


こちらのトリガーとZabbixのアクションでメール配信をおこなえば


消耗品のカートリッジの自動手配が出来ます。


 Zabbix2.2以降 GXeシリーズ以降から対応と言う事します、未確認ですがZabbix2.0でも動くと思います。


又GXシリーズでもスリープモードでSNMPが途切れなければ動きます（私には無理でした。）


 


**Update:**


SGシリーズから**廃インクボックスの空き容量**の情報も取得できました、100%（空）から値が減っていき0%（満杯）になるようです。


廃インクボックスに関してはアイテムの設定はしていますがトリガーは登録していません。


その点はご注意ください。



## Author

Toshihiro_SKK

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Save color|<p>-</p>|`SNMP agent`|saveprint<p>Update: 600;3600/1-6,19:00-24:00;3600/1-6,00:00-08:00;3600/7,00:00-24:00</p>|
|all print|<p>-</p>|`SNMP agent`|allprint<p>Update: 600;3600/1-6,19:00-24:00;3600/1-6,00:00-08:00;3600/7,00:00-24:00</p>|
|青インクの現在容量|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevelcyan<p>Update: 180;3600/7,00:00-24:00</p>|
|Full color|<p>-</p>|`SNMP agent`|fullcolor<p>Update: 600;3600/1-6,19:00-24:00;3600/1-6,00:00-08:00;3600/7,00:00-24:00</p>|
|黄インクの現在容量|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevelyellow<p>Update: 180;3600/7,00:00-24:00</p>|
|廃インクボックス 空き容量|<p>インク洗浄時の廃インクを捨てる場所。 これが満杯になるとプリンターが印刷出来なくなるので、確実な交換をして下さい。</p>|`SNMP agent`|prtMarkerSuppliesLeveldustBOX<p>Update: 1800;3600/1-5,00:00-08:00;3600/6-7,00:00-24:00;3600/1-5,19:00-24:00</p>|
|mono color|<p>-</p>|`SNMP agent`|monoprint<p>Update: 600;3600/1-6,19:00-24:00;3600/1-6,00:00-08:00;3600/7,00:00-24:00</p>|
|赤インクの現在容量|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevelmagen<p>Update: 180;3600/7,00:00-24:00</p>|
|黒インクの現在容量|<p>-</p>|`SNMP agent`|prtMarkerSuppliesLevelblack<p>Update: 180;3600/7,00:00-24:00</p>|


## Triggers

There are no triggers in this template.

