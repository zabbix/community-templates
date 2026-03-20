# SNMP Cisco IP SLA

## Overview

Template for Zabbix 3.0 version. Adapted from Pahedu Pahedu's Zabbix 3.2 template.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IP SLA Discovery|<p>-</p>|`SNMP agent`|rttMonCtrlAdminTag<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|IP SLA {#SNMPINDEX} completion time|<p>The completion time of the latest RTT operation successfully completed. The unit of this object will be microsecond when rttMonCtrlAdminRttType is set to 'jitter' and rttMonEchoAdminPrecision is set to 'microsecond'. Otherwise, the unit of this object will be millisecond.</p>|`SNMP agent`|rttMonCtrlAdminCompletionTime[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|IP SLA {#SNMPINDEX} frequency|<p>Specifies the duration between initiating each RTT operation. This object cannot be set to a value which would be a shorter duration than rttMonCtrlAdminTimeout. When the RttMonRttType specifies an operation that is synchronous in nature, it may happen that the next RTT operation is blocked by a RTT operation which has not yet completed. In this case, the value of a counter (rttMonStatsCollectBusies) in rttMonStatsCaptureTable is incremented in lieu of initiating a RTT operation, and the next attempt will occur at the next rttMonCtrlAdminFrequency expiration. NOTE: When the rttMonCtrlAdminRttType object is defined to be 'pathEcho', setting this value to a small value for your network size may cause an operation attempt (or multiple attempts) to be started before the previous operation has finished. In this situation the rttMonStatsCollectBusies object will be incremented in lieu of initiating a new RTT operation, and the next attempt will occur at the next rttMonCtrlAdminFrequency expiration. When the rttMonCtrlAdminRttType object is defined to be 'pathEcho', the suggested value for this object is greater than rttMonCtrlAdminTimeout times the maximum number of expected hops to the target. NOTE: When the rttMonCtrlAdminRttType object is defined to be 'dhcp', the minimum allowed value for this object is 10 seconds. This restriction is due to protocol limitations described in RFC 2131.</p>|`SNMP agent`|rttMonCtrlAdminFrequency[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|IP SLA {#SNMPINDEX} type|<p>The type of RTT operation to be performed. This value must be set in the same PDU or before setting any type specific configuration. Note: The RTT operation 'lspGroup' cannot be created via this control row. It will be created automatically by Auto SAA L3 MPLS VPN when rttMplsVpnMonCtrlLpd is 'true'.</p>|`SNMP agent`|rttMonCtrlAdminRttType[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|IP SLA {#SNMPINDEX} sense|<p>A sense code for the completion status of the latest RTT operation.</p>|`SNMP agent`|rttMonCtrlAdminSense[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|IP SLA {#SNMPINDEX} status|<p>The status of the conceptual RTT control row. In order for this object to become active, the following row objects must be defined: - rttMonCtrlAdminRttType Additionally: - for echo, pathEcho based on 'ipIcmpEcho' and dlsw probes rttMonEchoAdminProtocol and rttMonEchoAdminTargetAddress; - for echo, pathEcho based on 'mplsLspPingAppl' rttMonEchoAdminProtocol, rttMonEchoAdminTargetAddress and rttMonEchoAdminLSPFECType - for udpEcho, tcpConnect and jitter probes rttMonEchoAdminTargetAddress and rttMonEchoAdminTargetPort - for http and ftp probe rttMonEchoAdminURL - for dns probe rttMonEchoAdminTargetAddressString rttMonEchoAdminNameServer - dhcp probe doesn't require any additional objects All other objects can assume default values. The conceptual Rtt control row will be placed into a 'pending' state (via the rttMonCtrlOperState object) if rttMonScheduleAdminRttStartTime is not specified. Most conceptual Rtt control row objects cannot be modified once this conceptual Rtt control row has been created. The objects that can change are the following: - Objects in the rttMonReactAdminTable can be modified as needed without setting this object to 'notInService'. - Objects in the rttMonScheduleAdminTable can be modified only when this object has the value of 'notInService'. - The rttMonCtrlOperState can be modified to control the state of the probe. Once this object is in 'active' status, it cannot be set to 'notInService' while the rttMonCtrlOperState is in 'active' state. Thus the rttMonCtrlOperState object must be transitioned first. This object can be set to 'destroy' from any value at any time.</p>|`SNMP agent`|rttMonCtrlAdminStatus[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|IP SLA {#SNMPINDEX} threshold|<p>This object defines an administrative threshold limit. If the RTT operation time exceeds this limit and if the conditions specified in rttMonReactAdminThresholdType or rttMonHistoryAdminFilter are satisfied, a threshold is generated.</p>|`SNMP agent`|rttMonCtrlAdminThreshold[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|IP SLA {#SNMPINDEX} timeout|<p>Specifies the duration to wait for a RTT operation completion. The value of this object cannot be set to a value which would specify a duration exceeding rttMonCtrlAdminFrequency. For connection oriented protocols, this may cause the connection to be closed by the probe. Once closed, it will be assumed that the connection reestablishment will be performed. To prevent unwanted closure of connections, be sure to set this value to a realistic connection timeout.</p>|`SNMP agent`|rttMonCtrlAdminTimeout[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|IP SLA {#SNMPINDEX} verify data|<p>When set to true, the resulting data in each RTT operation is compared with the expected data. This includes checking header information (if possible) and exact packet size. Any mismatch will be recorded in the rttMonStatsCollectVerifyErrors object. Some RttMonRttTypes may not support this option. When a type does not support this option, the agent will transition this object to false. It is the management applications responsibility to check for this transition. This object is only applicable to SNA protocols.</p>|`SNMP agent`|rttMonCtrlAdminVerifyData[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|IP SLA {#SNMPINDEX} on {HOST.NAME} is not OK|<p>-</p>|<p>**Expression**: {SNMP Cisco IP SLA:rttMonCtrlAdminSense[{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
|IP SLA {#SNMPINDEX} on {HOST.NAME} is not OK (LLD)|<p>-</p>|<p>**Expression**: {SNMP Cisco IP SLA:rttMonCtrlAdminSense[{#SNMPINDEX}].last()}<>1</p><p>**Recovery expression**: </p>|high|
