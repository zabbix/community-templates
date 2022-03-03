# Device - MEINBERG LANTIME

## Overview

Simple SNMP based Template. Currently features the following checks:


* Cluster Availability
* Device Temperature
* NTP Statistics
* NTP Status
* Power Supply Status
* Reference Clock Status
* PTP Status (Not tested)


## Author

Marcel Wiechmann

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template Module ICMP Ping|
|Template Module Interfaces SNMP|
|Template Module Generic SNMP|
|Template SNMP Processors|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Cluster Discovery|<p>-</p>|`SNMP agent`|mbgLtNgClusterIndex<p>Update: 1h</p>|
|PTP Discovery|<p>-</p>|`SNMP agent`|mbgLtNgPtpIndex<p>Update: 1h</p>|
|Network interfaces discovery|<p>Discovering interfaces from IF-MIB.</p>|`SNMP agent`|net.if.discovery<p>Update: 1h</p>|
|Power Supply Discovery|<p>-</p>|`SNMP agent`|mbgLtNgSysPsTable<p>Update: 1h</p>|
|Fan Discovery|<p>-</p>|`SNMP agent`|mbgLtNgSysFanIndex<p>Update: 1h</p>|
|Processors|<p>{$SNMP_COMMUNITY} is a global macro.</p>|`SNMP agent`|hrProcessorLoad<p>Update: 3600</p>|
|Reference Clock Discovery|<p>-</p>|`SNMP agent`|mbgLtNgRefclockTable<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Total Requests Last Hour|<p>Today's requests within the last completed hour.</p>|`SNMP agent`|mbgLtNgNtpCCTotalRequestsLastHour<p>Update: 1h</p>|
|NTP Status|<p>Current NTP's synchronization status.</p>|`SNMP agent`|mbgLtNgNtpCurrentState<p>Update: 1m</p>|
|Total Requests Today|<p>Today's total requests</p>|`SNMP agent`|mbgLtNgNtpCCTotalRequestsCurrentDay<p>Update: 1h</p>|
|NTP Reference Clock|<p>Name of the current refclock by the NTP.</p>|`SNMP agent`|mbgLtNgNtpRefclockName<p>Update: 1h</p>|
|Firmware Version|<p>Installed LANTIME firmware version.</p>|`SNMP agent`|mbgLtNgFirmwareVersion<p>Update: 1h</p>|
|NTP Stratum|<p>Stratum value of the NTP.</p>|`SNMP agent`|mbgLtNgNtpStratum<p>Update: 1h</p>|
|NTP Reference Clock Offset|<p>Time offset between the current selected refclock and time of NTP as string in milliseconds</p>|`SNMP agent`|mbgLtNgNtpRefclockOffset<p>Update: 1m</p>|
|Total Today's Clients|<p>Today's number of different clients requesting time.</p>|`SNMP agent`|mbgLtNgNtpCCTodaysClients<p>Update: 1h</p>|
|Total Requests Last Minute|<p>Today's requests within the last completed minute.</p>|`SNMP agent`|mbgLtNgNtpCCTotalRequestsLastMinute<p>Update: 1m</p>|
|Statistic Start Time|<p>Start time of current NTP client counter session as timestamp.</p>|`SNMP agent`|mbgLtNgNtpCCStartedAt<p>Update: 1h</p>|
|Temperature|<p>Temperature in degree Celsius</p>|`SNMP agent`|mbgLtNgSysTempCelsius<p>Update: 1m</p>|
|Serial Number|<p>LANTIME serial number.</p>|`SNMP agent`|mbgLtNgSerialNumber<p>Update: 1h</p>|
|Total Clients|<p>Total number of different clients requesting time.</p>|`SNMP agent`|mbgLtNgNtpCCNumberOfClients<p>Update: 1h</p>|
|Total Requests|<p>Total requests since starting of the daemon.</p>|`SNMP agent`|mbgLtNgNtpCCTotalRequests<p>Update: 1h</p>|
|Clock Class|<p>Reference's clock class</p>|`SNMP agent`|mbgLtNgClusterClockClass[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Clock Status|<p>Reference's clock status</p>|`SNMP agent`|mbgLtNgClusterClockStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Falseticker|<p>Am I a falseticker?</p>|`SNMP agent`|mbgLtNgClusterIsFalseticker[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Priority|<p>Priority of cluster master</p>|`SNMP agent`|mbgLtNgClusterMasterPriority[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Member State|<p>State of cluster</p>|`SNMP agent`|mbgLtNgClusterPortState[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Reconfiguration State|<p>Current reconfiguration state</p>|`SNMP agent`|mbgLtNgClusterReconfigurationState[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Availability|<p>Signals whether PTP instance is avail or not</p>|`SNMP agent`|mbgLtNgPtpAvail[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Clock Accuracy|<p>Indicates the source of time</p>|`SNMP agent`|mbgLtNgPtpClockAccuracy[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Clock Class|<p>Denotes the traceability of the time or frequency</p>|`SNMP agent`|mbgLtNgPtpClockClass[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Asymmetric Network Delay|<p>Asymmetric network delay in nanoseconds</p>|`SNMP agent`|mbgLtNgPtpDelayAsymmetry[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Delay Mechanism|<p>Delay mechanism</p>|`SNMP agent`|mbgLtNgPtpDelayMec[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Grandmaster MAC|<p>MAC address of current grandmaster</p>|`SNMP agent`|mbgLtNgPtpGrandmasterMac[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Grandmaster Offset|<p>Offset from grandmaster in nanoseconds</p>|`SNMP agent`|mbgLtNgPtpOffsetFromGM[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Network Delay|<p>Network delay in nanoseconds</p>|`SNMP agent`|mbgLtNgPtpPathDelay[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Port Link Status|<p>PTP port's physical link-up</p>|`SNMP agent`|mbgLtNgPtpPortLinkup[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - State|<p>Port state as integer</p>|`SNMP agent`|mbgLtNgPtpPortState[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - System Time|<p>Current system time</p>|`SNMP agent`|mbgLtNgPtpSysTime[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - PTP Seconds|<p>PTP seconds</p>|`SNMP agent`|mbgLtNgPtpTimeSeconds[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Time Source|<p>Source of time being used</p>|`SNMP agent`|mbgLtNgPtpTimeSource[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - Time on TSU|<p>Current time on PTP TSU</p>|`SNMP agent`|mbgLtNgPtpTsuTime[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PTP Module - {#SNMPVALUE} - UTC Offset|<p>Offset from PTP's TAI time to UTC time</p>|`SNMP agent`|mbgLtNgPtpUtcOffset[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|<p>MIB: IF-MIB The number of inbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.discards[ifInDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in.errors[ifInErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>MIB: IF-MIB The total number of octets received on the interface, including framing characters. This object is a 64-bit version of ifInOctets. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.in[ifHCInOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|<p>MIB: IF-MIB The number of outbound packets which were chosen to be discarded even though no errors had been detected to prevent their being deliverable to a higher-layer protocol. One possible reason for discarding such a packet could be to free up buffer space. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.discards[ifOutDiscards.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|<p>MIB: IF-MIB For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol. For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out.errors[ifOutErrors.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>MIB: IF-MIB The total number of octets transmitted out of the interface, including framing characters. This object is a 64-bit version of ifOutOctets.Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.</p>|`SNMP agent`|net.if.out[ifHCOutOctets.{#SNMPINDEX}]<p>Update: 3m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>MIB: IF-MIB An estimate of the interface's current bandwidth in units of 1,000,000 bits per second. If this object reports a value of `n' then the speed of the interface is somewhere in the range of `n-500,000' to`n+499,999'. For interfaces which do not vary in bandwidth or for those where no accurate estimation can be made, this object should contain the nominal bandwidth. For a sub-layer which has no concept of bandwidth, this object should be zero.</p>|`SNMP agent`|net.if.speed[ifHighSpeed.{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>MIB: IF-MIB The current operational state of the interface. - The testing(3) state indicates that no operational packet scan be passed - If ifAdminStatus is down(2) then ifOperStatus should be down(2) - If ifAdminStatus is changed to up(1) then ifOperStatus should change to up(1) if the interface is ready to transmit and receive network traffic - It should change todormant(5) if the interface is waiting for external actions (such as a serial line waiting for an incoming connection) - It should remain in the down(2) state if and only if there is a fault that prevents it from going to the up(1) state - It should remain in the notPresent(6) state if the interface has missing(typically, hardware) components.</p>|`SNMP agent`|net.if.status[ifOperStatus.{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|<p>MIB: IF-MIB The type of interface. Additional values for ifType are assigned by the Internet Assigned NumbersAuthority (IANA), through updating the syntax of the IANAifType textual convention.</p>|`SNMP agent`|net.if.type[ifType.{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Power Supply - {#SNMPVALUE} - Status|<p>Status of power supply</p>|`SNMP agent`|mbgLtNgSysPsStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Fan - {#SNMPVALUE} - Error|<p>Fan's error field</p>|`SNMP agent`|mbgLtNgSysFanError[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Fan - {#SNMPVALUE} - Status|<p>Status of fan</p>|`SNMP agent`|mbgLtNgSysFanStatus[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Utilization of processor #$1|<p>The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.</p>|`SNMP agent`|hrProcessorLoad[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - Additional Information|<p>Any kind of additional information concerning a refclock</p>|`SNMP agent`|mbgLtNgRefclockAdditionalInfo[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - Leap Second Date|<p>Date for next leap second</p>|`SNMP agent`|mbgLtNgRefclockLeapSecondDate[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - Status Value A MAX|<p>Maximum status A depending on reflcock gps :indicates number of satellites in view long wave -pzf :100 -other :not supported irig :not supported</p>|`SNMP agent`|mbgLtNgRefclockMaxStatusA[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - Status Value B MAX|<p>Maximum status B depending on reflcock gps :not supported long wave -all :100 irig :not supported</p>|`SNMP agent`|mbgLtNgRefclockMaxStatusB[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - State|<p>State of GPS refclock conneted to NTP time server as value 0:not available 1:synchronized 2:not synchronized</p>|`SNMP agent`|mbgLtNgRefclockState[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - Status Value A|<p>Status A depending on reflcock gps :indicates number of good satellites in view long wave -pzf :correlation -other :not supported irig :not supported</p>|`SNMP agent`|mbgLtNgRefclockStatusA[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - Status Value B|<p>Status B depending on reflcock gps :not supported long wave -all :field strength irig :not supported</p>|`SNMP agent`|mbgLtNgRefclockStatusB[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - Substate|<p>More detailed state depending on refclock type 0:no substate available gps:1-4 long waves (PZF,WWVB,MSF,...):50-52 (not supported by all types) irig:100-101</p>|`SNMP agent`|mbgLtNgRefclockSubstate[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - Type|<p>Type of refclock</p>|`SNMP agent`|mbgLtNgRefclockType[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Reference Clock - {#SNMPVALUE} - Usage|<p>what this refclock is used for</p>|`SNMP agent`|mbgLtNgRefclockUsage[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% )|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({Device - MEINBERG LANTIME:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {Device - MEINBERG LANTIME:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Device - MEINBERG LANTIME:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {Device - MEINBERG LANTIME:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Device - MEINBERG LANTIME:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {Device - MEINBERG LANTIME:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {Device - MEINBERG LANTIME:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {Device - MEINBERG LANTIME:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|Cluster Clock in Failure State|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgClusterClockStatus[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|average|
|Cluster membership change|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgClusterPortState[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Cluster reconfiguration state change|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgClusterReconfigurationState[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|PTP Module - {#SNMPVALUE} - Faulty|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgPtpPortState[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Reference Clock - {#SNMPVALUE} - Not synchronized|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgRefclockState[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Reference Clock - {#SNMPVALUE} - Source Changed|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgRefclockUsage[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Fan - {#SNMPVALUE} - In Error State|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgSysFanError[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Fan - {#SNMPVALUE} - Offline|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgSysFanStatus[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|warning|
|Power Supply - {#SNMPVALUE} - Down|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgSysPsStatus[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|average|
|Cluster Clock in Failure State (LLD)|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgClusterClockStatus[{#SNMPINDEX}].last()}=3</p><p>**Recovery expression**: </p>|average|
|Cluster membership change (LLD)|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgClusterPortState[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Cluster reconfiguration state change (LLD)|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgClusterReconfigurationState[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|PTP Module - {#SNMPVALUE} - Faulty (LLD)|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgPtpPortState[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: {Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}<0 and {Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0 and ( {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=6 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=7 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=11 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=62 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=69 or {Device - MEINBERG LANTIME:net.if.type[ifType.{#SNMPINDEX}].last()}=117 ) and ({Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2)</p><p>**Recovery expression**: ({Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].change()}>0 and {Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].prev()}>0) or ({Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and ({Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}=2 and {Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].diff()}=1)</p><p>**Recovery expression**: {Device - MEINBERG LANTIME:net.if.status[ifOperStatus.{#SNMPINDEX}].last()}<>2 or 1=0</p>|average|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage (> {$IF.UTIL.MAX:"{#IFNAME}"}% ) (LLD)|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: ({Device - MEINBERG LANTIME:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} or {Device - MEINBERG LANTIME:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}>(90/100)*{Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}) and {Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}>0</p><p>**Recovery expression**: {Device - MEINBERG LANTIME:net.if.in[ifHCInOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()} and {Device - MEINBERG LANTIME:net.if.out[ifHCOutOctets.{#SNMPINDEX}].avg(15m)}<((90-3)/100)*{Device - MEINBERG LANTIME:net.if.speed[ifHighSpeed.{#SNMPINDEX}].last()}</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate (> {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m) (LLD)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: {Device - MEINBERG LANTIME:net.if.in.errors[ifInErrors.{#SNMPINDEX}].min(5m)}>2 or {Device - MEINBERG LANTIME:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].min(5m)}>2</p><p>**Recovery expression**: {Device - MEINBERG LANTIME:net.if.in.errors[ifInErrors.{#SNMPINDEX}].max(5m)}<2*0.8 and {Device - MEINBERG LANTIME:net.if.out.errors[ifOutErrors.{#SNMPINDEX}].max(5m)}<2*0.8</p>|warning|
|Power Supply - {#SNMPVALUE} - Down (LLD)|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgSysPsStatus[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|average|
|Fan - {#SNMPVALUE} - In Error State (LLD)|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgSysFanError[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|average|
|Fan - {#SNMPVALUE} - Offline (LLD)|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgSysFanStatus[{#SNMPINDEX}].last()}=1</p><p>**Recovery expression**: </p>|warning|
|Reference Clock - {#SNMPVALUE} - Not synchronized (LLD)|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgRefclockState[{#SNMPINDEX}].last()}=2</p><p>**Recovery expression**: </p>|warning|
|Reference Clock - {#SNMPVALUE} - Source Changed (LLD)|<p>-</p>|<p>**Expression**: {Device - MEINBERG LANTIME:mbgLtNgRefclockUsage[{#SNMPINDEX}].diff()}=1</p><p>**Recovery expression**: </p>|information|
