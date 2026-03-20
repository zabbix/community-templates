# ASUS-ルーター（RT-AC87U）

## Description

ASUSルーター

## Overview

SSHエージェントによりASUS-RT-AC87UのCPU使用率を取得するテンプレートです。


依存アイテムを利用する事により少ない負荷でCPU使用率を可視化します。


![](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/102020/e9df31db-0a99-79b5-3540-683dd017bc66.png)


![](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/102020/7088100c-ea7d-774c-0e59-f4d6a7713971.png)



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SSH_PASS}|<p>-</p>|`****`|Secret macro|
|{$SSH_USER}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU(idle)|<p>-</p>|`Dependent item`|cpu.idle<p>Update: 0</p>|
|CPU(nic)|<p>-</p>|`Dependent item`|cpu.nic<p>Update: 0</p>|
|CPU(sirq)|<p>-</p>|`Dependent item`|cpu.sirq<p>Update: 0</p>|
|CPU(irq)|<p>-</p>|`Dependent item`|cpu.irq<p>Update: 0</p>|
|top|<p>-</p>|`SSH agent`|ssh.run[top]<p>Update: 10s</p>|
|google ping|<p>-</p>|`SSH agent`|ssh.run[ping_to_google]<p>Update: 10s</p>|
|CPU(io)|<p>-</p>|`Dependent item`|cpu.io<p>Update: 0</p>|
|CPU(sys)|<p>-</p>|`Dependent item`|cpu.sys<p>Update: 0</p>|
|CPU(usr)|<p>-</p>|`Dependent item`|cpu.usr<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

