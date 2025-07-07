# EVS template

## Overview


This template will monitor various important aspects of an EVS XServer.

It has auto discovery of all channels, with item prototypes for each channels Video Codec and Video Standard.

Is also auto discovery of the RAID array. It will show the RAID status, aswell as the current rebuild progress.

It uses the new OID method for SNMP OID Discovery, where a Walk Item is used with dependent Item and Trigger prototypes. This is supported from Zabbix ver 6.4 and higher.

There is also numerous Value Mapping added to Items, to ease the readout of the raw integer values returned.

NOTE: It requires the following four EVS MIB-files imported into Zabbix in order to work:

- evs-xserver-mib 1.mib
- evs-server-mib 1.mib
- evs-product-mib 1.mib
- evs-global-reg 1.mib


## Author

Rune Olsen

## Discovery rules

- EVS Channels
- RAID Array

## Template links

There are no template links in this template.

## Items collected

- EVS Walk Channel Table
- No. of Audio Channels set
- No of output channels set
- Number of Recorder Channels
- Recorder Train Expiration in Days
- Timecode input
- SNMP Walk RAID Table
- EVS Used Capacity
- EVS Total capacity
- xsrv XNet Db State
- xsrv XNet Traffic State
- xsrv XNet ConState
- Recorder Train Expiration Status
- EVS Thermal Status
- EVS PSU status
- Server Free Space
- EVS Server Operational Status

## Triggers

- EVS free space
- EVS Free Space
- EVS in maintenance
- EVS is degraded
- EVS is disabled
- EVS is faulty
- PSU State
- Timecode input status
- XNet Connection state
- XNet DB State not OK
- XNet Traffic not normal
- Recorder Field Counter
- Thermal Status
- Video Standard
- RAID Status

## Graphs

- EVS Current Free Space (pie)
- EVS Free Space over time (stacked)

## Dashboard

One simple dashboard, showing free space and current problems per EVS