# Netbackup

## Overview

Pessoal, favor acrescentar em suas configurações o UserParamenter abaixo:


UserParameter=backup,/usr/openv/netbackup/bin/admincmd/bpdbjobs -summary | awk '{print $7}' | grep -n ^ | grep ^2


 


 


Personal, please add in your settings the above UserParameter:


UserParameter=backup,/usr/openv/netbackup/bin/admincmd/bpdbjobs -summary | awk '{print $7}' | grep -n ^ | grep ^2


 


 


Obs: Template para Master em Linux.


Note: Template for Master in Linux.



## Author

Felipe Aquino

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status Backup|<p>-</p>|`Zabbix agent`|backup<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

