# Nxt151 General

## Overview

Template of transmissor of Screen. Model: NXT-151. This template contains:


* 7 applications
* 70 items
* 69 Triggers
* 9 Grafs


 


Our applications have itens of the component below:


* Amplifier
* External Amplifier
* GbE
* GPS
* Input
* Modulator
* System


 



## Author

Marcos Sousa and Guilherme Pereira

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$USER}|<p>-</p>|`{$USER_FULLNAME}`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Alarm Lock|<p>alarm of alarm lock of GPS</p>|`SNMP agent`|gps.alarm.lock<p>Update: 5s</p>|
|Alarm Return Loss|<p>alarm of return loss of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.power.reflected<p>Update: 5s</p>|
|Alarm Driver A|<p>alarm of driver A of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.driver1<p>Update: 5s</p>|
|Satellite Tracked Number|<p>data of satellite tracked number of GPS</p>|`SNMP agent`|gps.status.satellite.tracked.number<p>Update: 5s</p>|
|Presence|<p>data of presence of GPS</p>|`SNMP agent`|gps.status.presence<p>Update: 5s</p>|
|Power|<p>Data power of amplifier component</p>|`SNMP agent`|amplifier.status.power<p>Update: 5s</p>|
|RF|<p>data of RF (reflected power) of external amplifier component.</p>|`SNMP agent`|extamplifier.status.rf<p>Update: 5s</p>|
|Lock Status|<p>data of status lock of GPS</p>|`SNMP agent`|gps.status.lock<p>Update: 5s</p>|
|PSU 3 Voltage|<p>data of PSU (Power Supply Unit) Voltage 3 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu3.voltage<p>Update: 5s</p>|
|Cable present|<p>data of cable presence of Gbe</p>|`SNMP agent`|gbe.status.cablepresent<p>Update: 5s</p>|
|PSU 1 Presence|<p>data of PSU (Power Supply Unit) Presence 1 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu1.presence<p>Update: 5s</p>|
|PSU 3 Current|<p>data of PSU (Power Supply Unit) Current 3 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu3.current<p>Update: 5s</p>|
|PSU 2 Temperature|<p>data of PSU (Power Supply Unit) Temperature 2 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu2.temperature<p>Update: 5s</p>|
|Alarm Temperature|<p>alarm of temperature of modulator</p>|`SNMP agent`|modulator.alarm.temperature<p>Update: 5s</p>|
|Alarm OSC 1 PII|<p>alarm of OSC 1 PII of modulator</p>|`SNMP agent`|modulator.alarm.osc1.pii<p>Update: 5s</p>|
|Bitrate|<p>data of bitrate of input</p>|`SNMP agent`|input.status.gbe1.bitrate<p>Update: 30s</p>|
|Alarm Voltage 2 (28 V)|<p>alarm of voltage 2 of system</p>|`SNMP agent`|system.alarm.voltage2<p>Update: 5s</p>|
|Alarm Power High|<p>alarm of power high of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.power.high<p>Update: 5s</p>|
|Alarm Seamless Input1|<p>alarm of seamless input 1of input</p>|`SNMP agent`|input.alarm.input1<p>Update: 5s</p>|
|PSU 2 Current|<p>data of PSU (Power Supply Unit) Current 2 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu2.current<p>Update: 5s</p>|
|Alarm Comm.Error|<p>alarm of Communication Error of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.comm.error<p>Update: 30s</p>|
|RF|<p>Data of Reflected Power of amplifier component</p>|`SNMP agent`|amplifier.status.rf<p>Update: 5s</p>|
|Voltage 1|<p>data of voltage 1 of system</p>|`SNMP agent`|system.status.voltage1<p>Update: 5s</p>|
|Temperature 2|<p>data of temperature 2 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.temperature2<p>Update: 5s</p>|
|PSU 2 Voltage|<p>data of PSU (Power Supply Unit) Voltage 2 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu2.voltage<p>Update: 5s</p>|
|Reflected Power (Watt)|<p>data of power reflected of external amplifier component.</p>|`SNMP agent`|extamplifier.status.power.reflected<p>Update: 5s</p>|
|Current|<p>data of current of external amplifier component.</p>|`SNMP agent`|extamplifier.status.current<p>Update: 30s</p>|
|Alarm IIP|<p>-</p>|`SNMP agent`|modulator.alarm.iip<p>Update: 30s</p>|
|Power (Watt)|<p>data of power of external amplifier component.</p>|`SNMP agent`|extamplifier.status.power<p>Update: 5s</p>|
|Alarm 10 Mhz2|<p>alarm of 10 Mhz2 of modulator</p>|`SNMP agent`|modulator.alarm.10mhz2<p>Update: 5s</p>|
|PSU 3 Presence|<p>data of PSU (Power Supply Unit) Presence 3 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu3.presence<p>Update: 5s</p>|
|GbE 1 Locked|<p>data of GbE 1 Locked of input</p>|`SNMP agent`|input.status.gbe1.lock<p>Update: 5s</p>|
|Alarm Power Low|<p>alarm of Power Low of amplifier component</p>|`SNMP agent`|amplifier.alarm.power.low<p>Update: 5s</p>|
|Antenna Power|<p>data of antenna power of GPS</p>|`SNMP agent`|gps.status.antenna.power<p>Update: 5s</p>|
|Alarm Driver B|<p>alarm of driver B of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.driver2<p>Update: 5s</p>|
|Alarm Return Loss|<p>Alarm of Return Loss of amplifier component</p>|`SNMP agent`|amplifier.alarm.power.reflected<p>Update: 5s</p>|
|Alarm Linear Feedback|<p>alarm linear feedback of amplifier component</p>|`SNMP agent`|amplifier.alarm.feedback<p>Update: 5s</p>|
|Current|<p>data of current of system</p>|`SNMP agent`|system.status.current<p>Update: 5s</p>|
|Alarm 1 PPS|<p>alarm of 1 PPS of modulator</p>|`SNMP agent`|modulator.alarm.1pps<p>Update: 5s</p>|
|Enabled|<p>data of Enabled of Gbe</p>|`SNMP agent`|gbe.status.enabled<p>Update: 5s</p>|
|Temperature 1|<p>data of temperature 1 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.temperature1<p>Update: 5s</p>|
|Alarm PSU 1|<p>alarm of PSU (Power Supply Unit) 1 of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.psu1<p>Update: 5s</p>|
|PSU 1 Current|<p>data of PSU (Power Supply Unit) Current 1 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu1.current<p>Update: 1s</p>|
|PSU 1 Temperature|<p>data of PSU (Power Supply Unit) Temperature 1 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu1.temperature<p>Update: 5s</p>|
|Frequency 10MHz|<p>data of frequency 10 MHz of GPS</p>|`SNMP agent`|gps.status.frequency<p>Update: 5s</p>|
|Alarm Temperature|<p>alarm of temperature of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.temperature<p>Update: 5s</p>|
|Alarm PSU 2|<p>alarm of PSU (Power Supply Unit) 3 of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.psu2<p>Update: 5s</p>|
|Alarm Voltage 1 (50 V)|<p>alarm of voltage 1 of system</p>|`SNMP agent`|system.alarm.voltage1<p>Update: 5s</p>|
|PSU 2 Presence|<p>data of PSU (Power Supply Unit) Presence 2 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu2.presence<p>Update: 5s</p>|
|PSU 3 Temperature|<p>data of PSU (Power Supply Unit) Temperature 3 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu3.temperature<p>Update: 5s</p>|
|Temperature|<p>data of temperature of modulator</p>|`SNMP agent`|modulator.status.temperature<p>Update: 5s</p>|
|Alarm Rate Overflow|<p>alarm of rate overflow of modulator</p>|`SNMP agent`|modulator.alarm.rate.overflow<p>Update: 5s</p>|
|Alarm Power High|<p>alarm of power high of amplifier component</p>|`SNMP agent`|amplifier.alarm.power.high<p>Update: 5s</p>|
|Satellite Visible Number|<p>data of satellite visible number of GPS</p>|`SNMP agent`|gps.status.satellite.visible.number<p>Update: 5s</p>|
|Alarm PSU 3|<p>alarm of PSU (Power Supply Unit) 3 of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.psu3<p>Update: 5s</p>|
|Alarm Hitless|<p>data of hitless of input</p>|`SNMP agent`|input.alarm.hitless<p>Update: 5s</p>|
|Temperature|<p>Data of temperature of amplifier component</p>|`SNMP agent`|amplifier.status.temperature<p>Update: 5s</p>|
|Alarm GbE 1|<p>alarm of GbE 1 of input</p>|`SNMP agent`|input.alarm.gbe1<p>Update: 5s</p>|
|Alarm GbE1 Lock|<p>alarm of GbE 1 Lock of Gbe</p>|`SNMP agent`|gbe.alarm.gbe1.lock<p>Update: 5s</p>|
|Reflected Power|<p>Data of Reflected Power of amplifier component</p>|`SNMP agent`|amplifier.status.power.reflected<p>Update: 5s</p>|
|Alarm Temperature|<p>Alarm of temperature of amplifier component</p>|`SNMP agent`|amplifier.alarm.temperature<p>Update: 5s</p>|
|Alarm Power Low|<p>alarm of power low of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.power.low<p>Update: 5s</p>|
|PSU 1 Voltage|<p>data of PSU (Power Supply Unit) Voltage 1 of external amplifier component.</p>|`SNMP agent`|extamplifier.status.psu1.voltage<p>Update: 1s</p>|
|Alarm Runtime error|<p>alarm of runtime error of modulator</p>|`SNMP agent`|modulator.alarm.runtime.error<p>Update: 5s</p>|
|Alarm Fan|<p>alarm of FAN of external amplifier component.</p>|`SNMP agent`|extamplifier.alarm.fan<p>Update: 5s</p>|
|Antenna|<p>data of antenna of GPS</p>|`SNMP agent`|gps.status.antenna<p>Update: 5s</p>|
|Voltage 2|<p>data of voltage 2 of system</p>|`SNMP agent`|system.status.voltage2<p>Update: 5s</p>|
|Alarm Seamless Input2|<p>alarm of Seamless Input 2 of input</p>|`SNMP agent`|input.alarm.input2<p>Update: 5s</p>|
|Alarm  Transport Stream Presence|<p>alarm of transport stream presence of modulator</p>|`SNMP agent`|modulator.alarm.transport.stream.presence<p>Update: 5s</p>|
|Alarm Current|<p>alarm of current of system</p>|`SNMP agent`|system.alarm.current<p>Update: 5s</p>|


## Triggers

There are no triggers in this template.

