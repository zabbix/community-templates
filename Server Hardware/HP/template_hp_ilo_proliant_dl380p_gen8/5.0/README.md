# ILO ProLiant DL380p Gen8

## Description

Zabbix monitoring template about ILO ProLiant DL380p Gen8. This template controls CPU, RAM banks, temperature and disks status. By Federico Coppola 

## Overview

It is a simple template to monitoring *HP ILO ProLiant DL380p Gen8.*It controls the status about fans, disks, RAM banks, CPUs and temperature sensors.


It is tested with the Zabbix version 4 alpha and works properly.


*Federico*


 



## Author

Federico Coppola

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Bank Ram Nineteen|<p>Bank Ram number nineteen</p>|`SNMP agent`|status.ram.nineteen<p>Update: 30s</p>|
|Bank Ram Three|<p>Bank Ram number three</p>|`SNMP agent`|status.ram.three<p>Update: 30s</p>|
|Disk One Status|<p>Status physical drive 1=Other 2=Ok 3=Failed 4=Predictive Failure</p>|`SNMP agent`|status.disk.one<p>Update: 30s</p>|
|Disk Eight Status|<p>Status physical drive 1=Other 2=Ok 3=Failed 4=Predictive Failure</p>|`SNMP agent`|status.disk.eight<p>Update: 30s</p>|
|Bank Ram Twentytwo|<p>Bank Ram number twentytwo</p>|`SNMP agent`|status.ram.twentytwo<p>Update: 30s</p>|
|Bank Ram Eleven|<p>Bank Ram number eleven</p>|`SNMP agent`|status.ram.eleven<p>Update: 30s</p>|
|Bank Ram Six|<p>Bank Ram number six</p>|`SNMP agent`|status.ram.six<p>Update: 30s</p>|
|Bank Ram Seventeen|<p>Bank Ram number seventeen</p>|`SNMP agent`|status.ram.seventeen<p>Update: 30s</p>|
|Fan Three Status|<p>Status Fan Three Status = 2 is OK Status = 3 is degrade Status = 4 is faulty</p>|`SNMP agent`|status.fan.three<p>Update: 30s</p>|
|Bank Ram Five|<p>Bank Ram number five</p>|`SNMP agent`|status.ram.five<p>Update: 30s</p>|
|Disk Five Status|<p>Status physical drive 1=Other 2=Ok 3=Failed 4=Predictive Failure</p>|`SNMP agent`|status.disk.five<p>Update: 30s</p>|
|Fan One Status|<p>Status Fan One Status = 2 is OK Status = 3 is degrade Status = 4 is faulty</p>|`SNMP agent`|status.fan.one<p>Update: 30s</p>|
|Disk Seven Status|<p>Status physical drive 1=Other 2=Ok 3=Failed 4=Predictive Failure</p>|`SNMP agent`|status.disk.seven<p>Update: 30s</p>|
|Disk Four Status|<p>Status physical drive 1=Other 2=Ok 3=Failed 4=Predictive Failure</p>|`SNMP agent`|status.disk.four<p>Update: 30s</p>|
|Disk Six Status|<p>Status physical drive 1=Other 2=Ok 3=Failed 4=Predictive Failure</p>|`SNMP agent`|status.disk.six<p>Update: 30s</p>|
|Temp CPU One|<p>CPU 1</p>|`SNMP agent`|temp.cpu.one<p>Update: 30s</p>|
|Fan Four Status|<p>Status Fan Four Status = 2 is OK Status = 3 is degrade Status = 4 is faulty</p>|`SNMP agent`|status.fan.four<p>Update: 30s</p>|
|Temp CPU Two|<p>Temperature of CPU Two</p>|`SNMP agent`|temp.cpu.two<p>Update: 30s</p>|
|Bank Ram Ten|<p>Bank Ram number ten</p>|`SNMP agent`|status.ram.ten<p>Update: 30s</p>|
|Bank Ram Eight|<p>Bank Ram number eight</p>|`SNMP agent`|status.ram.eight<p>Update: 30s</p>|
|Bank Ram Sixteen|<p>Bank Ram number sixteen</p>|`SNMP agent`|status.ram.sixteen<p>Update: 30s</p>|
|Fan Six Status|<p>Status Fan Six Status = 2 is OK Status = 3 is degrade Status = 4 is faulty</p>|`SNMP agent`|status.fan.six<p>Update: 30s</p>|
|Disk Three Status|<p>Status physical drive 1=Other 2=Ok 3=Failed 4=Predictive Failure</p>|`SNMP agent`|status.disk.three<p>Update: 30s</p>|
|Bank Ram Two|<p>Bank Ram number two</p>|`SNMP agent`|status.ram.two<p>Update: 30s</p>|
|Bank Ram Four|<p>Bank Ram number four</p>|`SNMP agent`|status.ram.four<p>Update: 30s</p>|
|Bank Ram Thirteen|<p>Bank Ram number thirteen</p>|`SNMP agent`|status.ram.thirteen<p>Update: 30s</p>|
|Fan Five Status|<p>Status Fan Five Status = 2 is OK Status = 3 is degrade Status = 4 is faulty</p>|`SNMP agent`|status.fan.five<p>Update: 30s</p>|
|Fan Two Status|<p>Status Fan Two Status = 2 is OK Status = 3 is degrade Status = 4 is faulty</p>|`SNMP agent`|status.fan.two<p>Update: 30s</p>|
|Temp ILO Zone|<p>Temperature ILO Zone</p>|`SNMP agent`|temp.ilo.zone<p>Update: 30s</p>|
|Bank Ram One|<p>Bank Ram number one</p>|`SNMP agent`|status.ram.one<p>Update: 30s</p>|
|Bank Ram Twentyone|<p>Bank Ram number twentyone</p>|`SNMP agent`|status.ram.twentyone<p>Update: 30s</p>|
|Bank Ram Twelve|<p>Bank Ram number twelve</p>|`SNMP agent`|status.ram.twelve<p>Update: 30s</p>|
|Bank Ram Nine|<p>Bank Ram number nine</p>|`SNMP agent`|status.ram.nine<p>Update: 30s</p>|
|Bank Ram Eighteen|<p>Bank Ram number eighteen</p>|`SNMP agent`|status.ram.eighteen<p>Update: 30s</p>|
|CPU Two Status|<p>Status CPU Two If the status is different from 2 there is problem</p>|`SNMP agent`|status.cpu.two<p>Update: 30s</p>|
|Disk Two Status|<p>Status physical drive 1=Other 2=Ok 3=Failed 4=Predictive Failure</p>|`SNMP agent`|status.disk.two<p>Update: 30s</p>|
|Bank Ram Twenty|<p>Bank Ram number twenty</p>|`SNMP agent`|status.ram.twenty<p>Update: 30s</p>|
|CPU One Status|<p>Status CPU One If the status is different from 2 there is problem</p>|`SNMP agent`|status.cpu.one<p>Update: 30s</p>|
|Temp Inlet|<p>interfaces.ifTable.ifEntry.ifInOctets.1</p>|`SNMP agent`|temp.inlet.ambient<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

