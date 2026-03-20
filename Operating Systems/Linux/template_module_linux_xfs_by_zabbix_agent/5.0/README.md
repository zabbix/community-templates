# Module Linux XFS by Zabbix agent

## Overview

I needed a template for monitoring XFS project quotas. This is only used with Zabbix 5 but it may work on older/newer versions with little tweaks.


Requires `jq`, `grep`, `awk` and `sudo` configuration.


I needed to use `grep` because of the slashes in XFS project paths. Please comment if you know a way to resolve the issue with only `awk` let me know.


Create file /etc/zabbix/zabbix\_agentd.d/template\_linux\_xfs.conf with contents:



```
UserParameter=xfs.quota.projects, awk -F':' '{ printf "{\"{#XFSNAME}\":\"%s\"}\n",$2 }' /etc/projects | jq --slurp 'map(select(. != ""))'
UserParameter=xfs.quota.project.used[*], sudo xfs\_quota -c 'df -N' | grep ' $1$$' | awk '{print $$3*1024}'
UserParameter=xfs.quota.project.total[*], sudo xfs\_quota -c 'df -N' | grep ' $1$$' | awk '{print $$2*1024}'
UserParameter=xfs.quota.project.pused[*], sudo xfs\_quota -c 'df -N' | grep ' $1$$' | awk '{print +$$5}'
UserParameter=xfs.quota.project.pfree[*], sudo xfs\_quota -c 'df -Ni' |grep ' $1$$' | awk '{print 100-$5}'

```

  
Create sudoers file /etc/sudoers.d/zabbix\_extra with contents:



```
Cmnd\_Alias XFS\_QUOTA = /usr/sbin/xfs\_quota -c df -N, /usr/sbin/xfs\_quota -c df -Ni
zabbix ALL = (ALL) NOPASSWD: XFS\_QUOTA

```

  
You can test if sudo is working by trying it:



```
# su - zabbix -s /bin/bash -c "sudo /usr/sbin/xfs\_quota -c 'df -N'"

```

  
and



```
# su - zabbix -s /bin/bash -c "sudo /usr/sbin/xfs\_quota -c 'df -N'"

```

  
Good luck!  
Evren Yurtesen



## Author

Evren Yurtesen

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$XFS.PROJECT.PUSED.MAX.CRIT}|<p>-</p>|`90`|Text macro|
|{$XFS.PROJECT.PUSED.MAX.WARN}|<p>-</p>|`80`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|XFS project discovery|<p>Discovery of XFS projects using /etc/projects file</p>|`Zabbix agent`|xfs.quota.projects<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#XFSNAME}: Space utilization|<p>-</p>|`Zabbix agent`|xfs.quota.project.pused[{#XFSNAME}]<p>Update: 1m</p><p>LLD</p>|
|{#XFSNAME}: Total space|<p>-</p>|`Zabbix agent`|xfs.quota.project.total[{#XFSNAME}]<p>Update: 1m</p><p>LLD</p>|
|{#XFSNAME}: Used space|<p>-</p>|`Zabbix agent`|xfs.quota.project.used[{#XFSNAME}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#XFSNAME}: Disk space is critically low (used > {$XFS.PROJECT.PUSED.MAX.CRIT:"{#XFSNAME}"}%)|<p>Two conditions should match: First, space utilization should be above {$XFS.PROJECT.PUSED.MAX.CRIT:"{#FSNAME}"}. Second condition should be one of the following: - The project free space is less than 5G. - The project will be full in less than 24 hours.</p>|<p>**Expression**: {Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].last()}>90 and (({Module Linux XFS by Zabbix agent:xfs.quota.project.total[{#XFSNAME}].last()}-{Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].last()})<5G or {Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].timeleft(1h,,100)}<1d)</p><p>**Recovery expression**: </p>|average|
|{#XFSNAME}: Disk space is low (used > {$XFS.PROJECT.PUSED.MAX.WARN:"{#XFSNAME}"}%)|<p>Two conditions should match: First, space utilization should be above {$XFS.PROJECT.PUSED.MAX.WARN:"{#XFSNAME}"}. Second condition should be one of the following: - The project free space is less than 10G. - The project will be full in less than 24 hours.</p>|<p>**Expression**: {Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].last()}>80 and (({Module Linux XFS by Zabbix agent:xfs.quota.project.total[{#XFSNAME}].last()}-{Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].last()})<10G or {Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].timeleft(1h,,100)}<1d)</p><p>**Recovery expression**: </p>|warning|
|{#XFSNAME}: Disk space is critically low (used > {$XFS.PROJECT.PUSED.MAX.CRIT:"{#XFSNAME}"}%) (LLD)|<p>Two conditions should match: First, space utilization should be above {$XFS.PROJECT.PUSED.MAX.CRIT:"{#FSNAME}"}. Second condition should be one of the following: - The project free space is less than 5G. - The project will be full in less than 24 hours.</p>|<p>**Expression**: {Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].last()}>90 and (({Module Linux XFS by Zabbix agent:xfs.quota.project.total[{#XFSNAME}].last()}-{Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].last()})<5G or {Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].timeleft(1h,,100)}<1d)</p><p>**Recovery expression**: </p>|average|
|{#XFSNAME}: Disk space is low (used > {$XFS.PROJECT.PUSED.MAX.WARN:"{#XFSNAME}"}%) (LLD)|<p>Two conditions should match: First, space utilization should be above {$XFS.PROJECT.PUSED.MAX.WARN:"{#XFSNAME}"}. Second condition should be one of the following: - The project free space is less than 10G. - The project will be full in less than 24 hours.</p>|<p>**Expression**: {Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].last()}>80 and (({Module Linux XFS by Zabbix agent:xfs.quota.project.total[{#XFSNAME}].last()}-{Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].last()})<10G or {Module Linux XFS by Zabbix agent:xfs.quota.project.pused[{#XFSNAME}].timeleft(1h,,100)}<1d)</p><p>**Recovery expression**: </p>|warning|
