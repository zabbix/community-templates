# Operating System Identification v2

## Overview

The template does not require additional scripts and installation of any packages on a Linux system. Low-level discovery (LLD) extracts keys from the /etc/os-release file and generates items. The template requires version 5 (or higher) of Zabbix server.



## Author

vasilisc

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Operating System Identification discovery|<p>Operating System Identification discovery.</p>|`Zabbix agent`|vfs.file.contents["/etc/os-release"]<p>Update: 1d</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|OSI {#KEY}|<p>-</p>|`Zabbix agent`|vfs.file.regexp["/etc/os-release","^{#KEY}=(?P<quote>[\"']?)(?P<value>[\S\s]*?)(?P=quote)($|\s)",,,,\2]<p>Update: 1d</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

