# Module Linux Active User Status by Zabbix Agent active

## Description

This template collects and monitors active users on target hosts.

## Overview


# Zabbix Template for monitoring Active User Status by Zabbix Agent active


This template try to monitor active users on servers and find out overstay users
  

1. Monitor Items
 1. Logged in users List
 1. Num of Active(logged in) users
 1. Overstay users on the {HOST.NAME} > {$OVERSTAY\_THRESHOLD} day(s)
 1. Num of overstay users on the {HOST.NAME} > {$OVERSTAY\_THRESHOLD} day(s)
 - Triggers
 Some users overstay on the {HOST.NAME} > {$OVERSTAY\_THRESHOLD} day(s)
  

## Tested version
  

- Zabbix: `5.0.1`
  

## Useage
  

1. Import Templates: Zabbix Web Page --> [Configuration] --> [Templates] --> [Import] this xml file
1. Link this template to an existing host or a new host
1. Update the Macro to specify your Harbor info: [Configuration] --> your host --> [Macros] --> [Inherited and host macros]
 - {$OVERSTAY\_THRESHOLD}


## Author

Yioda

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$OVERSTAY_THRESHOLD}|<p>stay on certain server too long, default: 1 day</p>|`1`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Num of overstay users on the {HOST.NAME} > {$OVERSTAY_THRESHOLD} day(s)|<p>-</p>|`Dependent item`|system.users.overstay.num<p>Update: 0</p>|
|Num of Active(logged in) users|<p>Same purpose as the Zabbix built-in metric `system.users.num`.</p>|`Dependent item`|system.users.loggedin.num<p>Update: 0</p>|
|Overstay users on the {HOST.NAME} > {$OVERSTAY_THRESHOLD} day(s)|<p>-</p>|`Dependent item`|system.users.overstay.list<p>Update: 0</p>|
|Logged in users|<p>Use linux command `last` to get those users with status "still logged in".</p>|`Zabbix agent (active)`|system.run["TZ=UTC last -FRw | grep \"still logged\" | sed 's/still logged in//g' | awk '{$2=\"\";print $0;}'  | sed 's/  /,/g'"]<p>Update: 1h</p>|


## Triggers

There are no triggers in this template.

