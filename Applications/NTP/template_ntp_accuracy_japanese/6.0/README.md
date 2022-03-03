# NTPテンプレート（リモート）

## Overview

NTP accuracy Template の日本語版です  
英語版は[こちら](cat-app/ntp-accuracy-template)English version of the template is in the [link](cat-app/ntp-accuracy-template) .


 


テンプレートを利用する場合zabbix\_agentd.confでリモートコマンドを有効にしてください。


EnableRemoteCommands=1  
UnsafeUserParameters=1


ZabbixAgentがインストールされた環境に対しては  
NTPテンプレートが使用できます。


NTPアプライアンスなどZabbixAgentが使用できない環境のNTPサーバに対しては  
NTPテンプレート（リモート）が使用できます。


NTPテンプレート（リモート）を利用する場合はホストマクロにおいて  
{$NTP\_IP}に監視対象のIPアドレスを指定してください。


ntpqによって表示されるすべての項目が監視できます。


NTP精度情報をグラフ化することが可能です。


 



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$NTP_IP}|<p>-</p>|`127.0.0.1`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|NTPポーリング間隔({$NTP_IP})|<p>NTPサーバとの同期間隔</p>|`Zabbix agent (active)`|system.run[ntpq -p {$NTP_IP}|grep \* |awk '{print$6}']<p>Update: 1800</p>|
|NTP階層({$NTP_IP})|<p>同期しているNTPサーバーのstratum</p>|`Zabbix agent (active)`|system.run[ntpq -p {$NTP_IP}|grep \* |awk '{print$3}']<p>Update: 1800</p>|
|NTP分散({$NTP_IP})|<p>NTPオフセットの過去8回の分散平均値</p>|`Zabbix agent (active)`|system.run[ntpq -p {$NTP_IP}|grep \* |awk '{print$10}']<p>Update: 1800</p>|
|NTPオフセット({$NTP_IP})|<p>NTPサーバとの時刻ズレ</p>|`Zabbix agent (active)`|system.run[ntpq -p {$NTP_IP}|grep \* |awk '{print$9}']<p>Update: 1800</p>|
|NTP同期サーバ({$NTP_IP})|<p>同期しているNTPサーバー名</p>|`Zabbix agent (active)`|system.run[ntpq -p {$NTP_IP}|grep \* |awk '{print$1}'|sed s/*//]<p>Update: 1800</p>|
|ntpq({$NTP_IP})|<p>"*" 参照同期中のサーバーを表している "+" クロック誤り検査に合格したサーバー "#" 参照同期中ではあるが、距離が遠いサーバー " " 左に何も表示されない場合（空欄）、サーバーを参照していない "x" クロック誤り検査に不合格となったサーバー ". " 参照リストから除外されたサーバー refid NTPサーバーが参照している上位ホスト名 or IPアドレス st NTPサーバーの階層 t 階層のタイプ　l:local、u:unicast、m:multicast、b:broadcast when 最後のパケットを受け取ってからの時間（秒） poll 問い合わせを行う間隔（秒） reach 到達可能性に関するレジスタ・データ（8進数） delay 推定遅延（ミリ秒） offset 偏差補償（ミリ秒） jitter RMS Jitterの平均値（ミリ秒）</p>|`Zabbix agent (active)`|system.run[ntpq -p {$NTP_IP}]<p>Update: 3600</p>|
|NTP推定遅延({$NTP_IP})|<p>NTPパケットの推定遅延時間</p>|`Zabbix agent (active)`|system.run[ntpq -p {$NTP_IP}|grep \* |awk '{print$8}']<p>Update: 1800</p>|
|NTP上位サーバ({$NTP_IP})|<p>同期しているNTPサーバーの上位NTPサーバ</p>|`Zabbix agent (active)`|system.run[ntpq -p {$NTP_IP}|grep \* |awk '{print$2}']<p>Update: 1800</p>|


## Triggers

There are no triggers in this template.

# NTPテンプレート

## Overview

NTP accuracy Template の日本語版です  
英語版は[こちら](cat-app/ntp-accuracy-template)English version of the template is in the [link](cat-app/ntp-accuracy-template) .


 


テンプレートを利用する場合zabbix\_agentd.confでリモートコマンドを有効にしてください。


EnableRemoteCommands=1  
UnsafeUserParameters=1


ZabbixAgentがインストールされた環境に対しては  
NTPテンプレートが使用できます。


NTPアプライアンスなどZabbixAgentが使用できない環境のNTPサーバに対しては  
NTPテンプレート（リモート）が使用できます。


NTPテンプレート（リモート）を利用する場合はホストマクロにおいて  
{$NTP\_IP}に監視対象のIPアドレスを指定してください。


ntpqによって表示されるすべての項目が監視できます。


NTP精度情報をグラフ化することが可能です。


 



## Overview

NTP accuracy Template の日本語版です  
英語版は[こちら](cat-app/ntp-accuracy-template)English version of the template is in the [link](cat-app/ntp-accuracy-template) .


 


テンプレートを利用する場合zabbix\_agentd.confでリモートコマンドを有効にしてください。


EnableRemoteCommands=1  
UnsafeUserParameters=1


ZabbixAgentがインストールされた環境に対しては  
NTPテンプレートが使用できます。


NTPアプライアンスなどZabbixAgentが使用できない環境のNTPサーバに対しては  
NTPテンプレート（リモート）が使用できます。


NTPテンプレート（リモート）を利用する場合はホストマクロにおいて  
{$NTP\_IP}に監視対象のIPアドレスを指定してください。


ntpqによって表示されるすべての項目が監視できます。


NTP精度情報をグラフ化することが可能です。


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ntpq|<p>"*" 参照同期中のサーバーを表している "+" クロック誤り検査に合格したサーバー "#" 参照同期中ではあるが、距離が遠いサーバー " " 左に何も表示されない場合（空欄）、サーバーを参照していない "x" クロック誤り検査に不合格となったサーバー ". " 参照リストから除外されたサーバー refid NTPサーバーが参照している上位ホスト名 or IPアドレス st NTPサーバーの階層 t 階層のタイプ　l:local、u:unicast、m:multicast、b:broadcast when 最後のパケットを受け取ってからの時間（秒） poll 問い合わせを行う間隔（秒） reach 到達可能性に関するレジスタ・データ（8進数） delay 推定遅延（ミリ秒） offset 偏差補償（ミリ秒） jitter RMS Jitterの平均値（ミリ秒）</p>|`Zabbix agent (active)`|system.run[ntpq -p]<p>Update: 3600</p>|
|NTPポーリング間隔|<p>NTPサーバとの同期間隔</p>|`Zabbix agent (active)`|system.run[ntpq -p|grep \* |awk '{print$6}']<p>Update: 1800</p>|
|NTP推定遅延|<p>NTPパケットの推定遅延時間</p>|`Zabbix agent (active)`|system.run[ntpq -p|grep \* |awk '{print$8}']<p>Update: 1800</p>|
|NTPオフセット|<p>NTPサーバとの時刻ズレ</p>|`Zabbix agent (active)`|system.run[ntpq -p|grep \* |awk '{print$9}']<p>Update: 1800</p>|
|NTP上位サーバ|<p>同期しているNTPサーバーの上位NTPサーバ</p>|`Zabbix agent (active)`|system.run[ntpq -p|grep \* |awk '{print$2}']<p>Update: 1800</p>|
|NTP階層|<p>同期しているNTPサーバーのstratum</p>|`Zabbix agent (active)`|system.run[ntpq -p|grep \* |awk '{print$3}']<p>Update: 1800</p>|
|NTP分散|<p>NTPオフセットの過去8回の分散平均値</p>|`Zabbix agent (active)`|system.run[ntpq -p|grep \* |awk '{print$10}']<p>Update: 1800</p>|
|NTPDバージョン|<p>-</p>|`Zabbix agent (active)`|system.run[ntpq -c version]<p>Update: 3600</p>|
|NTPプロセス|<p>-</p>|`Zabbix agent`|proc.num[ntpd]<p>Update: 60</p>|
|NTP同期サーバ|<p>同期しているNTPサーバー名</p>|`Zabbix agent (active)`|system.run[ntpq -p|grep \* |awk '{print$1}'|sed s/*//]<p>Update: 1800</p>|


## Triggers

There are no triggers in this template.

