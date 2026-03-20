# IPMI - Supermicro - X10DRW-E

## Overview

Template for the X10DRW-E motherboard which includes:


**Applications (4)**:


* Fans - 6 items
* Power Supply - 2 items
* Temperature - 23 items
* Voltage - 13 items


**Items (46):**


* Fan 1 - Fans
* Fan 2 - Fans
* Fan 3 - Fans
* Fan 4 - Fans
* Fan A - Fans
* Fan B - Fans
* PS1 Status - Power Supply
* PS2 Status - Power Supply
* CPU1 - Temperature
* CPU2 - Temperature
* PCH - Temperature
* System - Temperature
* Peripheral - Temperature
* Vcpu1VRM - Temperature
* Vcpu2VRM - Temperature
* P1-DIMMA1 - Temperature
* P1-DIMMA2 - Temperature
* P1-DIMMB1 - Temperature
* P1-DIMMB2 - Temperature
* P1-DIMMC1 - Temperature
* P1-DIMMC2 - Temperature
* P1-DIMMD1 - Temperature
* P1-DIMMD2 - Temperature
* P2-DIMME1 - Temperature
* P2-DIMME2 - Temperature
* P2-DIMMF1 - Temperature
* P2-DIMMF2 - Temperature
* P2-DIMMG1 - Temperature
* P2-DIMMG2 - Temperature
* P2-DIMMH1 - Temperature
* P2-DIMMH2 - Temperature
* 12V - Voltage
* 5VCC - Voltage
* 3.3VCC - Voltage
* VBAT - Voltage
* Vcpu1 - Voltage
* Vcpu2 - Voltage
* VDIMMAB - Voltage
* VDIMMCD - Voltage
* VDIMMEF - Voltage
* VDIMMGH - Voltage
* 5VSB - Voltage
* 3.3VSB - Voltage
* 1.5V PCH - Voltage
* 1.2V BMC - Voltage
* 1.05V PCH - Voltage


**Triggers (5):**


* CPU temperature critical on HOSTNAME
* DIMM temperature critical on HOSTNAME
* Fan critical on HOSTNAME
* Power supply issue on HOSTNAME
* System temperature critical on HOSTNAME


**Graphs (4):**


* CPU Temperature
* DIMM temperature
* FAN speed
* SYSTEM Temperature


## Author

Jean-Paul van Hamond

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PS1 Status|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.ps1.status<p>Update: 30</p>|
|Fan A|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.fana<p>Update: 30</p>|
|VDIMMAB|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.VDIMMAB<p>Update: 30</p>|
|P2-DIMMH1 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p2.dimmh1.temp<p>Update: 30</p>|
|P1-DIMMC2 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p1.dimmc2.temp<p>Update: 30</p>|
|VDIMMCD|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.VDIMMCD<p>Update: 30</p>|
|VDIMMGH|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.VDIMMGH<p>Update: 30</p>|
|5VSB|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.5VSB<p>Update: 30</p>|
|Fan B|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.fanb<p>Update: 30</p>|
|Vcpu1|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.Vcpu1<p>Update: 30</p>|
|VBAT|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.VBAT<p>Update: 30</p>|
|Fan 2|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.fan2<p>Update: 30</p>|
|System - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.system.temp<p>Update: 30</p>|
|Vcpu2VRM - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.vcpu2vrm.temp<p>Update: 30</p>|
|P2-DIMMF1 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p2.dimmf1.temp<p>Update: 30</p>|
|P1-DIMMB1 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p1.dimmb1.temp<p>Update: 30</p>|
|P1-DIMMD1 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p1.dimmd1.temp<p>Update: 30</p>|
|12V|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.12V<p>Update: 30</p>|
|P1-DIMMB2 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p1.dimmb2.temp<p>Update: 30</p>|
|P1-DIMMC1 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p1.dimmc1.temp<p>Update: 30</p>|
|Peripheral - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.peripheral.temp<p>Update: 30</p>|
|3.3VSB|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.3.3VSB<p>Update: 30</p>|
|Vcpu2|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.Vcpu2<p>Update: 30</p>|
|P2-DIMMH2 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p2.dimmh2.temp<p>Update: 30</p>|
|Vcpu1VRM - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.vcpu1vrm.temp<p>Update: 30</p>|
|CPU1 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.cpu1.temp<p>Update: 30</p>|
|PS2 Status|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.ps2.status<p>Update: 30</p>|
|CPU2 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.cpu2.temp<p>Update: 30</p>|
|P2-DIMMG1 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p2.dimmg1.temp<p>Update: 30</p>|
|P2-DIMME2 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p2.dimme2.temp<p>Update: 30</p>|
|P1-DIMMA2 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p1.dimma2.temp<p>Update: 30</p>|
|Fan 3|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.fan3<p>Update: 30</p>|
|P1-DIMMD2 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p1.dimmd2.temp<p>Update: 30</p>|
|P2-DIMMF2 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p2.dimmf2.temp<p>Update: 30</p>|
|P1-DIMMA1 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p1.dimma1.temp<p>Update: 30</p>|
|VDIMMEF|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.VDIMMEF<p>Update: 30</p>|
|PCH - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.pch.temp<p>Update: 30</p>|
|1.2V BMC|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.1.2VBMC<p>Update: 30</p>|
|3.3VCC|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.3.3VCC<p>Update: 30</p>|
|P2-DIMMG2 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p2.dimmg2.temp<p>Update: 30</p>|
|Fan 4|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.fan4<p>Update: 30</p>|
|1.05V PCH|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.1.05VPCH<p>Update: 30</p>|
|5VCC|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.5VCC<p>Update: 30</p>|
|Fan 1|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.fan1<p>Update: 30</p>|
|P2-DIMME1 - Temp|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.p2.dimme1.temp<p>Update: 30</p>|
|1.5V PCH|<p>-</p>|`IPMI agent`|ipmi.supermicro.x10drw-e.1.5VPCH<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

