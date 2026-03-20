# Quagga BGP

## Description

Template for auto-discovery bgp peers and monitor they.

## Overview

This is a template to monitor peerings BGP Quagga with Zabbix.



## Author

Renan Rodrigues

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP discovery|<p>-</p>|`Zabbix agent`|bgpdiscovery<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Peer {#BGPPEER}|<p>-</p>|`Zabbix agent`|bgpmon[{#BGPPEER}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|BGP session with {#BGPPEER} is down|<p>Bgp session is down</p>|<p>**Expression**: {Quagga BGP:bgpmon[{#BGPPEER}].last()}=0</p><p>**Recovery expression**: </p>|warning|
|BGP session with {#BGPPEER} is down (LLD)|<p>Bgp session is down</p>|<p>**Expression**: {Quagga BGP:bgpmon[{#BGPPEER}].last()}=0</p><p>**Recovery expression**: </p>|warning|
