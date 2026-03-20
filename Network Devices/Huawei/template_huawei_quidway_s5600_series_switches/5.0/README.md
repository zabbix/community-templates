# Huawei Quidway s5600 series switches

## Overview

Template for Huawei Quidway s5600 switches. General information - Uptime, system name, number of interfaces. Interfaces - operational and administrative status of ports, errors TX and RX on every port, Bytes TX and RX on every port, triggers on CRC errors RX and TX, port status down, and restart of switch. Graphics - statistics TX/RX on every interface.


 


MACROS to be defined for the hosts: {$SNMP\_COMMUNITY}


 


Possilble, it will work on earlier versions of Zabbix, but i was testing it on 4.0



## Author

Fedor Katilov

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$COMMUNITY_NAME}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network interfaces|<p>You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.</p>|`SNMP agent`|ifDescr<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Errors TX port GE05|<p>-</p>|`SNMP agent`|ifOutErrors.4227657<p>Update: 30s</p>|
|Errors RX port GE03|<p>-</p>|`SNMP agent`|ifInErrors.4227641<p>Update: 30s</p>|
|Bytes Tx GE09|<p>-</p>|`SNMP agent`|ifOutOctets.4227689<p>Update: 30s</p>|
|Admin Status port GE28|<p>-</p>|`SNMP agent`|ifAdminStatus.4227841<p>Update: 30s</p>|
|Bytes Tx GE12|<p>-</p>|`SNMP agent`|ifOutOctets.4227713<p>Update: 30s</p>|
|Errors TX port GE17|<p>-</p>|`SNMP agent`|ifOutErrors.4227753<p>Update: 30s</p>|
|Oper status port GE17|<p>-</p>|`SNMP agent`|ifOperStatus.4227753<p>Update: 30s</p>|
|Admin Status port GE26|<p>-</p>|`SNMP agent`|ifAdminStatus.4227825<p>Update: 30s</p>|
|Errors TX port GE07|<p>-</p>|`SNMP agent`|ifOutErrors.4227673<p>Update: 30s</p>|
|Bytes Tx GE14|<p>-</p>|`SNMP agent`|ifOutOctets.4227729<p>Update: 30s</p>|
|Oper status port GE07|<p>-</p>|`SNMP agent`|ifOperStatus.4227673<p>Update: 30s</p>|
|Bytes Tx GE25|<p>-</p>|`SNMP agent`|ifOutOctets.4227817<p>Update: 30s</p>|
|Errors TX port GE21|<p>-</p>|`SNMP agent`|ifOutErrors.4227785<p>Update: 30s</p>|
|Errors RX port GE08|<p>-</p>|`SNMP agent`|ifInErrors.4227681<p>Update: 30s</p>|
|Errors RX port GE01|<p>-</p>|`SNMP agent`|ifInErrors.4227625<p>Update: 30s</p>|
|Errors TX port GE03|<p>-</p>|`SNMP agent`|ifOutErrors.4227641<p>Update: 30s</p>|
|Bytes Rx GE23|<p>-</p>|`SNMP agent`|ifInOctets.4227801<p>Update: 30s</p>|
|Bytes Rx GE02|<p>-</p>|`SNMP agent`|ifInOctets.4227633<p>Update: 30s</p>|
|Bytes Rx GE08|<p>-</p>|`SNMP agent`|ifInOctets.4227681<p>Update: 30s</p>|
|Errors TX port GE13|<p>-</p>|`SNMP agent`|ifOutErrors.4227721<p>Update: 30s</p>|
|Oper status port GE18|<p>-</p>|`SNMP agent`|ifOperStatus.4227761<p>Update: 30s</p>|
|Admin Status port GE05|<p>-</p>|`SNMP agent`|ifAdminStatus.4227657<p>Update: 30s</p>|
|Errors TX port GE11|<p>-</p>|`SNMP agent`|ifOutErrors.4227705<p>Update: 30s</p>|
|Admin Status port GE18|<p>-</p>|`SNMP agent`|ifAdminStatus.4227761<p>Update: 30s</p>|
|Bytes Tx GE23|<p>-</p>|`SNMP agent`|ifOutOctets.4227801<p>Update: 30s</p>|
|Bytes Rx GE12|<p>-</p>|`SNMP agent`|ifInOctets.4227713<p>Update: 30s</p>|
|Errors RX port GE25|<p>-</p>|`SNMP agent`|ifInErrors.4227817<p>Update: 30s</p>|
|Oper status port GE05|<p>-</p>|`SNMP agent`|ifOperStatus.4227657<p>Update: 30s</p>|
|Bytes Tx GE03|<p>-</p>|`SNMP agent`|ifOutOctets.4227641<p>Update: 30s</p>|
|Oper status port GE15|<p>-</p>|`SNMP agent`|ifOperStatus.4227737<p>Update: 30s</p>|
|Oper status port GE19|<p>-</p>|`SNMP agent`|ifOperStatus.4227769<p>Update: 30s</p>|
|Bytes Tx GE21|<p>-</p>|`SNMP agent`|ifOutOctets.4227787<p>Update: 30s</p>|
|Errors TX port GE26|<p>-</p>|`SNMP agent`|ifOutErrors.4227825<p>Update: 30s</p>|
|Errors RX port GE06|<p>-</p>|`SNMP agent`|ifInErrors.4227665<p>Update: 30s</p>|
|Bytes Tx GE13|<p>-</p>|`SNMP agent`|ifOutOctets.4227721<p>Update: 30s</p>|
|Errors RX port GE23|<p>-</p>|`SNMP agent`|ifInErrors.4227801<p>Update: 30s</p>|
|Bytes Tx GE16|<p>-</p>|`SNMP agent`|ifOutOctets.4227745<p>Update: 30s</p>|
|Oper status port GE01|<p>-</p>|`SNMP agent`|ifOperStatus.4227625<p>Update: 30s</p>|
|Bytes Tx GE11|<p>-</p>|`SNMP agent`|ifOutOctets.4227705<p>Update: 30s</p>|
|Oper status port GE24|<p>-</p>|`SNMP agent`|ifOperStatus.4227809<p>Update: 30s</p>|
|Admin Status port GE25|<p>-</p>|`SNMP agent`|ifAdminStatus.4227817<p>Update: 30s</p>|
|Errors TX port GE08|<p>-</p>|`SNMP agent`|ifOutErrors.4227681<p>Update: 30s</p>|
|Oper status port GE03|<p>-</p>|`SNMP agent`|ifOperStatus.4227641<p>Update: 30s</p>|
|Admin Status port GE13|<p>-</p>|`SNMP agent`|ifAdminStatus.4227721<p>Update: 30s</p>|
|Errors TX port GE27|<p>-</p>|`SNMP agent`|ifOutErrors.4227833<p>Update: 30s</p>|
|Errors TX port GE25|<p>-</p>|`SNMP agent`|ifOutErrors.4227817<p>Update: 30s</p>|
|Bytes Rx GE27|<p>-</p>|`SNMP agent`|ifInOctets.4227833<p>Update: 30s</p>|
|Bytes Rx GE20|<p>-</p>|`SNMP agent`|ifInOctets.4227777<p>Update: 30s</p>|
|Bytes Tx GE08|<p>-</p>|`SNMP agent`|ifOutOctets.4227681<p>Update: 30s</p>|
|Bytes Tx GE07|<p>-</p>|`SNMP agent`|ifOutOctets.4227673<p>Update: 30s</p>|
|Errors TX port GE16|<p>-</p>|`SNMP agent`|ifOutErrors.4227745<p>Update: 30s</p>|
|Errors RX port GE21|<p>-</p>|`SNMP agent`|ifInErrors.4227785<p>Update: 30s</p>|
|Errors RX port GE20|<p>-</p>|`SNMP agent`|ifInErrors.4227777<p>Update: 30s</p>|
|SysName|<p>-</p>|`SNMP agent`|iso.3.6.1.2.1.1.5.0<p>Update: 3600s</p>|
|Bytes Tx GE06|<p>-</p>|`SNMP agent`|ifOutOctets.4227665<p>Update: 30s</p>|
|Bytes Rx GE07|<p>-</p>|`SNMP agent`|ifInOctets.4227673<p>Update: 30s</p>|
|Admin Status port GE22|<p>-</p>|`SNMP agent`|ifAdminStatus.4227793<p>Update: 30s</p>|
|Bytes Rx GE05|<p>-</p>|`SNMP agent`|ifInOctets.4227657<p>Update: 30s</p>|
|Errors RX port GE13|<p>-</p>|`SNMP agent`|ifInErrors.4227721<p>Update: 30s</p>|
|Bytes Rx GE14|<p>-</p>|`SNMP agent`|ifInOctets.4227729<p>Update: 30s</p>|
|Bytes Rx GE13|<p>-</p>|`SNMP agent`|ifInOctets.4227721<p>Update: 30s</p>|
|Bytes Tx GE24|<p>-</p>|`SNMP agent`|ifOutOctets.4227809<p>Update: 30s</p>|
|Bytes Tx GE28|<p>-</p>|`SNMP agent`|ifOutOctets.4227841<p>Update: 30s</p>|
|Errors RX port GE14|<p>-</p>|`SNMP agent`|ifInErrors.4227729<p>Update: 30s</p>|
|Errors RX port GE15|<p>-</p>|`SNMP agent`|ifInErrors.4227737<p>Update: 30s</p>|
|Admin Status port GE12|<p>-</p>|`SNMP agent`|ifAdminStatus.4227713<p>Update: 30s</p>|
|Bytes Tx GE02|<p>-</p>|`SNMP agent`|ifOutOctets.4227633<p>Update: 30s</p>|
|Errors TX port GE24|<p>-</p>|`SNMP agent`|ifOutErrors.4227809<p>Update: 30s</p>|
|Errors TX port GE22|<p>-</p>|`SNMP agent`|ifOutErrors.4227793<p>Update: 30s</p>|
|Bytes Tx GE22|<p>-</p>|`SNMP agent`|ifOutOctets.4227793<p>Update: 30s</p>|
|Bytes Tx GE17|<p>-</p>|`SNMP agent`|ifOutOctets.4227753<p>Update: 30s</p>|
|Errors RX port GE02|<p>-</p>|`SNMP agent`|ifInErrors.4227633<p>Update: 30s</p>|
|Bytes Rx GE06|<p>-</p>|`SNMP agent`|ifInOctets.4227665<p>Update: 30s</p>|
|Errors RX port GE07|<p>-</p>|`SNMP agent`|ifInErrors.4227673<p>Update: 30s</p>|
|Bytes Rx GE16|<p>-</p>|`SNMP agent`|ifInOctets.4227745<p>Update: 30s</p>|
|Errors TX port GE02|<p>-</p>|`SNMP agent`|ifOutErrors.4227633<p>Update: 30s</p>|
|Bytes Rx GE18|<p>-</p>|`SNMP agent`|ifInOctets.4227761<p>Update: 30s</p>|
|Errors TX port GE01|<p>-</p>|`SNMP agent`|ifOutErrors.4227625<p>Update: 30s</p>|
|Admin Status port GE21|<p>-</p>|`SNMP agent`|ifAdminStatus.4227787<p>Update: 30s</p>|
|Errors RX port GE16|<p>-</p>|`SNMP agent`|ifInErrors.4227745<p>Update: 30s</p>|
|Bytes Tx GE01|<p>-</p>|`SNMP agent`|ifOutOctets.4227625<p>Update: 30s</p>|
|Errors TX port GE06|<p>-</p>|`SNMP agent`|ifOutErrors.4227665<p>Update: 30s</p>|
|Bytes Rx GE21|<p>-</p>|`SNMP agent`|ifInOctets.4227787<p>Update: 30s</p>|
|Oper status port GE25|<p>-</p>|`SNMP agent`|ifOperStatus.4227817<p>Update: 30s</p>|
|Admin Status port GE16|<p>-</p>|`SNMP agent`|ifAdminStatus.4227745<p>Update: 30s</p>|
|Oper status port GE23|<p>-</p>|`SNMP agent`|ifOperStatus.4227801<p>Update: 30s</p>|
|Errors TX port GE04|<p>-</p>|`SNMP agent`|ifOutErrors.4227649<p>Update: 30s</p>|
|Admin Status port GE23|<p>-</p>|`SNMP agent`|ifAdminStatus.4227801<p>Update: 30s</p>|
|Oper status port GE14|<p>-</p>|`SNMP agent`|ifOperStatus.4227729<p>Update: 30s</p>|
|Bytes Tx GE20|<p>-</p>|`SNMP agent`|ifOutOctets.4227777<p>Update: 30s</p>|
|Oper status port GE04|<p>-</p>|`SNMP agent`|ifOperStatus.4227649<p>Update: 30s</p>|
|Bytes Tx GE05|<p>-</p>|`SNMP agent`|ifOutOctets.4227657<p>Update: 30s</p>|
|Oper status port GE22|<p>-</p>|`SNMP agent`|ifOperStatus.4227793<p>Update: 30s</p>|
|Admin Status port GE24|<p>-</p>|`SNMP agent`|ifAdminStatus.4227809<p>Update: 30s</p>|
|CPU medium load|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.25.3.3.1.2<p>Update: 60s</p>|
|Bytes Rx GE01|<p>-</p>|`SNMP agent`|ifInOctets.4227625<p>Update: 30s</p>|
|Bytes Rx GE24|<p>-</p>|`SNMP agent`|ifInOctets.4227809<p>Update: 30s</p>|
|Bytes Rx GE11|<p>-</p>|`SNMP agent`|ifInOctets.4227705<p>Update: 30s</p>|
|Bytes Rx GE03|<p>-</p>|`SNMP agent`|ifInOctets.4227641<p>Update: 30s</p>|
|Errors RX port GE05|<p>-</p>|`SNMP agent`|ifInErrors.4227657<p>Update: 30s</p>|
|Admin Status port GE03|<p>-</p>|`SNMP agent`|ifAdminStatus.4227641<p>Update: 30s</p>|
|Errors RX port GE22|<p>-</p>|`SNMP agent`|ifInErrors.4227793<p>Update: 30s</p>|
|Oper status port GE02|<p>-</p>|`SNMP agent`|ifOperStatus.4227633<p>Update: 30s</p>|
|Errors RX port GE18|<p>-</p>|`SNMP agent`|ifInErrors.4227761<p>Update: 30s</p>|
|Bytes Rx GE09|<p>-</p>|`SNMP agent`|ifInOctets.4227689<p>Update: 30s</p>|
|Errors TX port GE20|<p>-</p>|`SNMP agent`|ifOutErrors.4227777<p>Update: 30s</p>|
|Errors TX port GE14|<p>-</p>|`SNMP agent`|ifOutErrors.4227729<p>Update: 30s</p>|
|Errors TX port GE12|<p>-</p>|`SNMP agent`|ifOutErrors.4227713<p>Update: 30s</p>|
|Bytes Rx GE10|<p>-</p>|`SNMP agent`|ifInOctets.4227697<p>Update: 30s</p>|
|Errors TX port GE18|<p>-</p>|`SNMP agent`|ifOutErrors.4227761<p>Update: 30s</p>|
|Bytes Rx GE19|<p>-</p>|`SNMP agent`|ifInOctets.4227769<p>Update: 30s</p>|
|Errors TX port GE09|<p>-</p>|`SNMP agent`|ifOutErrors.4227689<p>Update: 30s</p>|
|Admin Status port GE07|<p>-</p>|`SNMP agent`|ifAdminStatus.4227673<p>Update: 30s</p>|
|Errors RX port GE28|<p>-</p>|`SNMP agent`|ifInErrors.4227841<p>Update: 30s</p>|
|Errors TX port GE15|<p>-</p>|`SNMP agent`|ifOutErrors.4227737<p>Update: 30s</p>|
|Oper status port GE12|<p>-</p>|`SNMP agent`|ifOperStatus.4227713<p>Update: 30s</p>|
|Oper status port GE08|<p>-</p>|`SNMP agent`|ifOperStatus.4227681<p>Update: 30s</p>|
|Admin Status port GE27|<p>-</p>|`SNMP agent`|ifAdminStatus.4227833<p>Update: 30s</p>|
|Errors RX port GE17|<p>-</p>|`SNMP agent`|ifInErrors.4227753<p>Update: 30s</p>|
|Admin Status port GE10|<p>-</p>|`SNMP agent`|ifAdminStatus.4227697<p>Update: 30s</p>|
|Bytes Rx GE04|<p>-</p>|`SNMP agent`|ifInOctets.4227649<p>Update: 30s</p>|
|Admin Status port GE01|<p>-</p>|`SNMP agent`|ifAdminStatus.4227625<p>Update: 30s</p>|
|Bytes Rx GE22|<p>-</p>|`SNMP agent`|ifInOctets.4227793<p>Update: 30s</p>|
|Oper status port GE16|<p>-</p>|`SNMP agent`|ifOperStatus.4227745<p>Update: 30s</p>|
|Oper status port GE13|<p>-</p>|`SNMP agent`|ifOperStatus.4227721<p>Update: 30s</p>|
|Errors RX port GE19|<p>-</p>|`SNMP agent`|ifInErrors.4227769<p>Update: 30s</p>|
|Oper status port GE09|<p>-</p>|`SNMP agent`|ifOperStatus.4227689<p>Update: 30s</p>|
|Oper status port GE20|<p>-</p>|`SNMP agent`|ifOperStatus.4227777<p>Update: 30s</p>|
|Bytes Tx GE27|<p>-</p>|`SNMP agent`|ifOutOctets.4227833<p>Update: 30s</p>|
|Errors TX port GE19|<p>-</p>|`SNMP agent`|ifOutErrors.4227769<p>Update: 30s</p>|
|Bytes Rx GE25|<p>-</p>|`SNMP agent`|ifInOctets.4227817<p>Update: 30s</p>|
|Uptime|<p>Uptime of switch</p>|`SNMP agent`|hUptime<p>Update: 30s</p>|
|Errors RX port GE11|<p>-</p>|`SNMP agent`|ifInErrors.4227705<p>Update: 30s</p>|
|Oper status port GE21|<p>-</p>|`SNMP agent`|ifOperStatus.4227785<p>Update: 30s</p>|
|Admin Status port GE06|<p>-</p>|`SNMP agent`|ifAdminStatus.4227665<p>Update: 30s</p>|
|Bytes Tx GE26|<p>-</p>|`SNMP agent`|ifOutOctets.4227825<p>Update: 30s</p>|
|Admin Status port GE19|<p>-</p>|`SNMP agent`|ifAdminStatus.4227769<p>Update: 30s</p>|
|Admin Status port GE11|<p>-</p>|`SNMP agent`|ifAdminStatus.4227705<p>Update: 30s</p>|
|Errors RX port GE24|<p>-</p>|`SNMP agent`|ifInErrors.4227809<p>Update: 30s</p>|
|Bytes Tx GE19|<p>-</p>|`SNMP agent`|ifOutOctets.4227769<p>Update: 30s</p>|
|Bytes Tx GE15|<p>-</p>|`SNMP agent`|ifOutOctets.4227737<p>Update: 30s</p>|
|Bytes Rx GE17|<p>-</p>|`SNMP agent`|ifInOctets.4227753<p>Update: 30s</p>|
|Errors TX port GE23|<p>-</p>|`SNMP agent`|ifOutErrors.4227801<p>Update: 30s</p>|
|Errors RX port GE09|<p>-</p>|`SNMP agent`|ifInErrors.4227689<p>Update: 30s</p>|
|Admin Status port GE08|<p>-</p>|`SNMP agent`|ifAdminStatus.4227681<p>Update: 30s</p>|
|Admin Status port GE20|<p>-</p>|`SNMP agent`|ifAdminStatus.4227777<p>Update: 30s</p>|
|Errors RX port GE04|<p>-</p>|`SNMP agent`|ifInErrors.4227649<p>Update: 30s</p>|
|Oper status port GE11|<p>-</p>|`SNMP agent`|ifOperStatus.4227705<p>Update: 30s</p>|
|Admin Status port GE02|<p>-</p>|`SNMP agent`|ifAdminStatus.4227633<p>Update: 30s</p>|
|Errors RX port GE27|<p>-</p>|`SNMP agent`|ifInErrors.4227833<p>Update: 30s</p>|
|Errors RX port GE12|<p>-</p>|`SNMP agent`|ifInErrors.4227713<p>Update: 30s</p>|
|Errors TX port GE28|<p>-</p>|`SNMP agent`|ifOutErrors.4227841<p>Update: 30s</p>|
|Errors RX port GE26|<p>-</p>|`SNMP agent`|ifInErrors.4227825<p>Update: 30s</p>|
|Admin Status port GE09|<p>-</p>|`SNMP agent`|ifAdminStatus.4227689<p>Update: 30s</p>|
|Oper status port GE06|<p>-</p>|`SNMP agent`|ifOperStatus.4227665<p>Update: 30s</p>|
|Admin Status port GE14|<p>-</p>|`SNMP agent`|ifAdminStatus.4227729<p>Update: 30s</p>|
|Bytes Tx GE18|<p>-</p>|`SNMP agent`|ifOutOctets.4227761<p>Update: 30s</p>|
|Errors RX port GE10|<p>-</p>|`SNMP agent`|ifInErrors.4227697<p>Update: 30s</p>|
|Admin Status port GE17|<p>-</p>|`SNMP agent`|ifAdminStatus.4227753<p>Update: 30s</p>|
|Bytes Rx GE15|<p>-</p>|`SNMP agent`|ifInOctets.4227737<p>Update: 30s</p>|
|Bytes Tx GE04|<p>-</p>|`SNMP agent`|ifOutOctets.4227649<p>Update: 30s</p>|
|Oper status port GE28|<p>-</p>|`SNMP agent`|ifOperStatus.4227841<p>Update: 30s</p>|
|Oper status port GE10|<p>-</p>|`SNMP agent`|ifOperStatus.4227697<p>Update: 30s</p>|
|Oper status port GE27|<p>-</p>|`SNMP agent`|ifOperStatus.4227833<p>Update: 30s</p>|
|Bytes Tx GE10|<p>-</p>|`SNMP agent`|ifOutOctets.4227697<p>Update: 30s</p>|
|Oper status port GE26|<p>-</p>|`SNMP agent`|ifOperStatus.4227825<p>Update: 30s</p>|
|Bytes Rx GE26|<p>-</p>|`SNMP agent`|ifInOctets.4227825<p>Update: 30s</p>|
|Bytes Rx GE28|<p>-</p>|`SNMP agent`|ifInOctets.4227841<p>Update: 30s</p>|
|Admin Status port GE04|<p>-</p>|`SNMP agent`|ifAdminStatus.4227649<p>Update: 30s</p>|
|Errors TX port GE10|<p>-</p>|`SNMP agent`|ifOutErrors.4227697<p>Update: 30s</p>|
|Number of interfaces|<p>-</p>|`SNMP agent`|ifNumber.0<p>Update: 3600s</p>|
|Admin Status port GE15|<p>-</p>|`SNMP agent`|ifAdminStatus.4227737<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

