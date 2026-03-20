# H3C_WX3510H

## Overview

**Description**
---------------
Testing environment:
- Ubuntu 22.04 LTS
- Zabbix 6.0.6
- AC WX3510H(ComwareV7)

I've updated and tested this template in the above environment.


**Prerequisites**
-----------------

Before using this template, you must complete the steps below:

1. Set up snmp configuarions on WX3510H device:
Example:
snmp-agent sys-info version all
snmp-agent community read public
snmp-agent community write private

2. Download MIB files from H3C website: https://download.h3c.com/app/cn/download.do?id=7378345 

   Unzip and copy all the files under the subfolder "H3C Public MIB/" and "H3C New Style Private MIB/" into the snmp MIB folder(normally /usr/share/snmp/mibs/) on your zabbix server.

3. Restart Zabbix to take effect.


 


**Features**
------------


- Automatically discovers APs with some of their properties(number of clients, channel number, channel usage, CPU usage, etc.).


- This template is linked to "Template Module ICMP Ping" in order to do ping tests for AC.


 


**How to use it**
---------


1. Import the template file.


2. Add a host of H3C WX3510H AC, and set the macro {$SNMP\_COMMUNITY} to the value of your own      
   under host config(not template config).


3. Link the AC host to this template.


4. Wait for discovery.


 


**Visualize your APs**
------------------


You can make a real-time AP location map showing the current statistics for each AP by the following steps:


1. Create a topology map.


2. Import your own location map picture as background.


3. Add an element as Access point device:

Below is an example, the label is an expression macro, the pattern is like this: {?last(/ac ip/item key)}

 - type: Host

 - Label: 
   Name: ap01
   Number of Clients: {?last(/10.1.1.1/numOfClients[ap01])}
   2.4G channel number: {?last(/10.1.1.1/hh3cDot11APRadioEntry.5.c2.[ap01])}
   2.4G channel usage: {?last(/10.1.1.1/hh3cDot11APRadioEntry.26.c2.[ap01])}
   5.8G channel number:  {?last(/10.1.1.1/hh3cDot11APRadioEntry.5.c1.[ap01])}
   5.8G channel usage: {?last(/10.1.1.1/hh3cDot11APRadioEntry.26.c1.[ap01])}
   CPU Usage: {?last(/10.0.200.253/hh3cDot11APSysInfoByAPIDEntry.2[ap01])}

 - Host: (choose your AC device from list)
  
Through this way I'm able to dynamicly show all the APs with their statistics.

Note:

Since Zabbix6.0, expression macros are written in a new way. You can find useful information here:

https://www.zabbix.com/documentation/6.0/de/manual/introduction/whatsnew600#new-macros
https://www.zabbix.com/documentation/5.4/en/manual/introduction/whatsnew540


**How to customize this template**
------------------


As you may want to customize or expand the functionality of this template, here's what I do for the development routine:


1. In the unzipped folder, you may find a .txt file named "Quick reference of H3C new style MIB objects description". Open it and filter the keyword "DOT11" or more specifically "HH3C-DOT11-APMT-MIB", because the latter one is the only MIB I care about.

2. In the .txt file, you can see lots of blocks of OIDs: an OBJECT-TYPE followed by "-- FROM" keyword.
Say, I find the OBJECT-TYPE hh3cDot11ApStationCurAssocSum followed by the string "-- FROM HH3C-DOT11-APMT-MIB" on the second line.
You can use snmpwalk to retrieve data based on that format. The command should be like:
pattern: snmpwalk -v 2c -c <community name> <device ip> <OID>
example: snmpwalk -v 2c -c public 10.1.1.1 HH3C-DOT11-APMT-MIB::hh3cDot11ApStationCurAssocSum

You see what I'm doing? Yes, just put the MIB string(HH3C-DOT11-APMT-MIB) after device ip, and then followed by two colons followed by the OBJECT-TYPE(hh3cDot11ApStationCurAssocSum in this case).

There you are. You've successfully retrieved data.

3. Copy the snippet of OID in snmpwalk command into Zabbix to make your template macro.
A simple example of the usage of it in discovery rule:
discovery[{#NUMOFCLIENTS},HH3C-DOT11-APMT-MIB::hh3cDot11ApStationCurAssocSum]
The first parameter is a macro name, the second one is the OID you used before.

An example of the usage in item prototypes:
HH3C-DOT11-APMT-MIB::hh3cDot11ApStationCurAssocSum.{#SNMPINDEX}
The parameter is the OID you used, and it is followed by a dot and a built-in macro {#SNMPINDEX}.



## Author

Barry Cui 
Email: cuizhidong2017@gmail.com; 632378055@qq.com

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AP Discovery|<p>-</p>|`SNMP agent`|ap.discovery<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|number of current clients on {#APNAME}|<p>-</p>|`SNMP agent`|HH3C-DOT11-APMT-MIB::hh3cDot11ApStationCurAssocSum.{#SNMPINDEX}<p>Update: 60s</p><p>LLD</p>|
|2.4G Channel Number on {#APNAME}|<p>-</p>|`SNMP agent`|hh3cDot11APRadioEntry.5.c2.[{#APNAME}]<p>Update: 60s</p><p>LLD</p>|
|2.4G Channel Usage on {#APNAME}|<p>-</p>|`SNMP agent`|hh3cDot11APRadioEntry.26.c2.[{#APNAME}]<p>Update: 60s</p><p>LLD</p>|
|5.8G Channel Number on {#APNAME}|<p>-</p>|`SNMP agent`|hh3cDot11APRadioEntry.5.c1.[{#APNAME}]<p>Update: 60s</p><p>LLD</p>|
|5.8G Channel Usage on {#APNAME}|<p>-</p>|`SNMP agent`|hh3cDot11APRadioEntry.26.c1.[{#APNAME}]<p>Update: 60s</p><p>LLD</p>|
|CPU Utilization of {#APNAME}|<p>-</p>|`SNMP agent`|hh3cDot11APSysInfoByAPIDEntry.2[{#APNAME}]<p>Update: 60s</p><p>LLD</p>|



## Triggers

There are no triggers in this template.

