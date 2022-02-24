# SNMP Tripp Lite PDU 15

## Overview

This is a fork of Zabbix-TrippLite-PDU-15 by AlKosmos.


This version has been updated and confirmed fully functional on a WEBCARDLX  PDUMH20ATNET TRIPPLITE  PDU running 15.5.2. 


It uses the latest OID and MIB provided by Tripp Lite.


**MIBS:**
---------


https://www.tripplite.com/products/management-utilities


Download "Tripp Lite Enterprise MIB Package"


You will need TRIPPLITE.MIB & TRIPPLITE-PRODUCTS.MIB (Depending on your device


 


**INSTRUCTIONS:**
-----------------


**Zabbix Template:**


<https://github.com/Ceillian/Zabbix-Tripp-Lite-PDU-15>


 


Install the MIBS for TRIPPLITE on your Zabbix host or proxy. (/usr/share/snmp/mibs)


Requires the following macros:


{$HISTORY} {$TRENDS} {$UPDATEINT}


{$MAX\_INPUTVOLTAGE} {$MAX\_OUTPUTCURRENT\_CRITICAL} {$MAX\_OUTPUTCURRENT\_WARNING} {$MIN\_INPUTVOLTAGE} {$SNMP\_COMMUNITY}


*EXAMPLE:*


<p style="box-sizing: border-box; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; margin-bottom: 0px 

## Author

Ceillian

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$MAX_INPUTVOLTAGE}|<p>-</p>|`125`|Text macro|
|{$MAX_OUTPUTCURRENT_CRITICAL}|<p>-</p>|`12`|Text macro|
|{$MAX_OUTPUTCURRENT_WARNING}|<p>-</p>|`10`|Text macro|
|{$MIN_INPUTVOLTAGE}|<p>-</p>|`115`|Text macro|
|{$SNMP_COMMUNITY}|<p>-</p>|`zabbix`|Text macro|


## Template links

|Name|
|----|
|Template Module ICMP Ping|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Outlets|<p>-</p>|`SNMP agent`|tlpAtsOutletIndex<p>Update: 86400</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Input - Voltage|<p>The number of input voltages. Phase to phase or phase to neutral. This variable indicates the number of rows in the input table.</p>|`SNMP agent`|tlpAtsInputPhaseVoltage<p>Update: {$UPDATEINT}</p>|
|PDU  Software Version|<p>The UPS firmware/software version(s). This variable may or may not have the same value as upsIdentAgentSoftwareVersion in some implementations.</p>|`SNMP agent`|tlpDeviceIdentFirmwareVersion<p>Update: 86400</p>|
|Device Name|<p>A string identifying the UPS. This object should be set by the administrator.</p>|`SNMP agent`|tlpDeviceName<p>Update: 86400</p>|
|Low Transfer Voltage|<p>The number of input voltages. Phase to phase or phase to neutral. This variable indicates the number of rows in the input table.</p>|`SNMP agent`|tlpAtsConfigLowVoltageTransfer<p>Update: {$UPDATEINT}</p>|
|Input - Source Availability|<p>Reports power input sources for PDU.</p>|`SNMP agent`|tlpAtsInputSourceAvailability<p>Update: 30s</p>|
|Device Location|<p>The device location string.</p>|`SNMP agent`|tlpDeviceLocation<p>Update: 86400</p>|
|SNMP traps (fallback)|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|Maximum Output Current|<p>-</p>|`SNMP agent`|tlpAtsOutputCurrentMax<p>Update: {$UPDATEINT}</p>|
|Maximum Input Voltage|<p>The number of input voltages. Phase to phase or phase to neutral. This variable indicates the number of rows in the input table.</p>|`SNMP agent`|tlpAtsInputPhaseVoltageMax<p>Update: {$UPDATEINT}</p>|
|Minimum Input Voltage|<p>The number of input voltages. Phase to phase or phase to neutral. This variable indicates the number of rows in the input table.</p>|`SNMP agent`|tlpAtsOutputCurrentMin<p>Update: {$UPDATEINT}</p>|
|Input - Frequency|<p>-</p>|`SNMP agent`|tlpAtsInputPhaseFrequency<p>Update: {$UPDATEINT}</p>|
|Output Current|<p>-</p>|`SNMP agent`|tlpAtsOutputCurrent<p>Update: {$UPDATEINT}</p>|
|Manufacturer Identification|<p>The name of the UPS manufacturer.</p>|`SNMP agent`|tlpDeviceManufacturer<p>Update: 86400</p>|
|PDU Serial Number|<p>Serial number for the UPS.</p>|`SNMP agent`|tlpDeviceIdentSerialNum<p>Update: 86400</p>|
|Model Identification|<p>The UPS Model designation.</p>|`SNMP agent`|tlpDeviceModel<p>Update: 86400</p>|
|Agent Software Version|<p>The UPS agent software version. This variable may or may not have the same value as upsIdentUPSSoftwareVersion in some implementations.</p>|`SNMP agent`|tlpAgentVersion<p>Update: 86400</p>|
|Outlet - Ramp data type of outlet $1|<p>The type of data associated with ramp action.</p>|`SNMP agent`|tlAtsOutletRampDataType[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Outlet - Ndx group of outlet $1|<p>tlPDUOutletGroupIndex of corresponding outlet group, or 0 if ungrouped.</p>|`SNMP agent`|tlpAtsOutletGroup[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Outlet - Name of outlet $1|<p>A string identifying the devices attached to the output(s) of the device.</p>|`SNMP agent`|tlpAtsOutletName[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Outlet - Ramp action of outlet $1|<p>The ramp action to take on the Outlet.</p>|`SNMP agent`|tlpAtsOutletRampAction[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Outlet - Shed action of outlet $1|<p>The shed action to take on the Outlet.</p>|`SNMP agent`|tlpAtsOutletShedAction[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Outlet - Shed action data type of outlet $1|<p>The type of data associated with shed action.</p>|`SNMP agent`|tlpAtsOutletShedDataType[{#SNMPVALUE}]<p>Update: 1d</p><p>LLD</p>|
|Outlet - State of outlet $1|<p>The current state of the Outlet.</p>|`SNMP agent`|tlpAtsOutletState[{#SNMPVALUE}]<p>Update: 2m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

