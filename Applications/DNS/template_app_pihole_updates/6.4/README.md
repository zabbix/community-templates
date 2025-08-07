# Template_App_PiHole_Updates
Checks your local pihole instance for updates in the three major components
# Author
Todd Blake
# Requirements:
* Zabbix version 6.4 or later
* Pi-Hole
# Installation:
1. Import the Template_App_PiHole_Updates.yaml template into your Zabbix instance (Configuration --> Templates --> Import), and apply the template to a host
2. Set the {$WEBPASSWORD} macro to your pihole API key.
## Macros used

|Macro|Default Value|Description|
|-----|-------------|-----------|
|{$WEBPASSWORD}|N/A|Your pihole API key|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|API_UpdatesRaw|The raw JSON from the versions API call|HTTP Agent|json.pihole.updates|
|Updates - Core|Parsed out status for updates to pihole core|Dependent item|json.pihole.updates.core|
|Updates - FTL|Parsed out status for updates to pihole core|Dependent item|json.pihole.updates.ftl|
|Updates - Web|Parsed out status for updates to pihole core|Dependent item|json.pihole.updates.web|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Pi-Hole Update Available - Core|Updates available to pihole - Core|last(/Template App Pi-Hole - Updates/json.pihole.updates.core)=1|Warning|
|Pi-Hole Update Available - FTL|Updates available to pihole - Core|last(/Template App Pi-Hole - Updates/json.pihole.updates.ftl)=1|Warning|
|Pi-Hole Update Available - Web|Updates available to pihole - Core|last(/Template App Pi-Hole - Updates/json.pihole.updates.web)=1|Warning|
