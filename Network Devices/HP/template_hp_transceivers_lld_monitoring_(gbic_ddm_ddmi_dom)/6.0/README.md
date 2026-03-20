# GM DDMI

## Description

Monitor HP transceivers

## Overview

Low Level Discovery (LLD) for HP transceivers (switches) monitoring (gbic DDM DDMI DOM).


Attention: You will want to have a regular expression called @isFiberTransceiver to filter out cooper gbics (stacking, etc)


oid .1.3.6.1.4.1.25506.2.70.1.1.1.1


Triggers are created with thresholds given by gbic.


Temperature, voltage, bias, serial, hardware type, fiber diameter, status, dbm, db, transmit power, receive power.



## Author

Rafael Gustavo Gassner

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Transceivers|<p>-</p>|`SNMP agent`|transceivers-[{#SNMPVALUE}]<p>Update: 240</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Bias on interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the current bias electric current. The unit is in hundredths of mA</p>|`SNMP agent`|hh3cTransceiverBiasCurrent.["{#SNMPINDEX}"]<p>Update: 600</p><p>LLD</p>|
|Temperature interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the current temperature. The unit is Celsius centigrade.</p>|`SNMP agent`|hh3cTransceiverTemperature.["{#SNMPINDEX}"]<p>Update: 600</p><p>LLD</p>|
|Description of transceiver $1#{#DESCRIPTION}#{#ALIAS}|<p>-</p>|`SNMP agent`|ifDescrAliasTransceiver[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|
|Wave Length of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Wave length of the interface, measured in nanometer.</p>|`SNMP agent`|hh3cTransceiverWaveLength.["{#SNMPINDEX}"]<p>Update: 86400</p><p>LLD</p>|
|Transceiver Voltage $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the current voltage. The unit is in hundredths of V</p>|`SNMP agent`|hh3cTransceiverVoltage.["{#SNMPINDEX}"]<p>Update: 600</p><p>LLD</p>|
|Vendor name of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Vendor name of the interface.</p>|`SNMP agent`|hh3cTransceiverVendorName.["{#SNMPINDEX}"]<p>Update: 86400</p><p>LLD</p>|
|VCC Low Alarm interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Transceiver VCC low alarm threshold limit in hundreds of microvolts. As an example: 32928 is 3.2928 volts. Returns zero if not supported on the transceiver.</p>|`SNMP agent`|hh3cTransceiverVccLoAlarm.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|VCC High Alarm interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Transceiver VCC high alarm threshold limit in hundreds of microvolts. As an example: 32928 is 3.2928 volts. Returns zero if not supported on the transceiver.</p>|`SNMP agent`|hh3cTransceiverVccHiAlarm.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|Transceiver type of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Type of the interface, such as SFP/XFP/GBIC.</p>|`SNMP agent`|hh3cTransceiverType.["{#SNMPINDEX}"]<p>Update: 86400</p><p>LLD</p>|
|Transfer distance of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>The maximum distance which the interface can transmit, measured in meter.</p>|`SNMP agent`|hh3cTransceiverTransferDistance.["{#SNMPINDEX}"]<p>Update: 86400</p><p>LLD</p>|
|Temperature Low Alarm interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Transceiver temperature low alarm threshold limit in thousandths of degrees Celsius. As an example: 49120 is 49.120 degrees Celsius.</p>|`SNMP agent`|hh3cTransceiverTempLoAlarm.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|Temperature High Alarm interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Transceiver temperature high alarm threshold limit in thousandths of degrees Celsius. As an example: 49120 is 49.120 degrees Celsius.</p>|`SNMP agent`|hh3cTransceiverTempHiAlarm.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|Serial number of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Serial number of the interface.</p>|`SNMP agent`|hh3cTransceiverSerialNumber.["{#SNMPINDEX}"]<p>Update: 86400</p><p>LLD</p>|
|Bias High Alarm interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Transceiver bias high alarm threshold limit in microamps.</p>|`SNMP agent`|hh3cTransceiverBiasHiAlarm.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|Minimum transmitted power of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the minimum transmitted power. The unit is in hundredths of dBM.</p>|`SNMP agent`|hh3cTransceiverMinTXPower.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|Minimum received power of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the minimum received power. The unit is in hundredths of dBM.</p>|`SNMP agent`|hh3cTransceiverMinRXPower.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|Maximum transmitted power of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the maximum transmitted power. The unit is in hundredths of dBM.</p>|`SNMP agent`|hh3cTransceiverMaxTXPower.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|Maximum received power of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the maximum received power. The unit is in hundredths of dBM.</p>|`SNMP agent`|hh3cTransceiverMaxRXPower.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|Hardware type of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Hardware type of the interface, such as SM(single mode).</p>|`SNMP agent`|hh3cTransceiverHardwareType.["{#SNMPINDEX}"]<p>Update: 86400</p><p>LLD</p>|
|Fiber diameter type of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>The diameter of the fiber, measured in micron. fiber9 - 9 micron multi-mode fiber fiber50 - 50 micron multi-mode fiber fiber625 - 62.5 micron multi-mode fiber copper - copper cable.</p>|`SNMP agent`|hh3cTransceiverFiberDiameterType.["{#SNMPINDEX}"]<p>Update: 86400</p><p>LLD</p>|
|Transceiver error of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Bitmask indicating transceiver errors. Transceiver information I/O error(0) Transceiver information checksum error(1) Transceiver type and port configuration mismatch(2) Transceiver type not supported by port hardware(3) WIS local fault(4) Receive optical power fault(5) PMA/PMD receiver local fault(6) PCS receive local fault(7) PHY XS receive local fault(8) Laser bias current fault(9) Laser temperature fault(10) Laser output power fault(11) TX fault(12) PMA/PMD transmitter local fault(13) PCS transmit local fault(14) PHY XS Transmit Local Fault(15) RX loss of signal(16) Unused(17-31)</p>|`SNMP agent`|hh3cTransceiverErrors.["{#SNMPINDEX}"]<p>Update: 600</p><p>LLD</p>|
|Availability of diagnostics in interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the digital diagnostic monitoring function.</p>|`SNMP agent`|hh3cTransceiverDiagnostic.["{#SNMPINDEX}"]<p>Update: 86400</p><p>LLD</p>|
|Current transmitted power of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the current transmitted power. The unit is in hundredths of dBM.</p>|`SNMP agent`|hh3cTransceiverCurTXPower.["{#SNMPINDEX}"]<p>Update: 600</p><p>LLD</p>|
|Current received power of interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Indicating the current received power. The unit is in hundredths of dBM.</p>|`SNMP agent`|hh3cTransceiverCurRXPower.["{#SNMPINDEX}"]<p>Update: 600</p><p>LLD</p>|
|Bias Low Alarm interface $1#{#DESCRIPTION}#{#ALIAS}|<p>Transceiver bias low alarm threshold limit in microamps.</p>|`SNMP agent`|hh3cTransceiverBiasLoAlarm.["{#SNMPINDEX}"]<p>Update: 3600</p><p>LLD</p>|
|Alias of transceiver $1#{#DESCRIPTION}#{#ALIAS}|<p>-</p>|`SNMP agent`|TransceiverAlias[{#SNMPINDEX}]<p>Update: 86400</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Current RX Power is higher than the maximum threshold on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current RX Power is {ITEM.VALUE3}. Maximum RX power should be {ITEM.VALUE4}. Equipment {HOST.HOST}|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( last(/GM DDMI/hh3cTransceiverCurRXPower.["{#SNMPINDEX}"])> last(/GM DDMI/hh3cTransceiverMaxRXPower.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverCurRXPower.["{#SNMPINDEX}"])<>21474836.47</p><p>**Recovery expression**: </p>|not classified|
|Current RX Power is lower than the minimum threshold on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current RX Power is {ITEM.VALUE3}. Minimum RX power should be {ITEM.VALUE4}. Equipment {HOST.HOST}|<p>This happens when there is no fiber connected.</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( last(/GM DDMI/hh3cTransceiverCurRXPower.["{#SNMPINDEX}"])< last(/GM DDMI/hh3cTransceiverMinRXPower.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverCurRXPower.["{#SNMPINDEX}"])<>21474836.47</p><p>**Recovery expression**: </p>|not classified|
|Current TX Power is higher than the maximum threshold on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current TX Power is {ITEM.VALUE3}. Maximum TX power should be {ITEM.VALUE4}. Equipment {HOST.HOST}|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( last(/GM DDMI/hh3cTransceiverCurTXPower.["{#SNMPINDEX}"])> last(/GM DDMI/hh3cTransceiverMaxTXPower.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverCurTXPower.["{#SNMPINDEX}"])<>21474836.47</p><p>**Recovery expression**: </p>|not classified|
|Current TX Power is lower than the minimum threshold on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current TX Power is {ITEM.VALUE3}. Minimum TX power should be {ITEM.VALUE4}. Equipment {HOST.HOST}|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( last(/GM DDMI/hh3cTransceiverCurTXPower.["{#SNMPINDEX}"])< last(/GM DDMI/hh3cTransceiverMinTXPower.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverCurTXPower.["{#SNMPINDEX}"])<>21474836.47</p><p>**Recovery expression**: </p>|not classified|
|Temperature is too high on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current temperature is {ITEM.VALUE3}. Maximum temperature should be {ITEM.VALUE4}. Equipment {HOST.HOST}|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( ( last(/GM DDMI/hh3cTransceiverTemperature.["{#SNMPINDEX}"])>last(/GM DDMI/hh3cTransceiverTempHiAlarm.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverTemperature.["{#SNMPINDEX}"])<> 2147483647 )</p><p>**Recovery expression**: </p>|not classified|
|Temperature is too low on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current temperature is {ITEM.VALUE3}. Lower temperature should be {ITEM.VALUE4}. Equipment {HOST.HOST}|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( ( last(/GM DDMI/hh3cTransceiverTemperature.["{#SNMPINDEX}"])<last(/GM DDMI/hh3cTransceiverTempLoAlarm.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverTemperature.["{#SNMPINDEX}"])<> 2147483647 )</p><p>**Recovery expression**: </p>|not classified|
|Current RX Power is higher than the maximum threshold on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current RX Power is {ITEM.VALUE3}. Maximum RX power should be {ITEM.VALUE4}. Equipment {HOST.HOST} (LLD)|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( last(/GM DDMI/hh3cTransceiverCurRXPower.["{#SNMPINDEX}"])> last(/GM DDMI/hh3cTransceiverMaxRXPower.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverCurRXPower.["{#SNMPINDEX}"])<>21474836.47</p><p>**Recovery expression**: </p>|not classified|
|Current RX Power is lower than the minimum threshold on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current RX Power is {ITEM.VALUE3}. Minimum RX power should be {ITEM.VALUE4}. Equipment {HOST.HOST} (LLD)|<p>This happens when there is no fiber connected.</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( last(/GM DDMI/hh3cTransceiverCurRXPower.["{#SNMPINDEX}"])< last(/GM DDMI/hh3cTransceiverMinRXPower.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverCurRXPower.["{#SNMPINDEX}"])<>21474836.47</p><p>**Recovery expression**: </p>|not classified|
|Current TX Power is higher than the maximum threshold on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current TX Power is {ITEM.VALUE3}. Maximum TX power should be {ITEM.VALUE4}. Equipment {HOST.HOST} (LLD)|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( last(/GM DDMI/hh3cTransceiverCurTXPower.["{#SNMPINDEX}"])> last(/GM DDMI/hh3cTransceiverMaxTXPower.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverCurTXPower.["{#SNMPINDEX}"])<>21474836.47</p><p>**Recovery expression**: </p>|not classified|
|Current TX Power is lower than the minimum threshold on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current TX Power is {ITEM.VALUE3}. Minimum TX power should be {ITEM.VALUE4}. Equipment {HOST.HOST} (LLD)|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( last(/GM DDMI/hh3cTransceiverCurTXPower.["{#SNMPINDEX}"])< last(/GM DDMI/hh3cTransceiverMinTXPower.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverCurTXPower.["{#SNMPINDEX}"])<>21474836.47</p><p>**Recovery expression**: </p>|not classified|
|Temperature is too high on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current temperature is {ITEM.VALUE3}. Maximum temperature should be {ITEM.VALUE4}. Equipment {HOST.HOST} (LLD)|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( ( last(/GM DDMI/hh3cTransceiverTemperature.["{#SNMPINDEX}"])>last(/GM DDMI/hh3cTransceiverTempHiAlarm.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverTemperature.["{#SNMPINDEX}"])<> 2147483647 )</p><p>**Recovery expression**: </p>|not classified|
|Temperature is too low on transceiver {ITEM.VALUE1} {ITEM.VALUE2}. Current temperature is {ITEM.VALUE3}. Lower temperature should be {ITEM.VALUE4}. Equipment {HOST.HOST} (LLD)|<p>-</p>|<p>**Expression**: (find(/GM DDMI/ifDescrAliasTransceiver[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or (find(/GM DDMI/TransceiverAlias[{#SNMPINDEX}],,"regexp","$blablablabla^")=1) or ( ( last(/GM DDMI/hh3cTransceiverTemperature.["{#SNMPINDEX}"])<last(/GM DDMI/hh3cTransceiverTempLoAlarm.["{#SNMPINDEX}"]) ) and last(/GM DDMI/hh3cTransceiverTemperature.["{#SNMPINDEX}"])<> 2147483647 )</p><p>**Recovery expression**: </p>|not classified|
