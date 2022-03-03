# Shelly 3EM

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$EC_EM_CONSUMPTION}|<p>Total value on your electric company electrometer in Wh at the moment you reset Shelly 3EM data.</p>|`0`|Text macro|
|{$SHELLY_PASS}|<p>Device password, if configured</p>|`****`|Secret macro|
|{$SHELLY_USER}|<p>Device user, if configured</p>|`admin`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Electrometer C power factor|<p>-</p>|`Dependent item`|emeters-2.pf<p>Update: 0</p>|
|Relay timer started|<p>-</p>|`Dependent item`|relays-0.timer_started<p>Update: 0</p>|
|Electrometer C current|<p>-</p>|`Dependent item`|emeters-2.current<p>Update: 0</p>|
|Electrometer C power|<p>-</p>|`Dependent item`|emeters-2.power<p>Update: 0</p>|
|WiFi IP|<p>-</p>|`Dependent item`|wifi_sta.ip<p>Update: 0</p>|
|Electrometer A power|<p>-</p>|`Dependent item`|emeters-0.power<p>Update: 0</p>|
|Skipped actions|<p>-</p>|`Dependent item`|actions_stats.skipped<p>Update: 0</p>|
|Electrometer A current|<p>-</p>|`Dependent item`|emeters-0.current<p>Update: 0</p>|
|Sysflash is mounted|<p>-</p>|`Dependent item`|fs_mounted<p>Update: 0</p>|
|Electrometer C self-check|<p>-</p>|`Dependent item`|emeters-2.is_valid<p>Update: 0</p>|
|Relay timer duration|<p>-</p>|`Dependent item`|relays-0.timer_duration<p>Update: 0</p>|
|Electrometer A self-check|<p>-</p>|`Dependent item`|emeters-0.is_valid<p>Update: 0</p>|
|Cloud enabled|<p>-</p>|`Dependent item`|cloud.enabled<p>Update: 0</p>|
|Electrometer A total consumed|<p>-</p>|`Dependent item`|emeters-0.total<p>Update: 0</p>|
|Relay has timer|<p>-</p>|`Dependent item`|relays-0.has_timer<p>Update: 0</p>|
|Electrometer B current|<p>-</p>|`Dependent item`|emeters-1.current<p>Update: 0</p>|
|Electrometer N total consumed|<p>-</p>|`Dependent item`|emeters-3.total<p>Update: 0</p>|
|File system free size|<p>-</p>|`Dependent item`|fs_free<p>Update: 0</p>|
|WiFi SSID|<p>-</p>|`Dependent item`|wifi_sta.ssid<p>Update: 0</p>|
|RAM free|<p>-</p>|`Dependent item`|ram_free<p>Update: 0</p>|
|Electrometer B power factor|<p>-</p>|`Dependent item`|emeters-1.pf<p>Update: 0</p>|
|Electric company electrometer estimate|<p>Estimated value of electric company electrometer. This value may differ from real value due to device restarts or incorrect measurements. This estimate is only useful when your Shelly 3EM is measuring power consumption on the main breaker. For this value to show correct estimate, you have to take a note of how many Wh were on electric company electrometer when you reset Shelly 3EM data and put this value into macro {$EC_EM_CONSUMPTION}.</p>|`Dependent item`|ec_em_estimate<p>Update: 0</p>|
|File system total size|<p>-</p>|`Dependent item`|fs_size<p>Update: 0</p>|
|Relay overpower occurred|<p>-</p>|`Dependent item`|relays-0.overpower<p>Update: 0</p>|
|WiFi RSSI|<p>-</p>|`Dependent item`|wifi_sta.rssi<p>Update: 0</p>|
|Electrometer C total consumed|<p>-</p>|`Dependent item`|emeters-2.total<p>Update: 0</p>|
|Electrometer A total returned|<p>-</p>|`Dependent item`|emeters-0.total_returned<p>Update: 0</p>|
|Electrometer B total consumed|<p>-</p>|`Dependent item`|emeters-1.total<p>Update: 0</p>|
|Uptime|<p>-</p>|`Dependent item`|uptime<p>Update: 0</p>|
|Electrometer B voltage|<p>-</p>|`Dependent item`|emeters-1.voltage<p>Update: 0</p>|
|Relay turned on|<p>-</p>|`Dependent item`|relays-0.ison<p>Update: 0</p>|
|Electrometer N power factor|<p>-</p>|`Dependent item`|emeters-3.pf<p>Update: 0</p>|
|WiFi connected|<p>-</p>|`Dependent item`|wifi_sta.connected<p>Update: 0</p>|
|Relays last command source|<p>-</p>|`Dependent item`|relays-0.source<p>Update: 0</p>|
|Total return from last reset|<p>-</p>|`Dependent item`|total_returned<p>Update: 0</p>|
|Electrometer N power|<p>-</p>|`Dependent item`|emeters-3.power<p>Update: 0</p>|
|Relay sensor self-check|<p>-</p>|`Dependent item`|relays-0.is_valid<p>Update: 0</p>|
|Electrometer N voltage|<p>-</p>|`Dependent item`|emeters-3.voltage<p>Update: 0</p>|
|Firmware old version|<p>-</p>|`Dependent item`|update.old_version<p>Update: 0</p>|
|Update available|<p>-</p>|`Dependent item`|update.has_update<p>Update: 0</p>|
|Device time|<p>-</p>|`Dependent item`|unixtime<p>Update: 0</p>|
|Relay timer remaining|<p>-</p>|`Dependent item`|relays-0.timer_remaining<p>Update: 0</p>|
|Electrometer N current|<p>-</p>|`Dependent item`|emeters-3.current<p>Update: 0</p>|
|Electrometer N self-check|<p>-</p>|`Dependent item`|emeters-3.is_valid<p>Update: 0</p>|
|System configuration changes|<p>-</p>|`Dependent item`|cfg_changed_cnt<p>Update: 0</p>|
|Status data|<p>Collect data from Shelly device status API.</p>|`HTTP agent`|status<p>Update: 30</p>|
|Total consumption from last reset|<p>-</p>|`Dependent item`|total_consuption<p>Update: 0</p>|
|Firmware new version|<p>-</p>|`Dependent item`|update.new_version<p>Update: 0</p>|
|Electrometer A voltage|<p>-</p>|`Dependent item`|emeters-0.voltage<p>Update: 0</p>|
|Electrometer A power factor|<p>-</p>|`Dependent item`|emeters-0.pf<p>Update: 0</p>|
|Cloud connected|<p>-</p>|`Dependent item`|cloud.connected<p>Update: 0</p>|
|MQTT connected|<p>-</p>|`Dependent item`|mqtt.connected<p>Update: 0</p>|
|Electrometer N total returned|<p>-</p>|`Dependent item`|emeters-3.total_returned<p>Update: 0</p>|
|RAM total|<p>-</p>|`Dependent item`|ram_total<p>Update: 0</p>|
|Electrometer B total returned|<p>-</p>|`Dependent item`|emeters-1.total_returned<p>Update: 0</p>|
|Total power consumption|<p>-</p>|`Dependent item`|total_power<p>Update: 0</p>|
|Electrometer B self-check|<p>-</p>|`Dependent item`|emeters-1.is_valid<p>Update: 0</p>|
|Electrometer B power|<p>-</p>|`Dependent item`|emeters-1.power<p>Update: 0</p>|
|Electrometer C total returned|<p>-</p>|`Dependent item`|emeters-2.total_returned<p>Update: 0</p>|
|Electrometer C voltage|<p>-</p>|`Dependent item`|emeters-2.voltage<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

# Shelly 3EM - MQTT

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$EC_EM_CONSUMPTION}|<p>Total value on your electric company electrometer in Wh at the moment you reset Shelly 3EM data.</p>|`0`|Text macro|
|{$MQTT_BROKER_HOST}|<p>MQTT broker host</p>|`tcp://localhost:1883`|Text macro|
|{$MQTT_BROKER_PASS}|<p>MQTT broker password, if configured</p>|`****`|Secret macro|
|{$MQTT_BROKER_USER}|<p>MQTT broker user, if configured</p>|``|Text macro|
|{$MQTT_DEVICE_ID}|<p>Shelly device MQTT ID</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Relay timer remaining|<p>-</p>|`Dependent item`|relays-0.timer_remaining<p>Update: 0</p>|
|Update available|<p>-</p>|`Dependent item`|update.has_update<p>Update: 0</p>|
|WiFi SSID|<p>-</p>|`Dependent item`|wifi_sta.ssid<p>Update: 0</p>|
|Electric company electrometer estimate|<p>Estimated value of electric company electrometer. This value may differ from real value due to device restarts or incorrect measurements. This estimate is only useful when your Shelly 3EM is measuring power consumption on the main breaker. For this value to show correct estimate, you have to take a note of how many Wh were on electric company electrometer when you reset Shelly 3EM data and put this value into macro {$EC_EM_CONSUMPTION}.</p>|`Dependent item`|ec_em_estimate<p>Update: 0</p>|
|WiFi RSSI|<p>-</p>|`Dependent item`|wifi_sta.rssi<p>Update: 0</p>|
|Electrometer A power|<p>-</p>|`Dependent item`|emeters-0.power<p>Update: 0</p>|
|Sysflash is mounted|<p>-</p>|`Dependent item`|fs_mounted<p>Update: 0</p>|
|File system free size|<p>-</p>|`Dependent item`|fs_free<p>Update: 0</p>|
|Relay has timer|<p>-</p>|`Dependent item`|relays-0.has_timer<p>Update: 0</p>|
|Electrometer N total returned|<p>-</p>|`Dependent item`|emeters-3.total_returned<p>Update: 0</p>|
|Status data|<p>Collect data from Shelly device status topic.</p>|`Zabbix agent (active)`|mqtt.get[{$MQTT_BROKER_HOST},shellies/{$MQTT_DEVICE_ID}/info,{$MQTT_BROKER_USER},{$MQTT_BROKER_PASS}]<p>Update: 0</p>|
|Electrometer B total returned|<p>-</p>|`Dependent item`|emeters-1.total_returned<p>Update: 0</p>|
|Electrometer B self-check|<p>-</p>|`Dependent item`|emeters-1.is_valid<p>Update: 0</p>|
|Total power consumption|<p>-</p>|`Dependent item`|total_power<p>Update: 0</p>|
|File system total size|<p>-</p>|`Dependent item`|fs_size<p>Update: 0</p>|
|Electrometer A power factor|<p>-</p>|`Dependent item`|emeters-0.pf<p>Update: 0</p>|
|Relay sensor self-check|<p>-</p>|`Dependent item`|relays-0.is_valid<p>Update: 0</p>|
|Skipped actions|<p>-</p>|`Dependent item`|actions_stats.skipped<p>Update: 0</p>|
|Total consumption from last reset|<p>-</p>|`Dependent item`|total_consuption<p>Update: 0</p>|
|Total return from last reset|<p>-</p>|`Dependent item`|total_returned<p>Update: 0</p>|
|Electrometer A total consumed|<p>-</p>|`Dependent item`|emeters-0.total<p>Update: 0</p>|
|Electrometer N current|<p>-</p>|`Dependent item`|emeters-3.current<p>Update: 0</p>|
|Electrometer C current|<p>-</p>|`Dependent item`|emeters-2.current<p>Update: 0</p>|
|Electrometer B voltage|<p>-</p>|`Dependent item`|emeters-1.voltage<p>Update: 0</p>|
|WiFi connected|<p>-</p>|`Dependent item`|wifi_sta.connected<p>Update: 0</p>|
|Electrometer B power|<p>-</p>|`Dependent item`|emeters-1.power<p>Update: 0</p>|
|Electrometer C self-check|<p>-</p>|`Dependent item`|emeters-2.is_valid<p>Update: 0</p>|
|Electrometer C power|<p>-</p>|`Dependent item`|emeters-2.power<p>Update: 0</p>|
|Electrometer C total consumed|<p>-</p>|`Dependent item`|emeters-2.total<p>Update: 0</p>|
|Electrometer A current|<p>-</p>|`Dependent item`|emeters-0.current<p>Update: 0</p>|
|RAM total|<p>-</p>|`Dependent item`|ram_total<p>Update: 0</p>|
|Electrometer C power factor|<p>-</p>|`Dependent item`|emeters-2.pf<p>Update: 0</p>|
|RAM free|<p>-</p>|`Dependent item`|ram_free<p>Update: 0</p>|
|Electrometer B current|<p>-</p>|`Dependent item`|emeters-1.current<p>Update: 0</p>|
|Electrometer N self-check|<p>-</p>|`Dependent item`|emeters-3.is_valid<p>Update: 0</p>|
|Cloud enabled|<p>-</p>|`Dependent item`|cloud.enabled<p>Update: 0</p>|
|Uptime|<p>-</p>|`Dependent item`|uptime<p>Update: 0</p>|
|Electrometer C voltage|<p>-</p>|`Dependent item`|emeters-2.voltage<p>Update: 0</p>|
|Electrometer B total consumed|<p>-</p>|`Dependent item`|emeters-1.total<p>Update: 0</p>|
|System configuration changes|<p>-</p>|`Dependent item`|cfg_changed_cnt<p>Update: 0</p>|
|Electrometer N power|<p>-</p>|`Dependent item`|emeters-3.power<p>Update: 0</p>|
|Device time|<p>-</p>|`Dependent item`|unixtime<p>Update: 0</p>|
|WiFi IP|<p>-</p>|`Dependent item`|wifi_sta.ip<p>Update: 0</p>|
|Relay turned on|<p>-</p>|`Dependent item`|relays-0.ison<p>Update: 0</p>|
|Electrometer A total returned|<p>-</p>|`Dependent item`|emeters-0.total_returned<p>Update: 0</p>|
|Electrometer N power factor|<p>-</p>|`Dependent item`|emeters-3.pf<p>Update: 0</p>|
|Electrometer N voltage|<p>-</p>|`Dependent item`|emeters-3.voltage<p>Update: 0</p>|
|Electrometer N total consumed|<p>-</p>|`Dependent item`|emeters-3.total<p>Update: 0</p>|
|Electrometer C total returned|<p>-</p>|`Dependent item`|emeters-2.total_returned<p>Update: 0</p>|
|Relay timer duration|<p>-</p>|`Dependent item`|relays-0.timer_duration<p>Update: 0</p>|
|Cloud connected|<p>-</p>|`Dependent item`|cloud.connected<p>Update: 0</p>|
|Relay timer started|<p>-</p>|`Dependent item`|relays-0.timer_started<p>Update: 0</p>|
|Relays last command source|<p>-</p>|`Dependent item`|relays-0.source<p>Update: 0</p>|
|Firmware old version|<p>-</p>|`Dependent item`|update.old_version<p>Update: 0</p>|
|Electrometer A voltage|<p>-</p>|`Dependent item`|emeters-0.voltage<p>Update: 0</p>|
|Relay overpower occurred|<p>-</p>|`Dependent item`|relays-0.overpower<p>Update: 0</p>|
|Electrometer A self-check|<p>-</p>|`Dependent item`|emeters-0.is_valid<p>Update: 0</p>|
|Electrometer B power factor|<p>-</p>|`Dependent item`|emeters-1.pf<p>Update: 0</p>|
|MQTT connected|<p>-</p>|`Dependent item`|mqtt.connected<p>Update: 0</p>|
|Firmware new version|<p>-</p>|`Dependent item`|update.new_version<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

# Shelly Motion

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SHELLY_PASS}|<p>Device password, if configured</p>|`****`|Secret macro|
|{$SHELLY_USER}|<p>Device user, if configured</p>|`admin`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status data|<p>Collect data from Shelly device status API.</p>|`HTTP agent`|status<p>Update: 30</p>|
|Lux illumination|<p>-</p>|`Dependent item`|lux.illumination<p>Update: 0</p>|
|RAM total|<p>-</p>|`Dependent item`|ram_total<p>Update: 0</p>|
|MQTT connected|<p>-</p>|`Dependent item`|mqtt.connected<p>Update: 0</p>|
|RAM free|<p>-</p>|`Dependent item`|ram_free<p>Update: 0</p>|
|WiFi connected|<p>-</p>|`Dependent item`|wifi_sta.connected<p>Update: 0</p>|
|WiFi IP|<p>-</p>|`Dependent item`|wifi_sta.ip<p>Update: 0</p>|
|File system free size|<p>-</p>|`Dependent item`|fs_free<p>Update: 0</p>|
|Firmware new version|<p>-</p>|`Dependent item`|update.new_version<p>Update: 0</p>|
|Cloud connected|<p>-</p>|`Dependent item`|cloud.connected<p>Update: 0</p>|
|System configuration changes|<p>-</p>|`Dependent item`|cfg_changed_cnt<p>Update: 0</p>|
|Update available|<p>-</p>|`Dependent item`|update.has_update<p>Update: 0</p>|
|Battery percentage|<p>-</p>|`Dependent item`|bat.value<p>Update: 0</p>|
|Tamper detection|<p>-</p>|`Dependent item`|sensor.vibration<p>Update: 0</p>|
|Device time|<p>-</p>|`Dependent item`|unixtime<p>Update: 0</p>|
|Cloud enabled|<p>-</p>|`Dependent item`|cloud.enabled<p>Update: 0</p>|
|WiFi SSID|<p>-</p>|`Dependent item`|wifi_sta.ssid<p>Update: 0</p>|
|File system total size|<p>-</p>|`Dependent item`|fs_size<p>Update: 0</p>|
|Motion sensor active|<p>-</p>|`Dependent item`|sensor.active<p>Update: 0</p>|
|Firmware old version|<p>-</p>|`Dependent item`|update.old_version<p>Update: 0</p>|
|Motion detection|<p>-</p>|`Dependent item`|sensor.motion<p>Update: 0</p>|
|Charger connected|<p>-</p>|`Dependent item`|charger<p>Update: 0</p>|
|Uptime|<p>-</p>|`Dependent item`|uptime<p>Update: 0</p>|
|WiFi RSSI|<p>-</p>|`Dependent item`|wifi_sta.rssi<p>Update: 0</p>|
|Lux sensor self-check|<p>-</p>|`Dependent item`|lux.is_valid<p>Update: 0</p>|
|Lux value|<p>-</p>|`Dependent item`|lux.value<p>Update: 0</p>|
|Motion sensor self-check|<p>-</p>|`Dependent item`|sensor.is_valid<p>Update: 0</p>|
|Skipped actions|<p>-</p>|`Dependent item`|actions_stats.skipped<p>Update: 0</p>|
|Battery voltage|<p>-</p>|`Dependent item`|bat.voltage<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

# Shelly Motion - MQTT

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MQTT_BROKER_HOST}|<p>MQTT broker host</p>|`tcp://localhost:1883`|Text macro|
|{$MQTT_BROKER_PASS}|<p>MQTT broker password, if configured</p>|`****`|Secret macro|
|{$MQTT_BROKER_USER}|<p>MQTT broker user, if configured</p>|``|Text macro|
|{$MQTT_DEVICE_ID}|<p>Shelly device MQTT ID</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Lux illumination|<p>-</p>|`Dependent item`|lux.illumination<p>Update: 0</p>|
|Firmware new version|<p>-</p>|`Dependent item`|update.new_version<p>Update: 0</p>|
|Update available|<p>-</p>|`Dependent item`|update.has_update<p>Update: 0</p>|
|Firmware old version|<p>-</p>|`Dependent item`|update.old_version<p>Update: 0</p>|
|Cloud connected|<p>-</p>|`Dependent item`|cloud.connected<p>Update: 0</p>|
|WiFi RSSI|<p>-</p>|`Dependent item`|wifi_sta.rssi<p>Update: 0</p>|
|WiFi connected|<p>-</p>|`Dependent item`|wifi_sta.connected<p>Update: 0</p>|
|WiFi SSID|<p>-</p>|`Dependent item`|wifi_sta.ssid<p>Update: 0</p>|
|RAM free|<p>-</p>|`Dependent item`|ram_free<p>Update: 0</p>|
|WiFi IP|<p>-</p>|`Dependent item`|wifi_sta.ip<p>Update: 0</p>|
|Cloud enabled|<p>-</p>|`Dependent item`|cloud.enabled<p>Update: 0</p>|
|Lux sensor self-check|<p>-</p>|`Dependent item`|lux.is_valid<p>Update: 0</p>|
|Uptime|<p>-</p>|`Dependent item`|uptime<p>Update: 0</p>|
|Skipped actions|<p>-</p>|`Dependent item`|actions_stats.skipped<p>Update: 0</p>|
|Motion detection|<p>-</p>|`Dependent item`|sensor.motion<p>Update: 0</p>|
|Battery voltage|<p>-</p>|`Dependent item`|bat.voltage<p>Update: 0</p>|
|MQTT connected|<p>-</p>|`Dependent item`|mqtt.connected<p>Update: 0</p>|
|Lux value|<p>-</p>|`Dependent item`|lux.value<p>Update: 0</p>|
|File system total size|<p>-</p>|`Dependent item`|fs_size<p>Update: 0</p>|
|Motion sensor active|<p>-</p>|`Dependent item`|sensor.active<p>Update: 0</p>|
|Status data|<p>Collect data from Shelly device status topic.</p>|`Zabbix agent (active)`|mqtt.get[{$MQTT_BROKER_HOST},shellies/{$MQTT_DEVICE_ID}/info,{$MQTT_BROKER_USER},{$MQTT_BROKER_PASS}]<p>Update: 0</p>|
|RAM total|<p>-</p>|`Dependent item`|ram_total<p>Update: 0</p>|
|Motion sensor self-check|<p>-</p>|`Dependent item`|sensor.is_valid<p>Update: 0</p>|
|Charger connected|<p>-</p>|`Dependent item`|charger<p>Update: 0</p>|
|Device time|<p>-</p>|`Dependent item`|unixtime<p>Update: 0</p>|
|Battery percentage|<p>-</p>|`Dependent item`|bat.value<p>Update: 0</p>|
|System configuration changes|<p>-</p>|`Dependent item`|cfg_changed_cnt<p>Update: 0</p>|
|Tamper detection|<p>-</p>|`Dependent item`|sensor.vibration<p>Update: 0</p>|
|File system free size|<p>-</p>|`Dependent item`|fs_free<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

# Shelly Plug and Plug-S

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SHELLY_PASS}|<p>Device password, if configured</p>|`****`|Secret macro|
|{$SHELLY_USER}|<p>Device user, if configured</p>|`admin`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status data|<p>Collect data from Shelly device status API.</p>|`HTTP agent`|status<p>Update: 30</p>|
|MQTT connected|<p>-</p>|`Dependent item`|mqtt.connected<p>Update: 0</p>|
|Temperature in Fahrenheit|<p>-</p>|`Dependent item`|tmp.tF<p>Update: 0</p>|
|Electrometer total consumed|<p>-</p>|`Dependent item`|meters-0.total<p>Update: 0</p>|
|Electrometer power|<p>-</p>|`Dependent item`|meters-0.power<p>Update: 0</p>|
|Firmware new version|<p>-</p>|`Dependent item`|update.new_version<p>Update: 0</p>|
|Temperature self-check|<p>-</p>|`Dependent item`|tmp.is_valid<p>Update: 0</p>|
|Firmware old version|<p>-</p>|`Dependent item`|update.old_version<p>Update: 0</p>|
|WiFi SSID|<p>-</p>|`Dependent item`|wifi_sta.ssid<p>Update: 0</p>|
|Cloud enabled|<p>-</p>|`Dependent item`|cloud.enabled<p>Update: 0</p>|
|Cloud connected|<p>-</p>|`Dependent item`|cloud.connected<p>Update: 0</p>|
|Relay overpower occurred|<p>-</p>|`Dependent item`|relays-0.overpower<p>Update: 0</p>|
|Temperature in Celsius|<p>-</p>|`Dependent item`|tmp.tC<p>Update: 0</p>|
|File system free size|<p>-</p>|`Dependent item`|fs_free<p>Update: 0</p>|
|WiFi IP|<p>-</p>|`Dependent item`|wifi_sta.ip<p>Update: 0</p>|
|RAM total|<p>-</p>|`Dependent item`|ram_total<p>Update: 0</p>|
|Skipped actions|<p>-</p>|`Dependent item`|actions_stats.skipped<p>Update: 0</p>|
|Relay has timer|<p>-</p>|`Dependent item`|relays-0.has_timer<p>Update: 0</p>|
|Uptime|<p>-</p>|`Dependent item`|uptime<p>Update: 0</p>|
|WiFi connected|<p>-</p>|`Dependent item`|wifi_sta.connected<p>Update: 0</p>|
|RAM free|<p>-</p>|`Dependent item`|ram_free<p>Update: 0</p>|
|System configuration changes|<p>-</p>|`Dependent item`|cfg_changed_cnt<p>Update: 0</p>|
|Electrometer self-check|<p>-</p>|`Dependent item`|meters-0.is_valid<p>Update: 0</p>|
|Relay turned on|<p>-</p>|`Dependent item`|relays-0.ison<p>Update: 0</p>|
|Update available|<p>-</p>|`Dependent item`|update.has_update<p>Update: 0</p>|
|Relay timer duration|<p>-</p>|`Dependent item`|relays-0.timer_duration<p>Update: 0</p>|
|Device overtemperature occurred|<p>-</p>|`Dependent item`|overtemperature<p>Update: 0</p>|
|Relays last command source|<p>-</p>|`Dependent item`|relays-0.source<p>Update: 0</p>|
|WiFi RSSI|<p>-</p>|`Dependent item`|wifi_sta.rssi<p>Update: 0</p>|
|File system total size|<p>-</p>|`Dependent item`|fs_size<p>Update: 0</p>|
|Relay timer started|<p>-</p>|`Dependent item`|relays-0.timer_started<p>Update: 0</p>|
|Electrometer overpower occurred|<p>-</p>|`Dependent item`|meters-0.overpower<p>Update: 0</p>|
|Device time|<p>-</p>|`Dependent item`|unixtime<p>Update: 0</p>|
|Relay timer remaining|<p>-</p>|`Dependent item`|relays-0.timer_remaining<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

# Shelly Plug and Plug-S - MQTT

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Overview

List of supported Shelly devices:


* Shelly 3EM
* Shelly Plug and Plug-S
* Shelly Motion
* more to come (I hope)...


Each device has two templates to choose from, one is using HTTP calls to collect device information from API status page and other is collecting device information from MQTT broker "shellies/*/info" topic. Templates were tested and created on Zabbix version 5.4 but some other versions will most likely work as well.


For more information and configuration information see [README.md](https://github.com/UniverseDevel/zabbix-templates/tree/main/shelly) at GitHub repo. All templates can be downloaded here as a single file or separate templates are available on GitHub.



## Author

Martin Suchy

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MQTT_BROKER_HOST}|<p>MQTT broker host</p>|`tcp://localhost:1883`|Text macro|
|{$MQTT_BROKER_PASS}|<p>MQTT broker password, if configured</p>|`****`|Secret macro|
|{$MQTT_BROKER_USER}|<p>MQTT broker user, if configured</p>|``|Text macro|
|{$MQTT_DEVICE_ID}|<p>Shelly device MQTT ID</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device time|<p>-</p>|`Dependent item`|unixtime<p>Update: 0</p>|
|Status data|<p>Collect data from Shelly device status topic.</p>|`Zabbix agent (active)`|mqtt.get[{$MQTT_BROKER_HOST},shellies/{$MQTT_DEVICE_ID}/info,{$MQTT_BROKER_USER},{$MQTT_BROKER_PASS}]<p>Update: 0</p>|
|Relay timer duration|<p>-</p>|`Dependent item`|relays-0.timer_duration<p>Update: 0</p>|
|Relay timer remaining|<p>-</p>|`Dependent item`|relays-0.timer_remaining<p>Update: 0</p>|
|File system total size|<p>-</p>|`Dependent item`|fs_size<p>Update: 0</p>|
|Electrometer self-check|<p>-</p>|`Dependent item`|meters-0.is_valid<p>Update: 0</p>|
|Relays last command source|<p>-</p>|`Dependent item`|relays-0.source<p>Update: 0</p>|
|Skipped actions|<p>-</p>|`Dependent item`|actions_stats.skipped<p>Update: 0</p>|
|MQTT connected|<p>-</p>|`Dependent item`|mqtt.connected<p>Update: 0</p>|
|Update available|<p>-</p>|`Dependent item`|update.has_update<p>Update: 0</p>|
|Relay has timer|<p>-</p>|`Dependent item`|relays-0.has_timer<p>Update: 0</p>|
|Cloud enabled|<p>-</p>|`Dependent item`|cloud.enabled<p>Update: 0</p>|
|Relay overpower occurred|<p>-</p>|`Dependent item`|relays-0.overpower<p>Update: 0</p>|
|File system free size|<p>-</p>|`Dependent item`|fs_free<p>Update: 0</p>|
|Cloud connected|<p>-</p>|`Dependent item`|cloud.connected<p>Update: 0</p>|
|Uptime|<p>-</p>|`Dependent item`|uptime<p>Update: 0</p>|
|Device overtemperature occurred|<p>-</p>|`Dependent item`|overtemperature<p>Update: 0</p>|
|Electrometer overpower occurred|<p>-</p>|`Dependent item`|meters-0.overpower<p>Update: 0</p>|
|Electrometer power|<p>-</p>|`Dependent item`|meters-0.power<p>Update: 0</p>|
|WiFi IP|<p>-</p>|`Dependent item`|wifi_sta.ip<p>Update: 0</p>|
|Temperature in Celsius|<p>-</p>|`Dependent item`|tmp.tC<p>Update: 0</p>|
|Firmware new version|<p>-</p>|`Dependent item`|update.new_version<p>Update: 0</p>|
|WiFi SSID|<p>-</p>|`Dependent item`|wifi_sta.ssid<p>Update: 0</p>|
|System configuration changes|<p>-</p>|`Dependent item`|cfg_changed_cnt<p>Update: 0</p>|
|RAM total|<p>-</p>|`Dependent item`|ram_total<p>Update: 0</p>|
|RAM free|<p>-</p>|`Dependent item`|ram_free<p>Update: 0</p>|
|Temperature in Fahrenheit|<p>-</p>|`Dependent item`|tmp.tF<p>Update: 0</p>|
|Relay turned on|<p>-</p>|`Dependent item`|relays-0.ison<p>Update: 0</p>|
|Electrometer total consumed|<p>-</p>|`Dependent item`|meters-0.total<p>Update: 0</p>|
|WiFi connected|<p>-</p>|`Dependent item`|wifi_sta.connected<p>Update: 0</p>|
|Temperature self-check|<p>-</p>|`Dependent item`|tmp.is_valid<p>Update: 0</p>|
|Relay timer started|<p>-</p>|`Dependent item`|relays-0.timer_started<p>Update: 0</p>|
|WiFi RSSI|<p>-</p>|`Dependent item`|wifi_sta.rssi<p>Update: 0</p>|
|Firmware old version|<p>-</p>|`Dependent item`|update.old_version<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

