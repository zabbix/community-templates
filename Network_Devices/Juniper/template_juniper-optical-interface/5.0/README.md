# Juniper-Optical-Interfaces

## Description

Based on Zabbix's official Template Net Juniper SNMPv2, only minor modifications have been made. 1.The interfaces in the down and shutdown states have been filtered,virtual interfaces have also been filtered 2.The trigger threshold seting is -19dbm or 0dbm. 3.only RxLaserPower items,if you need TxLaserPower items but don’t know how to do it, please email me. whye1700#gmail.com(replace # with @)

## Overview

  2020-06-09-update


* The template was modified suitable for version 3.4


~~~~~~~~~~~~~~~~~


2020-03-20-update


* Add TxLaserPower item,If you need please download "template-add\_TxLaserPower.xml"
* TxLaserPower-Trigger,set Tx threshold on -10dbm or 0dbm,
* Added lsi-interfaces in to filters,you can change in filters seting page.


~~~~~~~~~~~~~~~~~


 


Based on Zabbix's official template Net Juniper SNMPv2, only a few modifications have been made， 


This template can monitor RxLaserPower of the optical interface. 


 


* The interfaces in the down and shutdown states have been filtered.
* The virtual interfaces have also been filtered, (vme|lsi|pfe|pfh|.0|bme|gr|gre|tap|irb|dsc|ipip|pimd|pime|mtun|em0|em1|em2|esi|jsrv|vtep|me|lt|ip|lc|ut|mt|vt|pe|cbp|ud|fxp|dem|pip|pp|et|ae)
* The trigger threshold seting is -19dbm or 0dbm.

<li style="box-sizing: border-box; margin-top: 0.25

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Juniper Optical Interfaces Discovery|<p>-</p>|`SNMP agent`|net.if.optical.discovery<p>Update: 12h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Interface {#IFNAME}({#IFALIAS}): RxLaserPower|<p>-</p>|`SNMP agent`|jnxDomCurrentRxLaserPower[ifDescr.{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|({#IFALIAS}){#IFNAME}-RxLaser-lower-then-19db|<p>-</p>|<p>**Expression**: {Juniper-Optical-Interfaces:jnxDomCurrentRxLaserPower[ifDescr.{#SNMPINDEX}].last()}<-19 or {Juniper-Optical-Interfaces:jnxDomCurrentRxLaserPower[ifDescr.{#SNMPINDEX}].last()}=0</p><p>**Recovery expression**: {Juniper-Optical-Interfaces:jnxDomCurrentRxLaserPower[ifDescr.{#SNMPINDEX}].last()}>-19 and {Juniper-Optical-Interfaces:jnxDomCurrentRxLaserPower[ifDescr.{#SNMPINDEX}].last()}<>0</p>|warning|
|({#IFALIAS}){#IFNAME}-RxLaser-lower-then-19db (LLD)|<p>-</p>|<p>**Expression**: {Juniper-Optical-Interfaces:jnxDomCurrentRxLaserPower[ifDescr.{#SNMPINDEX}].last()}<-19 or {Juniper-Optical-Interfaces:jnxDomCurrentRxLaserPower[ifDescr.{#SNMPINDEX}].last()}=0</p><p>**Recovery expression**: {Juniper-Optical-Interfaces:jnxDomCurrentRxLaserPower[ifDescr.{#SNMPINDEX}].last()}>-19 and {Juniper-Optical-Interfaces:jnxDomCurrentRxLaserPower[ifDescr.{#SNMPINDEX}].last()}<>0</p>|warning|
