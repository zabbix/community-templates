# App Skype for business Mediation Role

## Description

This template assesses the status and overall health of services as well as the performance of the Mediation Microsoft Skype for Business Server 2015. Note: You need to set thresholds for these counters according to your environment. It is recommended to monitor these counters for some period of time to understand potential value ranges and then set the thresholds accordingly. This documentation is based on: https://technet.microsoft.com/en-us/library/gg398616.aspx.

## Overview

Lync 2013 Mediation role template



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Outbound Calls: Current|<p>This component monitor returns the total number of active calls going through the Mediation Server.</p>|`Zabbix agent`|perf_counter["\LS:MediationServer - Outbound Calls(_total)\- current"]<p>Update: 60</p>|
|Health Indices: Load Call Failure Index|<p>This component monitor returns the scaled index between zero and 100 that is related to all call failures due to Global Health Index as a heavy load.</p>|`Zabbix agent`|perf_counter["\LS:MediationServer - Health Indices\- Load Call Failure Index"]<p>Update: 60</p>|
|Outbound Calls: Active media bypass calls|<p>This component monitor returns the total number of active calls going through Mediation Server that are in Media Bypass mode. Calls using Media Bypass use significantly fewer Mediation Server resources because the media is not flowing through the Mediation Server.</p>|`Zabbix agent`|perf_counter["\LS:MediationServer - Outbound Calls(_total)\- Active media bypass calls"]<p>Update: 60</p>|
|CDR adapter problem|<p>-</p>|`Zabbix agent (active)`|eventlog["Lync Server",,,,56207]<p>Update: 180</p>|
|Inbound Calls: Current|<p>This component monitor returns the number of inbound calls in progress.</p>|`Zabbix agent`|perf_counter["\LS:MediationServer - Inbound Calls(_total)\- current"]<p>Update: 60</p>|
|Inbound Calls: Active media bypass calls|<p>This component monitor returns the number of media bypass calls in progress.</p>|`Zabbix agent`|perf_counter["\LS:MediationServer - Inbound Calls(_total)\- Active media bypass calls"]<p>Update: 60</p>|
|Global Counters: Current audio channels with PSM quality reporting|<p>This component monitor returns the total number of active channels that are having Phase Shift Modulation (PSM) quality reported. Calculating PSM quality has a processing overhead so this should be taken into account when measuring performance.</p>|`Zabbix agent`|perf_counter["\LS:MediationServer - Global Counters\- Current audio channels with PSM quality reporting"]<p>Update: 60</p>|
|Total failed calls caused by unexpected interaction from a gateway|<p>This component monitor returns the number of calls that failed because of an unexpected response from a gateway peer. The returned value should be as low as possible.</p>|`Zabbix agent`|perf_counter["\LS:MediationServer - Global Per Gateway Counters(_Total)\- Total failed calls caused by unexpected interaction from a gateway"]<p>Update: 60</p>|
|Service: Lync Server Mediation|<p>-</p>|`Zabbix agent`|service.info["Lync Server Mediation", state]<p>Update: 300</p>|
|Service: Lync Server Replica Replicator Agent|<p>-</p>|`Zabbix agent`|service.info["Lync Server Replica Replicator Agent", state]<p>Update: 300</p>|
|Total failed calls caused by unexpected interaction from the Proxy|<p>This component monitor returns the number of calls that failed because of an unexpected response from the Front End Server. The returned value should be as low as possible.</p>|`Zabbix agent`|perf_counter["\LS:MediationServer - Global Counters\- Total failed calls caused by unexpected interaction from the Proxy"]<p>Update: 60</p>|
|Media Relay: Media Connectivity Check Failure|<p>This component monitor returns the number of calls where media connectivity between the Mediation Server and the remote endpoints could not be established. The returned value should be as low as possible.</p>|`Zabbix agent`|perf_counter["\LS:MediationServer - Media Relay\- Media Connectivity Check Failure"]<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

