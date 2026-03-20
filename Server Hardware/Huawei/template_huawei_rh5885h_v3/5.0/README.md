# Huawei Server iBMC

## Overview

This template for **RH5885H V3**


Protocol SNMP v2


Items 177 with low discovery


 


**Triggers**:


 


System health status critical


System health status status major


System health status status minor


 


CPU status critical


CPU status major


CPU status minor


 


Fan status critical


Fan status major


Fan status minor


 


Hard disk status critical


Hard disk status major


Hard disk status minor


 


Memory status critical


Memory status major


Memory status minor


 


Power supply status critical


Power supply status major


Power supply status minor


 


Temperature is too high


 


Template on my [GitHub](https://github.com/pgalonza/Notes/blob/master/administration/zabbix/templates/RH5885H%20V3.xml) repository


MIBs on my [GitHub](https://github.com/pgalonza/Notes/tree/master/administration/huawei/RH5885H%20V3/snmp) repository



## Author

P.V. Galonza

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`Server_public!1`|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Syslog|<p>Information about syslog receiver index.</p>|`SNMP agent`|huawei-server.syslogReceiverIndex<p>Update: 1h</p>|
|Hard disk|<p>Information about hard disk index.</p>|`SNMP agent`|huawei-server.hardDiskIndex<p>Update: 1h</p>|
|Eth|<p>Information about ethernet port number.</p>|`SNMP agent`|huawei-server.ethNum<p>Update: 1h</p>|
|Power supply|<p>Power supply index.</p>|`SNMP agent`|huawei-server.powerSupplyIndex<p>Update: 1h</p>|
|CPU|<p>Information about CPU index.</p>|`SNMP agent`|huawei-server.cpuIndex<p>Update: 1h</p>|
|PCI|<p>Information about PCIe device index.</p>|`SNMP agent`|huawei-server.pCIeDeviceIndex<p>Update: 1h</p>|
|Memory|<p>Information about memory DIMM index.</p>|`SNMP agent`|huawei-server.memoryDimmIndex<p>Update: 1h</p>|
|Raid controller|<p>Information about RAID controller index.</p>|`SNMP agent`|huawei-server.raidControllerIndex<p>Update: 1h</p>|
|Temperature|<p>Information about temperature index.</p>|`SNMP agent`|huawei-server.temperatureIndex<p>Update: 1h</p>|
|Fan|<p>Fan index.</p>|`SNMP agent`|huawei-server.fanIndex<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Devices slot ID|<p>The device slot ID of a server exists, the value ranges from 1 to 80. Otherwise, the value is 0.</p>|`SNMP agent`|huawei-server.deviceslotID<p>Update: 6h</p>|
|Syslog enable|<p>The enable state of syslog. Default value is disable(1).</p>|`SNMP agent`|huawei-server.syslogEnable<p>Update: 10m</p>|
|Configuration error info|<p>Query the error information of exporting/importing all configuration of BMC , BIOS and RAID Controller. Query the error information of uploading configuration file to remote host or download configuration file from remote host. If error happened, configerrorinfo value shows the error information. If error don't happened, configerrorinfo value is null.</p>|`SNMP agent`|huawei-server.configerrorinfo<p>Update: 10m</p>|
|System disk partition usage threshold|<p>Percent of hard disk partition usage threshold. This value is in [0,100].</p>|`SNMP agent`|huawei-server.systemDiskPartitionUsageThre<p>Update: 10m</p>|
|Device owner ID|<p>The device owner ID, maxlength is 64 characters</p>|`SNMP agent`|huawei-server.deviceOwnerID<p>Update: 6h</p>|
|System power state|<p>System Power Status Get. 1 - Power Off 2 - Power On System Power Status Set. 1 - Normal Power Off 2 - Power On 3 - Forced System Reset 4 - Forced Power Cycle 5 - Forced Power Off The set actions are a process which will take effect in a while. When system in poweroff state, Power Off/Reset/PowerOffThenOn commonds are not supported.</p>|`SNMP agent`|huawei-server.systemPowerState<p>Update: 5m</p>|
|Syslog protocol type|<p>The syslog protocol type. Default value is TCP. udp:When receiving messages using the UDP protocol. tcp:When receiving messages using the TCP protocol. tls:When receiving messages using the TCP protocol</p>|`SNMP agent`|huawei-server.syslogProtocolType<p>Update: 6h</p>|
|Safe poweroff time|<p>The system safe poweroff time, the value 0 indicates non-timeout.</p>|`SNMP agent`|huawei-server.safepowerofftime<p>Update: 1h</p>|
|Fan entire status|<p>Information about all fan health status.</p>|`SNMP agent`|huawei-server.fanEntireStatus<p>Update: 5m</p>|
|System boot sequence|<p>Decide the system's first boot device. 1 - No override 2 - Force PXE 3 - Force boot from default Hard-drive 4 - Force boot from default CD/DVD 5 - Force boot from Floppy/primary removable media 6 - boot flags valid. The bit should be set to indicate that valid flag data is present. This bit may be automatically cleared based on the boot flag valid bit clearing parameter, above.(This option is read-only.) 7 - Force boot into BIOS SETUP The default value is 6 (unspecified)</p>|`SNMP agent`|huawei-server.systemBootsequence<p>Update: 1h</p>|
|Device location info|<p>The deviceLocationInfo between 0 and 64 characters. Default value is server room.</p>|`SNMP agent`|huawei-server.deviceLocationInfo<p>Update: 6h</p>|
|Local LVM state|<p>Local KVM display state. disable 1, enable 2. Default value is enable(2).</p>|`SNMP agent`|huawei-server.localKVMState<p>Update: 5m</p>|
|Syslog Identity|<p>Choose the server Identity when sending syslog.</p>|`SNMP agent`|huawei-server.syslogIdentity<p>Update: 10m</p>|
|Presense|<p>Presence of security module.</p>|`SNMP agent`|huawei-server.presence<p>Update: 1h</p>|
|PCle device entire status|<p>Information about all standard PCIe device health status.</p>|`SNMP agent`|huawei-server.pCIeDeviceEntireStatus<p>Update: 5m</p>|
|Two factor authentication|<p>The enable state of two-factor authentication. disable 1, enable 2. Default value is disable(1).</p>|`SNMP agent`|huawei-server.twoFactorAuthenticationEnable<p>Update: 15m</p>|
|Two factor authentication revocation check|<p>The enable state of certificate revocation check. disable 1, enable 2. Default value is disable(1).</p>|`SNMP agent`|huawei-server.twoFactorAuthenticationRevocationCheck<p>Update: 15m</p>|
|ETH MAC address|<p>Information about MAC address.</p>|`SNMP agent`|huawei-server.ethMACAddress<p>Update: 6h</p>|
|System memory usage threshold|<p>Percent of memory usage threshold. This value is in [0,100].</p>|`SNMP agent`|huawei-server.systemMemUsageThre<p>Update: 15m</p>|
|CSR status|<p>The status of generating CSR. CSR generation has not started or has successfully completed(1) A CSR is being generated (2) A CSR fails to be generated (3).</p>|`SNMP agent`|huawei-server.csrStatus<p>Update: 5m</p>|
|System CPU usage threshold|<p>Percent of CPU usage threshold. This value is in [0,100].</p>|`SNMP agent`|huawei-server.systemCpuUsageThre<p>Update: 10m</p>|
|Power capping enable|<p>Power capping status. disable 1, enable 2. Default value is disable(1).</p>|`SNMP agent`|huawei-server.powerCappingEnable<p>Update: 10m</p>|
|Hard disk entire status|<p>Information about all hard disk health status.</p>|`SNMP agent`|huawei-server.hardDiskEntireStatus<p>Update: 5m</p>|
|Power on control|<p>The powerOnControl format: IP,PORT,ENABLE(eg 192.168.1.1,6999,1), maxlength is 255 characters.</p>|`SNMP agent`|huawei-server.powerOnControl<p>Update: 1h</p>|
|System GUID|<p>The GUID is hex string such as ********-****-****-****-************.</p>|`SNMP agent`|huawei-server.systemGuid<p>Update: 6h</p>|
|System health|<p>systemHealth information about system present state of health. This value will be one of the following: (1-OK, 2-Minor, 3-Major, 4-Critical)</p>|`SNMP agent`|huawei-server.systemHealth<p>Update: 5m</p>|
|Setted power supply entire mode|<p>Setted power supply entire mode. Power supply entire mode get: 1:loadBalance(1) 2:activeBackup(2) 3:unsupport(3) Power supply entire mode set: 1:loadBalance(1) 2:activeBackup(2)</p>|`SNMP agent`|huawei-server.settedPowerSupplyEntireMode<p>Update: 5m</p>|
|System disk portition usage  threshold|<p>Percent of hard disk partition usage threshold. This value is in [0,100].</p>|`SNMP agent`|huawei-server.hudiskPartitionUsage<p>Update: 10m</p>|
|Actual power supply entire mode|<p>Actual power supply entire mode.</p>|`SNMP agent`|huawei-server.actualPowerSupplyEntireMode<p>Update: 5m</p>|
|Power supply entire status|<p>Information about all power supply health status.</p>|`SNMP agent`|huawei-server.powerSupplyEntireStatus<p>Update: 5m</p>|
|System memory usage|<p>Percent of memory usage. The value defined as: -1: invalid current memory usage. [0,100]: represents the current memory usage.</p>|`SNMP agent`|huawei-server.systemMemUsage<p>Update: 5m</p>|
|Power on polici|<p>1 - Stay Off 2 - Restore Previous State 3 - Turn On Default value is turnon(3).</p>|`SNMP agent`|huawei-server.powerOnPolicy<p>Update: 5m</p>|
|System CPU usage|<p>Percent of CPU usage. The value defined as: -1: invalid current CPU usage. [0,100]: represents the current CPU usage.</p>|`SNMP agent`|huawei-server.systemCpuUsage<p>Update: 5m</p>|
|Average power|<p>System average power, unit is W.</p>|`SNMP agent`|huawei-server.averagePower<p>Update: 5m</p>|
|CPU entire status|<p>Information about all cpu health status.</p>|`SNMP agent`|huawei-server.cpuEntireStatus<p>Update: 5m</p>|
|Device name|<p>The device name value between 1 to 63 characters.</p>|`SNMP agent`|huawei-server.deviceName<p>Update: 6h</p>|
|Temperature entire status|<p>Information about all temperature sensor health status.</p>|`SNMP agent`|huawei-server.temperatureEntireStatus<p>Update: 5m</p>|
|Host name|<p>The host name between 1 to 64 characters. Supported characters: 0-9 a-z A-Z - ('-' is not allowed to be the first/last character). Default value is huawei.</p>|`SNMP agent`|huawei-server.hostName<p>Update: 6h</p>|
|Syslog severity|<p>The level of syslog send. Default level is ok. ok:send all level message. minor:send minor and above level message. major:send major and above level message. critical:send critical level message. none:send nothing.</p>|`SNMP agent`|huawei-server.syslogSeverity<p>Update: 5m</p>|
|Present system power|<p>Display the present system power.</p>|`SNMP agent`|huawei-server.presentSystemPower<p>Update: 5m</p>|
|Peak power|<p>System peak power, unit is W.</p>|`SNMP agent`|huawei-server.peakPower<p>Update: 5m</p>|
|Memory entire status|<p>Information about all memory health status.</p>|`SNMP agent`|huawei-server.memoryEntireStatus<p>Update: 5m</p>|
|Device serial number|<p>The device serial number value between 1 to 63 characters.</p>|`SNMP agent`|huawei-server.deviceSerialNo<p>Update: 6h</p>|
|Power consumption|<p>Power consume from power statistic start time, unit is kWh.</p>|`SNMP agent`|huawei-server.powerConsumption<p>Update: 5m</p>|
|{#SNMPVALUE} syslog receiver IP addrsss|<p>Syslog Receiver IP addrsss. Default value is empty.</p>|`SNMP agent`|huawei-server[syslogReceiverAddress.{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|{#SNMPVALUE} syslog receiver enable|<p>Syslog Receiver state enable 2, disable 1.</p>|`SNMP agent`|huawei-server[syslogReceiverEnable.{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|{#SNMPVALUE} syslog receiver port|<p>Syslog port.</p>|`SNMP agent`|huawei-server[syslogReceiverPort.{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|{#SNMPVALUE} syslog receiver test|<p>Test the syslog. When set, the value is only 1</p>|`SNMP agent`|huawei-server[syslogReceiverTest.{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|{#SNMPVALUE} syslog send log type|<p>The log type of syslog send. Support set/get any combination of the 3 log type(OperationLogs,SecurityLogs,EventLogs), use comma to separate them. none/all is also supported,but never use it with the 3 log types together. e.g. To set OperationLogs + SecurityLogs log type message, just set: OperationLogs,SecurityLogs To set EventLogs message, just set: EventLogs To set none level message, just set: none To set all level message, just set: all</p>|`SNMP agent`|huawei-server[syslogSendLogType.{#SNMPVALUE}]<p>Update: 10m</p><p>LLD</p>|
|{#DEVICENAME} capable speed in Mbps|<p>Hard disk maximum supported speed</p>|`SNMP agent`|huawei-server[hardDiskCapableSpeedInMbps.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} other error count|<p>Hard disk other error count.</p>|`SNMP agent`|huawei-server[hardDiskOtherErrCount.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} status|<p>Information about hard disk health.</p>|`SNMP agent`|huawei-server[hardDiskStatus.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} serial number|<p>Hard disk serial number.</p>|`SNMP agent`|huawei-server[hardDiskSerialNumber.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} SAS address 2|<p>Hard disk SAS address 2.</p>|`SNMP agent`|huawei-server[hardDiskSASAddr2.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} SAS address 1|<p>Hard disk SAS address 1.</p>|`SNMP agent`|huawei-server[hardDiskSASAddr1.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} remnant wearout|<p>"Hard disk remnant wearout (100% - 0). Only valid for SSD.</p>|`SNMP agent`|huawei-server[hardDiskRemnantWearout.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} rebuild progress|<p>Hard disk rebuild progress (0 - 100%).</p>|`SNMP agent`|huawei-server[hardDiskRebuildProgress.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} presence|<p>Information about hard disk presence.</p>|`SNMP agent`|huawei-server[hardDiskPresence.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} prefail state|<p>Hard disk prefail state.</p>|`SNMP agent`|huawei-server[hardDiskPrefailState.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} prefail error count|<p>Hard disk prefail error count.</p>|`SNMP agent`|huawei-server[hardDiskPrefailErrCount.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} power state|<p>Hard disk power state.</p>|`SNMP agent`|huawei-server[hardDiskPowerState.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} patrol read status.|<p>Hard disk patrol read status.</p>|`SNMP agent`|huawei-server[hardDiskPatrolReadStatus.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} negotiated speed in Mbps|<p>Hard disk negotiated speed.</p>|`SNMP agent`|huawei-server[hardDiskNegotiatedSpeedInMbps.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} capacity in GB|<p>Hard disk capacity (GB).</p>|`SNMP agent`|huawei-server[hardDiskCapacityInGB.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} model number|<p>Hard disk model number.</p>|`SNMP agent`|huawei-server[hardDiskModelNumber.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} media type|<p>Hard disk media type.</p>|`SNMP agent`|huawei-server[hardDiskMediaType.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} manufacturer|<p>Hard disk manufacturer.</p>|`SNMP agent`|huawei-server[hardDiskManufacturer.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} disk location state|<p>Hard disk location state. 1: Unknown (read only) 2: Off 3: On</p>|`SNMP agent`|huawei-server[hardDiskLocationState.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} location|<p>Hard disk physical location.</p>|`SNMP agent`|huawei-server[hardDiskLocation.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} interface type|<p>Hard disk interface type. SAS, SATA...etc. 1: Undefined 2: Parallel-SCSI 3: SAS 4: SATA 5: Fiber Channel 6: SATA/SAS 7: PCIe 255: Unknown</p>|`SNMP agent`|huawei-server[hardDiskInterfaceType.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} hot spare state|<p>Hard disk hot spare state. 1: None Cancel the global/dedicated hot spare setting, can be set when hardDiskHotSpareState is Global/Dedicated. 2: Global Can be set only when hardDiskFwState = Unconfigured Good. 3: Dedicated Can be set only when hardDiskFwState = Unconfigured Good. Setting value described as following: Byte1 - Indicating the hard disk used as dedicated hot spare, fixed to 3. Byte2 - The logical drive index which the hard disk spared for, started from 1. For example: Set this hard disk as dedicated hot spare for logical drive 2, the setting value should be 0x0203 = 2 * 256 + 3 = 515. 4: Commissioned (read only) 5: Emergency (read only) 255: Unknown (read only)</p>|`SNMP agent`|huawei-server[hardDiskHotSpareState.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} firmware version|<p>Hard disk firmware version.</p>|`SNMP agent`|huawei-server[hardDiskFwVersion.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} firmware state|<p>Hard disk firmware state. 1: Unconfigured Good Can be set from Unconfigured Bad state, or JBOD state when raidControllerJBODEnable = Enabled. 2: Unconfigured Bad (read only) 3: Hot Spared (read only) 4: Offline Can be set from Online state. 5: Failed (read only) 6: Rebuild (read only) 7: Online Can be set from Offline state. 8: Copyback (read only) 9: JBOD Can be set from Unconfigured Good state when raidControllerJBODEnable = Enabled. 10: Unconfigured Shielded (read only) 11: Hot Spare Shielded (read only) 12: Configured Shielded (read only) 13: Foreign (read only) 14: Active (read only) 15: Stand-by (read only) 16: Sleep (read only) 17: DST executing in background (read only) 18: SMART Off-line Data Collection executing in background (read only) 19: SCT command executing in background (read only) 255: Unknown (read only)</p>|`SNMP agent`|huawei-server[hardDiskFwState.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} function|<p>Hard disk logic function.</p>|`SNMP agent`|huawei-server[hardDiskFunction.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} capacity in MB|<p>Hard disk capacity (MB).</p>|`SNMP agent`|huawei-server[hardDiskCapacityInMB.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} temperature|<p>Hard disk temperature (in Celsius).</p>|`SNMP agent`|huawei-server[hardDiskTemperature.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|Eth {#SNMPVALUE} default gateway|<p>Information about default gateway.</p>|`SNMP agent`|huawei-server[ethDefaultGateway.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} enable|<p>Information about eth enabled.</p>|`SNMP agent`|huawei-server[ethEnable.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} host port|<p>Information about share ethernet binded host port.</p>|`SNMP agent`|huawei-server[ethHostPort.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} info|<p>Set IPaddr,Netmask,Gateway. eg.: 192.168.2.100,255.255.255.0,192.168.2.1</p>|`SNMP agent`|huawei-server[ethInfo.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} IP address|<p>Information about ethernet IP address.</p>|`SNMP agent`|huawei-server[ethIPAddress.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} IP source|<p>Information about IP source.</p>|`SNMP agent`|huawei-server[ethIPSource.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} IPv4 enable|<p>nformation about eth IPv4 enabled.</p>|`SNMP agent`|huawei-server[ethIPv4Enable.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} MAC address|<p>Information about MAC address.</p>|`SNMP agent`|huawei-server[ethMACAddress.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} mode|<p>Information about ethernet Mode.</p>|`SNMP agent`|huawei-server[ethMode.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} netmask|<p>Information about netmask.</p>|`SNMP agent`|huawei-server[ethNetmask.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} type|<p>Information about ethernet port type.</p>|`SNMP agent`|huawei-server[ethType.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|Eth {#SNMPVALUE} vlan ID|<p>Disable or enable VLAN and set ID. Set 'off' to disabled VLAN. Set [1,4094] to enable VLAN and set ID.</p>|`SNMP agent`|huawei-server[vlanID.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|{#DEVICENAME} function|<p>Power supply logic function.</p>|`SNMP agent`|huawei-server[powerSupplyFunction.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} input mode|<p>Information about power input.</p>|`SNMP agent`|huawei-server[powerSupplyInputMode.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} input power|<p>Information about input power. The unit is watt.</p>|`SNMP agent`|huawei-server[powerSupplyInputPower.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} location|<p>Power supply physical location.</p>|`SNMP agent`|huawei-server[powerSupplyLocation.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} manufacture|<p>Information about power manufacture.</p>|`SNMP agent`|huawei-server[powerSupplymanufacture.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} model|<p>Information about power Model.</p>|`SNMP agent`|huawei-server[powerSupplyModel.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} power rating|<p>Information about power rating.</p>|`SNMP agent`|huawei-server[powerSupplyPowerRating.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} presence|<p>Information about power presence status.</p>|`SNMP agent`|huawei-server[powerSupplyPresence.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} protocol|<p>Information about power protocol.</p>|`SNMP agent`|huawei-server[powerSupplyProtocol.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} SN|<p>Power supply SN.</p>|`SNMP agent`|huawei-server[powerSupplySN.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} status|<p>Information about power status.</p>|`SNMP agent`|huawei-server[powerSupplyStatus.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} version|<p>Information about power version.</p>|`SNMP agent`|huawei-server[powerSupplyVersion.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} work mode|<p>power supply actual work mode.</p>|`SNMP agent`|huawei-server[powerSupplyWorkMode.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#CPUNAME} availability|<p>Information about CPU availability.</p>|`SNMP agent`|huawei-server[cpuAvailability.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#CPUNAME} clock rate|<p>Information about CPU clock rate.</p>|`SNMP agent`|huawei-server[cpuClockRate.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} core count|<p>CPU CoreCount</p>|`SNMP agent`|huawei-server[cpuCoreCount.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} family|<p>Information about CPU family.</p>|`SNMP agent`|huawei-server[cpuFamily.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} function|<p>CPU logic function.</p>|`SNMP agent`|huawei-server[cpuFunction.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} L1 cache|<p>CPU Cache.</p>|`SNMP agent`|huawei-server[cpuL1Cache.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} L2 cache|<p>CPU Cache.</p>|`SNMP agent`|huawei-server[cpuL2Cache.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} L3 cache|<p>CPU Cache.</p>|`SNMP agent`|huawei-server[cpuL3Cache.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} location|<p>CPU physical location.</p>|`SNMP agent`|huawei-server[cpuLocation.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} manufacturer|<p>Information about CPU manufacturer.</p>|`SNMP agent`|huawei-server[cpuManufacturer.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} memory technology|<p>CPU memory technology.</p>|`SNMP agent`|huawei-server[cpuMemoryTechnology.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} ID|<p>CPU ProcessorID.</p>|`SNMP agent`|huawei-server[cpuProcessorID.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} status|<p>Information about CPU health status.</p>|`SNMP agent`|huawei-server[cpuStatus.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#CPUNAME} thread count|<p>CPU ThreadCount.</p>|`SNMP agent`|huawei-server[cpuThreadCount.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#CPUNAME} type|<p>Information about CPU type.</p>|`SNMP agent`|huawei-server[cpuType.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} availability|<p>Information about PCIe device availability.</p>|`SNMP agent`|huawei-server[pCIeAvailability.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} description|<p>PCIe device description.</p>|`SNMP agent`|huawei-server[pCIeDeviceDescription.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|{#DEVICENAME} DID|<p>PCIe device DID.</p>|`SNMP agent`|huawei-server[pCIeDeviceDID.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|{#DEVICENAME} function|<p>PCIe logic function.</p>|`SNMP agent`|huawei-server[pCIeDeviceFunction.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|{#DEVICENAME} location|<p>PCIe physical location.</p>|`SNMP agent`|huawei-server[pCIeDeviceLocation.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|{#DEVICENAME} manufacturer|<p>PCIe device manufacturer.</p>|`SNMP agent`|huawei-server[pCIeDeviceManufacturer.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|{#DEVICENAME} presence|<p>Information about PCIe device presence.</p>|`SNMP agent`|huawei-server[pCIeDevicePresence.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} status|<p>Information about PCIe device health.</p>|`SNMP agent`|huawei-server[pCIeDeviceStatus.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} VID|<p>PCIe device VID.</p>|`SNMP agent`|huawei-server[pCIeDeviceVID.{#SNMPVALUE}]<p>Update: 1h</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} availability|<p>Information about memory availability.</p>|`SNMP agent`|huawei-server[memoryAvailability.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} bit width|<p>Information about memory bit width.</p>|`SNMP agent`|huawei-server[memoryBitWidth.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} clock rate|<p>Information about memory clock rate.</p>|`SNMP agent`|huawei-server[memoryClockRate.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} function|<p>Memory logic function.</p>|`SNMP agent`|huawei-server[memoryFunction.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} location|<p>Memory physical location.</p>|`SNMP agent`|huawei-server[memoryLocation.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} logic|<p>Information about memory logic channel.</p>|`SNMP agent`|huawei-server[memoryLogic.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} manufacturer|<p>Information about memory manufacturer.</p>|`SNMP agent`|huawei-server[memoryManufacturer.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} minimum voltage|<p>Information about memory minimum voltage.</p>|`SNMP agent`|huawei-server[memoryMinimumVoltage.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} rank|<p>Information about memory rank.</p>|`SNMP agent`|huawei-server[memoryRank.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} size|<p>Information about memory capacity.</p>|`SNMP agent`|huawei-server[memorySize.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} SN|<p>Information about memory SN.</p>|`SNMP agent`|huawei-server[memorySN.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} status|<p>Information about memory health status.</p>|`SNMP agent`|huawei-server[memoryStatus.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} technology|<p>Information about memory technology.</p>|`SNMP agent`|huawei-server[memoryTechnology.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} {#SNMPVALUE} type|<p>Information about memory type.</p>|`SNMP agent`|huawei-server[memoryType.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} add logical drive|<p>Add logical drive on array on this RAID controller. The arguments are seperated by semicolons; The arguments format is <option1>=<argument>;<option2>=<argument>;...;<optionN>=<argument>; example: array=1;name=example;size=100.375g;ss=512k;rp=ra;wp=wb;iop=cio;ap=rw;dcp=enabled;init=quick; Options and arguments: array=<Array ID> The array on which the logical drive will be added. It is mandatory. name=<Logical drive name> The name of logical drive and maximum is 15 printable ASCII characters except ';'. It is optional. size=<Logical drive size> The size of logical drive and unit can be 'm'(megabytes),'g'(gigabytes), or 't'(terabytes). It is optional. ss=<Logical drive strip size> The strip size of logical drive. The valid values are 64k,128k,256k,512k,1M. It is optional. rp=<Read Policy> The read policy of logical drive. It is optional. ra: Read Ahead nra: No Read Ahead wp=<Write Policy> The write policy of logical drive. It is optional. wt: Write Through wbwithbbu: Write Back with BBU wb: Write Back iop=<IO Policy> The IO policy of logical drive. It is optional. cio: Cached IO dio: Direct IO ap=<Access Policy> The access policy of logical drive. It is optional. rw: Read Write ro: Read only blocked: Blocked dcp=<Disk Cache Policy> The disk cache policy of logical drive. It is optional. enabled: Enable disk cache disabled: Disable disk cache default: Unchanged(Disk's default) init=<Init Type> The initialization type of logical drive. It is optional. no: No init quick: Quick init full: Full init Note: Character ';' is not valid for logical drive name string because it is used as separator.</p>|`SNMP agent`|huawei-server[raidControllerAddLD.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} JBOD|<p>Information about the JBOD state of RAID controller. 1: Unknown (read only) 2: Disabled 3: Enabled</p>|`SNMP agent`|huawei-server[raidControllerJBODEnable.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} OOB management|<p>Information about RAID controller if support OOB management. 1: No 2: Yes</p>|`SNMP agent`|huawei-server[raidControllerSupportOOBManagement.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} smart copy back|<p>Information about the copyback state on SMART error of RAID controller. 1: Unknown (read only) 2: Disabled 3: Enabled Note: Set action is available only when raidControllerCopybackEnable = Enabled.</p>|`SNMP agent`|huawei-server[raidControllerSMARTerCopybackEnable.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} SAS address|<p>Information about RAID controller SAS address.</p>|`SNMP agent`|huawei-server[raidControllerSASAddress.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} settings|<p>Restore RAID controller settings (write only). The argument is: 1: Restore RAID controller settings. others: invalid</p>|`SNMP agent`|huawei-server[raidControllerRestoreSettings.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} NVData version|<p>Information about RAID controller NVData version.</p>|`SNMP agent`|huawei-server[raidControllerNVDataVersion.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} mode|<p>Information about RAID controller mode. 1: None-RAID 2: RAID 255: Unknown</p>|`SNMP agent`|huawei-server[raidControllerMode.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} minimum strip support bytes|<p>Information about the minimum strip size that RAID controller support.</p>|`SNMP agent`|huawei-server[raidControllerMinStripSupportInBytes.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} memory size|<p>Information about RAID controller memory size (MB).</p>|`SNMP agent`|huawei-server[raidControllerMemorySizeInMB.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} maxsimum strip support bytes|<p>Information about the maximum strip size that RAID controller support.</p>|`SNMP agent`|huawei-server[raidControllerMaxStripSupportInBytes.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} PD fail history|<p>Information about RAID controller if maintain PD fail history. 1: No 2: Yes 255: Unknown</p>|`SNMP agent`|huawei-server[raidControllerMaintainPDFailHistory.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} status|<p>Information about RAID controller health status. bit0: 1- memory correctable error bit1: 1- memory uncorrectable error bit2: 1- memory ECC error reached limit bit3: 1- NVRAM uncorrectable error other: reserved</p>|`SNMP agent`|huawei-server[raidControllerHealthStatus.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} BBU status|<p>Information about RAID controller's BBU health status. bit0: 1 - voltage is low bit1: 1 - need replace pack bit2: 1 - learn cycle failed bit3: 1 - learn cycle timeout bit4: 1 - pack is about to fail bit5: 1 - remaining capacity low bit6: 1 - no space for cache offload others: reserved</p>|`SNMP agent`|huawei-server[raidControllerBBUHealthStatus.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} firmware version|<p>Information about RAID controller firmware version.</p>|`SNMP agent`|huawei-server[raidControllerFwVersion.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} driver version|<p>Information about RAID controller driver version.</p>|`SNMP agent`|huawei-server[raidControllerDriverVersion.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} driver name|<p>Information about RAID controller driver name.</p>|`SNMP agent`|huawei-server[raidControllerDriverName.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} interface type|<p>Information about RAID controller device interface type. 1: SPI 2: SAS-3G 3: SATA-1.5G 4: SATA-3G 5: SAS-6G 6: SAS-12G 255: Unknown</p>|`SNMP agent`|huawei-server[raidControllerDeviceInterface.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} DDR ECC count|<p>Information about RAID controller DDR ECC count.</p>|`SNMP agent`|huawei-server[raidControllerDDREccCount.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} create logical drive|<p>Create new logical drive on this RAID controller. The arguments are seperated by semicolons; The arguments format is <option1>=<argument>;<option2>=<argument>;...;<optionN>=<argument>; example: rl=r1;pd=1,2;name=example;size=100.375g;ss=256k;sc=1;rp=ra;wp=wb;iop=cio;ap=rw;dcp=enabled;init=quick; or rl=r50;pd=1,2,3,4,5,6,7,8,9;name=example;size=500g;ss=1M;sc=3;rp=ra;wp=wb;iop=cio;ap=rw;dcp=enabled;init=quick; Options and arguments: rl=<RAID level> The RAID level of logical drive. It is mandatory. When 'cachecade=1' is specified, RAID level 0/1 is valid. r0: RAID0 r1: RAID1 r5: RAID5 r6: RAID6 r10: RAID10 r50: RAID50 r60: RAID60 pd=<PD IDs> The physical drives IDs which participate this logical drive. It is mandatory. name=<Logical drive name> The name of logical drive. The maximum is 15 printable ASCII characters except ';'. It is optional. size=<Logical drive size> The size of logical drive and unit can be 'm'(megabytes),'g'(gigabytes), or 't'(terabytes). It is optional and not necessary when 'cachecade=1' is specified. ss=<Logical drive strip size> The strip size of logical drive. The valid values are 64k,128k,256k,512k,1M. It is optional and not necessary when 'cachecade=1' is specified. sc=<Span count> The span count of logical drive. The default is 1 when RAID level is RAID0/1/5/6 and 2 when RAID level is RAID10/50/60. It is optional and not necessary when 'cachecade=1' is specified. rp=<Read Policy> The read policy of logical drive. It is optional and not necessary when 'cachecade=1' is specified. ra: Read Ahead nra: No Read Ahead wp=<Write Policy> The write policy of logical drive. It is optional. wt: Write Through wbwithbbu: Write Back with BBU wb: Write Back iop=<IO Policy> The IO policy of logical drive. It is optional and not necessary when 'cachecade=1' is specified. cio: Cached IO dio: Direct IO ap=<Access Policy> The access policy of logical drive. It is optional and not necessary when 'cachecade=1' is specified. rw: Read Write ro: Read only blocked: Blocked dcp=<Disk Cache Policy> The disk cache policy of logical drive. It is optional and not necessary when 'cachecade=1' is specified. enabled: Enable disk cache disabled: Disable disk cache default: Unchanged(Disk's default) init=<Init Type> The initialization type of logical drive. It is optional and not necessary when 'cachecade=1' is specified. no: No init quick: Quick init full: Full init cachecade=1 Logical drive is used for secondary cache. It is optional. It must be supported by RAID controller first. Note: Character ';' is not valid for logical drive name string because it is used as separator.</p>|`SNMP agent`|huawei-server[raidControllerCreateLD.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} controller copy back|<p>Information about the copyback state of RAID controller. 1: Unknown (read only) 2: Disabled 3: Enabled</p>|`SNMP agent`|huawei-server[raidControllerCopybackEnable.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} cache pinned|<p>Information about RAID controller if cache is pinned. 1: No 2: Yes 255: Unknown"</p>|`SNMP agent`|huawei-server[raidControllerCachePinned.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} BBU type|<p>Information about RAID controller BBU type.</p>|`SNMP agent`|huawei-server[raidControllerBBUType.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} BBU presence|<p>Information about RAID controller's BBU presence. 1: Absent 2: Present 255: Unknown</p>|`SNMP agent`|huawei-server[raidControllerBBUPresence.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} type|<p>Information about RAID controller type.</p>|`SNMP agent`|huawei-server[raidControllerType.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} lower critical|<p>Information about temperature lower critical threshold,the unit is 1/10 Celsius degree,65535 represent NA.</p>|`SNMP agent`|huawei-server[temperatureLowerCritical.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} lower minor|<p>Information about temperature lower minor threshold,the unit is 1/10 Celsius degree,65535 represent NA.</p>|`SNMP agent`|huawei-server[temperatureLowerMinor.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} lower nonrecoverable|<p>Information about temperature lower nonrecoverable threshold,the unit is 1/10 Celsius degree,65535 represent NA.</p>|`SNMP agent`|huawei-server[temperatureLowerNonRecoverable.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} temperature|<p>Information about temperature reading,the unit is 1/10 Celsius degree. If power off, the CPU temperature cannot be readable and is set to 65535.</p>|`SNMP agent`|huawei-server[temperatureReading.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} upper critical|<p>Information about temperature upper critical threshold,the unit is 1/10 Celsius degree,65535 represent NA.</p>|`SNMP agent`|huawei-server[temperatureUpperCritical.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} upper minor|<p>Information about temperature upper minor threshold,the unit is 1/10 Celsius degree,65535 represent NA.</p>|`SNMP agent`|huawei-server[temperatureUpperMinor.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} upper nonrecoverable|<p>Information about temperature upper nonrecoverable threshold,the unit is 1/10 Celsius degree,65535 represent NA.</p>|`SNMP agent`|huawei-server[temperatureUpperNonRecoverable.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} function|<p>Fan logic function.</p>|`SNMP agent`|huawei-server[fanFunction.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} location|<p>Fan physical location.</p>|`SNMP agent`|huawei-server[fanLocation.{#SNMPVALUE}]<p>Update: 6h</p><p>LLD</p>|
|{#DEVICENAME} presence|<p>Information about fan presence.</p>|`SNMP agent`|huawei-server[fanPresence.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} speed|<p>Fan speed ratio.</p>|`SNMP agent`|huawei-server[fanSpeed.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} speed ratio|<p>Fan speed ratio.</p>|`SNMP agent`|huawei-server[fanSpeedRatio.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|
|{#DEVICENAME} status|<p>Information about fan health status.</p>|`SNMP agent`|huawei-server[fanStatus.{#SNMPVALUE}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|cpu [{#SNMPVALUE}] status critical|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[cpuStatus.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|cpu [{#SNMPVALUE}] status major|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[cpuStatus.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|cpu [{#SNMPVALUE}] status minor|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[cpuStatus.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|fan  [{#SNMPVALUE}] status critical|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[fanStatus.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|fan [{#SNMPVALUE}] status major|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[fanStatus.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|fan  [{#SNMPVALUE}] status minor|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[fanStatus.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|hardDisk [{#SNMPVALUE}] status critical|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[hardDiskFwState.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|hardDisk [{#SNMPVALUE}] status major|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[hardDiskFwState.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|hardDisk [{#SNMPVALUE}] status minor|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[hardDiskFwState.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|memory [{#SNMPVALUE}] status critical|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[memoryStatus.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|memory [{#SNMPVALUE}] status major|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[memoryStatus.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|memory [{#SNMPVALUE}] status minor|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[memoryStatus.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|powerSupply [{#SNMPVALUE}] status critical|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[powerSupplyStatus.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|powerSupply [{#SNMPVALUE}] status major|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[powerSupplyStatus.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|powerSupply  [{#SNMPVALUE}] status minor|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[powerSupplyStatus.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|[{#DEVICENAME}] is too high|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[temperatureReading.{#SNMPVALUE}].last()}>=75</p><p>**Recovery expression**: </p>|high|
|hardDisk [{#SNMPVALUE}] status critical (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[hardDiskFwState.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|hardDisk [{#SNMPVALUE}] status major (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[hardDiskFwState.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|hardDisk [{#SNMPVALUE}] status minor (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[hardDiskFwState.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|powerSupply [{#SNMPVALUE}] status critical (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[powerSupplyStatus.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|powerSupply [{#SNMPVALUE}] status major (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[powerSupplyStatus.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|powerSupply  [{#SNMPVALUE}] status minor (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[powerSupplyStatus.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|cpu [{#SNMPVALUE}] status critical (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[cpuStatus.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|cpu [{#SNMPVALUE}] status major (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[cpuStatus.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|cpu [{#SNMPVALUE}] status minor (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[cpuStatus.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|memory [{#SNMPVALUE}] status critical (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[memoryStatus.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|memory [{#SNMPVALUE}] status major (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[memoryStatus.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|memory [{#SNMPVALUE}] status minor (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[memoryStatus.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|[{#DEVICENAME}] is too high (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[temperatureReading.{#SNMPVALUE}].last()}>=75</p><p>**Recovery expression**: </p>|high|
|fan  [{#SNMPVALUE}] status critical (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[fanStatus.{#SNMPVALUE}].last()}=4</p><p>**Recovery expression**: </p>|disaster|
|fan [{#SNMPVALUE}] status major (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[fanStatus.{#SNMPVALUE}].last()}=3</p><p>**Recovery expression**: </p>|high|
|fan  [{#SNMPVALUE}] status minor (LLD)|<p>-</p>|<p>**Expression**: {Huawei Server iBMC:huawei-server[fanStatus.{#SNMPVALUE}].last()}=2</p><p>**Recovery expression**: </p>|warning|
