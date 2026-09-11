# Brocade G620 by SNMPv3 — Zabbix 7.0

File import: `template_fiber-channel_switch-brocade_G620_snmpv3.yaml`

Template giám sát switch Fibre Channel Brocade G620 (Gen 6, 32GFC) qua SNMP. Được điều chỉnh từ template Brocade FC của Zabbix thông qua template *Brocade 6505 by SNMPv3*, có tên và UUID riêng nên tồn tại song song được với cả hai — nhưng **không liên kết quá một template trong số đó vào cùng một host** vì trùng item key.

> **Ghi chú — Dell Connectrix DS-6620B:** Dòng Brocade G620 được OEM cho Dell với tên **Dell Connectrix DS-6620B**. Đây là cùng một thiết bị chạy Fabric OS, nên template này cũng có thể sử dụng để monitor Dell Connectrix DS-6620B.

MIB sử dụng: **SW-MIB**, **FCMGMT-MIB (FA-MIB)**, **IF-MIB**, **SNMPv2-MIB**, **HOST-RESOURCES-MIB**.

Phiên bản SNMP và thông tin xác thực đặt trên **interface của host**, không nằm trong template. Item SNMP trap cần cấu hình bộ nhận trap riêng trên server/proxy.

**Đã xác nhận OID bằng `snmpwalk` trên Dell Connectrix DS-6620B (Brocade G620, `switchType 183`, `sysObjectID` `1.3.6.1.4.1.1588.2.1.1.1.183`) chạy Fabric OS v9.0.0a.** Xây dựng từ template Brocade 6505, vốn đã kiểm thử trên thiết bị Brocade 6505 chạy Fabric OS 8.0.2c, với Zabbix server 7.0.29.

*Bản tiếng Anh: [../README.md](../README.md)*

---

# 1. Danh mục item được monitor

## 1.1 Item cố định của template

| Item | Key | Nguồn | Đơn vị | Chu kỳ |
| --- | --- | --- | --- | --- |
| ICMP ping | `icmpping` | simple check | | 1m |
| ICMP loss | `icmppingloss` | simple check | % | 1m |
| ICMP response time | `icmppingsec` | simple check | s | 1m |
| SNMP agent availability | `zabbix[host,snmp,available]` | internal | | 1m |
| SNMP traps (fallback) | `snmptrap.fallback` | snmp trap | | — |
| CPU utilization | `system.cpu.util[swCpuUsage.0]` | `1.3.6.1.4.1.1588.2.1.1.1.26.1.0` | % | 1m |
| Memory utilization | `vm.memory.util[swMemUsage.0]` | `1.3.6.1.4.1.1588.2.1.1.1.26.6.0` | % | 1m |
| Overall system health status | `system.status[swOperStatus.0]` | `1.3.6.1.4.1.1588.2.1.1.1.1.7.0` | | 30s |
| Firmware version | `system.hw.firmware` | `1.3.6.1.4.1.1588.2.1.1.1.1.6.0` | | 1h |
| Factory serial number | `system.hw.serialnumber` | `1.3.6.1.4.1.1588.2.1.1.1.1.10.0` | | 1h |
| Uptime (network) | `system.net.uptime[sysUpTime.0]` | `1.3.6.1.2.1.1.3.0` | uptime | 30s |
| System name | `system.name` | `1.3.6.1.2.1.1.5.0` | | 15m |
| System description | `system.descr[sysDescr.0]` | `1.3.6.1.2.1.1.1.0` | | 15m |
| System location | `system.location[sysLocation.0]` | `1.3.6.1.2.1.1.6.0` | | 15m |
| System contact details | `system.contact[sysContact.0]` | `1.3.6.1.2.1.1.4.0` | | 15m |
| System object ID | `system.objectid[sysObjectID.0]` | `1.3.6.1.2.1.1.2.0` | | 15m |
| ~~Uptime (hardware)~~ | `system.hw.uptime[hrSystemUptime.0]` | `1.3.6.1.2.1.25.1.1.0` | uptime | **Disabled** |

**Uptime (hardware)** tắt mặc định: Fabric OS không cài đặt HOST-RESOURCES-MIB, switch trả `noSuchName`. Bật lại nếu firmware của bạn đáp ứng OID này — nó là nguồn tốt hơn vì đo từ lúc boot, còn `sysUpTime` đo từ lúc SNMP agent khởi động.

## 1.2 `FC port discovery` — trạng thái và lỗi cổng FC

Nguồn: SW-MIB `swFCPortTable` (`1.3.6.1.4.1.1588.2.1.1.1.6.2.1`). Chu kỳ discovery `1h`.
Index `{#SNMPINDEX}` = `swFCPortIndex` bắt đầu từ 1, số cổng Fabric OS bắt đầu từ 0 → index 1 là port 0.

| Item | Cột OID | Đơn vị | Chu kỳ |
| --- | --- | --- | --- |
| Frames received | `.14` `swFCPortRxFrames` | fps | 1m |
| Frames sent | `.13` `swFCPortTxFrames` | fps | 1m |
| CRC errors | `.22` `swFCPortRxCrcs` | /s | 1m |
| Encoding errors outside of frames | `.26` `swFCPortRxEncOutFrs` | /s | 1m |
| Class 3 frames discarded | `.28` `swFCPortC3Discards` | /s | 1m |
| Transmit credit shortage | `.20` `swFCPortNoTxCredits` | /s | 1m |
| Operational status | `.4` `swFCPortOpStatus` | | 1m |
| Physical state | `.3` `swFCPortPhyState` | | 3m |
| Port type | `.39` `swFCPortBrcdType` | | 5m |
| ~~Bits received~~ | `.12` `swFCPortRxWords` | bps | **Disabled** |
| ~~Bits sent~~ | `.11` `swFCPortTxWords` | bps | **Disabled** |
| ~~Speed~~ / ~~Speed, nominal bitrate~~ | `.35` `swFCPortSpeed` | | **Disabled** |

Fabric OS 8.x **đã bỏ** các cột `11`, `12` và `35` khỏi `swFCPortTable`. G620 chạy Fabric OS 8.x trở lên — trên Fabric OS v9.0.0a đã xác nhận ba cột này không còn — nên với dòng này hãy để các item đó ở trạng thái tắt.

**Frames received/sent là tốc độ khung, không phải bit rate** — một khung FC mang 0–2112 byte payload nên không quy đổi được sang bps. Băng thông thật nằm ở rule tiếp theo.

## 1.3 `FC port traffic discovery` — băng thông cổng FC

Nguồn: FCMGMT-MIB `connUnitPortStatTable` (`1.3.6.1.3.94.4.5.1`) và `connUnitPortTable`. Chu kỳ discovery `1h`.

| Item | OID | Đơn vị | Chu kỳ |
| --- | --- | --- | --- |
| Bits received | `1.3.6.1.3.94.4.5.1.7` `connUnitPortStatCountRxElements` | bps | 1m |
| Bits sent | `1.3.6.1.3.94.4.5.1.6` `connUnitPortStatCountTxElements` | bps | 1m |
| Speed | `1.3.6.1.3.94.1.10.1.15` `connUnitPortSpeed` | bps | 5m |

Bộ đếm là **octet 64-bit** trả về dạng OCTET STRING 8 byte (`00 04 34 14 10 A2 BF E0`), đọc được cả trên SNMPv1 — khác `Counter64` của IF-MIB. Item có bước JavaScript đổi hex sang số, rồi `Change per second`, rồi `×8`.

Bảng này đánh index bằng **WWN switch 16 byte + port index**, khác hoàn toàn `swFCPortIndex`, nên Zabbix không ghép chung một discovery rule được. Thành phần cuối của index bằng `swFCPortIndex` nên `{#FCPORTNUM}` = số cổng Fabric OS. Cả hai rule FC gắn tag `port: <số cổng>` để lọc chung.

`connUnitPortSpeed` trả về KB/s, item nhân `8000` để ra tốc độ tín hiệu đúng tên gọi chuẩn FC: `4000000` → **32 Gbps**, `2000000` → **16 Gbps**, khớp cột speed của `switchshow`. Trên Fabric OS v9.0.0a, cổng online trả tốc độ đã negotiate (cổng N16 trả `2000000`, các cổng N32 bên cạnh trả `4000000`); cổng không có link trả tốc độ tối đa `4000000`.

`connUnitPortStatTable` **không có cột trạng thái quản trị**, nên rule lấy thêm `connUnitPortState` (`1.3.6.1.3.94.1.10.1.6`) từ `connUnitPortTable` — bảng dùng chung index — vào `{#FCPORTSTATE}`. G620 có 64 cổng (48 cổng SFP+ số 0–47 và 4 cổng QSFP mang các cổng 48–63), thường chỉ một phần được cấp license qua Ports on Demand.

FCMGMT-MIB mô tả `connUnitPortState` là trạng thái do người dùng chọn, nhưng Fabric OS trả `offline(3)` cho **mọi cổng không online**, và `swFCPortAdmStatus` cũng vậy. Giá trị đọc được từ DS-6620B chạy Fabric OS v9.0.0a:

| Cổng trong `switchshow` | `connUnitPortState` | `swFCPortAdmStatus` | Được discovery |
| --- | --- | --- | --- |
| `Online` | `online(2)` | `online(1)` | ✓ |
| `No_Light`, cổng đang enable | `offline(3)` | `offline(2)` | — |
| `No_Module`, chưa có license QFLEX Ports on Demand, `Disabled` | `offline(3)` | `offline(2)` | — |

Vì vậy cả hai rule FC discovery các cổng **đang online tại thời điểm chạy discovery**. Cổng online sau này — mới cắm cáp, hoặc mới có license và được enable — sẽ tự được thêm ở lần chạy kế tiếp, không cần sửa macro. `{$FC.TRAFFIC.PORT.NOT_MATCHES}` vẫn dùng được để loại thêm cổng đang online theo số cổng.

### Cổng bị down sau khi đã discovery

Cổng đã được discovery mà mất link sẽ không còn trong kết quả discovery lần sau. Để vẫn theo dõi được, cả hai rule FC đặt **Disable lost resources = Never** và **Delete lost resources = sau 30d**: item của cổng vẫn tiếp tục được poll, problem *Port is not online* giữ nguyên tới khi cổng online lại, và chỉ cổng vắng mặt quá 30 ngày mới bị xóa. Có thể đổi trên rule tại **Data collection → Templates → Discovery rules → \<rule\>** nếu muốn cách khác — đặt **Never** cho cả hai thì giữ mọi cổng từng online.

## 1.4 `FAN Discovery` / `PSU Discovery` / `Temperature Discovery`

Nguồn: SW-MIB `swSensorTable` (`1.3.6.1.4.1.1588.2.1.1.1.1.22.1`). Chu kỳ discovery `1h`.

| Rule | `swSensorType` | Item |
| --- | --- | --- |
| FAN Discovery | `fan(2)` | Fan speed (`.4`, rpm), Fan status (`.3`) |
| PSU Discovery | `power-supply(3)` | Power supply status (`.3`) |
| Temperature Discovery | `temperature(1)` | Temperature (`.4`, °C), Temperature status (`.3`) |

`swSensorTable` liệt kê **mọi slot cảm biến nền tảng có thể có**, không chỉ slot đã lắp phần cứng. Switch có khe quạt hoặc khe nguồn trống vẫn trả về dòng cho khe đó với `swSensorStatus` = `absent(6)`. Ba rule lấy thêm `{#SENSOR_STATUS}` và loại các dòng khớp `{$SENSOR.STATUS.NOT_MATCHES}`.

Bước preprocessing JavaScript cắt khoảng trắng đầu/cuối của `{#SENSOR_INFO}`, vì Fabric OS trả tên cảm biến có dấu cách đầu (`" FAN #1"`).

Trên DS-6620B chạy Fabric OS v9.0.0a, bảng có 11 cảm biến nhiệt (`SLOT #0: TEMP #1` … `#11`), 2 quạt và 2 nguồn.

## 1.5 `Network interfaces discovery` — cổng Ethernet quản trị

Nguồn: IF-MIB. Chu kỳ discovery `1h`. Mặc định `{$NET.IF.IFTYPE.MATCHES}` = `^6$`, chỉ lấy cổng Ethernet.

| Item | OID |
| --- | --- |
| Bits received / sent | `ifHCInOctets` / `ifHCOutOctets` (64-bit) |
| Inbound/Outbound packets with errors | `ifInErrors` / `ifOutErrors` |
| Inbound/Outbound packets discarded | `ifInDiscards` / `ifOutDiscards` |
| Speed | `ifHighSpeed` |
| Operational status | `ifOperStatus` |
| Interface type | `ifType` |

Cổng FC **không** đi qua rule này. `ifHCInOctets` kiểu `Counter64` — SNMPv1 không có kiểu dữ liệu này nên không đọc được, và nhiều bản Fabric OS cũng không cài đặt `ifXTable` cho cổng FC. Nếu firmware của bạn có, đặt `{$NET.IF.IFTYPE.MATCHES}` = `^(6\|56)$`.

---

# 2. Danh mục trigger cảnh báo

## 2.1 Khả dụng và hệ thống

| Trigger | Mức | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| Unavailable by ICMP ping | HIGH | | |
| No SNMP data collection | WARNING | | Unavailable by ICMP ping |
| High ICMP ping loss | WARNING | | Unavailable by ICMP ping |
| High ICMP ping response time | WARNING | | High ICMP ping loss |
| System status is in critical state | HIGH | | |
| System status is in warning state | WARNING | | System status is in critical state |
| High CPU utilization | WARNING | | |
| High memory utilization | AVERAGE | | |
| Host has been restarted | WARNING | ✓ | No SNMP data collection |
| Firmware has changed | INFO | ✓ | |
| Device has been replaced | INFO | ✓ | |
| System name has changed | INFO | ✓ | |

**Host has been restarted** đọc `sysUpTime` và có thêm điều kiện `max(sysUpTime,15m) < {$UPTIME.WRAP.THRESHOLD}`. SNMP `TimeTicks` là bộ đếm 32-bit không dấu đơn vị 1/100 giây, tràn sau **497 ngày** rồi quay về 0 dù thiết bị không reboot; điều kiện này chặn cảnh báo giả định kỳ đó.

## 2.2 Cổng Fibre Channel

| Trigger | Mức | Đóng tay | Phụ thuộc | Rule |
| --- | --- | --- | --- | --- |
| Port is not online | AVERAGE | ✓ | | FC port discovery |
| High error rate | WARNING | ✓ | Port is not online | FC port discovery |
| Class 3 frames are being discarded | WARNING | ✓ | Port is not online | FC port discovery |
| ~~High bandwidth usage~~ (SW-MIB) | WARNING | ✓ | Port is not online | **Disabled** |
| High bandwidth usage | WARNING | ✓ | | FC port traffic discovery |

**Port is not online** bắn theo **thay đổi trạng thái**: chỉ kích hoạt khi cổng rời khỏi `online(1)` sau khi đã từng online, nên cổng chưa bao giờ dùng không sinh cảnh báo. Tắt riêng từng cổng bằng `{$FC.PORTCONTROL:"<nhãn cổng>"}=0`.

**High bandwidth usage** của rule traffic so sánh với `Speed × {$FC.SPEED.PAYLOAD.RATIO}`, không so với Speed. Hai item lưu lượng đếm octet của khung còn `connUnitPortSpeed` báo tín hiệu thô trên dây; nhân `0.8` cho ra throughput chuẩn FC công bố (16GFC = 1600 MB/s = 12,8 Gbps, 32GFC = 3200 MB/s = 25,6 Gbps). Trigger này không có dependency vào trạng thái cổng vì trigger đó thuộc rule khác, mà Zabbix chỉ cho phép dependency trong cùng một rule.

## 2.3 Quạt, nguồn, nhiệt độ

| Trigger | Mức | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| Fan is in critical state | AVERAGE | ✓ | |
| Fan is not in normal state | INFO | ✓ | Fan is in critical state |
| Power supply is in critical state | AVERAGE | ✓ | |
| Power supply is not in normal state | INFO | ✓ | Power supply is in critical state |
| Temperature is above critical threshold | HIGH | | |
| Temperature is above warning threshold | WARNING | | Temperature is above critical threshold |
| Temperature is too low | AVERAGE | | |

**`is not in normal state`** bắn theo **thay đổi trạng thái**, kèm recovery expression riêng:

```
count(status,#1,"ne",{$FAN_OK_STATUS})=1 and (last(status,#1)<>last(status,#2))
recovery: count(status,#1,"eq",{$FAN_OK_STATUS})=1
```

Cảm biến nằm im ở một trạng thái bất thường không sinh problem. Khi trạng thái *chuyển* ra khỏi `nominal(4)` thì problem được tạo và tồn tại cho tới khi cảm biến trở về `nominal(4)`, hoặc bạn đóng tay.

| Kịch bản | Chuỗi status | INFO | AVERAGE |
| --- | --- | --- | --- |
| Slot trống, luôn absent | `6 6 6 6` | — | — |
| Quạt đang chạy rồi bị rút | `4 4 6 6` | **bắn** | — |
| Quạt đang chạy rồi hỏng | `4 4 2 2` | **bắn** | **bắn** |
| Hỏng rồi thay quạt mới | `2 2 4 4` | recover | recover |
| Link template khi quạt đã hỏng | `2 2 2 2` | — | **bắn** |

**`is in critical state`** cố ý **giữ kiểu theo trạng thái**: `faulty(2)` luôn là lỗi thật, không bao giờ là slot trống, nên nó phải cảnh báo cả khi thiết bị đã hỏng sẵn từ trước lúc link template — dòng cuối bảng.

Biểu thức thay đổi trạng thái cần **hai mẫu** mới đánh giá được, nên trigger ở trạng thái Unknown trong một chu kỳ poll sau khi item vừa tạo.

Nếu một cảm biến chuyển sang `absent(6)`, lần discovery kế tiếp sẽ lọc nó ra và item bị xóa sau khoảng `Delete lost resources` của rule — problem biến mất theo. Đặt `Delete lost resources` = **Never** cho ba rule FAN/PSU/Temperature tại **Data collection → Templates → Discovery rules → \<rule\> → tab LLD** nếu muốn cảnh báo tồn tại đến khi xử lý xong.

## 2.4 Cổng Ethernet quản trị

| Trigger | Mức | Đóng tay | Phụ thuộc |
| --- | --- | --- | --- |
| Link down | AVERAGE | ✓ | |
| High bandwidth usage | WARNING | ✓ | Link down |
| High error rate | WARNING | ✓ | Link down |
| Ethernet has changed to lower speed than it was before | INFO | ✓ | Link down |

---

# 3. Macro sử dụng

## 3.1 Ngưỡng cảnh báo

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$CPU.UTIL.CRIT}` | `90` | Ngưỡng CPU (%), trung bình 5 phút |
| `{$MEMORY.UTIL.MAX}` | `90` | Ngưỡng RAM (%), trung bình 5 phút |
| `{$TEMP_WARN}` / `{$TEMP_CRIT}` | `65` / `75` | Ngưỡng nhiệt độ °C. Dùng được context theo tên cảm biến |
| `{$TEMP_CRIT_LOW}` | `5` | Ngưỡng nhiệt độ thấp bất thường °C |
| `{$ICMP_LOSS_WARN}` | `20` | Ngưỡng mất gói ICMP (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | Ngưỡng thời gian đáp ICMP (giây) |
| `{$SNMP.TIMEOUT}` | `5m` | Khoảng thời gian cho trigger SNMP availability |
| `{$UPTIME.WRAP.THRESHOLD}` | `496d` | Uptime vượt mức này thì việc về 0 được hiểu là counter TimeTicks tràn, không phải reboot |

## 3.2 Trạng thái phần cứng

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$HEALTH_CRIT_STATUS}` | `4` | `swOperStatus` = faulty |
| `{$HEALTH_WARN_STATUS:"offline"}` | `2` | `swOperStatus` = offline |
| `{$HEALTH_WARN_STATUS:"testing"}` | `3` | `swOperStatus` = testing |
| `{$FAN_OK_STATUS}` / `{$PSU_OK_STATUS}` | `4` | `swSensorStatus` = nominal |
| `{$FAN_CRIT_STATUS}` / `{$PSU_CRIT_STATUS}` | `2` | `swSensorStatus` = faulty |
| `{$TEMP_WARN_STATUS}` | `5` | `swSensorStatus` = above max |
| `{$SENSOR.STATUS.NOT_MATCHES}` | `^(1\|6)$` | Trạng thái nghĩa là **không có phần cứng** sau dòng cảm biến: `unknown(1)`, `absent(6)`. Ba rule FAN/PSU/Temperature bỏ qua các dòng này. Đặt `CHANGE_IF_NEEDED` để discovery cả chúng |

## 3.3 Cổng Fibre Channel

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$FC.PORT.ADMSTATUS.MATCHES}` | `^.*$` | Lọc discovery theo `swFCPortAdmStatus` |
| `{$FC.PORT.ADMSTATUS.NOT_MATCHES}` | `^2$` | Bỏ qua cổng FC `offline(2)` — trên Fabric OS là mọi cổng không online, kể cả cổng enable nhưng không có tín hiệu quang |
| `{$FC.PORT.NAME.MATCHES}` | `^.*$` | Lọc discovery theo nhãn cổng (`swFCPortSpecifier` + `swFCPortName`) |
| `{$FC.PORT.NAME.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Loại trừ cổng theo nhãn |
| `{$FC.TRAFFIC.PORT.MATCHES}` | `^[0-9]+$` | Lọc rule băng thông FA-MIB theo **số cổng** |
| `{$FC.TRAFFIC.PORT.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Loại cổng đang online khỏi rule băng thông theo số cổng, ví dụ `^(4[89]\|5[0-9]\|6[0-3])$` để bỏ port 48–63 (các cổng QSFP của G620) |
| `{$FC.TRAFFIC.PORT.STATE.MATCHES}` | `^.*$` | Lọc rule băng thông FA-MIB theo `connUnitPortState` |
| `{$FC.TRAFFIC.PORT.STATE.NOT_MATCHES}` | `^3$` | Bỏ qua cổng `offline(3)` — trên Fabric OS là mọi cổng không online. Đặt `CHANGE_IF_NEEDED` để discovery mọi cổng |
| `{$FC.PORTCONTROL}` | `1` | `{$FC.PORTCONTROL:"<nhãn cổng>"}=0` tắt trigger *Port is not online* cho cổng không dùng |
| `{$FC.IF.UTIL.MAX}` | `90` | Ngưỡng % băng thông cổng FC |
| `{$FC.SPEED.PAYLOAD.RATIO}` | `0.8` | Tỉ lệ tín hiệu mang dữ liệu khung, dùng làm mốc 100% của trigger băng thông. `0.8` đến từ mã hóa 8b/10b, chính xác với 1/2/4/8GFC; từ 16GFC dùng 64b/66b nên trần thật cao hơn vài phần trăm và cổng bão hòa có thể vượt 100% |
| `{$FC.IF.ERRORS.WARN}` | `2` | Ngưỡng lỗi CRC/encoding (lỗi/giây) |
| `{$FC.C3DISCARD.WARN}` | `1` | Ngưỡng Class 3 discard (khung/giây) |

Tất cả macro cổng FC dùng được context: theo **nhãn cổng** với rule SW-MIB (`{$FC.IF.ERRORS.WARN:"0 port0"}`), theo **số cổng** với rule FA-MIB (`{$FC.SPEED.PAYLOAD.RATIO:"2"}`).

## 3.4 Cổng Ethernet quản trị

| Macro | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `{$NET.IF.IFTYPE.MATCHES}` | `^6$` | Chỉ discovery cổng Ethernet. Đặt `^(6\|56)$` để thêm cổng FC vào IF-MIB discovery |
| `{$NET.IF.IFTYPE.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Loại trừ theo `ifType` |
| `{$NET.IF.IFADMINSTATUS.MATCHES}` | `^.*` | Lọc theo `ifAdminStatus` |
| `{$NET.IF.IFADMINSTATUS.NOT_MATCHES}` | `^2$` | Bỏ qua `ifAdminStatus` down(2) |
| `{$NET.IF.IFOPERSTATUS.MATCHES}` | `^.*$` | Lọc theo `ifOperStatus` |
| `{$NET.IF.IFOPERSTATUS.NOT_MATCHES}` | `^6$` | Bỏ qua `notPresent(6)` |
| `{$NET.IF.IFNAME.MATCHES}` | `^.*$` | Lọc theo `ifName` |
| `{$NET.IF.IFNAME.NOT_MATCHES}` | loopback, null, docker… | Lọc các interface ảo |
| `{$NET.IF.IFALIAS.MATCHES}` | `.*` | Lọc theo `ifAlias` |
| `{$NET.IF.IFALIAS.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Loại trừ theo `ifAlias` |
| `{$NET.IF.IFDESCR.MATCHES}` | `.*` | Lọc theo `ifDescr` |
| `{$NET.IF.IFDESCR.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Loại trừ theo `ifDescr` |
| `{$IFCONTROL}` | `1` | `{$IFCONTROL:"<tên interface>"}=0` tắt trigger *Link down* |
| `{$IF.UTIL.MAX}` | `90` | Ngưỡng % băng thông interface Ethernet |
| `{$IF.ERRORS.WARN}` | `2` | Ngưỡng lỗi gói (gói/giây) |
