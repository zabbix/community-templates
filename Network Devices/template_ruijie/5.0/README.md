# Ruijie BBU

## Overview

锐捷小站设备资源监测模板



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|cpu multiple discovery|<p>-</p>|`Zabbix agent`|system.cpu.discovery<p>Update: 30s</p>|
|UE Discovery|<p>-</p>|`Zabbix trapper`|ue.discovery<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|process_id[rg-bspinfo]|<p>-</p>|`Zabbix agent`|process_id[rg-bspinfo]<p>Update: 30s</p>|
|process_id[password_policy]|<p>-</p>|`Zabbix agent`|process_id[password_policy]<p>Update: 30s</p>|
|gnb_cu_pdcp 内存|<p>-</p>|`Zabbix agent`|process.gnb_cu_pdcp.memory<p>Update: 30s</p>|
|aaad 内存|<p>-</p>|`Zabbix agent`|process.aaad.memory<p>Update: 30s</p>|
|rgmomd 内存|<p>-</p>|`Zabbix agent`|process.rgmomd.memory<p>Update: 30s</p>|
|process_id[rg-sysmon]|<p>-</p>|`Zabbix agent`|process_id[rg-sysmon]<p>Update: 30s</p>|
|process_id[oam_apps]|<p>-</p>|`Zabbix agent`|process_id[oam_apps]<p>Update: 30s</p>|
|process_id[fhmp-serverd.elf]|<p>-</p>|`Zabbix agent`|process_id[fhmp-serverd.elf]<p>Update: 30s</p>|
|gnb_du_layer2 内存|<p>-</p>|`Zabbix agent`|process.gnb_du_layer2.memory<p>Update: 30s</p>|
|testio.iotop|<p>-</p>|`Zabbix agent`|testio.iotop<p>Update: 10s</p>|
|oam_apps 内存|<p>-</p>|`Zabbix agent`|process.oam_apps.memory<p>Update: 30s</p>|
|rg-coredump-mon 内存|<p>-</p>|`Zabbix agent`|process.rg-coredump-mon.memory<p>Update: 30s</p>|
|process_id[cwmp_gsoap.elf]|<p>-</p>|`Zabbix agent`|process_id[cwmp_gsoap.elf]<p>Update: 30s</p>|
|du_oam_core 内存|<p>-</p>|`Zabbix agent`|process.du_oam_core.memory<p>Update: 30s</p>|
|rg-fsui 内存|<p>-</p>|`Zabbix agent`|process.rg-fsui.memory<p>Update: 30s</p>|
|process_id[rg-fsui]|<p>-</p>|`Zabbix agent`|process_id[rg-fsui]<p>Update: 30s</p>|
|系统内存|<p>-</p>|`Zabbix agent`|vm.memory.size[used]<p>Update: 30s</p>|
|process_id[dhcpd.elf]|<p>-</p>|`Zabbix agent`|process_id[dhcpd.elf]<p>Update: 30s</p>|
|process_id[aaad]|<p>-</p>|`Zabbix agent`|process_id[aaad]<p>Update: 30s</p>|
|cu_oam_core 内存|<p>-</p>|`Zabbix agent`|process.cu_oam_core.memory<p>Update: 30s</p>|
|fhmp-serverd 内存|<p>-</p>|`Zabbix agent`|process.fhmp-serverd.memory<p>Update: 30s</p>|
|process_id[gnb_du_layer2]|<p>-</p>|`Zabbix agent`|process_id[gnb_du_layer2]<p>Update: 30s</p>|
|process_id[cu_oam_core]|<p>-</p>|`Zabbix agent`|process_id[cu_oam_core]<p>Update: 30s</p>|
|process_id[rg-coredump-mon]|<p>-</p>|`Zabbix agent`|process_id[rg-coredump-mon]<p>Update: 30s</p>|
|process_id[redis-server]|<p>-</p>|`Zabbix agent`|process_id[redis-server]<p>Update: 30s</p>|
|dhcpc 内存|<p>-</p>|`Zabbix agent`|process.dhcpc.memory<p>Update: 30s</p>|
|process_id[cwmp.elf]|<p>-</p>|`Zabbix agent`|process_id[cwmp.elf]<p>Update: 30s</p>|
|系统CPU使用率|<p>-</p>|`Zabbix agent`|system.cpu.util[]<p>Update: 30s</p>|
|process_id[dev_mgr.elf]|<p>-</p>|`Zabbix agent`|process_id[dev_mgr.elf]<p>Update: 30s</p>|
|upgrade_proc 内存|<p>-</p>|`Zabbix agent`|process.upgrade_proc.memory<p>Update: 30s</p>|
|cwmp_gsoap 内存|<p>-</p>|`Zabbix agent`|process.cwmp_gsoap.memory<p>Update: 30s</p>|
|dev_mgr 内存|<p>-</p>|`Zabbix agent`|process.dev_mgr.memory<p>Update: 30s</p>|
|top1 进程读速率|<p>-</p>|`Zabbix agent`|process.io.read[1]<p>Update: 10s</p>|
|top1 io进程名|<p>-</p>|`Zabbix agent`|process.io.name[1]<p>Update: 10s</p>|
|runsh 内存|<p>-</p>|`Zabbix agent`|process.runsh.memory<p>Update: 30s</p>|
|系统磁盘读速率|<p>-</p>|`Zabbix agent`|system.io.read<p>Update: 10s</p>|
|process_id[cli_server.elf]|<p>-</p>|`Zabbix agent`|process_id[cli_server.elf]<p>Update: 30s</p>|
|cwmp 内存|<p>-</p>|`Zabbix agent`|process.cwmp.memory<p>Update: 30s</p>|
|top2 io进程名|<p>-</p>|`Zabbix agent`|process.io.name[2]<p>Update: 10s</p>|
|系统Coredump文件|<p>-</p>|`Zabbix agent`|system.coredump.files<p>Update: 10s</p>|
|upgrade_mgmt 内存|<p>-</p>|`Zabbix agent`|process.upgrade_mgmt.memory<p>Update: 30s</p>|
|process_id[gnb_cu_pdcp]|<p>-</p>|`Zabbix agent`|process_id[gnb_cu_pdcp]<p>Update: 30s</p>|
|redis-server 内存|<p>-</p>|`Zabbix agent`|process.redis-server.memory<p>Update: 30s</p>|
|webagent 内存|<p>-</p>|`Zabbix agent`|process.webagent.memory<p>Update: 30s</p>|
|sysha 内存|<p>-</p>|`Zabbix agent`|process.sysha.memory<p>Update: 30s</p>|
|rg-sysmon 内存|<p>-</p>|`Zabbix agent`|process.rg-sysmon.memory<p>Update: 30s</p>|
|password_policy 内存|<p>-</p>|`Zabbix agent`|process.password_policy.memory<p>Update: 30s</p>|
|process_id[dhcpc.elf]|<p>-</p>|`Zabbix agent`|process_id[dhcpc.elf]<p>Update: 30s</p>|
|系统出口流量|<p>-</p>|`Zabbix agent`|net.if.out[eth1,]<p>Update: 1s</p>|
|系统入口流量|<p>-</p>|`Zabbix agent`|net.if.in[eth1,]<p>Update: 1s</p>|
|系统剩余内存|<p>-</p>|`Zabbix agent`|system.memory.a_free<p>Update: 30s</p>|
|cli_server 内存|<p>-</p>|`Zabbix agent`|process.cli_server.memory<p>Update: 30s</p>|
|rg-bspinfo 内存|<p>-</p>|`Zabbix agent`|process.rg-bspinfo.memory<p>Update: 30s</p>|
|top1 进程写速率|<p>-</p>|`Zabbix agent`|process.io.write[1]<p>Update: 10s</p>|
|系统磁盘写速率|<p>-</p>|`Zabbix agent`|system.io.write<p>Update: 10s</p>|
|dhcpd 内存|<p>-</p>|`Zabbix agent`|process.dhcpd.memory<p>Update: 30s</p>|
|系统僵尸进程|<p>-</p>|`Zabbix agent`|system.zombie.name<p>Update: 30s</p>|
|process_id[du_oam_core]|<p>-</p>|`Zabbix agent`|process_id[du_oam_core]<p>Update: 30s</p>|
|CPU{#CPU.NUMBER}利用率|<p>-</p>|`Zabbix agent`|system.cpu.util[{#CPU.NUMBER},,]<p>Update: 10s</p><p>LLD</p>|
|UE{#NUMBER} DL MCS|<p>-</p>|`Zabbix trapper`|ue.dl.mcs[{#NUMBER}]<p>Update: 0</p><p>LLD</p>|
|UE{#NUMBER} DL RadioBearer|<p>-</p>|`Zabbix trapper`|ue.dl.rb[{#NUMBER}]<p>Update: 0</p><p>LLD</p>|
|UE{#NUMBER} DL|<p>-</p>|`Zabbix trapper`|ue.dl[{#NUMBER}]<p>Update: 0</p><p>LLD</p>|
|UE{#NUMBER} UL MCS|<p>-</p>|`Zabbix trapper`|ue.ul.mcs[{#NUMBER}]<p>Update: 0</p><p>LLD</p>|
|UE{#NUMBER} UL SR_BSR|<p>-</p>|`Zabbix trapper`|ue.ul.sr_bsr[{#NUMBER}]<p>Update: 0</p><p>LLD</p>|
|UE{#NUMBER} UL|<p>-</p>|`Zabbix trapper`|ue.ul[{#NUMBER}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|UE {#NUMBER} RB ERROR|<p>-</p>|<p>**Expression**: {Ruijie BBU:ue.dl.rb[{#NUMBER}].regexp(FAIL)}=1</p><p>**Recovery expression**: {Ruijie BBU:ue.dl.rb[{#NUMBER}].regexp(PASS)}=1</p>|average|
|UE {#NUMBER} RB ERROR (LLD)|<p>-</p>|<p>**Expression**: {Ruijie BBU:ue.dl.rb[{#NUMBER}].regexp(FAIL)}=1</p><p>**Recovery expression**: {Ruijie BBU:ue.dl.rb[{#NUMBER}].regexp(PASS)}=1</p>|average|
