# VMware ESXi 8 by SNMP — Zabbix 7.0

File import: `template_snmp_check_esxi_8.yaml` — tên template **VMware ESXi 8 by SNMP**.

Giám sát host VMware ESXi 8.0 qua SNMP agent có sẵn trên host, không cần vCenter hay VMware API. Template được viết lại hoàn toàn: file cũ trong thư mục này thực chất là bản sao template vCenter (VCSA), các process nó kiểm tra (`vpxd`, `vmdird`, `vmware-sts-idmd`…) không tồn tại trên ESXi.

Mọi OID lấy từ các MIB trong [vmware](vmware), và chỉ dùng những nhóm mà **VMWARE-ESX-AGENTCAP-MIB `vmwESX80x`** khai báo là agent ESXi 8.0 có hỗ trợ.

MIB sử dụng: **SNMPv2-MIB**, **HOST-RESOURCES-MIB**, **IF-MIB**, **VMWARE-SYSTEM-MIB**, **VMWARE-RESOURCES-MIB**, **VMWARE-VMINFO-MIB**, **VMWARE-ENV-MIB**.

> **Chưa kiểm chứng bằng `snmpwalk` trên host ESXi 8 thật.** OID và ý nghĩa giá trị theo file MIB; các điểm phụ thuộc dữ liệu thực tế của agent được ghi chú bên dưới (chuỗi trạng thái VM, `vmwSELCapacity`, loại thiết bị trong `hrDeviceTable`, tên process).

*Bản tiếng Anh: [../README.md](../README.md)*

---

# 0. Chuẩn bị host ESXi

```sh
# SNMPv2c
esxcli system snmp set --communities <community>
# datastore > 2 TB: nếu không bật, hrStorageSize bị chặn ở INT_MAX
esxcli system snmp set --largestorage true
# tuỳ chọn: gửi trap về Zabbix server/proxy
esxcli system snmp set --targets <zabbix-ip>@162/<community>
esxcli system snmp set --enable true
esxcli network firewall ruleset set --ruleset-id snmp --enabled true
esxcli system snmp get
```

Với SNMPv3 dùng `--authentication`, `--privacy`, `--engineid`, `--users` thay cho `--communities`. Phiên bản SNMP và thông tin xác thực cấu hình trên **interface của host** trong Zabbix, không nằm trong template.

Các item traffic IF-MIB dùng counter 64-bit (`Counter64`): phải poll bằng **SNMPv2c hoặc SNMPv3**, không dùng SNMPv1.

Các item trap cần `snmptrapd` + SNMP trapper của Zabbix trên server hoặc proxy.

---

# 1. Các item được giám sát

## 1.1 Kết nối và hệ thống

| Item | Key | Nguồn | Đơn vị | Chu kỳ |
| --- | --- | --- | --- | --- |
| ICMP ping | `icmpping` | simple check | | 1m |
| ICMP loss | `icmppingloss` | simple check | % | 1m |
| ICMP response time | `icmppingsec` | simple check | s | 1m |
| SNMP agent availability | `zabbix[host,snmp,available]` | internal | | 1m |
| System name | `system.name` | `1.3.6.1.2.1.1.5.0` | | 15m |
| System description | `system.descr[sysDescr.0]` | `1.3.6.1.2.1.1.1.0` | | 15m |
| System location | `system.location[sysLocation.0]` | `1.3.6.1.2.1.1.6.0` | | 15m |
| System contact details | `system.contact[sysContact.0]` | `1.3.6.1.2.1.1.4.0` | | 15m |
| System object ID | `system.objectid[sysObjectID.0]` | `1.3.6.1.2.1.1.2.0` | | 15m |
| Uptime (network) | `system.net.uptime[sysUpTime.0]` | `1.3.6.1.2.1.1.3.0` | uptime | 1m |
| Uptime (hardware) | `system.hw.uptime[hrSystemUptime.0]` | `1.3.6.1.2.1.25.1.1.0` | uptime | 1m |
| ESXi Shell sessions | `system.users.num[hrSystemNumUsers.0]` | `1.3.6.1.2.1.25.1.5.0` | | 5m |
| Number of processes | `proc.num[hrSystemProcesses.0]` | `1.3.6.1.2.1.25.1.6.0` | | 5m |

**Uptime (hardware)** tính từ lúc boot; **Uptime (network)** tính từ lúc `snmpd` khởi động, và `snmpd` khởi động lại mỗi khi chạy `esxcli system snmp set`. Vì vậy trigger restart dùng uptime hardware.

Trên ESXi, `hrSystemNumUsers` là số phiên **ESXi Shell** đang mở (theo AGENTCAP-MIB).

## 1.2 Phiên bản ESXi — VMWARE-SYSTEM-MIB

| Item | Key | OID | Chu kỳ |
| --- | --- | --- | --- |
| Product name | `vmware.product.name[vmwProdName.0]` | `1.3.6.1.4.1.6876.1.1.0` | 1h |
| Product version | `vmware.product.version[vmwProdVersion.0]` | `1.3.6.1.4.1.6876.1.2.0` | 1h |
| Product build | `vmware.product.build[vmwProdBuild.0]` | `1.3.6.1.4.1.6876.1.4.0` | 1h |
| Product update level | `vmware.product.update[vmwProdUpdate.0]` | `1.3.6.1.4.1.6876.1.5.0` | 1h |
| Product patch level | `vmware.product.patch[vmwProdPatch.0]` | `1.3.6.1.4.1.6876.1.6.0` | 1h |

Name, version, build được ghi vào host inventory (Software, OS short, Software app A).

## 1.3 CPU và RAM

| Item | Key | Nguồn | Đơn vị | Chu kỳ |
| --- | --- | --- | --- | --- |
| hrProcessorLoad walk *(master, không lưu history)* | `system.cpu.walk[hrProcessorLoad]` | walk `1.3.6.1.2.1.25.3.3.1.2` | | 1m |
| CPU utilization | `system.cpu.util` | dependent — trung bình mọi dòng | % | 1m |
| Number of logical CPUs | `system.cpu.num` | dependent — số dòng | | 1m |
| Number of physical CPUs | `vmware.cpu.num[vmwNumCPUs.0]` | `1.3.6.1.4.1.6876.3.1.1.0` | | 1h |
| Total memory (VMware) | `vmware.memory.size[vmwMemSize.0]` | `1.3.6.1.4.1.6876.3.2.1.0` ×1024 | B | 1h |
| Memory available for VMs (VMware) | `vmware.memory.avail[vmwMemAvail.0]` | `1.3.6.1.4.1.6876.3.2.3.0` ×1024 | B | 1h |

`CPU utilization` walk `hrProcessorLoad` một lần (mỗi dòng là một CPU logic, trung bình 1 phút) rồi tính trung bình bằng JSONPath — một request SNMP thay vì một request cho mỗi thread.

`vmwMemAvail` là con số **cấu hình** (`vmwMemSize − vmwMemCOS`, COS luôn = 0 trên ESXi), không phải RAM trống. Mức sử dụng thực lấy từ rule Memory discovery.

## 1.4 `Memory discovery` — HOST-RESOURCES-MIB `hrStorageTable`

Lọc: `hrStorageType` khớp `{$MEMORY.TYPE.MATCHES}` (`hrStorageRam`, dòng "Real Memory"). Discovery `1h`.

| Item | OID | Đơn vị | Chu kỳ |
| --- | --- | --- | --- |
| Total memory | `hrStorageSize` `.5` × allocation units | B | 15m |
| Used memory | `hrStorageUsed` `.6` × allocation units | B | 1m |
| Memory utilization | calculated: used / total × 100 | % | 1m |

Graph prototype: *Memory usage*.

## 1.5 `Datastore discovery` — HOST-RESOURCES-MIB `hrStorageTable`

Lọc: `hrStorageType` khớp `{$VFS.FS.FSTYPE.MATCHES}` (`hrStorageFixedDisk`) và lọc theo đường dẫn mount `{#FSNAME}`. Discovery `1h`. ESXi không báo ramdisk visorfs.

### Tên datastore

**SNMP của ESXi không có tên datastore dễ đọc.** Đã kiểm tra bằng `snmpwalk` trên host ESXi 8: `hrStorageDescr` và `hrFSMountPoint` đều trả về `/vmfs/volumes/<uuid>`, còn `hrFSRemoteMountPoint` để trống với VMFS. Một bước JavaScript cắt tiền tố thành `{#FSUUID}`, dùng cho tên item, trigger, graph, tag `datastore` và context của macro:

```
Datastore [64382f1f-e60d35ca-e545-30d042989461]: Space utilization
```

Muốn biết UUID là datastore nào, chạy `esxcli storage filesystem list` trên host (cột Mount Point và Volume Name).

### Datastore dùng chung (SAN): cần exclude, được giám sát bằng template riêng

Rule này chỉ dành cho **storage local của từng host**. Datastore VMFS nằm trên LUN SAN được mọi host trong cluster mount, và host nào cũng báo nó với cùng một UUID. Item không bị conflict vì thuộc các host khác nhau, nhưng cùng một datastore sẽ bị poll N lần và khi đầy sẽ mở N problem giống hệt nhau. **Datastore dùng chung được giám sát một lần bằng template riêng**, và phải exclude khỏi template này.

SNMP không tự phân biệt được datastore local và datastore dùng chung. Đã kiểm tra bằng `snmpwalk` trên host ESXi 8 có ổ local Dell PERC và LUN Fibre Channel Dell EMC (DGC):

- `hrDeviceDescr` có hiện model LUN (`LUN DELL PERC H730P Mini …` và `LUN DGC VRAID 5007 …`);
- nhưng không nối được datastore với LUN của nó: `hrPartitionFSIndex` trả về bộ đếm riêng của từng LUN (1, 2, … trên mọi LUN) thay vì index trong `hrFSTable`, còn `hrFSTable` không có tham chiếu tới thiết bị.

Exclude theo UUID bằng `{$VFS.FS.FSUUID.NOT_MATCHES}`, đặt trên **host group của cluster** để mọi host dùng chung một danh sách:

```sh
esxcli storage vmfs extent list          # VMFS UUID -> Device Name
esxcli storage core device list | grep -E "^naa|Display Name|Is Shared Clusterwide"
```

```
{$VFS.FS.FSUUID.NOT_MATCHES} = ^(64382f1f-e60d35ca-e545-30d042989461|68359f81-1031e575-89d4-20040fe2cdcf|6a3b5015-75bdd474-9824-30d042989461)$
```

Mỗi khi thêm datastore SAN mới, bổ sung UUID của nó vào danh sách. Item của datastore không còn khớp discovery sẽ bị xoá sau thời gian *Delete lost resources* của rule (mặc định 7 ngày).

Những gì còn lại: datastore VMFS local, volume hệ thống `OSDATA` (VMFS-L) và hai volume UUID nhỏ không có trong `esxcli storage vmfs extent list`, nhiều khả năng là phân vùng vfat `BOOTBANK1`/`BOOTBANK2` — đều gắn riêng với host. Nếu không muốn giám sát thì exclude theo cách tương tự. Datastore NFS chưa được kiểm tra; nếu xuất hiện thì exclude bằng cùng macro.

Rule *Disk device discovery* vẫn liệt kê LUN SAN, và điều đó là có chủ ý: `hrDeviceStatus` là trạng thái LUN nhìn từ chính host đó, nên LUN down trên một host là sự cố riêng của host ấy.

| Item | OID | Đơn vị | Chu kỳ |
| --- | --- | --- | --- |
| Total space | `hrStorageSize` `.5` × allocation units | B | 15m |
| Used space | `hrStorageUsed` `.6` × allocation units | B | 5m |
| Space utilization | calculated: used / total × 100 | % | 5m |

Graph prototype: *Space usage*. `hrStorageSize` là `Integer32`: không bật `--largestorage true` thì datastore > 2 TB bị cắt và phần trăm sai.

## 1.6 `Host bus adapter discovery` — VMWARE-RESOURCES-MIB `vmwHostBusAdapterTable`

Nguồn `1.3.6.1.4.1.6876.3.5.2.1` — danh sách adapter giống `esxcfg-scsidevs -a`. Discovery `1h`. Model `{#HBA.MODEL}` và driver `{#HBA.DRIVER}` lấy lúc discovery, hiển thị trong mô tả.

| Item | OID | Chu kỳ |
| --- | --- | --- |
| HBA status | `.4` `vmwHbaStatus` — unknown(1) normal(2) marginal(3) critical(4) failed(5) | 3m |

Mức template: **Number of host bus adapters** `vmware.hba.num[vmwHostBusAdapterNumber.0]` (`1.3.6.1.4.1.6876.3.5.1.0`, 15m).

Adapter phần mềm (iSCSI, NVMe/TCP…) thường báo `unknown(1)`, không sinh cảnh báo.

## 1.7 `Disk device discovery` — HOST-RESOURCES-MIB `hrDeviceTable`

Lọc: `hrDeviceType` khớp `{$ESXI.HRDEVICE.TYPE.MATCHES}` (`hrDeviceDiskStorage`). Discovery `1h`.

| Item | OID | Chu kỳ |
| --- | --- | --- |
| Device status | `1.3.6.1.2.1.25.3.2.1.5` `hrDeviceStatus` — unknown(1) running(2) warning(3) testing(4) down(5) | 3m |

Theo AGENTCAP-MIB, ESXi báo running/warning/down/unknown cho ổ đĩa, chỉ running/unknown cho NIC và luôn unknown cho CPU — nên mặc định chỉ discover ổ đĩa.

## 1.8 `Virtual machine discovery` — VMWARE-VMINFO-MIB `vmwVmTable`

| Item | Key | Chu kỳ |
| --- | --- | --- |
| vmwVmTable walk *(master, không lưu history)* | `vmware.vm.walk[vmwVmTable]` — walk `1.3.6.1.4.1.6876.2.1.1` cột 2, 4, 5, 6, 8, 9, 10 | 3m |
| Number of registered VMs | `vmware.vm.count` | 3m |
| Number of powered on / powered off / suspended VMs | `vmware.vm.count[poweredOn\|poweredOff\|suspended]` | 3m |

Rule discovery và các prototype là **dependent** của item walk, có bước JavaScript + *Discard unchanged 1h* để chỉ chạy discovery khi danh sách VM thay đổi.

| Prototype | Key | Cột nguồn | Ghi chú |
| --- | --- | --- | --- |
| Power state | `vmware.vm.power.state["{#VM.UUID}"]` | `.6` `vmwVmState` | 0 off, 1 on, 2 suspended, 3 unknown |
| Guest state | `vmware.vm.guest.state["{#VM.UUID}"]` | `.8` `vmwVmGuestState` | 0 notrunning, 1 running, 2 shuttingdown, 3 resetting, 4 standby, 5 unknown |
| Guest OS | `vmware.vm.guest.os["{#VM.UUID}"]` | `.4` `vmwVmGuestOS` | `E: …` nghĩa là VMware Tools không chạy |
| Number of vCPUs | `vmware.vm.cpu.num["{#VM.UUID}"]` | `.9` `vmwVmCpus` | |
| Configured memory | `vmware.vm.memory.size["{#VM.UUID}"]` | `.5` `vmwVmMemSize` ×1048576 | B |

**Vì sao dùng UUID thay cho SNMP index:** `vmwVmIdx` "có thể thay đổi khi reboot" (VMINFO-MIB). Nếu key theo index, sau khi host reboot history của các VM sẽ bị tráo cho nhau mà không ai biết, nên mỗi prototype chọn dòng theo `vmwVmUUID`. VM bị unregister hoặc vMotion sang host khác sẽ không khớp nữa; item chuyển sang unsupported và **bị xoá sau 7 ngày**.

Power state và guest state được JavaScript chuyển thành số sau khi đổi về chữ thường và bỏ khoảng trắng, nên chấp nhận cả `poweredOn` lẫn `powered on`.

## 1.9 Agent quản lý — HOST-RESOURCES-MIB `hrSWRunTable`

| Item | Key | Chu kỳ |
| --- | --- | --- |
| hrSWRunName walk *(master, không lưu history)* | `system.sw.walk[hrSWRunName]` — walk `1.3.6.1.2.1.25.4.2.1.2` | 5m |
| Number of hostd processes | `proc.num[hostd]` — tên khớp `{$ESXI.PROC.HOSTD.MATCHES}` | 5m |
| Number of vpxa processes | `proc.num[vpxa]` — tên khớp `{$ESXI.PROC.VPXA.MATCHES}` | 5m |

## 1.10 Phần cứng — VMWARE-ENV-MIB

| Item | Key | OID | Chu kỳ |
| --- | --- | --- | --- |
| Hardware status source | `vmware.env.source[vmwEnvSource.0]` | `1.3.6.1.4.1.6876.4.20.100.0` | 1h |
| IPMI SEL entries | `vmware.env.sel.num[vmwEnvNumber.0]` | `1.3.6.1.4.1.6876.4.20.1.0` | 15m |
| IPMI SEL capacity | `vmware.env.sel.capacity[vmwSELCapacity.0]` | `1.3.6.1.4.1.6876.4.20.30.0` | 15m |

Trên ESXi 8, `vmwEnvSource` phải là `ipmi(4)`: agent đọc trực tiếp System Event Log của BMC. Bản thân `vmwEnvTable` (các dòng SEL) là log chứ không phải bảng trạng thái nên không poll — entry mới được phát hiện qua `vmwEnvNumber` và, nếu có cấu hình trap, qua các item trap bên dưới.

## 1.11 SNMP trap

| Item | Key khớp | OID notification dưới `1.3.6.1.4.1.6876.4.1.0` |
| --- | --- | --- |
| SNMP traps (fallback) | `snmptrap.fallback` | mọi trap không khớp các item dưới |
| IPMI SEL event raised | `vmwEnvIpmiSelFull`, `…MemoryRaised`, `…PowerSupplyRaised`, `…FanRaised`, `…CpuRaised` | `.390` `.400` `.410` `.420` `.430` |
| IPMI SEL event cleared | `vmwEnvIpmiSel…Cleared` | `.401` `.411` `.421` `.431` |
| VM power state change | `vmwVmPoweredOn`, `vmwVmPoweredOff`, `vmwVmSuspended` | `.1` `.2` `.5` |
| VM heartbeat lost | `vmwVmHBLost` | `.3` |

Regex khớp notification **theo tên** (khi `snmptrapd` có nạp MIB) **hoặc theo OID số**, nên dùng được cả hai trường hợp.

## 1.12 `Network interfaces discovery` — IF-MIB

NIC vật lý (`vmnicN`, `ifType` 6) và interface VMkernel (`vmkN`). Bỏ qua loopback (`ifType` 24), interface `notPresent` và admin down. Discovery `1h`.

| Item | OID | Đơn vị | Chu kỳ |
| --- | --- | --- | --- |
| Bits received / sent | `ifHCInOctets` / `ifHCOutOctets` (64-bit) | bps | 3m |
| Inbound / outbound packets with errors | `ifInErrors` / `ifOutErrors` | /s | 3m |
| Inbound / outbound packets discarded | `ifInDiscards` / `ifOutDiscards` | /s | 3m |
| Speed | `ifHighSpeed` ×1000000 | bps | 5m |
| Operational status | `ifOperStatus` | | 1m |
| Interface type | `ifType` | | 1h |

Graph prototype: *Network traffic*. `ifAdminStatus` chỉ đọc trên ESXi.

## 1.13 Graph

*CPU utilization*, *Virtual machines* (tổng / on / off / suspended), cùng các graph prototype nêu trên.

---

# 2. Trigger cảnh báo

## 2.1 Kết nối và hệ thống

| Trigger | Mức độ | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| Unavailable by ICMP ping | HIGH | | |
| No SNMP data collection | WARNING | | Unavailable by ICMP ping |
| High ICMP ping loss | WARNING | | Unavailable by ICMP ping |
| High ICMP ping response time | WARNING | | High ICMP ping loss |
| Host has been restarted | WARNING | ✓ | No SNMP data collection |
| System name has changed | INFO | ✓ | |
| ESXi build has changed | INFO | ✓ | |
| Active ESXi Shell sessions | INFO | ✓ | |

**Host has been restarted**: `last(hrSystemUptime) < 10m` và `max(hrSystemUptime,15m) < {$UPTIME.WRAP.THRESHOLD}`. `TimeTicks` là counter 32-bit, tự quay về 0 sau 497 ngày dù không reboot; điều kiện thứ hai chặn cảnh báo giả đó.

**Active ESXi Shell sessions** bật khi `hrSystemNumUsers > {$ESXI.SHELL.SESSIONS.MAX}` (0). Host đã hardening thường tắt shell, nên có phiên nào cũng đáng biết.

## 2.2 CPU, RAM, agent quản lý

| Trigger | Mức độ | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| High CPU utilization | WARNING | | No SNMP data collection |
| High memory utilization | AVERAGE | | |
| Management agent hostd is not running | HIGH | | No SNMP data collection |
| vCenter agent vpxa is not running | AVERAGE | | hostd is not running |

- CPU: `min(system.cpu.util,5m) > {$CPU.UTIL.CRIT}` (90).
- RAM: `min(memory utilization,5m) > {$MEMORY.UTIL.MAX}` (90).
- hostd / vpxa: không có process khớp trong 10 phút. `snmpd` độc lập với `hostd` nên SNMP vẫn trả lời khi `hostd` chết. Trigger vpxa chỉ hoạt động khi `{$ESXI.VPXA.CONTROL}=1` — đặt `0` cho host standalone không nằm trong vCenter.

## 2.3 Lưu trữ

| Trigger | Mức độ | Đóng tay | Phụ thuộc | Rule |
| --- | --- | --- | --- | --- |
| Datastore [..]: Space is critically low | AVERAGE | ✓ | | Datastore discovery |
| Datastore [..]: Space is low | WARNING | ✓ | Space is critically low | Datastore discovery |
| HBA ..: Adapter is in critical state | HIGH | | | HBA discovery |
| HBA ..: Adapter is in warning state | WARNING | | Adapter is in critical state | HBA discovery |
| Number of host bus adapters has decreased | WARNING | ✓ | | template |
| Device [..]: Device is down | AVERAGE | | | Disk device discovery |
| Device [..]: Device is in warning state | WARNING | | Device is down | Disk device discovery |

- Datastore: space utilization `> {$VFS.FS.PUSED.MAX.CRIT}` (90) / `> {$VFS.FS.PUSED.MAX.WARN}` (80). Hai macro nhận context là UUID của datastore, ví dụ `{$VFS.FS.PUSED.MAX.CRIT:"64382f1f-e60d35ca-e545-30d042989461"}=97`.
- HBA: critical khi `vmwHbaStatus ≥ {$ESXI.SUBSYSTEM.CRIT.STATUS}` (4 = critical hoặc failed); warning khi `= {$ESXI.SUBSYSTEM.WARN.STATUS}` (3 = marginal).
- Disk device: `hrDeviceStatus = 5` (down) / `= 3` (warning).
- Số HBA: giá trị giảm so với lần poll trước.

## 2.4 Máy ảo

| Trigger | Mức độ | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| VM ..: Virtual machine is not powered on | WARNING | ✓ | |
| VM ..: Guest OS is not running | WARNING | ✓ | Virtual machine is not powered on |
| Virtual machine guest heartbeat lost *(trap)* | WARNING | ✓ | |

Hai trigger VM dạng poll bật khi **trạng thái thay đổi** và có recovery expression riêng:

```
not powered on:    last(power)<>1 and last(power,#2)=1
    recovery:      last(power)=1
guest not running: last(power)=1 and last(guest)<>1 and last(guest,#2)=1
    recovery:      last(guest)=1 or last(power)<>1
```

| Tình huống | Power state | Guest state | Problem |
| --- | --- | --- | --- |
| VM cố ý để tắt | `0 0 0` | — | không |
| VM đang chạy bị tắt | `1 1 0` | | **not powered on** — đến khi bật lại |
| VM bị suspend | `1 1 2` | | **not powered on** |
| Guest OS treo / Tools dừng | `1 1 1` | `1 1 0` | **guest not running** |
| VM không cài VMware Tools | `1 1 1` | `5 5 5` | không |

VM đã tắt từ trước khi gắn template sẽ không cảnh báo. Tắt cảnh báo cho một VM bằng `{$ESXI.VM.POWER.CONTROL:"<tên vm>"}=0` hoặc `{$ESXI.VM.GUEST.CONTROL:"<tên vm>"}=0`; loại hẳn VM khỏi discovery bằng `{$ESXI.VM.NAME.NOT_MATCHES}` (ví dụ `^vCLS` cho các VM vSphere Cluster Service).

**vMotion và DRS:** VM chuyển sang host khác biến mất khỏi `vmwVmTable` của host này, item chuyển sang unsupported chứ không báo "powered off" — không có cảnh báo giả.

## 2.5 Phần cứng

| Trigger | Mức độ | Đóng tay | Trạng thái |
| --- | --- | --- | --- |
| New IPMI SEL entries | INFO | ✓ | bật |
| IPMI hardware event raised *(trap)* | WARNING | ✓ | bật |
| IPMI System Event Log is almost full | WARNING | | **tắt** |

- **New IPMI SEL entries**: `vmwEnvNumber` tăng so với lần poll trước. Không cần trap. Xem chi tiết bằng `localcli hardware ipmi sel list`.
- **Trigger trap** (`IPMI hardware event raised`, `Virtual machine guest heartbeat lost`): `nodata(item trap, {$ESXI.TRAP.EVENT.HOLD}) = 0` — mở khi có trap khớp trong 1 giờ gần nhất, sau đó tự đóng.
- **SEL almost full** mặc định tắt vì VMWARE-ENV-MIB mô tả `vmwSELCapacity` mâu thuẫn: object ghi là "dung lượng trống còn lại", còn notification `vmwEnvIpmiSelFull` lại gửi khi giá trị "đạt 100%". So sánh item với `localcli hardware ipmi sel get` trên phần cứng của bạn; nếu là **phần trăm đã dùng** thì bật trigger (`≥ {$ESXI.SEL.CAPACITY.MAX}`, 90), ngược lại sửa biểu thức thành `<= 10`.

## 2.6 Interface mạng

| Trigger | Mức độ | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| Link down | AVERAGE | ✓ | |
| High bandwidth usage | WARNING | ✓ | Link down |
| High error rate | WARNING | ✓ | Link down |
| Ethernet has changed to lower speed than it was before | INFO | ✓ | Link down |

- **Link down** chỉ bật khi `ifOperStatus` *chuyển* sang `down(2)` — NIC không dùng sẽ không cảnh báo. Tắt cho một interface bằng `{$IFCONTROL:"vmnic3"}=0`.
- **High bandwidth**: trung bình 15 phút của chiều vào hoặc ra vượt `{$IF.UTIL.MAX}` % (90) của `ifHighSpeed`; phục hồi khi thấp hơn 3 điểm.
- **High error rate**: lỗi vào hoặc ra vượt `{$IF.ERRORS.WARN}` (2/s) trong 5 phút; phục hồi khi dưới 80 % ngưỡng.
- **Lower speed**: `ifHighSpeed` giảm trên interface `ifType 6` không ở trạng thái down.

---

# 3. Macro

## 3.1 Ngưỡng

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$CPU.UTIL.CRIT}` | `90` | Ngưỡng CPU (%), min 5 phút |
| `{$MEMORY.UTIL.MAX}` | `90` | Ngưỡng RAM (%), min 5 phút |
| `{$VFS.FS.PUSED.MAX.CRIT}` | `90` | Ngưỡng datastore critical (%), context = UUID datastore |
| `{$VFS.FS.PUSED.MAX.WARN}` | `80` | Ngưỡng datastore warning (%), context = UUID datastore |
| `{$IF.UTIL.MAX}` | `90` | Băng thông interface (%), context = ifName |
| `{$IF.ERRORS.WARN}` | `2` | Số lỗi/giây của interface, context = ifName |
| `{$ICMP_LOSS_WARN}` | `20` | ICMP loss (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | ICMP response time (s) |
| `{$SNMP.TIMEOUT}` | `5m` | Cửa sổ thời gian của *No SNMP data collection* |
| `{$UPTIME.WRAP.THRESHOLD}` | `496d` | Uptime trên mức này mà về 0 thì coi là counter quay vòng, không phải reboot |
| `{$ESXI.SHELL.SESSIONS.MAX}` | `0` | Số phiên ESXi Shell cho phép |
| `{$ESXI.SEL.CAPACITY.MAX}` | `90` | Ngưỡng SEL cho trigger SEL (đang tắt) |
| `{$ESXI.TRAP.EVENT.HOLD}` | `1h` | Thời gian problem do trap còn mở |

## 3.2 Giá trị trạng thái

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$ESXI.SUBSYSTEM.CRIT.STATUS}` | `4` | `vmwHbaStatus` ≥ 4 (critical, failed) |
| `{$ESXI.SUBSYSTEM.WARN.STATUS}` | `3` | `vmwHbaStatus` = marginal |
| `{$ESXI.HRDEVICE.CRIT.STATUS}` | `5` | `hrDeviceStatus` = down |
| `{$ESXI.HRDEVICE.WARN.STATUS}` | `3` | `hrDeviceStatus` = warning |

## 3.3 Công tắc

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$ESXI.VPXA.CONTROL}` | `1` | `0` tắt trigger vpxa (host standalone) |
| `{$ESXI.VM.POWER.CONTROL}` | `1` | `{$ESXI.VM.POWER.CONTROL:"<vm>"}=0` tắt trigger power của một VM |
| `{$ESXI.VM.GUEST.CONTROL}` | `1` | `{$ESXI.VM.GUEST.CONTROL:"<vm>"}=0` tắt trigger guest của một VM |
| `{$IFCONTROL}` | `1` | `{$IFCONTROL:"<ifName>"}=0` tắt *Link down* |

## 3.4 Bộ lọc discovery

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$MEMORY.TYPE.MATCHES}` | `.*(\.2\|hrStorageRam)$` | Dòng RAM trong `hrStorageTable` |
| `{$VFS.FS.FSTYPE.MATCHES}` | `.*(\.4\|hrStorageFixedDisk)$` | Dòng datastore trong `hrStorageTable` |
| `{$VFS.FS.FSNAME.MATCHES}` / `…NOT_MATCHES` | `.+` / `CHANGE_IF_NEEDED` | Đường dẫn mount datastore |
| `{$VFS.FS.FSUUID.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | UUID datastore cần loại — **liệt kê datastore dùng chung (SAN) ở đây**, đặt trên host group của cluster |
| `{$ESXI.HBA.NAME.MATCHES}` / `…NOT_MATCHES` | `.*` / `CHANGE_IF_NEEDED` | Tên HBA (`vmhbaN`) |
| `{$ESXI.HRDEVICE.TYPE.MATCHES}` | `.*(\.6\|hrDeviceDiskStorage)$` | `hrDeviceType` cần discover |
| `{$ESXI.HRDEVICE.DESCR.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Loại thiết bị theo mô tả |
| `{$ESXI.VM.NAME.MATCHES}` / `…NOT_MATCHES` | `.*` / `CHANGE_IF_NEEDED` | Tên VM |
| `{$ESXI.PROC.HOSTD.MATCHES}` | `^hostd` | `hrSWRunName` của hostd |
| `{$ESXI.PROC.VPXA.MATCHES}` | `^vpxa` | `hrSWRunName` của vpxa |
| `{$NET.IF.IFTYPE.MATCHES}` / `…NOT_MATCHES` | `.*` / `^24$` | `ifType`; bỏ loopback |
| `{$NET.IF.IFNAME.MATCHES}` / `…NOT_MATCHES` | `^.*$` / tên loopback | `ifName` |
| `{$NET.IF.IFADMINSTATUS.MATCHES}` / `…NOT_MATCHES` | `^.*` / `^2$` | bỏ admin down |
| `{$NET.IF.IFOPERSTATUS.MATCHES}` / `…NOT_MATCHES` | `^.*$` / `^6$` | bỏ notPresent |
| `{$NET.IF.IFALIAS.*}`, `{$NET.IF.IFDESCR.*}` | `.*` / `CHANGE_IF_NEEDED` | `ifAlias`, `ifDescr` |

Nếu `proc.num[hostd]` bằng `0` trên host bình thường, chạy `snmpwalk -v2c -c <community> <host> 1.3.6.1.2.1.25.4.2.1.2` và chỉnh `{$ESXI.PROC.HOSTD.MATCHES}` theo tên agent thực sự trả về.

---

# 4. Không bao gồm

- **Datastore dùng chung (SAN)**: được giám sát một lần bằng template riêng, không theo từng host — xem mục *Datastore dùng chung (SAN)* ở phần 1.5.
- **Hiệu năng từng VM** (CPU ready, độ trễ disk, network theo VM): không có trong MIB SNMP nào — dùng template *VMware* của Zabbix (VMware API).
- **Cảm biến phần cứng** (RPM quạt, nhiệt độ, trạng thái PSU dạng giá trị): ESXi 8 chỉ đưa ra dưới dạng sự kiện IPMI SEL (`vmwEnvTable`, trap); dùng template BMC của server (iDRAC/iLO/XCC) để lấy số đo.
- **vSAN, NSX, dịch vụ vCenter**: các MIB NSX/VCHA/vROps/SRM trong `files/vmware` thuộc sản phẩm khác, không dùng.
- **Item CPU theo từng core**: chỉ lấy trung bình và số core, tránh sinh hàng trăm item trên host lớn.
