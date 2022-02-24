# CTCU Frm220

## Overview

This Template works with snmpv1/2 and uses {$SNMP\_COMMUNITY} Macro.


 


- General Monitoring of NMC its self. (FAN/PSU)


- Autodiscovery for following Line Cards


 - 1000MS


 - 1000DS


 - 3R-10G-SS


 - 3R-10G


 


This Template will possibly not work for other CTCU Versions. It should work with other Zabbix Versions, but it is not testet.


I am not able to discover other Linecards, because we dont have them in use yet.



## Author

Rene Schwarz

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|1000DS|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.390.20.1.12.0<p>Update: 30s</p>|
|3R-10G-SS|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.210.20.1.9.0<p>Update: 30s</p>|
|3R-10G|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.7.0<p>Update: 30s</p>|
|1000MS|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.310.20.1.11.0<p>Update: 30s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|FAN2a Status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.41.12.0<p>Update: 1m</p>|
|FAN1b Status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.41.10.0<p>Update: 1m</p>|
|FAN1a Status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.41.8.0<p>Update: 1m</p>|
|Device uptime|<p>The time since the network management portion of the system was last re-initialized.</p>|`SNMP agent`|sysUpTime<p>Update: 1m</p>|
|PSU1 Status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.41.4.0<p>Update: 1m</p>|
|Device name|<p>An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 1h</p>|
|FAN2b Status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.41.14.0<p>Update: 1m</p>|
|PSU2 Status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.41.6.0<p>Update: 1m</p>|
|1000DS Slot{#SNMPINDEX} Link1(LWL) Status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.390.20.1.12.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000DS Slot{#SNMPINDEX} Link2(LWL) Status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.390.20.1.17.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000DS Slot{#SNMPINDEX} Link1 Tx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.390.20.1.32.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000DS Slot{#SNMPINDEX} Link1 Rx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.390.20.1.33.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000DS Slot{#SNMPINDEX} SFP1 Temperatur|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.390.20.1.34.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000DS Slot{#SNMPINDEX} Link2 Tx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.390.20.1.47.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000DS Slot{#SNMPINDEX} Link2 Rx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.390.20.1.48.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000DS Slot{#SNMPINDEX} SFP2 Temperatur|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.390.20.1.49.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G-SS Slot{#SNMPINDEX} Link1 status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.210.20.1.9.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G-SS Slot{#SNMPINDEX} Link2 status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.210.20.1.10.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G-SS Slot{#SNMPINDEX} Link1 Tx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.210.20.1.36.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G-SS Slot{#SNMPINDEX} Link1 Rx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.210.20.1.37.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G-SS Slot{#SNMPINDEX} SFP1 Temperatur|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.210.20.1.38.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G-SS Slot{#SNMPINDEX} Link2 Tx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.210.20.1.50.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G-SS Slot{#SNMPINDEX} Link2 Rx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.210.20.1.51.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G-SS Slot{#SNMPINDEX} SFP2 Temperatur|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.210.20.1.52.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link1 status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.7.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link2 status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.8.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link3 status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.9.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link4 status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.10.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link1 Tx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.66.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link1 Rx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.67.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} SFP1 Temperatur|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.69.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link2 Tx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.79.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link2 Rx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.80.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} SFP2 Temperatur|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.82.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link3 Tx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.92.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link3 Rx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.93.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} SFP3 Temperatur|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.95.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link4 Tx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.105.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} Link4 Rx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.106.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|3R-10G Slot{#SNMPINDEX} SFP4 Temperatur|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.680.20.1.108.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000MS Slot{#SNMPINDEX} Link1(LWL) status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.310.20.1.11.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000MS Slot{#SNMPINDEX} Link2(CU) status|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.310.20.1.23.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000MS Slot{#SNMPINDEX} Tx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.310.20.1.134.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000MS Slot{#SNMPINDEX} Rx PWR|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.310.20.1.135.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|1000MS Slot{#SNMPINDEX} SFP Temperatur|<p>-</p>|`SNMP agent`|.1.3.6.1.4.1.4756.20.310.20.1.136.0.[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.9.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Rx Power over 20db|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.37.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.10.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Rx Power over 20db|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.51.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP1 Temperatur over 50C|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.38.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP1 Temperatur over 50C|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.52.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(CU) Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.310.20.1.23.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.310.20.1.11.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} SFP Rx Power over 20db|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.310.20.1.135.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP Temperatur over 50C|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.310.20.1.136.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Rx Power over 20db|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.33.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Status Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.12.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Rx Power over 20db|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.48.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Status Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.17.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} SFP1 Temperatur over 50C|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.34.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP2 Temperatur over 50C|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.49.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.7.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Rx Powerver over 20db|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.67.0.[{#SNMPINDEX}])<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.8.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Rx Powerver over 20db|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.80.0.[{#SNMPINDEX}])<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link3(LWL) Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.9.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link3(LWL) Rx Powerver over 20db|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.93.0.[{#SNMPINDEX}])<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link4(LWL) Down|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.10.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link4(LWL) Rx Powerver over 20db|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.106.0.[{#SNMPINDEX}])<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP1 Temperatur over 50C|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.69.0.[{#SNMPINDEX}])>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP2 Temperatur over 50C|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.82.0.[{#SNMPINDEX}])>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP3 Temperatur over 50C|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.95.0.[{#SNMPINDEX}])>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP4 Temperatur over 50C|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.108.0.[{#SNMPINDEX}])>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Rx Power over 20db (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.33.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Status Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.12.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Rx Power over 20db (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.48.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Status Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.17.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} SFP1 Temperatur over 50C (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.34.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP2 Temperatur over 50C (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.390.20.1.49.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.9.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Rx Power over 20db (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.37.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.10.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Rx Power over 20db (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.51.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP1 Temperatur over 50C (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.38.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP1 Temperatur over 50C (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.210.20.1.52.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.7.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Rx Powerver over 20db (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.67.0.[{#SNMPINDEX}])<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.8.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link2(LWL) Rx Powerver over 20db (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.80.0.[{#SNMPINDEX}])<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link3(LWL) Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.9.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link3(LWL) Rx Powerver over 20db (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.93.0.[{#SNMPINDEX}])<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link4(LWL) Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.10.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link4(LWL) Rx Powerver over 20db (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.106.0.[{#SNMPINDEX}])<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP1 Temperatur over 50C (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.69.0.[{#SNMPINDEX}])>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP2 Temperatur over 50C (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.82.0.[{#SNMPINDEX}])>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP3 Temperatur over 50C (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.95.0.[{#SNMPINDEX}])>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP4 Temperatur over 50C (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.680.20.1.108.0.[{#SNMPINDEX}])>=50</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(CU) Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.310.20.1.23.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} Link1(LWL) Down (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.310.20.1.11.0.[{#SNMPINDEX}],#1)<>1</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} Slot{#SNMPINDEX} SFP Rx Power over 20db (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.310.20.1.135.0.[{#SNMPINDEX}],#1)<-20</p><p>**Recovery expression**: </p>|warning|
|{HOST.NAME} Slot{#SNMPINDEX} SFP Temperatur over 50C (LLD)|<p>-</p>|<p>**Expression**: last(/CTCU Frm220/.1.3.6.1.4.1.4756.20.310.20.1.136.0.[{#SNMPINDEX}],#1)>=50</p><p>**Recovery expression**: </p>|warning|
