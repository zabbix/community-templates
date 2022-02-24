# IBM-Storwize-3700 CLI v2

## Overview

Tested on Storwize 3700.


This script get next metrics:


Disk, Enclosure, Battery, Enclosure Canister, PSU, Mdisk, Pool, PortFibreChannel, PortSas, Volume



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$STORWIZE_PASSWORD}|<p>-</p>|``|Text macro|
|{$STORWIZE_PORT}|<p>-</p>|`22`|Text macro|
|{$STORWIZE_USER}|<p>-</p>|``|Text macro|
|{$SUBSCRIBED_PERCENT}|<p>-</p>|`91`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Enclosure|<p>-</p>|`Zabbix trapper`|lsenclosure<p>Update: 0</p>|
|PortSAS|<p>-</p>|`Zabbix trapper`|lsportsas<p>Update: 0</p>|
|Enclosure PSU|<p>-</p>|`Zabbix trapper`|lsenclosurepsu<p>Update: 0</p>|
|PortFibreChannel|<p>-</p>|`Zabbix trapper`|lsportfc<p>Update: 0</p>|
|Mdisk|<p>Display a concise list or a detailed view of managed disks (MDisks). RAID-массивы показывает</p>|`Zabbix trapper`|lsmdisk<p>Update: 0</p>|
|Enclosure Canister|<p>Node Canister Контроллер, голова</p>|`Zabbix trapper`|lsenclosurecanister<p>Update: 0</p>|
|Enclosure Battery|<p>-</p>|`Zabbix trapper`|lsenclosurebattery<p>Update: 0</p>|
|Pool|<p>-</p>|`Zabbix trapper`|lsmdiskgrp<p>Update: 0</p>|
|Volume|<p>-</p>|`Zabbix trapper`|lsvdisk<p>Update: 0</p>|
|Disk|<p>-</p>|`Zabbix trapper`|lsdrive<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|get status|<p>-</p>|`External check`|storwize_get_state.py["--storwize_ip={HOST.IP}","--storwize_port={$STORWIZE_PORT}","--storwize_user={$STORWIZE_USER}","--storwize_password={$STORWIZE_PASSWORD}","--storage_name={HOST.NAME}","--status"]<p>Update: 3m</p>|
|get discovery|<p>-</p>|`External check`|storwize_get_state.py["--storwize_ip={HOST.IP}","--storwize_port={$STORWIZE_PORT}","--storwize_user={$STORWIZE_USER}","--storwize_password={$STORWIZE_PASSWORD}","--storage_name={HOST.NAME}","--discovery"]<p>Update: 30m</p>|
|Count of enclosure|<p>-</p>|`Zabbix trapper`|is_there_expansion_enclosure<p>Update: 0</p>|
|Count of unsupported items|<p>-</p>|`Zabbix internal`|zabbix[host,,items_unsupported]<p>Update: 10m</p>|
|Fault LED of enclosure ID - "{#ID}", Serial Number - "{#SERIAL_NUMBER}"|<p>-</p>|`Zabbix trapper`|faultLED.lsenclosure.[{#ID}.{#SERIAL_NUMBER}]<p>Update: 0</p><p>LLD</p>|
|Health status of enclosure ID - "{#ID}", Serial Number - "{#SERIAL_NUMBER}"|<p>-</p>|`Zabbix trapper`|health.lsenclosure.[{#ID}.{#SERIAL_NUMBER}]<p>Update: 0</p><p>LLD</p>|
|Running status of SAS port ID - "{#PORT_ID}", node name - "{#NODE_NAME}"|<p>-</p>|`Zabbix trapper`|running.lsportsas.[{#PORT_ID}.{#NODE_NAME}]<p>Update: 0</p><p>LLD</p>|
|Fan of PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}"|<p>-</p>|`Zabbix trapper`|fanFailed.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}]<p>Update: 0</p><p>LLD</p>|
|Health status of PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}"|<p>-</p>|`Zabbix trapper`|health.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}]<p>Update: 0</p><p>LLD</p>|
|Input Power of PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}"|<p>-</p>|`Zabbix trapper`|inFailed.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}]<p>Update: 0</p><p>LLD</p>|
|Output Power of PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}"|<p>-</p>|`Zabbix trapper`|outFailed.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}]<p>Update: 0</p><p>LLD</p>|
|Running status of Fibre Channel port ID - "{#PORT_ID}", node name - "{#NODE_NAME}"|<p>-</p>|`Zabbix trapper`|running.lsportfc.[{#PORT_ID}.{#NODE_NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of Mdisk "{#NAME}"|<p>-</p>|`Zabbix trapper`|health.lsmdisk.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of Canister "{#CANISTER_ID}" in enclosure "{#ENCLOSURE_ID}"|<p>-</p>|`Zabbix trapper`|health.lsenclosurecanister.[{#ENCLOSURE_ID}.{#CANISTER_ID}]<p>Update: 0</p><p>LLD</p>|
|Health status of BBU "{#BATTERY_ID}" in enclosure "{#ENCLOSURE_ID}"|<p>-</p>|`Zabbix trapper`|health.lsenclosurebattery.[{#ENCLOSURE_ID}.{#BATTERY_ID}]<p>Update: 0</p><p>LLD</p>|
|Free capacity of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|free.lsmdiskgrp.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|health.lsmdiskgrp.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Percent overallocation on Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|overallocation.lsmdiskgrp.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Real capacity of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|real.lsmdiskgrp.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Total capacity of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|total.lsmdiskgrp.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Used capacity of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|used.lsmdiskgrp.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Virtual capacity of a Pool "{#NAME}"|<p>-</p>|`Zabbix trapper`|virtual.lsmdiskgrp.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of Volume "{#NAME}"|<p>-</p>|`Zabbix trapper`|health.lsvdisk.[{#NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of disk "{#SLOT_ID}" in enclosure "{#ENCLOSURE_ID}"|<p>online - which indicates that the drive is available through all drive ports degraded - which indicates that the drive is available but not through all drive ports offline - which indicates that the drive is unavailable</p>|`Zabbix trapper`|health.lsdrive.[{#ENCLOSURE_ID}.{#SLOT_ID}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} -> Hard disk {#SLOT_ID} in enclosure {#ENCLOSURE_ID} health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsdrive.[{#ENCLOSURE_ID}.{#SLOT_ID}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Enclosure ID - "{#ID}", Serial Number - "{#SERIAL_NUMBER}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsenclosure.[{#ID}.{#SERIAL_NUMBER}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Enclosure ID - "{#ID}", Serial Number - "{#SERIAL_NUMBER}" LED status is failed|<p>Indicates the status of the fault light-emitting diode (LED) on the enclosure: on - if a service action is required immediately on the enclosure or a component within the enclosure (including a canister, power unit, or non-spared drive). slow_flashing - if there is insufficient battery power to run I/O off - if there are not faults on the enclosure or its components</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/faultLED.lsenclosure.[{#ID}.{#SERIAL_NUMBER}])=8 or last(/IBM-Storwize-3700 CLI v2/faultLED.lsenclosure.[{#ID}.{#SERIAL_NUMBER}])=10</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> BBU "{#BATTERY_ID}" in enclosure "{#ENCLOSURE_ID}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsenclosurebattery.[{#ENCLOSURE_ID}.{#BATTERY_ID}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Canister "{#CANISTER_ID}" in enclosure "{#ENCLOSURE_ID}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsenclosurecanister.[{#ENCLOSURE_ID}.{#CANISTER_ID}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}" fan status is failed|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/fanFailed.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}])=8</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}" input power status is failed|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/inFailed.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}])=8</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}" output power status is failed|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/outFailed.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}])=8</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Mdisk "{#NAME}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsmdisk.[{#NAME}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Pool "{#NAME}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsmdiskgrp.[{#NAME}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Subscribed capacity on pool "{#NAME}" > {$SUBSCRIBED_PERCENT:"{#NAME}"}%|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/overallocation.lsmdiskgrp.[{#NAME}])>91</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} - > PortFibreChannel ID - "{#PORT_ID}", node name - "{#NODE_NAME}" running status is {ITEM.VALUE}|<p>Indicates whether the port is configured to a device of Fibre Channel (FC) port. The values are: active inactive_configured inactive_unconfigured</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/running.lsportfc.[{#PORT_ID}.{#NODE_NAME}])=4</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PortSas ID - "{#PORT_ID}", node name - "{#NODE_NAME}" running status is {ITEM.VALUE}|<p>Indicates the status of the port (numeric string). The values can be: online - if the port is functioning offline - if the port is not functioning offline_unconfigured - if not functioning but not configured by the user degraded - if one or more ports are not functioning or have a lower speed than others excluded - if excluded by the user or system Если на сторвайзе нет полок-расширения, то SAS-порты на контроллере будут оффлайн</p>|<p>**Expression**: ({TRIGGER.VALUE}=0 and last(/IBM-Storwize-3700 CLI v2/running.lsportsas.[{#PORT_ID}.{#NODE_NAME}])<>0 and change(/IBM-Storwize-3700 CLI v2/running.lsportsas.[{#PORT_ID}.{#NODE_NAME}])=1) or ({TRIGGER.VALUE}=1 and last(/IBM-Storwize-3700 CLI v2/is_there_expansion_enclosure)<>0)</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Volume "{#NAME}" health status is {ITEM.VALUE}|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsvdisk.[{#NAME}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Enclosure ID - "{#ID}", Serial Number - "{#SERIAL_NUMBER}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsenclosure.[{#ID}.{#SERIAL_NUMBER}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Enclosure ID - "{#ID}", Serial Number - "{#SERIAL_NUMBER}" LED status is failed (LLD)|<p>Indicates the status of the fault light-emitting diode (LED) on the enclosure: on - if a service action is required immediately on the enclosure or a component within the enclosure (including a canister, power unit, or non-spared drive). slow_flashing - if there is insufficient battery power to run I/O off - if there are not faults on the enclosure or its components</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/faultLED.lsenclosure.[{#ID}.{#SERIAL_NUMBER}])=8 or last(/IBM-Storwize-3700 CLI v2/faultLED.lsenclosure.[{#ID}.{#SERIAL_NUMBER}])=10</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PortSas ID - "{#PORT_ID}", node name - "{#NODE_NAME}" running status is {ITEM.VALUE} (LLD)|<p>Indicates the status of the port (numeric string). The values can be: online - if the port is functioning offline - if the port is not functioning offline_unconfigured - if not functioning but not configured by the user degraded - if one or more ports are not functioning or have a lower speed than others excluded - if excluded by the user or system Если на сторвайзе нет полок-расширения, то SAS-порты на контроллере будут оффлайн</p>|<p>**Expression**: ({TRIGGER.VALUE}=0 and last(/IBM-Storwize-3700 CLI v2/running.lsportsas.[{#PORT_ID}.{#NODE_NAME}])<>0 and change(/IBM-Storwize-3700 CLI v2/running.lsportsas.[{#PORT_ID}.{#NODE_NAME}])=1) or ({TRIGGER.VALUE}=1 and last(/IBM-Storwize-3700 CLI v2/is_there_expansion_enclosure)<>0)</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}" fan status is failed (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/fanFailed.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}])=8</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}" input power status is failed (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/inFailed.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}])=8</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PSU "{#PSU_ID}" in enclosure "{#ENCLOSURE_ID}" output power status is failed (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/outFailed.lsenclosurepsu.[{#ENCLOSURE_ID}.{#PSU_ID}])=8</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} - > PortFibreChannel ID - "{#PORT_ID}", node name - "{#NODE_NAME}" running status is {ITEM.VALUE} (LLD)|<p>Indicates whether the port is configured to a device of Fibre Channel (FC) port. The values are: active inactive_configured inactive_unconfigured</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/running.lsportfc.[{#PORT_ID}.{#NODE_NAME}])=4</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Mdisk "{#NAME}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsmdisk.[{#NAME}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Canister "{#CANISTER_ID}" in enclosure "{#ENCLOSURE_ID}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsenclosurecanister.[{#ENCLOSURE_ID}.{#CANISTER_ID}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> BBU "{#BATTERY_ID}" in enclosure "{#ENCLOSURE_ID}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsenclosurebattery.[{#ENCLOSURE_ID}.{#BATTERY_ID}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Pool "{#NAME}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsmdiskgrp.[{#NAME}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Subscribed capacity on pool "{#NAME}" > {$SUBSCRIBED_PERCENT:"{#NAME}"}% (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/overallocation.lsmdiskgrp.[{#NAME}])>91</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Volume "{#NAME}" health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsvdisk.[{#NAME}])>0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Hard disk {#SLOT_ID} in enclosure {#ENCLOSURE_ID} health status is {ITEM.VALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/IBM-Storwize-3700 CLI v2/health.lsdrive.[{#ENCLOSURE_ID}.{#SLOT_ID}])>0</p><p>**Recovery expression**: </p>|high|
