# Zimbra

## Overview

With this template you can monitor the status of some parameters of your Zimbra server, in particular some of the "zmcontrol status" output.


1) prepare the Zimbra server, by adding the following line to the ROOT CRONTAB. This will put the output of the "zmcontrol status" on a file in /tmp. It will run every 3 min:


*/3 * * * * sudo -u zimbra /opt/zimbra/bin/zmcontrol status > /tmp/zmcontrol\_status


2) add the following UserParameter to the zabbix\_agentd.conf file, or the conf.d folder:


UserParameter=zimbra.amavis.status,awk '/amavis/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.antispam.status,awk '/antispam/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.antivirus.status,awk '/antivirus/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.mailbox.status,awk '/mailbox/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.mta.status,awk '/mta/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.zmconfigd.status,awk '/zmconfigd/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.webmail.status,awk '/service webapp/{print $3}' /tmp/zmcontrol_status
UserParameter=zimbra.webadm.status,awk '/zimbraAdmin/{print $3}' /tmp/zmcontrol_status
UserParameter=zimbra.proxy.status,awk '/proxy/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.logger.status,awk '/logger/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.snmp.status,awk '/snmp/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.cbpolicyd.status,awk '/cbpolicyd/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.spell.status,awk '/spell/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.opendkim.status,awk '/opendkim/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.apache.status,awk '/apache/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.memcached.status,awk '/memcached/{print $2}' /tmp/zmcontrol_status
UserParameter=zimbra.stats.status,awk '/stats/{print $2}' /tmp/zmcontrol_status

## Authors 

LeleKimi, Anfossi Dennis

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status Zmconfigd Zimbra|<p>-</p>|`Zabbix agent`|zimbra.zmconfigd.status<p>Update: 3m</p>|
|Status MTA Zimbra|<p>-</p>|`Zabbix agent`|zimbra.mta.status<p>Update: 3m</p>|
|Status Proxy Zimbra|<p>-</p>|`Zabbix agent`|zimbra.proxy.status<p>Update: 3m</p>|
|Status Antivírus Zimbra|<p>-</p>|`Zabbix agent`|zimbra.antivirus.status<p>Update: 3m</p>|
|Status Amavis Zimbra|<p>-</p>|`Zabbix agent`|zimbra.amavis.status<p>Update: 3m</p>|
|Status Admin Console Zimbra|<p>-</p>|`Zabbix agent`|zimbra.webadm.status<p>Update: 3m</p>|
|Status Webmail Zimbra Service|<p>-</p>|`Zabbix agent`|zimbra.webmail.status<p>Update: 3m</p>|
|Status Mailbox Zimbra|<p>-</p>|`Zabbix agent`|zimbra.mailbox.status<p>Update: 3m</p>|
|Status AntiSpam Zimbra|<p>-</p>|`Zabbix agent`|zimbra.antispam.status<p>Update: 3m</p>|
|Status Memcached Zimbra|<p>-</p>|`Zabbix agent`|zimbra.memcached.status<p>Update: 3m</p>|
|Status Logger Zimbra|<p>-</p>|`Zabbix agent`|zimbra.logger.status<p>Update: 3m</p>|
|Status SNMP Zimbra|<p>-</p>|`Zabbix agent`|zimbra.snmp.status<p>Update: 3m</p>|
|Status OpenDKIM Zimbra|<p>-</p>|`Zabbix agent`|zimbra.opendkim.status<p>Update: 3m</p>|
|Status CBPolicyD Zimbra|<p>-</p>|`Zabbix agent`|zimbra.cbpolicyd.status<p>Update: 3m</p>|
|Status Stats Zimbra|<p>-</p>|`Zabbix agent`|zimbra.stats.status<p>Update: 3m</p>|
|Status Spell Zimbra|<p>-</p>|`Zabbix agent`|zimbra.spell.status<p>Update: 3m</p>|


## Triggers

There are no triggers in this template.

