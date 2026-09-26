# Redis 8 by Zabbix agent 2 — Zabbix 7.0

File import: `template_redis_with_zabbix-agent2_plugin.yaml`. Tên template là **Redis 8 by Zabbix agent 2**, thuộc nhóm *Templates/Databases*.

Template giám sát Redis qua plugin Redis có sẵn trong Zabbix agent 2. Template dùng được cho Redis có hoặc không có xác thực: không mật khẩu, `requirepass` (user `default`) hoặc user ACL.

Item, trigger, discovery rule, graph và dashboard giống template chính thức **Redis by Zabbix agent 2** 7.0-4 của Zabbix (nội dung trùng với bản 7.4-3). Các điểm đã sửa được liệt kê ở mục [Thay đổi so với template chính thức](#thay-đổi-so-với-template-chính-thức).

Đã kiểm chứng:

- Zabbix agent 2 7.0.31 với Redis 8.0.5 trong bốn cấu hình: không xác thực, `requirepass`, user ACL có quyền tối thiểu (bên dưới) và named session. Các vai trò đã thử: instance đơn, master kèm replica, replica; AOF cả bật lẫn tắt.
- Chạy lại offline toàn bộ item, discovery rule và item prototype trên dữ liệu thật của agent 2 (JSONPath, JavaScript, multiplier, kiểu dữ liệu). Mọi giá trị đều hợp lệ.
- Import vào Zabbix 7.0.31, rồi export và import lại.

Chưa kiểm chứng: thu thập dữ liệu qua một Zabbix server đang chạy, Redis Cluster, Sentinel, kết nối TLS và Unix socket.

*Bản tiếng Anh: [../README.md](../README.md)*

## Yêu cầu

- Zabbix server hoặc proxy 7.0.
- **Zabbix agent 2 từ 7.0.10 trở lên.** Key của template truyền username ở tham số cuối (`redis.info[uri,password,section,user]`). Agent 2 bản cũ hơn 7.0.10 không nhận tham số này, nên mọi item Redis sẽ bị unsupported. Kiểm tra phiên bản bằng `zabbix_agent2 -V`.
- Redis 4 trở lên. Các metric riêng của bản 4+ và 5+ được discovery tự thêm.
- Item là passive check: dòng `Server=` của agent phải cho phép Zabbix server hoặc proxy.

## Cài đặt

1. Import `template_redis_with_zabbix-agent2_plugin.yaml` (**Data collection → Templates → Import**).
2. Gắn **Redis 8 by Zabbix agent 2** vào host chạy Zabbix agent 2. Metric process (`proc.*`) chỉ hoạt động khi agent chạy trên chính máy Redis.
3. Đặt `{$REDIS.CONN.URI}` nếu Redis không ở `tcp://localhost:6379`. Ví dụ: `tcp://10.0.0.5:6380`, `unix:///run/redis/redis-server.sock`.
4. Đặt macro xác thực trên host:

| Cấu hình Redis | `{$REDIS.USERNAME}` | `{$REDIS.PASSWORD}` |
|---|---|---|
| Không xác thực | để trống | để trống |
| Chỉ `requirepass` | để trống | giá trị `requirepass` |
| User ACL | tên user ACL | mật khẩu của user ACL |

Khi username trống, plugin đăng nhập bằng user `default` (`AUTH default <password>`). Khi password trống, plugin không gửi `AUTH`. `{$REDIS.PASSWORD}` là secret macro.

### Tuỳ chọn: lưu thông tin đăng nhập trong cấu hình agent

Named session giữ mật khẩu trên máy chạy agent. Thêm session vào cấu hình plugin Redis (trên Linux thường là `/etc/zabbix/zabbix_agent2.d/plugins.d/redis.conf`) rồi restart agent:

```ini
Plugins.Redis.Sessions.redis8.Uri=tcp://127.0.0.1:6379
Plugins.Redis.Sessions.redis8.User=zbx_monitor
Plugins.Redis.Sessions.redis8.Password=<password>
```

Sau đó đặt `{$REDIS.CONN.URI}` = `redis8`, để trống `{$REDIS.USERNAME}` và `{$REDIS.PASSWORD}`. Bỏ dòng `User` nếu dùng `requirepass`.

### User ACL tối thiểu trên Redis 8

Plugin dùng các lệnh `AUTH`, `CLIENT SETNAME`, `PING`, `INFO`, `CONFIG GET` và `SLOWLOG GET`:

```sh
redis-cli ACL SETUSER zbx_monitor on '>StrongPassword' -@all +info +ping '+config|get' '+slowlog|get' '+client|setname'
```

Lưu user bằng `ACL SAVE` nếu Redis dùng `aclfile`, hoặc bằng `CONFIG REWRITE` nếu user khai báo trong `redis.conf`.

Quyền `+config|get` cũng cho user này đọc được `requirepass` và `masterauth`. Template che các giá trị đó trước khi lưu, nhưng bản thân user ACL vẫn đọc được. Nếu bỏ `+config|get`, hai item **Get config** và **Max clients** sẽ bị unsupported, kéo theo trigger "Total number of connected clients is too high".

### Kiểm tra kết nối

Chạy trên máy có agent (đặt key trong dấu nháy của shell). Kết quả `1` nghĩa là kết nối và xác thực đều đúng:

```sh
zabbix_agent2 -t 'redis.ping["tcp://127.0.0.1:6379","",""]'                          # không xác thực
zabbix_agent2 -t 'redis.ping["tcp://127.0.0.1:6379","<requirepass>",""]'             # requirepass
zabbix_agent2 -t 'redis.ping["tcp://127.0.0.1:6379","<password>","zbx_monitor"]'     # user ACL
zabbix_agent2 -t 'redis.info["tcp://127.0.0.1:6379","<password>","","zbx_monitor"]'  # toàn bộ INFO dạng JSON
```

## Thay đổi so với template chính thức

- **Định dạng export Zabbix 7.0.** File cũ trong thư mục này là bản export 7.4 chính thức (`version: '7.4'`). Zabbix 7.0 từ chối file đó với lỗi `Invalid tag "/zabbix_export/version": unsupported version number`. File mới dùng định dạng 7.0, không còn các trường chỉ có ở 7.4 là `wizard_ready`, `readme` và `config` của macro.
- **Tên template và UUID riêng.** Template đổi tên thành **Redis 8 by Zabbix agent 2** và có UUID mới, nên khi import không ghi đè template **Redis by Zabbix agent 2** có sẵn trong Zabbix 7.0. Item key giữ nguyên, vì vậy không gắn cả hai template vào cùng một host.
- **Che mật khẩu trong "Get config".** Khi bật xác thực, `CONFIG GET *` trả về `requirepass` và `masterauth` dạng rõ. Template chính thức lưu JSON này vào history 1 giờ và hiện nó trong Latest data. Một bước JavaScript giờ thay `requirepass`, `masterauth`, `tls-key-file-pass` và `tls-client-key-file-pass` bằng `******`. Hệ quả là trigger "Configuration has changed" không báo khi chỉ đổi mật khẩu.
- Mô tả của template và của `{$REDIS.CONN.URI}`, `{$REDIS.USERNAME}`, `{$REDIS.PASSWORD}`, `{$REDIS.PATTERN}` đã được viết lại để giải thích các tuỳ chọn trên.

## Lưu ý vận hành

- **Sai hoặc thiếu thông tin đăng nhập:** `redis.ping` trả về `0` và bật trigger "Redis: Service is down". Các item Redis khác bị unsupported với lỗi `WRONGPASS` hoặc `NOAUTH`, xem được trong Latest data.
- Item key chứa `{$REDIS.PASSWORD}`. Zabbix gửi mật khẩu đã giải macro tới agent trong mỗi passive check. Hãy mã hoá kết nối từ server/proxy tới agent (PSK hoặc certificate), hoặc dùng named session.
- `{$REDIS.PATTERN}` phải là glob pattern (để trống nghĩa là `*`). Nếu đặt đúng một tên tham số, `CONFIG GET` trả về giá trị đơn thay vì JSON, làm hỏng item **Max clients**.
- Redis 7.0 đã bỏ trường `aof_rewrite_buffer_length`. Vì vậy trên Redis 8, prototype **AOF rewrite buffer length** không bao giờ có dữ liệu (giá trị bị discard, item không bị đánh dấu unsupported).
- Các section INFO mới của Redis 8 (`Keysizes`, `Modules`) và trường `subexpiry` trong `Keyspace` bị bỏ qua.
- **Average TTL** của keyspace là item unsigned. Giá trị mili giây từ Redis được đổi sang số giây nguyên.

## Phạm vi giám sát

72 item (4 item agent 2, 68 item dependent), 7 discovery rule, 62 item prototype, 12 trigger, 6 trigger prototype, 12 graph, 4 graph prototype, 2 dashboard và 5 value map.

| Discovery rule | Key | Item prototype |
|---|---|---|
| Process metrics discovery | `proc.num["{$REDIS.LLD.PROCESS_NAME}"]` | 4 |
| Keyspace discovery | `redis.keyspace.discovery` | 4 |
| Version 4+ metrics discovery | `redis.metrics.v4.discovery` | 21 |
| Version 5+ metrics discovery | `redis.metrics.v5.discovery` | 17 |
| AOF metrics discovery | `redis.persistence.aof.discovery` | 7 |
| Replication metrics discovery | `redis.replication.master.discovery` | 1 |
| Slave metrics discovery | `redis.replication.slave.discovery` | 8 |

Item agent 2:

| Key | Chức năng |
|---|---|
| `redis.ping["{$REDIS.CONN.URI}","{$REDIS.PASSWORD}","{$REDIS.USERNAME}"]` | Trạng thái sống (1/0) |
| `redis.info["{$REDIS.CONN.URI}","{$REDIS.PASSWORD}","{$REDIS.SECTION}","{$REDIS.USERNAME}"]` | `INFO` dạng JSON: master item cho clients, CPU, memory, persistence, replication, stats, keyspace |
| `redis.config["{$REDIS.CONN.URI}","{$REDIS.PASSWORD}","{$REDIS.PATTERN}","{$REDIS.USERNAME}"]` | `CONFIG GET` dạng JSON (đã che mật khẩu) |
| `redis.slowlog.count["{$REDIS.CONN.URI}","{$REDIS.PASSWORD}","{$REDIS.USERNAME}"]` | Số bản ghi slowlog |

## Macro

| Macro | Mặc định | Ý nghĩa |
|---|---|---|
| `{$REDIS.CONN.URI}` | `tcp://localhost:6379` | URI Redis hoặc tên named session |
| `{$REDIS.USERNAME}` | | User ACL; trống = `default` |
| `{$REDIS.PASSWORD}` | | Mật khẩu (secret); trống = không xác thực |
| `{$REDIS.PATTERN}` | | Glob pattern cho `CONFIG GET`; trống = `*` |
| `{$REDIS.SECTION}` | | Section của `INFO`; trống = các section mặc định |
| `{$REDIS.PROCESS_NAME}` / `{$REDIS.LLD.PROCESS_NAME}` | `redis-server` | Tên process cho item `proc.*` |
| `{$REDIS.LLD.FILTER.DB.MATCHES}` / `{$REDIS.LLD.FILTER.DB.NOT_MATCHES}` | `.*` / `CHANGE_IF_NEEDED` | Bộ lọc keyspace discovery |
| `{$REDIS.CLIENTS.PRC.MAX.WARN}` | `80` | Số client kết nối, % của `maxclients` |
| `{$REDIS.MEM.PUSED.MAX.WARN}` | `90` | Bộ nhớ đã dùng, % của `maxmemory` |
| `{$REDIS.MEM.ALLOC_FRAG_RATIO.MAX.WARN}` / `{$REDIS.MEM.ALLOC_FRAG_BYTES.MIN}` | `1.5` / `100M` | Phân mảnh allocator |
| `{$REDIS.MEM.ALLOC_RSS_RATIO.MAX.WARN}` / `{$REDIS.MEM.ALLOC_RSS_BYTES.MIN}` | `1.5` / `100M` | Tỷ lệ RSS của allocator |
| `{$REDIS.MEM.RSS_OVERHEAD_RATIO.MAX.WARN}` / `{$REDIS.MEM.RSS_OVERHEAD_BYTES.MIN}` | `1.5` / `100M` | Tỷ lệ RSS overhead |
| `{$REDIS.REPL.LAG.MAX.WARN}` | `30s` | Replica: số giây từ lần I/O cuối với master (`master_last_io_seconds_ago`) |
| `{$REDIS.SLOWLOG.COUNT.MAX.WARN}` | `1` | Số bản ghi slowlog mỗi giây |
