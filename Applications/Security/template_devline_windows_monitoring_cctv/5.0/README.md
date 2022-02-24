# DEVLINE

## Overview

UserParameter=devline.discovery,"C:\Windows\zabbix\addons\devline-discovery.exe" user password 127.0.0.1


UserParameter=devline.viewpic[*],"C:\Windows\zabbix\addons\devline-check-picture.exe" user password 127.0.0.1 $1


 


$1 = image-uri


 


Требуется .NetFramework 3.5 на хосте с сервером наблюдения.


 


UPD 2019-13-02: Исправил шаблон. Обнаружил проблему, когда одна из плат видеозахвата перестает работать, то утилита посылает текст вместо числа.


 

- <a class="vote-up count-0" style="box-sizing: border-box; margin: 0px 0px 0px -3px; padding: 0px 3px 0px 0px; border: 0px; line-height: 0.85; font-family: inherit; color: #656c7a; transition: color 0.1s linear 0s; display: inline-block; position: relative; height: 11px; min-height: 14px; overflow: hidden;" title="Vote up" href="https://disqus.com/embed/comments/?base=default&f=templateszabbix&t\_u=https%3A%2F%2Fshare.zabbix.com%2Fcat-app%2Fsecurity%2Fdevline-windows&t\_d=Zabbix%20Share%20-%20DEVLINE.%20Windows.%20%D0%9C%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%20%D0%BD%D0%B0%D0%BB%D0%B8%D1%87%D0%B8%D1%8F%20%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B9%20%D1%81%20%D0%BA%D0%B0%D0%BC%D0%B5%D1%80%20%D0%BD%D0%B0%D0%B1%D0%BB%D1%8E%D0%B4%D0%B5%D0%BD%D0%B8%D0%B9&t\_t=Zabbix%20Share%20-%20DEVLINE.%20Windows.%20%D0%9C%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%20%D0%BD%D0%B0%D0%BB%D0%B8%D1%87%D0%B8%D1%8F%20%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B9%20%D1%81%20%D0%BA%D0%B0%D0%BC%D0%B5%D1%80%20%D0%BD%D0%B0%D0%B1%D0%BB%D1%8E%D0%B4%D0%B5%D0%BD%D0%B8%D0%B9&s\_o=default" name="Vote up"


## Author

ssharypov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CamList|<p>-</p>|`Zabbix agent`|devline.discovery<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DEVLINE KERNEL|<p>-</p>|`Zabbix agent`|service.info[SDevKernel,state]<p>Update: 3m</p>|
|{#NAME}|<p>-</p>|`Zabbix agent`|devline.viewpic[{#IMAGE_URI}]<p>Update: 10m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME}: no image from [{#NAME}]|<p>-</p>|<p>**Expression**: {DEVLINE:devline.viewpic[{#IMAGE_URI}].last(#3)}<>1</p><p>**Recovery expression**: {DEVLINE:devline.viewpic[{#IMAGE_URI}].last()}=1</p>|average|
|{HOST.NAME}: no image from [{#NAME}] (LLD)|<p>-</p>|<p>**Expression**: {DEVLINE:devline.viewpic[{#IMAGE_URI}].last(#3)}<>1</p><p>**Recovery expression**: {DEVLINE:devline.viewpic[{#IMAGE_URI}].last()}=1</p>|average|
