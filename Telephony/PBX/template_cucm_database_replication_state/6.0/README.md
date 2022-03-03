# Cisco AXL DataBase Replication status

## Overview

CUCM replication status request from AXL


 


Необходим Application User с правами на чтение AXL API


Application user name: {$ZABBIX\_APIUSER\_UC}


Applicatuin user passwd: {$ZABBIX\_APIUSER\_UC}



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|API PerfmonRequet State of Replication|<p>-</p>|`HTTP agent`|ucdbreplication<p>Update: 30s</p>|
|DB Replication State|<p>-</p>|`Dependent item`|dbrepstate<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

