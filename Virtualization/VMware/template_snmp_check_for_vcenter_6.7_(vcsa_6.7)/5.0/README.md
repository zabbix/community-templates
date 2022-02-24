# vCenter_SNMP-VMWARE_VCSA_6.7

## Description

vCenter 6.7 U1 Build 10244745

## Overview

Template for SNMP check of VMware vCenter 6.7


**THIS TEMPLATE BOTH FOR ZABBIX 3.4 & 4.0**


based on : https://share.zabbix.com/virtualization/vmware/snmp-check-vcenter-vcsa-6-5


 09/nov/2018


**Template has been completely rebuilt!**


Now it use autodiscovery and LLD.


Setup procedure:


**For Zabbix 3.4:**


1. Attach template


2. Create Regular Expression as shown below:


Name: VMWARESVC


Result is TRUE ^(.*?)((?=\.)|(?=$))


Result is FALSE ^saslauth|bas|anacro|pytho


3. Put the linked script to Externalscripts directory on Zabbix Server with replace $vcsa and given name "vcsa\_discovery"


4. Done.


 


**For Zabbix 4.0:**


1. Attach template


2. Put the linked script to Externalscripts directory on Zabbix Server with replace $vcsa and given name "vcsa\_discovery"


3. Done.


 


Script link: https://yadi.sk/d/uYPmitqbaRwpew


There is a few important things!!


1. In update 6.7U1 VMWare cut service names in OID:


berfore: vpxd


after: vpx


So, in discovered item names there will be a little bit strange names. 


<https://support.zabbix.com/browse/ZBXNEXT-3753> - renaming discovered items still unavailable



## Author

Aleksey Omelyanovich

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU_UTIL_MAX}|<p>-</p>|`90`|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network|<p>-</p>|`SNMP agent`|snmp.network.discovery<p>Update: 180</p>|
|CPU|<p>-</p>|`SNMP agent`|snmp.CPU.discovery<p>Update: 3600</p>|
|VCSA Services|<p>-</p>|`External check`|vcsa_discovery<p>Update: 1h</p>|
|File System|<p>-</p>|`SNMP agent`|snmp.filesystem.discovery<p>Update: 180</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|File System Allocation Failure|<p>Storage allocation file system</p>|`SNMP agent`|SNMP-File-System-allocation-error<p>Update: 180</p>|
|Memory Allocation Error|<p>-</p>|`SNMP agent`|SNMP-Memory-Allocation-Error<p>Update: 180</p>|
|Number of Processes|<p>-</p>|`SNMP agent`|SNMP-Number-Processes<p>Update: 180</p>|
|Ping vCenter|<p>-</p>|`Simple check`|icmpping[,2]<p>Update: 120</p>|
|Snmp Availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 180</p>|
|Vcenter Name|<p>-</p>|`SNMP agent`|SNMP-NamePlateforme<p>Update: 3600</p>|
|Interface [{#SNMPVALUE}] Admin Status|<p>-</p>|`SNMP agent`|SNMP-Interface-Admin-Status.[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Description|<p>-</p>|`SNMP agent`|SNMP-Interface-Description.[{#SNMPVALUE}]<p>Update: 1800</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] IN Error|<p>-</p>|`SNMP agent`|SNMP-Interface-IN-Error.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Bytes received|<p>-</p>|`SNMP agent`|SNMP-Interface-IN-Octets.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] MAC|<p>-</p>|`SNMP agent`|SNMP-Interface-MAC.[{#SNMPVALUE}]<p>Update: 1800</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Operation Status|<p>-</p>|`SNMP agent`|SNMP-Interface-Operation-Status.[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Bytes send|<p>-</p>|`SNMP agent`|SNMP-Interface-OUT-Octets.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Type|<p>-</p>|`SNMP agent`|SNMP-Interface-Type.[{#SNMPVALUE}]<p>Update: 1800</p><p>LLD</p>|
|CPU {#SNMPINDEX} Utilization|<p>-</p>|`SNMP agent`|SNMP-Charge-CPU-.[{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|CPU {#SNMPINDEX} Name|<p>-</p>|`SNMP agent`|SNMP-Name-CPU-.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|Process [{#VMWARESVC}] CPU Usage|<p>-</p>|`Calculated`|Process-Usage-[{#VMWARESVC}]<p>Update: 30s</p><p>LLD</p>|
|Process [{#VMWARESVC}] Memory Usage|<p>-</p>|`SNMP agent`|SNMP-Process-Memory-[{#VMWARESVC}]<p>Update: 1m</p><p>LLD</p>|
|Process [{#VMWARESVC}] CPU centi-seconds|<p>-</p>|`SNMP agent`|SNMP-Process-Perf-CPU-[{#VMWARESVC}]<p>Update: 30s</p><p>LLD</p>|
|Process [{#VMWARESVC}] Status|<p>-</p>|`SNMP agent`|SNMP-Process-Status-[{#VMWARESVC}]<p>Update: 1m</p><p>LLD</p>|
|File System {#SNMPVALUE} - Used Percentage|<p>-</p>|`Calculated`|File-System-Space-Used-Percentage.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|
|File System {#SNMPVALUE} - Space Allocated|<p>-</p>|`SNMP agent`|SNMP-File-System-Space-Allocated.[{#SNMPVALUE}]<p>Update: 600</p><p>LLD</p>|
|File System {#SNMPVALUE} - Space Used|<p>-</p>|`SNMP agent`|SNMP-File-System-Space-Used.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|High CPU {#SNMPINDEX} Utilization on {HOST.HOST1}|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Charge-CPU-.[{#SNMPINDEX}].avg(5m)}>90</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 1%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:File-System-Space-Used-Percentage.[{#SNMPVALUE}].last()}>=99</p><p>**Recovery expression**: </p>|high|
|Free Space File System  {#SNMPVALUE}  -< 5%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:File-System-Space-Used-Percentage.[{#SNMPVALUE}].last()}>=95</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 10%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:File-System-Space-Used-Percentage.[{#SNMPVALUE}].last()}>=90</p><p>**Recovery expression**: </p>|warning|
|Interface [{#SNMPVALUE}] on {HOST.HOST1} - DOWN|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Interface-Admin-Status.[{#SNMPVALUE}].last()}=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - DOWN|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Interface-Operation-Status.[{#SNMPVALUE}].last()}=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - IN Error|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Interface-IN-Error.[{#SNMPVALUE}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|Service [{#VMWARESVC}] high CPU usage on {HOST.HOST1}|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:Process-Usage-[{#VMWARESVC}].avg(5m)}>90</p><p>**Recovery expression**: </p>|average|
|Service [{#VMWARESVC}] not running on {HOST.HOST1}|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Process-Status-[{#VMWARESVC}].nodata(5m)}=1</p><p>**Recovery expression**: </p>|high|
|Interface [{#SNMPVALUE}] on {HOST.HOST1} - DOWN (LLD)|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Interface-Admin-Status.[{#SNMPVALUE}].last()}=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - DOWN (LLD)|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Interface-Operation-Status.[{#SNMPVALUE}].last()}=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - IN Error (LLD)|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Interface-IN-Error.[{#SNMPVALUE}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|High CPU {#SNMPINDEX} Utilization on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Charge-CPU-.[{#SNMPINDEX}].avg(5m)}>90</p><p>**Recovery expression**: </p>|average|
|Service [{#VMWARESVC}] high CPU usage on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:Process-Usage-[{#VMWARESVC}].avg(5m)}>90</p><p>**Recovery expression**: </p>|average|
|Service [{#VMWARESVC}] not running on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:SNMP-Process-Status-[{#VMWARESVC}].nodata(5m)}=1</p><p>**Recovery expression**: </p>|high|
|Free Space File System  {#SNMPVALUE}  -< 1%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:File-System-Space-Used-Percentage.[{#SNMPVALUE}].last()}>=99</p><p>**Recovery expression**: </p>|high|
|Free Space File System  {#SNMPVALUE}  -< 5%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:File-System-Space-Used-Percentage.[{#SNMPVALUE}].last()}>=95</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 10%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: {vCenter_SNMP-VMWARE_VCSA_6.7:File-System-Space-Used-Percentage.[{#SNMPVALUE}].last()}>=90</p><p>**Recovery expression**: </p>|warning|
