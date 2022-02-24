# 16 GammuSMS

## Overview

Monitoring gammu daemon statistics.


ODBC connected queries into gammu database.



## Author

Pavel Mlčoch

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|smsd_outbox|<p>-</p>|`Database monitor`|db.odbc.select[smsd_outbox,smsd]<p>Update: 1m</p>|
|smsd_sentitems|<p>-</p>|`Database monitor`|db.odbc.select[smsd_sentitems,smsd]<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

