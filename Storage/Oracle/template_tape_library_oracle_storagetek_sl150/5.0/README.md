# SNMP Tape Library Oracle StorageTek SL150

## Description

Based on MIB File: STREAMLINE-TAPE-LIBRARY-MIB Created by Samuel Martins https://github.com/slunart/ https://www.linkedin.com/in/slmartins/ 2020-04-19 Version 1.0

## Overview

Hello,  
I created this template to monitor the Oracle StorageTek SL150 Modular Tape Library equipment ((www.oracle.com/br/storage/tape-storage/sl150-modular-tape-library/) via SNMP agent. I used as a base the MIB called "STREAMLINE-TAPE-LIBRARY-MIB" and validated it on an SL 150 device. This template is likely to work partially on other Oracle Tape Library as on the SL 500 version.  
  
This template is also available on GitHub: https://github.com/slunart/Zabbix-Templates/tree/master/Oracle  
  
If you find any inconsistencies in the template, please let me know that I will try to improve it.  
  
Best regards,  
  
Samuel Martins



## Author

Samuel Martins

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|[Controller] Discovery of Controller Fault LED|<p>The Controller's Fault LED state</p>|`SNMP agent`|slControllerFaultLED<p>Update: 1h</p>|
|[Controller] Discovery of Safe To Remove LED|<p>The Controller's safe to remove LED state</p>|`SNMP agent`|slControllerSafeToRemoveLED<p>Update: 1h</p>|
|[Drive] Discovery of Drive Fibre Port B is Enabled|<p>Port B - is port enabled</p>|`SNMP agent`|slDriveFibrePortBPortEnabled<p>Update: 1h</p>|
|[Robot] Discovery of The Robot's hand state|<p>The Robot's hand state (cartridge=1, no cartridge=0)</p>|`SNMP agent`|slRobotHandCartStatus<p>Update: 1h</p>|
|[Drive] Discovery of Drive Command Clean|<p>Signal to clean/cancel cleaning of the drive enable(1), cancel(2)</p>|`SNMP agent`|slDriveCommandClean<p>Update: 1h</p>|
|[Fan] Discovery of Fan Name|<p>Name of the fan</p>|`SNMP agent`|slFanName<p>Update: 1h</p>|
|[Temp] Discovery of High Temperature Sensor|<p>Storage area peak temp since last machine boot</p>|`SNMP agent`|slTempSensorHighTemp<p>Update: 1h</p>|
|[LSM] Discovery of LSM Status|<p>The LSM operational state - reported as a string (online, offline, offlinePending). This is hardware-based state, derived from robot state</p>|`SNMP agent`|slLibLSMStatus<p>Update: 1h</p>|
|[Temp] Discovery of Temperature Threshold for Shutdown|<p>Temp threshold for automated library activity shutdown</p>|`SNMP agent`|slTempSensorFailThreshold<p>Update: 1h</p>|
|[Cleaning] Discovery of Number of times that the cartridge has been used to clean|<p>Number of times that the cartridge has been used to clean</p>|`SNMP agent`|slLibCleanCartUsageCount<p>Update: 1h</p>|
|[Drive] Discovery of Drive Type|<p>The drive's type, e.g. STK9840, HpUltrium4, etc. -- This text string is derived by the manufacturer and make of the drive. -- Please refer to the "Specification for Tape Cartridge Media Identification" -- Sun/Oracle Doc No. 3136715</p>|`SNMP agent`|slDriveType<p>Update: 1h</p>|
|[PowerSupply] Discovery if the Power Supply is Installed|<p>Indicates if the supply is installed(2) or not(1)</p>|`SNMP agent`|slPowerSupplyInstalled<p>Update: 1h</p>|
|[Cleaning] Discovery of Cleaning Warn cartridge type|<p>Cleaning cartridge type (DLT, 9840, LTO, etc)</p>|`SNMP agent`|slLibCleanWarnCartType<p>Update: 1h</p>|
|[Controller] Discovery of Code Version|<p>The controller's code version</p>|`SNMP agent`|slControllerCodeVer<p>Update: 1h</p>|
|[Temp] Discovery of Temperature Warn Threshold|<p>Temp threshold for automated warning</p>|`SNMP agent`|slTempSensorWarnThreshold<p>Update: 1h</p>|
|[Drive] Discovery of Drive Serial Number|<p>The drive's electronic serial number</p>|`SNMP agent`|slDriveSerialNum<p>Update: 1h</p>|
|[Inventory] Discovery of Tape Location Element ID|<p>Element ID or translated logical HLI Address of the tape cartridge</p>|`SNMP agent`|slTapeLocationElementID<p>Update: 1h</p>|
|[Cap] Discovery of Cap Physical Address|<p>CAP physical address string. NOTE: SL500 returns a logical SCSI Element ID" -- NOTE: For backwards compatibility, the SL500 will continue to return a -- logical SCSI Element ID in lieu of a physical address.</p>|`SNMP agent`|slCapPhysicalAddressStr<p>Update: 1h</p>|
|[Drive] Discovery of Drive LED|<p>The drive's Tray LED sate (1=on,0=off)</p>|`SNMP agent`|slDriveLED<p>Update: 1h</p>|
|[Cleaning] Discovery of The ID of Cleaning Cartridge Location|<p>The cleaning cartridge location - SCSI Element ID or translated HLI Address</p>|`SNMP agent`|slLibCleanCartLocationElementID<p>Update: 1h</p>|
|[Robot] Discovery of Robot Serial Number|<p>The Robot's card serial number</p>|`SNMP agent`|slRobotSerialNum<p>Update: 1h</p>|
|[Drive] Discovery of Drive Fibre Node Name|<p>Drive's fibre node name (node WWN)</p>|`SNMP agent`|slDriveFibreNodeName<p>Update: 1h</p>|
|[Cap] Discovery of Cap Accessibility|<p>The accessibility of a CAP (open allow/prevent)</p>|`SNMP agent`|slCapAccessibility<p>Update: 1m</p>|
|[Temp] Discovery of the Temperature Sensor's Name|<p>-</p>|`SNMP agent`|slTempSensorName<p>Update: 1h</p>|
|[PowerSupply] Discovery if the PowerSupply is Operational|<p>Indicates if the supply is OK(2), meaningless if not-installed</p>|`SNMP agent`|slPowerSupplyOperational<p>Update: 1h</p>|
|[Drive] Discovery of Drive Num Mounts|<p>Number of mounts to the drive</p>|`SNMP agent`|slDriveNumMounts<p>Update: 1h</p>|
|[Robot] Discovery of Robot Operational Status|<p>The robot's operational status in enumerated form</p>|`SNMP agent`|slRobotStatusEnum<p>Update: 1h</p>|
|[Inventory] Discovery of Tape Partition Type|<p>Tape Cartridge partition type</p>|`SNMP agent`|slTapePartitionType<p>Update: 1h</p>|
|[Temp] Discovery of Current Temperature|<p>Current/Present temperature reading</p>|`SNMP agent`|slTempSensorCurrentTemp<p>Update: 1h</p>|
|[Drive] Discovery of Drive Interface Type|<p>The drive's physical data transport type</p>|`SNMP agent`|slDriveInterfaceType<p>Update: 1h</p>|
|[Robot] Discovery of Robot Version|<p>-</p>|`SNMP agent`|slRobotVersion<p>Update: 1h</p>|
|[Drive] Discovery of Drive State|<p>The drive's state (empty, loaded, needs cleaning, etc)</p>|`SNMP agent`|slDriveState<p>Update: 1h</p>|
|[Drive] Discovery of Drive Cell Status|<p>The status of the drive's cell presented as an enumeration</p>|`SNMP agent`|slDriveCellStatusEnum<p>Update: 1h</p>|
|[Drive] Discovery of Drive Idle Seconds|<p>Number of seconds that the drive has been idle (unmounted)</p>|`SNMP agent`|slDriveIdleSeconds<p>Update: 1h</p>|
|[Controller] Discovery of Hardware Version|<p>The controller's hardware version</p>|`SNMP agent`|slControllerVersion<p>Update: 1h</p>|
|[Robot] Discovery of Robot Fault LED|<p>The Robot's Fault LED status off=0, on=1</p>|`SNMP agent`|slRobotFaultLED<p>Update: 1h</p>|
|[Robot] Discovery of Robot Get Retries|<p>The number of mount retries performed by the robot</p>|`SNMP agent`|slRobotGetRetries<p>Update: 1h</p>|
|[Robot] Discovery of Robot State|<p>The robot's state (empty, loaded, moving, etc)</p>|`SNMP agent`|slRobotState<p>Update: 1h</p>|
|[Cap] Discovery of Cap Status|<p>The operational status of the CAP presented as an enumeration</p>|`SNMP agent`|slCapStatusEnum<p>Update: 1h</p>|
|[Inventory] Discovery of Tape Host Accessible|<p>Indication of host accessible status true(1), false(2)</p>|`SNMP agent`|slTapeHostAccessible<p>Update: 1h</p>|
|[Controller] Discovery of Controller Status|<p>he controller's operational status in enumerated form</p>|`SNMP agent`|discovery[{#SNMPVALUE},slControllerStatusEnum]<p>Update: 1h</p>|
|[Drive] Discovery of Drive Fibre Port Count|<p>The number of active ports in the drive</p>|`SNMP agent`|slDriveFibrePortCount<p>Update: 1h</p>|
|[Drive] Discovery of Drive Get Retries|<p>The number of mount retries performed to the drive</p>|`SNMP agent`|slDriveGetRetries<p>Update: 1h</p>|
|[Cleaning] Discovery of Configured warn count threshold|<p>Configured warn count threshold</p>|`SNMP agent`|slLibCleanWarnCount<p>Update: 1h</p>|
|[Robot] Discovery of Robot Code Version|<p>-</p>|`SNMP agent`|slRobotCodeVer<p>Update: 1h</p>|
|[Inventory] Discovery of Tape Partition|<p>Tape Cartridge partition ID</p>|`SNMP agent`|slTapePartition<p>Update: 1h</p>|
|[Robot] Discovery of Robot Physical Address|<p>Robot physical address string. NOTE: SL500 returns a logical SCSI Element ID</p>|`SNMP agent`|slRobotPhysicalAddressStr<p>Update: 1h</p>|
|[Cap] Discovery of Cap Access State|<p>The access state of the cap presented as an enumeration unknown(1), open(2), close(3)</p>|`SNMP agent`|slCapAccessStateEnum<p>Update: 1h</p>|
|[Drive] Discovery of Drive Put Retries|<p>The number of dismount retries performed to the drive</p>|`SNMP agent`|slDrivePutRetries<p>Update: 1h</p>|
|[Inventory] Discovery of Tape Physical Address|<p>Tape Cartridge physical address string</p>|`SNMP agent`|slTapePhysicalAddressStr<p>Update: 1h</p>|
|[Robot] Discovery of Robot Firmware Version|<p>The robot's firmware version</p>|`SNMP agent`|slRobotFirmwareVer<p>Update: 1h</p>|
|[Controller] Discovery of Field Replaceable Unit (FRU)|<p>The controller's Field Replaceable Unit (FRU) based serial number</p>|`SNMP agent`|slControllerFru<p>Update: 1h</p>|
|[Drive] Discovery of Drive Cell Content Label|<p>The label of the cart in the drive (zero len string if empty, '??????' if unreadable)</p>|`SNMP agent`|slDriveCellContentLabel<p>Update: 1h</p>|
|[Drive] Discovery of Drive Fibre Port A is Enabled|<p>Port A - is port enabled</p>|`SNMP agent`|slDriveFibrePortAPortEnabled<p>Update: 1h</p>|
|[PowerSupply] Discovery of Power Supply Names|<p>Name of the power supply</p>|`SNMP agent`|slPowerSupplyName<p>Update: 1h</p>|
|[Fan] Discovery of Fan Status|<p>Operational state of the fan</p>|`SNMP agent`|slFanOperational<p>Update: 1h</p>|
|[Controller] Discovery of Controller Top Level Condition|<p>The Controller's top-level condition (normal, degraded, notoperative)</p>|`SNMP agent`|slControllerTopLevelCondition<p>Update: 1h</p>|
|[Drive] Discovery of Hashed Physical Address|<p>Hashed Physical Address of the drive. NOTE: SL500 returns a logical SCSI Element ID -- NOTE: For backwards compatibility, the SL500 will continue to return a -- logical SCSI Element ID in lieu of a physical address.</p>|`SNMP agent`|slDriveHashedPhysAddr<p>Update: 1h</p>|
|[Cap] Discovery of Cap Rotations|<p>The Caps rotation count</p>|`SNMP agent`|slCapRotations<p>Update: 1h</p>|
|[Cleaning] Discovery of Indication of host accessible status|<p>Indication of host accessible status true(1), false(2)</p>|`SNMP agent`|slLibCleanCartHostAccessible<p>Update: 1h</p>|
|[Robot] Discovery of Robot Put Retries|<p>The number of dismount retries performed by the robot</p>|`SNMP agent`|slRobotPutRetries<p>Update: 1h</p>|
|[Cap] Discovery of Cap Name|<p>The CAP name</p>|`SNMP agent`|slCapName<p>Update: 1h</p>|
|[Cleaning] Discovery of The clean cartridge label|<p>The clean cartridge label</p>|`SNMP agent`|slLibCleanCartLabel<p>Update: 1h</p>|
|[Cap] Discovery of Cap is Enabled|<p>The Enabled state of the Cap</p>|`SNMP agent`|slCapEnabled<p>Update: 1h</p>|
|[Inventory] Discovery of Tape Logical Address|<p>Tape Cartridge logical address string</p>|`SNMP agent`|slTapeLogicalAddressStr<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Serial Number|<p>The library frame serial number</p>|`SNMP agent`|slLibSerialNumber<p>Update: 1h</p>|
|Total Number of Put Failures|<p>The total number of put failures</p>|`SNMP agent`|slLibStatsNumPutFails<p>Update: 1m</p>|
|Street|<p>Location/Site - street address</p>|`SNMP agent`|slLibLocatStreet<p>Update: 1h</p>|
|Agent Ha identifier|<p>RE controller identifier. active=0, standby=1</p>|`SNMP agent`|slAgentHaId<p>Update: 5m</p>|
|Boot Software/OS Version|<p>The library's boot software/OS version</p>|`SNMP agent`|slLibVersionBootRev<p>Update: 1h</p>|
|Contact|<p>The primary contact for administration</p>|`SNMP agent`|slLibLocatContact<p>Update: 1h</p>|
|Total Number of Put Retries|<p>The total number of put retries</p>|`SNMP agent`|slLibStatsNumPutRetries<p>Update: 1m</p>|
|Total Number of Get Retries|<p>The total number of get retries</p>|`SNMP agent`|slLibStatsNumGetRetries<p>Update: 1m</p>|
|Base Model|<p>The StorageTek Model Name - see slXXXX section for vendor specific model data</p>|`SNMP agent`|slLibStkBaseModel<p>Update: 1h</p>|
|Firmware Build Date|<p>The library's embedded firmware build date</p>|`SNMP agent`|slLibVersionFirmDate<p>Update: 1h</p>|
|Total of Drives|<p>Count of the drives in the drive table</p>|`SNMP agent`|slDriveCount<p>Update: 1m</p>|
|Number of cartridge types supported|<p>Number of unique cartridge types supported</p>|`SNMP agent`|slLibCleanNumCartTypes<p>Update: 1m</p>|
|Total Number of Cartridge Moves|<p>The total number of cartridge moves</p>|`SNMP agent`|slLibStatsNumMoves<p>Update: 1m</p>|
|Number of Available Restricted Cells|<p>Number of available restricted (empty) storage cells in the library</p>|`SNMP agent`|slCellStorageRestrictedFreeCells<p>Update: 1m</p>|
|Total Number of Get Failures|<p>The total number of get failures</p>|`SNMP agent`|slLibStatsNumGetFails<p>Update: 1m</p>|
|Total of Elevators|<p>Count of the elevators in the elevator table</p>|`SNMP agent`|slElevatorCount<p>Update: 1m</p>|
|Agent Ha State|<p>RE controller state. simplex=0, duplex(switchable)=1</p>|`SNMP agent`|slAgentHaState<p>Update: 5m</p>|
|Top Level Condition|<p>The overall condition of the library (normal,degraded,not-operational)</p>|`SNMP agent`|slLibraryTopLevelCondition<p>Update: 1m</p>|
|Total of LSM|<p>The LSM Count</p>|`SNMP agent`|slLibLSMCount<p>Update: 1m</p>|
|Total of Safety Door Center Completions|<p>The safety door center completion count</p>|`SNMP agent`|slSafetyDoorCenterCount<p>Update: 1h</p>|
|Total of Caps|<p>Count of the CAPs in the CAP table</p>|`SNMP agent`|slCapCount<p>Update: 1m</p>|
|Clean Enabled|<p>Auto clean feature configuration. Not all libraries support this feature, please refer to user documentation.</p>|`SNMP agent`|slLibCleanEnabled<p>Update: 1m</p>|
|Total of Cells|<p>Count of the storage elements in the cell table</p>|`SNMP agent`|slCellCount<p>Update: 1m</p>|
|Total of Temperature Sensors|<p>Number of temperature sensors in the library</p>|`SNMP agent`|slTempSensorCount<p>Update: 5m</p>|
|Total of Tapes|<p>Count of the cartridges in the inventory table</p>|`SNMP agent`|slTapeCount<p>Update: 1m</p>|
|Agent Ha Alternate Ip|<p>alternate RE controller's IP address</p>|`SNMP agent`|slAgentHaAlternateIp<p>Update: 5m</p>|
|Total of Drives in the Drive Media Validation Table|<p>Count of the drives in the drive Media Validation table</p>|`SNMP agent`|slMVDriveCount<p>Update: 1h</p>|
|WWN Number|<p>The libraries WWN number</p>|`SNMP agent`|slLibWWNNumber<p>Update: 1h</p>|
|Cumulative Machine Up Time in Seconds|<p>Cumulative Machine Up Time in seconds</p>|`SNMP agent`|slLibStatsCumMachUptime<p>Update: 1m</p>|
|Number of Library Initializations|<p>The number of library initializations</p>|`SNMP agent`|slLibStatsNumBoots<p>Update: 1m</p>|
|Number of Available Cells|<p>Number of available (empty) storage cells in the library</p>|`SNMP agent`|slCellStorageFreeCells<p>Update: 1m</p>|
|State|<p>Location/Site - state/province</p>|`SNMP agent`|slLibLocatState<p>Update: 1h</p>|
|Total of Safety Door Retries|<p>The number of total Safety Door retries</p>|`SNMP agent`|slSafetyDoorRetries<p>Update: 1h</p>|
|Country|<p>Location/Site - country</p>|`SNMP agent`|slLibLocatCountry<p>Update: 1h</p>|
|Controller Hardware Version|<p>The library's controller hardware version</p>|`SNMP agent`|slLibVersionHardware<p>Update: 1h</p>|
|Number of IPL's by the Safety Door|<p>The number of IPL's performed by the Safety Door</p>|`SNMP agent`|slSafetyDoorIPLs<p>Update: 1h</p>|
|slAgentHaSlot|<p>RE controller slot. sideA=0, sideB=1</p>|`SNMP agent`|slAgentHaSlot<p>Update: 5m</p>|
|Total of Ptp|<p>Count of the pass-through ports in the library</p>|`SNMP agent`|slPtpCount<p>Update: 1m</p>|
|State|<p>The statue of the library (online, offline)</p>|`SNMP agent`|slLibraryState<p>Update: 1m</p>|
|Total Number of Mounts|<p>The total number of mounts</p>|`SNMP agent`|slLibStatsNumMounts<p>Update: 1m</p>|
|Firmware Version|<p>The library's embedded firmware version per EC field releases</p>|`SNMP agent`|slLibVersionFirmRev<p>Update: 1h</p>|
|Total of Clean Cartridges|<p>Count of the clean cartridges in the library</p>|`SNMP agent`|slLibCleanNumCarts<p>Update: 1m</p>|
|Total of Robots|<p>Count of the number of robots in the table</p>|`SNMP agent`|slRobotCount<p>Update: 1m</p>|
|Total of Controllers|<p>Count of the controllers in the controller table</p>|`SNMP agent`|slControllerCount<p>Update: 1m</p>|
|Total of Fans|<p>Number of monitored fans in the library</p>|`SNMP agent`|slFanCount<p>Update: 1m</p>|
|Total of Power Supplies|<p>Number of power supplies installed in the library</p>|`SNMP agent`|slPowerSupplyCount<p>Update: 1m</p>|
|Descr|<p>Location/site - description/misc</p>|`SNMP agent`|slLibLocatDescr<p>Update: 1h</p>|
|Zip|<p>Location/Site - zip code (or other data)</p>|`SNMP agent`|slLibLocatZip<p>Update: 1h</p>|
|UpTime Since Last Boot|<p>In seconds</p>|`SNMP agent`|slLibStatsUpTimeSinceLastBoot<p>Update: 1m</p>|
|Number of Times The Service Door Has Been Opened|<p>The number of times the service door has been opened</p>|`SNMP agent`|slLibStatsNumDoorOpens<p>Update: 1m</p>|
|City|<p>Location/Site - city</p>|`SNMP agent`|slLibLocatCity<p>Update: 1h</p>|
|Controller {#SNMPINDEX} Fault LED|<p>The Controller's Fault LED state off=0, on=1</p>|`SNMP agent`|slControllerFaultLED[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Controller {#SNMPINDEX} Safe To Remove LED|<p>The Controller's safe to remove LED state</p>|`SNMP agent`|slControllerSafeToRemoveLED[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Fibre Port B is Enabled|<p>Port B - is port enabled</p>|`SNMP agent`|slDriveFibrePortBPortEnabled[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Robot's Hand State {#SNMPINDEX}|<p>The Robot's hand state (cartridge=1, no cartridge=0)</p>|`SNMP agent`|slRobotHandCartStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Command Clean|<p>Signal to clean/cancel cleaning of the drive enable(1), cancel(2)</p>|`SNMP agent`|slDriveCommandClean[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Fan Name {#SNMPINDEX}|<p>Name of the fan</p>|`SNMP agent`|slFanName[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|High Temperature since last boot {#SNMPINDEX}|<p>Storage area peak temp since last machine boot</p>|`SNMP agent`|slTempSensorHighTemp[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|LSM {#SNMPINDEX} Status|<p>The LSM operational state - reported as a string (online, offline, offlinePending). This is hardware-based state, derived from robot state</p>|`SNMP agent`|slLibLSMStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Temperature Threshold for Shutdown {#SNMPINDEX}|<p>Temp threshold for automated library activity shutdown</p>|`SNMP agent`|slTempSensorFailThreshold[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Number of times that the cartridge {#SNMPINDEX} has been used to clean|<p>Number of times that the cartridge has been used to clean</p>|`SNMP agent`|slLibCleanCartUsageCount[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Type|<p>The drive's type, e.g. STK9840, HpUltrium4, etc." -- This text string is derived by the manufacturer and make of the drive. -- Please refer to the "Specification for Tape Cartridge Media Identification" -- Sun/Oracle Doc No. 3136715</p>|`SNMP agent`|slDriveType[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Power Supply {#SNMPINDEX} is Installed|<p>Indicates if the supply is installed(2) or not(1)</p>|`SNMP agent`|slPowerSupplyInstalled[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Cleaning cartridge type {#SNMPINDEX}|<p>Cleaning cartridge type (DLT, 9840, LTO, etc)</p>|`SNMP agent`|slLibCleanWarnCartType[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Controller {#SNMPINDEX} Code Version|<p>The controller's code version</p>|`SNMP agent`|slControllerCodeVer[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Warn Threshold {#SNMPINDEX}|<p>Temp threshold for automated warning</p>|`SNMP agent`|slTempSensorWarnThreshold[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Serial Number|<p>The drive's electronic serial number</p>|`SNMP agent`|slDriveSerialNum[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Tape {#SNMPINDEX} Location Element ID|<p>Element ID or translated logical HLI Address of the tape cartridge</p>|`SNMP agent`|slTapeLocationElementID[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Cap {#SNMPINDEX} Physical Address|<p>CAP physical address string. NOTE: SL500 returns a logical SCSI Element ID" -- NOTE: For backwards compatibility, the SL500 will continue to return a -- logical SCSI Element ID in lieu of a physical address.</p>|`SNMP agent`|slCapPhysicalAddressStr[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Drive {#SNMPINDEX} LED|<p>The drive's Tray LED sate (1=on,0=off)</p>|`SNMP agent`|slDriveLED[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|ID of Cleaning Cartridge Location {#SNMPINDEX}|<p>The cleaning cartridge location - SCSI Element ID or translated HLI Address</p>|`SNMP agent`|slLibCleanCartLocationElementID[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Robot Serial Number {#SNMPINDEX}|<p>-</p>|`SNMP agent`|slRobotSerialNum[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Drive {#SNMPINDEX} Fibre Node Name|<p>Drive's fibre node name (node WWN)</p>|`SNMP agent`|slDriveFibreNodeName[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Cap {#SNMPINDEX} Accessibility|<p>The accessibility of a CAP (open allow/prevent)</p>|`SNMP agent`|slCapAccessibility[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Temperature Sensor's Name {#SNMPINDEX}|<p>Name of the temperature sensor</p>|`SNMP agent`|slTempSensorName[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Power Supply {#SNMPINDEX} is Operational|<p>Indicates if the supply is OK(2), meaningless if not-installed</p>|`SNMP agent`|slPowerSupplyOperational[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Num Mounts|<p>Number of mounts to the drive</p>|`SNMP agent`|slDriveNumMounts[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Robot {#SNMPINDEX} Operational Status|<p>The robot's operational status in enumerated form ok(0), error(1), warning(2), info(3), trace(4)</p>|`SNMP agent`|slRobotStatusEnum[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Tape {#SNMPINDEX} Partition Type|<p>Tape Cartridge partition type hli(1), scsi(2), other(3)</p>|`SNMP agent`|slTapePartitionType[{#SNMPINDEX}]<p>Update: 1d</p><p>LLD</p>|
|Current temperature of {#SNMPINDEX}|<p>Current/Present temperature reading</p>|`SNMP agent`|slTempSensorCurrentTemp[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Interface Type|<p>The drive's physical data transport type</p>|`SNMP agent`|slDriveInterfaceType[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Robot {#SNMPINDEX} Version|<p>The robot's hardware version</p>|`SNMP agent`|slRobotVersion[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Drive {#SNMPINDEX} State|<p>The drive's state (empty, loaded, needs cleaning, etc)</p>|`SNMP agent`|slDriveState[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Cell Status|<p>he status of the drive's cell presented as an enumeration unknown(1), empty(2), full(3)</p>|`SNMP agent`|slDriveCellStatusEnum[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Idle Seconds|<p>Number of seconds that the drive has been idle (unmounted)</p>|`SNMP agent`|slDriveIdleSeconds[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Controller {#SNMPINDEX} Hardware Version|<p>The controller's hardware version</p>|`SNMP agent`|slControllerVersion[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Robot {#SNMPINDEX} Fault LED|<p>The Robot's Fault LED status off=0, on=1</p>|`SNMP agent`|slRobotFaultLED[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Number of Mount Retries by Robot {#SNMPINDEX}|<p>The number of mount retries performed by the robot</p>|`SNMP agent`|slRobotGetRetries[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Robot's {#SNMPINDEX} state|<p>The robot's state (empty, loaded, moving, etc)</p>|`SNMP agent`|slRobotState[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Cap {#SNMPINDEX} Status|<p>The operational status of the CAP presented as an enumeration</p>|`SNMP agent`|slCapStatusEnum[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Tape {#SNMPINDEX} Host Accessible|<p>Indication of host accessible status</p>|`SNMP agent`|slTapeHostAccessible[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Controller {#SNMPINDEX} Status|<p>The controller's operational status in enumerated form</p>|`SNMP agent`|slControllerStatusEnum[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Fibre Port Count|<p>The number of active ports in the drive single(1), dual(2)</p>|`SNMP agent`|slDriveFibrePortCount[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Get Retries|<p>The number of mount retries performed to the drive</p>|`SNMP agent`|slDriveGetRetries[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Configured warn count threshold {#SNMPINDEX}|<p>Configured warn count threshold</p>|`SNMP agent`|slLibCleanWarnCount[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Robot's {#SNMPINDEX} Code Version|<p>The robot's code version</p>|`SNMP agent`|slRobotCodeVer[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Tape {#SNMPINDEX} Partition ID|<p>Tape Cartridge partition ID</p>|`SNMP agent`|slTapePartition[{#SNMPINDEX}]<p>Update: 1d</p><p>LLD</p>|
|Robot Physical Address {#SNMPINDEX}|<p>Robot physical address string. NOTE: SL500 returns a logical SCSI Element ID</p>|`SNMP agent`|slRobotPhysicalAddressStr[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Cap {#SNMPINDEX} Access State|<p>The access state of the cap presented as an enumeration</p>|`SNMP agent`|slCapAccessStateEnum[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Put Retries|<p>The number of dismount retries performed to the drive</p>|`SNMP agent`|slDrivePutRetries[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Tape {#SNMPINDEX} Physical Address|<p>Tape Cartridge physical address string</p>|`SNMP agent`|slTapePhysicalAddressStr[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Robot's {#SNMPINDEX} Firmware Version|<p>The robot's firmware version</p>|`SNMP agent`|slRobotFirmwareVer[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Controller {#SNMPINDEX} Field Replaceable Unit (FRU)|<p>The controller's Field Replaceable Unit (FRU) based serial number</p>|`SNMP agent`|slControllerFru[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Drive {#SNMPINDEX} Cell Content Label|<p>The label of the cart in the drive (zero len string if empty, '??????' if unreadable)</p>|`SNMP agent`|slDriveCellContentLabel[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Fibre Port A is Enabled|<p>Port A - is port enabled</p>|`SNMP agent`|slDriveFibrePortAPortEnabled[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Power Supply Name {#SNMPINDEX}|<p>Name of the power supply</p>|`SNMP agent`|slPowerSupplyName[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Fan {#SNMPINDEX} Status|<p>Operational state of the fan failed(1), normal(2)</p>|`SNMP agent`|slFanOperational[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Controller {#SNMPINDEX} Top Level Condition|<p>The Controller's top-level condition (normal, degraded, notoperative) normal(0), degraded(1), notoperative(2)</p>|`SNMP agent`|slControllerTopLevelCondition[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Drive {#SNMPINDEX} Hashed Physical Address|<p>Hashed Physical Address of the drive. NOTE: SL500 returns a logical SCSI Element ID" -- NOTE: For backwards compatibility, the SL500 will continue to return a -- logical SCSI Element ID in lieu of a physical address.</p>|`SNMP agent`|slDriveHashedPhysAddr[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Cap {#SNMPINDEX} Rotation Count|<p>The Caps rotation count</p>|`SNMP agent`|slCapRotations[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Cart {#SNMPINDEX} Host Accessible Status|<p>Indication of host accessible status</p>|`SNMP agent`|slLibCleanCartHostAccessible[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Number of Dismount Retries by Robot {#SNMPINDEX}|<p>The number of dismount retries performed by the robot</p>|`SNMP agent`|slRobotPutRetries[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Cap {#SNMPINDEX} Name|<p>The CAP name</p>|`SNMP agent`|slCapName[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Clean Cartridge Label {#SNMPINDEX}|<p>The clean cartridge label</p>|`SNMP agent`|slLibCleanCartLabel[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Cap {#SNMPINDEX} is Enabled|<p>The Enabled state of the Cap false(0), true(1)</p>|`SNMP agent`|slCapEnabled[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Tape {#SNMPINDEX} Logical Address|<p>Tape Cartridge logical address string</p>|`SNMP agent`|slTapeLogicalAddressStr[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Controller {#SNMPINDEX} has an Error Status|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slControllerStatusEnum[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
|Controller {#SNMPINDEX} has an Info Status|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slControllerStatusEnum[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|information|
|Controller {#SNMPINDEX} has an Warning Status|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slControllerStatusEnum[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Controller {#SNMPINDEX} Fault Led is On|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slControllerFaultLED[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
|Drive {#SNMPINDEX} Needs Cleaning|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slDriveState[{#SNMPINDEX}].str("needs cleaning")}=1</p><p>**Recovery expression**: </p>|high|
|Fan {#SNMPINDEX} has an Error Status|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slFanOperational[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
|The cartridge {#SNMPINDEX} has been used to clean is over than 40 times|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slLibCleanCartUsageCount[{#SNMPINDEX}].last()}>=40</p><p>**Recovery expression**: </p>|high|
|Robot {#SNMPINDEX} Fault Led is On|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slRobotFaultLED[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
|Error Operational Status by Robot {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slRobotStatusEnum[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
|Warning Operational Status by Robot {#SNMPINDEX}|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slRobotStatusEnum[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Tape Library is Going to Shutdown Soon|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slTempSensorCurrentTemp[{#SNMPINDEX}].last()}>=67</p><p>**Recovery expression**: </p>|disaster|
|The Current Temperature of Drive [{#SNMPINDEX}] is Very High|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slTempSensorCurrentTemp[{#SNMPINDEX}].last()}>=63</p><p>**Recovery expression**: </p>|high|
|Controller {#SNMPINDEX} Fault Led is On (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slControllerFaultLED[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
|The cartridge {#SNMPINDEX} has been used to clean is over than 40 times (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slLibCleanCartUsageCount[{#SNMPINDEX}].last()}>=40</p><p>**Recovery expression**: </p>|high|
|Error Operational Status by Robot {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slRobotStatusEnum[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
|Warning Operational Status by Robot {#SNMPINDEX} (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slRobotStatusEnum[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Tape Library is Going to Shutdown Soon (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slTempSensorCurrentTemp[{#SNMPINDEX}].last()}>=67</p><p>**Recovery expression**: </p>|disaster|
|The Current Temperature of Drive [{#SNMPINDEX}] is Very High (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slTempSensorCurrentTemp[{#SNMPINDEX}].last()}>=63</p><p>**Recovery expression**: </p>|high|
|Drive {#SNMPINDEX} Needs Cleaning (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slDriveState[{#SNMPINDEX}].str("needs cleaning")}=1</p><p>**Recovery expression**: </p>|high|
|Robot {#SNMPINDEX} Fault Led is On (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slRobotFaultLED[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
|Controller {#SNMPINDEX} has an Error Status (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slControllerStatusEnum[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
|Controller {#SNMPINDEX} has an Info Status (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slControllerStatusEnum[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|information|
|Controller {#SNMPINDEX} has an Warning Status (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slControllerStatusEnum[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Fan {#SNMPINDEX} has an Error Status (LLD)|<p>-</p>|<p>**Expression**: {SNMP Tape Library Oracle StorageTek SL150:slFanOperational[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|high|
