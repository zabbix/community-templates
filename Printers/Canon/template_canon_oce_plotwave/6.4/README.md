## Overview

100% Works on Canon PlotWave 5500 and Oce 550

I recommend using alerts for the template

## Author

Burtsev Aleksei

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PlotWave Detected Error State|<p>This object represents any error conditions detected by the printer.</p>|`SNMP agent`|.1.3.6.1.2.1.25.3.5.1.2.1<p>Update: 30s</p>|
|PlotWave Detected Error State: PlotWave Detected Error State 1 value|<p>1 element from PlotWave Detected Error State</p>|`Dependent item`|PlotWave Detected Error State|
|PlotWave Detected Error State: PlotWave Detected Error State 2 value|<p>2 element from PlotWave Detected Error State</p>|`Dependent item`|PlotWave Detected Error State|
|PlotWave Detected Error State: PlotWave Detected Error State 3 value|<p>3 element from PlotWave Detected Error State</p>|`Dependent item`|PlotWave Detected Error State|
|PlotWave Detected Error State: PlotWave Detected Error State 4 value|<p>4 element from PlotWave Detected Error State</p>|`Dependent item`|PlotWave Detected Error State|
|PlotWave Device Errors|<p>The number of errors detected on this device.</p>|`SNMP agent`|.1.3.6.1.2.1.25.3.2.1.6.1<p>Update: 30s</p>|
|PlotWave Device Status|<p>The current operational state</p>|`SNMP agent`|.1.3.6.1.2.1.25.3.2.1.5.1<p>Update: 30s</p>|
|PlotWave Input Media Name Roll 1|<p>Name of paper roll in 1 tray</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.12.1.1<p>Update: 30s</p>|
|PlotWave Input Media Name Roll 2|<p>Name of paper roll in 2 tray</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.12.1.2<p>Update: 30s</p>|
|PlotWave Input Media Name Roll 3|<p>Name of paper roll in 3 tray</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.12.1.3<p>Update: 30s</p>|
|PlotWave Input Media Name Roll 4|<p>Name of paper roll in 4 tray</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.12.1.4<p>Update: 30s</p>|
|PlotWave Input Media Weight Roll 1|<p>Weight of paper roll in 1 roll</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.20.1.1<p>Update: 30s</p>|
|PlotWave Input Media Weight Roll 2|<p>Weight of paper roll in 2 roll</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.20.1.2<p>Update: 30s</p>|
|PlotWave Input Media Weight Roll 3|<p>Weight of paper roll in 3 roll</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.20.1.3<p>Update: 30s</p>|
|PlotWave Input Media Weight Roll 4|<p>Weight of paper roll in 4 roll</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.20.1.4<p>Update: 30s</p>|
|PlotWave Input Status Roll 1|<p>Status of paper roll in 1 roll</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.11.1.1<p>Update: 30s</p>|
|PlotWave Input Status Roll 2|<p>Status of paper roll in 2 roll</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.11.1.2<p>Update: 30s</p>|
|PlotWave Input Status Roll 3|<p>Status of paper roll in 3 roll</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.11.1.3<p>Update: 30s</p>|
|PlotWave Input Status Roll 4|<p>Status of paper roll in 4 roll</p>|`SNMP agent`|.1.3.6.1.2.1.43.8.2.1.11.1.4<p>Update: 30s</p>|
|PlotWave IP|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.4.20.1.1.<p>Update: 12h</p>|
|PlotWave Mask|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.4.20.1.3.<p>Update: 6h</p>|
|PlotWave Printer Status|<p>The current status of printer device</p>|`SNMP agent`|.1.3.6.1.2.1.25.3.5.1.1.1<p>Update: 5s</p>|
|PlotWave Print Name|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.43.5.1.1.16.1<p>Update: 6h</p>|
|PlotWave Serial Number|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.43.5.1.1.17.1<p>Update: 1d</p>|


## Triggers

|Name|Description|Expression|Default status|
|----|-----------|----|----|
|Device Error {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DeviceErrors)>0|Enabled|
|Door Open {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState2)=8|Disabled|
|Input Tray Empty {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState4)=4|Disabled|
|Input Tray Missing {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState3)=8|Disabled|
|Jammed {HOSTNAME}|Printing stopped 🤷 (Jam, Waste ink, etc.)|last(/Template Canon PlotWave/PlotWave.DetectedErrorState2)=4 and last(/Template Canon PlotWave/PlotWave.DetectedErrorState1)<>1|Enabled|
|Low Paper {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState1)=8|Disabled|
|Low Toner {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState1)=2|Enabled|
|Marker Supply Missing {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState3)=2|Enabled|
|No Paper {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState1)=4|Disabled|
|No Toner {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState1)=1|Enabled|
|Offline {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState2)=2|Enabled|
|Other paper size in the 1 roll {HOSTNAME}|!You need to set your value!|Problem: last(/Template Canon PlotWave/PlotWave.InputMediaName1)<>"Paper 20 lb A0 (841 mm)"<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputMediaName1)="Paper 20 lb A0 (841 mm)"|Enabled|
|Other paper size in the 2 roll {HOSTNAME}|!You need to set your value!|Problem: last(/Template Canon PlotWave/PlotWave.InputMediaName2)<>"Paper 20 lb A1 (594 mm)"<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputMediaName2)="Paper 20 lb A1 (594 mm)"|Enabled|
|Other paper size in the 3 roll {HOSTNAME}|!You need to set your value!|Problem: last(/Template Canon PlotWave/PlotWave.InputMediaName3)<>"Paper 20 lb A2 (420 mm)"<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputMediaName3)="Paper 20 lb A2 (420 mm)"|Enabled|
|Other paper size in the 4 roll {HOSTNAME}|!You need to set your value!|Problem: last(/Template Canon PlotWave/PlotWave.InputMediaName4)<>"Paper 20 lb A3 (297 mm)"<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputMediaName4)="Paper 20 lb A3 (297 mm)"|Enabled|
|Output Full {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState4)=8|Disabled|
|Output Near Full {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState3)=1|Enabled|
|Output Tray Missing {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState3)=4|Enabled|
|Overdue Prevent Maint {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState4)=2|Enabled|
|Papper in the 1 roll is over {HOSTNAME}|-----------|Problem: last(/Template Canon PlotWave/PlotWave.InputStatus1)<>0<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputStatus1)=0|Enabled|
|Papper in the 2 roll is over {HOSTNAME}|-----------|Problem: last(/Template Canon PlotWave/PlotWave.InputStatus2)<>0<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputStatus2)=0|Enabled|
|Papper in the 3 roll is over {HOSTNAME}|-----------|Problem: last(/Template Canon PlotWave/PlotWave.InputStatus3)<>0<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputStatus3)=0|Enabled|
|Papper in the 4 roll is over {HOSTNAME}|-----------|Problem: last(/Template Canon PlotWave/PlotWave.InputStatus4)<>0<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputStatus4)=0|Enabled|
|Plotwave is printing {HOSTNAME}|-----------|Problem: last(/Template Canon PlotWave/PlotWave.PrinterStatus)=4<br>Recovery: last(/Template Canon PlotWave/PlotWave.PrinterStatus)=3|Disabled|
|Plotwave is wamping {HOSTNAME}|-----------|Problem: last(/Template Canon PlotWave/PlotWave.PrinterStatus)=5<br>Recovery: last(/Template Canon PlotWave/PlotWave.PrinterStatus)=3|Enabled|
|Service Requested {HOSTNAME}|-----------|last(/Template Canon PlotWave/PlotWave.DetectedErrorState2)=1|Enabled|
|The Warning {HOSTNAME}|-----------|Problem: last(/Template Canon PlotWave/PlotWave.DeviceStatus)=3<br>Recovery: last(/Template Canon PlotWave/PlotWave.DeviceStatus)=2|Enabled|
|Unknow Device Status {HOSTNAME}|-----------|Problem: last(/Template Canon PlotWave/PlotWave.DeviceStatus)=1<br>Recovery: last(/Template Canon PlotWave/PlotWave.DeviceStatus)=2|Enabled|
|Сhose a different paper weight in the 1 roll {HOSTNAME}|!You need to set your value!|Problem: last(/Template Canon PlotWave/PlotWave.InputMediaWeight1)<>75<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputMediaWeight1)=75|Enabled|
|Сhose a different paper weight in the 2 roll {HOSTNAME}|!You need to set your value!|	Problem: last(/Template Canon PlotWave/PlotWave.InputMediaWeight2)<>75<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputMediaWeight2)=75|Enabled|
|Сhose a different paper weight in the 3 roll {HOSTNAME}|!You need to set your value!|Problem: last(/Template Canon PlotWave/PlotWave.InputMediaWeight3)<>75<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputMediaWeight3)=75|Enabled|
|Сhose a different paper weight in the 4 roll {HOSTNAME}|!You need to set your value!|Problem: last(/Template Canon PlotWave/PlotWave.InputMediaWeight4)<>75<br>Recovery: last(/Template Canon PlotWave/PlotWave.InputMediaWeight4)=75|Enabled|
