# Teracom TCW122B-WD SNMPv1

## Description

Teracom TCW122B-WD IP watchdog monitoring module TCW122B-WD is an IP watchdog monitoring module, based on TCW122 hardware. It has 2 digital and 2 analog inputs. It supports up to two temperature/humidity sensors on its 1-Wire interface. The IP watchdog controller has also two relays with normally open and normally closed contacts. TCW122B-WD is dedicated to IP watchdog monitoring as a stand-alone device.The controller supports also SNMP v1 as M2M protocol. It can also be used as a part of small to medium SCADA systems for environmental monitoring of server rooms. Template by Kari Karvonen <oh1kk @toimii.fi> Tested with firmware version: tcw122-wd_v3.03

## Overview

Teracom TCW122B-WD IP watchdog monitoring module  
  
TCW122B-WD is an IP watchdog monitoring module, based on TCW122 hardware. It has 2 digital and 2 analog inputs. It supports up to two temperature/humidity sensors on its 1-Wire interface. The IP watchdog controller has also two relays with normally open and normally closed contacts. TCW122B-WD is dedicated to IP watchdog monitoring as a stand-alone device.The controller supports also SNMP v1 as M2M protocol. It can also be used as a part of small to medium SCADA systems for environmental monitoring of server rooms.  
  
TCW122B-WD features  
* Password protected, web-based configuration and control;  
* 2 digital inputs with " dry contact" and "logic level" modes;  
* 2 analog inputs with 0 to 60VDC range;  
* 2 relays with NO and NC contacts;  
* 1-Wire interface for up to 2 temperature (TST1XX) or temperature/humidity (TSH2xx) sensors;  
* SNMP v.1 support, SNMP trap alerts;  
* SNMP traps for alert conditions;   
* HTTP and SNMP port changing;  
* VLAN, MAC address filtering;   
* ICMP watchdog monitoring;  
* Remote firmware update.


TCW122B-WD Zabbix template


**Triggers**


Humidity 1 high alarm  
Humidity 1 low alarm  
Humidity 2 high alarm  
Humidity 2 low alarm  
Temperature 1 high alarm  
Temperature 1 low alarm  
Temperature 2 high alarm  
Temperature 2 low alarm  
Voltage 1 high alarm  
Voltage 1 low alarm  
Voltage 2 high alarm  
Voltage 2 low alarm


Adjust trigger values from TCW122B-WD's web user interface. To avoid false alarms when you have no onewire sensors, set upper limit to 201. Alteranatively disable triggers.


**Graphs**


Humidity sensor 1  
Humidity sensor 2  
Temperature sensor 1  
Temperature sensor 2  
Voltage 1  
Voltage 2


**Traps**


To get human readable snmp traps, you need snmptt.


  
EVENT TCW122B-WD .1.3.6.1.4.1.38783.0.1 "Status Events" INFORMATIONAL  
FORMAT ZBXTRAP $aA SD TCW122B-WD digital input1 value $1  
MATCH $-*: (.iso.3.6.1.4.1.38783.3.1.0)  
  
EVENT TCW122B-WD .1.3.6.1.4.1.38783.0.1 "Status Events" INFORMATIONAL  
FORMAT ZBXTRAP $aA SD TCW122B-WD digital input2 value $1  
MATCH $-*: (.iso.3.6.1.4.1.38783.3.2.0)  
  
EVENT TCW122B-WD .1.3.6.1.4.1.38783.0.1 "Status Events" INFORMATIONAL  
FORMAT ZBXTRAP $aA SD TCW122B-WD analog voltage1 value $1  
MATCH $-*: (.iso.3.6.1.4.1.38783.3.7.0)  
  
EVENT TCW122B-WD .1.3.6.1.4.1.38783.0.1 "Status Events" INFORMATIONAL  
FORMAT ZBXTRAP $aA SD TCW122B-WD analog voltage2 value $1  
MATCH $-*: (.iso.3.6.1.4.1.38783.3.8.0)  
  
EVENT TCW122B-WD .1.3.6.1.4.1.38783.0.1 "Status Events" INFORMATIONAL  
FORMAT ZBXTRAP $aA SD TCW122B-WD temperature1 value $1  
MATCH $-*: (.iso.3.6.1.4.1.38783.3.9.0)  
  
EVENT TCW122B-WD .1.3.6.1.4.1.38783.0.1 "Status Events" IN



## Author

Kari Karvonen

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|subnetMask|<p>-</p>|`SNMP agent`|TCW122B-WD.subnetMask<p>Update: 60m</p>|
|voltage2Hyst|<p>-</p>|`SNMP agent`|TCW122B-WD.voltage2Hyst<p>Update: 5m</p>|
|humidity2Max|<p>-</p>|`SNMP agent`|TCW122B-WD.humidity2Max<p>Update: 5m</p>|
|filterMACEnable1|<p>-</p>|`SNMP agent`|TCW122B-WD.filterMACEnable1<p>Update: 60m</p>|
|relayPulseWidth|<p>-</p>|`SNMP agent`|TCW122B-WD.relayPulseWidth<p>Update: 1h</p>|
|filterMACAddress1|<p>-</p>|`SNMP agent`|TCW122B-WD.filterMACAddress1<p>Update: 60m</p>|
|maxNumberOfTraps|<p>-</p>|`SNMP agent`|TCW122B-WD.maxNumberOfTraps<p>Update: 60m</p>|
|trapInterval|<p>-</p>|`SNMP agent`|TCW122B-WD.trapInterval<p>Update: 60m</p>|
|trapEnabled|<p>-</p>|`SNMP agent`|TCW122B-WD.trapEnabled<p>Update: 60m</p>|
|watchdog 1 outgoing ping interval|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg1OutgoingPingInterval<p>Update: 60m</p>|
|snmpConfiguration|<p>-</p>|`SNMP agent`|TCW122B-WD.snmpConfiguration<p>Update: 60m</p>|
|analog input1 name|<p>-</p>|`SNMP agent`|TCW122B-WD.input1<p>Update: 60m</p>|
|watchdog 2 ping timeout for restart|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg2PingTimeOutForRestart<p>Update: 60m</p>|
|humi2|<p>Output is 200 if sensor is not connected</p>|`SNMP agent`|TCW122B-WD.humi2<p>Update: 1m</p>|
|watchdog 2 mode|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg2Mode<p>Update: 60m</p>|
|watchdog 2 ping IP-address|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg2PingIPAddress<p>Update: 60m</p>|
|analog input2 name|<p>-</p>|`SNMP agent`|TCW122B-WD.input2<p>Update: 60m</p>|
|watchdog 1 ping timeout for restart|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg1PingTimeOutForRestart<p>Update: 60m</p>|
|trapReceiverIPAddress|<p>-</p>|`SNMP agent`|TCW122B-WD.trapReceiverIPAddress<p>Update: 60m</p>|
|Received SNMP traps|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|watchdog 1 ping IP-address|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg1PingIPAddress<p>Update: 60m</p>|
|voltage2Max|<p>-</p>|`SNMP agent`|TCW122B-WD.voltage2Max<p>Update: 5m</p>|
|humi1|<p>Output is 200 if sensor is not connected</p>|`SNMP agent`|TCW122B-WD.humi1<p>Update: 1m</p>|
|watchdog 1 mode|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg1Mode<p>Update: 60m</p>|
|digitalInput1State|<p>-</p>|`SNMP agent`|TCW122B-WD.digitalInput1State<p>Update: 1m</p>|
|relay1State|<p>-</p>|`SNMP agent`|TCW122B-WD.relay1State<p>Update: 1m</p>|
|temperature2Hyst|<p>-</p>|`SNMP agent`|TCW122B-WD.temperature2Hyst<p>Update: 5m</p>|
|temp2|<p>Output is 200 if sensor is not connected</p>|`SNMP agent`|TCW122B-WD.temp2<p>Update: 1m</p>|
|filterMACEnable3|<p>-</p>|`SNMP agent`|TCW122B-WD.filterMACEnable3<p>Update: 60m</p>|
|trapCommunity|<p>-</p>|`SNMP agent`|TCW122B-WD.trapCommunity<p>Update: 60m</p>|
|relay2Pulse|<p>-</p>|`SNMP agent`|TCW122B-WD.relay2Pulse<p>Update: 1m</p>|
|filterMACEnable2|<p>-</p>|`SNMP agent`|TCW122B-WD.filterMACEnable2<p>Update: 60m</p>|
|relay2State|<p>-</p>|`SNMP agent`|TCW122B-WD.relay2State<p>Update: 1m</p>|
|version|<p>-</p>|`SNMP agent`|TCW122B-WD.version<p>Update: 60m</p>|
|deviceIPAddress|<p>-</p>|`SNMP agent`|TCW122B-WD.deviceIPAddress<p>Update: 60m</p>|
|temperature1Hyst|<p>-</p>|`SNMP agent`|TCW122B-WD.temperature1Hyst<p>Update: 5m</p>|
|digitalInput2State|<p>-</p>|`SNMP agent`|TCW122B-WD.digitalInput2State<p>Update: 1m</p>|
|Temperature units|<p>-</p>|`SNMP agent`|TCW122B-WD.temperatureUnits<p>Update: 1h</p>|
|humidity1Hyst|<p>-</p>|`SNMP agent`|TCW122B-WD.humidity1Hyst<p>Update: 5m</p>|
|voltage2Min|<p>-</p>|`SNMP agent`|TCW122B-WD.voltage2Min<p>Update: 5m</p>|
|relay2ControlledBy|<p>-</p>|`SNMP agent`|TCW122B-WD.relay2ControlledBy<p>Update: 1h</p>|
|date|<p>Release date</p>|`SNMP agent`|TCW122B-WD.date<p>Update: 60m</p>|
|humidity2Min|<p>-</p>|`SNMP agent`|TCW122B-WD.humidity2Min<p>Update: 5m</p>|
|filterMACAddress2|<p>-</p>|`SNMP agent`|TCW122B-WD.filterMACAddress2<p>Update: 60m</p>|
|voltage1Min|<p>-</p>|`SNMP agent`|TCW122B-WD.voltage1Min<p>Update: 5m</p>|
|gateway|<p>-</p>|`SNMP agent`|TCW122B-WD.gateway<p>Update: 60m</p>|
|watchdog 2 number of restarts|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg2NumberOfRestarts<p>Update: 60m</p>|
|vlanStatus|<p>disabled(0), enabled(1)</p>|`SNMP agent`|TCW122B-WD.vlanStatus<p>Update: 60m</p>|
|Digital input 2 name|<p>-</p>|`SNMP agent`|TCW122B-WD.relay7<p>Update: 60m</p>|
|voltage2|<p>-</p>|`SNMP agent`|TCW122B-WD.voltage2<p>Update: 1m</p>|
|dhcpConfig|<p>off(0), on(1)</p>|`SNMP agent`|TCW122B-WD.dhcpConfig<p>Update: 60m</p>|
|humidity1Min|<p>-</p>|`SNMP agent`|TCW122B-WD.humidity1Min<p>Update: 5m</p>|
|hostName|<p>-</p>|`SNMP agent`|TCW122B-WD.hostName<p>Update: 60m</p>|
|humidity2Hyst|<p>-</p>|`SNMP agent`|TCW122B-WD.humidity2Hyst<p>Update: 5m</p>|
|voltage1Hyst|<p>-</p>|`SNMP agent`|TCW122B-WD.voltage1Hyst<p>Update: 5m</p>|
|Digital input 1 name|<p>-</p>|`SNMP agent`|TCW122B-WD.relay6<p>Update: 60m</p>|
|humidity1Max|<p>-</p>|`SNMP agent`|TCW122B-WD.humidity1Max<p>Update: 5m</p>|
|temperature2Min|<p>-</p>|`SNMP agent`|TCW122B-WD.temperature2Min<p>Update: 5m</p>|
|watchdog 2 outgoing ping interval|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg2OutgoingPingInterval<p>Update: 60m</p>|
|watchdog 1 number of restarts|<p>-</p>|`SNMP agent`|TCW122B-WD.wdg1NumberOfRestarts<p>Update: 60m</p>|
|relay1ControlledBy|<p>-</p>|`SNMP agent`|TCW122B-WD.relay1ControlledBy<p>Update: 1h</p>|
|temperature1Max|<p>-</p>|`SNMP agent`|TCW122B-WD.temperature1Max<p>Update: 5m</p>|
|filterMACAddress3|<p>-</p>|`SNMP agent`|TCW122B-WD.filterMACAddress3<p>Update: 60m</p>|
|vlanId|<p>-</p>|`SNMP agent`|TCW122B-WD.vlanId<p>Update: 60m</p>|
|name|<p>-</p>|`SNMP agent`|TCW122B-WD.name<p>Update: 60m</p>|
|temp1|<p>Output is 200 if sensor is not connected</p>|`SNMP agent`|TCW122B-WD.temp1<p>Update: 1m</p>|
|voltage1Max|<p>-</p>|`SNMP agent`|TCW122B-WD.voltage1Max<p>Update: 5m</p>|
|temperature2Max|<p>-</p>|`SNMP agent`|TCW122B-WD.temperature2Max<p>Update: 5m</p>|
|deviceMACAddress|<p>-</p>|`SNMP agent`|TCW122B-WD.deviceMACAddress<p>Update: 60m</p>|
|relay1Pulse|<p>-</p>|`SNMP agent`|TCW122B-WD.relay1Pulse<p>Update: 1m</p>|
|voltage1|<p>-</p>|`SNMP agent`|TCW122B-WD.voltage1<p>Update: 1m</p>|
|temperature1Min|<p>-</p>|`SNMP agent`|TCW122B-WD.temperature1Min<p>Update: 5m</p>|


## Triggers

There are no triggers in this template.

