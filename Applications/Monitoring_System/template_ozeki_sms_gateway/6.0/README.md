# 8 Ozeki

## Overview

Ozeki SMS Gateway


Template provide server information, connection status, users and queue sizes, trigger for disconnection and filling queues and display queue sizes in graph.


Tested on zabbix 3.4



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ServiceProviderConnections|<p>-</p>|`SNMP agent`|ozeki.ServiceProviderConnectionsList<p>Update: 30s</p>|
|Users|<p>-</p>|`SNMP agent`|ozeki.UsersList<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OzekiSoftwareProduct|<p>-</p>|`SNMP agent`|ozeki.OzekiSoftwareProduct<p>Update: 30s</p>|
|Engine|<p>-</p>|`SNMP agent`|ozeki.Engine<p>Update: 30s</p>|
|LegalCopyright|<p>-</p>|`SNMP agent`|ozeki.LegalCopyright<p>Update: 30s</p>|
|InstallationDate|<p>-</p>|`SNMP agent`|ozeki.InstallationDate<p>Update: 30s</p>|
|Users|<p>-</p>|`SNMP agent`|ozeki.Users<p>Update: 30s</p>|
|Manifest|<p>-</p>|`SNMP agent`|ozeki.Manifest<p>Update: 30s</p>|
|ServiceProviderConnections|<p>-</p>|`SNMP agent`|ozeki.ServiceProviderConnections<p>Update: 30s</p>|
|ProductEmail|<p>-</p>|`SNMP agent`|ozeki.ProductEmail<p>Update: 30s</p>|
|ProductURL|<p>-</p>|`SNMP agent`|ozeki.ProductURL<p>Update: 30s</p>|
|OSVersion|<p>-</p>|`SNMP agent`|ozeki.OSVersion<p>Update: 30s</p>|
|ProductName|<p>-</p>|`SNMP agent`|ozeki.ProductName<p>Update: 30s</p>|
|CompanyName|<p>-</p>|`SNMP agent`|ozeki.CompanyName<p>Update: 30s</p>|
|OzekiNGSMSGateway|<p>-</p>|`SNMP agent`|ozeki.OzekiNGSMSGateway<p>Update: 30s</p>|
|ProductUptime|<p>-</p>|`SNMP agent`|ozeki.Uptime<p>Update: 30s</p>|
|ConnectionName $1|<p>-</p>|`SNMP agent`|ozeki.ConnectionName[{#OZEKICONNAME}]<p>Update: 30s</p><p>LLD</p>|
|ConnectionStatus $1|<p>-</p>|`SNMP agent`|ozeki.ConnectionStatus[{#OZEKICONNAME}]<p>Update: 30s</p><p>LLD</p>|
|ConnectionType $1|<p>-</p>|`SNMP agent`|ozeki.ConnectionType[{#OZEKICONNAME}]<p>Update: 30s</p><p>LLD</p>|
|DesiredConnectionStatus $1|<p>-</p>|`SNMP agent`|ozeki.DesiredConnectionStatus[{#OZEKICONNAME}]<p>Update: 30s</p><p>LLD</p>|
|ServiceProviderName $1|<p>-</p>|`SNMP agent`|ozeki.ServiceProviderName[{#OZEKICONNAME}]<p>Update: 30s</p><p>LLD</p>|
|Deleted $1|<p>-</p>|`SNMP agent`|ozeki.Deleted[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|
|Inbox $1|<p>-</p>|`SNMP agent`|ozeki.Inbox[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|
|NotSent $1|<p>-</p>|`SNMP agent`|ozeki.NotSent[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|
|Outbox $1|<p>-</p>|`SNMP agent`|ozeki.Outbox[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|
|Scheduled $1|<p>-</p>|`SNMP agent`|ozeki.Scheduled[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|
|Sent $1|<p>-</p>|`SNMP agent`|ozeki.Sent[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|
|UserConnectionStatus $1|<p>-</p>|`SNMP agent`|ozeki.UserConnectionStatus[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|
|UserMessageQueues $1|<p>-</p>|`SNMP agent`|ozeki.UserMessageQueues[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|
|UserName $1|<p>-</p>|`SNMP agent`|ozeki.UserName[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|
|UserType $1|<p>-</p>|`SNMP agent`|ozeki.UserType[{#OZEKIUSERNAME}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|RequiredConnectionNotConnected|<p>-</p>|<p>**Expression**: abs(change(/8 Ozeki/ozeki.DesiredConnectionStatus[{#OZEKICONNAME}]))<>abs(change(/8 Ozeki/ozeki.ConnectionStatus[{#OZEKICONNAME}]))</p><p>**Recovery expression**: </p>|average|
|OzekiSendQueuOverflow|<p>-</p>|<p>**Expression**: abs(change(/8 Ozeki/ozeki.NotSent[{#OZEKIUSERNAME}]))>5</p><p>**Recovery expression**: </p>|average|
|RequiredConnectionNotConnected (LLD)|<p>-</p>|<p>**Expression**: abs(change(/8 Ozeki/ozeki.DesiredConnectionStatus[{#OZEKICONNAME}]))<>abs(change(/8 Ozeki/ozeki.ConnectionStatus[{#OZEKICONNAME}]))</p><p>**Recovery expression**: </p>|average|
|OzekiSendQueuOverflow (LLD)|<p>-</p>|<p>**Expression**: abs(change(/8 Ozeki/ozeki.NotSent[{#OZEKIUSERNAME}]))>5</p><p>**Recovery expression**: </p>|average|
