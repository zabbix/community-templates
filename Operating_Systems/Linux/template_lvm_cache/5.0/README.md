# LVM Cache

## Description

LVM cache monitoring Details in kernel documentation https://www.kernel.org/doc/Documentation/device-mapper/cache.txt

## Overview

LVM Cache monitoring template.
==============================


 allows you to evaluate the efficiency of caching by the built-in dm-cache mechanism.


**What do these values mean?**
------------------------------


Details about monitored values described in Linux Kernel Documentation <https://www.kernel.org/doc/Documentation/device-mapper/cache.txt>


**Usage**
---------


1. Put file lvmcache.conf to /etc/zabbix/zabbix\_agent.d/
2. Put file sudoers\_lvmcache to /etc/sudoers.d/ (you need `sudo` program installed)
3. Put file vmcache to /etc/zabbix/scripts/. Then you can execut this file and test. This script produces JSON output.
4. Import the [`lvmcache_template.xml`](https://github.com/pavlozt/somezabbixtemplates/blob/master/lvmcache/lvmcache_template.xml) into your Zabbix server (click on the `Raw` button to download)
5. Add the template to your host
6. Check if new data arrives at Last Data section and Graphs.


This script assumes that you have **ONLY ONE caching device** and polls the first device. Therefore, it does not require configuration and specifying a device name. Working with disks implies elevated privileges and therefore you need do not forget about sudoers\_zabbix\_lvmcache file.


**Commands for debugging**
--------------------------


* dmsetup status
* /etc/zabbix/scripts/lvmcache
* zabbix\_get -s 192.168.1.1 -k 'lvmcache.raw' (on zabbix server or zabbix proxy)


## Author

pavlozt

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|LVM meta cache usage|<p>-</p>|`Calculated`|lvmcache.metausage<p>Update: 3m</p>|
|LVM data cache usage|<p>-</p>|`Calculated`|lvmcache.usage<p>Update: 3m</p>|
|used_metadata_blocks|<p>-</p>|`Dependent item`|lvmcache.used_metadata_blocks<p>Update: 0</p>|
|demotions|<p>-</p>|`Dependent item`|lvmcache.demotions<p>Update: 0</p>|
|read_hits|<p>-</p>|`Dependent item`|lvmcache.read_hits<p>Update: 0</p>|
|write_misses|<p>-</p>|`Dependent item`|lvmcache.write_misses<p>Update: 0</p>|
|lvm raw data|<p>-</p>|`Zabbix agent`|lvmcache.raw<p>Update: 3m</p>|
|dirty|<p>-</p>|`Dependent item`|lvmcache.dirty<p>Update: 0</p>|
|write_hits|<p>-</p>|`Dependent item`|lvmcache.write_hits<p>Update: 0</p>|
|total_metadata_blocks|<p>-</p>|`Dependent item`|lvmcache.total_metadata_blocks<p>Update: 0</p>|
|promotions|<p>-</p>|`Dependent item`|lvmcache.promotions<p>Update: 0</p>|
|used_cache_blocks|<p>-</p>|`Dependent item`|lvmcache.used_cache_blocks<p>Update: 0</p>|
|total_cache_blocks|<p>-</p>|`Dependent item`|lvmcache.total_cache_blocks<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

