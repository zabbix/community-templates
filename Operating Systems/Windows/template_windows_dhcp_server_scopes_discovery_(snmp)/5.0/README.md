# Discovery DHCP scopes

## Overview

Hello,


Using this template you'll be able to collect information about free IPs in your DHCP server scopes.


Please make sure you activated SNMP monitoring in your server and that you changed the community name in the template.


Remember to add your Zabbix server IP as a permitted host in your SNMP configuration.



## Author

Zilmar de Souza Junior

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DHCP scopes|<p>-</p>|`SNMP agent`|dhcp.scope<p>Update: 30</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of addresses that are free on scope {#IPSCOPE}|<p>-</p>|`SNMP agent`|ipfree[{#IPSCOPE}]<p>Update: 30</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|The number of addresses that are free on scope {#IPSCOPE} is low|<p>If the number of free adresses is less than 5, the trigger will be activated.</p>|<p>**Expression**: {Discovery DHCP scopes:ipfree[{#IPSCOPE}].last()}<5</p><p>**Recovery expression**: </p>|high|
|The number of addresses that are free on scope {#IPSCOPE} is low (LLD)|<p>If the number of free adresses is less than 5, the trigger will be activated.</p>|<p>**Expression**: {Discovery DHCP scopes:ipfree[{#IPSCOPE}].last()}<5</p><p>**Recovery expression**: </p>|high|
