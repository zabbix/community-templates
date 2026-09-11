# HP A5500 HI — Comware 5 — Zabbix 7.0

[English](README.md) | [Tiếng Việt](readme_vi.md)

Template SNMP cho **HP A5500-48G-4SFP HI Switch with 2 interface Slots**, chạy
**Comware 5.20.99, Release 5501P36**. Tên khi import: **HP A5500 HI**.
Không liên kết template khác. Hỗ trợ SNMPv2c/SNMPv3 theo cấu hình SNMP interface của host.

## Thiết bị mục tiêu

Đã kiểm thử thành công trên **HP A5500-48G-4SFP HI**, chạy **Comware 5.20.99, Release 5501P36**,
với **Zabbix 7.0.29**. Thông tin phần cứng dưới đây lấy từ `display version` được cung cấp:

| Thành phần | Thông tin |
|---|---|
| Model | HP A5500-48G-4SFP HI Switch with 2 interface Slots |
| Phần mềm | HPE Comware 5.20.99, Release 5501P36 |
| CPU / SDRAM | 2 processors / 1024 MB |
| Flash | 4096 KB NOR, 512 MB NAND |
| Hardware / CPLD / Bootrom | REV.C / 003 / 215 |
| SubSlot 0 | 48GE + 4SFP + 2SFP PLUS, REV.C |
| SubSlot 1 | 2 XFP, REV.B |
| SubSlot 2 | 2 XFP, REV.B |

Template không cố định số cổng, CPU, slot hoặc index phần cứng. SDRAM/flash ở trên
là thông tin thiết bị, không phải dung lượng gán cứng vào item. Dòng `2 Processors`
không đảm bảo có hai hàng CPU trong SNMP: Comware có thể báo mức sử dụng tổng hợp theo module.

## Cài đặt

1. Import `template_hp_a5500_switch_snmp.yaml` trong **Data collection → Templates** của Zabbix 7.0.
2. Thêm SNMP interface cho host với IP quản trị switch, UDP port `161`. Cho phép
   server/proxy truy cập SNMP và đọc các nhánh MIB trong bảng kiểm tra bên dưới.
3. Cấu hình SNMP interface giống switch. Với **SNMPv3 authPriv**, dùng SHA/AES nếu
   switch được cấu hình tương ứng, rồi tạo và tham chiếu các host macro:
   `{$SNMP_V3_USER}` (Security name), `{$SNMP_V3_AUTHPASSPHRASE}` (Authentication
   passphrase), `{$SNMP_V3_PRIVPASSPHRASE}` (Privacy passphrase). Đặt hai passphrase
   ở kiểu **Secret text**. Với **SNMPv2c**, tạo `{$SNMP_COMMUNITY}` trên host và
   tham chiếu nó trong trường SNMP community.
4. Link **HP A5500 HI**, đợi master items và discovery chạy, kiểm tra
   **Monitoring → Latest data** cùng các item báo `Unsupported`.

Các macro xác thực do người dùng tạo trên host; YAML không chứa mật khẩu mẫu.
Template dùng OID dạng số nên không yêu cầu cài MIB trên server/proxy.

UUID riêng cho phép import cùng template A5120. Nếu host đã link A5120, cần xử lý
liên kết template cũ trước khi link A5500 vì nhiều item key trùng nhau. Template mới
không tự di chuyển lịch sử CPU/RAM/nhiệt độ từ item cố định sang item LLD. Nếu bản sao
A5500 trước đây đã được import với tên A5120, kiểm tra template đang được host sử dụng
trước khi gỡ liên kết hoặc xóa dữ liệu cũ.

## Dữ liệu giám sát

| Nhóm | Item / discovery | Thu thập |
|---|---|---|
| Hệ thống | `sysName`, `sysDescr`, `sysLocation`, `sysContact` | SNMP, mỗi 1 giờ |
| Uptime SNMP | `SysUptime` | SNMP, mỗi 5 phút, chuyển TimeTicks sang giây |
| Phần cứng | `hardware.walk` | ENTITY-MIB + HH3C-ENTITY-EXT-MIB, mỗi 1 phút |
| CPU/RAM | `module.discovery`; `switch.cpu[index]`, `switch.memory[index]` | Dependent discovery/items theo module |
| Nhiệt độ | `temperature.discovery`; `switch.temp[index]` | Dependent discovery/items theo entity |
| Quạt | `fan.discovery`; `fan.status[index]` | Entity class 7, trạng thái HH3C |
| Nguồn | `psu.discovery`; `psu.status[index]` | Entity class 6, trạng thái HH3C |
| Interface | `net.if.walk`, `net.if.discovery` | Bulk walk mỗi 1 phút, dependent discovery/items |
| Lưu lượng | `net.if.in[...]`, `net.if.out[...]` | Counter64 → thay đổi mỗi giây → nhân 8, bps |
| Tốc độ | `net.if.speed[...]` | ifHighSpeed × 1.000.000, bps |
| Trạng thái cổng | `net.if.adminstatus[...]`, `net.if.status[...]` | ifAdminStatus / ifOperStatus |
| CRC | `CRC.Errors[index]` | dot3StatsFCSErrors mỗi 2 phút, chỉ Ethernet |

Master items không lưu history. Discovery có heartbeat 1 giờ cho kết quả không đổi;
các item chỉ số vẫn cập nhật theo chu kỳ master. Có biểu đồ CPU/RAM theo module và
lưu lượng theo interface. Một `walk[]` có thể cần nhiều gói SNMP; admin/oper status
dùng chung kết quả master nhưng không phải trạng thái đồng thời tuyệt đối của switch.

### Phần cứng

- CPU/RAM chọn `entPhysicalDescr` khớp `{$HP.MODULE.DESCR.MATCHES}` và có cả hai giá trị
  sử dụng trong khoảng 0–100%. Mặc định nhận `Module level1`, Fabric Module hoặc mô tả
  chứa `CPU`, không phân biệt hoa/thường. CPU 0% vẫn được nhận.
- Nếu không thấy CPU/RAM, xem mô tả entity thực tế rồi chỉnh macro lọc. Không đoán
  index từ số slot hoặc dùng lại index `.30` của thiết bị khác.
- Nhiệt độ nhận entity báo 1–999 °C. Loại giá trị 0/âm để tránh giá trị không hỗ trợ;
  bộ lọc này không dành cho sensor cần đo 0 °C hoặc nhiệt độ âm.
- Hàng thiếu cột bắt buộc không tạo item. Tên entity trống dùng mô tả, rồi đến index.
- Quạt/nguồn dùng `hh3cEntityExtErrorStatus`: `2 = normal`, `4 = entityAbsent`,
  `1 = notSupported`, khác bảng active/deactive của LSW-DEV-ADM-MIB. Khe trống và
  trạng thái không hỗ trợ không phát cảnh báo lỗi; template không cảnh báo mất
  dự phòng chỉ vì một khe nguồn trống.

### Interface

Khám phá `ifType=6` (Ethernet gồm GE/10GE), `136` (Vlan-interface), `161`
(Bridge-Aggregation). Cổng SFP+/XFP được nhận qua IF-MIB, không theo tên cố định.

VLAN mặc định chỉ theo dõi trạng thái và link down. Đổi
`{$NET.IF.NO_TRAFFIC.IFTYPE.MATCHES}` thành `^$` để bật lưu lượng/tốc độ/biểu đồ
nếu VLAN thực sự hỗ trợ các bộ đếm đó. CRC vẫn chỉ dành cho `ifType=6`.
Bridge-Aggregation có lưu lượng/tốc độ/trạng thái nếu thiết bị cung cấp; không tạo CRC.

## Cảnh báo

| Cảnh báo | Điều kiện / phục hồi |
|---|---|
| CPU/RAM cao | Mọi mẫu trong 5 phút > ngưỡng, mặc định 80%. Phục hồi khi mọi mẫu trong 5 phút < ngưỡng trừ 5 điểm phần trăm. |
| Nhiệt độ cao | Trung bình 5 phút > ngưỡng, mặc định 60 °C. Phục hồi khi mọi mẫu trong 5 phút ≤ ngưỡng trừ 5 °C. |
| Quạt lỗi | Trạng thái 3 (POST failure), 41 (fan error), 91 (hardware faulty). |
| Nguồn lỗi | Trạng thái 3, 51 (PSU error), 61 (RPS error), 91. |
| Link down | Admin đang up, oper hiện tại down và mẫu oper trước up. Giữ problem đến khi hết down, admin down hoặc IFCONTROL=0. |
| Băng thông cao | Trung bình 15 phút của chiều vào hoặc ra > ngưỡng, mặc định 90%. Phục hồi khi cả hai chiều < ngưỡng trừ 3 điểm phần trăm, hoặc speed=0. |
| CRC | Hơn 1 lỗi FCS mới giữa hai mẫu 2 phút; counter giảm do reset không báo lỗi. |
| Uptime SNMP thấp | sysUpTime dưới 10 phút; cần đối chiếu CLI/log để xác định nguyên nhân. |

Cổng vốn down khi bắt đầu giám sát không tạo link-down alert. Ngưỡng 60 °C là ngưỡng
giám sát có thể chỉnh, **không phải giới hạn nhiệt độ phần cứng do HPE công bố**.

`sysUpTime.0` tính từ lúc bộ phận quản lý SNMP khởi tạo, có thể khác uptime chassis
trong `display version` và quay vòng sau khoảng 497 ngày. Cảnh báo được đặt tên
**SNMP uptime is less than 10 minutes**, không khẳng định switch vừa reboot.
Đối chiếu log/CLI để phân biệt reboot, SNMP agent restart và counter wrap, nhất là
với thiết bị đã chạy 60 tuần như thông tin được cung cấp.

## Macro điều chỉnh

| Macro | Mặc định | Ý nghĩa |
|---|---|---|
| `{$HP.MODULE.DESCR.MATCHES}` | `(?i)(^module level1$\|fabric.*module\|cpu)` | Regex mô tả module CPU/RAM |
| `{$CPU.UTIL.MAX}` | `80` | Ngưỡng CPU %, hỗ trợ context tên entity |
| `{$MEMORY.UTIL.MAX}` | `80` | Ngưỡng RAM %, hỗ trợ context tên entity |
| `{$TEMP.MAX}` | `60` | Ngưỡng °C, hỗ trợ context tên entity |
| `{$IF.UTIL.MAX}` | `90` | Ngưỡng băng thông %, hỗ trợ context ifName |
| `{$IFCONTROL}` | `1` | 0 để tắt link-down trigger, hỗ trợ context ifName |
| `{$NET.IF.IFTYPE.MATCHES}` | `^(6\|136\|161)$` | Loại interface khám phá |
| `{$NET.IF.NO_TRAFFIC.IFTYPE.MATCHES}` | `^136$` | Loại interface chỉ theo dõi trạng thái |

Ví dụ: `{$IFCONTROL:"GigabitEthernet1/0/24"}=0`,
`{$IF.UTIL.MAX:"Ten-GigabitEthernet1/1/1"}=80`. Dùng tên thực tế từ discovery;
tên cổng ví dụ không phải cam kết về cách đánh số trên switch. Giữ ngưỡng lớn hơn
hysteresis tương ứng để điều kiện phục hồi có thể đạt được.

## Kiểm tra OID trên R5501P36

Chạy từ server/proxy với thông tin SNMP thực tế; thay placeholder trước khi chạy:

```sh
snmpwalk -v3 -l authPriv -u '<SNMP_USER>' -a SHA -A '<AUTH_PASSPHRASE>' \
  -x AES -X '<PRIV_PASSPHRASE>' -On '<SWITCH_IP>' 1.3.6.1.2.1.47.1.1.1.1

snmpwalk -v3 -l authPriv -u '<SNMP_USER>' -a SHA -A '<AUTH_PASSPHRASE>' \
  -x AES -X '<PRIV_PASSPHRASE>' -On '<SWITCH_IP>' 1.3.6.1.4.1.25506.2.6.1.1.1.1
```

| OID | Dữ liệu |
|---|---|
| `1.3.6.1.2.1.47.1.1.1.1.2` | entPhysicalDescr |
| `1.3.6.1.2.1.47.1.1.1.1.5` | entPhysicalClass |
| `1.3.6.1.2.1.47.1.1.1.1.7` | entPhysicalName |
| `1.3.6.1.4.1.25506.2.6.1.1.1.1.6` | hh3cEntityExtCpuUsage |
| `1.3.6.1.4.1.25506.2.6.1.1.1.1.8` | hh3cEntityExtMemUsage |
| `1.3.6.1.4.1.25506.2.6.1.1.1.1.12` | hh3cEntityExtTemperature |
| `1.3.6.1.4.1.25506.2.6.1.1.1.1.19` | hh3cEntityExtErrorStatus |
| `1.3.6.1.2.1.31.1.1.1.6` / `1.3.6.1.2.1.31.1.1.1.10` | ifHCInOctets / ifHCOutOctets |
| `1.3.6.1.2.1.31.1.1.1.15` | ifHighSpeed, Mbps |
| `1.3.6.1.2.1.10.7.2.1.3` | dot3StatsFCSErrors |

Đối chiếu suffix index ENTITY-MIB và HH3C-ENTITY-EXT-MIB. Nếu discovery trống, kiểm tra
SNMP view/ACL, cột bị thiếu và macro lọc module. Với uplink đang chạy 10 Gbit/s,
`ifHighSpeed` cần báo `10000`; đối chiếu tốc độ CLI. Nếu walk timeout, kiểm tra đường
truyền và điều chỉnh timeout/Max repetition trên SNMP interface.

Với firmware hoặc cấu hình phần cứng khác, dùng các bước kiểm tra trên để xác nhận
các nhánh MIB được hỗ trợ, tên entity và bộ đếm cổng logic.

## Tham khảo và nguồn gốc

- [HPE: OID CPU/RAM/nhiệt độ Comware và index phụ thuộc thiết bị](https://support.hpe.com/hpesc/public/docDisplay?docId=sf000098678en_us&docLocale=en_US).
- [Template HP Comware HH3C chính thức, Zabbix 7.0](https://github.com/zabbix/zabbix/blob/release/7.0/templates/net/hp_hh3c_snmp/template_net_hp_hh3c_snmp.yaml): tham chiếu bộ lọc module, entity class, bảng trạng thái HH3C.
- [Zabbix 7.0: SNMP agent và bulk walk](https://www.zabbix.com/documentation/7.0/en/manual/config/items/itemtypes/snmp).

Phát triển từ template HP A5120 của **Jakub Samek**. Bản này thay OID phần cứng cố định
bằng discovery, cấp UUID riêng, giữ giám sát interface của bản 7.0 và cập nhật tài liệu
cho A5500 HI.
