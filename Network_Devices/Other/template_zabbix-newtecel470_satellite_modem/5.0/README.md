# Newtec

## Description

Template for satellite modem

## Overview

Zabbix-NewtexEL470-SatelitteModem
=================================


Zabbix SNMP template for monitoring Newtec EL470 Satellite Modem for Zabbix 4.x Has been created in Zabbix 4.0, but exported from Zabbix 4.2


Needs to set up macroses:


{$HISTORY}


{$TRENDS}


{$UPDATEINT}



## Author

AlKosmos

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ethRxCongested|<p>Extra performance stuff for Newtec satellite modems</p>|`SNMP agent`|ethRxCongested<p>Update: {$UPDATEINT}</p>|
|ntcDevsMod01SyIntTemp|<p>-</p>|`SNMP agent`|ntcDevsMod01SyIntTemp<p>Update: {$UPDATEINT}</p>|
|ntcDevsMod01DmEstLinMar|<p>-</p>|`SNMP agent`|ntcDevsMod01DmEstLinMar<p>Update: {$UPDATEINT}</p>|
|estInputBitrate|<p>Extra performance stuff for Newtec satellite modems</p>|`SNMP agent`|estInputBitrate<p>Update: {$UPDATEINT}</p>|
|SNMP traps (fallback)|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|ethTxErrors|<p>Extra performance stuff for Newtec satellite modems</p>|`SNMP agent`|ethTxErrors<p>Update: {$UPDATEINT}</p>|


## Triggers

There are no triggers in this template.

