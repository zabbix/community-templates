# DEVA SmartGen 6

## Description

Template for SNMP-enabled RDS coder DEVA SmartGen 6 http://www.devabroadcast.com v1.0: 2017-10-30 Roman Ermakov, r.ermakov@emg.fm

## Overview

Template for Deva SmartGen 6 RDS encoder. Uses SNMP data only.


Monitored items:


1. Main RDS values: PI, PS, PTT, PTY, RT, TA, TP
2. RDS level
3. GPS satellites in view and in use
4. Internal temperature


Triggers:


1. PI code changed
2. Device is overheat
3. Free disk space is less than 20%
4. PS


## Author

Roman Ermakov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status PTY|<p>"monitor RDS PTY"</p>|`SNMP agent`|mntrRDS.RDS.PTY<p>Update: 1200</p>|
|RDS Device Localtime|<p>"Encoder time"</p>|`SNMP agent`|device.RDS.Localtime<p>Update: 3600</p>|
|Status RDS Sync|<p>.1.3.6.1.4.1.35833.14.3.2</p>|`SNMP agent`|mntrRDS.Sync<p>Update: 60</p>|
|Status RDS Level|<p>"monitor RDS Level Value"</p>|`SNMP agent`|mntrRDS.RDS.Level<p>Update: 60</p>|
|GPS Fix Mode|<p>mntrGPS.FixMode INTEGER { fixModeUnknown ( 0 ) , fixNotAvailable ( 1 ) , fix2D ( 2 ) , fix3D ( 3 ) }</p>|`SNMP agent`|mntrGPS.FixMode<p>Update: 1200</p>|
|Status RT|<p>"monitor RDS RT"</p>|`SNMP agent`|mntrRDS.RDS.RT<p>Update: 180</p>|
|Status PTT|<p>"Pilot Status"</p>|`SNMP agent`|mntrRDS.PTT.Status<p>Update: 1200</p>|
|Status PS|<p>"monitor RDS PS"</p>|`SNMP agent`|mntrRDS.RDS.PS<p>Update: 45</p>|
|Internal Diskspace Free|<p>"Free Disk Space (KiB)"</p>|`SNMP agent`|device.diskSpaceFree<p>Update: 20</p>|
|Status TA EON Input|<p>"TA EON Input State"</p>|`SNMP agent`|mntrRDS.TA.EON.Input<p>Update: 60</p>|
|Status PI|<p>"monitor RDS PI"</p>|`SNMP agent`|mntrRDS.RDS.PI<p>Update: 1200</p>|
|GPS Satellites In View|<p>"Satellites in view"</p>|`SNMP agent`|mntrGPS.SatsInView<p>Update: 1200</p>|
|Internal Temperature|<p>"Device internal temperature EXAMPLE:355 = 35.5 deg C"</p>|`SNMP agent`|device.Temperature<p>Update: 1200</p>|
|Internal Diskspace Total|<p>"Total Disk Space (KiB)"</p>|`SNMP agent`|device.diskSpaceTotal<p>Update: 20</p>|
|Internal Diskspace Free Percent|<p>-</p>|`Calculated`|device.diskSpaceFree.Percent<p>Update: 20</p>|
|Status TA|<p>"monitor RDS TA"</p>|`SNMP agent`|mntrRDS.RDS.TA<p>Update: 60</p>|
|Status TA Input|<p>"TA Input State"</p>|`SNMP agent`|mntrRDS.TA.Input<p>Update: 60</p>|
|Device Serial Number|<p>device.serNum</p>|`SNMP agent`|device.serNum<p>Update: 86400</p>|
|GPS Satellites In Use|<p>"Satellites in use"</p>|`SNMP agent`|mntrGPS.SatsInUse<p>Update: 1200</p>|
|Status TP|<p>"monitor RDS TP"</p>|`SNMP agent`|mntrRDS.RDS.TP<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

