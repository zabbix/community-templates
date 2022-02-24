# vCenter_SNMP-VMWARE_VCSA_6.5

## Description

vCenter 6.5 Usage 5318154

## Overview

Reprocessing [https://share.zabbix.com/virtualization/vmware/snmp-check-vcenter](virtualization/vmware/snmp-check-vcenter)


for Zabbix 3.0.4 and VCSA 6.5 (5318154)


Thanks [Olivier LAHOUZE](owner/li_mVlS9YBOhr)



## Author

Dorin Sergey

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network|<p>-</p>|`SNMP agent`|snmp.network.discovery<p>Update: 180</p>|
|CPU|<p>-</p>|`SNMP agent`|snmp.CPU.discovery<p>Update: 3600</p>|
|File System|<p>-</p>|`SNMP agent`|snmp.filesystem.discovery<p>Update: 180</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Process vmware-cm Perf CPU|<p>VMware Component Manager</p>|`SNMP agent`|SNMP-Process-vmware_cm-Perf-CPU<p>Update: 180</p>|
|Process vmware-vsm Perf CPU|<p>VMware vService Manager</p>|`SNMP agent`|SNMP-Process-vmware_vsm-Perf-CPU<p>Update: 180</p>|
|Process vmware-cis-license Perf Memory|<p>VMware License Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_cis_license-Perf-Memory<p>Update: 180</p>|
|Process vmware-vsm Perf Memory|<p>VMware vService Manager Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vsm-Perf-Memory<p>Update: 180</p>|
|Process vmware-syslog-health Perf Memory|<p>VMware Syslog Health Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_syslog_health-Perf-Memory<p>Update: 180</p>|
|Process vmware-sts-idmd Perf CPU|<p>VMware Identity Management Service</p>|`SNMP agent`|SNMP-Process-vmware_sts_idmd-Perf-CPU<p>Update: 180</p>|
|Process vmware-rhttpproxy Status|<p>VMware HTTP Reverse Proxy</p>|`SNMP agent`|SNMP-Process-vmware_rhttpproxy-Status<p>Update: 180</p>|
|Process vmware-rhttpproxy Perf Memory|<p>VMware HTTP Reverse Proxy Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_rhttpproxy-Perf-Memory<p>Update: 180</p>|
|Process vmware-vapi-endpoint Perf CPU|<p>VMware vAPI Endpoint</p>|`SNMP agent`|SNMP-Process-vmware_vapi_endpoint-Perf-CPU<p>Update: 180</p>|
|Process vmware-sts-idmd Status|<p>VMware Identity Management Service</p>|`SNMP agent`|SNMP-Process-vmware_sts_idmd-Status<p>Update: 180</p>|
|Process vmware-vsan-health Perf CPU|<p>VMware vSAN Health Service</p>|`SNMP agent`|SNMP-Process-vmware_vsan_health-Perf-CPU<p>Update: 180</p>|
|Process vmware-stsd Perf Memory|<p>VMware Security Token Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_stsd-Perf-Memory<p>Update: 180</p>|
|Process vmware-syslog-health Perf CPU|<p>VMware Syslog Health Service</p>|`SNMP agent`|SNMP-Process-vmware_syslog_health-Perf-CPU<p>Update: 180</p>|
|Process vmware-syslog-health Status|<p>VMware Syslog Health Service</p>|`SNMP agent`|SNMP-Process-vmware_syslog_health-Status<p>Update: 180</p>|
|Process vmware-perfcharts Status|<p>VMware Performance Charts</p>|`SNMP agent`|SNMP-Process-vmware_perfcharts-Status<p>Update: 180</p>|
|Process vmware-perfcharts Perf CPU|<p>VMware Performance Charts</p>|`SNMP agent`|SNMP-Process-vmware_perfcharts-Perf-CPU<p>Update: 180</p>|
|Process vmware-eam Perf Memory|<p>VMware ESX Agent Manager Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_eam-Perf-Memory<p>Update: 180</p>|
|Name Vcenter|<p>-</p>|`SNMP agent`|SNMP-NamePlateforme<p>Update: 3600</p>|
|Process vmware-rhttpproxy Perf CPU|<p>VMware HTTP Reverse Proxy</p>|`SNMP agent`|SNMP-Process-vmware_rhttpproxy-Perf-CPU<p>Update: 180</p>|
|Process vmafdd Perf CPU|<p>VMware Authentication Framework</p>|`SNMP agent`|SNMP-Process-vmafdd-Perf-CPU<p>Update: 180</p>|
|Process vmware-psc-client Perf CPU|<p>VMware Platform Services Controller</p>|`SNMP agent`|SNMP-Process-vmware_psc_client-Perf-CPU<p>Update: 180</p>|
|Process vmcad Perf CPU|<p>VMware Certificate Service</p>|`SNMP agent`|SNMP-Process-vmcad-Perf-CPU<p>Update: 180</p>|
|Process vmware-cm Perf Memory|<p>VMware Component Manager Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_cm-Perf-Memory<p>Update: 180</p>|
|Process vmware-svcs Perf CPU|<p>VMware vSphere Profile-Driven Storage Service</p>|`SNMP agent`|SNMP-Process-vmware_svcs-Perf-CPU<p>Update: 180</p>|
|Process vmware-eam Status|<p>VMware ESX Agent Manager</p>|`SNMP agent`|SNMP-Process-vmware_eam-Status<p>Update: 180</p>|
|Process vmware-syslog Status|<p>VMware Common Logging Service</p>|`SNMP agent`|SNMP-Process-vmware_syslog-Status<p>Update: 180</p>|
|Process vmware-vpostgres Perf Memory|<p>VMware Postgres Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vpostgres-Perf-Memory<p>Update: 180</p>|
|Process vmware-tools-vgauth Status|<p>VMware Tools Guest Authentication</p>|`SNMP agent`|SNMP-Process-vmware_tools_vgauth-Status<p>Update: 180</p>|
|Process vmware-svcs Perf Memory|<p>VMware vSphere Profile-Driven Storage Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_svcs-Perf-Memory<p>Update: 180</p>|
|Process vmafdd Perf Memory|<p>VMware Authentication Framework Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmafdd-Perf-Memory<p>Update: 180</p>|
|Process vmware-stsd Perf CPU|<p>VMware Security Token Service</p>|`SNMP agent`|SNMP-Process-vmware_stsd-Perf-CPU<p>Update: 180</p>|
|Process vmware-sca Perf CPU|<p>VMware Service Control Agent</p>|`SNMP agent`|SNMP-Process-vmware_sca-Perf-CPU<p>Update: 180</p>|
|Nombre de Processus|<p>-</p>|`SNMP agent`|SNMP-Nombre-Processus<p>Update: 180</p>|
|Process vmware-vsan-health Status|<p>VMware vSAN Health Service</p>|`SNMP agent`|SNMP-Process-vmware_vsan_health-Status<p>Update: 180</p>|
|Process vmware-cm Status|<p>VMware Component Manager</p>|`SNMP agent`|SNMP-Process-vmware_cm-Status<p>Update: 180</p>|
|Process vmware-sca Perf Memory|<p>VMware Service Control Agent Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_sca-Perf-Memory<p>Update: 180</p>|
|[Exemple] Process kthreadd Fabriquant|<p>-</p>|`SNMP agent`|SNMP-Process-kthreadd-Fabriquant<p>Update: 3600</p>|
|Process vmware-cis-license Perf CPU|<p>VMware License Service</p>|`SNMP agent`|SNMP-Process-vmware_cis_license-Perf-CPU<p>Update: 180</p>|
|Process vmware-psc-client Perf Memory|<p>Platform Services Controller Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_psc_client-Perf-Memory<p>Update: 180</p>|
|Process vmware-sca Status|<p>VMware Service Control Agent</p>|`SNMP agent`|SNMP-Process-vmware_sca-Status<p>Update: 180</p>|
|Process vmware-stsd Status|<p>VMware Security Token Service</p>|`SNMP agent`|SNMP-Process-vmware_stsd-Status<p>Update: 180</p>|
|Process vmdird Perf Memory|<p>VMware Directory Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmdird-Perf-Memory<p>Update: 180</p>|
|Process vmware-vapi-endpoint Perf Memory|<p>VMware vAPI Endpoint Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vapi_endpoint-Perf-Memory<p>Update: 180</p>|
|Process vsphere-client Perf CPU|<p>vsphere-client</p>|`SNMP agent`|SNMP-Process-vsphere_client-Perf-CPU<p>Update: 180</p>|
|Process vmware-vsan-health Perf Memory|<p>VMware vSAN Health Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_vsan_health-Perf-Memory<p>Update: 180</p>|
|Ping vCenter|<p>-</p>|`Simple check`|icmpping[,2]<p>Update: 120</p>|
|Process vmware-psc-client Status|<p>Platform Services Controller</p>|`SNMP agent`|SNMP-Process-vmware_psc_client-Status<p>Update: 180</p>|
|Process vsphere-client Perf Memory|<p>vsphere-client Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vsphere_client-Perf-Memory<p>Update: 180</p>|
|Process vmware-vapi-endpoint Status|<p>VMware vAPI Endpoint</p>|`SNMP agent`|SNMP-Process-vmware_vapi_endpoint-Status<p>Update: 180</p>|
|Process vmware-tools-vgauth Perf CPU|<p>VMware Tools Guest Authentication</p>|`SNMP agent`|SNMP-Process-vmware_tools_vgauth-Perf-CPU<p>Update: 180</p>|
|Snmp Availability|<p>-</p>|`Zabbix internal`|zabbix[host,snmp,available]<p>Update: 180</p>|
|Process vmware-vsm Status|<p>VMware vService Manager</p>|`SNMP agent`|SNMP-Process-vmware_vsm-Status<p>Update: 180</p>|
|Process vmware-vpostgres Perf CPU|<p>VMware Postgres</p>|`SNMP agent`|SNMP-Process-vmware_vpostgres-Perf-CPU<p>Update: 180</p>|
|Process vmdird Status|<p>VMware Directory Service</p>|`SNMP agent`|SNMP-Process-vmdird-Status<p>Update: 180</p>|
|Process vmware-syslog Perf CPU|<p>VMware Common Logging Service</p>|`SNMP agent`|SNMP-Process-vmware_syslog-Perf-CPU<p>Update: 180</p>|
|File System Allocation Erreur|<p>Espace alloue file system</p>|`SNMP agent`|SNMP-File-System-allocation-erreur<p>Update: 180</p>|
|Process vmcad Status|<p>VMware Certificate Service</p>|`SNMP agent`|SNMP-Process-vmcad-Status<p>Update: 180</p>|
|Process vmware-perfcharts Perf Memory|<p>VMware Performance Charts Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_perfcharts-Perf-Memory<p>Update: 180</p>|
|Process vmware-syslog Perf Memory|<p>VMware Common Logging Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_syslog-Perf-Memory<p>Update: 180</p>|
|Process vmdird Perf CPU|<p>VMware Directory Service</p>|`SNMP agent`|SNMP-Process-vmdird-Perf-CPU<p>Update: 180</p>|
|Process vmware-sts-idmd Perf Memory|<p>VMware Identity Management Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_sts_idmd-Perf-Memory<p>Update: 180</p>|
|Process vmcad Perf Memory|<p>VMware Certificate Service Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmcad-Perf-Memory<p>Update: 180</p>|
|Process vmafdd Status|<p>VMware Authentication Framework</p>|`SNMP agent`|SNMP-Process-vmafdd-Status<p>Update: 180</p>|
|Process vmware-eam Perf CPU|<p>VMware ESX Agent Manager</p>|`SNMP agent`|SNMP-Process-vmware_eam-Perf-CPU<p>Update: 180</p>|
|Process vsphere-client Status|<p>vsphere-client</p>|`SNMP agent`|SNMP-Process-vsphere_client-Status<p>Update: 180</p>|
|Memory Allocation Error|<p>-</p>|`SNMP agent`|SNMP-Memory-Allocation-Error<p>Update: 180</p>|
|Process vmware-vpostgres Status|<p>VMware Postgres</p>|`SNMP agent`|SNMP-Process-vmware_vpostgres-Status<p>Update: 180</p>|
|Process vmware-svcs Status|<p>VMware vSphere Profile-Driven Storage Service</p>|`SNMP agent`|SNMP-Process-vmware_svcs-Status<p>Update: 180</p>|
|Process vmware-tools-vgauth Perf Memory|<p>VMware Tools Guest Authentication Result in Kbytes</p>|`SNMP agent`|SNMP-Process-vmware_tools_vgauth-Perf-Memory<p>Update: 180</p>|
|Process vmware-cis-license Status|<p>VMware License Service</p>|`SNMP agent`|SNMP-Process-vmware_cis_license-Status<p>Update: 180</p>|
|Interface [{#SNMPVALUE}] Admin Status|<p>-</p>|`SNMP agent`|SNMP-Interface-Admin-Status.[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Description|<p>-</p>|`SNMP agent`|SNMP-Interface-Description.[{#SNMPVALUE}]<p>Update: 1800</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] IN Error|<p>-</p>|`SNMP agent`|SNMP-Interface-IN-Error.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] IN Octets|<p>-</p>|`SNMP agent`|SNMP-Interface-IN-Octets.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] MAC|<p>-</p>|`SNMP agent`|SNMP-Interface-MAC.[{#SNMPVALUE}]<p>Update: 1800</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Operation Status|<p>-</p>|`SNMP agent`|SNMP-Interface-Operation-Status.[{#SNMPVALUE}]<p>Update: 120</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] OUT Octets|<p>-</p>|`SNMP agent`|SNMP-Interface-OUT-Octets.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|
|Interface [{#SNMPVALUE}] Type|<p>-</p>|`SNMP agent`|SNMP-Interface-Type.[{#SNMPVALUE}]<p>Update: 1800</p><p>LLD</p>|
|CPU {#SNMPINDEX} Charge|<p>-</p>|`SNMP agent`|SNMP-Charge-CPU-.[{#SNMPINDEX}]<p>Update: 180</p><p>LLD</p>|
|CPU {#SNMPINDEX} Name|<p>-</p>|`SNMP agent`|SNMP-Name-CPU-.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|File System {#SNMPVALUE} - Used Percentage|<p>-</p>|`Calculated`|File-System-Space-Used-Percentage.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|
|File System {#SNMPVALUE} - Espace Alloue|<p>-</p>|`SNMP agent`|SNMP-File-System-Space-Allocated.[{#SNMPVALUE}]<p>Update: 600</p><p>LLD</p>|
|File System {#SNMPVALUE} - Espace Utilise|<p>-</p>|`SNMP agent`|SNMP-File-System-Space-Used.[{#SNMPVALUE}]<p>Update: 180</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Free Space File System  {#SNMPVALUE}  -< 1%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=99</p><p>**Recovery expression**: </p>|high|
|Free Space File System  {#SNMPVALUE}  -< 5%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=95</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 10%- on {HOST.HOST1}|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=90</p><p>**Recovery expression**: </p>|warning|
|Interface [{#SNMPVALUE}] on {HOST.HOST1} - DOWN|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/SNMP-Interface-Admin-Status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - DOWN|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/SNMP-Interface-Operation-Status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - IN Error|<p>-</p>|<p>**Expression**: (last(/vCenter_SNMP-VMWARE_VCSA_6.5/SNMP-Interface-IN-Error.[{#SNMPVALUE}],#1)<>last(/vCenter_SNMP-VMWARE_VCSA_6.5/SNMP-Interface-IN-Error.[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|warning|
|Interface [{#SNMPVALUE}] on {HOST.HOST1} - DOWN (LLD)|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/SNMP-Interface-Admin-Status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - DOWN (LLD)|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/SNMP-Interface-Operation-Status.[{#SNMPVALUE}])=0</p><p>**Recovery expression**: </p>|average|
|Interface [{#SNMPVALUE}]  on {HOST.HOST1} - IN Error (LLD)|<p>-</p>|<p>**Expression**: (last(/vCenter_SNMP-VMWARE_VCSA_6.5/SNMP-Interface-IN-Error.[{#SNMPVALUE}],#1)<>last(/vCenter_SNMP-VMWARE_VCSA_6.5/SNMP-Interface-IN-Error.[{#SNMPVALUE}],#2))=1</p><p>**Recovery expression**: </p>|warning|
|Free Space File System  {#SNMPVALUE}  -< 1%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=99</p><p>**Recovery expression**: </p>|high|
|Free Space File System  {#SNMPVALUE}  -< 5%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=95</p><p>**Recovery expression**: </p>|average|
|Free Space File System  {#SNMPVALUE}  -< 10%- on {HOST.HOST1} (LLD)|<p>-</p>|<p>**Expression**: last(/vCenter_SNMP-VMWARE_VCSA_6.5/File-System-Space-Used-Percentage.[{#SNMPVALUE}])>=90</p><p>**Recovery expression**: </p>|warning|
