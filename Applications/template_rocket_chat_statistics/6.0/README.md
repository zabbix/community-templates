# App Rocket Chat

## Overview

**Zabbix Template Rocket Chat Statistics**
==========================================


Template using Zabbix for monitoring Rocket Chat Statistics via API.


**Versions**
------------


I tested this using zabbix 4.4.10 and Rocket Chat 3.5.0, but maybe it works with different versions. 


**Requirements**
----------------


Zabbix version > 4.4 because template is using HTTP agent and JSON Path.


* If you need using it in late zabbix version, I recommend https://github.com/tristanlt/zabbix-rocketchat-stats


**Installation**
----------------


* Download Zabbix template
* Import the template on Zabbix
* Add a Rocket Chat user which contains permissions to view-statistics
* Create a rocketchat api keypair  

	+ Login user
	+ Profile -> My Account -> Personal Access Token
* Create a Personal Token  

	+ Save the ID and Token, you will need this
* Create host on Zabbix and apply the template  

	+ On host configuration, modify macros{$USERAPI\_ID} and {$USERAPI\_TOKEN} with the information you saved.


## Author

Felipe Vieira

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ROCKETCHAT_URL}|<p>-</p>|`https://rocket_chat.fqdn/api`|Text macro|
|{$ROCKETCHAT_USERAPI_ID}|<p>-</p>|`ujjdjdhhhh7822232`|Text macro|
|{$ROCKETCHAT_USERAPI_TOKEN}|<p>-</p>|`gf-PAT-l_W4jhddggdggsshdhdhdhkkkjfbbdbddt332`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Rocket Chat OS Memory Total|<p>-</p>|`Dependent item`|rocketchat-stats[os.totalmem]<p>Update: 0</p>|
|Rocket Chat Channel - Total|<p>-</p>|`Dependent item`|rocketchat-stats[totalChannels]<p>Update: 0</p>|
|Rocket Chat Users - Away|<p>-</p>|`Dependent item`|rocketchat-stats[awayUsers]<p>Update: 0</p>|
|Rocket Chat Last Message Time ago|<p>Time difference between update time and last message time.</p>|`Calculated`|calc.lastMessage.timeDiff<p>Update: 2m</p>|
|Rocket Chat Livechat - Messages|<p>-</p>|`Dependent item`|rocketchat-stats[totalLivechatMessages]<p>Update: 0</p>|
|Rocket Chat Livechats - Total|<p>-</p>|`Dependent item`|rocketchat-stats[totalLivechat]<p>Update: 0</p>|
|Rocket Chat Direct - Messages|<p>-</p>|`Dependent item`|rocketchat-stats[totalDirectMessages]<p>Update: 0</p>|
|Rocket Chat OS CPU Load 1 min|<p>-</p>|`Dependent item`|rocketchat-stats[os.load.1min]<p>Update: 0</p>|
|Rocket Chat Private Group - Messages|<p>-</p>|`Dependent item`|rocketchat-stats[totalPrivateGroupMessages]<p>Update: 0</p>|
|Rocket Chat Get Stats|<p>-</p>|`HTTP agent`|rocketchat-stats<p>Update: 2m</p>|
|Rocket Chat Direct - Total|<p>-</p>|`Dependent item`|rocketchat-stats[totalDirect]<p>Update: 0</p>|
|Rocket Total Messages|<p>-</p>|`Dependent item`|rocketchat-stats[totalMessages]<p>Update: 0</p>|
|Rocket Chat OS Uptime|<p>-</p>|`Dependent item`|rocketchat-stats[os.uptime]<p>Update: 0</p>|
|Rocket Chat Last Update|<p>-</p>|`Dependent item`|rocketchat-stats[updatedAt]<p>Update: 0</p>|
|Rocket Chat OS CPU Load 15 min|<p>-</p>|`Dependent item`|rocketchat-stats[os.load.15min]<p>Update: 0</p>|
|Rocket Chat Private Group - Total|<p>-</p>|`Dependent item`|rocketchat-stats[totalPrivateGroups]<p>Update: 0</p>|
|Rocket Chat Users - Offline|<p>-</p>|`Dependent item`|rocketchat-stats[offlineUsers]<p>Update: 0</p>|
|Rocket Chat Channel - Messages|<p>-</p>|`Dependent item`|rocketchat-stats[totalChannelMessages]<p>Update: 0</p>|
|Rocket Chat Users - Total|<p>-</p>|`Dependent item`|rocketchat-stats[totalUsers]<p>Update: 0</p>|
|Rocket Chat Users - Online|<p>-</p>|`Dependent item`|rocketchat-stats[onlineUsers]<p>Update: 0</p>|
|Rocket Chat Last Message Time|<p>-</p>|`Dependent item`|rocketchat-stats[lastMessageSentAt]<p>Update: 0</p>|
|Rocket Chat Version|<p>-</p>|`Dependent item`|rocketchat-stats[version]<p>Update: 0</p>|
|Rocket Chat OS Memory Free|<p>-</p>|`Dependent item`|rocketchat-stats[os.freemem]<p>Update: 0</p>|
|Rocket Chat OS CPU Load 5 min|<p>-</p>|`Dependent item`|rocketchat-stats[os.load.5min]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

