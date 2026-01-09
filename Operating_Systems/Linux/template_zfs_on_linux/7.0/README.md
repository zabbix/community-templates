# ZFS on Linux

## Installation

To use the Zabbix ZFS on Linux template, you must first install a correctly configured userparams file on any machines running the zabbix agent and using ZFS.

Additionally, for monitoring of scrub and resilver stats you must install the ZED integration script.

### Choosing the correct userparams file

There should be two different user parameters files in the same directory as this README, `userparams_zol_without_sudo.conf` and `userparams_zol_with_sudo.conf`. One uses `sudo` to run and thus you must give Zabbix the correct rights and the other doesn't use `sudo`.

On recent ZFS on Linux versions (version 0.7.0+), you don't need sudo to run `zpool list` or `zfs list` so you need to copy `userparams_zol_without_sudo.conf` into `/etc/zabbix/zabbix_agentd.d` or `/etc/zabbix/zabbix_agent2.d` if using zabbix-agent2.

For older ZFS on Linux versions (eg version 0.6.x), you will need to add some sudo rights with the file `userparams_zol_with_sudo.conf`. On some distributions, ZoL already includes a suitable file with all the necessary rights at `/etc/sudoers.d/zfs` but its contents are commented out, you just need to remove the comments and any user will be able to list zfs datasets and pools. An example config might look like so:

```
## Allow read-only ZoL commands to be called through sudo
## without a password. Remove the first '#' column to enable.
##
## CAUTION: Any syntax error introduced here will break sudo.
##
## Cmnd alias specification
Cmnd_Alias C_ZFS = \
  /sbin/zfs "", /sbin/zfs help *, \
  /sbin/zfs get, /sbin/zfs get *, \
  /sbin/zfs list, /sbin/zfs list *, \
  /sbin/zpool "", /sbin/zpool help *, \
  /sbin/zpool iostat, /sbin/zpool iostat *, \
  /sbin/zpool list, /sbin/zpool list *, \
  /sbin/zpool status, /sbin/zpool status *, \
  /sbin/zpool upgrade, /sbin/zpool upgrade -v

## allow any user to use basic read-only ZFS commands
ALL ALL = (root) NOPASSWD: C_ZFS
```

If you don't know where your userparameters directory is, this is usually `/etc/zabbix/zabbix_agentd.d`. If in doubt, just look at your `zabbix_agentd.conf` file for the line begining by `Include=`.

### Editing the userparams file

The path used for the `zfs` and `zpool` binaries is different under almost every Linux distro, the paths aren't even the same for Debian and Ubuntu, as one notable example. For this reason you should run `which zfs` and `which zpool` on each ZFS machine you want to monitor with Zabbix to find out the correct paths to use to run these two binaries, then you need to edit the userparams file so that every instance of `zfs` and `zpool` is called using the correct path, if your distro's path doesn't match the path used in example userparams files.

### Installing the ZED integration script

By default ZFS does not provide a reliable way to get the stats from the most recent scrub or resilver, nor does it record these details. The details of most recent scrub _or_ resilver will be available in the output of `zfs status`, but only until the next scan starts.

As a workaround for this a script has been written to extract stats and timestamps from zfs and record them as custom properties on the root dataset for each pool. This script is a zedlet that will be run by the [ZFS Event Daemon (ZED)](https://openzfs.github.io/openzfs-docs/man/master/8/zed.8.html) whenever a scrub or resilver completes.

To install the script:

1. Work out the "installed zedlets" directory for your platform, for example:
   ``` bash
   ZEDLETDIR=$(find /etc/zfs/zed.d/ -type l | head -1 | xargs readlink -f | awk 'BEGIN{OFS=FS="/"};NF--' | sort -u)
   ```
1. Copy `scan_finish-zabbix.sh` from this directory to the "installed zedlets" directory and make it executable and owned by root
1. Link `scan_finish-zabbix.sh` to the "enabled zedlets" directory (always `/etc/zfs/zed.d/`) as `scrub_finish-zabbix.sh` and `resilver_finish-zabbix.sh`
   ``` bash
   ln -s ${ZEDLETDIR}/scan_finish-zabbix.sh /etc/zfs/zed.d/scrub_finish-zabbix.sh
   ln -s ${ZEDLETDIR}/scan_finish-zabbix.sh /etc/zfs/zed.d/resilver_finish-zabbix.sh
   ```
1. Restart the ZED daemon to ensure it detects the new scripts
   ``` bash
   # On distros using systemd
   systemctl restart zed
   ```
1. Run `set-zfs-scan-defaults.sh` from this directory to set all dataset properties used to the default values
1. Optionally, run `scan_finish-zabbix.sh` once to set the data for the most recent scan/resilver
   ``` bash
   # When running manually need to provide values for variables (usually these are set by zed)
   export ZPOOL=$(which zpool)
   export ZFS=$(which zfs)
   for ZEVENT_POOL in $(zpool status | grep 'pool:' | cut -d':' -f 2); do
      export ZEVENT_POOL
      bash /etc/zfs/zed.d/resilver_finish-zabbix.sh || echo failed for ${ZEVENT_POOL}
   done
   ```

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
|{$ZFS_FSNAME_MATCHES}|<p>Determine datasets to discover</p>|`/`|Text macro|
|{$ZFS_FSNAME_NOTMATCHES}|<p>Determine datasets to ignore</p>|`([a-z-0-9]{64}$\|[a-z-0-9]{64}-init$)`|Text macro|
|{$ZPOOL_MAX_SCRUB_INTERVAL}|<p>Allowed time between scrubs (in days)</p>|`40`|Text macro|

### Context-specific macros

It is possible to define context-specific macros for triggers using the `{#FILESETNAME}` or `{#POOLNAME}` context. This allows you to set specific thresholds for individual datasets or pools.

Example:
- `{$ZFS_AVERAGE_ALERT}`: 80 (Global default)
- `{$ZFS_AVERAGE_ALERT:"tank/docker"}`: 95 (Specific for `tank/docker` dataset)

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Zfs Dataset discovery|<p>Discover ZFS dataset. Dataset names must contain a "/" else it's a zpool.</p>|`Zabbix agent`|zfs.fileset.discovery<p>Update: 30m</p>|
|Zfs Pool discovery|<p>-</p>|`Zabbix agent`|zfs.pool.discovery<p>Update: 1h</p>|
|Zfs vdev discovery|<p>-</p>|`Zabbix agent`|zfs.vdev.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ZFS on Linux version|<p>-</p>|`Zabbix agent`|vfs.file.contents[/sys/module/zfs/version]<p>Update: 1h</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[metadata_size]<p>Update: 1m</p>|
|ZFS parameter $1|<p>-</p>|`Zabbix agent`|zfs.get.param[zfs_arc_dnode_limit_percent]<p>Update: 1h</p>|
|ZFS ARC current size|<p>-</p>|`Zabbix agent`|zfs.arcstats[size]<p>Update: 1m</p>|
|ZFS ARC total read|<p>-</p>|`Calculated`|zfs.arcstats_total_read<p>Update: 1m</p>|
|ZFS ARC Cache Hit Ratio|<p>-</p>|`Calculated`|zfs.arcstats_hit_ratio<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[mru_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[mru_hits]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[misses]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[mfu_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[dbuf_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[data_size]<p>Update: 1m</p>|
|ZFS ARC minimum size|<p>-</p>|`Zabbix agent`|zfs.arcstats[c_min]<p>Update: 1m</p>|
|ZFS ARC max size|<p>-</p>|`Zabbix agent`|zfs.arcstats[c_max]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[bonus_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>arc_meta_used = hdr_size + metadata_size + dbuf_size + dnode_size + bonus_size</p>|`Zabbix agent`|zfs.arcstats[arc_meta_used]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[arc_meta_limit]<p>Update: 1m</p>|
|ZFS parameter $1|<p>-</p>|`Zabbix agent`|zfs.get.param[zfs_arc_meta_limit_percent]<p>Update: 1h</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[mfu_hits]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[hits]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[arc_dnode_limit]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[hdr_size]<p>Update: 1m</p>|
|ZFS ARC stat "$1"|<p>-</p>|`Zabbix agent`|zfs.arcstats[dnode_size]<p>Update: 1m</p>|
|ZFS ARC L2 stat "hits"|<p>-</p>|`Zabbix agent`|zfs.arcstats[l2_hits]<p>Update: 1m</p>|
|ZFS ARC L2 stat "misses"|<p>-</p>|`Zabbix agent`|zfs.arcstats[l2_misses]<p>Update: 1m</p>|
|ZFS ARC L2 current size|<p>-</p>|`Zabbix agent`|zfs.arcstats[l2_size]<p>Update: 1m</p>|
|ZFS ARC L2 Cache Hit Ratio|<p>-</p>|`Calculated`|zfs.arcstats_l2_hit_ratio<p>Update: 1m</p>|
|ZFS ARC L2 total read|<p>-</p>|`Calculated`|zfs.arcstats_l2_total_read<p>Update: 1m</p>|
|Zfs dataset $1 compressratio|<p>-</p>|`Zabbix agent`|zfs.get.compressratio[{#FILESETNAME}]<p>Update: 30m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent`|zfs.get.fsinfo[{#FILESETNAME},available]<p>Update: 5m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent`|zfs.get.fsinfo[{#FILESETNAME},referenced]<p>Update: 5m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent`|zfs.get.fsinfo[{#FILESETNAME},usedbychildren]<p>Update: 5m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent`|zfs.get.fsinfo[{#FILESETNAME},usedbydataset]<p>Update: 1h</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent`|zfs.get.fsinfo[{#FILESETNAME},usedbysnapshots]<p>Update: 5m</p><p>LLD</p>|
|Zfs dataset $1 $2|<p>-</p>|`Zabbix agent`|zfs.get.fsinfo[{#FILESETNAME},used]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME}: Get iostats|<p>-</p>|`Zabbix agent`|zfs.zpool.iostat[{#POOLNAME}]<p>Update: 1m</p><p>LLD</p>|
|Zpool {#POOLNAME} available|<p>-</p>|`Zabbix agent`|zfs.get.fsinfo[{#POOLNAME},available]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} used|<p>-</p>|`Zabbix agent`|zfs.get.fsinfo[{#POOLNAME},used]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} Health|<p>-</p>|`Zabbix agent`|zfs.zpool.health[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} scrub status|<p>Detect if the pool is currently scrubbing itself. This is not a bad thing itself, but it slows down the entire pool and should be terminated when on production server during business hours if it causes a noticeable slowdown.</p>|`Zabbix agent`|zfs.zpool.scrub.status[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} scrub timestamp|<p>-</p>|`Zabbix agent`|zfs.zpool.scrub.timestamp[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} scrub repaired|<p>-</p>|`Zabbix agent`|zfs.zpool.scrub.repaired[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} scrub length|<p>-</p>|`Zabbix agent`|zfs.zpool.scrub.length[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} scrub errors|<p>-</p>|`Zabbix agent`|zfs.zpool.scrub.errors[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} resilver status|<p>Detect if the pool is currently resilvering. An unexpected resilver is likely indicative of a problem, so in such an event it is advisable to check the pool.</p>|`Zabbix agent`|zfs.zpool.resilver.status[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} resilver timestamp|<p>-</p>|`Zabbix agent`|zfs.zpool.resilver.timestamp[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} resilver repaired|<p>-</p>|`Zabbix agent`|zfs.zpool.resilver.repaired[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} resilver length|<p>-</p>|`Zabbix agent`|zfs.zpool.resilver.length[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} resilver errors|<p>-</p>|`Zabbix agent`|zfs.zpool.resilver.errors[{#POOLNAME}]<p>Update: 5m</p><p>LLD</p>|
|Zpool {#POOLNAME} read throughput|<p>-</p>|`Dependent item`|zfs.zpool.iostat.nread[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|Zpool {#POOLNAME} write throughput|<p>-</p>|`Dependent item`|zfs.zpool.iostat.nwritten[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|Zpool {#POOLNAME} IOPS: reads|<p>-</p>|`Dependent item`|zfs.zpool.iostat.reads[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|Zpool {#POOLNAME} IOPS: writes|<p>-</p>|`Dependent item`|zfs.zpool.iostat.writes[{#POOLNAME}]<p>Update: 0</p><p>LLD</p>|
|vdev {#VDEV}: CHECKSUM error counter|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'.</p>|`Zabbix agent`|zfs.vdev.error_counter.cksum[{#VDEV}]<p>Update: 5m</p><p>LLD</p>|
|vdev {#VDEV}: READ error counter|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'.</p>|`Zabbix agent`|zfs.vdev.error_counter.read[{#VDEV}]<p>Update: 5m</p><p>LLD</p>|
|vdev {#VDEV}: WRITE error counter|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'.</p>|`Zabbix agent`|zfs.vdev.error_counter.write[{#VDEV}]<p>Update: 5m</p><p>LLD</p>|
|vdev {#VDEV}: total number of errors|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'.</p>|`Calculated`|zfs.vdev.error_total[{#VDEV}]<p>Update: 5m</p><p>LLD</p>|
|ZIL commit count|<p>-</p>|`Zabbix agent`|zfs.zil[zil_commit_count]<p>Update: 1m</p>|
|ZIL commit writer count|<p>-</p>|`Zabbix agent`|zfs.zil[zil_commit_writer_count]<p>Update: 1m</p>|
|ZIL intent transaction size|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_copied_bytes]<p>Update: 1m</p>|
|ZIL intent transaction copied count|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_copied_count]<p>Update: 1m</p>|
|ZIL intent transactions count|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_count]<p>Update: 1m</p>|
|ZIL intent transactions indirect size|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_indirect_bytes]<p>Update: 1m</p>|
|ZIL intent transaction indirect count|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_indirect_count]<p>Update: 1m</p>|
|ZIL intent transaction metaslab normal size|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_metaslab_normal_bytes]<p>Update: 1m</p>|
|ZIL intent transaction metaslab normal count|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_metaslab_normal_count]<p>Update: 1m</p>|
|ZIL intent transaction metaslab slog size|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_metaslab_slog_bytes]<p>Update: 1m</p>|
|ZIL intent transaction metaslab slog count|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_metaslab_slog_count]<p>Update: 1m</p>|
|ZIL intent transaction need copy size|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_needcopy_bytes]<p>Update: 1m</p>|
|ZIL intent transaction need copy count|<p>-</p>|`Zabbix agent`|zfs.zil[zil_itx_needcopy_count]<p>Update: 1m</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|More than {$ZFS_AVERAGE_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) ) ) > ({$ZFS_AVERAGE_ALERT:"{#FILESETNAME}"}/100)</p><p>**Recovery expression**: </p>|average|
|More than {$ZFS_DISASTER_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) ) ) > ({$ZFS_DISASTER_ALERT:"{#FILESETNAME}"}/100)</p><p>**Recovery expression**: </p>|disaster|
|More than {$ZFS_HIGH_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) ) ) > ({$ZFS_HIGH_ALERT:"{#FILESETNAME}"}/100)</p><p>**Recovery expression**: </p>|high|
|More than {$ZPOOL_AVERAGE_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) ) ) > ({$ZPOOL_AVERAGE_ALERT:"{#POOLNAME}"}/100)</p><p>**Recovery expression**: </p>|average|
|More than {$ZPOOL_DISASTER_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) ) ) > ({$ZPOOL_DISASTER_ALERT:"{#POOLNAME}"}/100)</p><p>**Recovery expression**: </p>|disaster|
|More than {$ZPOOL_HIGH_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME}|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) ) ) > ({$ZPOOL_HIGH_ALERT:"{#POOLNAME}"}/100)</p><p>**Recovery expression**: </p>|high|
|Zpool {#POOLNAME} is scrubbing for more than 12h on {HOST.NAME}|<p>-</p>|<p>**Expression**: max(/ZFS on Linux/zfs.zpool.scrub[{#POOLNAME}],12h)=0</p><p>**Recovery expression**: </p>|average|
|Zpool {#POOLNAME} is scrubbing for more than 24h on {HOST.NAME}|<p>-</p>|<p>**Expression**: max(/ZFS on Linux/zfs.zpool.scrub[{#POOLNAME}],24h)=0</p><p>**Recovery expression**: </p>|high|
|Zpool {#POOLNAME} is {ITEM.VALUE} on {HOST.NAME}|<p>-</p>|<p>**Expression**: find(/ZFS on Linux/zfs.zpool.health[{#POOLNAME}],,"like","ONLINE")=0</p><p>**Recovery expression**: </p>|high|
|vdev {#VDEV} has encountered {ITEM.VALUE} errors on {HOST.NAME}|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'. You may also run a zpool scrub to check if some other undetected errors are present on this vdev.</p>|<p>**Expression**: last(/ZFS on Linux/zfs.vdev.error_total[{#VDEV}])>0</p><p>**Recovery expression**: </p>|high|
|More than {$ZFS_AVERAGE_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) ) ) > (90/100)</p><p>**Recovery expression**: </p>|average|
|More than {$ZFS_DISASTER_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) ) ) > (99/100)</p><p>**Recovery expression**: </p>|disaster|
|More than {$ZFS_HIGH_ALERT}% used on dataset {#FILESETNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#FILESETNAME},used]) ) ) > (95/100)</p><p>**Recovery expression**: </p>|high|
|More than {$ZPOOL_AVERAGE_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) ) ) > (85/100)</p><p>**Recovery expression**: </p>|average|
|More than {$ZPOOL_DISASTER_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) ) ) > (99/100)</p><p>**Recovery expression**: </p>|disaster|
|More than {$ZPOOL_HIGH_ALERT}% used on zpool {#POOLNAME} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) / ( last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},available]) + last(/ZFS on Linux/zfs.get.fsinfo[{#POOLNAME},used]) ) ) > (90/100)</p><p>**Recovery expression**: </p>|high|
|Zpool {#POOLNAME} is scrubbing for more than 12h on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: max(/ZFS on Linux/zfs.zpool.scrub.status[{#POOLNAME}],12h)=0</p><p>**Recovery expression**: </p>|average|
|Zpool {#POOLNAME} is scrubbing for more than 24h on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: max(/ZFS on Linux/zfs.zpool.scrub.status[{#POOLNAME}],24h)=0</p><p>**Recovery expression**: </p>|high|
|Zpool {#POOLNAME} no scrub for over {$ZPOOL_MAX_SCRUB_INTERVAL} days on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: now() - last(/ZFS on Linux/zfs.zpool.scrub.timestamp[{#POOLNAME}],#1) > {$ZPOOL_MAX_SCRUB_INTERVAL:"{#POOLNAME}"} * 1d</p><p>**Recovery expression**: </p>|warning|
|Zpool {#POOLNAME} is resilvering on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: last(/ZFS on Linux/zfs.zpool.resilver.status[{#POOLNAME}])=0</p><p>**Recovery expression**: </p>|warning|
|Zpool {#POOLNAME} has recently resilvered on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: change(/ZFS on Linux/zfs.zpool.resilver.timestamp[{#POOLNAME}])<>0</p><p>**Recovery expression**: </p>|warning|
|Zpool {#POOLNAME} is {ITEM.VALUE} on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: find(/ZFS on Linux/zfs.zpool.health[{#POOLNAME}],,"like","ONLINE")=0</p><p>**Recovery expression**: </p>|high|
|vdev {#VDEV} has encountered {ITEM.VALUE} errors on {HOST.NAME} (LLD)|<p>This device has experienced an unrecoverable error. Determine if the device needs to be replaced. If yes, use 'zpool replace' to replace the device. If not, clear the error with 'zpool clear'. You may also run a zpool scrub to check if some other undetected errors are present on this vdev.</p>|<p>**Expression**: last(/ZFS on Linux/zfs.vdev.error_total[{#VDEV}])>0</p><p>**Recovery expression**: </p>|high|
