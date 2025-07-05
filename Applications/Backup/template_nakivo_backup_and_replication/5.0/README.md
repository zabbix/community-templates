# Nakivo

## Overview

External Zabbix Script with discovery rule for nakivo backups



## Author

Michael Weber

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Nakivo Jobs|<p>-</p>|`External check`|nakivo.pl[{HOST.CONN},"--job-list"]<p>Update: 60m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Job[{#NAME}] State|<p>-</p>|`External check`|nakivo.pl[{HOST.CONN},"--job-info", "{#ID}","2"]<p>Update: 5m</p><p>LLD</p>|
|Job[{#NAME}] Last Result|<p>-</p>|`External check`|nakivo.pl[{HOST.CONN},"--job-info", "{#ID}","3"]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Job[{#NAME}] failed|<p>-</p>|<p>**Expression**: {Nakivo:nakivo.pl[*UNKNOWN*,"--job-info", "{#ID}","3"].iregexp(^successful$)}=0</p><p>**Recovery expression**: </p>|warning|
|Job[{#NAME}] failed (LLD)|<p>-</p>|<p>**Expression**: {Nakivo:nakivo.pl[*UNKNOWN*,"--job-info", "{#ID}","3"].iregexp(^successful$)}=0</p><p>**Recovery expression**: </p>|warning|
