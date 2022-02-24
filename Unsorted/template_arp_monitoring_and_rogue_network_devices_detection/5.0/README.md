# ARP Monitoring

## Description

Rafael Gustavo Gassner 02/2021 This script activelly scans arp and sends to zabbix server using zabbix_sender. arp-scan should be installed and interfaces variable should be configured for your environment. You will want to run every 10 minutes or so, using crontab. First run(s) might not populate data, since LLD items are still beeing created in zabbix server. With the script and template, you will be able to: - Detect newly connected devices on the network. - Have a history of which macs were used by which ips and vice versa. - Detect if there are multiple ips associated to the same mac. - Detect if there are multiple macs associated to the same ip address. - Identify the active period on the network for each device. Since this is designed for a small environment, the trigger for new device has no recovery expression, and should be manually disabled. You can configure the "new device" trigger disabled for initial run. After that you could disable each trigger mannualy when you have recognized the new device as not beeing a rogue one. In the zabbix template, "Allowed hosts" variable should be configured for your environment in item prototypes and in discovery rule.

## Overview

 


This script activelly scans arp and sends to zabbix server using zabbix\_sender.


arp-scan should be installed and interfaces variable should be configured for your environment.


You will want to run every 10 minutes or so, using crontab.


First run(s) might not populate data, since LLD items are still beeing created in zabbix server.


With the script and template, you will be able to:


* Detect newly connected devices on the network.
* Have a history of which macs were used by which ips and vice versa.
* Detect if there are multiple ips associated to the same mac.
* Detect if there are multiple macs associated to the same ip address.
* Identify the active period on the network for each device.


Since this is designed for a small environment, the trigger for new device has no recovery expression, and should be manually disabled.


<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Ar

## Author

Rafael Gustavo Gassner

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Address discovery|<p>-</p>|`Zabbix trapper`|arp.discovery<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Ip address count for mac {#HWADDRESS}|<p>-</p>|`Zabbix trapper`|arp.ipCount[{#HWADDRESS}]<p>Update: 0</p><p>LLD</p>|
|Mac(s) associated with IP {#IPADDRESS}|<p>-</p>|`Zabbix trapper`|arp.ipMacs[{#IPADDRESS}]<p>Update: 0</p><p>LLD</p>|
|Mac address count for IP {#IPADDRESS}|<p>-</p>|`Zabbix trapper`|arp.macCount[{#IPADDRESS}]<p>Update: 0</p><p>LLD</p>|
|Ip address(es) associated with mac {#HWADDRESS}|<p>-</p>|`Zabbix trapper`|arp.macIps[{#HWADDRESS}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|IP  {#IPADDRESS} in use in more than one mac detected by {HOST.HOST} arp table. Adresses found {ITEM.LASTVALUE2}|<p>-</p>|<p>**Expression**: {ARP Monitoring:arp.macCount[{#IPADDRESS}].last(#1)}>1 and {ARP Monitoring:arp.ipMacs[{#IPADDRESS}].str(lala,#1)}=0</p><p>**Recovery expression**: </p>|information|
|Mac  {#HWADDRESS} in use in more than one IP detected by {HOST.HOST} arp table. Adresses found {ITEM.LASTVALUE2}|<p>-</p>|<p>**Expression**: {ARP Monitoring:arp.ipCount[{#HWADDRESS}].last(#1)}>1 and {ARP Monitoring:arp.macIps[{#HWADDRESS}].str(lala,#1)}=0</p><p>**Recovery expression**: </p>|information|
|New device using mac {#HWADDRESS} and IP {#IPADDRESS} detected by {HOST.HOST} arp table.|<p>Identify new physical addresses in the same network as your host. Triggers should be disabled mannualy. Recommended to create triggers disabled on the first run.</p>|<p>**Expression**: {ARP Monitoring:arp.ipCount[{#HWADDRESS}].last(#1)}<>0</p><p>**Recovery expression**: </p>|information|
|IP  {#IPADDRESS} in use in more than one mac detected by {HOST.HOST} arp table. Adresses found {ITEM.LASTVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {ARP Monitoring:arp.macCount[{#IPADDRESS}].last(#1)}>1 and {ARP Monitoring:arp.ipMacs[{#IPADDRESS}].str(lala,#1)}=0</p><p>**Recovery expression**: </p>|information|
|Mac  {#HWADDRESS} in use in more than one IP detected by {HOST.HOST} arp table. Adresses found {ITEM.LASTVALUE2} (LLD)|<p>-</p>|<p>**Expression**: {ARP Monitoring:arp.ipCount[{#HWADDRESS}].last(#1)}>1 and {ARP Monitoring:arp.macIps[{#HWADDRESS}].str(lala,#1)}=0</p><p>**Recovery expression**: </p>|information|
|New device using mac {#HWADDRESS} and IP {#IPADDRESS} detected by {HOST.HOST} arp table. (LLD)|<p>Identify new physical addresses in the same network as your host. Triggers should be disabled mannualy. Recommended to create triggers disabled on the first run.</p>|<p>**Expression**: {ARP Monitoring:arp.ipCount[{#HWADDRESS}].last(#1)}<>0</p><p>**Recovery expression**: </p>|information|
