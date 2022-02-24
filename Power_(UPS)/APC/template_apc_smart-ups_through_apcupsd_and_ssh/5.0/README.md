# APC Smart-UPS through apcupsd and ssh

## Overview

This template is for situation when you have apcupsd, but cannot install zabbix agent. Tested with Centos 6.x.


You have to install apcupsd and configure it, configure ssh access for user by certificate. 


Provides:


Items: model, serial number, number of switching (xfers), name (set in apcupsd config), status (ONLINE and etc), charge level, timeleft.


Triggers: minimal timeleft is equal or less then {$APC\_SMARTUPS\_MINIMAL\_TIMELEFT}, status is not ONLINE.


Requires macroses: 


{$UPS\_GET\_MAININFO\_PERIOD} - period of getting model and etc.


{$UPS\_GET\_STATUS\_PERIOD} – period of getting status, timeleft, status.


{$APC\_SMARTUPS\_MINIMAL\_TIMELEFT} –minimal timeleft for trigger.


{$SSH\_CONNECT\_USERNAME} – user for connecting by ssh.


If you have any ideas to make this template better, comment, please.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|apc device info|<p>-</p>|`SSH agent`|ssh.run[apc_device.info]<p>Update: {$UPS_GET_MAININFO_PERIOD}</p>|
|apc device status info|<p>-</p>|`SSH agent`|ssh.run[apc_device.statusinfo]<p>Update: {$UPS_GET_STATUS_PERIOD}</p>|
|apc battery timeleft|<p>-</p>|`Dependent item`|apc_battery.timeleft<p>Update: 0</p>|
|apc device status|<p>-</p>|`Dependent item`|apc_device.status<p>Update: 0</p>|
|apc device numxfers|<p>-</p>|`Dependent item`|apc_device.numxfers<p>Update: 0</p>|
|apc device name|<p>-</p>|`Dependent item`|apc_device.name<p>Update: 0</p>|
|apc device serial number|<p>-</p>|`Dependent item`|apc_device.sn<p>Update: 0</p>|
|apc battery charge level|<p>-</p>|`Dependent item`|apc_battery.chargelevel<p>Update: 0</p>|
|apc device model|<p>-</p>|`Dependent item`|apc_device.model<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

