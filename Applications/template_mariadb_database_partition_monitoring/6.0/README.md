# Zabbix DB Partitions

## Overview

This template create items to monitor 5 days worth of partitions have been created for your database. This template is intended to be used for the Zabbix Database partitions, however could be modified to check for any database partitions. 


 


Install Steps:


* Import template into Zabbix 3.2 or >


* Set the {$PASSWORD} Macro to the password for the account which will be preforming the check


* Update EACH item to have the user that will be preforming the check, Default==Root


* Update the ls path used in each item for the correct path to your DB


* Apply to each of your DB hosts in Zabbix


 


![Software Information Systems](https://www.thinksis.com/images/header/logo.jpg)



## Author

SIS

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PASSWORD}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Tomorrow Daily Partition Count|<p>ls /var/lib/mysql/zabbixdb | grep -c $(date -d "$(date +%F)"+Xdays "+%Y%m%d") Workflow 1. List the content of the /var/lib/mysql/zabbixdb folder 2. Print the grep count of current date, + X days ahead, printing the format like the partition file name.</p>|`SSH agent`|ssh.run[dpc1,{HOST.HOST},22,]<p>Update: 30s</p>|
|Current Daily Partition count|<p>Gets the current count of the number of daily partitions in the /var/lib/mysql/zabbixdb, this will need to be adjusted to fit your environment.</p>|`SSH agent`|ssh.run[dpc,{HOST.HOST},22,]<p>Update: 30s</p>|
|Fifth Daily Partition Count|<p>ls /var/lib/mysql/zabbixdb | grep -c $(date -d "$(date +%F)"+Xdays "+%Y%m%d") Workflow 1. List the content of the /var/lib/mysql/zabbixdb folder 2. Print the grep count of current date, + X days ahead, printing the format like the partition file name.</p>|`SSH agent`|ssh.run[dpc5,{HOST.HOST},22,]<p>Update: 30s</p>|
|Fourth Daily Partition Count|<p>ls /var/lib/mysql/zabbixdb | grep -c $(date -d "$(date +%F)"+Xdays "+%Y%m%d") Workflow 1. List the content of the /var/lib/mysql/zabbixdb folder 2. Print the grep count of current date, + X days ahead, printing the format like the partition file name.</p>|`SSH agent`|ssh.run[dpc4,{HOST.HOST},22,]<p>Update: 30s</p>|
|Third Daily Partition Count|<p>ls /var/lib/mysql/zabbixdb | grep -c $(date -d "$(date +%F)"+Xdays "+%Y%m%d") Workflow 1. List the content of the /var/lib/mysql/zabbixdb folder 2. Print the grep count of current date, + X days ahead, printing the format like the partition file name.</p>|`SSH agent`|ssh.run[dpc3,{HOST.HOST},22,]<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

