# Template MD Soft RAID

Monitoring of MD Soft RAID## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MD Discovery|<p>-</p>|`Zabbix agent`|md.discover<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MD $1 degraded|<p>Get number of degraded disks</p>|`Zabbix agent`|md.degraded[{#MDNAME}]<p>Update: 5m</p><p>LLD</p>|
|MD $1 raid disks|<p>Get number of all disks</p>|`Zabbix agent`|md.raid_disks[{#MDNAME}]<p>Update: 3600</p><p>LLD</p>|
|MD $1 sync action|<p>Get current sync action</p>|`Zabbix agent`|md.sync_action[{#MDNAME}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|MD {#MDNAME} in recovery mode on {HOST.NAME}|<p>-</p>|<p>**Expression**: {Template MD Soft RAID:md.sync_action[{#MDNAME}].str(recover)}=1</p><p>**Recovery expression**: </p>|information|
|MD {#MDNAME} is degraded on {HOST.NAME}|<p>-</p>|<p>**Expression**: {Template MD Soft RAID:md.degraded[{#MDNAME}].last()}>0</p><p>**Recovery expression**: </p>|high|
|MD {#MDNAME} number of disks changed on {HOST.NAME}|<p>-</p>|<p>**Expression**: {Template MD Soft RAID:md.raid_disks[{#MDNAME}].diff()}>0</p><p>**Recovery expression**: </p>|warning|
|MD {#MDNAME} in recovery mode on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {Template MD Soft RAID:md.sync_action[{#MDNAME}].str(recover)}=1</p><p>**Recovery expression**: </p>|information|
|MD {#MDNAME} is degraded on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {Template MD Soft RAID:md.degraded[{#MDNAME}].last()}>0</p><p>**Recovery expression**: </p>|high|
|MD {#MDNAME} number of disks changed on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {Template MD Soft RAID:md.raid_disks[{#MDNAME}].diff()}>0</p><p>**Recovery expression**: </p>|warning|
