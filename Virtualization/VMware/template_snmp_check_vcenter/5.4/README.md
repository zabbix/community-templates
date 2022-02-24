# SNMP-VMWARE-Supervision_SNMPv2_vCenter

## Description

Check host vCenter with SNMP. /! Must be vCenter 6.0.2a or later /! 

## Overview

Template for supervision SNMP of vCenter.




---


**/!\** vCenter **6.0.2a** or later (error with previous version: <https://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2145388>) **/!\**




---


**Note1**: Triggers for services check use timer of 70 sec because check SNMP is configured with 60sec. If you change timer SNMP, change timer trigger


**Note 2**: SNMP check of CPU is not usable because it return alwaus 100%


**Note 3:** I have not Zabbix <3.0 in my DC. If you could test this template on Zabbix < 3.0, tell me if all is OK.


Thanks


 


 



## Author

LAHOUZE Olivier

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|``|Text macro|
|{$SNMP_PORT}|<p>-</p>|`161`|Text macro|
|{$VERSIONPOSTGRES}|<p>-</p>|`9.3`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU|<p>-</p>|`SNMP agent`|snmp.CPU.discovery<p>Update: 3600</p>|
|File System|<p>-</p>|`SNMP agent`|snmp.filesystem.discovery<p>Update: 60</p>|
|Network|<p>-</p>|`SNMP agent`|snmp.network.discovery<p>Update: 60</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Process vmware-stsd Perf Memory|<p>VMware Security Token Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_stsd-Perf-Memory<p>Update: 60</p>|
|Process vmware-eam Status|<p>VMware ESX Agent Manager</p>|`SNMP agent`|SNMP-Process-vmware_eam-Status<p>Update: 60</p>|
|Process vmware-vsan-health Perf Memory|<p>VMware vSAN Health Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vsan_health-Perf-Memory<p>Update: 60</p>|
|Process vmware-sca Perf CPU|<p>VMware Service Control Agent</p>|`SNMP agent`|SNMP-Process-vmware_sca-Perf-CPU<p>Update: 60</p>|
|Process vmafdd Perf CPU|<p>VMware Authentication Framework</p>|`SNMP agent`|SNMP-Process-vmafdd-Perf-CPU<p>Update: 60</p>|
|Process vmware-psc-client Perf Memory|<p>Platform Services Controller Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_psc_client-Perf-Memory<p>Update: 60</p>|
|Process vmware-cis-license Perf Memory|<p>VMware License Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_cis_license-Perf-Memory<p>Update: 60</p>|
|Process vmware-invsvc Status|<p>VMware Inventory Service</p>|`SNMP agent`|SNMP-Process-vmware_invsvc-Status<p>Update: 60</p>|
|Process vmware-stsd Perf CPU|<p>VMware Security Token Service</p>|`SNMP agent`|SNMP-Process-vmware_stsd-Perf-CPU<p>Update: 60</p>|
|Name Vcenter|<p>-</p>|`SNMP agent`|SNMP-NamePlateforme<p>Update: 3600</p>|
|Process vmware-vsm Status|<p>VMware vService Manager</p>|`SNMP agent`|SNMP-Process-vmware_vsm-Status<p>Update: 60</p>|
|Process vmware-vpostgres Status|<p>VMware Postgres</p>|`SNMP agent`|SNMP-Process-vmware_vpostgres-Status<p>Update: 60</p>|
|Process vmware-netdumper Status|<p>VMware vSphere ESXi Dump Collector</p>|`SNMP agent`|SNMP-Process-vmware_netdumper-Status<p>Update: 60</p>|
|Process vmware-rhttpproxy Perf CPU|<p>VMware HTTP Reverse Proxy</p>|`SNMP agent`|SNMP-Process-vmware_rhttpproxy-Perf-CPU<p>Update: 60</p>|
|Process vmware-vsan-health Status|<p>VMware vSAN Health Service</p>|`SNMP agent`|SNMP-Process-vmware_vsan_health-Status<p>Update: 60</p>|
|Process vmdird Perf Memory|<p>VMware Directory Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmdird-Perf-Memory<p>Update: 60</p>|
|File System Allocation Erreur|<p>Espace alloue file system</p>|`SNMP agent`|SNMP-File-System-allocation-erreur<p>Update: 60</p>|
|Process vmware-cm Status|<p>VMware Component Manager</p>|`SNMP agent`|SNMP-Process-vmware_cm-Status<p>Update: 60</p>|
|Process vmware-vpxd Perf Memory|<p>Demon vCenter Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vpxd-Perf-Memory<p>Update: 60</p>|
|Process vmware-sts-idmd Perf Memory|<p>VMware Identity Management Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_sts_idmd-Perf-Memory<p>Update: 60</p>|
|Process vmware-vpx-workflow Perf Memory|<p>VMware vCenter Workflow Manager Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vpx_workflow-Perf-Memory<p>Update: 60</p>|
|Process vmware-vpostgres Perf Memory|<p>VMware Postgres Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vpostgres-Perf-Memory<p>Update: 60</p>|
|Process vmware-vpxd Perf CPU|<p>Demon vCenter</p>|`SNMP agent`|SNMP-Process-vmware_vpxd-Perf-CPU<p>Update: 60</p>|
|Process vmware-invsvc Perf Memory|<p>VMware Inventory Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_invsvc-Perf-Memory<p>Update: 60</p>|
|Process vmware-vapi-endpoint Perf Memory|<p>VMware vAPI Endpoint Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vapi_endpoint-Perf-Memory<p>Update: 60</p>|
|Process vmware-vpx-workflow Perf CPU|<p>VMware vCenter Workflow Manager</p>|`SNMP agent`|SNMP-Process-vmware_vpx_workflow-Perf-CPU<p>Update: 60</p>|
|Process vmware-sps Status|<p>VMware vSphere Profile-Driven Storage Service</p>|`SNMP agent`|SNMP-Process-vmware_sps-Status<p>Update: 60</p>|
|Process vmware-vpx-workflow Status|<p>VMware vCenter Workflow Manager</p>|`SNMP agent`|SNMP-Process-vmware_vpx_workflow-Status<p>Update: 60</p>|
|Process vmware-rhttpproxy Perf Memory|<p>VMware HTTP Reverse Proxy Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_rhttpproxy-Perf-Memory<p>Update: 60</p>|
|Process vmware-vsan-health Perf CPU|<p>VMware vSAN Health Service</p>|`SNMP agent`|SNMP-Process-vmware_vsan_health-Perf-CPU<p>Update: 60</p>|
|Process vsphere-client Perf Memory|<p>vsphere-client Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vsphere_client-Perf-Memory<p>Update: 60</p>|
|[Exemple] Process kthreadd Fabriquant|<p>-</p>|`SNMP agent`|SNMP-Process-kthreadd-Fabriquant<p>Update: 3600</p>|
|Process vmware-vapi-endpoint Status|<p>VMware vAPI Endpoint</p>|`SNMP agent`|SNMP-Process-vmware_vapi_endpoint-Status<p>Update: 60</p>|
|Process vmware-rbd-watchdog Status|<p>VMware vSphere Auto Deploy Waiter</p>|`SNMP agent`|SNMP-Process-vmware_rbd_watchdog-Status<p>Update: 60</p>|
|Process vmware-cis-license Status|<p>VMware License Service</p>|`SNMP agent`|SNMP-Process-vmware_cis_license-Status<p>Update: 60</p>|
|Process vmdird Perf CPU|<p>VMware Directory Service</p>|`SNMP agent`|SNMP-Process-vmdird-Perf-CPU<p>Update: 60</p>|
|Process vmware-syslog Perf Memory|<p>VMware Common Logging Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_syslog-Perf-Memory<p>Update: 60</p>|
|Process vmware-vdcs Status|<p>VMware Content Library Service</p>|`SNMP agent`|SNMP-Process-vmware_vdcs-Status<p>Update: 60</p>|
|Process vmware-syslog-health Perf Memory|<p>VMware Syslog Health Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_syslog_health-Perf-Memory<p>Update: 60</p>|
|Process vmware-perfcharts Perf Memory|<p>VMware Performance Charts Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_perfcharts-Perf-Memory<p>Update: 60</p>|
|Process vmware-netdumper Perf Memory|<p>VMware vSphere ESXi Dump Collector Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_netdumper-Perf-Memory<p>Update: 60</p>|
|Process vmware-tools-vgauth Status|<p>VMware Tools Guest Authentication</p>|`SNMP agent`|SNMP-Process-vmware_tools_vgauth-Status<p>Update: 60</p>|
|Process vsphere-client Perf CPU|<p>vsphere-client</p>|`SNMP agent`|SNMP-Process-vsphere_client-Perf-CPU<p>Update: 60</p>|
|Process vmware-syslog-health Perf CPU|<p>VMware Syslog Health Service</p>|`SNMP agent`|SNMP-Process-vmware_syslog_health-Perf-CPU<p>Update: 60</p>|
|Process vmware-vpostgres Perf CPU|<p>VMware Postgres</p>|`SNMP agent`|SNMP-Process-vmware_vpostgres-Perf-CPU<p>Update: 60</p>|
|Process vmware-vws Status|<p>VMware System and Hardware Health Manager</p>|`SNMP agent`|SNMP-Process-vmware_vws-Status<p>Update: 60</p>|
|Process vmware-syslog Status|<p>VMware Common Logging Service</p>|`SNMP agent`|SNMP-Process-vmware_syslog-Status<p>Update: 60</p>|
|Process vmcad Perf Memory|<p>VMware Certificate Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmcad-Perf-Memory<p>Update: 60</p>|
|Process vmcad Status|<p>VMware Certificate Service</p>|`SNMP agent`|SNMP-Process-vmcad-Status<p>Update: 60</p>|
|Process vmware-cm Perf Memory|<p>VMware Component Manager Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_cm-Perf-Memory<p>Update: 60</p>|
|Process vmware-psc-client Perf CPU|<p>VMware Platform Services Controller</p>|`SNMP agent`|SNMP-Process-vmware_psc_client-Perf-CPU<p>Update: 60</p>|
|Process vmdird Status|<p>VMware Directory Service</p>|`SNMP agent`|SNMP-Process-vmdird-Status<p>Update: 60</p>|
|Snmp Availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 60</p>|
|Process vmware-sps Perf Memory|<p>VMware vSphere Profile-Driven Storage Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_sps-Perf-Memory<p>Update: 60</p>|
|Process vmware-vws Perf CPU|<p>VMware System and Hardware Health Manager</p>|`SNMP agent`|SNMP-Process-vmware_vws-Perf-CPU<p>Update: 60</p>|
|Process vmware-syslog Perf CPU|<p>VMware Common Logging Service</p>|`SNMP agent`|SNMP-Process-vmware_syslog-Perf-CPU<p>Update: 60</p>|
|Process vmware-psc-client Status|<p>Platform Services Controller</p>|`SNMP agent`|SNMP-Process-vmware_psc_client-Status<p>Update: 60</p>|
|Process vmware-sps Perf CPU|<p>VMware vSphere Profile-Driven Storage Service</p>|`SNMP agent`|SNMP-Process-vmware_sps-Perf-CPU<p>Update: 60</p>|
|Process vmware-rhttpproxy Status|<p>VMware HTTP Reverse Proxy</p>|`SNMP agent`|SNMP-Process-vmware_rhttpproxy-Status<p>Update: 60</p>|
|Process vmware-stsd Status|<p>VMware Security Token Service</p>|`SNMP agent`|SNMP-Process-vmware_stsd-Status<p>Update: 60</p>|
|Process vmware-mbcs Status|<p>VMware Message Bus Configuration Service</p>|`SNMP agent`|SNMP-Process-vmware_mbcs-Status<p>Update: 60</p>|
|Process vmafdd Status|<p>VMware Authentication Framework</p>|`SNMP agent`|SNMP-Process-vmafdd-Status<p>Update: 60</p>|
|Process vmware-tools-vgauth Perf CPU|<p>VMware Tools Guest Authentication</p>|`SNMP agent`|SNMP-Process-vmware_tools_vgauth-Perf-CPU<p>Update: 60</p>|
|Process vmware-vsm Perf Memory|<p>VMware vService Manager Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vsm-Perf-Memory<p>Update: 60</p>|
|Process vmware-tools-vgauth Perf Memory|<p>VMware Tools Guest Authentication Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_tools_vgauth-Perf-Memory<p>Update: 60</p>|
|Process vmware-vdcs Perf Memory|<p>VMware Content Library Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vdcs-Perf-Memory<p>Update: 60</p>|
|Process vmware-netdumper Perf CPU|<p>VMware vSphere ESXi Dump Collector</p>|`SNMP agent`|SNMP-Process-vmware_netdumper-Perf-CPU<p>Update: 60</p>|
|Process vmware-sts-idmd Status|<p>VMware Identity Management Service</p>|`SNMP agent`|SNMP-Process-vmware_sts_idmd-Status<p>Update: 60</p>|
|Nombre de Processus|<p>-</p>|`SNMP agent`|SNMP-Nombre-Processus<p>Update: 60</p>|
|Process vmware-mbcs Perf CPU|<p>VMware Message Bus Configuration Service</p>|`SNMP agent`|SNMP-Process-vmware_mbcs-Perf-CPU<p>Update: 60</p>|
|Process vmware-vdcs Perf CPU|<p>VMware Content Library Service</p>|`SNMP agent`|SNMP-Process-vmware_vdcs-Perf-CPU<p>Update: 60</p>|
|Process vmware-rbd-watchdog Perf CPU|<p>VMware vSphere Auto Deploy Waiter</p>|`SNMP agent`|SNMP-Process-vmware_rbd_watchdog-Perf-CPU<p>Update: 60</p>|
|Memory Allocation Error|<p>-</p>|`SNMP agent`|SNMP-Memory-Allocation-Error<p>Update: 60</p>|
|Process vmware-cm Perf CPU|<p>VMware Component Manager</p>|`SNMP agent`|SNMP-Process-vmware_cm-Perf-CPU<p>Update: 60</p>|
|Process vmware-vpxd Status|<p>Demon vCenter</p>|`SNMP agent`|SNMP-Process-vmware_vpxd-Status<p>Update: 60</p>|
|Process vmware-syslog-health Status|<p>VMware Syslog Health Service</p>|`SNMP agent`|SNMP-Process-vmware_syslog_health-Status<p>Update: 60</p>|
|Process vmafdd Perf Memory|<p>VMware Authentication Framework Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmafdd-Perf-Memory<p>Update: 60</p>|
|Process vmware-sca Perf Memory|<p>VMware Service Control Agent Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_sca-Perf-Memory<p>Update: 60</p>|
|Ping vCenter|<p>-</p>|`Simple check`|icmpping[,2]<p>Update: 30</p>|
|Process vmware-perfcharts Perf CPU|<p>VMware Performance Charts</p>|`SNMP agent`|SNMP-Process-vmware_perfcharts-Perf-CPU<p>Update: 60</p>|
|Process vmware-eam Perf CPU|<p>VMware ESX Agent Manager</p>|`SNMP agent`|SNMP-Process-vmware_eam-Perf-CPU<p>Update: 60</p>|
|Process vmware-cis-license Perf CPU|<p>VMware License Service</p>|`SNMP agent`|SNMP-Process-vmware_cis_license-Perf-CPU<p>Update: 60</p>|
|Process vmware-perfcharts Status|<p>VMware Performance Charts</p>|`SNMP agent`|SNMP-Process-vmware_perfcharts-Status<p>Update: 60</p>|
|Process vmcad Perf CPU|<p>VMware Certificate Service</p>|`SNMP agent`|SNMP-Process-vmcad-Perf-CPU<p>Update: 60</p>|
|Process vmware-vsm Perf CPU|<p>VMware vService Manager</p>|`SNMP agent`|SNMP-Process-vmware_vsm-Perf-CPU<p>Update: 60</p>|
|Process vmware-vws Perf Memory|<p>VMware System and Hardware Health Manager Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vws-Perf-Memory<p>Update: 60</p>|
|Process vmware-sts-idmd Perf CPU|<p>VMware Identity Management Service</p>|`SNMP agent`|SNMP-Process-vmware_sts_idmd-Perf-CPU<p>Update: 60</p>|
|Process vmware-vapi-endpoint Perf CPU|<p>VMware vAPI Endpoint</p>|`SNMP agent`|SNMP-Process-vmware_vapi_endpoint-Perf-CPU<p>Update: 60</p>|
|Process vmware-mbcs Perf Memory|<p>VMware Message Bus Configuration Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_mbcs-Perf-Memory<p>Update: 60</p>|
|Process vmware-invsvc Perf CPU|<p>VMware Inventory Service</p>|`SNMP agent`|SNMP-Process-vmware_invsvc-Perf-CPU<p>Update: 60</p>|
|Process vsphere-client Status|<p>vsphere-client</p>|`SNMP agent`|SNMP-Process-vsphere_client-Status<p>Update: 60</p>|
|Process vmware-sca Status|<p>VMware Service Control Agent</p>|`SNMP agent`|SNMP-Process-vmware_sca-Status<p>Update: 60</p>|
|Process vmware-eam Perf Memory|<p>VMware ESX Agent Manager Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_eam-Perf-Memory<p>Update: 60</p>|
|Process vmware-rbd-watchdog Perf Memory|<p>VMware vSphere Auto Deploy Waiter Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_rbd_watchdog-Perf-Memory<p>Update: 60</p>|
|CPU {#SNMPINDEX} Charge|<p>-</p>|`SNMP agent`|SNMP-Charge-CPU-.[{#SNMPINDEX}]<p>Update: 60</p><p>LLD</p>|
|CPU {#SNMPINDEX} Name|<p>-</p>|`SNMP agent`|SNMP-Name-CPU-.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|File System {#SNMPVALUE} - Used Percentage|<p>-</p>|`Calculated`|File-System-Space-Used-Percentage.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|File System {#SNMPVALUE} - Espace Alloue|<p>-</p>|`SNMP agent`|SNMP-File-System-Space-Allocated.[{#SNMPVALUE}]<p>Update: 600</p><p>LLD</p>|
|File System {#SNMPVALUE} - Espace Utilise|<p>-</p>|`SNMP agent`|SNMP-File-System-Space-Used.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Admin Status|<p>-</p>|`SNMP agent`|SNMP-Interface-Admin-Status.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Description|<p>-</p>|`SNMP agent`|SNMP-Interface-Description.[{#SNMPVALUE}]<p>Update: 1800</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] IN Error|<p>-</p>|`SNMP agent`|SNMP-Interface-IN-Error.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] IN Octets|<p>-</p>|`SNMP agent`|SNMP-Interface-IN-Octets.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] MAC|<p>-</p>|`SNMP agent`|SNMP-Interface-MAC.[{#SNMPVALUE}]<p>Update: 1800</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Operation Status|<p>-</p>|`SNMP agent`|SNMP-Interface-Operation-Status.[{#SNMPVALUE}]<p>Update: 30</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] OUT Octets|<p>-</p>|`SNMP agent`|SNMP-Interface-OUT-Octets.[{#SNMPVALUE}]<p>Update: 60</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Type|<p>-</p>|`SNMP agent`|SNMP-Interface-Type.[{#SNMPVALUE}]<p>Update: 1800</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Free Space File System  {#SNMPVALUE}  -< 1%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=99</p><p>**Recovery expression**: </p>|high|
|Free Space File System  {#SNMPVALUE}  -< 5%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=95</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 10%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=90</p><p>**Recovery expression**: </p>|warning|
|Interface [{#SNMPVALUE}] on {HOST.HOST1} - DOWN|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/SNMP-Interface-Admin-Status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - DOWN|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/SNMP-Interface-Operation-Status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - IN Error|<p>-</p>|<p>**Expression**: (last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/SNMP-Interface-IN-Error.[{#SNMPVALUE}],#1)<>last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/SNMP-Interface-IN-Error.[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|warning|
|Free Space File System  {#SNMPVALUE}  -< 1%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=99</p><p>**Recovery expression**: </p>|high|
|Free Space File System  {#SNMPVALUE}  -< 5%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=95</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 10%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=90</p><p>**Recovery expression**: </p>|warning|
|Interface [{#SNMPVALUE}] on {HOST.HOST1} - DOWN (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/SNMP-Interface-Admin-Status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - DOWN (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/SNMP-Interface-Operation-Status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - IN Error (LLD)|<p>-</p>|<p>**Expression**: (last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/SNMP-Interface-IN-Error.[{#SNMPVALUE}],#1)<>last(/SNMP-VMWARE-Supervision_SNMPv2_vCenter/SNMP-Interface-IN-Error.[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|warning|
