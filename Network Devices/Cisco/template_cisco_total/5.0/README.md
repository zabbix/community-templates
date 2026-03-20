# Cisco Total

## Overview

This template is a smattering of a few templates combined with some custom discovery rules.


It has been tested to work with a bunch of Cisco switches and routers. It uses the standard SNMP root for all discovery (using OID's), so it works with most switch/router devices. If you have any issues with it let me know. I exported this from a live system, so the read the dependencies below.


**What it does:**


* BGP Discovery
	+ Admin Status
	+ Peer State
* CPU Discovery
	+ Usage on core
* Interface Discovery
	+ Traffic in/out
	+ Errors in/out
	+ Drops in/out
* Memory Pool Discovery
	+ Mem free in pool
* OSPF Discovery
	+ Neighbor State
* Temperature Discovery
	+ temperature of monitor


The template creates quite a few graph prototypes and adds them to a screen as well.


 


**Dependencies:**


The template had value maps, interface filters and groups associated with it when I cloned it, but I removed them so there shouldn't be any issues with it. If you find an issue importing let me know. I was successful importing default template to a new system.


 


**Other Instructions:**


Be sure to set the $SNMP\_COMMUNITY and $CRD\_SNMPV2\_R values. They should both be your SNMP community string.


 



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU_PUSED_MAX_1}|<p>-</p>|`85`|Text macro|
|{$CPU_PUSED_MAX_2}|<p>-</p>|`95`|Text macro|
|{$CRD_SNMPV2_R}|<p>-</p>|`FillMeIn`|Text macro|
|{$MEM_FREE_MIN_1}|<p>-</p>|`5000000`|Text macro|
|{$MEM_FREE_MIN_1:"I/O"}|<p>-</p>|`1400000`|Text macro|
|{$MEM_FREE_MIN_1:"SRAM"}|<p>-</p>|`3000`|Text macro|
|{$MEM_FREE_MIN_2}|<p>-</p>|`1000000`|Text macro|
|{$MEM_FREE_MIN_2:"I/O"}|<p>-</p>|`500000`|Text macro|
|{$MEM_FREE_MIN_2:"SRAM"}|<p>-</p>|`1000`|Text macro|
|{$SNMP_COMMUNITY}|<p>-</p>|`FillMeIn`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Cisco Temperature Discovery|<p>-</p>|`SNMP agent`|discovery.TempDesc<p>Update: 3600</p>|
|Cisco CPU Discovery|<p>{#CPUID} --> The physical entity can be a CPU chip, a group of CPUs, a CPU card etc. The exact type of this entity is described by its entPhysicalVendorType value.</p>|`SNMP agent`|cpmCPUTotalTable<p>Update: 3600</p>|
|Cisco Interface Discovery|<p>-</p>|`SNMP agent`|discovery.ifDescr<p>Update: 3600</p>|
|Cisco BGP Peer Enumeration|<p>-</p>|`SNMP agent`|discovery.bgpDescr<p>Update: 3600</p>|
|Cisco OSPF Discovery|<p>-</p>|`SNMP agent`|cisco.ospf.diuscovery<p>Update: 3600</p>|
|Cisco memory pool discovery|<p>{#MEMNAME} --> A textual name assigned to the memory pool. This object is suitable for output to a human operator, and may also be used to distinguish among the various pool types, especially among dynamic pools.</p>|`SNMP agent`|ciscoMemoryPoolTable<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#SNMPINDEX} temperature|<p>-</p>|`SNMP agent`|1.3.6.1.4.1.9.9.13.1.3.1.3.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|CPU - usage on core '{#CPUID}'|<p>The overall CPU busy percentage in the last 5 minute period.</p>|`SNMP agent`|cpmCPUTotal5minRev[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound traffic|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.10.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound discarded packets|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.13.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Inbound error packets|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.14.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound traffic|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.16.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound discarded packets|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.19.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|{#SNMPVALUE} - Outbound error packets|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.2.2.1.20.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|BGP Peer State {#SNMPINDEX}|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.15.3.1.2.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|BGP Admin Status {#SNMPINDEX}|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.15.3.1.3.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|ospfNbrState {#SNMPINDEX}|<p>-</p>|`SNMP agent`|.1.3.6.1.2.1.14.10.1.6.[{#SNMPINDEX}]<p>Update: 30</p><p>LLD</p>|
|Memory - free in pool '{#MEMNAME}'|<p>Indicates the number of bytes from the memory pool that are currently unused on the managed device.</p>|`SNMP agent`|ciscoMemoryPoolFree[{#SNMPINDEX}]<p>Update: 600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Cisco: 'Free memory' in pool '{#MEMNAME}' is low [{ITEM.LASTVALUE}]|<p>-</p>|<p>**Expression**: {Cisco Total:ciscoMemoryPoolFree[{#SNMPINDEX}].max(#3)}<5000000</p><p>**Recovery expression**: </p>|warning|
|Cisco: 'Free memory' in pool '{#MEMNAME}' is too low [{ITEM.LASTVALUE}]|<p>-</p>|<p>**Expression**: {Cisco Total:ciscoMemoryPoolFree[{#SNMPINDEX}].max(#3)}<1000000</p><p>**Recovery expression**: </p>|average|
|Cisco: 'CPU usage' on core '{#CPUID}' is high [{ITEM.LASTVALUE}]|<p>- Check for a possible security issue. Commonly, high CPU utilization is caused by a security issue, such as a worm or virus operating in your network. This is especially likely to be the cause if there have not been recent changes to the network. Usually, a configuration change, such as adding additional lines to your access lists can mitigate the effects of this problem. Cisco Product Security Advisories and Notices contains information on detection of the most likely causes and specific workarounds. - Make sure all debugging commands in your router are turned off by issuing the undebug all or no debug all commands. For more information on the use of debugging commands, refer to Using Debug Commands. - Are you able to issue show commands on the router? If yes, start collecting more information immediately, using these show commands. - Is the router inaccessible? Can you reproduce this problem? If yes, power-cycle the router and, before reproducing the problem, configure the scheduler interval 500 command. This schedules low priority processes to run every 500 milliseconds, which provides time for you to run some commands, even if CPU usage is at 100 percent. On Cisco 7200 and Cisco 7500 Series Routers, use the scheduler allocate 3000 1000 command. - Does the router show symptoms of high CPU utilization at brief and unpredictable intervals? If yes, periodically collect the output of the show processes cpu command, which shows if the high CPU utilization is caused by interrupts or by a certain process. Use this UNIX script and, based on the first findings, modify the script to collect data needed for further investigation of the issue. The overall CPU busy percentage.</p>|<p>**Expression**: {Cisco Total:cpmCPUTotal5minRev[{#SNMPINDEX}].min(#3)}>85</p><p>**Recovery expression**: </p>|warning|
|Cisco: 'CPU usage' on core '{#CPUID}' is too high [{ITEM.LASTVALUE}]|<p>- Check for a possible security issue. Commonly, high CPU utilization is caused by a security issue, such as a worm or virus operating in your network. This is especially likely to be the cause if there have not been recent changes to the network. Usually, a configuration change, such as adding additional lines to your access lists can mitigate the effects of this problem. Cisco Product Security Advisories and Notices contains information on detection of the most likely causes and specific workarounds. - Make sure all debugging commands in your router are turned off by issuing the undebug all or no debug all commands. For more information on the use of debugging commands, refer to Using Debug Commands. - Are you able to issue show commands on the router? If yes, start collecting more information immediately, using these show commands. - Is the router inaccessible? Can you reproduce this problem? If yes, power-cycle the router and, before reproducing the problem, configure the scheduler interval 500 command. This schedules low priority processes to run every 500 milliseconds, which provides time for you to run some commands, even if CPU usage is at 100 percent. On Cisco 7200 and Cisco 7500 Series Routers, use the scheduler allocate 3000 1000 command. - Does the router show symptoms of high CPU utilization at brief and unpredictable intervals? If yes, periodically collect the output of the show processes cpu command, which shows if the high CPU utilization is caused by interrupts or by a certain process. Use this UNIX script and, based on the first findings, modify the script to collect data needed for further investigation of the issue. The overall CPU busy percentage.</p>|<p>**Expression**: {Cisco Total:cpmCPUTotal5minRev[{#SNMPINDEX}].min(#3)}>95</p><p>**Recovery expression**: </p>|average|
|Cisco: 'CPU usage' on core '{#CPUID}' is high [{ITEM.LASTVALUE}] (LLD)|<p>- Check for a possible security issue. Commonly, high CPU utilization is caused by a security issue, such as a worm or virus operating in your network. This is especially likely to be the cause if there have not been recent changes to the network. Usually, a configuration change, such as adding additional lines to your access lists can mitigate the effects of this problem. Cisco Product Security Advisories and Notices contains information on detection of the most likely causes and specific workarounds. - Make sure all debugging commands in your router are turned off by issuing the undebug all or no debug all commands. For more information on the use of debugging commands, refer to Using Debug Commands. - Are you able to issue show commands on the router? If yes, start collecting more information immediately, using these show commands. - Is the router inaccessible? Can you reproduce this problem? If yes, power-cycle the router and, before reproducing the problem, configure the scheduler interval 500 command. This schedules low priority processes to run every 500 milliseconds, which provides time for you to run some commands, even if CPU usage is at 100 percent. On Cisco 7200 and Cisco 7500 Series Routers, use the scheduler allocate 3000 1000 command. - Does the router show symptoms of high CPU utilization at brief and unpredictable intervals? If yes, periodically collect the output of the show processes cpu command, which shows if the high CPU utilization is caused by interrupts or by a certain process. Use this UNIX script and, based on the first findings, modify the script to collect data needed for further investigation of the issue. The overall CPU busy percentage.</p>|<p>**Expression**: {Cisco Total:cpmCPUTotal5minRev[{#SNMPINDEX}].min(#3)}>85</p><p>**Recovery expression**: </p>|warning|
|Cisco: 'CPU usage' on core '{#CPUID}' is too high [{ITEM.LASTVALUE}] (LLD)|<p>- Check for a possible security issue. Commonly, high CPU utilization is caused by a security issue, such as a worm or virus operating in your network. This is especially likely to be the cause if there have not been recent changes to the network. Usually, a configuration change, such as adding additional lines to your access lists can mitigate the effects of this problem. Cisco Product Security Advisories and Notices contains information on detection of the most likely causes and specific workarounds. - Make sure all debugging commands in your router are turned off by issuing the undebug all or no debug all commands. For more information on the use of debugging commands, refer to Using Debug Commands. - Are you able to issue show commands on the router? If yes, start collecting more information immediately, using these show commands. - Is the router inaccessible? Can you reproduce this problem? If yes, power-cycle the router and, before reproducing the problem, configure the scheduler interval 500 command. This schedules low priority processes to run every 500 milliseconds, which provides time for you to run some commands, even if CPU usage is at 100 percent. On Cisco 7200 and Cisco 7500 Series Routers, use the scheduler allocate 3000 1000 command. - Does the router show symptoms of high CPU utilization at brief and unpredictable intervals? If yes, periodically collect the output of the show processes cpu command, which shows if the high CPU utilization is caused by interrupts or by a certain process. Use this UNIX script and, based on the first findings, modify the script to collect data needed for further investigation of the issue. The overall CPU busy percentage.</p>|<p>**Expression**: {Cisco Total:cpmCPUTotal5minRev[{#SNMPINDEX}].min(#3)}>95</p><p>**Recovery expression**: </p>|average|
|Cisco: 'Free memory' in pool '{#MEMNAME}' is low [{ITEM.LASTVALUE}] (LLD)|<p>-</p>|<p>**Expression**: {Cisco Total:ciscoMemoryPoolFree[{#SNMPINDEX}].max(#3)}<5000000</p><p>**Recovery expression**: </p>|warning|
|Cisco: 'Free memory' in pool '{#MEMNAME}' is too low [{ITEM.LASTVALUE}] (LLD)|<p>-</p>|<p>**Expression**: {Cisco Total:ciscoMemoryPoolFree[{#SNMPINDEX}].max(#3)}<1000000</p><p>**Recovery expression**: </p>|average|
