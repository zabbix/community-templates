# SNMP Telos ZIPStream-X2

## Description

Telos Z/IPStream-X2 SNMP Template. Created by Roman Ermakov r.ermakov@emg.fm v1.0 - 2019-01-29 - Initial release Usage notes: 1. Install and configure SNMP Service on your Windows server; 2. Install and activate ZIPStream software; 3. Run: C: Program Files (x86) ZIPStream X2 snmpmgr.exe register 4. Restart SNMP Service If you need the MIB, get TLSCORP-ZIPSTREAM-X2-MIB.txt from installation folder.

## Overview

Template for **Telos Z/IP Stream X2** software with SNMP management.


<https://www.telosalliance.com/Telos/ZIPStream-X2>


**Items features:**


* Count of Audio sources
* Count of Audio sources with errors
* Count of Audio sources with silence
* Count of Live Streams
* Count of Live Streams with errors
* Product name
* Product version


**Triggers features:**


* Last two checks - streams have errors; audio sources have silence


**Discovery features:**


* Items: Livewire sources and destinations Enabled/Disabled, Address, Name, Gain etc.
* Triggers: Gain changed, Source Address changed, Port disabled


**Usage notes:**


1. Install and configure SNMP Service on your Windows server;
2. Install and activate ZIPStream software;
3. Run:  
*C:\Program Files (x86)\ZIPStream X2\snmpmgr.exe register*
4. Restart SNMP Service


If you need the MIB get TLSCORP-ZIPSTREAM-X2-MIB.txt from installation folder.



## Author

Roman Ermakov

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MIB2ZABBIX_CMD}|<p>-</p>|`mib2zabbix.pl -o .1.3.6.1.4.1.42463 -f OmniaX2.xml`|Text macro|
|{$OID}|<p>-</p>|`.1.3.6.1.4.1.42463`|Text macro|
|{$OID_MOD}|<p>-</p>|`TLSCORP-ZIPSTREAM-X2-MIB`|Text macro|
|{$OID_PATH}|<p>-</p>|`iso.org.dod.internet.private.enterprises.tlsCorp`|Text macro|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|dstEntry Discovery|<p>An entry containing management information applicable to a particular destination.</p>|`SNMP agent`|TLS-LIVEWIRE-MIB.dstEntry<p>Update: 3600</p>|
|srcEntry Discovery|<p>An entry containing management information applicable to a particular source port.</p>|`SNMP agent`|TLS-LIVEWIRE-MIB.srcEntry<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|streams-errors|<p>Count of live streams which have errors</p>|`SNMP agent`|TLSCORP-ZIPSTREAM-X2-MIB.streams-errors<p>Update: 30s</p>|
|audio-sources-errors|<p>Count of audio sources which have errors</p>|`SNMP agent`|TLSCORP-ZIPSTREAM-X2-MIB.audio-sources-errors<p>Update: 30s</p>|
|audio-sources-count|<p>Count of active audio sources</p>|`SNMP agent`|TLSCORP-ZIPSTREAM-X2-MIB.audio-sources-count<p>Update: 20m</p>|
|streams-count|<p>Count of active live streams</p>|`SNMP agent`|TLSCORP-ZIPSTREAM-X2-MIB.streams-count<p>Update: 30s</p>|
|audio-sources-silence|<p>Count of audio sources which have silence detected</p>|`SNMP agent`|TLSCORP-ZIPSTREAM-X2-MIB.audio-sources-silence<p>Update: 30s</p>|
|product-version|<p>Product Version</p>|`SNMP agent`|TLSCORP-ZIPSTREAM-X2-MIB.product-version<p>Update: 6h</p>|
|product-name|<p>Product Name</p>|`SNMP agent`|TLSCORP-ZIPSTREAM-X2-MIB.product-name<p>Update: 6h</p>|
|dstAudioGain for {#SNMPINDEX}|<p>Audio gain/attenuation trim [dB].</p>|`SNMP agent`|dstAudioGain[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|dstIndex for {#SNMPINDEX}|<p>A unique value, greater than zero, for each destination. It is recommended that values are assigned contiguously starting from 1. The value for each port sub-layer must remain constant at least from one re-initialization of the entity's network management system to the next re- initialization.</p>|`SNMP agent`|dstIndex[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|dstMediaAddress for {#SNMPINDEX}|<p>A textual string containing the media address (URI).</p>|`SNMP agent`|dstMediaAddress[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|dstName for {#SNMPINDEX}|<p>A textual string containing label of the destination port.</p>|`SNMP agent`|dstName[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|dstNumberOfChannels for {#SNMPINDEX}|<p>A number of audio channels. Which values are accepted depends on the other port configuration. Some ports are bundled as stereo or surround groups. 0 - port not available 1 - mono 2 - stereo 8 - 8-channel surround (5.1 + stereo)</p>|`SNMP agent`|dstNumberOfChannels[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|dstOutputMode for {#SNMPINDEX}|<p>Channel ouput mode. Default mode is apassing all channels. Mono destinations can be left-only, right-only or left+righ sum.</p>|`SNMP agent`|dstOutputMode[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|srcAudioGain for {#SNMPINDEX}|<p>Audio gain/attenuation trim [dB].</p>|`SNMP agent`|srcAudioGain[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|srcEnable for {#SNMPINDEX}|<p>This object has a value of false(2) if this port is disabled. This object has a value of true(1) when the source port is enabled. Source port needs to be enabled in order to transmit multicast stream or accept unicast connections.</p>|`SNMP agent`|srcEnable[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|srcIndex for {#SNMPINDEX}|<p>A unique value, greater than zero, for each destination. It is recommended that values are assigned contiguously starting from 1. The value for each port sub-layer must remain constant at least from one re-initialization of the entity's network management system to the next re- initialization.</p>|`SNMP agent`|srcIndex[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|srcMediaAddress for {#SNMPINDEX}|<p>IPv4 multicast destination address for the RTP media stream, or empty (0.0.0.0) for unicast-only ports.</p>|`SNMP agent`|srcMediaAddress[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|srcMediaPort for {#SNMPINDEX}|<p>UDP port number the RTP media stream is sent to. Used for multicast streaming only. 0 - use RTP default port 5004.</p>|`SNMP agent`|srcMediaPort[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|srcName for {#SNMPINDEX}|<p>A textual string containing label of the destination port.</p>|`SNMP agent`|srcName[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|srcNumberOfChannels for {#SNMPINDEX}|<p>A number of audio channels. Which values are accepted depends on the other port configuration. Some ports are bundled as stereo or surround groups. 0 - port not available 1 - mono (left or right only) 2 - stereo 8 - 8-channel surround (5.1 + stereo)</p>|`SNMP agent`|srcNumberOfChannels[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|
|srcPacketSize for {#SNMPINDEX}|<p>A numeric value for number of samples per each RTP media packet. Common values are: 12 - Livewire Livestreams (channels with mininum latency) 48 - AES67 1ms packet (low-latency, best interoperability) 240 - Livewire Standard Streams (least resource intensive)</p>|`SNMP agent`|srcPacketSize[{#SNMPINDEX}]<p>Update: 6h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Livewire Audio Desination Gain for Ch.{#SNMPINDEX} was changed|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:dstAudioGain[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Livewire Destination address for Ch.{#SNMPINDEX} was changed|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:dstMediaAddress[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Livewire Audio Gain for Ch.{#SNMPINDEX} was changed|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:srcAudioGain[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Livewire Source address for Ch.{#SNMPINDEX} was changed|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:srcMediaAddress[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Livewire Source port {#SNMPINDEX} disabled|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:srcEnable[{#SNMPINDEX}].last(#2)}=2</p><p>**Recovery expression**: </p>|information|
|Livewire Audio Desination Gain for Ch.{#SNMPINDEX} was changed (LLD)|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:dstAudioGain[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Livewire Destination address for Ch.{#SNMPINDEX} was changed (LLD)|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:dstMediaAddress[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Livewire Audio Gain for Ch.{#SNMPINDEX} was changed (LLD)|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:srcAudioGain[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Livewire Source address for Ch.{#SNMPINDEX} was changed (LLD)|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:srcMediaAddress[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Livewire Source port {#SNMPINDEX} disabled (LLD)|<p>-</p>|<p>**Expression**: {SNMP Telos ZIPStream-X2:srcEnable[{#SNMPINDEX}].last(#2)}=2</p><p>**Recovery expression**: </p>|information|
