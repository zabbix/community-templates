# APC Windows agent monitor

## Description

Universal template for APC Agent for windows

## Overview

universal template for windows APC Agent (APCPBEAgent) PC PowerChute Business Edition Agent


from eventid logs


**In Russian with comments in English**




---


 


Alerts:


about switching to battery with event closing


when switching to a network


on compensation for increasing voltage in the network with the closing of the event


on compensation for undervoltage in the network with the closing of the event


about disconnecting USB from the UPS with closing the event


about unstable connection with the UPS with the closing of the event


"Battery life threshold exceeded"


 "Battery low"




---


 


Оповещения : 


о переключении на батарею с закрытием события при переключении на сеть 


о компенсации при повышении напряжения в сети с закрытием события 


о компенсации при понижении напряжения в сети с закрытием события 


об отключении USB от ИБП с закрытием события 


о нестабильном соединение c ИБП с закрытием события "Превышен порог времени работы от батареи" 


"Батарея разряжена"



## Author

Whyborn

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Потеряна связь с ИБП|<p>Lost Communication With UPS</p>|`Zabbix agent (active)`|eventlog[Application,,,APCPBEAgent,3000,,skip]<p>Update: 5m</p>|
|Превышен порог времени работы от батареи|<p>Time On Battery Threshold Exceeded</p>|`Zabbix agent (active)`|eventlog[Application,,,APCPBEAgent,2060,,skip]<p>Update: 1m</p>|
|Требуется замена батареи|<p>Battery Needs Replacing</p>|`Zabbix agent (active)`|eventlog[Application,,,APCPBEAgent,3016,,skip]<p>Update: 5m</p>|
|ИБП на батарее|<p>UPS On Battery</p>|`Zabbix agent (active)`|eventlog[Application,,,APCPBEAgent,2000,,skip]<p>Update: 30s</p>|
|Связь с ИБП не установлена|<p>Communication Not Established</p>|`Zabbix agent (active)`|eventlog[Application,,,APCPBEAgent,3005,,skip]<p>Update: 5m</p>|
|Падение напряжения в электросети|<p>AVR Boost Active</p>|`Zabbix agent (active)`|eventlog[Application,,,APCPBEAgent,0,,skip]<p>Update: 5m</p>|
|Батарея разряжена (ЖОПА!)|<p>Батарея разряжена Low Battery Condition</p>|`Zabbix agent (active)`|eventlog[Application,,,APCPBEAgent,2003,,skip]<p>Update: 30s</p>|
|Повышение напряжения в электросети|<p>AVR Trim Active</p>|`Zabbix agent (active)`|eventlog[Application,,,APCPBEAgent,2007,,skip]<p>Update: 5m</p>|


## Triggers

There are no triggers in this template.

