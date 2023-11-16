# SNMP Blockbit NGFW Devices

## Overview

Blockbit NGFW Services,Connection num, Sessions num, CPU%, RAM%, Disk (Total and Used), Interface data (link and speed), Throughput TX + RX, Temperature.

## Author

Acélio Carvalho

## Discovery rules

|Name|Description|Type|
|----|-----------|----|
|CPU Temperature| <p>Discover CPU temperature entities in Blockbit Sensors</p>|`SNMP agent`|
|Network Interfaces|<p>Discovering interfaces from IF-MIB.</p>|`SNMP agent`|
|Block devices|<p>Block devices are discovered from UCD-DISKIO-MIB::diskIOTable</p>|`SNMP agent`|
|Mounted filesytem|<p>HOST-RESOURCES-MIB::hrStorage discovery with storage filter</p>|`SNMP agent`|
|CPU|<p>This discovery will create set of per core CPU metrics from UCD-SNMP-MIB, using {#CPU.COUNT} in preprocessing. That's the only reason why LLD is used.</p>|`SNMP agent`|
