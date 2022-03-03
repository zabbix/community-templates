# net.dns.perf

## Description

DNS応答時間測定

## Overview

DNSの応答性能を測定します。


テンプレートを利用する場合zabbix\_agentd.confでリモートコマンドを有効にしてください。


EnableRemoteCommands=1  
UnsafeUserParameters=1


マクロ


{$DNS\_SERVER}＝利用するDNSサーバを指定します。  
{$DOMAIN\_NAME}＝対象ドメイン名を指定します。  




## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$DNS_SERVER}|<p>-</p>|`8.8.8.8`|Text macro|
|{$DOMAIN_NAME}|<p>-</p>|`yahoo.co.jp`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|net.dns.perf|<p>-</p>|`Zabbix agent (active)`|system.run[dig {$DNS_SERVER} {$DOMAIN_NAME} |grep Query |awk 'END{print$4}']<p>Update: 600</p>|


## Triggers

There are no triggers in this template.

