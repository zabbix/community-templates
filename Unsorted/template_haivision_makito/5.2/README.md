# Haivision Makito X

## Overview

Template version 1.0

### Features
- Monitoring overall system status
- Monitoring Stream status (LLD)
- Monitoring Audio Encoder status (LLD)
- Monitoring Video Encoder status (LLD)
- Collect inventory info

### Environment
Created and tested with:
- Zabbix v.5.2.7
- Haivision Makito2 Dual-SDI Encoder 

### Setup
Configuring SNMP on the device:
https://doc.haivision.com/MakitoXEnc2.5/makito-x-encoder-user-s-guide/using-snmp-to-configure-a-v-services

Quick howto for enabling snmpv2 on the device:
- Connect to device via SSH
- Edit /usr/share/snmp/snmpd.conf; add line to allow all snmp requests from zabbix server: 
    `rocommunity <SNMP_COMMUNITY> <ZABBX_SRV_IP> .1`
	eg. `rocommunity snmp_zabbix 192.168.1.2 .1`
- Restart snmp service: `service snmp restart`

MIB files can be found on the device in /usr/share/snmp/mibs

### Author
Gert De Rouck

## Macros used
none

## Template links

|Name|
|----|
|Generic SNMP|

## Discovery rules

|Name|Type|Key|Update interval|
|----|----|----|----|
|Haivision Audio/Video Streams discovery|SNMP agent|haivision.HAI-AVT-STREAM.streams|1h|
|Haivision Audio Encoders discovery|SNMP agent|haivision.HAI-HDC.audioEncoders|1h|
|Haivision Video Encoders discovery|SNMP agent|haivision.HAI-HDC.videoEncoders|1h|

## Items

|Name|Type|Key|LLD|Update interval|
|----|----|----|----|----|
|Haivision status LED|SNMP agent|haivision.HAI-HDC.haiHdcSysAdminStatus|-|5m|
|Haivision system error|SNMP agent|haivision.HAI-HDC.haiHdcSysError|-|5m|
|Haivision firmware revision|SNMP agent|haivision.HAI-HDC.haiHdcSysFirmwareRev|-|1d|
|Haivision serial number|SNMP agent|haivision.HAI-HDC.haiHdcSysSerialNumber|-|1d|
|Haivision system type|SNMP agent|haivision.HAI-HDC.haiHdcSysType|-|1d|
|Stream Name [{#STREAMNAME}]|SNMP agent|haivision.HAI-AVT-STREAM.haiAvtStreamName.[{#SNMPINDEX}]|LLD|1h|
|Stream Mode [{#STREAMNAME}]|SNMP agent|haivision.HAI-AVT-STREAM.haiAvtStreamCxMode.[{#SNMPINDEX}]|LLD|15m|
|Stream Admin Status [{#STREAMNAME}]|SNMP agent|haivision.HAI-AVT-STREAM.haiAvtStreamAdminStatus.[{#SNMPINDEX}]|LLD|15m|
|Stream Operational Status [{#STREAMNAME}]|SNMP agent|haivision.HAI-AVT-STREAM.haiAvtStreamOperStatus.[{#SNMPINDEX}]|LLD|5m|
|Audio Encoder Name [{#AUDIOENCNAME}]|SNMP agent|haivision.HAI-HDC.haiHdcAudioEncName.[{#SNMPINDEX}]|LLD|1h|
|Audio Encoder Admin Status [{#AUDIOENCNAME}]|SNMP agent|haivision.HAI-HDC.haiHdcAudioEncAdminStatus.[{#SNMPINDEX}]|LLD|15m|
|Audio Encoder Operational Status [{#AUDIOENCNAME}]|SNMP agent|haivision.HAI-HDC.haiHdcAudioEncOperStatus.[{#SNMPINDEX}]|LLD|5m|
|Video Encoder Name [{#VIDEOENCNAME}]|SNMP agent|haivision.HAI-HDC.haiHdcVideoEncName.[{#SNMPINDEX}]|LLD|1h|
|Video Encoder Admin Status [{#VIDEOENCNAME}]|SNMP agent|haivision.HAI-HDC.haiHdcVideoEncAdminStatus.[{#SNMPINDEX}]|LLD|15m|
|Video Encoder Operational Status [{#VIDEOENCNAME}]|SNMP agent|haivision.HAI-HDC.haiHdcVideoEncOperStatus.[{#SNMPINDEX}]|LLD|5m|

## Triggers

|Name|Expression|LLD|Severity|
|----|-----------|----|----|
|Haivision status LED indicates a system error.|{Haivision Makito X:haivision.HAI-HDC.haiHdcSysAdminStatus.last()}<>1|-|HIGH|
|Haivision System Error|{Haivision Makito X:haivision.HAI-HDC.haiHdcSysError.last()}<>"No Error"|-|HIGH|
|Haivision caller mode stream [{#STREAMNAME}] is in an undesired state.|{Haivision Makito X:haivision.HAI-AVT-STREAM.haiAvtStreamAdminStatus.[{#SNMPINDEX}].last()}=1 and {Haivision Makito X:haivision.HAI-AVT-STREAM.haiAvtStreamCxMode.[{#SNMPINDEX}].last()}=1 and {Haivision Makito X:haivision.HAI-AVT-STREAM.haiAvtStreamOperStatus.[{#SNMPINDEX}].last()}<>1|LLD|HIGH|
|Haivision listener mode stream [{#STREAMNAME}] is in an undesired state.|{Haivision Makito X:haivision.HAI-AVT-STREAM.haiAvtStreamAdminStatus.[{#SNMPINDEX}].last()}=1 and {Haivision Makito X:haivision.HAI-AVT-STREAM.haiAvtStreamCxMode.[{#SNMPINDEX}].last()}=2 and {Haivision Makito X:haivision.HAI-AVT-STREAM.haiAvtStreamOperStatus.[{#SNMPINDEX}].last()}<>5|LLD|HIGH|
|Haivision Audio encoder [{#AUDIOENCNAME}] is in an undesired state.|{Haivision Makito X:haivision.HAI-HDC.haiHdcAudioEncAdminStatus.[{#SNMPINDEX}].last()}=1 and {Haivision Makito X:haivision.HAI-HDC.haiHdcAudioEncOperStatus.[{#SNMPINDEX}].last()}<>1|LLD|HIGH|
|Haivision Video encoder [{#VIDEOENCNAME}] is in an undesired state.|{Haivision Makito X:haivision.HAI-HDC.haiHdcVideoEncAdminStatus.[{#SNMPINDEX}].last()}=1 and {Haivision Makito X:haivision.HAI-HDC.haiHdcVideoEncOperStatus.[{#SNMPINDEX}].last()}<>1|LLD|HIGH|
