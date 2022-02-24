# MIB XG-FIREWALL-MIB - sophos

## Overview

Used mib2template to convert oficial Sophos XG MIB to Template.


Tested on Zabbix 3.2 using a XG 105 Appliance.


 


Need to set a Macro for {$SNMP\_COMMUNITY} with the community name on the Firewall.


 


It does not contain Interface Discovery, but native SNMP Interface template does the job.



## Author

Paulo S. D. Vasques

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Disk capacity in MB|<p>Disk capacity in MB</p>|`SNMP agent`|diskCapacity<p>Update: 300</p>|
|droutingService|<p>-</p>|`SNMP agent`|droutingService<p>Update: 300</p>|
|httpHits|<p>-</p>|`SNMP agent`|httpHits<p>Update: 300</p>|
|applianceKey|<p>-</p>|`SNMP agent`|applianceKey<p>Update: 300</p>|
|avExpiryDate|<p>-</p>|`SNMP agent`|avExpiryDate<p>Update: 300</p>|
|asSubStatus|<p>-</p>|`SNMP agent`|asSubStatus<p>Update: 300</p>|
|avVersion|<p>-</p>|`SNMP agent`|avVersion<p>Update: 300</p>|
|webcatVersion|<p>-</p>|`SNMP agent`|webcatVersion<p>Update: 300</p>|
|Swap Capacity in MB|<p>Swap Capacity in MB</p>|`SNMP agent`|swapCapacity<p>Update: 300</p>|
|webcatExpiryDate|<p>-</p>|`SNMP agent`|webcatExpiryDate<p>Update: 300</p>|
|liveUsers|<p>-</p>|`SNMP agent`|liveUsers<p>Update: 300</p>|
|% cpu usage|<p>% cpu usage</p>|`SNMP agent`|cpuPercentUsage<p>Update: 300</p>|
|avService|<p>-</p>|`SNMP agent`|avService<p>Update: 300</p>|
|DataBaseService|<p>-</p>|`SNMP agent`|DataBaseService<p>Update: 300</p>|
|avSubStatus|<p>-</p>|`SNMP agent`|avSubStatus<p>Update: 300</p>|
|supportSubStatus|<p>-</p>|`SNMP agent`|supportSubStatus<p>Update: 300</p>|
|pop3Service|<p>-</p>|`SNMP agent`|pop3Service<p>Update: 300</p>|
|networkService|<p>-</p>|`SNMP agent`|networkService<p>Update: 300</p>|
|smtpHits|<p>-</p>|`SNMP agent`|smtpHits<p>Update: 300</p>|
|idpService|<p>-</p>|`SNMP agent`|idpService<p>Update: 300</p>|
|haService|<p>-</p>|`SNMP agent`|haService<p>Update: 300</p>|
|% usage of swap|<p>% usage of swap</p>|`SNMP agent`|swapPercentUsage<p>Update: 300</p>|
|apacheService|<p>-</p>|`SNMP agent`|apacheService<p>Update: 300</p>|
|pop3Hits|<p>-</p>|`SNMP agent`|pop3Hits<p>Update: 300</p>|
|asVersion|<p>-</p>|`SNMP agent`|asVersion<p>Update: 300</p>|
|sshdService|<p>-</p>|`SNMP agent`|sshdService<p>Update: 300</p>|
|applianceModel|<p>-</p>|`SNMP agent`|applianceModel<p>Update: 300</p>|
|dnsService|<p>-</p>|`SNMP agent`|dnsService<p>Update: 300</p>|
|webcatSubStatus|<p>-</p>|`SNMP agent`|webcatSubStatus<p>Update: 300</p>|
|% Disk usage|<p>% Disk usage</p>|`SNMP agent`|diskPercentUsage<p>Update: 300</p>|
|smtpService|<p>-</p>|`SNMP agent`|smtpService<p>Update: 300</p>|
|dgdService|<p>-</p>|`SNMP agent`|dgdService<p>Update: 300</p>|
|systemDate|<p>-</p>|`SNMP agent`|systemDate<p>Update: 300</p>|
|asService|<p>-</p>|`SNMP agent`|asService<p>Update: 300</p>|
|% usage of main memory|<p>% usage of main memory</p>|`SNMP agent`|memoryPercentUsage<p>Update: 300</p>|
|sslvpnService|<p>-</p>|`SNMP agent`|sslvpnService<p>Update: 300</p>|
|garnerService|<p>-</p>|`SNMP agent`|garnerService<p>Update: 300</p>|
|asExpiryDate|<p>-</p>|`SNMP agent`|asExpiryDate<p>Update: 300</p>|
|idpVersion|<p>-</p>|`SNMP agent`|idpVersion<p>Update: 300</p>|
|httpService|<p>-</p>|`SNMP agent`|httpService<p>Update: 300</p>|
|appExpiryDate|<p>-</p>|`SNMP agent`|appExpiryDate<p>Update: 300</p>|
|appRegStatus|<p>-</p>|`SNMP agent`|appRegStatus<p>Update: 300</p>|
|XG-FirewallVersion|<p>-</p>|`SNMP agent`|XG-FirewallVersion<p>Update: 300</p>|
|haMode|<p>-</p>|`SNMP agent`|haMode<p>Update: 300</p>|
|imapHits|<p>-</p>|`SNMP agent`|imapHits<p>Update: 300</p>|
|imap4Service|<p>-</p>|`SNMP agent`|imap4Service<p>Update: 300</p>|
|ftpHits|<p>-</p>|`SNMP agent`|ftpHits<p>Update: 300</p>|
|supportExpiryDate|<p>-</p>|`SNMP agent`|supportExpiryDate<p>Update: 300</p>|
|ftpService|<p>-</p>|`SNMP agent`|ftpService<p>Update: 300</p>|
|tomcatService|<p>-</p>|`SNMP agent`|tomcatService<p>Update: 300</p>|
|idpSubStatus|<p>-</p>|`SNMP agent`|idpSubStatus<p>Update: 300</p>|
|idpExpiryDate|<p>-</p>|`SNMP agent`|idpExpiryDate<p>Update: 300</p>|
|Memory capacity in MB|<p>Memory capacity in MB</p>|`SNMP agent`|memoryCapacity<p>Update: 300</p>|
|ntpService|<p>-</p>|`SNMP agent`|ntpService<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

