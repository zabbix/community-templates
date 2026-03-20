# Template ESXi HP Smart Array

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ZABBIX_SSH_PASS}|<p>-</p>|`zabbixPassword`|Text macro|
|{$ZABBIX_SSH_USER}|<p>-</p>|`zabbixUsername`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Physical Drives Discovery|<p>-</p>|`SSH agent`|ssh.run[hpraid.pd.discovery]<p>Update: 86400</p>|
|Logical Volumes Discovery|<p>-</p>|`SSH agent`|ssh.run[hpraid.ld.discovery]<p>Update: 21600</p>|
|Controllers Discovery|<p>-</p>|`SSH agent`|ssh.run[hpraid.ctrl.discovery]<p>Update: 86400</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Smart Array: Data Retrieval|<p>-</p>|`SSH agent`|ssh.run[hpraid.data.retrieval]<p>Update: 600</p>|
|Physical drive {#PD} status|<p>-</p>|`SSH agent`|ssh.run[hpraid.pd.status.{#PD}]<p>Update: 600</p><p>LLD</p>|
|Physical drive {#PD} temperature|<p>-</p>|`SSH agent`|ssh.run[hpraid.pd.temperature.{#PD}]<p>Update: 600</p><p>LLD</p>|
|Logical volume $1 status|<p>-</p>|`SSH agent`|ssh.run[hpraid.ld.status.{#LD}]<p>Update: 600</p><p>LLD</p>|
|Smart Array: Battery status on slot {#CTRL_SLOT}|<p>-</p>|`SSH agent`|ssh.run[hpraid.bbu.status.{#CTRL_SLOT}]<p>Update: 21600</p><p>LLD</p>|
|Smart Array: Cache $2 status on slot {#CTRL_SLOT}|<p>-</p>|`SSH agent`|ssh.run[hpraid.cache.status.{#CTRL_SLOT}]<p>Update: 21600</p><p>LLD</p>|
|Smart Array: Controller status on slot {#CTRL_SLOT}|<p>-</p>|`SSH agent`|ssh.run[hpraid.ctrl.status.{#CTRL_SLOT}]<p>Update: 21600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Smart Array: Controller Battery in slot {#CTRL_SLOT} state is {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.bbu.status.{#CTRL_SLOT}].regexp(OK|Not available)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: Controller Cache in slot {#CTRL_SLOT} state is {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.cache.status.{#CTRL_SLOT}].regexp(OK|Not available)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: Controller in slot {#CTRL_SLOT} state is {ITEM.LASTVALUE}|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.ctrl.status.{#CTRL_SLOT}].regexp(OK)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: No controller data received for >24h|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.ctrl.status.{#CTRL_SLOT}].nodata(24h)}=1</p><p>**Recovery expression**: </p>|high|
|Smart Array: Logical Volume state is {ITEM.LASTVALUE} on {HOSTNAME}|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.ld.status.{#LD}].str(OK)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: Disk state is {ITEM.LASTVALUE} on {HOSTNAME}|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.pd.status.{#PD}].str(OK)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: Disk state is {ITEM.LASTVALUE} on {HOSTNAME} (LLD)|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.pd.status.{#PD}].str(OK)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: Logical Volume state is {ITEM.LASTVALUE} on {HOSTNAME} (LLD)|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.ld.status.{#LD}].str(OK)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: Controller Battery in slot {#CTRL_SLOT} state is {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.bbu.status.{#CTRL_SLOT}].regexp(OK|Not available)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: Controller Cache in slot {#CTRL_SLOT} state is {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.cache.status.{#CTRL_SLOT}].regexp(OK|Not available)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: Controller in slot {#CTRL_SLOT} state is {ITEM.LASTVALUE} (LLD)|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.ctrl.status.{#CTRL_SLOT}].regexp(OK)}=0</p><p>**Recovery expression**: </p>|high|
|Smart Array: No controller data received for >24h (LLD)|<p>-</p>|<p>**Expression**: {Template ESXi HP Smart Array:ssh.run[hpraid.ctrl.status.{#CTRL_SLOT}].nodata(24h)}=1</p><p>**Recovery expression**: </p>|high|
