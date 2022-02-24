# ILOM ORACLE SRV X8-2 SNMP Trap

## Description

Exadata Database Machine X8-2

## Overview

Template for monitoring Oracle Exadata Infraestructure.


 

## Author

Anael Silva | Bruno Luz

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ilomSystemTrapCmuDisabled|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.77"]<p>Update: 0</p>|
|sunHwTrapProcessorFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.37"]<p>Update: 0</p>|
|ilomSystemTrapPowerWarning|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.40"]<p>Update: 0</p>|
|ilomSystemTrapCmuPowerOff|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.79"]<p>Update: 0</p>|
|sunHwTrapHostState|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.85"]<p>Update: 0</p>|
|sunHwTrapHardDriveError|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.44"]<p>Update: 0</p>|
|sunHwTrapPsuRedundancyLost|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.83"]<p>Update: 0</p>|
|sunHwTrapStorageVolumeError|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.79"]<p>Update: 0</p>|
|ilomSystemTrapCmuWarning|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.74"]<p>Update: 0</p>|
|sunHwTrapMemoryFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.40"]<p>Update: 0</p>|
|ilomSystemTrapSystemHostBootComplete|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.83"]<p>Update: 0</p>|
|ilomSystemTrapPowerSupplyOkay|<p>Power Supply okay</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.44"]<p>Update: 0</p>|
|ilomSystemTrapStorageOkay|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.49"]<p>Update: 0</p>|
|ilomSystemTrapCmuEnabled|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.76"]<p>Update: 0</p>|
|ilomSystemTrapMemoryOkay|<p>Memory okay</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.31"]<p>Update: 0</p>|
|ilomSystemTrapStorageDiskOkay|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.52"]<p>Update: 0</p>|
|ilomSystemTrapMemoryDimmInserted|<p>DIMM Inserted</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.37"]<p>Update: 0</p>|
|sunHwTrapProcessorError|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.38"]<p>Update: 0</p>|
|sunHwTrapHardDriveFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.43"]<p>Update: 0</p>|
|sunHwTrapHeartbeat|<p>A heartbeat used to verify the SNMP trap configuration. This trap is periodically generated and used to verify ongoing trap configuration, network connectivity and system identification. This functionality is required by Oracle Auto Service Request (ASR): http://www.oracle.com/us/support/auto-service-request/</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.91"]<p>Update: 0</p>|
|ilomSystemTrapSystemHostBootbegin|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.85"]<p>Update: 0</p>|
|sunHwTrapIOError|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.47"]<p>Update: 0</p>|
|ilomSystemTrapStorageServiceRequired|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.47"]<p>Update: 0</p>|
|ilomSystemTrapCpuModuleWarning|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.90"]<p>Update: 0</p>|
|ilomSystemTrapPowerSupplyRemoved|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.46"]<p>Update: 0</p>|
|sunHwTrapStorageVolumeFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.77"]<p>Update: 0</p>|
|ilomSystemTrapFallback|<p>-</p>|`SNMP trap`|snmptrap.fallback<p>Update: 0</p>|
|sunHwTrapSlotOrConnectorFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.49"]<p>Update: 0</p>|
|sunHwTrapIOFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.46"]<p>Update: 0</p>|
|ilomSystemTrapMemoryDimmRemoved|<p>Memory Dimm okay</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.38"]<p>Update: 0</p>|
|ilomSystemTrapMemoryDimmOkay|<p>Memory Dimm okay</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.34"]<p>Update: 0</p>|
|sunHwTrapHostPowerAction|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.90"]<p>Update: 0</p>|
|sunHwTrapComponentFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.52"]<p>Update: 0</p>|
|ilomSystemTrapPowerSupplyWarning|<p>-</p>|`SNMP trap`|snmptrap[".42.2.2.6.4.2.0.43"]<p>Update: 0</p>|
|sunHwTrapDriveControllerFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.74"]<p>Update: 0</p>|
|sunHwTrapPowerSupplyFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.31"]<p>Update: 0</p>|
|sunHwTrapFanFault|<p>-</p>|`SNMP trap`|snmptrap[".42.2.175.103.2.0.34"]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

