# SNMP MegaRAID SAS

## Description

Zabbix Template for Avago Megaraid SAS (formerly LSI) RAID cards

## Overview

This is initial template for Monitoring LSI/Avago/Broadcom (or branded like Intel, IBM, Supermicro etc) MegaRAID based hardware RAID cards. According to vendor docs it should also support non-RAID adapters, enclosures and some other devices.


It took me one night to complete major/required parts, so far template supports most of the options and all the critical components to keep you warned in case some RAID-related problems will occur.


Supported so far:


* Full LLD Support
* Informational part for agent/driver/module
* Complete Adapter-Related OID list with graphs and triggers
* Part of Device-Related OID's with graphs
* All triggers that are crucial
* Comments for all OID's with value mappings from MegaRAID MIB


Planned:


* Value Mappings
* Completing list of device OID's and related graphs
* virtualDevice OID's and related graphs
* enclosureInfo OID's and related graphs
* Trap setting OID's
* Traps for trapper
* Check for updated version


Not tested yet:


* M$ Windows Support
* Values and units are done as per MIB doc with 1-1 match, cannot guarantee that they are correct if vendor has provided wrong info (apparently, there is at least one minor issue)


Installation and Requirements:


* Ensure, that LSI-MegaRAID-SAS-MIB files downloaded from vendor site are installed and added to snmp.conf (after that you can restart both agent and server)
* Ensure, that appropriate package (snmp sas or snmp sas\_ir) with MegaRAID snmp agent wrapper is installed and running, snmpd.conf for OID's are set as per doc for wrapper
* Ensure, that Zabbix is allowed to gather information from snmpd
* Ensure, that required device drivers are installed on the hosts
* Import Template, assign to hosts
* Wait for LLD to check all OID's and start gathering data
* Have a good night's sleep


Bugs?  
-> Please Report @GitHub or at giomac gmail com  
  



When will you finish this?  
-> Nah, all critical issues are included, will do, definitely, but not asap



## Author

George Machitidze

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MegaRAID SAS MIB SAS adapters|<p>A List of adapter Entries containing Information/Properties about the MegaRAID related adapters on host.</p>|`SNMP agent`|adapterID<p>Update: 900</p>|
|MegaRAID SAS MIB SAS devices|<p>A List of device Entries containing Information/Properties about the MegaRAID related devices on host.</p>|`SNMP agent`|physDevID<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MegaRAID SAS MIB Agent Module Version|<p>-</p>|`SNMP agent`|agentModuleVersion<p>Update: 60</p>|
|MegaRAID SAS MIB Number of SAS adapters present|<p>-</p>|`SNMP agent`|adpNumber<p>Update: 60</p>|
|MegaRAID SAS MIB Version|<p>-</p>|`SNMP agent`|mibVersion<p>Update: 60</p>|
|MegaRAID SAS MIB Agent Module Name|<p>-</p>|`SNMP agent`|agentModuleName<p>Update: 60</p>|
|MegaRAID SAS MIB Abort CC on detecting error support for adapter $1|<p>Abort CC on detecting error is supported on this adapter. Values:No(0),Yes(1)</p>|`SNMP agent`|abortCConErrorSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Physical Devices in adapter $1|<p>Physical devices present in this adapter.</p>|`SNMP agent`|pdPresentCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB FW requires application to set up power state before conf change on adapter $1|<p>FW requires application to set power state before configuration changes. Required(1), Not Required(0)</p>|`SNMP agent`|setPowerStateForCfg[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Adapter $1 Controller Serial Number|<p>Controller serial number</p>|`SNMP agent`|serialNo[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Self Diagnostic Support for adapter $1|<p>Controller supports self diagnostic. Values:false(0),true(1)</p>|`SNMP agent`|selfDiagnosticSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Security Support for adapter $1|<p>Displays the security support. if supported (1) , not supported (0)</p>|`SNMP agent`|securitySupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Board Revision ID for adapter $1|<p>Board revision ID for this Adapter.</p>|`SNMP agent`|revisionIdentifier[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Revertible Hotspares Support for adapter $1|<p>Revertible HotSpares support for this adapter. Values:false(0),true(1)</p>|`SNMP agent`|revertibleHotSparesSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Reconstruction Rate on adapter $1|<p>Reconstruction rate on this Adapter.</p>|`SNMP agent`|reconstructionRate[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Reconstruction Rate Change Support for adapter $1|<p>Reconstruction rate change support for this adapter. Values:false(0),true(1)</p>|`SNMP agent`|reconRateSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Rebuilding Rate Change Support for adapter $1|<p>Rebuilding rate change support for this Adapter. Values:false(0),true(1)</p>|`SNMP agent`|rbldRateSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Adapter $1 Product Name|<p>Product name e.g. MegaRAID SAS-8E, MegaRAID SAS-4X, etc.</p>|`SNMP agent`|productName[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Prevent import of SAS Pi protected LD on adapter $1|<p>1=Prevent import of SAS PI protected logical disks , 0=Not Prevent import of SAS PI protected logical disks</p>|`SNMP agent`|preventPIImport[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Predictive Fail Poll Interval on adapter $1|<p>Number of seconds between precdictive fail polls on this adapter.</p>|`SNMP agent`|predFailPollInterval[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Peer Controller Status on adapter $1|<p>This field gives the Peer controller Status</p>|`SNMP agent`|peerControllerStatus[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Physical Disk Devices in adapter $1|<p>Physical disk devices present in this adapter.</p>|`SNMP agent`|pdDiskPresentCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Spin Down Time on adapter $1|<p>SpinDownTime in minutes</p>|`SNMP agent`|spinDownTime[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Physical Disk Devices with pre-fail state on adapter $1|<p>Number of disk devices in this adapter that are critical</p>|`SNMP agent`|pdDiskPredFailureCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Failed Physical Disk Devices on adapter $1|<p>Number of disk devices in this adapter that are failed</p>|`SNMP agent`|pdDiskFailedCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Patrol Read Rate on adapter $1|<p>Patrol Read Rate for this adapter.</p>|`SNMP agent`|patrolReadRate[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Patrol Read Rate Change Support for adapter $1|<p>Patrol read rate change support for this adapter. Values:false(0),true(1)</p>|`SNMP agent`|patrolRateSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum Logical Drives per Array in configuration on adapter $1|<p>Max LD's per Array in configuration</p>|`SNMP agent`|partitionsInDDF[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB NVRAM size on adapter $1|<p>NVRAM size in KB for this adapter.</p>|`SNMP agent`|nvramSize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Multipath Support for adapter $1|<p>Multipath is supported or not supported on this adapter.Values:not supported(0),supported(1)</p>|`SNMP agent`|multipathSupport[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Memory size on adapter $1|<p>Memory size in MB for this adapter.</p>|`SNMP agent`|memorySize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum no of Virtual Drives supported for adapter $1|<p>Maximum number of Virtual Drives supported for this adapter.</p>|`SNMP agent`|maxVDs[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum spans per Virtual Drive supported for adapter $1|<p>Maximum spans per Virtual Drive supported for this Adapter.</p>|`SNMP agent`|maxSpans[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB maximum Scatter Gather Element count allowed on adapter $1|<p>The maximum Scatter Gather Element count allowed on this adapter.</p>|`SNMP agent`|maxSGECount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum Data Transfer Size on adapter $1|<p>The maximum data transfer size in sectors, on this adapter.</p>|`SNMP agent`|maxRequestSize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum Logical Drives per Array on adapter $1|<p>Max Ld's per array in adapter</p>|`SNMP agent`|maxLdsPerArray[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Spanning Support for adapter $1|<p>Spanning support for this adapter. Values:false(0),true(1)</p>|`SNMP agent`|spanningAllowedSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Delay among spinup groups for this adapter $1|<p>Number of seconds to delay among spinup groups for this adapter.</p>|`SNMP agent`|spinupDelay[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum Configurable SSC Size on adapter $1|<p>This field give the information about maximum Size of SSC that can yet be configured,in GB</p>|`SNMP agent`|maximumCacheSize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB PI Support for adapter $1|<p>Displays the support PI. 1=LD SAS PI Type 0, 0=LD Not SAS PI Type 0</p>|`SNMP agent`|supportPIcontroller[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Virtual Devices in adapter $1|<p>Virtual devices present in this adapter.</p>|`SNMP agent`|vdPresentCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Offline Virtual Devices in adapter $1|<p>Number of virtual devices in this adapter that are offline</p>|`SNMP agent`|vdOfflineCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Degraded Virtual Devices in adapter $1|<p>Number of virtual devices in this adapter that are critical</p>|`SNMP agent`|vdDegradedCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Emergency Spare Drive possible drive on adapter $1|<p>This field give the information about Emergency Spare possible Drive types(Uncongiured Good/Global Hotspare)</p>|`SNMP agent`|useEmergencySpare[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Use Emergency Spares for SMARTer on adapter $1|<p>1 =Use Emergency spares for SMARTer ,0 =Not Use Emergency spares for SMARTer</p>|`SNMP agent`|useEmergencySparesforSMARTer[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Total Space used for MetaData on adapter $1|<p>Total Space used for MetaData</p>|`SNMP agent`|totalSpaceformetadata[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Currently Confugured Total Cache Size on adapter $1|<p>This field give the information about total Size of currently configured SSC,in GB</p>|`SNMP agent`|totalCacheSize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Topology Types info for adapter $1|<p>This field gives the Topology Type</p>|`SNMP agent`|topologyType[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Raid On Chip Temperature on adapter $1|<p>temperature of RAID On Chip in Celsius</p>|`SNMP agent`|temperatureROC[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Controller Temperature on adapter $1|<p>temperature of controller in Celsius</p>|`SNMP agent`|temperatureCtrl[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB SATA Drive Support on adapter $1|<p>SATA physical drive support. Values:notSupported(0), supported(1)</p>|`SNMP agent`|supportsSATA[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB SAS Drive Support on adapter $1|<p>SAS physical drive support. Values:notSupported(0), supported(1)</p>|`SNMP agent`|supportsSAS[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB PD shield state support on adapter $1|<p>1=Support PD shield state, 0=Not Support PD shield state</p>|`SNMP agent`|supportShieldState[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Online Firmware Update Support on adapter $1|<p>1=Online firmware update is supported, 0=Online firmware update is not supported</p>|`SNMP agent`|supportOnlineFWUpdate[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum number of drives to spin up at one time for adapter $1|<p>Maximum number of drives to spin up at one time for this adapter.</p>|`SNMP agent`|spinupDriveCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB FastPath WriteBack Support on Raptor LD for adapter $1|<p>1=Support Fast Path WB on Raptor Type Ld, 0=Does not support Fast Path WB on Raptor Type Ld</p>|`SNMP agent`|supportFastPathWB[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Read Policy Support on adapter $1|<p>Read policy support. Values: false(0), true(1)</p>|`SNMP agent`|supportedReadPolicy[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Minimum Stripe Size Supported on adapter $1|<p>Minimum stripe size supported. 0(512B),1(1K),2(2K),3(4K),4(8K),5(16K),6(32),7(64K),8(128K) ... 11(1MB) etc</p>|`SNMP agent`|supportedMinSize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum Stripe Size Supported on adapter $1|<p>Maximum stripe size supported. 0(512B),1(1K),2(2K),3(4K),4(8K),5(16K),6(32),7(64K),8(128K) ... 11(1MB) etc</p>|`SNMP agent`|supportedMaxSize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB IO Policy Support on adapter $1|<p>IO policy support. Values: false(0), true(1)</p>|`SNMP agent`|supportedIOPolicy[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Access Policy Support on adapter $1|<p>Access policy support. Values: false(0), true(1)</p>|`SNMP agent`|supportedAccessPolicy[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Configuration Auto Balance Support on adapter $1|<p>0=no configuration auto balance support, 1=configuration auto balance support is present</p>|`SNMP agent`|supportConfigAutoBalance[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Break Mirror Operation Support on adapter $1|<p>1=Support break mirror operation,0=Do not Support break mirror operation</p>|`SNMP agent`|supportBreakMirror[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Adapter $1 PCI Sub-Vendor ID|<p>PCI Sub-Vendor ID for this adapter.</p>|`SNMP agent`|subVendorID[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Adapter $1 PCI Sub-Device ID|<p>PCI Sub-Device ID for this adapter.</p>|`SNMP agent`|subDevID[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Copy back on SSD on SMART error on adapter $1|<p>Copyback to SSD on SMART error. Values Enabled(0),Disabled(1)</p>|`SNMP agent`|ssdSMARTerEnabled[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum Drives to Spin Up in Enclosure on adapter $1|<p>Maximum number of drives that can be spin up in an enclosure</p>|`SNMP agent`|spinupEnclDriveCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Delay Betwen Drive Spin Up in Enclosure on adapter $1|<p>Delay between drive spin up for drives within an enclosure</p>|`SNMP agent`|spinupEnclDelay[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum no of HA nodes supported by FW on adapter $1|<p>This field gives the HA nodes this FW supports</p>|`SNMP agent`|maximumControllerNodes[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum number of drives to spinup within 60 sec for direct attached drives for adapter $1|<p>Maximum number of drives to spinup within 60 sec for direct attached drives</p>|`SNMP agent`|maxDAPdCountSpinup60[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Abort Consistency Check on error Adapter $1|<p>Abort CC on detecting error is enabled or disabled on this adapter. Values:No(0),Yes(1),NA(2)</p>|`SNMP agent`|abortCConError[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Cache Flush Interval on adapter $1|<p>Cache flush interval in seconds for this adapter.</p>|`SNMP agent`|cacheFlushInterval[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Adapter $1 PCI Device ID|<p>PCI Device ID for this Adapter.</p>|`SNMP agent`|devID[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB adapter $1 default power saving policy|<p>power saving policy.values:controller default power saving policy=0, AUTO=1, MAX=2, Max with no cache=6, NONE=255</p>|`SNMP agent`|defaultLdPSPolicy[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Dedicated Hotspares Support for adapter $1|<p>Dedicated HotSpares support for this adapter. Values:false(0),true(1)</p>|`SNMP agent`|dedicatedHotSparesSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Controller SAS Addresses on adapter $1|<p>This field gives the controller SAS address</p>|`SNMP agent`|ctrlSasAddr[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB CopyBack state on adapter $1|<p>CopyBack is enabled or disabled on this adapter.Values:disabled(0),enabled(1)</p>|`SNMP agent`|copyBackState[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Compatibility info for adapter $1|<p>Compatibility Information. Format->(Firmware Forward compatibility flag:Firmware Backward compatibility flag:Firmware version flag:Application Forward compatibility flag:Application Backward compatibility flag:Application version flag)</p>|`SNMP agent`|compatibilityInfo[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Compatibility for adapter $1|<p>To inform compatibilities between Applications and FW. 0->incompatible;1->compatible</p>|`SNMP agent`|compatibilityFlag[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Drive Capacity Coercion Mode on adapter $1|<p>Drive capacity coercion mode. 0->None;1->128MB;2->1GB</p>|`SNMP agent`|coercionMode[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Cluster Support for adapter $1|<p>Cluster support for this adapter. Values:false(0),true(1)</p>|`SNMP agent`|clusterSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Cluster State on adapter $1|<p>Cluster is enabled or disabled on this adapter. Values:disabled(0),enabled(1)</p>|`SNMP agent`|clusterState[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Consistency Check Rate on adapter $1|<p>Consistency Check rate on this Adapter.</p>|`SNMP agent`|ccRate[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Consistensy Check Rate Change Support for adapter $1|<p>Consistency Check rate change support for this Adapter. Values:false(0),true(1)</p>|`SNMP agent`|ccRateSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Controller Cache pinned for missing or offline LDs on adapter $1|<p>1=controller cache is pinned for missing or offline LDs</p>|`SNMP agent`|cacheIsPinned[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB BIOS Not Detected Support on adapter $1|<p>bios Not Detected support for this Adapter. Values:false(0),true(1)</p>|`SNMP agent`|biosNotDetected[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Device Interface Port Count on Adapter $1|<p>Device Port Count on this adapter.</p>|`SNMP agent`|devInterfacePortCnt[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Background Initialization Rate on adapter $1|<p>Background initialization rate for this adapter.</p>|`SNMP agent`|bgiRate[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Background Initialization Rate Change Support for adapter $1|<p>Background initialization rate change support for this adapter. Values:false(0),true(1)</p>|`SNMP agent`|bgiRateSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Battery Backup Unit Support for adapter $1|<p>BBU support for this adapter. Values:false(0),true(1)</p>|`SNMP agent`|bbuSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Allow SAS/SATA SSD within LD on adapter $1|<p>allow SAS/SATA SSD mix within an LD. allow(1), not allow(0)</p>|`SNMP agent`|allowSSDMixInLD[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB SATA in Cluster Support on adapter $1|<p>SataInCluster support. Values:notSupported(0), supported(1)</p>|`SNMP agent`|allowSataInCluster[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Allow SSD/HDD Mix within LD on adapter $1|<p>allow SSD/HDD mix within an LD.allow(1), not allow(0)</p>|`SNMP agent`|allowMixSSDHDDInLD[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Mix in Virtual Drive Support on adapter $1|<p>MixInVIRTUALDRIVE support. Values:notSupported(0), supported(1)</p>|`SNMP agent`|allowMixInVD[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Mix in Enclosure Support on adapter $1|<p>Mix InEnclosure support. Values:notSupported(0), supported(1)</p>|`SNMP agent`|allowMixInEnclosure[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Mixer Redundancy Support for adapter $1|<p>Allow different Virtual Disk on the same array to have different redundancy levels. Values:false(0),true(1)</p>|`SNMP agent`|allowMixedRedundancyOnArraySupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Controller encryption support on adapter $1|<p>if it is set (1) supports controller encryption</p>|`SNMP agent`|allowCtrlEncryption[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Alarm State on adapter $1|<p>Alarm is enabled or disabled on this adapter. Values:disabled(0),enabled(1)</p>|`SNMP agent`|alarmState[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Alarm Control Support for adapter $1|<p>Alarm control support for this adapter. Values:false(0),true(1)</p>|`SNMP agent`|alarmControlSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Adapter $1 PCI Vendor ID|<p>PCI Vendor ID for this Adapter.</p>|`SNMP agent`|adapterVendorID[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Device Interface Port Addresses on Adapter $1|<p>Device Port address comma delimited</p>|`SNMP agent`|devInterfacePortAddr[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Multiple Device Interface Support Values for Adapter $1|<p>Multiple device interface support values separated by space.</p>|`SNMP agent`|devInterface[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum Parallel Commands Supported on adapter $1|<p>The maximum parallel commands supported on this adapter.</p>|`SNMP agent`|maxConcurrentCmds[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Host Interface Port Address for Adapter $1|<p>Port address comma delimited</p>|`SNMP agent`|hostInterfacePortAddr[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum no of arrays supported for adapter $1|<p>Maximum no of arrays supported for this adapter.</p>|`SNMP agent`|maxArrays[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum arms per Virtual Drive supported for adapter $1|<p>Maximum arms per Virtual Drive supported for this Adapter.</p>|`SNMP agent`|maxArms[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Firmware support for Maintenance Mode on adapter $1|<p>1=FW supports maintenance mode</p>|`SNMP agent`|maintenanceMode[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Lock Key Not BackedUp Support on adapter $1|<p>lock Key Not Backedup support for this Adapter. Values:false(0),true(1)</p>|`SNMP agent`|lockKeyNotBackedup[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Lock Key Failed Support on adapter $1|<p>lock Key Failed support for this Adapter. Values:false(0),true(1)</p>|`SNMP agent`|lockKeyFailed[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Type of lock key binding for adapter $1|<p>Type of lock key binding. lock key is not bound(0),lock key bound to FW secret key(1), lock key bound to user(2), lock key bound to a TPM(3)</p>|`SNMP agent`|lockKeyBinding[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Lock Key Assigned Support on adapter $1|<p>Lock key Assigned support for this Adapter. Values:false(0),true(1)</p>|`SNMP agent`|lockKeyAssigned[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Bad Block Management State on adapter $1|<p>1=LD bad block management is enabled, 0=LD bad block management is not enabled</p>|`SNMP agent`|ldbbm[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Interrupt throttle completion hold time on adapter $1|<p>Interrupt throttle completion hold time on this adapter.</p>|`SNMP agent`|intThrottleTimeUs[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Interrupt throttle active count on adapter $1|<p>Interrupt throttle active count on this adapter.</p>|`SNMP agent`|intThrottleCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Incompatibility details for adapter $1|<p>This field gives the Incompatibility Details</p>|`SNMP agent`|incompatibilityDetails[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Host Interface for Adapter $1|<p>Host interface information for this adapter. Values:N/A(0),PCIX(1),PCIE(2),iSCSI(3),SAS-3G(4)</p>|`SNMP agent`|hostInterface[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Host Interface Port Count for Adapter $1|<p>Port Count on this adapter.</p>|`SNMP agent`|hostInterfacePortCnt[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Foreign Import Support for adapter $1|<p>Support foreign config import on this adapter. Values:false(0),true(1)</p>|`SNMP agent`|foreignConfigImportSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Large IO Support on adapter $1|<p>0=Large IO is supported, 1=Large IO is unsupported</p>|`SNMP agent`|disableLargeIO[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Physical Drive force Rebuild Support on adapter $1|<p>Physical drive force Rebuild operation support. Values:notSupported(0), supported(1)</p>|`SNMP agent`|forceRebuild[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Physical Drive force Online Support on adapter $1|<p>Physical drive force Online operation support. Values:notSupported(0), supported(1)</p>|`SNMP agent`|forceOnline[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Physical Drive force Offline Support on adapter $1|<p>Physical drive force Offline operation support. Values:notSupported(0), supported(1)</p>|`SNMP agent`|forceOffline[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Flash size on adapter $1|<p>Flash size in MB for this adapter.</p>|`SNMP agent`|flashSize[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Firmware Version for adapter $1|<p>Firmware version Format->(Firmware Package Version:Version:Date:Time)</p>|`SNMP agent`|firmwareVersion[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Expander Firmware Version for adapter $1|<p>Expander firmware version - Not Available if expander is not present on the controller</p>|`SNMP agent`|expanderFirmwareVersion[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Spin Down Unconfigured Drives on adapter $1|<p>Spin Down Unconfigured Drives(1), Do Not Spin Down Unconfigured Drives(0)</p>|`SNMP agent`|enableSpinDownUnconfigured[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Enable SAS Pi on adapter $1|<p>1 =Enable SAS PI for controller , 0 =Disable SAS PI for controller</p>|`SNMP agent`|enablePI[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Driver Version for adapter $1|<p>Driver version Format->(Driver Name:Version)</p>|`SNMP agent`|driverVersion[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Domain ID of adapter $1|<p>This field gives the Domain ID</p>|`SNMP agent`|domainId[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Spin Down Hotspares on adapter $1|<p>Spin Down Hotspares(0), Do Not Spin Down Hotspares(1)</p>|`SNMP agent`|disableSpinDownHotSpare[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Logical Drive Power Saving disable time after 12:00AM on adapter $1|<p>LD power savings shall be disabled at xx minutes from 12:00am.</p>|`SNMP agent`|disableLdPSTime[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Interval for disabling power saving after power saving time on adapter $1|<p>LD power savings are disabled for yy hours beginning at disableLdPSTime.</p>|`SNMP agent`|disableLdPSInterval[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB SSC Support Write Caching IO's on adapter $1|<p>1=SSC support write caching IOs, 0=SSC not support write caching IOs</p>|`SNMP agent`|writeCacheCapable[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Device $1 Adapter Port(s) to which it is connected|<p>Adapter port(s) to which the device is connected.</p>|`SNMP agent`|connectedAdapterPort[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Maximum Supported Speed for Device $1|<p>Maximum supported speed. Values:speed-unknown(0),speed-1p5G(1),speed-3G(2),speed-6G(3)</p>|`SNMP agent`|deviceSpeed[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Device $1 Ready for Removal|<p>If true, drive is ready for removal. Values:false(0),true(1)</p>|`SNMP agent`|disabledForRemoval[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Negotiated Link Speed for Device $1|<p>Negotiated link speed. Values:speed-unknown(0),speed-1p5G(1),speed-3G(2),speed-6G(3)</p>|`SNMP agent`|linkSpeed[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Media Error Count of Device $1|<p>Error count of the device</p>|`SNMP agent`|mediaErrCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Device $1 Certtified by OEM|<p>Is the drive certified by the OEM (OEM-specific checks). Values:notCertified(1), Certified(0)</p>|`SNMP agent`|oemCertified[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Device $1 Supported by OEM|<p>Is the drive supported by the OEM (OEM-specific checks). Values:notSupported(1), supported(0)</p>|`SNMP agent`|oemSupported[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Operation progress for Device $1|<p>Operation progress in %. e.g. Rebuild progress is 10%</p>|`SNMP agent`|operationProgress[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Other Error Count of Device $1|<p>Error count of the device</p>|`SNMP agent`|otherErrCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Firmware Interpretation of state of Device $1|<p>Firmware's interpretation of drive state. Values:unconfigured-good(0),unconfigured-bad(1),hot-spare(2),offline(16),failed(17),rebuild(20),online(24),copyback(32),system(64),UNCONFIGURED-SHIELDED(128),HOTSPARE-SHIELDED(130),CONFIGURED-SHIELDED(144)</p>|`SNMP agent`|pdState[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Device $1 Temperature|<p>Physical Drive temperature in Celsius</p>|`SNMP agent`|pdTemperature[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Predictive Fail Count of Device $1|<p>Predictive fail count of the device</p>|`SNMP agent`|predFailCount[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|MegaRAID SAS MIB Type of Device $1|<p>Type of this Device. Values:disk(0),tape(1),printer(2),processor(3),cdrom(5),scanner(6),optical(7),enclosure(13),dvd(10),unknown(31)</p>|`SNMP agent`|scsiDevType[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Critical temperature on Raid on Chip for adapter {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/temperatureROC[{#SNMPVALUE}])>115</p><p>**Recovery expression**: last(/SNMP MegaRAID SAS/temperatureROC[{#SNMPVALUE}])<105</p>|high|
|Degraded Virtual devices on MegaRAID adapter {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/vdDegradedCount[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
|Disks with pre-fail state detected on MegaRAID adapter {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdDiskPredFailureCount[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
|Failed disks detected on MegaRAID adapter {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdDiskFailedCount[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
|High temperature on Raid on Chip for adapter {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/temperatureROC[{#SNMPVALUE}])>90</p><p>**Recovery expression**: last(/SNMP MegaRAID SAS/temperatureROC[{#SNMPVALUE}])<80</p>|average|
|Offline Virtual devices on MegaRAID adapter {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/vdOfflineCount[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
|Failed state for MegaRAID Drive {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdState[{#SNMPVALUE}])=17</p><p>**Recovery expression**: </p>|high|
|MegaRAID Device {#SNMPVALUE} not certified by OEM|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/oemCertified[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|MegaRAID Device {#SNMPVALUE} Temperature too high|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdTemperature[{#SNMPVALUE}])>50</p><p>**Recovery expression**: last(/SNMP MegaRAID SAS/pdTemperature[{#SNMPVALUE}])<47</p>|high|
|Rebuilding state for MegaRAID Drive {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdState[{#SNMPVALUE}])=20</p><p>**Recovery expression**: </p>|warning|
|Unconfigured Bad state for MegaRAID Drive {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdState[{#SNMPVALUE}])=1</p><p>**Recovery expression**: </p>|high|
|Unknown Negotiated Link Speed for MegaRAID Drive {#SNMPVALUE}|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/linkSpeed[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|high|
|Critical temperature on Raid on Chip for adapter {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/temperatureROC[{#SNMPVALUE}])>115</p><p>**Recovery expression**: last(/SNMP MegaRAID SAS/temperatureROC[{#SNMPVALUE}])<105</p>|high|
|Degraded Virtual devices on MegaRAID adapter {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/vdDegradedCount[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
|Disks with pre-fail state detected on MegaRAID adapter {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdDiskPredFailureCount[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
|Failed disks detected on MegaRAID adapter {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdDiskFailedCount[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
|High temperature on Raid on Chip for adapter {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/temperatureROC[{#SNMPVALUE}])>90</p><p>**Recovery expression**: last(/SNMP MegaRAID SAS/temperatureROC[{#SNMPVALUE}])<80</p>|average|
|Offline Virtual devices on MegaRAID adapter {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/vdOfflineCount[{#SNMPVALUE}])>0</p><p>**Recovery expression**: </p>|high|
|Failed state for MegaRAID Drive {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdState[{#SNMPVALUE}])=17</p><p>**Recovery expression**: </p>|high|
|MegaRAID Device {#SNMPVALUE} not certified by OEM (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/oemCertified[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|MegaRAID Device {#SNMPVALUE} Temperature too high (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdTemperature[{#SNMPVALUE}])>50</p><p>**Recovery expression**: last(/SNMP MegaRAID SAS/pdTemperature[{#SNMPVALUE}])<47</p>|high|
|Rebuilding state for MegaRAID Drive {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdState[{#SNMPVALUE}])=20</p><p>**Recovery expression**: </p>|warning|
|Unconfigured Bad state for MegaRAID Drive {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/pdState[{#SNMPVALUE}])=1</p><p>**Recovery expression**: </p>|high|
|Unknown Negotiated Link Speed for MegaRAID Drive {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP MegaRAID SAS/linkSpeed[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|high|
