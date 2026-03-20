# H3C_WX3510H

## Overview

**Description**
---------------


I've created this template for the H3C Access Controller Model WX3510H.


For now, I've tested only the AC model WX3510H with the software version ComwareV7 and the AP model WA4320i-ACN on zabbix version 3.4.x and 4.4.x.


The templates of version 3.4.x and 4.4.x are the same one. 


 


**Prerequisites**
-----------------


Before you can use this template, you must complete the steps below:


1. Download the MIB files from the H3C website: http://download.h3c.com.cn/download.do?id=5087748 or get it from my github template subfolders.


2. Unzip the .zip file and copy all the files under the subfolder "Comware MIB-20200713\H3C New Style Private MIB\" into the snmp mib folder(normally /usr/share/snmp/mibs/) on your zabbix server(Note: If you're running a dockerized zabbix, you need to copy the mib files into the container run by the zabbix/zabbix-server-mysql:alpine image).


3. Restart zabbix to take effect.


 


**Features**
------------


- Automatically discovers and adds items of the number of the currently associated stations for each AP.


- Links to the template "Template Module ICMP Ping" in order to do ping tests for AC.


 


**Usage**
---------


1. Import the template file.


2. Add a host of H3C WX3510H AC.


3. Link the AC host with this template.


4. Set the macro {$SNMP\_COMMUNITY} to the value of your own under host level.


5. Wait for discovery.


 


**Advanced Usage**
------------------


You can make a real-time AP location map showing the current stations for each AP by the following steps:


1. Create a topology map.


2. Import your own location map picture as background.


3. Add an element as each of your AP:


 - type: host


 - tag:{the IP address of AC:hh3cDot11ApStationCurAssocSum[the name of ap, you can get it from the names of items].last(0)} 


 - host: choose your AC from list


 


**Note**
--------


To be clear, here's an example of the content of my tag: 


AP39 


Current stations: {10.0.200.253:hh3cDot11ApStationCurAssocSum[ap39].last(0)}


 


#From the first line, AP39 is one of my AP names. I added it by hand. 


#The second line shows dynamic statistics of the current stations of ap39, in which 10.0.200.253 is the IP address of my AC; The second part you can copy from item key names; last(0) means to get the latest data. You can just replace the IP of AC and the name 'ap39' in [] with your own values.    



 



## Author

Barry Cui

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AP Discovery|<p>-</p>|`SNMP agent`|hh3cDot11CurrAPTemplateName<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|number of current associations on $1|<p>-</p>|`SNMP agent`|hh3cDot11ApStationCurAssocSum[{#APNAME}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

