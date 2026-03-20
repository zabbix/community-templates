# Module Linux systemd by Zabbix agent 2

## Overview

This is template for native monitoring systemd services via Zabbix Agent 2. Zabbix agent 2 is a new generation of Zabbix agent and may be used in place of Zabbix agent. Template is for Zabbix 4.4+


New version for zabbix 5.0.6 and 5.2.2 has ben uploaded + fixed regular expression in preprocessing. 



## Author

Tomas Hermanek

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Systemd services discovery|<p>-</p>|`Zabbix agent`|systemd.unit.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|State of service: {#UNIT.NAME}|<p>Description: {#UNIT.DESCRIPTION} Path: {#UNIT.PATH}</p>|`Zabbix agent`|systemd.unit.info["{#UNIT.NAME}"]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Service {#UNIT.NAME} is not running!|<p>Description: {#UNIT.DESCRIPTION} Path: {#UNIT.PATH}</p>|<p>**Expression**: {Module Linux systemd by Zabbix agent 2:systemd.unit.info["{#UNIT.NAME}"].last()}<>1</p><p>**Recovery expression**: </p>|warning|
|Service {#UNIT.NAME} is not running! (LLD)|<p>Description: {#UNIT.DESCRIPTION} Path: {#UNIT.PATH}</p>|<p>**Expression**: {Module Linux systemd by Zabbix agent 2:systemd.unit.info["{#UNIT.NAME}"].last()}<>1</p><p>**Recovery expression**: </p>|warning|
