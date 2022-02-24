# Junos Space

## Overview

monitor critical services for Junos Space monitoring system



## Author

Dmitry Lavrukhin

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|service nma count|<p>-</p>|`Zabbix agent`|proc.num[httpd,root,,nma]<p>Update: 60</p>|
|service heartbeat count|<p>-</p>|`Zabbix agent`|proc.num[heartbeat,root,,master]<p>Update: 60</p>|
|service httpd count|<p>-</p>|`Zabbix agent`|proc.num[httpd,root,," "]<p>Update: 60</p>|
|service opennms count|<p>-</p>|`Zabbix agent`|proc.num[java,opennms]<p>Update: 60</p>|
|service postgreSQL count|<p>-</p>|`Zabbix agent`|proc.num[postmaster,postgres,,pgsql]<p>Update: 60</p>|
|service jmp-watchdog count|<p>-</p>|`Zabbix agent`|proc.num[perl,root,,jmp-watchdog]<p>Update: 60</p>|
|service jboss count|<p>-</p>|`Zabbix agent`|proc.num[sh,jboss,,--host-config=host.xml.master]<p>Update: 60</p>|
|service mysql count|<p>-</p>|`Zabbix agent`|proc.num[mysqld,mysql]<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

