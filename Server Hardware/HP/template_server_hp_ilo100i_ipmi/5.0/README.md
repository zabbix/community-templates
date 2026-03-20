# HP iLO100i IPMI

## Description

Template polling sensor data of a HP iLO100i

## Overview

This templates monitors the HP iLO100i integrated lights-out system for available sensors.


Tested only on Zabbix 4.2.x with a iLO100i, possibly working on other iLOs aswell.


 


You need to configure the **IPMI-Tab** on any monitored host with a **Username** and **Password**. These can be set in the User Administration of the iLO-Card and only need "User" rights.


 


**There are no triggers configured, alerts should be handled specifically for your own setup!**


 



## Author

RegularAlicorn

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|P3V3|<p>-</p>|`IPMI agent`|vol.p3v3<p>Update: 1h</p>|
|CPU ThermalTrip|<p>-</p>|`IPMI agent`|proc.thermaltrip<p>Update: 15m</p>|
|MLB inlet_1|<p>-</p>|`IPMI agent`|temp.mlb.inlet1<p>Update: 15m</p>|
|Front dimm1|<p>-</p>|`IPMI agent`|temp.front.dimm1<p>Update: 15m</p>|
|MULTI_BIT_ERR|<p>-</p>|`IPMI agent`|board.multi.bit.err<p>Update: 15m</p>|
|FH/FL riser2|<p>-</p>|`IPMI agent`|temp.fhfl.riser2<p>Update: 15m</p>|
|Sys. ACPI Pwr. State|<p>-</p>|`IPMI agent`|pwr.acpi.state<p>Update: 15m</p>|
|FAIL_TO_PWR_ON|<p>-</p>|`IPMI agent`|board.fail.to.pwr.on<p>Update: 15m</p>|
|PVCORE1|<p>-</p>|`IPMI agent`|vol.pvcore1<p>Update: 1h</p>|
|FH/FL riser1|<p>-</p>|`IPMI agent`|temp.fhfl.riser1<p>Update: 15m</p>|
|FAN3_INLET|<p>-</p>|`IPMI agent`|fan.3.inlet<p>Update: 15m</p>|
|CPU1 Sensor|<p>-</p>|`IPMI agent`|temp.cpu1<p>Update: 15m</p>|
|CPU1_CATERR|<p>-</p>|`IPMI agent`|proc.cpu1.caterr<p>Update: 15m</p>|
|PS1 Status|<p>-</p>|`IPMI agent`|pwr.state1<p>Update: 15m</p>|
|PVTT-CPU1|<p>-</p>|`IPMI agent`|vol.pvtt.cpu1<p>Update: 1h</p>|
|PROC1 DIMM1|<p>-</p>|`IPMI agent`|temp.proc1.dimm1<p>Update: 15m</p>|
|PS2 Status|<p>-</p>|`IPMI agent`|pwr.state2<p>Update: 15m</p>|
|HH/LP riser|<p>-</p>|`IPMI agent`|temp.hhlp.riser<p>Update: 15m</p>|
|P3V3-STBY|<p>-</p>|`IPMI agent`|vol.p3v3.stby<p>Update: 1h</p>|
|VRD_PWRGOOD_FAIL|<p>-</p>|`IPMI agent`|board.vrd.pwrgood.fail<p>Update: 15m</p>|
|PVCORE2|<p>-</p>|`IPMI agent`|vol.pvcore2<p>Update: 1h</p>|
|IOH_Temp|<p>-</p>|`IPMI agent`|temp.ioh.temp<p>Update: 15m</p>|
|PROC2 DIMM2|<p>-</p>|`IPMI agent`|temp.proc2.dimm2<p>Update: 15m</p>|
|HH/LP outlet|<p>-</p>|`IPMI agent`|temp.hhlp.outlet<p>Update: 15m</p>|
|IOH IERR2|<p>-</p>|`IPMI agent`|board.ioh.ierr2<p>Update: 15m</p>|
|MLB inlet_2|<p>-</p>|`IPMI agent`|temp.mlb.inlet2<p>Update: 15m</p>|
|PROC2 DIMM4|<p>-</p>|`IPMI agent`|temp.proc2.dimm4<p>Update: 15m</p>|
|PROC2 DIMM3|<p>-</p>|`IPMI agent`|temp.proc2.dimm3<p>Update: 15m</p>|
|Rear dimm2|<p>-</p>|`IPMI agent`|temp.rear.dimm2<p>Update: 15m</p>|
|FAN1_INLET|<p>-</p>|`IPMI agent`|fan.1.inlet<p>Update: 15m</p>|
|IOH inlet|<p>-</p>|`IPMI agent`|temp.ioh.inlet<p>Update: 15m</p>|
|IOH_NMI_DETECT|<p>-</p>|`IPMI agent`|board.ioh.nmi.detect<p>Update: 15m</p>|
|PVTT-CPU2|<p>-</p>|`IPMI agent`|vol.pvtt.cpu2<p>Update: 1h</p>|
|Rear dimm1|<p>-</p>|`IPMI agent`|temp.rear.dimm1<p>Update: 15m</p>|
|PROC2 DIMM6|<p>-</p>|`IPMI agent`|temp.proc2.dimm6<p>Update: 15m</p>|
|Front Panel|<p>-</p>|`IPMI agent`|temp.frontpanel<p>Update: 15m</p>|
|P5V|<p>-</p>|`IPMI agent`|vol.p5v<p>Update: 1h</p>|
|IOH_THERMALERT_N|<p>-</p>|`IPMI agent`|board.ioh.thermalert.n<p>Update: 15m</p>|
|P5V-STBY|<p>-</p>|`IPMI agent`|vol.p5v.stby<p>Update: 1h</p>|
|FH/FL outlet|<p>-</p>|`IPMI agent`|temp.fhfl.outlet<p>Update: 15m</p>|
|P12V|<p>-</p>|`IPMI agent`|vol.p12v<p>Update: 1h</p>|
|P1V1_IOH|<p>-</p>|`IPMI agent`|vol.p1v1.ioh<p>Update: 1h</p>|
|PROC1 DIMM3|<p>-</p>|`IPMI agent`|temp.proc1.dimm3<p>Update: 15m</p>|
|PSRed Status|<p>-</p>|`IPMI agent`|pwr.psred.status<p>Update: 15m</p>|
|PROC1 DIMM4|<p>-</p>|`IPMI agent`|temp.proc1.dimm4<p>Update: 15m</p>|
|Rear dimm3|<p>-</p>|`IPMI agent`|temp.rear.dimm3<p>Update: 15m</p>|
|MLB inlet_4|<p>-</p>|`IPMI agent`|temp.mlb.inlet4<p>Update: 15m</p>|
|P1V5_DDR3_CPU1|<p>-</p>|`IPMI agent`|vol.p1v5.ddr3.cpu1<p>Update: 1h</p>|
|P1V5_DDR3_CPU2|<p>-</p>|`IPMI agent`|vol.p1v5.ddr3.cpu2<p>Update: 1h</p>|
|PROC1 DIMM2|<p>-</p>|`IPMI agent`|temp.proc1.dimm2<p>Update: 15m</p>|
|IOH outlet|<p>-</p>|`IPMI agent`|temp.ioh.outlet<p>Update: 15m</p>|
|CPU2 Sensor|<p>-</p>|`IPMI agent`|temp.cpu2<p>Update: 15m</p>|
|MLB inlet_3|<p>-</p>|`IPMI agent`|temp.mlb.inlet3<p>Update: 15m</p>|
|Front dimm2|<p>-</p>|`IPMI agent`|temp.front.dimm2<p>Update: 15m</p>|
|Front dimm3|<p>-</p>|`IPMI agent`|temp.front.dimm3<p>Update: 15m</p>|
|FAN2_INLET|<p>-</p>|`IPMI agent`|fan.2.inlet<p>Update: 15m</p>|
|PROC2 DIMM5|<p>-</p>|`IPMI agent`|temp.proc2.dimm5<p>Update: 15m</p>|
|CPU2_PROCHOT|<p>-</p>|`IPMI agent`|proc.cpu2.prochot<p>Update: 15m</p>|
|PROC1 DIMM6|<p>-</p>|`IPMI agent`|temp.proc1.dimm6<p>Update: 15m</p>|
|CPU2_CATERR|<p>-</p>|`IPMI agent`|proc.cpu2.caterr<p>Update: 15m</p>|
|2U_2HDD13_Outlet|<p>-</p>|`IPMI agent`|board.2u.2hdd13.outlet<p>Update: 15m</p>|
|PROC1 DIMM5|<p>-</p>|`IPMI agent`|temp.proc1.dimm5<p>Update: 15m</p>|
|FAN4_INLET|<p>-</p>|`IPMI agent`|fan.4.inlet<p>Update: 15m</p>|
|PROC2 DIMM1|<p>-</p>|`IPMI agent`|temp.proc2.dimm1<p>Update: 15m</p>|
|2U_2HDD14_Outlet|<p>-</p>|`IPMI agent`|board.2u.2hdd14.outlet<p>Update: 15m</p>|
|CPU1_PROCHOT|<p>-</p>|`IPMI agent`|proc.cpu1.prochot<p>Update: 15m</p>|


## Triggers

There are no triggers in this template.

