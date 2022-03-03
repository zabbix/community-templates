# Meraki Dashboard

## Overview

This is a Zabbix template to poll meraki dashboard via SNMP. I made this because I really needed access point numbers and the number of connected clients for a Grafana dashboard for a multi vendor enterprise. So this is that v1.0. For me, I count the items for the number of APs and then sum the numbers for the client count.


This requires you to enable SNMPv2 polling in your Meraki Dashboard and set the host to monitor snmp.meraki.com port 16100 and the global macro {$SNMP\_COMMUNITY} to whatever Meraki Dashboard gives you. This only uses OID's so no need to put the MIB file anywhere. You MAY need to increase the SNMP poller timeout in Zabbix because snmp.meraki.com tends to be pretty slow at returning SNMP requests. I have mine set to 30 seconds and it works well so far.


I am working on getting more data into this, including (hopefully) interface statistics for MR and MX, I would also LOVE to get the number of clients connected to each radio (2.4 and 5) like I do from other venders but I will need to see if Meraki gives up that data.



## Author

John T. Young

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Meraki.SSID|<p>Grabs SSID Names</p>|`SNMP agent`|MERAKI.SSID.KEY<p>Update: 4h</p>|
|Meraki.AP|<p>Grabs AP name and Status. Creates an Item if Status is up.</p>|`SNMP agent`|MERAKI.AP.KEY<p>Update: 4h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|SSID: {#SSIDNAME}|<p>-</p>|`SNMP agent`|MerakiDeviceIndex.SSID.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Access Point {#ITEM.NAME}: Clients Connected|<p>-</p>|`SNMP agent`|MerakiDeviceIndex.Clients.[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

