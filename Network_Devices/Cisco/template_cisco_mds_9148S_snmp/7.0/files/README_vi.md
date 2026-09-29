# Cisco MDS 9148S by SNMP — Zabbix 7.0

File import: `template_cisco_mds_9148S_snmp.yaml` — tên template **Cisco MDS 9148S by SNMP**, nhóm *Templates/Network devices*.

Giám sát switch Cisco MDS 9148S 16G Multilayer Fabric Switch (48 cổng FC 16 Gbps, NX-OS 6.2 – 9.4) qua SNMP agent: kết nối, CPU và RAM, nhiệt độ, nguồn, quạt, các cổng Fibre Channel (traffic, trạng thái link và nguyên nhân down, bộ đếm lỗi FC, slow drain), thông số DOM của module quang, SAN port-channel, số FLOGI và số bản ghi name server, VSAN và zoning, license và các process bị crash.

Mọi OID lấy từ các file MIB của Cisco trong [cisco](cisco), tải từ [github.com/cisco/cisco-mibs](https://github.com/cisco/cisco-mibs) và chỉ dùng các module có trong [danh sách MIB hỗ trợ của MDS 9000](https://github.com/cisco/cisco-mibs/tree/main/supportlists/mds9000) (giống nhau từ NX-OS 8.4(2f) đến 9.4(4)). Các bộ đếm FC chỉ lấy trong những nhóm object mà statement `ciscoFcFeCapabilityV06R0213PMds` của **CISCO-FC-FE-CAPABILITY** khai báo cho NX-OS trên MDS — statement này ghi rõ tên m9148S.

MIB sử dụng: **SNMPv2-MIB**, **IF-MIB**, **ENTITY-MIB**, **CISCO-ENTITY-SENSOR-MIB**, **CISCO-ENTITY-FRU-CONTROL-MIB**, **CISCO-SYSTEM-EXT-MIB**, **CISCO-FC-FE-MIB**, **CISCO-VSAN-MIB**, **CISCO-ZS-MIB**, **CISCO-NS-MIB**, **CISCO-LICENSE-MGR-MIB**, **CISCO-CONFIG-MAN-MIB**, cùng các MIB notification liệt kê ở mục 1.13.

> **Chưa kiểm chứng bằng `snmpwalk` trên MDS 9148S thật.** Template import được vào Zabbix 7.0 (đã thử với 7.0.30, kể cả export rồi import lại), và các script discovery đã chạy thử trên dữ liệu SNMP walk của một switch NX-OS dùng cùng SNMP agent (Nexus, đổi `Ethernet1/x` thành `fc1/x`). Các điểm phụ thuộc dữ liệu thực tế của MDS được ghi chú bên dưới: DOM module quang qua SNMP, giá trị `ifHighSpeed` của cổng FC, `ccmHistoryRunning*` và cách mã hoá `clmLicenseFlag`.

*Bản tiếng Anh: [../README.md](../README.md)*

---

# 0. Chuẩn bị switch

```
! SNMPv3 (khuyến nghị)
snmp-server user zabbix network-operator auth sha <auth-password> priv aes-128 <priv-password>
! hoặc SNMPv2c
snmp-server community <community> group network-operator

! tuỳ chọn: gửi trap về Zabbix server/proxy
snmp-server host <zabbix-ip> traps version 2c <community> udp-port 162
snmp-server enable traps
show snmp trap
```

- Phiên bản SNMP và thông tin xác thực cấu hình trên **interface của host** trong Zabbix, không nằm trong template. Role `network-operator` (chỉ đọc) là đủ.
- Poll bằng **SNMPv2c hoặc SNMPv3**: item traffic dùng `ifHCInOctets` / `ifHCOutOctets` 64-bit và nhiều bộ đếm FC là `Counter64`.
- `snmp-server enable traps` bật mọi loại notification; `show snmp trap` liệt kê chúng để tắt dần các loại gây nhiễu.
- Các item trap cần `snmptrapd` + SNMP trapper của Zabbix trên server hoặc proxy. Nạp các MIB trong [cisco](cisco) vào `snmptrapd` để text trap có tên; biểu thức chính quy khớp cả theo tên lẫn theo OID dạng số.
- Walk discovery mỗi giờ (`mds.entity.walk`) đọc toàn bộ bảng entity và sensor. Nếu bị timeout, tăng **Max repetition count** của interface SNMP (ví dụ 50) hoặc timeout của item.

`sysObjectID` của MDS 9148S là `1.3.6.1.4.1.9.12.3.1.3.1491` (`cevChassisDSC9148SK9`, CISCO-ENTITY-VENDORTYPE-OID-MIB): MDS NX-OS trả về vendor type của chassis, không phải một mục trong CISCO-PRODUCTS-MIB.

---

# 1. Các item được giám sát

## 1.1 Kết nối và hệ thống

| Item | Key | Nguồn | Đơn vị | Chu kỳ |
| --- | --- | --- | --- | --- |
| ICMP ping | `icmpping` | simple check | | 1m |
| ICMP loss | `icmppingloss` | simple check | % | 1m |
| ICMP response time | `icmppingsec` | simple check | s | 1m |
| SNMP agent availability | `zabbix[host,snmp,available]` | internal | | 1m |
| System name | `system.name` | `1.3.6.1.2.1.1.5.0` sysName | | 15m |
| System description | `system.descr[sysDescr.0]` | `1.3.6.1.2.1.1.1.0` | | 15m |
| System location | `system.location[sysLocation.0]` | `1.3.6.1.2.1.1.6.0` | | 15m |
| System contact details | `system.contact[sysContact.0]` | `1.3.6.1.2.1.1.4.0` | | 15m |
| System object ID | `system.objectid[sysObjectID.0]` | `1.3.6.1.2.1.1.2.0` | | 15m |
| NX-OS version | `system.sw.version` | dependent — lấy `Version x.y(z)` từ sysDescr | | — |
| Uptime (network) | `system.net.uptime[sysUpTime.0]` | `1.3.6.1.2.1.1.3.0` | uptime | 1m |
| Uptime (system) | `system.hw.uptime[cseSysUpTime.0]` | `1.3.6.1.4.1.9.9.305.1.1.10.0` | uptime | 1m |
| CPU utilization | `system.cpu.util[cseSysCPUUtilization.0]` | `1.3.6.1.4.1.9.9.305.1.1.1.0` | % | 1m |
| Memory utilization | `vm.memory.util[cseSysMemoryUtilization.0]` | `1.3.6.1.4.1.9.9.305.1.1.2.0` | % | 1m |

**Uptime (system)** là `cseSysUpTime`: số giây từ lần reload hệ thống gần nhất. Khác với `sysUpTime`, nó không bị reset khi SNMP agent khởi động lại và không quay về 0 sau 497 ngày, nên trigger restart dùng item này.

CPU và RAM lấy từ CISCO-SYSTEM-EXT-MIB (supervisor đang active). Không dùng CISCO-PROCESS-MIB: capability duy nhất của nó cho MDS (`ciscoProcessCapabilitySAN3R0001`) chỉ khai báo nhóm theo từng process, không có `cpmCPUTotalTable`.

Tên, mô tả, phiên bản NX-OS, model và số serial chassis được ghi vào inventory của host.

## 1.2 Chassis — ENTITY-MIB

| Item | Key | Nguồn | Chu kỳ |
| --- | --- | --- | --- |
| ENTITY-MIB and sensor tables walk *(master, không lưu history)* | `mds.entity.walk` | walk `entPhysicalTable` (class, name, description, vendor type, containment, serial, model), `entAliasMappingTable`, `entSensorValueTable` (type, scale, precision), `entSensorThresholdTable` (severity, relation, value), `ifName`, `ifAlias` | 1h |
| Chassis model | `system.hw.model` | dependent — `entPhysicalModelName` của entity `chassis(3)` | — |
| Chassis description | `system.hw.descr` | dependent — `entPhysicalDescr` | — |
| Chassis serial number | `system.hw.serialnumber` | dependent — `entPhysicalSerialNum` | — |

Cùng walk này cấp dữ liệu cho rule discovery nhiệt độ và module quang (1.5, 1.6).

## 1.3 `FC interfaces discovery` — IF-MIB, CISCO-FC-FE-MIB

`discovery[]` trên `ifName`, `ifAlias`, `ifAdminStatus`, `ifType` và `vsanIfVsan`. Giữ các cổng có tên khớp `{$MDS.FCIF.NAME.MATCHES}` (`fc1/1` … `fc1/48`) và bỏ qua cổng đang admin down — trên 9148S cổng không dùng hoặc chưa có license thường để shutdown. `{#VSAN}` là port VSAN, dùng làm tag `vsan`. Discovery `1h`.

| Item | OID | Đơn vị | Chu kỳ |
| --- | --- | --- | --- |
| Operational status | `ifOperStatus` `1.3.6.1.2.1.2.2.1.8` | | 1m |
| Operational status cause | `fcIfOperStatusCause` `1.3.6.1.4.1.9.9.289.1.1.2.1.7` (map đủ 380 giá trị) | | 1m |
| Port mode | `fcIfOperMode` `…289.1.1.2.1.3` — F, E, TE, NP… | | 5m |
| Bits received / sent | `ifHCInOctets` / `ifHCOutOctets` ×8 | bps | 3m |
| Speed | `ifHighSpeed` ×1000000 | bps | 5m |
| Link failures | `fcIfLinkFailures` `…289.1.2.1.1.1` | mỗi lần poll | 5m |
| Loss of sync | `fcIfSyncLosses` `…289.1.2.1.1.2` | mỗi lần poll | 5m |
| Loss of signal | `fcIfSigLosses` `…289.1.2.1.1.3` | mỗi lần poll | 5m |
| Invalid transmission words | `fcIfInvalidTxWords` `…289.1.2.1.1.5` | mỗi lần poll | 5m |
| CRC errors | `fcIfInvalidCrcs` `…289.1.2.1.1.6` | mỗi lần poll | 5m |
| Credit loss recoveries | `fcIfCreditLoss` `…289.1.2.1.1.37` | mỗi lần poll | 5m |
| Timeout discards | `fcIfTimeOutDiscards` `…289.1.2.1.1.35` | mỗi lần poll | 5m |
| TxWait | `fcIfTxWaitCount` `…289.1.2.1.1.15` → % thời gian | % | 5m |
| Transceiver vendor / part number / serial number | `fcIfVendor` / `fcIfPartNumber` / `fcIfSerialNo` | | 1h |
| Number of logged-in Nx_Ports | dependent vào walk FLOGI (1.8) | | — |
| Logged-in port WWNs | dependent vào walk FLOGI — WWPN dạng `20:00:…` | | — |

Các bộ đếm lỗi dùng *Simple change*: giá trị là số sự kiện mới kể từ lần poll trước (5 phút).

**TxWait** tăng mỗi 2,5 µs cổng không còn credit để truyền trong khi có frame đang chờ ([white paper slow drain của Cisco](https://www.cisco.com/c/dam/en/us/products/collateral/storage-networking/mds-9700-series-multilayer-directors/whitepaper-c11-737315.pdf)). Item đổi ra phần trăm thời gian: tốc độ mỗi giây × 2,5·10⁻⁶ × 100. MDS 9148S nằm trong danh sách platform Cisco hỗ trợ TxWait.

Các bộ đếm CISCO-FC-FE-MIB bổ sung sau statement capability của MDS (`fcHCIfTxWaitCount`, `fcIfRxWaitCount`, `fcIfStateChangeCount`, `fcIfNbrWwn`) không được dùng.

Graph prototype: *Network traffic*, *FC errors*, *Slow drain indicators*.

## 1.4 `FC port-channels discovery` và `Management interface discovery`

Port-channel: các cổng khớp `{$MDS.PC.NAME.MATCHES}` (`port-channel 1`, `san-port-channel 1`), bỏ qua admin down.

| Item | OID | Đơn vị | Chu kỳ |
| --- | --- | --- | --- |
| Operational status | `ifOperStatus` | | 1m |
| Operational status cause | `fcIfOperStatusCause` — ví dụ `portChannelMembersDown(43)` | | 1m |
| Port mode | `fcIfOperMode` | | 5m |
| Bits received / sent | `ifHCInOctets` / `ifHCOutOctets` ×8 | bps | 3m |
| Speed | `ifHighSpeed` — tổng tốc độ các member đang hoạt động | bps | 5m |

Quản lý: `mgmt0` (`{$MDS.MGMT.NAME.MATCHES}`) — trạng thái, traffic, tốc độ, lỗi vào/ra. Không có trigger link: khi mgmt0 down thì không poll được switch và *No SNMP data collection* sẽ bật thay.

## 1.5 `Temperature sensor discovery` — CISCO-ENTITY-SENSOR-MIB

Dependent vào `mds.entity.walk`. Các dòng của `entSensorValueTable` có `entSensorType = celsius(8)`, trừ sensor của module quang.

| Item | OID | Đơn vị | Chu kỳ |
| --- | --- | --- | --- |
| Temperature | `entSensorValue` `1.3.6.1.4.1.9.9.91.1.1.1.1.4`, quy đổi theo `entSensorScale` / `entSensorPrecision` | °C | 3m |
| Sensor status | `entSensorStatus` `…91.1.1.1.1.5` — ok, unavailable, nonoperational | | 5m |

**Ngưỡng lấy từ chính switch**, không phải từ macro: khi discovery, ngưỡng minor và major của từng sensor trong `entSensorThresholdTable` (cột *MinorThres* / *MajorThresh* của `show environment temperature`) trở thành `{#TEMP.WARN}` và `{#TEMP.CRIT}`. Sensor đầu hút gió và đầu xả gió có ngưỡng khác nhau, nên một macro chung sẽ sai với một trong hai. `{$MDS.TEMP.WARN}` (60) và `{$MDS.TEMP.CRIT}` (75) chỉ dùng cho sensor không báo ngưỡng nào; `{#TEMP.SOURCE}` (`device`, `device+macro`, `macro`) cho biết ngưỡng lấy từ đâu.

## 1.6 `Transceiver DOM discovery` — CISCO-ENTITY-SENSOR-MIB

Dependent vào `mds.entity.walk`. Mỗi dòng là một cổng FC có module quang cung cấp đủ năm sensor chẩn đoán (DOM). NX-OS công bố chúng dưới dạng entity sensor tên `fc1/1 Lane 1 Transceiver Temperature Sensor`…, vendor type `cevSensorTransceiverRxPwr/TxPwr/Current/Voltage/Temp` (`1.3.6.1.4.1.9.12.3.1.8.46` – `.50`). Sensor được gắn với cổng qua `entPhysicalContainedIn` → entity của cổng → `entAliasMappingIdentifier` (ifIndex), hoặc theo tên cổng ở đầu `entPhysicalName`.

| Item | Đơn vị | Chu kỳ |
| --- | --- | --- |
| Link status (transceiver) — `ifOperStatus`, dùng cho trigger công suất | | 3m |
| Transceiver temperature | °C | 5m |
| Transceiver supply voltage | V | 5m |
| Transceiver bias current | mA | 5m |
| Transceiver Tx power | dBm | 5m |
| Transceiver Rx power | dBm | 5m |

Mỗi sensor mang bốn ngưỡng lấy từ EEPROM của module quang (alarm cao/thấp, warning cao/thấp), quy về cùng đơn vị: `{#XCVR.RX.HI.CRIT}`, `{#XCVR.RX.LO.WARN}`… Ngưỡng nào không có thì thành ±1000000000 để không bao giờ bật. Công suất Rx/Tx được báo với `entSensorType = 14` (dBm), một giá trị mới hơn bản CISCO-ENTITY-SENSOR-MIB đang công bố; template không phụ thuộc vào giá trị này.

> **Cần kiểm tra trên switch của bạn.** Một bài trên Cisco Community cho biết MDS 9148 đời cũ chạy NX-OS 6.2(1) không cung cấp sensor module quang qua SNMP. Nếu `snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.91.1.1.1.1.1` chỉ trả về vài sensor của chassis thì rule này rỗng — phần khác không bị ảnh hưởng — và trap *Sensor or transceiver threshold event* (`cIfXcvrMonStatusChangeNotif`) là cảnh báo DOM duy nhất.

Graph prototype: *Transceiver optical power*.

## 1.7 Nguồn, quạt, module — CISCO-ENTITY-FRU-CONTROL-MIB

| Rule | Nguồn | Item | Chu kỳ |
| --- | --- | --- | --- |
| `Power supply discovery` | `cefcFRUPowerOperStatus` `1.3.6.1.4.1.9.9.117.1.1.2.1.2`, các dòng có `entPhysicalClass = powerSupply(6)` | Power supply status | 3m |
| `Fan discovery` | `cefcFanTrayOperStatus` `…117.1.4.1.1.1` (khay quạt và quạt trong bộ nguồn) | Fan status | 3m |
| `Module discovery` | `cefcModuleOperStatus` `…117.1.2.1.1.2` | Module status | 3m |
| `Power budget discovery` | `cefcFRUPowerSupplyGroupTable` `…117.1.1.1.1` | Chế độ dự phòng (1h), đơn vị (1h), tổng dòng khả dụng / đang dùng (5m), % sử dụng công suất (calculated) | |

Trên 9148S, module 1 là toàn bộ switch (supervisor tích hợp và 48 cổng); có hai bộ nguồn thay nóng (1+1). Tên lấy từ `entPhysicalName`. Giá trị dòng điện tính theo đơn vị của `cefcPowerUnits`; phần trăm sử dụng không phụ thuộc đơn vị này.

## 1.8 Fabric

| Item | Key | Nguồn | Chu kỳ |
| --- | --- | --- | --- |
| FLOGI table walk *(master, không lưu history)* | `mds.flogi.walk` | walk `fcIfNxPortName` `1.3.6.1.4.1.9.9.289.1.1.5.1.3` (index ifIndex.vsan.login) | 5m |
| Number of FLOGI sessions | `mds.flogi.count` | dependent — số dòng của `fcIfFLoginTable` (`show flogi database`) | — |
| Name server: registered Nx_Ports | `mds.ns.entries[fcNameServerNumRows.0]` | `1.3.6.1.4.1.9.9.293.1.1.3.0`, toàn fabric | 5m |
| Number of VSANs | `mds.vsan.num[vsanNumber.0]` | `1.3.6.1.4.1.9.9.282.1.1.1.0` | 1h |

Graph: *Fabric logins* (số phiên FLOGI và số bản ghi name server).

## 1.9 `VSAN discovery` — CISCO-VSAN-MIB, CISCO-ZS-MIB

`discovery[]` trên `vsanName` và `vsanAdminState`; `{#SNMPINDEX}` là VSAN id. Bỏ qua VSAN 4094 (isolated) và các VSAN đang suspended.

| Item | Nguồn | Chu kỳ |
| --- | --- | --- |
| Operational state | `vsanOperState` `1.3.6.1.4.1.9.9.282.1.1.3.1.8` — up khi còn ít nhất một interface của VSAN đang up | 3m |
| Active zone set | `zoneEnforcedZoneSetName` `…294.1.1.13.1.1` (rỗng khi chưa có zone set nào active) | 15m |
| Default zone policy | `zoneDefaultZoneBehaviour` `…294.1.1.1.1.1` — permit / deny | 15m |
| Enforced zone database equals local | `zoneDbEnforcedEqualsLocal` `…294.1.1.30.1.2` | 15m |

Ba item zoning là dependent của *Zone server walk* (`mds.zone.walk`, 15m), đọc cả ba bảng một lần.

## 1.10 License — CISCO-LICENSE-MGR-MIB

| Rule / item | Nguồn | Chu kỳ |
| --- | --- | --- |
| License feature usage walk *(master)* | `clmLicenseFlag`, `clmLicenseGracePeriodLeft` của `clmLicenseFeatureUsageTable` | 1h |
| `License feature discovery` | mỗi feature một dòng (`PORT_ACTIVATION_PKG`, `ENTERPRISE_PKG`…), tên giải mã từ index của bảng | |
| — Grace period state | bit `inGracePeriod(4)` của `clmLicenseFlag` | — |
| — Grace period left | `clmLicenseGracePeriodLeft` | s |
| `Port license discovery` | `clmPortLicCountTable`: số license kích hoạt cổng tối đa (1h) và đang dùng (15m) | |

9148S kích hoạt cổng theo từng bước 12 cổng (on-demand port activation). `clmLicenseFlag` là kiểu `BITS`: script chấp nhận dạng hex (`18`), dạng một ký tự thô hoặc có kèm tên bit. **Cần kiểm tra** bằng `snmpwalk … 1.3.6.1.4.1.9.9.369.1.3.4.1.2` nếu trạng thái grace period có vẻ sai.

## 1.11 Lỗi phần mềm và cấu hình

| Item | Key | Nguồn | Chu kỳ |
| --- | --- | --- | --- |
| Core files walk *(master)* | `mds.cores.walk` | walk `cseSwCoresPID` `1.3.6.1.4.1.9.9.305.1.4.2.1.4` | 15m |
| Number of core files | `mds.cores.count` | dependent — số dòng của `cseSwCoresTable` (`show cores`) | — |
| Crashed processes | `mds.cores.list` | dependent — tên process giải mã từ index | — |
| Running configuration last changed | `mds.config.running.changed[…]` | `ccmHistoryRunningLastChanged` `1.3.6.1.4.1.9.9.43.1.1.1.0` | 5m |
| Running configuration last saved | `mds.config.running.saved[…]` | `ccmHistoryRunningLastSaved` `1.3.6.1.4.1.9.9.43.1.1.2.0` | 5m |

## 1.12 Graph

*CPU and memory utilization*, *Fabric logins*, cùng các graph prototype nêu ở trên.

## 1.13 SNMP trap

| Item | Notification (theo tên hoặc OID số) | Trigger |
| --- | --- | --- |
| SNMP traps (fallback) | mọi trap không khớp các item dưới | |
| Interface link up/down | `linkDown`, `linkUp`, `cieLinkDown`, `cieLinkUp` | chỉ lưu history |
| Hardware FRU event | `cefcModuleStatusChange`, `cefcPowerStatusChange`, `cefcFRUInserted`, `cefcFRURemoved`, `cefcUnrecognizedFRU`, `cefcFanTrayStatusChange`, `cefcPowerSupplyOutputChange` (`…117.2.0.1-7`) | ✓ |
| Sensor threshold event | `entSensorThresholdNotification` (`…91.2.0.1`), `cIfXcvrMonStatusChangeNotif` (`…706.0.1`) | ✓ |
| Software failure | `cseFailSwCoreNotify(Extended)`, `cseHaRestartNotify`, `cseShutDownNotify` | ✓ |
| Zone merge failure | `zoneMergeFailureNotify` (`…294.1.4.0.2`) | ✓ |
| Fabric event | kích hoạt zone set, zone merge thành công, đổi default zone, thay đổi trạng thái / thành viên VSAN, trunk up/down, ELP reject, `fcotInserted`/`fcotRemoved`, thay đổi FSPF neighbor | chỉ lưu history |
| License event | `clmLicenseExpiryNotify`, `clmNoLicenseForFeatureNotify`, `clmLicenseFileMissingNotify`, `clmLicenseExpiryWarningNotify` | ✓ |
| Security violation | từ chối do port security / fabric binding (`CISCO-PSM-MIB`), `cfcspAuthFailNotification` | ✓ |
| Syslog message | `clogMessageGenerated` | chỉ lưu history |
| Device restart | `coldStart`, `warmStart` | chỉ lưu history |

Các cờ alarm và warning của module quang trong CISCO-INTERFACE-XCVR-MONITOR-MIB là `accessible-for-notify`: chỉ nhận được trong `cIfXcvrMonStatusChangeNotif`, không poll được.

---

# 2. Trigger cảnh báo

## 2.1 Kết nối và hệ thống

| Trigger | Mức độ | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| Unavailable by ICMP ping | HIGH | | |
| No SNMP data collection | WARNING | | Unavailable by ICMP ping |
| High ICMP ping loss | WARNING | | Unavailable by ICMP ping |
| High ICMP ping response time | WARNING | | High ICMP ping loss |
| Device has been restarted | WARNING | ✓ | No SNMP data collection |
| High CPU utilization | WARNING | | No SNMP data collection |
| High memory utilization | AVERAGE | | |
| System name has changed | INFO | ✓ | |
| NX-OS version has changed | INFO | ✓ | |
| Device has been replaced (đổi serial chassis) | INFO | ✓ | |
| A process crashed and wrote a core file | AVERAGE | ✓ | |
| Running configuration has not been saved | INFO | ✓ | |

- **Restarted**: `cseSysUpTime < 10m`.
- **CPU / RAM**: giá trị nhỏ nhất trong 5 phút vượt `{$CPU.UTIL.CRIT}` / `{$MEMORY.UTIL.MAX}` (90).
- **Core file**: số dòng của `cseSwCoresTable` lớn hơn giá trị nhỏ nhất của nó trong `{$MDS.CORE.HOLD}` (24h). Problem tự đóng sau 24 giờ kể từ core mới nhất, khi xoá core (`clear cores`), hoặc đóng tay. *Crashed processes* cho biết process nào.
- **Chưa lưu cấu hình**: `ccmHistoryRunningLastChanged > ccmHistoryRunningLastSaved`, thay đổi đã cũ hơn `{$MDS.CONFIG.UNSAVED.MAX}` (1h), và `LastSaved > 0`. Điều kiện cuối giữ trigger im lặng cho tới lần `copy running-config startup-config` đầu tiên sau khi reload, khi NX-OS chưa có mốc thời gian lưu.

## 2.2 Cổng FC

| Trigger | Mức độ | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| Link down | AVERAGE | ✓ | |
| Credit loss recovery | AVERAGE | ✓ | Link down |
| High TxWait | WARNING | ✓ | Link down |
| Frames dropped by congestion-drop timeout | WARNING | ✓ | Link down |
| CRC errors | WARNING | ✓ | Link down |
| Invalid transmission words | WARNING | ✓ | Link down |
| Link instability (link failures + loss of sync + loss of signal) | WARNING | ✓ | Link down |
| High bandwidth usage | WARNING | ✓ | Link down |
| Link speed has decreased | INFO | ✓ | Link down |

- **Link down** chỉ bật khi `ifOperStatus` *chuyển* sang `down(2)` — cổng chưa từng up thì không cảnh báo — và **không** bật khi quản trị viên shutdown cổng (`fcIfOperStatusCause = adminDown(12)`). Operational data hiển thị nguyên nhân (`linkFailure`, `fcotNotPresent`, `errorDisabled`, `portGuard…`). Tắt cảnh báo cho một cổng bằng `{$IFCONTROL:"fc1/5"}=0`.
- **Trigger lỗi** so sánh số sự kiện mới trong lần poll gần nhất với macro, và phục hồi khi 15 phút liền không có lần nào vượt ngưỡng. Giá trị mặc định theo [port-monitor policy mẫu của Cisco](https://www.cisco.com/c/en/us/support/docs/storage-networking/mds-9000-nx-os-software-release-62/200102-Sample-MDS-port-monitor-policy-for-alert.html) (ở đó tính trên 60 giây, ở đây trên mỗi lần poll 5 phút, nên chặt hơn một chút):

  | Macro | Mặc định | Policy mẫu của Cisco |
  | --- | --- | --- |
  | `{$MDS.FC.CRC.MAX}` | 5 | invalid-crc 5 |
  | `{$MDS.FC.ITW.MAX}` | 5 | invalid-words 5 |
  | `{$MDS.FC.LINK.LOSS.MAX}` | 3 | link-loss / sync-loss / signal-loss 3 |
  | `{$MDS.FC.TIMEOUT.DISCARDS.MAX}` | 50 | timeout-discards 50 |
  | `{$MDS.FC.CREDIT.LOSS.MAX}` | 0 | credit-loss-reco 1 |
  | `{$MDS.FC.TXWAIT.MAX}` | 10 (% của chu kỳ poll 5 phút) | txwait 20 % của 1 giây |

  Tất cả nhận tên interface làm context, ví dụ `{$MDS.FC.CRC.MAX:"fc1/12"}=50` cho một link bẩn đã biết.
- **Credit loss recovery** và **TxWait** là chỉ báo slow drain: thiết bị phía sau cổng F (hoặc fabric phía sau cổng E) không trả buffer credit. Invalid transmission words cũng tăng khi link vừa lên, nên một lần flap có thể bật cùng với *Link instability*.
- **High bandwidth**: trung bình 15 phút của chiều vào hoặc ra vượt `{$IF.UTIL.MAX}` % (90) của `ifHighSpeed × {$MDS.FC.RATE.RATIO}`. FC mang 100 MB/s dữ liệu cho mỗi Gbit/s danh định — 16GFC là 1600 MB/s = 12,8 Gbit/s — nên `{$MDS.FC.RATE.RATIO}` là 0,8. Nếu switch của bạn báo `ifHighSpeed` theo tốc độ dữ liệu (cổng 16G báo 12800 thay vì 16000), đặt macro này bằng 1.

## 2.3 Port-channel

| Trigger | Mức độ | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| Port-channel down | HIGH | ✓ | |
| Port-channel bandwidth has decreased | WARNING | ✓ | Port-channel down |
| High bandwidth usage | WARNING | ✓ | Port-channel down |

Port-channel down nghĩa là mất ISL (hoặc uplink NPV); không bật khi nguyên nhân là `adminDown(12)` / `channelAdminDown(13)`. *Bandwidth has decreased* là cảnh báo mất member link: tổng `ifHighSpeed` bị giảm.

## 2.4 Module quang (DOM)

| Trigger | Mức độ | Phụ thuộc |
| --- | --- | --- |
| Transceiver temperature / supply voltage / bias current / Tx power / Rx power is out of the alarm range | AVERAGE | |
| … is out of the warning range | WARNING | trigger alarm tương ứng |

Nằm ngoài ngưỡng trong suốt 15 phút gần nhất (`min(15m) >= ngưỡng cao` hoặc `max(15m) <= ngưỡng thấp`), so với ngưỡng của chính module quang. Trigger công suất Tx và Rx còn yêu cầu link đang up: cổng không có ánh sáng là lỗi link, đã có *Link down* báo. Tắt cho một cổng bằng `{$MDS.XCVR.CONTROL:"fc1/5"}=0`.

## 2.5 Môi trường và phần cứng

| Trigger | Mức độ | Phụ thuộc |
| --- | --- | --- |
| Temperature is above the critical threshold | HIGH | |
| Temperature is above the warning threshold | WARNING | critical |
| Temperature sensor is not operational | WARNING | |
| Power supply is not delivering power | AVERAGE | |
| Power supply is in warning state | WARNING | not delivering power |
| Fan is down | AVERAGE | |
| Fan is in warning state | WARNING | Fan is down |
| Module is not in ok state | AVERAGE | |

- Nhiệt độ: trung bình 5 phút `>= {#TEMP.CRIT}` / `>= {#TEMP.WARN}` (ngưỡng của switch, xem 1.5), phục hồi khi thấp hơn 3 °C.
- Nguồn: *not delivering power* là mọi trạng thái trừ `on(2)`, `onButFanFail(9)` và `onButInlinePowerFail(12)` — mất điện đầu vào, tắt bằng lệnh, hỏng…; hai trạng thái *onBut* là mức warning.
- Quạt: `down(3)` / `warning(4)`.
- Module: không ở `ok(2)` trong ba lần poll liên tiếp (chẩn đoán lỗi, bị tắt nguồn, bị từ chối cấp nguồn…).

## 2.6 VSAN và zoning

| Trigger | Mức độ | Đóng tay |
| --- | --- | --- |
| VSAN is down | AVERAGE | ✓ |
| Active zone set has changed | INFO | ✓ |
| Default zone policy is permit | INFO | |
| Zoning changes are not activated | INFO | ✓ |

- **VSAN is down** bật khi `vsanOperState` chuyển sang down: không còn interface nào của VSAN đang up trên switch này. VSAN không dùng, luôn down thì không cảnh báo. Tắt bằng `{$MDS.VSAN.CONTROL:"<vsan id>"}=0`.
- **Default zone permit**: các thiết bị không thuộc zone nào vẫn thấy nhau. Cho phép riêng từng VSAN bằng `{$MDS.DEFZONE.CONTROL:"<vsan id>"}=0`.
- **Zoning chưa activate**: `zoneDbEnforcedEqualsLocal` là false liên tục trong `{$MDS.ZONE.PENDING.MAX}` (1h) — đã sửa zone nhưng chưa activate zone set.

## 2.7 License

| Trigger | Mức độ | Phụ thuộc |
| --- | --- | --- |
| Grace period expires soon (còn ít hơn `{$MDS.LICENSE.GRACE.MIN}`, 7d) | HIGH | |
| Feature is running in the license grace period | AVERAGE | Grace period expires soon |
| All port licenses are in use | INFO | |

Feature bật khi chưa có license sẽ chạy trong thời gian grace rồi bị tắt. *All port licenses are in use*: cổng mới không thể lên (nguyên nhân `portActLicenseNotAvailable`).

## 2.8 Trigger theo trap

*Hardware FRU event received* (WARNING), *Sensor or transceiver threshold event received* (WARNING), *Software failure or service restart* (AVERAGE), *Zone merge failure* (AVERAGE), *License event received* (WARNING), *Port security or fabric binding violation* (WARNING): `nodata(item trap, {$MDS.TRAP.EVENT.HOLD}) = 0` — mở khi có trap tương ứng trong một giờ gần nhất, sau đó tự đóng; cho phép đóng tay. Operational data hiển thị nội dung trap.

---

# 3. Macro

## 3.1 Ngưỡng

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$CPU.UTIL.CRIT}` | `90` | CPU (%), giá trị nhỏ nhất trong 5 phút |
| `{$MEMORY.UTIL.MAX}` | `90` | RAM (%), giá trị nhỏ nhất trong 5 phút |
| `{$IF.UTIL.MAX}` | `90` | Băng thông (%) so với tốc độ dữ liệu dùng được, context = ifName |
| `{$MDS.FC.RATE.RATIO}` | `0.8` | Tốc độ dữ liệu FC dùng được / `ifHighSpeed` |
| `{$MDS.FC.CRC.MAX}` | `5` | Lỗi CRC mỗi lần poll, context = ifName |
| `{$MDS.FC.ITW.MAX}` | `5` | Invalid transmission words mỗi lần poll, context = ifName |
| `{$MDS.FC.LINK.LOSS.MAX}` | `3` | Link failure + mất sync + mất tín hiệu mỗi lần poll, context = ifName |
| `{$MDS.FC.CREDIT.LOSS.MAX}` | `0` | Số lần credit loss recovery mỗi lần poll, context = ifName |
| `{$MDS.FC.TIMEOUT.DISCARDS.MAX}` | `50` | Timeout discard mỗi lần poll, context = ifName |
| `{$MDS.FC.TXWAIT.MAX}` | `10` | TxWait (% chu kỳ poll), context = ifName |
| `{$MDS.TEMP.WARN}` / `{$MDS.TEMP.CRIT}` | `60` / `75` | Ngưỡng nhiệt dự phòng (°C) cho sensor không có ngưỡng của switch |
| `{$MDS.LICENSE.GRACE.MIN}` | `7d` | Thời gian grace còn lại dưới mức này thì trigger license lên HIGH |
| `{$MDS.CONFIG.UNSAVED.MAX}` | `1h` | Thời gian chấp nhận một thay đổi cấu hình chưa lưu |
| `{$MDS.ZONE.PENDING.MAX}` | `1h` | Thời gian chấp nhận thay đổi zoning chưa activate |
| `{$MDS.CORE.HOLD}` | `24h` | Thời gian problem core file giữ ở trạng thái mở |
| `{$MDS.TRAP.EVENT.HOLD}` | `1h` | Thời gian problem theo trap giữ ở trạng thái mở |
| `{$ICMP_LOSS_WARN}` | `20` | Mất gói ICMP (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | Thời gian phản hồi ICMP (s) |
| `{$SNMP.TIMEOUT}` | `5m` | Cửa sổ thời gian của *No SNMP data collection* |

## 3.2 Công tắc

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$IFCONTROL}` | `1` | `{$IFCONTROL:"<ifName>"}=0` tắt *Link down* / *Port-channel down* |
| `{$MDS.XCVR.CONTROL}` | `1` | `{$MDS.XCVR.CONTROL:"<ifName>"}=0` tắt các trigger DOM của một cổng |
| `{$MDS.VSAN.CONTROL}` | `1` | `{$MDS.VSAN.CONTROL:"<vsan id>"}=0` tắt *VSAN is down* |
| `{$MDS.DEFZONE.CONTROL}` | `1` | `{$MDS.DEFZONE.CONTROL:"<vsan id>"}=0` cho phép default zone permit |

## 3.3 Bộ lọc discovery

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$MDS.FCIF.NAME.MATCHES}` / `…NOT_MATCHES` | `^fc[0-9]+/[0-9]+$` / `CHANGE_IF_NEEDED` | Cổng FC (rule module quang cũng dùng) |
| `{$MDS.FCIF.ALIAS.MATCHES}` / `…NOT_MATCHES` | `.*` / `CHANGE_IF_NEEDED` | Mô tả cổng (`switchport description`) |
| `{$MDS.FCIF.ADMINSTATUS.NOT_MATCHES}` | `^2$` | Bỏ qua cổng và port-channel admin down |
| `{$MDS.PC.NAME.MATCHES}` | `^(san-)?port-channel ?[0-9]+$` | Port-channel |
| `{$MDS.MGMT.NAME.MATCHES}` | `^mgmt[0-9]+$` | Cổng quản lý |
| `{$MDS.VSAN.NAME.MATCHES}` / `…NOT_MATCHES` | `.*` / `CHANGE_IF_NEEDED` | Tên VSAN |
| `{$MDS.VSAN.ID.NOT_MATCHES}` | `^4094$` | Loại trừ VSAN id (4094 = isolated VSAN) |
| `{$MDS.VSAN.ADMIN.NOT_MATCHES}` | `^2$` | Bỏ qua VSAN suspended |

Muốn giám sát cả cổng admin down thì đặt `{$MDS.FCIF.ADMINSTATUS.NOT_MATCHES}` thành `CHANGE_IF_NEEDED`; *Link down* vẫn bỏ qua chúng cho tới khi chúng lên.

---

# 4. Kiểm tra trên switch

```sh
snmpwalk -v2c -c <community> <switch> 1.3.6.1.2.1.1.2.0                 # sysObjectID ...12.3.1.3.1491
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.305.1.1           # CPU, RAM, cseSysUpTime
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.289.1.1.2.1.7     # fcIfOperStatusCause từng cổng
snmpwalk -v2c -c <community> <switch> 1.3.6.1.2.1.31.1.1.1.15           # ifHighSpeed (cổng 16G báo 16000 hay 12800?)
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.91.1.1.1.1.1      # entSensorType: có sensor module quang không?
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.91.1.2.1.1        # entSensorThresholdTable
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.43.1.1            # ccmHistoryRunningLastChanged / LastSaved
snmpwalk -v2c -c <community> <switch> 1.3.6.1.4.1.9.9.369.1.3.4.1.2     # cách mã hoá clmLicenseFlag
```

---

# 5. Không bao gồm

- **Số liệu theo từng flow và từng initiator/target** (SAN Analytics, `show analytics`): không có trong SNMP, dùng Cisco Nexus Dashboard Fabric Controller (NDFC) hoặc streaming telemetry của analytics.
- **Nội dung zoning** (zone và thành viên): chỉ giám sát tên zone set đang active, chính sách default zone và cờ thay đổi chưa activate.
- **FCIP, iSCSI, FICON, SME, DMM**: phần cứng 9148S không hỗ trợ (FCIP cần 9250i/9220i). **IVR, route FSPF, cơ sở dữ liệu port security**: không poll; thay đổi FSPF neighbor và vi phạm port security được nhận qua trap (1.13).
- **Dự phòng supervisor** (CISCO-RF-MIB): 9148S chỉ có một supervisor tích hợp.
- **RxWait, bộ đếm đổi trạng thái theo cổng, WWN của thiết bị đối diện**: được bổ sung vào CISCO-FC-FE-MIB sau statement capability của MDS; chưa dùng cho tới khi kiểm chứng trên switch.
