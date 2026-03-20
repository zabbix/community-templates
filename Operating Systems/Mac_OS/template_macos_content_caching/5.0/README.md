# macOS Content Cache

## Description

Runtime stats and storage monitoring for macOS High Sierra Caching Service.

## Overview

With the release of macOS 10.13 High Sierra, Apple have made a big change to their App and iCloud content caching services. This function used to be part of their add-on macOS Server package, but with 10.13 they've moved the feature into the regular macOS operating system. This means that any Macintosh computer running 10.13 High Sierra can serve as a content cache for a local network.


The old macOS Server version had fancy logs and graphs that allowed you to monitor cahing performance and activity to keep an eye on the efficacy and health of the service. When they moved it all to regular macOS all that stuff disappeared. It's basically just an on/off checkbox.


Instead, there's just a command-line tool that outputs the raw data from the service. You can see the stats by running `AssetCacheManagerUtil status` from a Terminal window.


This template parses the JSON output of AssetCacheManagerUtil for monitoring in Zabbix.


Requires Zabbix 3.4 and RemoteCommands=1 in the Zabbix Agent.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Cache Limit|<p>Content Caching configured maximum storage (bytes)</p>|`Dependent item`|contentcache.cachelimit<p>Update: 0</p>|
|Cache Hit Rate|<p>Ratio of cached data to uncached data sent to clients as a percentage (greater than 100% is possible)</p>|`Calculated`|contentcache.total.hitrate<p>Update: 60s</p>|
|Stored: Books|<p>Amount of data currently in cache for "Books"</p>|`Dependent item`|contentcache.details.books<p>Update: 0</p>|
|Stored: iCloud|<p>Amount of data currently in cache for "iCloud"</p>|`Dependent item`|contentcache.details.icloud<p>Update: 0</p>|
|Active|<p>Content Caching is running (true or false)</p>|`Dependent item`|contentcache.active<p>Update: 0</p>|
|Stored: Other|<p>Amount of data currently in cache for "Other"</p>|`Dependent item`|contentcache.details.other<p>Update: 0</p>|
|iCloud Content Used|<p>-</p>|`Dependent item`|contentcache.icloudused<p>Update: 0</p>|
|Total Stored from Origin|<p>Total data downloaded from Apple's servers</p>|`Dependent item`|contentcache.total.storedfromorigin<p>Update: 0</p>|
|Total Returned to Clients|<p>Total data returned to clients</p>|`Dependent item`|contentcache.total.returnedtoclients<p>Update: 0</p>|
|Cache Used|<p>Content Caching storage in use</p>|`Dependent item`|contentcache.cacheused<p>Update: 0</p>|
|Bytes Imported|<p>Bytes Imported by Caching Service</p>|`Dependent item`|contentcache.bytes.imported<p>Update: 0</p>|
|Content Cache Stats|<p>-</p>|`Zabbix agent (active)`|system.run[/usr/bin/AssetCacheManagerUtil status --json 2> /dev/null]<p>Update: 60s</p>|
|Stored: iOS Software|<p>Amount of data currently in cache for "iOS Software"</p>|`Dependent item`|contentcache.details.ios<p>Update: 0</p>|
|Server GUID|<p>Apple-generated server GUID</p>|`Dependent item`|contentcache.guid<p>Update: 0</p>|
|iCloud Content Free|<p>-</p>|`Dependent item`|contentcache.icloudfree<p>Update: 0</p>|
|Registered|<p>Content Caching is registered with Apple's servers (true or false)</p>|`Dependent item`|contentcache.registered<p>Update: 0</p>|
|iCloud Content Limit|<p>-</p>|`Dependent item`|contentcache.icloudlimit<p>Update: 0</p>|
|Stored: macOS Software|<p>Amount of data currently in cache for "macOS Software"</p>|`Dependent item`|contentcache.details.macos<p>Update: 0</p>|
|Startup Status|<p>Startup Status (normally "OK")</p>|`Dependent item`|contentcache.startupstatus<p>Update: 0</p>|
|Total Cached Data Returned to Clients|<p>Total data returned to clients from cache</p>|`Calculated`|contentcache.total.cacheddatareturned<p>Update: 60s</p>|
|Activated|<p>Content Caching is enabled (true or false)</p>|`Dependent item`|contentcache.activated<p>Update: 0</p>|
|Bytes Stored from Origin|<p>Download rate (bytes per second) from Apple's app and iCloud servers</p>|`Dependent item`|contentcache.bytes.storedfromorigin<p>Update: 0</p>|
|Bytes Returned to Clients|<p>Download rate (bytes per second) to local macOS and iOS clients</p>|`Dependent item`|contentcache.bytes.returnedtoclients<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

