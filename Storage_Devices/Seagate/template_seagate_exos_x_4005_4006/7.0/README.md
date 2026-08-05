# Zabbix Template for Seagate Exos X 4005/4006 Storage

Zabbix 7.0+ template for monitoring Seagate Exos storage systems through the
native JSON management API.

The template is designed for Seagate Exos X 4005/4006 systems with Gallium or
Indium controller modules and the following enclosure formats:

- 2U12
- 2U24
- 5U84

It was validated offline with real API responses from:

- Seagate Exos X 4005-family storage reporting product ID `4865`
- Seagate Exos X 4006

It uses native Zabbix features only: Script items, dependent items, low-level
discovery, trigger prototypes, graph prototypes, template dashboards, value
maps, and host macros. No external scripts or Zabbix Agent are required on the
storage system.


## Repository

Current template source:

[https://github.com/guicampos21/zabbix-templates/tree/main/templates/storage/template_seagate_exos_x_4005_4006/7.0](https://github.com/guicampos21/zabbix-templates/tree/main/templates/storage/template_seagate_exos_x_4005_4006/7.0)

## Version 1.1.2

Version 1.1.2 is a backward-compatible correction release for version 1.1.1.

It changes the host-port down trigger from a static state check to a
transition-aware alert:

```text
Up -> non-Up
```

A host port that is already disconnected when the template is linked or
updated does not create a problem. This prevents unused FC/iSCSI ports from
generating false alarms.

After a monitored port transitions from `Up` to any non-Up state, the problem
remains open until the port returns to `Up`.

Version 1.1.1 controller-specific API port support remains unchanged:

- `{$SEAGATE.API.PORT.PRIMARY}`
- `{$SEAGATE.API.PORT.SECONDARY}`

Existing API, NAT, collection, item, discovery, graph, dashboard, and UUID
behavior is preserved.

## Requirements

- Zabbix 7.0 or newer
- Network access from the Zabbix server or proxy to the storage management API
- A Seagate Exos account with Monitor/read-only permissions and Web/API access
- Native Seagate JSON API enabled

> [!IMPORTANT]
> Import and test the template on a non-critical host first. Offline YAML,
> UUID, and JavaScript validation does not replace an actual Zabbix import and
> a live collection/failover test against the target storage firmware.

## Installation

1. Download `template_seagate_exos_x_4005_4006.yaml`.
2. In Zabbix, open **Data collection > Templates**.
3. Select **Import** and choose the YAML file.
4. Create or select the host representing the storage array.
5. Link **Seagate Exos Storage by HTTP**.
6. Configure the required host macros:

| Macro | Example | Description |
|---|---|---|
| `{$SEAGATE.API.HOST}` | `192.0.2.10` | Primary controller management IP address or hostname |
| `{$SEAGATE.API.USERNAME}` | `zbx_monitor` | Monitor/read-only API user |
| `{$SEAGATE.API.PASSWORD}` | — | API password stored as a secret-text macro |

Optional connection macros:

| Macro | Default | Description |
|---|---:|---|
| `{$SEAGATE.API.SCHEME}` | `https` | API scheme: `https` or `http` |
| `{$SEAGATE.API.PORT}` | `443` | Shared/default management API TCP port |
| `{$SEAGATE.API.HOST.SECONDARY}` | empty | Optional partner-controller address |
| `{$SEAGATE.API.PORT.PRIMARY}` | empty | Primary-controller port override; inherits the shared port |
| `{$SEAGATE.API.PORT.SECONDARY}` | empty | Secondary-controller port override; inherits the shared port |
| `{$SEAGATE.HTTP.PROXY}` | empty | Optional HTTP proxy used by all Script master items |

The Zabbix host does not require Agent, SNMP, JMX, or IPMI interfaces. All
collection is performed by Script master items running on the Zabbix server or
the proxy assigned to the host.

## Controller-specific API ports

The template resolves the API port independently for each controller.

Primary controller:

```text
{$SEAGATE.API.PORT.PRIMARY}
        or, when empty:
{$SEAGATE.API.PORT}
```

Secondary controller:

```text
{$SEAGATE.API.PORT.SECONDARY}
        or, when empty:
{$SEAGATE.API.PORT}
```

The fallback to `{$SEAGATE.API.PORT}` preserves the behavior of version 1.1.0
and earlier host configurations.

### Use case 1: Standard direct management addresses

Both controllers use HTTPS TCP/443 and have different management addresses.

```text
{$SEAGATE.API.HOST} = 192.0.2.10
{$SEAGATE.API.HOST.SECONDARY} = 192.0.2.11
{$SEAGATE.API.PORT} = 443
{$SEAGATE.API.PORT.PRIMARY} =
{$SEAGATE.API.PORT.SECONDARY} =
```

The collector tries:

```text
https://192.0.2.10:443
```

and, if the primary endpoint cannot be used:

```text
https://192.0.2.11:443
```

### Use case 2: Both controllers behind the same NAT address

A NAT device publishes controller A on TCP/8001 and controller B on TCP/8002.

```text
{$SEAGATE.API.HOST} = storage-nat.example.com
{$SEAGATE.API.HOST.SECONDARY} = storage-nat.example.com
{$SEAGATE.API.PORT} = 443
{$SEAGATE.API.PORT.PRIMARY} = 8001
{$SEAGATE.API.PORT.SECONDARY} = 8002
```

The collector tries:

```text
https://storage-nat.example.com:8001
```

and, if that endpoint fails:

```text
https://storage-nat.example.com:8002
```

Version 1.1.1 and later allow the primary and secondary host values to be identical when
their resolved ports are different. This is required for controller-specific
destination NAT.

Example NAT rules:

```text
Public-IP:8001 -> Controller-A-IP:443
Public-IP:8002 -> Controller-B-IP:443
```

The Zabbix server or proxy must be able to reach both externally published
ports. Firewall source restrictions and NAT session timeouts must permit the
complete HTTPS API request.

### Use case 3: One custom port shared by both controllers

Both controllers listen or are published on TCP/8443.

```text
{$SEAGATE.API.HOST} = 192.0.2.10
{$SEAGATE.API.HOST.SECONDARY} = 192.0.2.11
{$SEAGATE.API.PORT} = 8443
{$SEAGATE.API.PORT.PRIMARY} =
{$SEAGATE.API.PORT.SECONDARY} =
```

Both controller-specific macros are empty, so both endpoints inherit TCP/8443.

### Use case 4: Different addresses and different ports

```text
{$SEAGATE.API.HOST} = 198.51.100.10
{$SEAGATE.API.HOST.SECONDARY} = 198.51.100.11
{$SEAGATE.API.PORT} = 443
{$SEAGATE.API.PORT.PRIMARY} = 8001
{$SEAGATE.API.PORT.SECONDARY} = 8002
```

The template uses the exact host-and-port pair assigned to each controller.

## Active management endpoint

The `Active management endpoint` item stores the endpoint selected by the
collector in `host:port` format.

Examples:

```text
storage-nat.example.com:8001
```

After failover:

```text
storage-nat.example.com:8002
```

This makes controller and NAT-port failover visible in Zabbix and Grafana.

## Backward compatibility

No host macro changes are required for arrays already monitored with version
1.1.0.

When these macros remain empty:

```text
{$SEAGATE.API.PORT.PRIMARY} =
{$SEAGATE.API.PORT.SECONDARY} =
```

the behavior remains:

```text
Primary:
{$SEAGATE.API.HOST}:{$SEAGATE.API.PORT}

Secondary:
{$SEAGATE.API.HOST.SECONDARY}:{$SEAGATE.API.PORT}
```

All existing item, discovery-rule, trigger, graph, and value-map UUIDs are
preserved. The template dashboard UUID published with version 1.1.0 is also
preserved.

## Storage-side preparation

Create a dedicated account in the Seagate management interface with the
Monitor/read-only role and Web/API access. Confirm that the Zabbix server or
proxy can reach each configured host-and-port pair.

The template authenticates using:

```text
SHA-256(username + "_" + password)
```

It obtains a session key, runs read-only `show` and supported `query` commands,
and logs out. The password is supplied through the
`{$SEAGATE.API.PASSWORD}` secret-text macro.

## First-run verification

Allow two or three polling cycles after linking or updating the template, then
check **Monitoring > Latest data**.

Verify:

1. `API availability raw` is supported.
2. `API available` reports `Yes`.
3. `Active management endpoint` shows the expected `host:port`.
4. All five Script master items collect without method errors:
   - API availability
   - Core data
   - Performance data
   - Inventory data
   - Events and alerts
5. Low-level discovery creates the expected controllers, disks, pools, volumes,
   ports, enclosures, and hardware components.
6. For NAT deployments, test TCP/8001 and TCP/8002 independently and confirm
   failover to the secondary endpoint.

Default collection schedule:

| Data set | Interval |
|---|---:|
| API availability | 1 minute |
| Core system and hardware state | 2 minutes |
| Performance | 1 minute |
| Events and alerts | 1 minute |
| Inventory | 30 minutes |

Intervals can be changed using the `{$SEAGATE.INTERVAL.*}` macros.

## Dashboard data freshness

The default inventory interval is 30 minutes. Dashboard-facing unchanged
values are periodically stored using preprocessing heartbeats so short Grafana
time ranges can still retrieve recent text and inventory values.

Grafana text panels must use the Zabbix data source **Text** query type for
Character, Text, and Log items. Numeric items use **Metrics**.

## Monitored components

Low-level discovery covers:

- Controllers
- Physical disks
- Disk groups
- Pools
- Volumes
- Storage tiers
- Enclosures
- Field-replaceable units
- Fans and power supplies
- Sensors
- SAS links
- FC, iSCSI, and SAS host ports
- Replication sets

The template monitors health, capacity, utilization, performance, firmware,
system read/write latency, error counters, the common Event Log, and structured
active alerts when supported by the storage generation.

## System latency

### Exos X 4006

The template queries native read-only Metrics Framework values:

```text
system.read-avg-response-time
system.write-avg-response-time
system.read-max-response-time
system.write-max-response-time
```

### 4005 / 4865 fallback

The tested 4005/4865 API does not expose the same Metrics Framework. The
template derives host-facing average read and write latency from I/O-weighted
host-port statistics:

```text
sum(port_latency_us * port_IO_rate) / sum(port_IO_rate)
```

`System latency: Source` identifies the method currently feeding the unified
system-latency items.


## Host-port down alert behavior

### Purpose

Storage arrays commonly have unused FC or iSCSI host ports. These ports are
normally reported as `Disconnected`, even though no cable, switch path, or host
connection is expected.

Earlier template versions alerted whenever the current status was not `Up`.
That behavior required contextual macros for every intentionally unused port.

Version 1.1.2 distinguishes between:

- a port that was already disconnected when monitoring started; and
- a port that was operational and then lost its connection.

### Problem condition

The host-port problem opens only when all of the following are true:

```text
Current status is not Up
Previous stored status was Up
{$SEAGATE.PORT.DOWN.ENABLED:"{#PORT.ID}"} = 1
```

Conceptual transition:

```text
Up -> Warning
Up -> Error
Up -> Not present
Up -> Unknown
Up -> Disconnected
```

A port whose first observed state is `Disconnected` has no previous `Up`
sample and therefore does not create a problem.

### Persistent problem behavior

The trigger uses a dedicated recovery expression:

```text
Current status = Up
```

This means that after a real `Up -> non-Up` transition:

- the problem opens once;
- repeated non-Up samples do not create duplicate events;
- the problem remains open for minutes, days, or weeks while the port remains
  non-Up; and
- the problem closes only when the port returns to `Up`.

The comparison with the previous sample is used only to detect the initial
transition. It does not cause the open problem to disappear on later polling
cycles.

### Contextual overrides

The existing contextual macro remains available:

```text
{$SEAGATE.PORT.DOWN.ENABLED:"A3"} = 0
```

Use it when a specific port must be completely excluded from host-port and SFP
alerting, even if that port was previously connected.

For normal unused ports, no per-port override is required in version 1.1.2.

### Upgrade note

Problems that were already open under the version 1.1.1 static-state trigger
may remain visible after import because they were created before the new
transition-aware logic.

The trigger prototype now permits manual close. After confirming that the
affected ports are intentionally unused, close those legacy problems once.
They will not reopen unless the port later becomes `Up` and then transitions
back to a non-Up state.

## Important macros

| Macro | Default | Purpose |
|---|---:|---|
| `{$SEAGATE.API.HOST}` | empty | Primary management host |
| `{$SEAGATE.API.HOST.SECONDARY}` | empty | Optional partner-controller host |
| `{$SEAGATE.API.PORT}` | `443` | Shared/default API port |
| `{$SEAGATE.API.PORT.PRIMARY}` | empty | Primary port override |
| `{$SEAGATE.API.PORT.SECONDARY}` | empty | Secondary port override |
| `{$SEAGATE.API.SCHEME}` | `https` | HTTP or HTTPS |
| `{$SEAGATE.API.USERNAME}` | `zbx_monitor` | Read-only API username |
| `{$SEAGATE.API.PASSWORD}` | secret | Read-only API password |
| `{$SEAGATE.HTTP.PROXY}` | empty | Optional HTTP proxy |
| `{$SEAGATE.ALERTS.MODE}` | `auto` | Structured Alerts mode |
| `{$SEAGATE.EVENTS.LAST}` | `100` | Number of recent events requested |
| `{$SEAGATE.ENCLOSURE.EXPECTED}` | `1` | Expected total enclosure count |
| `{$SEAGATE.PORT.DOWN.ENABLED}` | `1` | Enable transition-aware host-port/SFP alerts; override by port context to completely ignore a port |
| `{$SEAGATE.REDUNDANCY.REQUIRED}` | `1` | Require storage redundancy |
| `{$SEAGATE.NTP.REQUIRED}` | `0` | Require NTP when set to 1 |

## Security notes

- Use a dedicated Monitor/read-only storage account.
- Keep `{$SEAGATE.API.PASSWORD}` as a secret-text host macro.
- Limit firewall access to the Zabbix server or proxy source addresses.
- For NAT deployments, do not expose the management API broadly to the
  Internet.
- Prefer a private network, VPN, or dedicated management path.
- The template executes read-only API commands only.

## Troubleshooting controller-specific ports

### Primary works but the secondary endpoint is never attempted

Version 1.1.1 and later recognize the secondary endpoint when either the host or port
differs.

Confirm at least one condition is true:

```text
{$SEAGATE.API.HOST.SECONDARY} != {$SEAGATE.API.HOST}
```

or:

```text
{$SEAGATE.API.PORT.SECONDARY} != {$SEAGATE.API.PORT.PRIMARY}
```

### Both NAT ports fail

From the Zabbix server or proxy, verify TCP/TLS reachability:

```bash
curl -kI https://storage-nat.example.com:8001/
curl -kI https://storage-nat.example.com:8002/
```

An HTTP response from the root path can prove basic TCP/TLS reachability, but
the final test must use the Seagate API login endpoint or the Zabbix Script
item.

Check:

- Destination NAT rules
- Firewall source restrictions
- TCP port forwarding
- TLS inspection or reverse-proxy behavior
- Controller Web/API service status
- Credentials
- Zabbix Script item timeout

### Existing direct-connected storage stopped collecting after import

Confirm the new macros are empty or contain valid TCP ports:

```text
{$SEAGATE.API.PORT.PRIMARY} =
{$SEAGATE.API.PORT.SECONDARY} =
```

Also confirm the shared port is still correct:

```text
{$SEAGATE.API.PORT} = 443
```

## License

MIT

## Author

Guilherme Campos — `@guicampos21`


## Template dashboard

The **Overview** template dashboard uses the Zabbix 72-column Full HD grid and
contains two pages:

- **Overview**: API availability, system health, product, firmware,
  latency-source values, average and maximum system-latency graphs, and active
  problems.
- **Components**: controller, disk, pool, volume, host-port, and disk
  temperature graph prototypes.

## Validation

The supplied bundle includes an offline validation report covering:

- YAML parsing
- Zabbix export version
- Vendor version
- UUID uniqueness and UUIDv4 format
- Object-count preservation
- Current severity policy
- Host-port trigger UUID preservation
- Transition-aware problem expression
- Recovery expression
- Manual-close support
- JavaScript syntax for all Script master items
- Heartbeat policy
- Static state-machine scenarios

The final repository package preserves the 1.1.1 storage tags and passed the
repository checks with:

- `427` unique UUIDv4 identifiers
- `78` fixed items, `14` discovery rules, and `192` item prototypes
- `24` fixed triggers and `80` trigger prototypes
- `2` fixed graphs and `19` graph prototypes
- `51` High, `11` Average, `35` Warning, `7` Information, and no Disaster
  triggers
- SHA-256: `13a678cf46f939cc58fe5e8ede8b7e1e19ed3b21ffb033a13adeac7598b38c25`

Offline validation does not replace an import into Zabbix 7.0+ and a controlled
live test.

Recommended live validation:

1. Import version 1.1.2 over version 1.1.1.
2. Confirm an unused port already in `Disconnected` state does not open a new
   problem.
3. Connect a test port and confirm it reaches `Up`.
4. Disconnect the same port and confirm the problem opens.
5. Leave the port disconnected through multiple polling and heartbeat cycles
   and confirm the problem remains open.
6. Reconnect the port and confirm the problem closes.
7. Manually close any legacy unused-port problems created by version 1.1.1.

## Release history

### 1.1.2

- Changed the host-port down trigger to detect `Up -> non-Up` transitions.
- Prevented ports that are already disconnected from generating false alarms.
- Added a recovery expression so a real port-down event remains open until the
  port returns to `Up`.
- Enabled manual close for one-time cleanup of legacy unused-port problems.
- Preserved the contextual host-port/SFP alert macro.
- Preserved all existing UUIDs and monitoring objects.

### 1.1.1

- Added optional primary and secondary controller API port macros.
- Added same-host, different-port failover for NAT and port-forwarding.
- Preserved `{$SEAGATE.API.PORT}` as the backward-compatible shared default.
- Changed the active management endpoint value to `host:port`.

### 1.1.0

- Adopted the upstream-compatible directory and filename convention.
- Added a Full HD template dashboard with Overview and Components pages.
- Added optional HTTP proxy support.
- Published the normalized Seagate Exos X 4005/4006 monitoring package.

### 1.0.7

- Changed the inventory interval and former one-day preprocessing heartbeats to
  `30m` so unchanged dashboard-facing values remain recent.

### 1.0.6

- Added unified system read and write average latency.
- Added native average and maximum system latency for Exos X 4006.
- Added an I/O-weighted host-port fallback for the tested 4005/4865 API.
- Added the average and maximum system-latency graphs.

### 1.0.4

- Refined disconnected expansion-port handling.
- Added the expected-enclosure policy and related trigger.

<!-- BEGIN GENERATED MONITORING INVENTORY -->
## Complete monitoring inventory

Complete inventory generated from the Zabbix 7.0 YAML export, version 1.1.2.
It includes fixed objects and low-level discovery (LLD) prototypes.

> [!NOTE]
> Script master items and dependent/raw transport items are included because
> they are part of the template, even when they primarily support collection.
> Trigger source identifies the item prototype that owns the trigger in the
> Zabbix export; an expression can reference additional items.

### Inventory summary

| Object | Count |
|---|---:|
| Fixed items | 78 |
| Discovery rules | 14 |
| Item prototypes | 192 |
| Fixed triggers | 24 |
| Trigger prototypes | 80 |
| Fixed graphs | 2 |
| Graph prototypes | 19 |
| Template dashboards | 1 |
| Dashboard pages | 2 |
| Dashboard widgets | 14 |

### Fixed items

#### Alerts

| Item | Key | Type | Value type |
|---|---|---|---|
| Active alert summary | `seagate.exos.alerts.summary` | `DEPENDENT` | `TEXT` |
| Active warning alert count | `seagate.exos.alerts.active_warning` | `DEPENDENT` | `UNSIGNED` |
| Active error alert count | `seagate.exos.alerts.active_error` | `DEPENDENT` | `UNSIGNED` |
| Active critical alert count | `seagate.exos.alerts.active_critical` | `DEPENDENT` | `UNSIGNED` |

#### Cache

| Item | Key | Type | Value type |
|---|---|---|---|
| Controller A unwritable cache | `seagate.exos.cache.unwritable_a` | `DEPENDENT` | `UNSIGNED` |
| Controller B unwritable cache | `seagate.exos.cache.unwritable_b` | `DEPENDENT` | `UNSIGNED` |

#### Errors

| Item | Key | Type | Value type |
|---|---|---|---|
| API error detail | `seagate.exos.api.error` | `DEPENDENT` | `TEXT` |
| Core API method errors | `seagate.exos.core.errors` | `DEPENDENT` | `TEXT` |
| Performance API method errors | `seagate.exos.performance.errors` | `DEPENDENT` | `TEXT` |
| Inventory API method errors | `seagate.exos.inventory.errors` | `DEPENDENT` | `TEXT` |
| Events API method errors | `seagate.exos.events.errors` | `DEPENDENT` | `TEXT` |

#### Events

| Item | Key | Type | Value type |
|---|---|---|---|
| Latest warning event ID | `seagate.exos.event.latest_warning.id` | `DEPENDENT` | `UNSIGNED` |
| Latest warning event message | `seagate.exos.event.latest_warning.message` | `DEPENDENT` | `TEXT` |
| Latest error event ID | `seagate.exos.event.latest_error.id` | `DEPENDENT` | `UNSIGNED` |
| Latest error event message | `seagate.exos.event.latest_error.message` | `DEPENDENT` | `TEXT` |
| Latest critical event ID | `seagate.exos.event.latest_critical.id` | `DEPENDENT` | `UNSIGNED` |
| Latest critical event message | `seagate.exos.event.latest_critical.message` | `DEPENDENT` | `TEXT` |

#### Health

| Item | Key | Type | Value type |
|---|---|---|---|
| API available | `seagate.exos.api.available` | `DEPENDENT` | `UNSIGNED` |
| API authentication failed | `seagate.exos.api.auth_failed` | `DEPENDENT` | `UNSIGNED` |
| System health | `seagate.exos.system.health` | `DEPENDENT` | `UNSIGNED` |
| System health reason | `seagate.exos.system.health_reason` | `DEPENDENT` | `TEXT` |
| Redundancy state | `seagate.exos.system.redundant` | `DEPENDENT` | `UNSIGNED` |
| Other management controller operational | `seagate.exos.system.other_mc_operational` | `DEPENDENT` | `UNSIGNED` |

#### Inventory

| Item | Key | Type | Value type |
|---|---|---|---|
| Active management endpoint | `seagate.exos.api.endpoint` | `DEPENDENT` | `CHAR` |
| System name | `seagate.exos.system.name` | `DEPENDENT` | `CHAR` |
| Product ID | `seagate.exos.system.product_id` | `DEPENDENT` | `CHAR` |
| Product brand | `seagate.exos.system.product_brand` | `DEPENDENT` | `CHAR` |
| SCSI product ID | `seagate.exos.system.scsi_product_id` | `DEPENDENT` | `CHAR` |
| Platform type | `seagate.exos.system.platform` | `DEPENDENT` | `CHAR` |
| System firmware bundle | `seagate.exos.system.bundle_version` | `DEPENDENT` | `CHAR` |
| Structured Alerts API supported | `seagate.exos.alerts.supported` | `DEPENDENT` | `UNSIGNED` |

#### Performance

| Item | Key | Type | Value type |
|---|---|---|---|
| API response time | `seagate.exos.api.latency` | `DEPENDENT` | `UNSIGNED` |
| System latency: Native metrics supported | `seagate.exos.system.latency.native_supported` | `DEPENDENT` | `UNSIGNED` |
| System latency: Source | `seagate.exos.system.latency.source` | `DEPENDENT` | `CHAR` |
| System latency: Native read average response time | `seagate.exos.system.latency.native.read_avg` | `DEPENDENT` | `FLOAT` |
| System latency: Native write average response time | `seagate.exos.system.latency.native.write_avg` | `DEPENDENT` | `FLOAT` |
| System: Read maximum response time | `seagate.exos.system.latency.read_max` | `DEPENDENT` | `FLOAT` |
| System: Write maximum response time | `seagate.exos.system.latency.write_max` | `DEPENDENT` | `FLOAT` |
| System latency: Host-port weighted read average response time | `seagate.exos.system.latency.fallback.read_avg` | `CALCULATED` | `FLOAT` |
| System latency: Host-port weighted write average response time | `seagate.exos.system.latency.fallback.write_avg` | `CALCULATED` | `FLOAT` |
| System: Read average response time | `seagate.exos.system.latency.read_avg` | `CALCULATED` | `FLOAT` |
| System: Write average response time | `seagate.exos.system.latency.write_avg` | `CALCULATED` | `FLOAT` |

#### Raw

| Item | Key | Type | Value type |
|---|---|---|---|
| API availability raw | `seagate.exos.api.check` | `SCRIPT` | `TEXT` |
| Get core data | `seagate.exos.get.core` | `SCRIPT` | `TEXT` |
| Get performance data | `seagate.exos.get.performance` | `SCRIPT` | `TEXT` |
| Get inventory data | `seagate.exos.get.inventory` | `SCRIPT` | `TEXT` |
| Get events and alerts | `seagate.exos.get.events` | `SCRIPT` | `TEXT` |
| Get system object | `seagate.exos.get.system` | `DEPENDENT` | `TEXT` |
| Get redundancy object | `seagate.exos.get.redundancy` | `DEPENDENT` | `TEXT` |
| Get FDE object | `seagate.exos.get.fde` | `DEPENDENT` | `TEXT` |
| Get controllers | `seagate.exos.get.controllers` | `DEPENDENT` | `TEXT` |
| Get disks | `seagate.exos.get.disks` | `DEPENDENT` | `TEXT` |
| Get disk groups | `seagate.exos.get.diskgroups` | `DEPENDENT` | `TEXT` |
| Get pools | `seagate.exos.get.pools` | `DEPENDENT` | `TEXT` |
| Get volumes | `seagate.exos.get.volumes` | `DEPENDENT` | `TEXT` |
| Get enclosures | `seagate.exos.get.enclosures` | `DEPENDENT` | `TEXT` |
| Get FRUs | `seagate.exos.get.frus` | `DEPENDENT` | `TEXT` |
| Get fans | `seagate.exos.get.fans` | `DEPENDENT` | `TEXT` |
| Get power supplies | `seagate.exos.get.psus` | `DEPENDENT` | `TEXT` |
| Get sensors | `seagate.exos.get.sensors` | `DEPENDENT` | `TEXT` |
| Get SAS links | `seagate.exos.get.saslinks` | `DEPENDENT` | `TEXT` |
| Get host ports | `seagate.exos.get.ports` | `DEPENDENT` | `TEXT` |
| Get controller statistics | `seagate.exos.get.controllerstats` | `DEPENDENT` | `TEXT` |
| Get disk statistics | `seagate.exos.get.diskstats` | `DEPENDENT` | `TEXT` |
| Get disk group statistics | `seagate.exos.get.diskgroupstats` | `DEPENDENT` | `TEXT` |
| Get pool statistics | `seagate.exos.get.poolstats` | `DEPENDENT` | `TEXT` |
| Get volume statistics | `seagate.exos.get.volumestats` | `DEPENDENT` | `TEXT` |
| Get host port statistics | `seagate.exos.get.portstats` | `DEPENDENT` | `TEXT` |
| Get tier statistics | `seagate.exos.get.tierstats` | `DEPENDENT` | `TEXT` |
| Get versions | `seagate.exos.get.versions` | `DEPENDENT` | `TEXT` |
| Get tiers | `seagate.exos.get.tiers` | `DEPENDENT` | `TEXT` |
| Get replication sets | `seagate.exos.get.replicationsets` | `DEPENDENT` | `TEXT` |
| Get events | `seagate.exos.get.eventlist` | `DEPENDENT` | `TEXT` |
| Get active alerts | `seagate.exos.get.alerts` | `DEPENDENT` | `TEXT` |

#### SAS

| Item | Key | Type | Value type |
|---|---|---|---|
| Unhealthy expander PHY count | `seagate.exos.expander.unhealthy` | `DEPENDENT` | `UNSIGNED` |

#### Security

| Item | Key | Type | Value type |
|---|---|---|---|
| FDE security status | `seagate.exos.system.fde_status` | `DEPENDENT` | `CHAR` |

#### Storage

| Item | Key | Type | Value type |
|---|---|---|---|
| Enclosure count | `seagate.exos.system.enclosure_count` | `DEPENDENT` | `UNSIGNED` |

#### Time

| Item | Key | Type | Value type |
|---|---|---|---|
| NTP enabled | `seagate.exos.system.ntp_enabled` | `DEPENDENT` | `UNSIGNED` |

### Fixed triggers

| Trigger | Severity | Source item |
|---|---|---|
| Seagate Exos Storage: Management API is unavailable | `HIGH` | API available |
| Seagate Exos Storage: API authentication failed | `HIGH` | API authentication failed |
| Seagate Exos Storage: Core API method errors | `WARNING` | Core API method errors |
| Seagate Exos Storage: Performance API method errors | `WARNING` | Performance API method errors |
| Seagate Exos Storage: Inventory API method errors | `WARNING` | Inventory API method errors |
| Seagate Exos Storage: Events API method errors | `WARNING` | Events API method errors |
| Seagate Exos Storage: Enclosure count is below expected | `HIGH` | Enclosure count |
| Seagate Exos Storage: System health is degraded | `AVERAGE` | System health |
| Seagate Exos Storage: System health is in fault state | `HIGH` | System health |
| Seagate Exos Storage: System health is unknown | `WARNING` | System health |
| Seagate Exos Storage: Storage redundancy is lost | `HIGH` | Redundancy state |
| Seagate Exos Storage: Partner management controller is not operational | `WARNING` | Other management controller operational |
| Seagate Exos Storage: FDE security state changed | `INFO` | FDE security status |
| Seagate Exos Storage: NTP is not activated | `WARNING` | NTP enabled |
| Seagate Exos Storage: Controller A has unwritable cache | `HIGH` | Controller A unwritable cache |
| Seagate Exos Storage: Controller B has unwritable cache | `HIGH` | Controller B unwritable cache |
| Seagate Exos Storage: One or more expander PHYs are unhealthy | `HIGH` | Unhealthy expander PHY count |
| Seagate Exos Storage: System firmware bundle changed | `INFO` | System firmware bundle |
| Seagate Exos Storage: New warning event detected | `WARNING` | Latest warning event ID |
| Seagate Exos Storage: New error event detected | `HIGH` | Latest error event ID |
| Seagate Exos Storage: New critical event detected | `HIGH` | Latest critical event ID |
| Seagate Exos Storage: Active warning alert conditions | `WARNING` | Active warning alert count |
| Seagate Exos Storage: Active error alert conditions | `HIGH` | Active error alert count |
| Seagate Exos Storage: Active critical alert conditions | `HIGH` | Active critical alert count |

### Fixed graphs

| Graph | Item keys |
|---|---|
| System latency | `seagate.exos.system.latency.read_avg`<br>`seagate.exos.system.latency.write_avg` |
| System maximum latency (4006 native) | `seagate.exos.system.latency.read_max`<br>`seagate.exos.system.latency.write_max` |

### Template dashboards

#### Overview

##### Overview

| Widget | Type | Referenced object |
|---|---|---|
| API availability | `item` | seagate.exos.api.available |
| System health | `item` | seagate.exos.system.health |
| Product | `item` | seagate.exos.system.product_id |
| Firmware bundle | `item` | seagate.exos.system.bundle_version |
| System latency source | `item` | seagate.exos.system.latency.source |
| Average system latency | `graph` | System latency |
| Maximum system latency | `graph` | System maximum latency (4006 native) |
| Active problems | `problems` |  |

##### Components

| Widget | Type | Referenced object |
|---|---|---|
| Controller performance | `graphprototype` | Controller [{#CONTROLLER.ID}]: Performance |
| Disk performance | `graphprototype` | Disk [{#LOCATION}]: Performance |
| Pool performance | `graphprototype` | Pool [{#NAME}]: Performance |
| Volume performance | `graphprototype` | Volume [{#NAME}]: Performance |
| Host port performance | `graphprototype` | Host port [{#PORT.ID}]: Performance |
| Disk temperature | `graphprototype` | Disk [{#LOCATION}]: Temperature |

### Low-level discovery

#### Controllers discovery

- Discovery key: `seagate.exos.controllers.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 27
- Trigger prototypes: 7
- Graph prototypes: 2

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Controller [{#CONTROLLER.ID}]: Get data | `seagate.exos.controller.get["{#CONTROLLER.ID}"]` | `DEPENDENT` | `TEXT` |
| Controller [{#CONTROLLER.ID}]: Get statistics | `seagate.exos.controller.stats.get["{#CONTROLLER.ID}"]` | `DEPENDENT` | `TEXT` |
| Controller [{#CONTROLLER.ID}]: Health | `seagate.exos.controller.health["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Status | `seagate.exos.controller.status["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Serial number | `seagate.exos.controller.serial["{#CONTROLLER.ID}"]` | `DEPENDENT` | `CHAR` |
| Controller [{#CONTROLLER.ID}]: Part number | `seagate.exos.controller.part["{#CONTROLLER.ID}"]` | `DEPENDENT` | `CHAR` |
| Controller [{#CONTROLLER.ID}]: Hardware version | `seagate.exos.controller.hardware["{#CONTROLLER.ID}"]` | `DEPENDENT` | `CHAR` |
| Controller [{#CONTROLLER.ID}]: IP address | `seagate.exos.controller.ip["{#CONTROLLER.ID}"]` | `DEPENDENT` | `CHAR` |
| Controller [{#CONTROLLER.ID}]: Failover reason | `seagate.exos.controller.failover_reason["{#CONTROLLER.ID}"]` | `DEPENDENT` | `TEXT` |
| Controller [{#CONTROLLER.ID}]: Firmware | `seagate.exos.controller.firmware["{#CONTROLLER.ID}"]` | `DEPENDENT` | `CHAR` |
| Controller [{#CONTROLLER.ID}]: Failed over | `seagate.exos.controller.failed_over["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Cache memory | `seagate.exos.controller.cache_memory["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: System memory | `seagate.exos.controller.system_memory["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Host ports | `seagate.exos.controller.host_ports["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Drive channels | `seagate.exos.controller.drive_channels["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: CPU utilization | `seagate.exos.controller.cpu["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Write cache used | `seagate.exos.controller.write_cache_used["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: IOPS | `seagate.exos.controller.iops["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Throughput | `seagate.exos.controller.bps["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Reads | `seagate.exos.controller.reads["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Writes | `seagate.exos.controller.writes["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Read cache hits | `seagate.exos.controller.read_cache_hits["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Read cache misses | `seagate.exos.controller.read_cache_misses["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Write cache hits | `seagate.exos.controller.write_cache_hits["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Write cache misses | `seagate.exos.controller.write_cache_misses["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Forwarded commands | `seagate.exos.controller.forwarded["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Controller [{#CONTROLLER.ID}]: Power-on hours | `seagate.exos.controller.power_on_hours["{#CONTROLLER.ID}"]` | `DEPENDENT` | `UNSIGNED` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Controller [{#CONTROLLER.ID}] health is degraded | `WARNING` | Controller [{#CONTROLLER.ID}]: Health |
| Seagate Exos Storage: Controller [{#CONTROLLER.ID}] health is in fault state | `HIGH` | Controller [{#CONTROLLER.ID}]: Health |
| Seagate Exos Storage: Controller [{#CONTROLLER.ID}] health is unknown | `WARNING` | Controller [{#CONTROLLER.ID}]: Health |
| Seagate Exos Storage: Controller [{#CONTROLLER.ID}] is down | `HIGH` | Controller [{#CONTROLLER.ID}]: Status |
| Seagate Exos Storage: Controller [{#CONTROLLER.ID}] firmware changed | `INFO` | Controller [{#CONTROLLER.ID}]: Firmware |
| Seagate Exos Storage: Controller [{#CONTROLLER.ID}] is failed over | `HIGH` | Controller [{#CONTROLLER.ID}]: Failed over |
| Seagate Exos Storage: Controller [{#CONTROLLER.ID}] CPU utilization is high | `WARNING` | Controller [{#CONTROLLER.ID}]: CPU utilization |

##### Graph prototypes

| Graph prototype | Item prototype keys |
|---|---|
| Controller [{#CONTROLLER.ID}]: Performance | `seagate.exos.controller.cpu["{#CONTROLLER.ID}"]`<br>`seagate.exos.controller.iops["{#CONTROLLER.ID}"]`<br>`seagate.exos.controller.bps["{#CONTROLLER.ID}"]` |
| Controller [{#CONTROLLER.ID}]: Cache utilization | `seagate.exos.controller.write_cache_used["{#CONTROLLER.ID}"]` |

#### Physical disks discovery

- Discovery key: `seagate.exos.disks.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 32
- Trigger prototypes: 17
- Graph prototypes: 2

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Disk [{#LOCATION}]: Get data | `seagate.exos.disk.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Disk [{#LOCATION}]: Get statistics | `seagate.exos.disk.stats.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Disk [{#LOCATION}]: Health | `seagate.exos.disk.health["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Status | `seagate.exos.disk.status["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Model | `seagate.exos.disk.model["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: Serial number | `seagate.exos.disk.serial["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: Firmware revision | `seagate.exos.disk.firmware["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: Interface | `seagate.exos.disk.interface["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: Architecture | `seagate.exos.disk.architecture["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: Disk group | `seagate.exos.disk.disk_group["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: Pool | `seagate.exos.disk.pool["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: Storage tier | `seagate.exos.disk.tier["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: FDE state | `seagate.exos.disk.fde["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: Current job | `seagate.exos.disk.job["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Disk [{#LOCATION}]: Capacity | `seagate.exos.disk.capacity["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: SMART enabled | `seagate.exos.disk.smart["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Temperature | `seagate.exos.disk.temperature["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Temperature status | `seagate.exos.disk.temperature_status["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Power-on hours | `seagate.exos.disk.power_on_hours["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: SSD life remaining | `seagate.exos.disk.ssd_life["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Job progress | `seagate.exos.disk.job_progress["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: IOPS | `seagate.exos.disk.iops["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Throughput | `seagate.exos.disk.bps["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Queue depth | `seagate.exos.disk.queue_depth["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Reads | `seagate.exos.disk.reads["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Writes | `seagate.exos.disk.writes["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Media errors | `seagate.exos.disk.media_errors["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Non-media errors | `seagate.exos.disk.nonmedia_errors["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: I/O timeouts | `seagate.exos.disk.timeouts["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: No-response events | `seagate.exos.disk.no_response["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Bad blocks | `seagate.exos.disk.bad_blocks["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk [{#LOCATION}]: Block reassignments | `seagate.exos.disk.reassigns["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Disk [{#LOCATION}] health is degraded | `AVERAGE` | Disk [{#LOCATION}]: Health |
| Seagate Exos Storage: Disk [{#LOCATION}] health is in fault state | `HIGH` | Disk [{#LOCATION}]: Health |
| Seagate Exos Storage: Disk [{#LOCATION}] health is unknown | `WARNING` | Disk [{#LOCATION}]: Health |
| Seagate Exos Storage: Disk [{#LOCATION}] is not Up | `HIGH` | Disk [{#LOCATION}]: Status |
| Seagate Exos Storage: Disk [{#LOCATION}] firmware changed | `INFO` | Disk [{#LOCATION}]: Firmware revision |
| Seagate Exos Storage: Disk [{#LOCATION}] job state changed | `INFO` | Disk [{#LOCATION}]: Current job |
| Seagate Exos Storage: SMART is disabled on disk [{#LOCATION}] | `WARNING` | Disk [{#LOCATION}]: SMART enabled |
| Seagate Exos Storage: Disk [{#LOCATION}] temperature is high | `WARNING` | Disk [{#LOCATION}]: Temperature |
| Seagate Exos Storage: Disk [{#LOCATION}] temperature is critical | `HIGH` | Disk [{#LOCATION}]: Temperature |
| Seagate Exos Storage: Disk [{#LOCATION}] temperature status is abnormal | `HIGH` | Disk [{#LOCATION}]: Temperature status |
| Seagate Exos Storage: Disk [{#LOCATION}] SSD life is low | `WARNING` | Disk [{#LOCATION}]: SSD life remaining |
| Seagate Exos Storage: Disk [{#LOCATION}] media errors increased | `HIGH` | Disk [{#LOCATION}]: Media errors |
| Seagate Exos Storage: Disk [{#LOCATION}] non-media errors increased | `WARNING` | Disk [{#LOCATION}]: Non-media errors |
| Seagate Exos Storage: Disk [{#LOCATION}] i/o timeouts increased | `HIGH` | Disk [{#LOCATION}]: I/O timeouts |
| Seagate Exos Storage: Disk [{#LOCATION}] no-response events increased | `HIGH` | Disk [{#LOCATION}]: No-response events |
| Seagate Exos Storage: Disk [{#LOCATION}] bad blocks increased | `HIGH` | Disk [{#LOCATION}]: Bad blocks |
| Seagate Exos Storage: Disk [{#LOCATION}] block reassignments increased | `WARNING` | Disk [{#LOCATION}]: Block reassignments |

##### Graph prototypes

| Graph prototype | Item prototype keys |
|---|---|
| Disk [{#LOCATION}]: Performance | `seagate.exos.disk.iops["{#DURABLE.ID}"]`<br>`seagate.exos.disk.bps["{#DURABLE.ID}"]` |
| Disk [{#LOCATION}]: Temperature | `seagate.exos.disk.temperature["{#DURABLE.ID}"]` |

#### Disk groups discovery

- Discovery key: `seagate.exos.diskgroups.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 24
- Trigger prototypes: 11
- Graph prototypes: 3

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Disk group [{#NAME}]: Get data | `seagate.exos.diskgroup.get["{#NAME}"]` | `DEPENDENT` | `TEXT` |
| Disk group [{#NAME}]: Get statistics | `seagate.exos.diskgroup.stats.get["{#NAME}"]` | `DEPENDENT` | `TEXT` |
| Disk group [{#NAME}]: Health | `seagate.exos.diskgroup.health["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Status | `seagate.exos.diskgroup.status["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Pool | `seagate.exos.diskgroup.pool["{#NAME}"]` | `DEPENDENT` | `CHAR` |
| Disk group [{#NAME}]: RAID type | `seagate.exos.diskgroup.raid["{#NAME}"]` | `DEPENDENT` | `CHAR` |
| Disk group [{#NAME}]: Owner | `seagate.exos.diskgroup.owner["{#NAME}"]` | `DEPENDENT` | `CHAR` |
| Disk group [{#NAME}]: Preferred owner | `seagate.exos.diskgroup.preferred_owner["{#NAME}"]` | `DEPENDENT` | `CHAR` |
| Disk group [{#NAME}]: Tier | `seagate.exos.diskgroup.tier["{#NAME}"]` | `DEPENDENT` | `CHAR` |
| Disk group [{#NAME}]: Current job | `seagate.exos.diskgroup.job["{#NAME}"]` | `DEPENDENT` | `CHAR` |
| Disk group [{#NAME}]: Owner numeric | `seagate.exos.diskgroup.owner_numeric["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Preferred owner numeric | `seagate.exos.diskgroup.preferred_owner_numeric["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Write-back enabled | `seagate.exos.diskgroup.writeback["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Disk count | `seagate.exos.diskgroup.diskcount["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Spare count | `seagate.exos.diskgroup.sparecount["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Total capacity | `seagate.exos.diskgroup.total["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Free capacity | `seagate.exos.diskgroup.free["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Raw capacity | `seagate.exos.diskgroup.raw["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Used capacity | `seagate.exos.diskgroup.used_pct["{#NAME}"]` | `DEPENDENT` | `FLOAT` |
| Disk group [{#NAME}]: IOPS | `seagate.exos.diskgroup.iops["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Throughput | `seagate.exos.diskgroup.bps["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Disk group [{#NAME}]: Response time | `seagate.exos.diskgroup.latency["{#NAME}"]` | `DEPENDENT` | `FLOAT` |
| Disk group [{#NAME}]: Read response time | `seagate.exos.diskgroup.read_latency["{#NAME}"]` | `DEPENDENT` | `FLOAT` |
| Disk group [{#NAME}]: Write response time | `seagate.exos.diskgroup.write_latency["{#NAME}"]` | `DEPENDENT` | `FLOAT` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Disk group [{#NAME}] health is degraded | `AVERAGE` | Disk group [{#NAME}]: Health |
| Seagate Exos Storage: Disk group [{#NAME}] health is in fault state | `HIGH` | Disk group [{#NAME}]: Health |
| Seagate Exos Storage: Disk group [{#NAME}] health is unknown | `WARNING` | Disk group [{#NAME}]: Health |
| Seagate Exos Storage: Disk group [{#NAME}] is degraded | `AVERAGE` | Disk group [{#NAME}]: Status |
| Seagate Exos Storage: Disk group [{#NAME}] is critical or offline | `HIGH` | Disk group [{#NAME}]: Status |
| Seagate Exos Storage: Disk group [{#NAME}] job state changed | `INFO` | Disk group [{#NAME}]: Current job |
| Seagate Exos Storage: Disk group [{#NAME}] owner differs from preferred owner | `WARNING` | Disk group [{#NAME}]: Owner numeric |
| Seagate Exos Storage: Disk group [{#NAME}] write-back is disabled | `HIGH` | Disk group [{#NAME}]: Write-back enabled |
| Seagate Exos Storage: Disk group [{#NAME}] utilization is high | `WARNING` | Disk group [{#NAME}]: Used capacity |
| Seagate Exos Storage: Disk group [{#NAME}] utilization is very high | `HIGH` | Disk group [{#NAME}]: Used capacity |
| Seagate Exos Storage: Disk group [{#NAME}] utilization is critical | `HIGH` | Disk group [{#NAME}]: Used capacity |

##### Graph prototypes

| Graph prototype | Item prototype keys |
|---|---|
| Disk group [{#NAME}]: Performance | `seagate.exos.diskgroup.iops["{#NAME}"]`<br>`seagate.exos.diskgroup.bps["{#NAME}"]` |
| Disk group [{#NAME}]: Response time | `seagate.exos.diskgroup.latency["{#NAME}"]`<br>`seagate.exos.diskgroup.read_latency["{#NAME}"]`<br>`seagate.exos.diskgroup.write_latency["{#NAME}"]` |
| Disk group [{#NAME}]: Space utilization | `seagate.exos.diskgroup.used_pct["{#NAME}"]` |

#### Pools discovery

- Discovery key: `seagate.exos.pools.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 12
- Trigger prototypes: 7
- Graph prototypes: 3

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Pool [{#NAME}]: Get data | `seagate.exos.pool.get["{#NAME}"]` | `DEPENDENT` | `TEXT` |
| Pool [{#NAME}]: Get statistics | `seagate.exos.pool.stats.get["{#NAME}"]` | `DEPENDENT` | `TEXT` |
| Pool [{#NAME}]: Health | `seagate.exos.pool.health["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Pool [{#NAME}]: Total capacity | `seagate.exos.pool.total["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Pool [{#NAME}]: Available capacity | `seagate.exos.pool.available["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Pool [{#NAME}]: Used capacity | `seagate.exos.pool.used_pct["{#NAME}"]` | `DEPENDENT` | `FLOAT` |
| Pool [{#NAME}]: Overcommitted | `seagate.exos.pool.overcommitted["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Pool [{#NAME}]: IOPS | `seagate.exos.pool.iops["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Pool [{#NAME}]: Throughput | `seagate.exos.pool.bps["{#NAME}"]` | `DEPENDENT` | `UNSIGNED` |
| Pool [{#NAME}]: Response time | `seagate.exos.pool.latency["{#NAME}"]` | `DEPENDENT` | `FLOAT` |
| Pool [{#NAME}]: Read response time | `seagate.exos.pool.read_latency["{#NAME}"]` | `DEPENDENT` | `FLOAT` |
| Pool [{#NAME}]: Write response time | `seagate.exos.pool.write_latency["{#NAME}"]` | `DEPENDENT` | `FLOAT` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Pool [{#NAME}] health is degraded | `AVERAGE` | Pool [{#NAME}]: Health |
| Seagate Exos Storage: Pool [{#NAME}] health is in fault state | `HIGH` | Pool [{#NAME}]: Health |
| Seagate Exos Storage: Pool [{#NAME}] health is unknown | `WARNING` | Pool [{#NAME}]: Health |
| Seagate Exos Storage: Pool [{#NAME}] utilization is high | `WARNING` | Pool [{#NAME}]: Used capacity |
| Seagate Exos Storage: Pool [{#NAME}] utilization is very high | `HIGH` | Pool [{#NAME}]: Used capacity |
| Seagate Exos Storage: Pool [{#NAME}] utilization is critical | `HIGH` | Pool [{#NAME}]: Used capacity |
| Seagate Exos Storage: Pool [{#NAME}] is overcommitted | `HIGH` | Pool [{#NAME}]: Overcommitted |

##### Graph prototypes

| Graph prototype | Item prototype keys |
|---|---|
| Pool [{#NAME}]: Performance | `seagate.exos.pool.iops["{#NAME}"]`<br>`seagate.exos.pool.bps["{#NAME}"]` |
| Pool [{#NAME}]: Response time | `seagate.exos.pool.latency["{#NAME}"]`<br>`seagate.exos.pool.read_latency["{#NAME}"]`<br>`seagate.exos.pool.write_latency["{#NAME}"]` |
| Pool [{#NAME}]: Space utilization | `seagate.exos.pool.used_pct["{#NAME}"]` |

#### Volumes discovery

- Discovery key: `seagate.exos.volumes.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 21
- Trigger prototypes: 6
- Graph prototypes: 1

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Volume [{#NAME}]: Get data | `seagate.exos.volume.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Volume [{#NAME}]: Get statistics | `seagate.exos.volume.stats.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Volume [{#NAME}]: Health | `seagate.exos.volume.health["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Pool | `seagate.exos.volume.pool["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Volume [{#NAME}]: Owner | `seagate.exos.volume.owner["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Volume [{#NAME}]: Preferred owner | `seagate.exos.volume.preferred_owner["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Volume [{#NAME}]: Write policy | `seagate.exos.volume.write_policy["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Volume [{#NAME}]: Cache optimization | `seagate.exos.volume.cache_optimization["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Volume [{#NAME}]: Read-ahead | `seagate.exos.volume.read_ahead["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Volume [{#NAME}]: Tier affinity | `seagate.exos.volume.tier_affinity["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Volume [{#NAME}]: Owner numeric | `seagate.exos.volume.owner_numeric["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Preferred owner numeric | `seagate.exos.volume.preferred_owner_numeric["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Write-back enabled | `seagate.exos.volume.writeback["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Operation progress | `seagate.exos.volume.progress["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Size | `seagate.exos.volume.size["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Allocated size | `seagate.exos.volume.allocated["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: IOPS | `seagate.exos.volume.iops["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Throughput | `seagate.exos.volume.bps["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Reads | `seagate.exos.volume.reads["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Writes | `seagate.exos.volume.writes["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Volume [{#NAME}]: Write cache utilization | `seagate.exos.volume.write_cache_pct["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Volume [{#NAME}] health is degraded | `WARNING` | Volume [{#NAME}]: Health |
| Seagate Exos Storage: Volume [{#NAME}] health is in fault state | `HIGH` | Volume [{#NAME}]: Health |
| Seagate Exos Storage: Volume [{#NAME}] health is unknown | `WARNING` | Volume [{#NAME}]: Health |
| Seagate Exos Storage: Volume [{#NAME}] owner differs from preferred owner | `WARNING` | Volume [{#NAME}]: Owner numeric |
| Seagate Exos Storage: Volume [{#NAME}] is not using write-back | `HIGH` | Volume [{#NAME}]: Write-back enabled |
| Seagate Exos Storage: Volume [{#NAME}] operation is active | `INFO` | Volume [{#NAME}]: Operation progress |

##### Graph prototypes

| Graph prototype | Item prototype keys |
|---|---|
| Volume [{#NAME}]: Performance | `seagate.exos.volume.iops["{#DURABLE.ID}"]`<br>`seagate.exos.volume.bps["{#DURABLE.ID}"]` |

#### Storage tiers discovery

- Discovery key: `seagate.exos.tiers.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 16
- Trigger prototypes: 2
- Graph prototypes: 3

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Tier [{#POOL}/{#TIER}]: Get data | `seagate.exos.tier.get["{#SERIAL}"]` | `DEPENDENT` | `TEXT` |
| Tier [{#POOL}/{#TIER}]: Get statistics | `seagate.exos.tier.stats.get["{#SERIAL}"]` | `DEPENDENT` | `TEXT` |
| Tier [{#POOL}/{#TIER}]: Disk count | `seagate.exos.tier.diskcount["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |
| Tier [{#POOL}/{#TIER}]: Raw capacity | `seagate.exos.tier.raw["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |
| Tier [{#POOL}/{#TIER}]: Total capacity | `seagate.exos.tier.total["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |
| Tier [{#POOL}/{#TIER}]: Allocated capacity | `seagate.exos.tier.allocated["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |
| Tier [{#POOL}/{#TIER}]: Available capacity | `seagate.exos.tier.available["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |
| Tier [{#POOL}/{#TIER}]: Used capacity | `seagate.exos.tier.used_pct["{#SERIAL}"]` | `DEPENDENT` | `FLOAT` |
| Tier [{#POOL}/{#TIER}]: IOPS | `seagate.exos.tier.iops["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |
| Tier [{#POOL}/{#TIER}]: Throughput | `seagate.exos.tier.bps["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |
| Tier [{#POOL}/{#TIER}]: Response time | `seagate.exos.tier.latency["{#SERIAL}"]` | `DEPENDENT` | `FLOAT` |
| Tier [{#POOL}/{#TIER}]: Read response time | `seagate.exos.tier.read_latency["{#SERIAL}"]` | `DEPENDENT` | `FLOAT` |
| Tier [{#POOL}/{#TIER}]: Write response time | `seagate.exos.tier.write_latency["{#SERIAL}"]` | `DEPENDENT` | `FLOAT` |
| Tier [{#POOL}/{#TIER}]: Pages allocated per minute | `seagate.exos.tier.pages_alloc["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |
| Tier [{#POOL}/{#TIER}]: Pages deallocated per minute | `seagate.exos.tier.pages_dealloc["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |
| Tier [{#POOL}/{#TIER}]: Pages reclaimed | `seagate.exos.tier.pages_reclaimed["{#SERIAL}"]` | `DEPENDENT` | `UNSIGNED` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Tier [{#POOL}/{#TIER}] utilization is high | `WARNING` | Tier [{#POOL}/{#TIER}]: Used capacity |
| Seagate Exos Storage: Tier [{#POOL}/{#TIER}] utilization is critical | `HIGH` | Tier [{#POOL}/{#TIER}]: Used capacity |

##### Graph prototypes

| Graph prototype | Item prototype keys |
|---|---|
| Tier [{#POOL}/{#TIER}]: Performance | `seagate.exos.tier.iops["{#SERIAL}"]`<br>`seagate.exos.tier.bps["{#SERIAL}"]` |
| Tier [{#POOL}/{#TIER}]: Response time | `seagate.exos.tier.latency["{#SERIAL}"]`<br>`seagate.exos.tier.read_latency["{#SERIAL}"]`<br>`seagate.exos.tier.write_latency["{#SERIAL}"]` |
| Tier [{#POOL}/{#TIER}]: Space utilization | `seagate.exos.tier.used_pct["{#SERIAL}"]` |

#### Enclosures discovery

- Discovery key: `seagate.exos.enclosures.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 11
- Trigger prototypes: 4
- Graph prototypes: 1

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Enclosure [{#ENCLOSURE.ID}]: Get data | `seagate.exos.enclosure.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Enclosure [{#ENCLOSURE.ID}]: Health | `seagate.exos.enclosure.health["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Enclosure [{#ENCLOSURE.ID}]: Status | `seagate.exos.enclosure.status["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Enclosure [{#ENCLOSURE.ID}]: Model | `seagate.exos.enclosure.model["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Enclosure [{#ENCLOSURE.ID}]: Serial number | `seagate.exos.enclosure.serial["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Enclosure [{#ENCLOSURE.ID}]: Type | `seagate.exos.enclosure.type["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Enclosure [{#ENCLOSURE.ID}]: Revision | `seagate.exos.enclosure.revision["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Enclosure [{#ENCLOSURE.ID}]: Disk count | `seagate.exos.enclosure.diskcount["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Enclosure [{#ENCLOSURE.ID}]: Power supply count | `seagate.exos.enclosure.psucount["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Enclosure [{#ENCLOSURE.ID}]: Cooling element count | `seagate.exos.enclosure.coolingcount["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Enclosure [{#ENCLOSURE.ID}]: Power consumption | `seagate.exos.enclosure.power["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Enclosure [{#ENCLOSURE.ID}] health is degraded | `AVERAGE` | Enclosure [{#ENCLOSURE.ID}]: Health |
| Seagate Exos Storage: Enclosure [{#ENCLOSURE.ID}] health is in fault state | `HIGH` | Enclosure [{#ENCLOSURE.ID}]: Health |
| Seagate Exos Storage: Enclosure [{#ENCLOSURE.ID}] health is unknown | `WARNING` | Enclosure [{#ENCLOSURE.ID}]: Health |
| Seagate Exos Storage: Enclosure [{#ENCLOSURE.ID}] status is abnormal | `HIGH` | Enclosure [{#ENCLOSURE.ID}]: Status |

##### Graph prototypes

| Graph prototype | Item prototype keys |
|---|---|
| Enclosure [{#ENCLOSURE.ID}]: Power consumption | `seagate.exos.enclosure.power["{#DURABLE.ID}"]` |

#### FRUs discovery

- Discovery key: `seagate.exos.frus.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 6
- Trigger prototypes: 1
- Graph prototypes: 0

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| FRU [{#NAME}/{#LOCATION}]: Get data | `seagate.exos.fru.get["{#LLD.ID}"]` | `DEPENDENT` | `TEXT` |
| FRU [{#NAME}/{#LOCATION}]: Status | `seagate.exos.fru.status["{#LLD.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| FRU [{#NAME}/{#LOCATION}]: Part number | `seagate.exos.fru.part["{#LLD.ID}"]` | `DEPENDENT` | `CHAR` |
| FRU [{#NAME}/{#LOCATION}]: Serial number | `seagate.exos.fru.serial["{#LLD.ID}"]` | `DEPENDENT` | `CHAR` |
| FRU [{#NAME}/{#LOCATION}]: Revision | `seagate.exos.fru.revision["{#LLD.ID}"]` | `DEPENDENT` | `CHAR` |
| FRU [{#NAME}/{#LOCATION}]: Description | `seagate.exos.fru.description["{#LLD.ID}"]` | `DEPENDENT` | `TEXT` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: FRU [{#NAME}/{#LOCATION}] status is abnormal | `HIGH` | FRU [{#NAME}/{#LOCATION}]: Status |

##### Graph prototypes

No graph prototypes.

#### Fans discovery

- Discovery key: `seagate.exos.fans.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 4
- Trigger prototypes: 5
- Graph prototypes: 1

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Fan [{#NAME}/{#LOCATION}]: Get data | `seagate.exos.fan.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Fan [{#NAME}/{#LOCATION}]: Health | `seagate.exos.fan.health["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Fan [{#NAME}/{#LOCATION}]: Status | `seagate.exos.fan.status["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Fan [{#NAME}/{#LOCATION}]: Speed | `seagate.exos.fan.speed["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Fan [{#NAME}/{#LOCATION}] health is degraded | `AVERAGE` | Fan [{#NAME}/{#LOCATION}]: Health |
| Seagate Exos Storage: Fan [{#NAME}/{#LOCATION}] health is in fault state | `HIGH` | Fan [{#NAME}/{#LOCATION}]: Health |
| Seagate Exos Storage: Fan [{#NAME}/{#LOCATION}] health is unknown | `WARNING` | Fan [{#NAME}/{#LOCATION}]: Health |
| Seagate Exos Storage: Fan [{#NAME}/{#LOCATION}] is not Up | `HIGH` | Fan [{#NAME}/{#LOCATION}]: Status |
| Seagate Exos Storage: Fan [{#NAME}/{#LOCATION}] speed is zero | `HIGH` | Fan [{#NAME}/{#LOCATION}]: Speed |

##### Graph prototypes

| Graph prototype | Item prototype keys |
|---|---|
| Fan [{#NAME}/{#LOCATION}]: Speed | `seagate.exos.fan.speed["{#DURABLE.ID}"]` |

#### Power supplies discovery

- Discovery key: `seagate.exos.psus.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 7
- Trigger prototypes: 4
- Graph prototypes: 0

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Power supply [{#LOCATION}]: Get data | `seagate.exos.psu.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Power supply [{#LOCATION}]: Health | `seagate.exos.psu.health["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Power supply [{#LOCATION}]: Status | `seagate.exos.psu.status["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Power supply [{#LOCATION}]: Part number | `seagate.exos.psu.part["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Power supply [{#LOCATION}]: Serial number | `seagate.exos.psu.serial["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Power supply [{#LOCATION}]: Firmware | `seagate.exos.psu.firmware["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Power supply [{#LOCATION}]: Model | `seagate.exos.psu.model["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Power supply [{#LOCATION}] health is degraded | `AVERAGE` | Power supply [{#LOCATION}]: Health |
| Seagate Exos Storage: Power supply [{#LOCATION}] health is in fault state | `HIGH` | Power supply [{#LOCATION}]: Health |
| Seagate Exos Storage: Power supply [{#LOCATION}] health is unknown | `WARNING` | Power supply [{#LOCATION}]: Health |
| Seagate Exos Storage: Power supply [{#LOCATION}] status is abnormal | `HIGH` | Power supply [{#LOCATION}]: Status |

##### Graph prototypes

No graph prototypes.

#### Sensors discovery

- Discovery key: `seagate.exos.sensors.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 4
- Trigger prototypes: 2
- Graph prototypes: 0

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Sensor [{#NAME}]: Get data | `seagate.exos.sensor.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Sensor [{#NAME}]: Status | `seagate.exos.sensor.status["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Sensor [{#NAME}]: Value | `seagate.exos.sensor.value["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Sensor [{#NAME}]: Type | `seagate.exos.sensor.type["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Sensor [{#NAME}] reports Warning | `WARNING` | Sensor [{#NAME}]: Status |
| Seagate Exos Storage: Sensor [{#NAME}] reports Critical or Unrecoverable | `HIGH` | Sensor [{#NAME}]: Status |

##### Graph prototypes

No graph prototypes.

#### SAS links discovery

- Discovery key: `seagate.exos.saslinks.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 3
- Trigger prototypes: 4
- Graph prototypes: 0

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| SAS link [{#NAME}]: Get data | `seagate.exos.saslink.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| SAS link [{#NAME}]: Health | `seagate.exos.saslink.health["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| SAS link [{#NAME}]: Status | `seagate.exos.saslink.status["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: SAS link [{#NAME}] health is degraded | `AVERAGE` | SAS link [{#NAME}]: Health |
| Seagate Exos Storage: SAS link [{#NAME}] health is in fault state | `HIGH` | SAS link [{#NAME}]: Health |
| Seagate Exos Storage: SAS link [{#NAME}] health is unknown | `WARNING` | SAS link [{#NAME}]: Health |
| Seagate Exos Storage: SAS link [{#NAME}] status is abnormal | `HIGH` | SAS link [{#NAME}]: Status |

##### Graph prototypes

No graph prototypes.

#### Host ports discovery

- Discovery key: `seagate.exos.ports.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 22
- Trigger prototypes: 7
- Graph prototypes: 3

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Host port [{#PORT.ID}]: Get data | `seagate.exos.port.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Host port [{#PORT.ID}]: Get statistics | `seagate.exos.port.stats.get["{#DURABLE.ID}"]` | `DEPENDENT` | `TEXT` |
| Host port [{#PORT.ID}]: Health | `seagate.exos.port.health["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Host port [{#PORT.ID}]: Status | `seagate.exos.port.status["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Host port [{#PORT.ID}]: Port type | `seagate.exos.port.type["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Host port [{#PORT.ID}]: IP address | `seagate.exos.port.ip["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Host port [{#PORT.ID}]: MAC address | `seagate.exos.port.mac["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Host port [{#PORT.ID}]: SFP vendor | `seagate.exos.port.sfp_vendor["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Host port [{#PORT.ID}]: SFP part number | `seagate.exos.port.sfp_part["{#DURABLE.ID}"]` | `DEPENDENT` | `CHAR` |
| Host port [{#PORT.ID}]: Actual speed | `seagate.exos.port.speed["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Host port [{#PORT.ID}]: SFP present | `seagate.exos.port.sfp_present["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Host port [{#PORT.ID}]: SFP status | `seagate.exos.port.sfp_status["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Host port [{#PORT.ID}]: IOPS | `seagate.exos.port.iops["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Host port [{#PORT.ID}]: Throughput | `seagate.exos.port.bps["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Host port [{#PORT.ID}]: Queue depth | `seagate.exos.port.queue_depth["{#DURABLE.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Host port [{#PORT.ID}]: Read I/O rate | `seagate.exos.port.read_iops_derived["{#DURABLE.ID}"]` | `DEPENDENT` | `FLOAT` |
| Host port [{#PORT.ID}]: Write I/O rate | `seagate.exos.port.write_iops_derived["{#DURABLE.ID}"]` | `DEPENDENT` | `FLOAT` |
| Host port [{#PORT.ID}]: Read latency weighted contribution | `seagate.exos.port.read_latency_weighted["{#DURABLE.ID}"]` | `CALCULATED` | `FLOAT` |
| Host port [{#PORT.ID}]: Write latency weighted contribution | `seagate.exos.port.write_latency_weighted["{#DURABLE.ID}"]` | `CALCULATED` | `FLOAT` |
| Host port [{#PORT.ID}]: Response time | `seagate.exos.port.latency["{#DURABLE.ID}"]` | `DEPENDENT` | `FLOAT` |
| Host port [{#PORT.ID}]: Read response time | `seagate.exos.port.read_latency["{#DURABLE.ID}"]` | `DEPENDENT` | `FLOAT` |
| Host port [{#PORT.ID}]: Write response time | `seagate.exos.port.write_latency["{#DURABLE.ID}"]` | `DEPENDENT` | `FLOAT` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Host port [{#PORT.ID}] health is degraded | `AVERAGE` | Host port [{#PORT.ID}]: Health |
| Seagate Exos Storage: Host port [{#PORT.ID}] health is in fault state | `HIGH` | Host port [{#PORT.ID}]: Health |
| Seagate Exos Storage: Host port [{#PORT.ID}] health is unknown | `WARNING` | Host port [{#PORT.ID}]: Health |
| Seagate Exos Storage: Host port [{#PORT.ID}] is down | `HIGH` | Host port [{#PORT.ID}]: Status |
| Seagate Exos Storage: Host port [{#PORT.ID}] negotiated speed changed | `WARNING` | Host port [{#PORT.ID}]: Actual speed |
| Seagate Exos Storage: SFP removed from host port [{#PORT.ID}] | `HIGH` | Host port [{#PORT.ID}]: SFP present |
| Seagate Exos Storage: SFP status is abnormal on host port [{#PORT.ID}] | `HIGH` | Host port [{#PORT.ID}]: SFP status |

##### Graph prototypes

| Graph prototype | Item prototype keys |
|---|---|
| Host port [{#PORT.ID}]: Performance | `seagate.exos.port.iops["{#DURABLE.ID}"]`<br>`seagate.exos.port.bps["{#DURABLE.ID}"]` |
| Host port [{#PORT.ID}]: Response time | `seagate.exos.port.latency["{#DURABLE.ID}"]`<br>`seagate.exos.port.read_latency["{#DURABLE.ID}"]`<br>`seagate.exos.port.write_latency["{#DURABLE.ID}"]` |
| Host port [{#PORT.ID}]: Queue depth | `seagate.exos.port.queue_depth["{#DURABLE.ID}"]` |

#### Replication sets discovery

- Discovery key: `seagate.exos.replications.discovery`
- Discovery type: `DEPENDENT`
- Item prototypes: 3
- Trigger prototypes: 3
- Graph prototypes: 0

##### Item prototypes

| Item prototype | Key | Type | Value type |
|---|---|---|---|
| Replication set [{#NAME}]: Get data | `seagate.exos.replication.get["{#LLD.ID}"]` | `DEPENDENT` | `TEXT` |
| Replication set [{#NAME}]: Health | `seagate.exos.replication.health["{#LLD.ID}"]` | `DEPENDENT` | `UNSIGNED` |
| Replication set [{#NAME}]: Status | `seagate.exos.replication.status["{#LLD.ID}"]` | `DEPENDENT` | `CHAR` |

##### Trigger prototypes

| Trigger prototype | Severity | Source item prototype |
|---|---|---|
| Seagate Exos Storage: Replication set [{#NAME}] health is degraded | `AVERAGE` | Replication set [{#NAME}]: Health |
| Seagate Exos Storage: Replication set [{#NAME}] health is in fault state | `HIGH` | Replication set [{#NAME}]: Health |
| Seagate Exos Storage: Replication set [{#NAME}] health is unknown | `WARNING` | Replication set [{#NAME}]: Health |

##### Graph prototypes

No graph prototypes.
<!-- END GENERATED MONITORING INVENTORY -->
