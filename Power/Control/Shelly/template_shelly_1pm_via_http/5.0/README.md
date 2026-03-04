# Shelly 1PM

## Overview

Monitoring of almost all values the Shelly 1PM reports, except external sensors since I don't own one of those.


It has a fixed update time of 60s for all values, which might not be enough for some usecases - feel free to adjust it.



## Author

Leonard Winck

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SHELLYPWD}|<p>Password for admin user, if present</p>|`****`|Secret macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MQTT Connection State|<p>-</p>|`Dependent item`|shelly1pm.status.mqtt.connected<p>Update: 0</p>|
|Power Consumption (1m)|<p>-</p>|`Dependent item`|shelly1pm.status.meters0.counters0<p>Update: 0</p>|
|Meters Self-Check State|<p>-</p>|`Dependent item`|shelly1pm.status.meters0.is_valid<p>Update: 0</p>|
|Memory Free|<p>-</p>|`Dependent item`|shelly1pm.status.ram_free<p>Update: 0</p>|
|Total Power Consumption|<p>-</p>|`Dependent item`|shelly1pm.status.meters0.total<p>Update: 0</p>|
|Relay Overpower State|<p>-</p>|`Dependent item`|shelly1pm.status.relays0.overpower<p>Update: 0</p>|
|Temperature Self-Check State|<p>-</p>|`Dependent item`|shelly1pm.status.tmp.is_valid<p>Update: 0</p>|
|Current Temperature|<p>-</p>|`Dependent item`|shelly1pm.status.tmp.tC<p>Update: 0</p>|
|Overpower Value|<p>-</p>|`Dependent item`|shelly1pm.status.meters0.overpower<p>Update: 0</p>|
|Memory Total|<p>-</p>|`Dependent item`|shelly1pm.status.ram_total<p>Update: 0</p>|
|Update Status|<p>-</p>|`Dependent item`|shelly1pm.status.update.status<p>Update: 0</p>|
|Relay Timer Remaining|<p>-</p>|`Dependent item`|shelly1pm.status.relays0.timer_remaining<p>Update: 0</p>|
|Temperature Status|<p>-</p>|`Dependent item`|shelly1pm.status.temperature_status<p>Update: 0</p>|
|Cloud Serial Number|<p>-</p>|`Dependent item`|shelly1pm.status.serial<p>Update: 0</p>|
|Actions Skipped Count|<p>-</p>|`Dependent item`|shelly1pm.status.actions_stats.skipped<p>Update: 0</p>|
|MAC Address|<p>-</p>|`Dependent item`|shelly1pm.status.mac<p>Update: 0</p>|
|Filesystem Total|<p>-</p>|`Dependent item`|shelly1pm.status.fs_size<p>Update: 0</p>|
|Relay Timer State|<p>-</p>|`Dependent item`|shelly1pm.status.relays0.has_timer<p>Update: 0</p>|
|Relay Timer Duration|<p>-</p>|`Dependent item`|shelly1pm.status.relays0.timer_duration<p>Update: 0</p>|
|WiFi IP|<p>-</p>|`Dependent item`|shelly1pm.status.wifi_sta.ip<p>Update: 0</p>|
|Current Unixtime|<p>-</p>|`Dependent item`|shelly1pm.status.unixtime<p>Update: 0</p>|
|New Version Available|<p>-</p>|`Dependent item`|shelly1pm.status.update.new_version<p>Update: 0</p>|
|Cloud Configured State|<p>-</p>|`Dependent item`|shelly1pm.status.cloud.enabled<p>Update: 0</p>|
|Filesystem Free|<p>-</p>|`Dependent item`|shelly1pm.status.fs_free<p>Update: 0</p>|
|Current Power Consumption Time|<p>-</p>|`Dependent item`|shelly1pm.status.meters0.timestamp<p>Update: 0</p>|
|Update Availability|<p>-</p>|`Dependent item`|shelly1pm.status.update.has_update<p>Update: 0</p>|
|WiFi SSID|<p>-</p>|`Dependent item`|shelly1pm.status.wifi_sta.ssid<p>Update: 0</p>|
|Current Power Consumption|<p>-</p>|`Dependent item`|shelly1pm.status.meters0.power<p>Update: 0</p>|
|Relay State|<p>-</p>|`Dependent item`|shelly1pm.status.relays0.ison<p>Update: 0</p>|
|Input Event|<p>-</p>|`Dependent item`|shelly1pm.status.inputs0.event<p>Update: 0</p>|
|Relay Last Command Source|<p>-</p>|`Dependent item`|shelly1pm.status.relays0.source<p>Update: 0</p>|
|Configuration Changed Count|<p>-</p>|`Dependent item`|shelly1pm.status.cfg_changed_cnt<p>Update: 0</p>|
|WiFi RSSI|<p>-</p>|`Dependent item`|shelly1pm.status.wifi_sta.rssi<p>Update: 0</p>|
|Input Event Count|<p>-</p>|`Dependent item`|shelly1pm.status.inputs0.event_cnt<p>Update: 0</p>|
|Overheating State|<p>-</p>|`Dependent item`|shelly1pm.status.overtemperature<p>Update: 0</p>|
|WiFi Connection State|<p>-</p>|`Dependent item`|shelly1pm.status.wifi_sta.connected<p>Update: 0</p>|
|Input State|<p>-</p>|`Dependent item`|shelly1pm.status.inputs0.input<p>Update: 0</p>|
|Uptime|<p>-</p>|`Dependent item`|shelly1pm.status.uptime<p>Update: 0</p>|
|Cloud Connection State|<p>-</p>|`Dependent item`|shelly1pm.status.cloud.connected<p>Update: 0</p>|
|Current Version|<p>-</p>|`Dependent item`|shelly1pm.status.update.old_version<p>Update: 0</p>|
|Current Time|<p>-</p>|`Dependent item`|shelly1pm.status.time<p>Update: 0</p>|
|Status gatherer|<p>This gatherer gathers all the data for the different items from the Rest-API Interface of the Shelly device.</p>|`HTTP agent`|shelly1pm.status<p>Update: 1m</p>|
|Relay Timer Started|<p>-</p>|`Dependent item`|shelly1pm.status.relays0.timer_started<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

