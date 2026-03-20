# template_quantum_scalar_i3_snmp

## Overview
Zabbix template for Quantum Scalar i3 (LTO Tape Library)

Test on: Zabbix 6.0 and Quantum Scalar i3 

The template monitors the Tape Library: Quantum Scalar i3

## Author
Kamil Gołuchowski

## Setup
Import the template_quantum_scalar_i3_snmp_v2.yaml template into your Zabbix instance (Configuration --> Templates --> Import), and apply the template to a host.

## Items collected
items
---
| Item Name | Description | Item Type | Item Key | 
| --- | --- | ---: | --- | 
| aggregatedIEAreaStatus | IEAreaStatus (INTEGER) {unknown(0), insertedClosed(1), ejectedOpen(2) } | SNMP agent | aggregatedIEAreaStatus | 
| aggregatedMagazineStatus | LibraryMagazineStatus (INTEGER) {unknown(0), allPresent(1), notAllPresent(2) } | SNMP agent | aggregatedMagazineStatus | 
| CleaningTapeCount | Number of CleaningTape | SNMP agent | libraryCleaningTapeCount | 
| Drive0CleaningStatus | CleaningStatus (INTEGER) {unknown(0), notNeeded(1), recommended(2), required(3) } Tape drive's cleaning status. | SNMP agent | phDrive0CleaningStatus | 
| Drive0Firmware | Tape drive firmware version. | SNMP agent | phDrive0FirmwareVersion | 
| Drive0LoadCount | Tape drive's total cartridge load count. | SNMP agent | phDrive0Loads | 
| Drive0Mode | DeviceMode (INTEGER) {unknown(0), online(1), offline(2) }Tape drive online status. | SNMP agent | phDrive0Mode | 
| Drive0State | DeviceState (INTEGER) {unknown(0), variedOn(1), variedOff(2),notReady(3), notInstalled(4) }Tape drive ready status. | SNMP agent | phDrive0State | 
| Drive1CleaningStatus | CleaningStatus (INTEGER) {unknown(0), notNeeded(1), recommended(2), required(3) }Tape drive's cleaning status. | SNMP agent | phDrive1CleaningStatus | 
| Drive1Firmware | Tape drive firmware version. | SNMP agent | phDrive1FirmwareVersion | 
| Drive1LoadCount | Tape drive's total cartridge load count. | SNMP agent | phDrive1Loads | 
| Drive1Mode | DeviceMode (INTEGER) {unknown(0), online(1), offline(2) }Tape drive online status. | SNMP agent | phDrive1Mode | 
| Drive1State | DeviceState (INTEGER) {unknown(0), variedOn(1), variedOff(2),notReady(3), notInstalled(4) }Tape drive ready status. | SNMP agent | phDrive1State | 
| DriveDeviceId Slot0 | Tape drive location within the library. | SNMP agent | phDriveDeviceId0 | 
| DriveDeviceId Slot1 | Tape drive location within the library. | SNMP agent | phDriveDeviceId1 | 
| driveRASStatus | RASSubSystemStatus (INTEGER) {unknown(0), redFailure(1), orangeDegraded(2),yellowWarning(3), blueAttention(4),greenInformation(5), greenGood(6) } | SNMP agent | driveRASStatus | 
| FirmwareVersion | - | SNMP agent | libraryFirmware | 
| GlobalStatus | RASSubSystemStatus (INTEGER) {unknown(0), redFailure(1), orangeDegraded(2),yellowWarning(3), blueAttention(4), greenInformation(5), greenGood(6) } | SNMP agent | libraryGlobalStatus | 
| HumiditySensorStatus | SensorStatus (INTEGER) {unknown(0), normal(1), warning(2),  critical(3) } Temperature sensor status in normal, warning or critical range.Sensor is in Robot | SNMP agent | libraryHumiditySensorStatus | 
| HumiditySensorValue | Library humidity sensor data in %. | SNMP agent | libraryHumiditySensorValue | 
| ICMP loss | - | Simple check | icmppingloss | 
| ICMP ping | - | Simple check | icmpping | 
| ICMP response time | - | 	Simple check | icmppingsec | 
| LibraryMode | DeviceMode (INTEGER) {unknown(0), online(1), offline(2) } Partition online/offline mode. | SNMP agent | logicalLibraryMode | 
| libraryRASStatus | RASSubSystemStatus (INTEGER) {unknown(0), redFailure(1), orangeDegraded(2),yellowWarning(3), blueAttention(4), greenInformation(5), greenGood(6) } | SNMP agent | libraryRASStatus | 
| LibraryState | LibraryState (INTEGER) {unknown(0), ready(1), notReady(2), becomingReady(3) } | SNMP agent | logicalLibraryState | 
| mediaRASStatus | RASSubSystemStatus (INTEGER) {unknown(0), redFailure(1), orangeDegraded(2), yellowWarning(3), blueAttention(4), greenInformation(5), greenGood (6) } | SNMP agent | mediaRASStatus | 
| physicalLibraryState | LibraryState (INTEGER) {unknown(0), ready(1), notReady(2), becomingReady(3) } | SNMP agent | physicalLibraryState | 
| PowerSuply0Status_PS0_Right | PSStatus (INTEGER) {unknown(0), good(1), failed(2), missing(3) } | SNMP agent | PowerSuply0Status | 
| PowerSuply0_Right_Consumption | Power consumption in units of Watts. | SNMP agent | libraryPS0PowerConsumption | 
| PowerSuply1Status_PS1_Left | PSStatus (INTEGER) {unknown(0), good(1), failed(2), missing(3) } | SNMP agent | libraryPS1Status | 
| PowerSuply1_Left_Consumption | Power consumption in units of Watts. | SNMP agent | libraryPS1PowerConsumption | 
| TemperatureSensorStatus | SensorStatus (INTEGER) {unknown(0), normal(1), warning(2), critical(3) } Temperature sensor status in normal, warning or critical range. Sensor is in Robot | SNMP agent | libraryTemperatureSensorStatus | 
| TemperatureSensorValue | The temperature sensor reading in degrees Celsius. | SNMP agent | libraryTemperatureSensorValue | 


## Triggers


|Name|Expression|Priority|
|----|----------|--------|
|Aggregated Area open (library open). Status: {ITEM.LASTVALUE} on {HOST.NAME} |last(/template_quantum_scalar_i3_snmp/aggregatedIEAreaStatus)<>1|Information|
|Check Humidity, value: {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/libraryHumiditySensorValue)>{$HIGHT_HUMIDITY}|Information|
|Check Humidity Sensor. Status: {ITEM.LASTVALUE} on {HOST.NAME}|	
last(/template_quantum_scalar_i3_snmp/libraryHumiditySensorStatus)<>1|High|
|Check PowerSuply0 (Right) Status: {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/PowerSuply0Status)<>1|High|
|Check PowerSuply1 (Left) Status: {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/libraryPS1Status)<>1|High|
|Check RAS Ticket. Status: {ITEM.LASTVALUE} on {HOST.NAME}|	last(/template_quantum_scalar_i3_snmp/libraryRASStatus)<4|High|
|Check RAS Ticket. Status: {ITEM.LASTVALUE} on {HOST.NAME}|	last(/template_quantum_scalar_i3_snmp/libraryRASStatus)=1|Information|
|Check Temperature Sensor. Status: {ITEM.LASTVALUE} on {HOST.NAME}|	last(/template_quantum_scalar_i3_snmp/libraryTemperatureSensorStatus)<>1|High|
|Drive 0 need Cleaning. Status: {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/phDrive0CleaningStatus)<>1|Information|
|Drive 1 need Cleaning. Status: {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/phDrive1CleaningStatus)<>1|Information|
|Firmware Drive0 has change on {HOST.NAME}|	last(/template_quantum_scalar_i3_snmp/phDrive0FirmwareVersion,#1)<>last(/template_quantum_scalar_i3_snmp/phDrive0FirmwareVersion,#2)|Information|
|Firmware Drive1 has change on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/phDrive1FirmwareVersion,#1)<>last(/template_quantum_scalar_i3_snmp/phDrive1FirmwareVersion,#2)|Information|
|Firmware Library has change on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/libraryFirmware,#1)<>last(/template_quantum_scalar_i3_snmp/libraryFirmware,#2)|Information|
|Global Status of Library. Status: {ITEM.LASTVALUE}|last(/template_quantum_scalar_i3_snmp/libraryGlobalStatus)=4|Information|
|Global Status of Library. Status: {ITEM.LASTVALUE}|last(/template_quantum_scalar_i3_snmp/libraryGlobalStatus)<4|High|
|Hight Humidity, value: {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/libraryHumiditySensorValue)>{$HIGHT_HUMIDITY2}|High|
|Hight temperature {ITEM.LASTVALUE} on {HOST.NAME}|	last(/template_quantum_scalar_i3_snmp/libraryTemperatureSensorValue)>{$HIGHT_TEMP}|High|
|Low Humidity {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/libraryHumiditySensorValue)<{$LOW_HUMIDITY}|High|
|Low temperature {ITEM.LASTVALUE} on {HOST.NAME}|last(/template_quantum_scalar_i3_snmp/libraryTemperatureSensorValue)<{$LOW_TEMP}|High|
|Ping loss is too high on {HOST.NAME}|min(/template_TH2ESensor_snmp/icmppingloss,5m)>20|Warning|
|Response time is too high on {HOST.NAME}|avg(/template_TH2ESensor_snmp/icmppingsec,5m)>0.40|Warning|
|{HOST.NAME} is unavailable by ICMP|max(/template_TH2ESensor_snmp/icmpping,#5)=0|Average|


## Macros used

|Name|Description|Value|
|----|-----------|----|
|{$HIGHT_HUMIDITY}|HUMIDITY to high|60|
|{$HIGHT_HUMIDITY2}|HUMIDITY to high|70|
|{$HIGHT_TEMP}|Temperature to high|30|
|{$LOW_HUMIDITY}|HUMIDITY to low|20|
|{$LOW_TEMP}|Temperature to low|15|
|{$SNMP_COMMUNITY}| - |publicCmtyStr|

## Value mapping

I also created a value mapping as in the example:

aggregatedIEAreaStatus 

=0 ⇒ unknown

=1 ⇒ insertedClosed

=2 ⇒ ejectedOpen

