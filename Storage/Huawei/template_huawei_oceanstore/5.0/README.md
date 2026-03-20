# Huawei OceanStor Rest-API v2

## Overview

Python script for monitoring huawei storages


Tested on 5500 V5, 5600 V5, 2600 V3, 5500 V3, dorado 5000 V3, 18800 V3 and dorado 5000 V6



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$API_PASSWORD}|<p>-</p>|``|Text macro|
|{$API_PORT}|<p>-</p>|`8088`|Text macro|
|{$API_USER}|<p>-</p>|``|Text macro|
|{$SUBSCRIBED_PERCENT}|<p>-</p>|`91`|Text macro|
|{$USED_PERCENT}|<p>-</p>|`91`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Enclosure|<p>-</p>|`Zabbix trapper`|enclosure<p>Update: 0</p>|
|PortSAS|<p>-</p>|`Zabbix trapper`|sas_port<p>Update: 0</p>|
|DiskDomain|<p>-</p>|`Zabbix trapper`|diskpool<p>Update: 0</p>|
|Lun|<p>-</p>|`Zabbix trapper`|lun<p>Update: 0</p>|
|InterfaceModule|<p>-</p>|`Zabbix trapper`|intf_module<p>Update: 0</p>|
|PSU|<p>-</p>|`Zabbix trapper`|power<p>Update: 0</p>|
|Pool|<p>-</p>|`Zabbix trapper`|storagepool<p>Update: 0</p>|
|PortEth|<p>-</p>|`Zabbix trapper`|eth_port<p>Update: 0</p>|
|BBU|<p>-</p>|`Zabbix trapper`|backup_power<p>Update: 0</p>|
|ExpBoard|<p>-</p>|`Zabbix trapper`|expboard<p>Update: 0</p>|
|Controller|<p>-</p>|`Zabbix trapper`|controller<p>Update: 0</p>|
|PortFibreChannel|<p>-</p>|`Zabbix trapper`|fc_port<p>Update: 0</p>|
|Disk|<p>-</p>|`Zabbix trapper`|disk<p>Update: 0</p>|
|FAN|<p>-</p>|`Zabbix trapper`|fan<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|get health state|<p>-</p>|`External check`|huawei_get_state.py["--api_ip={HOST.IP}","--api_port={$API_PORT}","--api_user={$API_USER}","--api_password={$API_PASSWORD}","--storage_name={HOST.NAME}","--status"]<p>Update: 1m</p>|
|get discovery|<p>-</p>|`External check`|huawei_get_state.py["--api_ip={HOST.IP}","--api_port={$API_PORT}","--api_user={$API_USER}","--api_password={$API_PASSWORD}","--storage_name={HOST.NAME}","--discovery"]<p>Update: 1h</p>|
|Health status of an enclosure "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.enclosure.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of an enclosure "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.enclosure.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Health status of a SAS port "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.sas_port.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of a SAS port "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.sas_port.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Health status of a DiskDomain "{#NAME}"|<p>-</p>|`Zabbix trapper`|health.diskpool.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Running status of a DiskDomain "{#NAME}"|<p>-</p>|`Zabbix trapper`|running.diskpool.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of the LUN "{#NAME}"|<p>-</p>|`Zabbix trapper`|health.lun.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Running status of the LUN "{#NAME}"|<p>-</p>|`Zabbix trapper`|running.lun.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of an interface module "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.intf_module.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of an interface module "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.intf_module.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Health Status of a PSU "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.power.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running Status of a PSU "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.power.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Free capacity of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|free.capacity.storagepool.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|health.storagepool.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Running status of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|running.storagepool.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Subscribed capacity of a Pool "{#NAME}" in percent|<p>-</p>|`Calculated`|subscribed.capacity.percent.storagepool.[{#NAME}]<p>Update: 3m</p><p>LLD</p>|
|Subscribed capacity of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|subscribed.capacity.storagepool.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Total capacity of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|total.capacity.storagepool.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Used capacity of a Pool "{#NAME}" in percent|<p>-</p>|`Calculated`|used.capacity.percent.storagepool.[{#NAME}]<p>Update: 3m</p><p>LLD</p>|
|Used capacity of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|used.capacity.storagepool.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of an Ethernet port "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.eth_port.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of an Ethernet port "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.eth_port.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Health status of a BBU "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.backup_power.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of a BBU "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.backup_power.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Health status of an expansion module "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.expboard.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of an expansion module "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.expboard.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Health status of a Controller "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.controller.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of a Controller "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.controller.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Health status of a Fibre Channel port "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.fc_port.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of a Fibre Channel port "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.fc_port.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Health status of disk "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.disk.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of disk "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.disk.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Health Status of a FAN "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|health.fan.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|
|Running status of a FAN "{#LOCATION}"|<p>-</p>|`Zabbix trapper`|running.fan.[{#LOCATION}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BBU "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.backup_power.[{#LOCATION}].min(43200)}=12 or {Huawei OceanStor Rest-API v2:health.backup_power.[{#LOCATION}].last()}=2 or {Huawei OceanStor Rest-API v2:health.backup_power.[{#LOCATION}].last()}=3 or {Huawei OceanStor Rest-API v2:health.backup_power.[{#LOCATION}].last()}=0</p><p>**Recovery expression**: </p>|high|
|BBU "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.backup_power.[{#LOCATION}].last()}=28 or {Huawei OceanStor Rest-API v2:running.backup_power.[{#LOCATION}].last()}=0</p><p>**Recovery expression**: </p>|high|
|Controller "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.controller.[{#LOCATION}].last(0)}<>1</p><p>**Recovery expression**: </p>|high|
|Controller "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.controller.[{#LOCATION}].last(0)}<>27</p><p>**Recovery expression**: </p>|high|
|Hard disk "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.disk.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Hard disk "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.disk.[{#LOCATION}].last()}<>27</p><p>**Recovery expression**: </p>|high|
|DiskDomain "{#NAME}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.diskpool.[{#NAME}].last()}=2</p><p>**Recovery expression**: </p>|disaster|
|DiskDomain "{#NAME}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.diskpool.[{#NAME}].last()}=28</p><p>**Recovery expression**: </p>|disaster|
|Enclosure "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.enclosure.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Enclosure "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.enclosure.[{#LOCATION}].last()}<>27</p><p>**Recovery expression**: </p>|high|
|PortEth "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.eth_port.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|PortEth "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.eth_port.[{#LOCATION}].last()}=11</p><p>**Recovery expression**: </p>|high|
|ExpBoard "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.expboard.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|ExpBoard "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.expboard.[{#LOCATION}].last()}<>27 and {Huawei OceanStor Rest-API v2:running.expboard.[{#LOCATION}].last()}<>2</p><p>**Recovery expression**: </p>|high|
|FAN "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.fan.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|FAN "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.fan.[{#LOCATION}].last()}<>27 and {Huawei OceanStor Rest-API v2:running.fan.[{#LOCATION}].last()}<>2</p><p>**Recovery expression**: </p>|high|
|PortFibreChannel "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.fc_port.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|PortFibreChannel "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.fc_port.[{#LOCATION}].last()}=11</p><p>**Recovery expression**: </p>|high|
|InterfaceModule "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.intf_module.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|InterfaceModule "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.intf_module.[{#LOCATION}].last()}<>27 and {Huawei OceanStor Rest-API v2:running.intf_module.[{#LOCATION}].last()}<>2</p><p>**Recovery expression**: </p>|high|
|LUN "{#NAME}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.lun.[{#NAME}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|LUN "{#NAME}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.lun.[{#NAME}].last()}<>27</p><p>**Recovery expression**: </p>|high|
|PSU "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.power.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|PSU "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.power.[{#LOCATION}].last()}<>27</p><p>**Recovery expression**: </p>|high|
|PortSAS "{#LOCATION}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.sas_port.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|PortSAS "{#LOCATION}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.sas_port.[{#LOCATION}].last()}=11</p><p>**Recovery expression**: </p>|high|
|Pool "{#NAME}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.storagepool.[{#NAME}].last()}=2</p><p>**Recovery expression**: </p>|disaster|
|Pool "{#NAME}" running status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.storagepool.[{#NAME}].last()}=28</p><p>**Recovery expression**: </p>|disaster|
|Subscribed capacity on pool "{#NAME}" > {$SUBSCRIBED_PERCENT:"{#NAME}"}%|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:subscribed.capacity.percent.storagepool.[{#NAME}].last()}>91</p><p>**Recovery expression**: </p>|high|
|Used capacity on pool "{#NAME}" > {$USED_PERCENT:"{#NAME}"}%|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:used.capacity.percent.storagepool.[{#NAME}].last()}>91</p><p>**Recovery expression**: </p>|high|
|Enclosure "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.enclosure.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Enclosure "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.enclosure.[{#LOCATION}].last()}<>27</p><p>**Recovery expression**: </p>|high|
|PortSAS "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.sas_port.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|PortSAS "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.sas_port.[{#LOCATION}].last()}=11</p><p>**Recovery expression**: </p>|high|
|DiskDomain "{#NAME}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.diskpool.[{#NAME}].last()}=2</p><p>**Recovery expression**: </p>|disaster|
|DiskDomain "{#NAME}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.diskpool.[{#NAME}].last()}=28</p><p>**Recovery expression**: </p>|disaster|
|LUN "{#NAME}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.lun.[{#NAME}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|LUN "{#NAME}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.lun.[{#NAME}].last()}<>27</p><p>**Recovery expression**: </p>|high|
|InterfaceModule "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.intf_module.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|InterfaceModule "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.intf_module.[{#LOCATION}].last()}<>27 and {Huawei OceanStor Rest-API v2:running.intf_module.[{#LOCATION}].last()}<>2</p><p>**Recovery expression**: </p>|high|
|PSU "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.power.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|PSU "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.power.[{#LOCATION}].last()}<>27</p><p>**Recovery expression**: </p>|high|
|Pool "{#NAME}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.storagepool.[{#NAME}].last()}=2</p><p>**Recovery expression**: </p>|disaster|
|Pool "{#NAME}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.storagepool.[{#NAME}].last()}=28</p><p>**Recovery expression**: </p>|disaster|
|Subscribed capacity on pool "{#NAME}" > {$SUBSCRIBED_PERCENT:"{#NAME}"}% (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:subscribed.capacity.percent.storagepool.[{#NAME}].last()}>91</p><p>**Recovery expression**: </p>|high|
|Used capacity on pool "{#NAME}" > {$USED_PERCENT:"{#NAME}"}% (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:used.capacity.percent.storagepool.[{#NAME}].last()}>91</p><p>**Recovery expression**: </p>|high|
|PortEth "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.eth_port.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|PortEth "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.eth_port.[{#LOCATION}].last()}=11</p><p>**Recovery expression**: </p>|high|
|BBU "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.backup_power.[{#LOCATION}].min(43200)}=12 or {Huawei OceanStor Rest-API v2:health.backup_power.[{#LOCATION}].last()}=2 or {Huawei OceanStor Rest-API v2:health.backup_power.[{#LOCATION}].last()}=3 or {Huawei OceanStor Rest-API v2:health.backup_power.[{#LOCATION}].last()}=0</p><p>**Recovery expression**: </p>|high|
|BBU "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.backup_power.[{#LOCATION}].last()}=28 or {Huawei OceanStor Rest-API v2:running.backup_power.[{#LOCATION}].last()}=0</p><p>**Recovery expression**: </p>|high|
|ExpBoard "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.expboard.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|ExpBoard "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.expboard.[{#LOCATION}].last()}<>27 and {Huawei OceanStor Rest-API v2:running.expboard.[{#LOCATION}].last()}<>2</p><p>**Recovery expression**: </p>|high|
|Controller "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.controller.[{#LOCATION}].last(0)}<>1</p><p>**Recovery expression**: </p>|high|
|Controller "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.controller.[{#LOCATION}].last(0)}<>27</p><p>**Recovery expression**: </p>|high|
|PortFibreChannel "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.fc_port.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|PortFibreChannel "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.fc_port.[{#LOCATION}].last()}=11</p><p>**Recovery expression**: </p>|high|
|Hard disk "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.disk.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|Hard disk "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.disk.[{#LOCATION}].last()}<>27</p><p>**Recovery expression**: </p>|high|
|FAN "{#LOCATION}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:health.fan.[{#LOCATION}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|FAN "{#LOCATION}" running status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: {Huawei OceanStor Rest-API v2:running.fan.[{#LOCATION}].last()}<>27 and {Huawei OceanStor Rest-API v2:running.fan.[{#LOCATION}].last()}<>2</p><p>**Recovery expression**: </p>|high|
