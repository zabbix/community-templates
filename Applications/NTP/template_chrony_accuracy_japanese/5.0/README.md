# chronyテンプレート

## Overview

chrony accuracy Template Englishの日本語版です  
英語版は[こちら](cat-app/ntp/chrony-accuracy-template-english)


English version of the template is in the [link](cat-app/ntp/chrony-accuracy-template-english) .


 


テンプレートを利用する場合zabbix\_agentd.confでリモートコマンドを有効にしてください。


EnableRemoteCommands=1  
UnsafeUserParameters=1


ZabbixAgentがインストールされた環境に対しては  
chrony テンプレートが使用できます。


 


 



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$NTP_OFFSET}|<p>-</p>|`50`|Text macro|
|{$NTP_OFFSET_LARGE}|<p>-</p>|`5000`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|NTPポーリング間隔|<p>NTPサーバとの同期間隔を示します。</p>|`Dependent item`|Updateinterval<p>Update: 0</p>|
|NTP時刻差(ms)|<p>NTP時刻とsystem時刻との差を示します。</p>|`Dependent item`|Systemtime_ms<p>Update: 0</p>|
|NTP同期サーバ|<p>-</p>|`Dependent item`|Reference<p>Update: 0</p>|
|NTP時刻差(方向)|<p>NTP時刻とsystem時刻との差の方向を示します。</p>|`Dependent item`|Systemtime<p>Update: 0</p>|
|ネットワーク合計遅延|<p>stratum-1 までのネットワーク合計遅延です。</p>|`Dependent item`|Rootdelay<p>Update: 0</p>|
|NTP階層|<p>監視対象サーバーのstratum階層</p>|`Dependent item`|Stratum<p>Update: 0</p>|
|chronyc tracking|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc tracking]<p>Update: 10m</p>|
|chronyc sources|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc sources]<p>Update: 10m</p>|
|NTPオフセット|<p>NTPサーバとの時刻ズレ</p>|`Dependent item`|Lastoffset<p>Update: 0</p>|
|同期状態|<p>同期状態 Normal 正常 Insert second 挿入 Delete second 削除 Not synchronized 同期していない</p>|`Dependent item`|LeapStatus<p>Update: 0</p>|
|chronyバージョン|<p>-</p>|`Zabbix agent (active)`|system.run[chronyc -v]<p>Update: 1h</p>|
|NTPオフセット(長期平均)|<p>NTPサーバとの時刻ズレ</p>|`Dependent item`|RMSoffset<p>Update: 0</p>|
|chronyReach|<p>過去8回の問合せ成功回数を8ビットで表現します。</p>|`Zabbix agent (active)`|system.run[chronyc sources|grep \* |awk '{print$5}']<p>Update: 10m</p>|


## Triggers

There are no triggers in this template.

