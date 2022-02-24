# Asterisk

## Description

Asterisk IP PBX template

## Overview


```
Zabbix template for Asterisk IP PBX  
  
  
Finds out the total number of concurrent channels on trunks. Each thunk's name should start with "tru\_"

Installation:

- Put userparameter\_asterisk.conf in /etc/zabbix/zabbix\_agentd.d/ , restart zabbix agent

- Put asterisk\_trunks and asterisk\_calls scripts in /etc/zabbix/externalscripts/ and add execute privileges

- Set up cronjob for asterisk\_trunks script like this:
# crontab -l
  
SHELL=/bin/bash  
# update Asterisk trunks info for zabbix
2 * * * * /etc/zabbix/externalscripts/asterisk\_trunks

- (Optional) If there're no enough permissions for /var/run/asterisk/asterisk.ctl then add following line in /etc/asterisk/asterisk.conf:
astctlpermissions = 775
, and restart Asterisk. Add zabbix user to group asterisk.

- Import Asterisk.xml template in Zabbix. Adjust values if necessary.
```


## Author

Oleg

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Asterisk trunks|<p>Finds out number of channels sorted by trunks. Each thunk's name should start with "tru_"</p>|`Zabbix agent`|asterisk.calls.discovery<p>Update: 6;6/1-7,07:55-21:05;30/1-7,00:00-07:54;30/1-7,21:06-23:59</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Calls in {#TRUNK}|<p>-</p>|`Calculated`|asterisk.calls[{#TRUNK}]<p>Update: 6</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Number of calls in {#TRUNK} is {#CALLS}|<p>-</p>|<p>**Expression**: {Asterisk:asterisk.calls[{#TRUNK}].last()}>40</p><p>**Recovery expression**: </p>|average|
|Number of calls in {#TRUNK} is {#CALLS} (LLD)|<p>-</p>|<p>**Expression**: {Asterisk:asterisk.calls[{#TRUNK}].last()}>40</p><p>**Recovery expression**: </p>|average|
