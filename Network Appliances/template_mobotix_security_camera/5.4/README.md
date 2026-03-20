# Mobotix Camera

## Overview

This template will get you the following items from a Mobotix IP Security Camera:


Model Name, Name, Serial Number, Uptime, Storage Type, Storage Used Space, Flash Wear, Remaining Time to save, Software Version, Software Version Timestamp


It will trigger on the following:


* Used space above 80% (High)
* Flash Wear above 65% (Warning)
* Flash Wear above 80% (High)
* Storage Low Time Remaining (High)
* Storage Failed (High)


 


 



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`nriedaedc`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Storage FlashWear|<p>OID Name in MIB: storageFlashWear Description: Flash wear of the storage (in percent)</p>|`SNMP agent`|camera.storage.wear<p>Update: 10m</p>|
|Software Version|<p>OID name in MIB: softwareVersion Description: Software version of the MOBOTIX camera</p>|`SNMP agent`|camera.software.version<p>Update: 1h</p>|
|Software Version Timestamp|<p>OID name in MIB: softwareVersionTimestamp Description: Timestamp of the camera software</p>|`SNMP agent`|camera.software.version.timestamp<p>Update: 1h</p>|
|Camera Serial Number|<p>OID name in MIB: cameraSerialNumber Description: Serial number of the MOBOTIX camera</p>|`SNMP agent`|camera.serialnumber<p>Update: 6h</p>|
|Camera Model|<p>OID name in MIB: cameraModel Description: Model of the MOBOTIX camera</p>|`SNMP agent`|camera.model<p>Update: 6h</p>|
|Storage Type|<p>-</p>|`SNMP agent`|camera.storage.type<p>Update: 6h</p>|
|Camera Uptime|<p>OID name in MIB: statusCurrentUptime Description: Actual Uptime of the MOBOTIX camera (seconds)</p>|`SNMP agent`|camera.uptime<p>Update: 10m</p>|
|Camera Name|<p>OID name in MIB: cameraName Description: Camera name as set in the Quick Installation wizard or in the Ethernet Interface dialog in the Camera name field</p>|`SNMP agent`|camera.name<p>Update: 6h</p>|
|Storage Remaining Time|<p>OID Name in MIB: storageArchiveBufferRemainingTime Description: Estimated remaining time (in minutes) until overflow of the intermediate buffer (SD card) for archiving. Returns -1 if this data is not available</p>|`SNMP agent`|camera.storage.remainingtime<p>Update: 10m</p>|
|Storage Percent Used Space|<p>OID in MIB: storageArchiveBufferFillLevel Description: Indicates the fill level of the SD card (in percent) when used as an intermediate buffer for archiving. If it is at 100% there is a threat of data loss. Returns -1 if this data is not available</p>|`SNMP agent`|camera.storage.usedspace<p>Update: 10m</p>|


## Triggers

There are no triggers in this template.

