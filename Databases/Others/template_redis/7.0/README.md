# Redis 8 by Zabbix agent 2 — Zabbix 7.0

## Overview

Monitors Redis through the built-in Redis plugin of Zabbix agent 2. It works with or without Redis authentication: no password, `requirepass` (the `default` user) or a Redis ACL user.

The items, triggers, discovery rules, graphs and dashboards are the same as in the official Zabbix template **Redis by Zabbix agent 2** 7.0-4, which has the same content as 7.4-3. Changes are listed in [Changes compared with the official template](#changes-compared-with-the-official-template).

Tested:

- Zabbix agent 2 7.0.31 against Redis 8.0.5 in four setups: no authentication, `requirepass`, an ACL user with the minimal rights below, and a named session. Tested roles were a standalone instance, a master with a replica, and a replica, with AOF both on and off.
- Every item, discovery rule and item prototype was replayed offline against the agent 2 output (JSONPath, JavaScript, multipliers, value types). All values were valid.
- Import into Zabbix 7.0.31, followed by export and re-import.

Not tested: data collection through a running Zabbix server, Redis Cluster, Sentinel, TLS connections and Unix sockets.

*Vietnamese version: [files/README_vi.md](files/README_vi.md)*

## Requirements

- Zabbix server or proxy 7.0.
- **Zabbix agent 2 7.0.10 or newer.** The template keys pass a username as their last parameter (`redis.info[uri,password,section,user]`). Agent 2 builds before 7.0.10 do not accept that parameter, and every Redis item becomes unsupported. Check the version with `zabbix_agent2 -V`.
- Redis 4 or newer. Discovery rules add version 4+ and 5+ metrics automatically.
- Items are passive checks: the agent's `Server=` must allow the Zabbix server or proxy.

## Setup

1. Import `template_redis_with_zabbix-agent2_plugin.yaml` (**Data collection → Templates → Import**).
2. Link **Redis 8 by Zabbix agent 2** to the host that runs Zabbix agent 2. Process metrics (`proc.*`) only work when the agent runs on the Redis host.
3. Set `{$REDIS.CONN.URI}` if Redis is not at `tcp://localhost:6379`. Examples: `tcp://10.0.0.5:6380`, `unix:///run/redis/redis-server.sock`.
4. Set the authentication macros on the host:

| Redis setup | `{$REDIS.USERNAME}` | `{$REDIS.PASSWORD}` |
|---|---|---|
| No authentication | empty | empty |
| `requirepass` only | empty | the `requirepass` value |
| ACL user | ACL username | ACL user password |

With an empty username, the plugin authenticates as `default` (`AUTH default <password>`). With an empty password, it does not send `AUTH`. `{$REDIS.PASSWORD}` is a secret macro.

### Option: credentials in the agent configuration

Named sessions keep the password on the agent host. Add the session to the Redis plugin configuration (on Linux usually `/etc/zabbix/zabbix_agent2.d/plugins.d/redis.conf`) and restart the agent:

```ini
Plugins.Redis.Sessions.redis8.Uri=tcp://127.0.0.1:6379
Plugins.Redis.Sessions.redis8.User=zbx_monitor
Plugins.Redis.Sessions.redis8.Password=<password>
```

Then set `{$REDIS.CONN.URI}` = `redis8` and leave `{$REDIS.USERNAME}` and `{$REDIS.PASSWORD}` empty. Omit the `User` line to use `requirepass`.

### Minimal ACL user on Redis 8

The plugin runs `AUTH`, `CLIENT SETNAME`, `PING`, `INFO`, `CONFIG GET` and `SLOWLOG GET`:

```sh
redis-cli ACL SETUSER zbx_monitor on '>StrongPassword' -@all +info +ping '+config|get' '+slowlog|get' '+client|setname'
```

Save the user with `ACL SAVE` when Redis uses an `aclfile`, or with `CONFIG REWRITE` when users are kept in `redis.conf`.

`+config|get` also lets this user read `requirepass` and `masterauth`. The template masks these values before storing them, but the ACL user can still read them. If you remove `+config|get`, the **Get config** and **Max clients** items become unsupported, and so does the "Total number of connected clients is too high" trigger.

### Check the connection

Run on the agent host (quote the key for the shell). The result `1` means the connection and authentication work:

```sh
zabbix_agent2 -t 'redis.ping["tcp://127.0.0.1:6379","",""]'                          # no auth
zabbix_agent2 -t 'redis.ping["tcp://127.0.0.1:6379","<requirepass>",""]'             # requirepass
zabbix_agent2 -t 'redis.ping["tcp://127.0.0.1:6379","<password>","zbx_monitor"]'     # ACL user
zabbix_agent2 -t 'redis.info["tcp://127.0.0.1:6379","<password>","","zbx_monitor"]'  # full INFO as JSON
```

## Changes compared with the official template

- **Zabbix 7.0 export format.** The previous file in this folder was the official 7.4 export (`version: '7.4'`). Zabbix 7.0 rejects it: `Invalid tag "/zabbix_export/version": unsupported version number`. The file now uses the 7.0 format, without the 7.4-only `wizard_ready`, `readme` and macro `config` fields.
- **Separate template name and UUIDs.** The template is now **Redis 8 by Zabbix agent 2** with new UUIDs, so importing it does not overwrite the **Redis by Zabbix agent 2** template that ships with Zabbix 7.0. The item keys are the same, so do not link both templates to one host.
- **Passwords masked in "Get config".** When authentication is on, `CONFIG GET *` returns `requirepass` and `masterauth` in plain text. The official template stores that JSON in history for 1 hour, where Latest data shows it. A JavaScript step now replaces `requirepass`, `masterauth`, `tls-key-file-pass` and `tls-client-key-file-pass` with `******`. Because of this, the "Configuration has changed" trigger does not fire when only a password changes.
- The descriptions of the template and of `{$REDIS.CONN.URI}`, `{$REDIS.USERNAME}`, `{$REDIS.PASSWORD}` and `{$REDIS.PATTERN}` now explain these options.

## Operational notes

- **Wrong or missing credentials:** `redis.ping` returns `0` and raises "Redis: Service is down". The other Redis items become unsupported with a `WRONGPASS` or `NOAUTH` error, which Latest data shows.
- The item keys contain `{$REDIS.PASSWORD}`. Zabbix sends the resolved password to the agent in each passive check. Encrypt server/proxy-to-agent traffic (PSK or certificate), or use a named session.
- `{$REDIS.PATTERN}` must stay a glob pattern (empty means `*`). With a single parameter name, `CONFIG GET` returns a plain value instead of JSON, and **Max clients** breaks.
- Redis 7.0 removed `aof_rewrite_buffer_length`. On Redis 8, the **AOF rewrite buffer length** prototype therefore never receives data (the value is discarded; the item is not marked unsupported).
- New INFO sections in Redis 8 (`Keysizes`, `Modules`) and the `subexpiry` field of `Keyspace` are ignored.
- Keyspace **Average TTL** is an unsigned item. The millisecond value from Redis is converted to whole seconds.

## Monitoring coverage

72 items (4 agent 2 items, 68 dependent), 7 discovery rules, 62 item prototypes, 12 triggers, 6 trigger prototypes, 12 graphs, 4 graph prototypes, 2 dashboards and 5 value maps.

| Discovery rule | Key | Item prototypes |
|---|---|---|
| Process metrics discovery | `proc.num["{$REDIS.LLD.PROCESS_NAME}"]` | 4 |
| Keyspace discovery | `redis.keyspace.discovery` | 4 |
| Version 4+ metrics discovery | `redis.metrics.v4.discovery` | 21 |
| Version 5+ metrics discovery | `redis.metrics.v5.discovery` | 17 |
| AOF metrics discovery | `redis.persistence.aof.discovery` | 7 |
| Replication metrics discovery | `redis.replication.master.discovery` | 1 |
| Slave metrics discovery | `redis.replication.slave.discovery` | 8 |

Agent 2 items:

| Key | Purpose |
|---|---|
| `redis.ping["{$REDIS.CONN.URI}","{$REDIS.PASSWORD}","{$REDIS.USERNAME}"]` | Availability (1/0) |
| `redis.info["{$REDIS.CONN.URI}","{$REDIS.PASSWORD}","{$REDIS.SECTION}","{$REDIS.USERNAME}"]` | `INFO` as JSON: master item for clients, CPU, memory, persistence, replication, stats, keyspace |
| `redis.config["{$REDIS.CONN.URI}","{$REDIS.PASSWORD}","{$REDIS.PATTERN}","{$REDIS.USERNAME}"]` | `CONFIG GET` as JSON (passwords masked) |
| `redis.slowlog.count["{$REDIS.CONN.URI}","{$REDIS.PASSWORD}","{$REDIS.USERNAME}"]` | Number of slowlog entries |

## Macros

| Macro | Default | Description |
|---|---|---|
| `{$REDIS.CONN.URI}` | `tcp://localhost:6379` | Redis URI or named session name |
| `{$REDIS.USERNAME}` | | ACL username; empty = `default` |
| `{$REDIS.PASSWORD}` | | Password (secret); empty = no auth |
| `{$REDIS.PATTERN}` | | `CONFIG GET` glob pattern; empty = `*` |
| `{$REDIS.SECTION}` | | `INFO` section; empty = default sections |
| `{$REDIS.PROCESS_NAME}` / `{$REDIS.LLD.PROCESS_NAME}` | `redis-server` | Process name for `proc.*` items |
| `{$REDIS.LLD.FILTER.DB.MATCHES}` / `{$REDIS.LLD.FILTER.DB.NOT_MATCHES}` | `.*` / `CHANGE_IF_NEEDED` | Keyspace discovery filter |
| `{$REDIS.CLIENTS.PRC.MAX.WARN}` | `80` | Connected clients, % of `maxclients` |
| `{$REDIS.MEM.PUSED.MAX.WARN}` | `90` | Memory used, % of `maxmemory` |
| `{$REDIS.MEM.ALLOC_FRAG_RATIO.MAX.WARN}` / `{$REDIS.MEM.ALLOC_FRAG_BYTES.MIN}` | `1.5` / `100M` | Allocator fragmentation |
| `{$REDIS.MEM.ALLOC_RSS_RATIO.MAX.WARN}` / `{$REDIS.MEM.ALLOC_RSS_BYTES.MIN}` | `1.5` / `100M` | Allocator RSS ratio |
| `{$REDIS.MEM.RSS_OVERHEAD_RATIO.MAX.WARN}` / `{$REDIS.MEM.RSS_OVERHEAD_BYTES.MIN}` | `1.5` / `100M` | RSS overhead ratio |
| `{$REDIS.REPL.LAG.MAX.WARN}` | `30s` | Replica: seconds since the last I/O with the master (`master_last_io_seconds_ago`) |
| `{$REDIS.SLOWLOG.COUNT.MAX.WARN}` | `1` | Slowlog entries per second |
