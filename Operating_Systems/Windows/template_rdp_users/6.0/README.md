# RDPUsers

## Overview

RDP Logged on Users


I use this template to check Users, that are logged on RDP sessions on Windows servers. It's not full audit, it's only for current view of logged-on users.


Template is really simple.It has only one Item and user parameter configured on monitored server.


User parameter in zabbix\_agentd.conf: UserParameter=RDPUsers,"c:\zabbix\RDPUsers.cmd" Script RDPUsers.cmd:


@echo off


for /F "usebackq tokens=1,2,3,4,5*" %%i in (`qwinsta ^| find "Active"`) do (


 if "%%l" == "Active" ( echo %%j )


)


I was asked to enhance script for monitoring disconnected terminal users too. So this is my second version of script. Script adds "D:" before name for disconnecter users and "A: "for Active users. Script was tested only for English version of Windows server:


New script RDPUsers.cmd:


@echo off


for /F "usebackq tokens=1,2,3,4,5*" %%i in (`query user 2^>nul`) do (


 if "%%l" == "Active" ( echo A: %%i )


 if "%%k" == "Disc" ( echo D: %%i )


)



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Logged Users|<p>http://serverfault.com/questions/511120/getting-just-the-active-remote-desktop-sessions</p>|`Zabbix agent (active)`|RDPUsers<p>Update: 120</p>|


## Triggers

There are no triggers in this template.

