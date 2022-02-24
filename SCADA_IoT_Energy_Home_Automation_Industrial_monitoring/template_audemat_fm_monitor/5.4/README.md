# Discovery Audemat

## Overview

Template for Audemat FM Monitor Silver, snmp no MIBS needed



## Author

I. Aliaga U.

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AudematFM|<p>-</p>|`SNMP agent`|Audemat.disco<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disponibilidad SNMP|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 60s</p>|
|Left Audio Level - {#NAME}|<p>-</p>|`SNMP agent`|AudioLeft[{#INDEX}]<p>Update: 30s</p><p>LLD</p>|
|Rigth Audio Level - {#NAME}|<p>-</p>|`SNMP agent`|AudioRigth[{#INDEX}]<p>Update: 30s</p><p>LLD</p>|
|MPX Level - {#NAME}|<p>-</p>|`SNMP agent`|mpx[{#INDEX}]<p>Update: 30s</p><p>LLD</p>|
|Frecuencia Radio {#INDEX}|<p>-</p>|`SNMP agent`|RadioF[{#INDEX}]<p>Update: 30s</p><p>LLD</p>|
|Nombre Radio {#INDEX}|<p>-</p>|`SNMP agent`|RadioN[{#INDEX}]<p>Update: 30s</p><p>LLD</p>|
|RF Level - {#NAME}|<p>-</p>|`SNMP agent`|RFLvl[{#INDEX}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#NAME} {HOST.NAME}: Modulacion (MPX) Baja|<p>-</p>|<p>**Expression**: last(/Discovery Audemat/mpx[{#INDEX}])<40</p><p>**Recovery expression**: </p>|average|
|{#NAME} {HOST.NAME}: Modulacion (MPX) Demasiado Baja|<p>-</p>|<p>**Expression**: last(/Discovery Audemat/mpx[{#INDEX}])<15 and last(/Discovery Audemat/mpx[{#INDEX}])<15 and last(/Discovery Audemat/mpx[{#INDEX}])<15 or last(/Discovery Audemat/mpx[{#INDEX}])<5</p><p>**Recovery expression**: </p>|high|
|{#NAME} {HOST.NAME}: Modulacion (MPX) Baja (LLD)|<p>-</p>|<p>**Expression**: last(/Discovery Audemat/mpx[{#INDEX}])<40</p><p>**Recovery expression**: </p>|average|
|{#NAME} {HOST.NAME}: Modulacion (MPX) Demasiado Baja (LLD)|<p>-</p>|<p>**Expression**: last(/Discovery Audemat/mpx[{#INDEX}])<15 and last(/Discovery Audemat/mpx[{#INDEX}])<15 and last(/Discovery Audemat/mpx[{#INDEX}])<15 or last(/Discovery Audemat/mpx[{#INDEX}])<5</p><p>**Recovery expression**: </p>|high|
