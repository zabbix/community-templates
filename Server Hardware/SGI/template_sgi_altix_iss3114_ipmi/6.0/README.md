# 3-IPMI SGI Altix ISS3114

## Overview

IPMI sensors for SGI Altix ISS3114:


Agg Therm Mgn 1, BB +1.05Vccp P1, BB +1.05Vccp P2, BB +1.1V STBY, BB +1.5 P1MEM AB, BB +1.5 P1MEM CD, BB +1.5 P2MEM AB, BB +1.5 P2MEM CD, BB +1.8V AUX, BB +3.3V, BB +3.3V AUX, BB +3.3V Vbat, BB +5.0V, BB +5.0V STBY, BB +12.0V, BB P1 VR Temp, BB P2 VR Temp, BB Vtt 1 Temp, BB Vtt 2 Temp, DIMM Thrm Mrgn 1, DIMM Thrm Mrgn 2, DIMM Thrm Mrgn 3, DIMM Thrm Mrgn 4, Exit Air Temp, Fan 1 Present, Fan 2 Present, Fan 3 Present, Fan 4 Present, Fan 5 Present, Fan Redundancy, Front Panel Temp, HDD 0 Status, HDD 1 Status, HDD 2 Status, HDD 3 Status, HDD 4 Status, HDD 5 Status, HDD 6 Status, HDD 7 Status, HDD 8 Status, HDD 9 Status, HDD 10 Status, HDD 11 Status, HDD 12 Status, HDD 13 Status, HDD 14 Status, HDD 15 Status, HDD 16 Status, HDD 17 Status, HDD 18 Status, HDD 19 Status, HDD 20 Status, HDD 21 Status, HDD 22 Status, HDD 23 Status, HSBP 1 Temp, HSBP 2 Temp, HSBP 3 Temp, LAN NIC Temp, P1 DTS Therm Mgn, P1 Therm Margin, P2 DTS Therm Mgn, P2 Therm Margin, Power Triggers 1, PS1 Curr Out %, PS1 Fan Fail, PS1 Input Power, PS1 Status, PS1 Temperature, PS2 Curr Out %, PS2 Fan Fail, PS2 Input Power, PS2 Status, PS2 Temperature, Pwr Unit Redund, SSB Temp, System Airflow, System Fan 1, System Fan 2, System Fan 3, System Fan 4, System Fan 5



## Author

Daniel Carvalho

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|HDD 7 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.7.status<p>Update: 300</p>|
|Fan Redundancy|<p>-</p>|`IPMI agent`|ipmi.fan.redundancy<p>Update: 300</p>|
|HDD 18 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.18.status<p>Update: 300</p>|
|HDD 3 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.3.status<p>Update: 300</p>|
|System Fan 4|<p>-</p>|`IPMI agent`|ipmi.system.fan.4<p>Update: 300</p>|
|P2 Therm Margin|<p>-</p>|`IPMI agent`|ipmi.p2.therm.margin<p>Update: 300</p>|
|HDD 21 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.21.status<p>Update: 300</p>|
|Fan 4 Present|<p>-</p>|`IPMI agent`|ipmi.fan.4.present<p>Update: 300</p>|
|DIMM Thrm Mrgn 3|<p>-</p>|`IPMI agent`|ipmi.dimm.thrm.mrgn.3<p>Update: 300</p>|
|BB P2 VR Temp|<p>-</p>|`IPMI agent`|ipmi.bb.p2.vr.temp<p>Update: 300</p>|
|PS2 Curr Out %|<p>-</p>|`IPMI agent`|ipmi.ps2.curr.out<p>Update: 300</p>|
|HDD 10 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.10.status<p>Update: 300</p>|
|BB +3.3V Vbat|<p>-</p>|`IPMI agent`|ipmi.bb.3.3v.vbat<p>Update: 300</p>|
|HDD 12 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.12.status<p>Update: 300</p>|
|HDD 15 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.15.status<p>Update: 300</p>|
|HSBP 3 Temp|<p>-</p>|`IPMI agent`|ipmi.hsbp.3.temp<p>Update: 300</p>|
|PS2 Input Power|<p>-</p>|`IPMI agent`|ipmi.ps2.input.power<p>Update: 300</p>|
|HDD 0 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.0.status<p>Update: 300</p>|
|HDD 23 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.23.status<p>Update: 300</p>|
|HDD 16 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.16.status<p>Update: 300</p>|
|System Fan 3|<p>-</p>|`IPMI agent`|ipmi.system.fan.3<p>Update: 300</p>|
|HDD 22 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.22.status<p>Update: 300</p>|
|SSB Temp|<p>-</p>|`IPMI agent`|ipmi.bb.ssb.temp<p>Update: 300</p>|
|HDD 11 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.11.status<p>Update: 300</p>|
|PS1 Temperature|<p>-</p>|`IPMI agent`|ipmi.ps1.temperature<p>Update: 300</p>|
|P1 Therm Margin|<p>-</p>|`IPMI agent`|ipmi.p1.therm.margin<p>Update: 300</p>|
|BB +1.5 P2MEM AB|<p>-</p>|`IPMI agent`|ipmi.bb.1.5p2mem.ab<p>Update: 300</p>|
|BB +1.5 P1MEM AB|<p>-</p>|`IPMI agent`|ipmi.bb.1.5p1mem.ab<p>Update: 300</p>|
|PS1 Status|<p>-</p>|`IPMI agent`|ipmi.ps1.status<p>Update: 300</p>|
|DIMM Thrm Mrgn 1|<p>-</p>|`IPMI agent`|ipmi.dimm.thrm.mrgn.1<p>Update: 300</p>|
|HDD 13 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.13.status<p>Update: 300</p>|
|HDD 1 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.1.status<p>Update: 300</p>|
|System Fan 1|<p>-</p>|`IPMI agent`|ipmi.system.fan.1<p>Update: 300</p>|
|System Airflow|<p>-</p>|`IPMI agent`|ipmi.system.airflow<p>Update: 300</p>|
|BB +1.8V AUX|<p>-</p>|`IPMI agent`|ipmi.bb.1.8v.aux<p>Update: 300</p>|
|HDD 6 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.6.status<p>Update: 300</p>|
|DIMM Thrm Mrgn 2|<p>-</p>|`IPMI agent`|ipmi.dimm.thrm.mrgn.2<p>Update: 300</p>|
|HSBP 1 Temp|<p>-</p>|`IPMI agent`|ipmi.hsbp.1.temp<p>Update: 300</p>|
|BB +3.3V|<p>-</p>|`IPMI agent`|ipmi.bb.3.3v<p>Update: 300</p>|
|Exit Air Temp|<p>-</p>|`IPMI agent`|ipmi.exit.air.temp<p>Update: 300</p>|
|LAN NIC Temp|<p>-</p>|`IPMI agent`|ipmi.lan.nic.temp<p>Update: 300</p>|
|Fan 3 Present|<p>-</p>|`IPMI agent`|ipmi.fan.3.present<p>Update: 300</p>|
|System Fan 5|<p>-</p>|`IPMI agent`|ipmi.system.fan.5<p>Update: 300</p>|
|BB +5.0V|<p>-</p>|`IPMI agent`|ipmi.bb.5v<p>Update: 300</p>|
|DIMM Thrm Mrgn 4|<p>-</p>|`IPMI agent`|ipmi.dimm.thrm.mrgn.4<p>Update: 300</p>|
|PS2 Fan Fail|<p>-</p>|`IPMI agent`|ipmi.ps2.fan.fail<p>Update: 300</p>|
|HDD 19 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.19.status<p>Update: 300</p>|
|HDD 2 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.2.status<p>Update: 300</p>|
|BB +1.05Vccp P2|<p>-</p>|`IPMI agent`|ipmi.bb.1.05vccp.p2<p>Update: 300</p>|
|BB +1.5 P2MEM CD|<p>-</p>|`IPMI agent`|ipmi.bb.1.5p2mem.cd<p>Update: 300</p>|
|HDD 4 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.4.status<p>Update: 300</p>|
|P1 DTS Therm Mgn|<p>-</p>|`IPMI agent`|ipmi.p1.dts.therm.mgn<p>Update: 300</p>|
|HDD 20 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.20.status<p>Update: 300</p>|
|PS1 Fan Fail|<p>-</p>|`IPMI agent`|ipmi.ps1.fan.fail<p>Update: 300</p>|
|BB +1.05Vccp P1|<p>-</p>|`IPMI agent`|ipmi.bb.1.05vccp.p1<p>Update: 300</p>|
|Agg Therm Mgn 1|<p>-</p>|`IPMI agent`|ipmi.agg.therm.mgn.1<p>Update: 300</p>|
|HDD 14 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.14.status<p>Update: 300</p>|
|HSBP 2 Temp|<p>-</p>|`IPMI agent`|ipmi.hsbp.2.temp<p>Update: 300</p>|
|BB +1.1V STBY|<p>-</p>|`IPMI agent`|ipmi.bb.1.1v.stby<p>Update: 300</p>|
|BB +5.0V STBY|<p>-</p>|`IPMI agent`|ipmi.bb.5v.stby<p>Update: 300</p>|
|PS2 Temperature|<p>-</p>|`IPMI agent`|ipmi.ps2.temperature<p>Update: 300</p>|
|BB +12.0V|<p>-</p>|`IPMI agent`|ipmi.bb.12v<p>Update: 300</p>|
|Power|<p>-</p>|`IPMI agent`|ipmi.power<p>Update: 300</p>|
|BB Vtt 1 Temp|<p>-</p>|`IPMI agent`|ipmi.bb.vtt.1.temp<p>Update: 300</p>|
|Fan 2 Present|<p>-</p>|`IPMI agent`|ipmi.fan.2.present<p>Update: 300</p>|
|BB +3.3V AUX|<p>-</p>|`IPMI agent`|ipmi.bb.3.3v.aux<p>Update: 300</p>|
|BB Vtt 2 Temp|<p>-</p>|`IPMI agent`|ipmi.bb.vtt.2.temp<p>Update: 300</p>|
|BB +1.5 P1MEM CD|<p>-</p>|`IPMI agent`|ipmi.bb.1.5p1mem.cd<p>Update: 300</p>|
|P2 DTS Therm Mgn|<p>-</p>|`IPMI agent`|ipmi.p2.dts.therm.mgn<p>Update: 300</p>|
|Pwr Unit Redund|<p>-</p>|`IPMI agent`|ipmi.pwr.unit.redund<p>Update: 300</p>|
|HDD 9 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.9.status<p>Update: 300</p>|
|PS2 Status|<p>-</p>|`IPMI agent`|ipmi.ps2.status<p>Update: 300</p>|
|HDD 8 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.8.status<p>Update: 300</p>|
|Fan 5 Present|<p>-</p>|`IPMI agent`|ipmi.fan.5.present<p>Update: 300</p>|
|HDD 17 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.17.status<p>Update: 300</p>|
|Fan 1 Present|<p>-</p>|`IPMI agent`|ipmi.fan.1.present<p>Update: 300</p>|
|PS1 Input Power|<p>-</p>|`IPMI agent`|ipmi.ps1.input.power<p>Update: 300</p>|
|Front Panel Temp|<p>-</p>|`IPMI agent`|ipmi.front.panel.temp<p>Update: 300</p>|
|System Fan 2|<p>-</p>|`IPMI agent`|ipmi.system.fan.2<p>Update: 300</p>|
|BB P1 VR Temp|<p>-</p>|`IPMI agent`|ipmi.bb.p1.vr.temp<p>Update: 300</p>|
|HDD 5 Status|<p>-</p>|`IPMI agent`|ipmi.hdd.5.status<p>Update: 300</p>|
|PS1 Curr Out %|<p>-</p>|`IPMI agent`|ipmi.ps1.curr.out<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

