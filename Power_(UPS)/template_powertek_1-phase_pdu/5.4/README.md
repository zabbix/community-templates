# Powertek 1 Phase PDU

## Description

Created by Joakim Kingström at Sports Interactive.

## Overview

This template is for Powertek 1-phase PDU's.


It consists of 25 Items, nine triggers, and four graphs. It also has four discovery rules, with one of them having nine trigger prototypes. The discovery rules are disabled by default since they only created noise for me, but might be useful for other people.



## Author

Joakim Kingström

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|SPSv1-MIB::pduSnmpTrapsReceiversTable|<p>A list of managers to send traps to. The number of entries is given by the value of pduSnmpNumTrapReceivers</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.4.4<p>Update: 3600</p>|
|SPSv1-MIB::pduPwrMonitoringInletStatusTable|<p>A list to display status of Inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2<p>Update: 3600</p>|
|SPSv1-MIB::pduPwrMonitoringInletCfgTable|<p>A list to configure thresholds of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3<p>Update: 3600</p>|
|SPSv1-MIB::pduEmailReceiversTable|<p>A list of managers to send email notification to.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.5.8<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PDU Reset Date|<p>The reset date of the PDU.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.3.1<p>Update: 10m</p>|
|IPv4 Subnet|<p>Internet address subnet mask</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.2.1.2.3.0<p>Update: 1h</p>|
|PDU Inlet Voltage|<p>The current voltage of the PDU.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.9.1<p>Update: 1m</p>|
|Email sender address|<p>The sender 's Email address</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.5.3.0<p>Update: 1h</p>|
|Secondary DNS|<p>Internet address of Secondary DNS</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.2.1.2.5.0<p>Update: 1h</p>|
|System Location|<p>The location of system.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.3.3.0<p>Update: 1h</p>|
|System Time|<p>The date/time in agent</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.3.6.1.0<p>Update: 1h</p>|
|SNMP Port|<p>The UDP port for SNMP.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.4.2.0<p>Update: 1h</p>|
|Serial number|<p>A Model of this device.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.1.2.0<p>Update: 1h</p>|
|Active Power|<p>The power that the PDU is currently using.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.2.1<p>Update: 1m</p>|
|SNMP version|<p>Set SNMP version.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.4.3.0<p>Update: 1h</p>|
|Email Prefix|<p>The prefix string of mail subject</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.5.4.0<p>Update: 1h</p>|
|SMTP Port|<p>The UDP port for Email Server.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.5.2.0<p>Update: 1h</p>|
|NTP Server|<p>The ip address of NTP server.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.3.6.7.2.0<p>Update: 1h</p>|
|System Name|<p>The name of system.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.3.1.0<p>Update: 1h</p>|
|System Contact|<p>The contact of system.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.3.2.0<p>Update: 1h</p>|
|Gateway|<p>The default gateway that allow device managed through routers.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.2.1.2.2.0<p>Update: 1h</p>|
|Voltage|<p>The Voltage of the PDU.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.15.1<p>Update: 1m</p>|
|PDU Power Factor|<p>The power factor of the PDU indicates how much of the power is actually used.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.18.1<p>Update: 1h</p>|
|IP Address|<p>The ip address that NMS can identify the managed device.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.2.1.2.1.0<p>Update: 1h</p>|
|Software version|<p>The firmware version of the device.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.1.1.0<p>Update: 1h</p>|
|Energy used|<p>The total energy used by the PDU.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.4.1<p>Update: 1h</p>|
|Amps|<p>The amps currently used by the PDU.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.6.1<p>Update: 1m</p>|
|SMTP Server|<p>The address of Email server.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.5.1.0<p>Update: 1h</p>|
|Primary DNS|<p>Internet address of Primary DNS Server</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.2.1.2.4.0<p>Update: 1h</p>|
|SPSv1-MIB::trapsReceiverAddr[{#SNMPINDEX}]|<p>The IP address of the manager to send a trap to.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.4.4.1.2.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::receiverEventLevel[{#SNMPINDEX}]|<p>The severity level of traps to be received by this manager.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.4.4.1.3.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::receiverSnmpVer[{#SNMPINDEX}]|<p>The SNMP Trap version of trap receivers.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.4.4.1.4.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::receiverDescription[{#SNMPINDEX}]|<p>Description of trap receivers</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.4.4.1.5.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Active Power[{#SNMPINDEX}]|<p>The total power of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.2.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|PDU Reset Date[{#SNMPINDEX}]|<p>The reset date of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.3.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Energy used[{#SNMPINDEX}]|<p>The total energy of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.4.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|PDU Status[{#SNMPINDEX}]|<p>The Status of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.5.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Amps[{#SNMPINDEX}]|<p>The phase1 current of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.6.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|PDU Inlet Voltage[{#SNMPINDEX}]|<p>The phase1 voltage of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.9.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Supposedly the Power Factor of the PDU[{#SNMPINDEX}]|<p>The phase1 power factor of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.12.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Voltage[{#SNMPINDEX}]|<p>The phase1 power of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.15.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|PDU Power Factor ?[{#SNMPINDEX}]|<p>The phase1 status of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.18.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgLoadCritical[{#SNMPINDEX}]|<p>The Critical Threshold of inlet load.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.2.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgLoadWarning[{#SNMPINDEX}]|<p>The Warning Threshold of inlet load.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.3.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgCurrCritPhase1[{#SNMPINDEX}]|<p>The Critical Threshold of pahse1 current of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.4.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgCurrCritPhase2[{#SNMPINDEX}]|<p>The Critical Threshold of pahse2 current of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.5.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgCurrCritPhase3[{#SNMPINDEX}]|<p>The Critical Threshold of pahse3 current of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.6.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgCurrWarnPhase1[{#SNMPINDEX}]|<p>The Warning Threshold of pahse1 current of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.7.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgCurrWarnPhase2[{#SNMPINDEX}]|<p>The Warning Threshold of pahse2 current of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.8.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgCurrWarnPhase3[{#SNMPINDEX}]|<p>The Warning Threshold of pahse3 current of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.9.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgVoltCritPhase1[{#SNMPINDEX}]|<p>The Critical Threshold of pahse1 voltage of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.10.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgVoltCritPhase2[{#SNMPINDEX}]|<p>The Critical Threshold of pahse2 voltage of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.11.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgVoltCritPhase3[{#SNMPINDEX}]|<p>The Critical Threshold of pahse3 voltage of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.12.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgVoltWarnPhase1[{#SNMPINDEX}]|<p>The Warning Threshold of pahse1 voltage of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.13.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgVoltWarnPhase2[{#SNMPINDEX}]|<p>The Warning Threshold of pahse2 voltage of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.14.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::inletCfgVoltWarnPhase3[{#SNMPINDEX}]|<p>The Warning Threshold of pahse3 voltage of inlet.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.6.1.3.1.15.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::mailRecvReceiverAddr[{#SNMPINDEX}]|<p>The Email address of the manager to send a email notification to.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.5.8.1.2.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::mailRecvEmailType[{#SNMPINDEX}]|<p>The Email Type of email notification receivers.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.5.8.1.3.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::mailRecvEventLevel[{#SNMPINDEX}]|<p>The severity level of email notification to be received by this manager.</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.5.8.1.4.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|SPSv1-MIB::mailRecvDescription[{#SNMPINDEX}]|<p>Description of email notification receivers</p>|`SNMP agent`|.1.3.6.1.4.1.42610.1.4.4.1.5.8.1.5.[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Active Power > 4.6 kW|<p>The power used currently is more than 4.6 kW.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.2.[{#SNMPINDEX}])>4.6</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Active Power > 5.8 kW|<p>The power used currently is more than 5.8 kW.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.2.[{#SNMPINDEX}])>5.8</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: PDU Reset Date changed|<p>The PDU reset has changed, indicating that the PDU has been switched off and on.</p>|<p>**Expression**: (last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.3.[{#SNMPINDEX}],#1)<>last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.3.[{#SNMPINDEX}],#2))=1</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Amps > 13A|<p>The PDU is currently using more than 13 Amps.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.6.[{#SNMPINDEX}])>13</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Amps > 16A|<p>The PDU is currently using more than 16 Amps.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.6.[{#SNMPINDEX}])>16</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Voltage > 245V|<p>The voltage of the PDU is currently more than 245V, which is too high.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.15.[{#SNMPINDEX}])>245</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Voltage > 250V|<p>The voltage of the PDU is currently more than 250V, which is too high.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.15.[{#SNMPINDEX}])>250</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Power Factor < 90%|<p>The power factor of the PDU is currently less than 90% which indicates power is leaking and not being used.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.18.[{#SNMPINDEX}])<90</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Power Factor < 95%|<p>The power factor of the PDU is currently less than 95% which indicates power is leaking and not being used.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.18.[{#SNMPINDEX}])<95</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Active Power > 4.6 kW (LLD)|<p>The power used currently is more than 4.6 kW.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.2.[{#SNMPINDEX}])>4.6</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Active Power > 5.8 kW (LLD)|<p>The power used currently is more than 5.8 kW.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.2.[{#SNMPINDEX}])>5.8</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: PDU Reset Date changed (LLD)|<p>The PDU reset has changed, indicating that the PDU has been switched off and on.</p>|<p>**Expression**: (last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.3.[{#SNMPINDEX}],#1)<>last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.3.[{#SNMPINDEX}],#2))=1</p><p>**Recovery expression**: </p>|warning|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Amps > 13A (LLD)|<p>The PDU is currently using more than 13 Amps.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.6.[{#SNMPINDEX}])>13</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE}  :: Amps > 16A (LLD)|<p>The PDU is currently using more than 16 Amps.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.6.[{#SNMPINDEX}])>16</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Voltage > 245V (LLD)|<p>The voltage of the PDU is currently more than 245V, which is too high.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.15.[{#SNMPINDEX}])>245</p><p>**Recovery expression**: </p>|high|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Voltage > 250V (LLD)|<p>The voltage of the PDU is currently more than 250V, which is too high.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.15.[{#SNMPINDEX}])>250</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Power Factor < 90% (LLD)|<p>The power factor of the PDU is currently less than 90% which indicates power is leaking and not being used.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.18.[{#SNMPINDEX}])<90</p><p>**Recovery expression**: </p>|disaster|
|{#SNMPVALUE} {ITEM.LASTVALUE} :: Power Factor < 95% (LLD)|<p>The power factor of the PDU is currently less than 95% which indicates power is leaking and not being used.</p>|<p>**Expression**: last(/Powertek 1 Phase PDU/.1.3.6.1.4.1.42610.1.4.4.1.6.1.2.1.18.[{#SNMPINDEX}])<95</p><p>**Recovery expression**: </p>|high|
