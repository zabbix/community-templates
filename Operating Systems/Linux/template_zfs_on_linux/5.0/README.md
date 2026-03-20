# ZFS on Linux

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ZFS_ARC_META_ALERT}|<p>-</p>|`90`|Text macro|
|{$ZFS_AVERAGE_ALERT}|<p>-</p>|`90`|Text macro|
|{$ZFS_DISASTER_ALERT}|<p>-</p>|`99`|Text macro|
|{$ZFS_HIGH_ALERT}|<p>-</p>|`95`|Text macro|
|{$ZPOOL_AVERAGE_ALERT}|<p>-</p>|`85`|Text macro|
|{$ZPOOL_DISASTER_ALERT}|<p>-</p>|`99`|Text macro|
|{$ZPOOL_HIGH_ALERT}|<p>-</p>|`90`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Zfs Dataset discovery|<p>Discover ZFS dataset. Dataset names must contain a "/" else it's a zpool.</p>|`Zabbix agent (active)`|zfs.fileset.discovery<p>Update: 30m</p>|
|Zfs Pool discovery|<p>-</p>|`Zabbix agent (active)`|zfs.pool.discovery<p>Update: 1h</p>|
|Zfs vdev discovery|<p>-</p>|`Zabbix agent (active)`|zfs.vdev.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ZFS on Linux version|<p>-</p>|`Zabbix agent (active)`|vfs.file.contents[/sys/module/zfs/version]<p>Update: 1h</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[arc_dnode_limit]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[arc_meta_limit]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>arc_meta_used = hdr_size + metadata_size + dbuf_size + dnode_size + bonus_size</p>|`Zabbix agent (active)`|zfs.arcstats[arc_meta_used]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[bonus_size]<p>Update: 1m</p>|
|ZFS ARC max size|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[c_max]<p>Update: 1m</p>|
|ZFS ARC minimum size|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[c_min]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[data_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[dbuf_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[dnode_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[hdr_size]<p>Update: 1m</p>|
|ZFS ARC Cache Hit Ratio|<p>-</p>|`Calculated`|zfs.arcstats_hit_ratio<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[hits]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[metadata_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[mfu_hits]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[mfu_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[misses]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[mru_hits]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[mru_size]<p>Update: 1m</p>|
|ZFS ARC current size|<p>-</p>|`Zabbix agent (active)`|zfs.arcstats[size]<p>Update: 1m</p>|
|ZFS ARC total read|<p>-</p>|`Calculated`|zfs.arcstats_total_read<p>Update: 1m</p>|
|ZFS parameter $1|<p>-</p>|`Zabbix agent (active)`|zfs.get.param[zfs_arc_dnode_limit_percent]<p>Update: 1h</p>|
|ZFS parameter $1|<p>-</p>|`Zabbix agent (active)`|zfs.get.param[zfs_arc_meta_limit_percent]<p>Update: 1h</p>|
|Zfs dataset $1 compressratio|<p>-</p>|`Zabbix agent (active)`|zfs.get.compressratio[{#FILESETNAME}]<p>Update: 30m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent (active)`|zfs.get.fsinfo[{#FILESETNAME},available]<p>Update: 5m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent (active)`|zfs.get.fsinfo[{#FILESETNAME},referenced]<p>Update: 5m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent (active)`|zfs.get.fsinfo[{#FILESETNAME},usedbychildren]<p>Update: 5m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent (active)`|zfs.get.fsinfo[{#FILESETNAME},usedbydataset]<p>Update: 1h</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent (active)`|zfs.get.fsinfo[{#FILESETNAME},usedbysnapshots]<p>Update: 5m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent (active)`|zfs.get.fsinfo[{#FILESETNAME},used]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME}: Get iostats|<p>-</p>|`Zabbix agent (active)`|vfs.file.contents[/proc/spl/kstat/zfs/{#POOLNAME}/io]<p>Update: 1m</p><p>LLD</p>|
|Zpool {#POOLNAME} available|<p>-</p>|`Zabbix agent (active)`|zfs.get.fsinfo[{#POOLNAME},available]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} used|<p>-</p>|`Zabbix agent (active)`|zfs.get.fsinfo[{#POOLNAME},used]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} Health|<p>-</p>|`Zabbix agent (active)`|zfs.zpool.health[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} scrub status|<p>Detect if the pool is currently scrubbing itself. This is not a bad thing itself, but it slows down the entire pool and should be terminated when on production server during business hours if it causes a noticeable slowdown.</p>|`Zabbix agent (active)`|zfs.zpool.scrub[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} read throughput|<p>-</p>|`Dependent item`|zfs.zpool.iostat.nread[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|Zpool {#POOLNAME} write throughput|<p>-</p>|`Dependent item`|zfs.zpool.iostat.nwritten[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|Zpool {#POOLNAME} IOPS: reads|<p>-</p>|`Dependent item`|zfs.zpool.iostat.reads[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|Zpool {#POOLNAME} IOPS: writes|<p>-</p>|`Dependent item`|zfs.zpool.iostat.writes[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|vdev {#VDEV}: CHECKSUM error counter|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'.</p>|`Zabbix agent (active)`|zfs.vdev.error_counter.cksum[{#VDEV}]<p>Update: 5m</p><p>LLD</p>|
|vdev {#VDEV}: READ error counter|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'.</p>|`Zabbix agent (active)`|zfs.vdev.error_counter.read[{#VDEV}]<p>Update: 5m</p><p>LLD</p>|
|vdev {#VDEV}: WRITE error counter|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'.</p>|`Zabbix agent (active)`|zfs.vdev.error_counter.write[{#VDEV}]<p>Update: 5m</p><p>LLD</p>|
|vdev {#VDEV}: total number of errors|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'.</p>|`Calculated`|zfs.vdev.error_total[{#VDEV}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|More than {$ZFS_AVERAGE_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} ) ) > (90/100)</p><p>**Recovery expression**: </p>|average|
|More than {$ZFS_DISASTER_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} ) ) > (99/100)</p><p>**Recovery expression**: </p>|disaster|
|More than {$ZFS_HIGH_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} ) ) > (95/100)</p><p>**Recovery expression**: </p>|high|
|More than {$ZPOOL_AVERAGE_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} ) ) > (85/100)</p><p>**Recovery expression**: </p>|average|
|More than {$ZPOOL_DISASTER_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} ) ) > (99/100)</p><p>**Recovery expression**: </p>|disaster|
|More than {$ZPOOL_HIGH_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} ) ) > (90/100)</p><p>**Recovery expression**: </p>|high|
|Zpool {#POOLNAME} is scrubbing for more than 12h on {HOST.NAME}|<p>-</p>|<p>**Expression**: {ZFS on Linux:zfs.zpool.scrub[{#POOLNAME}].max(12h)}=0</p><p>**Recovery expression**: </p>|average|
|Zpool {#POOLNAME} is scrubbing for more than 24h on {HOST.NAME}|<p>-</p>|<p>**Expression**: {ZFS on Linux:zfs.zpool.scrub[{#POOLNAME}].max(24h)}=0</p><p>**Recovery expression**: </p>|high|
|Zpool {#POOLNAME} is {ITEM.VALUE} on {HOST.NAME}|<p>-</p>|<p>**Expression**: {ZFS on Linux:zfs.zpool.health[{#POOLNAME}].str(ONLINE)}=0</p><p>**Recovery expression**: </p>|high|
|vdev {#VDEV} has encountered {ITEM.VALUE} errors on {HOST.NAME}|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'. You may also run a zpool scrub to check if some other undetected errors are present on this vdev.</p>|<p>**Expression**: {ZFS on Linux:zfs.vdev.error_total[{#VDEV}].last()}>0</p><p>**Recovery expression**: </p>|high|
|More than {$ZFS_AVERAGE_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} ) ) > (90/100)</p><p>**Recovery expression**: </p>|average|
|More than {$ZFS_DISASTER_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} ) ) > (99/100)</p><p>**Recovery expression**: </p>|disaster|
|More than {$ZFS_HIGH_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#FILESETNAME},used].last()} ) ) > (95/100)</p><p>**Recovery expression**: </p>|high|
|More than {$ZPOOL_AVERAGE_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} ) ) > (85/100)</p><p>**Recovery expression**: </p>|average|
|More than {$ZPOOL_DISASTER_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} ) ) > (99/100)</p><p>**Recovery expression**: </p>|disaster|
|More than {$ZPOOL_HIGH_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} / ( {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},available].last()} + {ZFS on Linux:zfs.get.fsinfo[{#POOLNAME},used].last()} ) ) > (90/100)</p><p>**Recovery expression**: </p>|high|
|Zpool {#POOLNAME} is scrubbing for more than 12h on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {ZFS on Linux:zfs.zpool.scrub[{#POOLNAME}].max(12h)}=0</p><p>**Recovery expression**: </p>|average|
|Zpool {#POOLNAME} is scrubbing for more than 24h on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {ZFS on Linux:zfs.zpool.scrub[{#POOLNAME}].max(24h)}=0</p><p>**Recovery expression**: </p>|high|
|Zpool {#POOLNAME} is {ITEM.VALUE} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {ZFS on Linux:zfs.zpool.health[{#POOLNAME}].str(ONLINE)}=0</p><p>**Recovery expression**: </p>|high|
|vdev {#VDEV} has encountered {ITEM.VALUE} errors on {HOST.NAME} (LLD)|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'. You may also run a zpool scrub to check if some other undetected errors are present on this vdev.</p>|<p>**Expression**: {ZFS on Linux:zfs.vdev.error_total[{#VDEV}].last()}>0</p><p>**Recovery expression**: </p>|high|
