# Cisco Unified Communications Manager 15 cluster by API

## Release 7.0-12 — Complete and fresh aggregates

- Registration totals are stored only with complete, fresh sources. The baseline
  uses a new internal validated-samples history, excluding old partial totals.
  After upgrading, impact alerts re-arm after 720 valid five-minute samples
  (at least 60 hours with defaults) and a non-zero baseline. Other alarms remain active.
- Operations totals, completeness and media utilization recheck original core
  source freshness; recalculating an intermediate item cannot refresh old input.
- Core remains 7.0-12; Cisco requests and polling intervals are unchanged.

### Upgrade: an old setup HIGH is still open

Import this release in place, preserving existing items and history. If a HIGH
was opened before the INFO/HIGH split **and this host has never collected a valid
topology snapshot**, open Monitoring > Problems, select that exact topology
problem, choose Update, select Close problem and add a migration note. This
release permits manual closure of that trigger. The timer-driven setup INFO can
then appear on a subsequent evaluation while configuration is still incomplete.

Do not close a genuine refresh outage this way. Check Latest data/history and
your deployment record: absence of retained history alone does not prove that
collection never worked. If uncertain, leave HIGH open and restore collection.
Automatic recovery still requires a valid snapshot, so history expiry alone
cannot silently close an established outage. No bulk problem closure is needed.

## Release 7.0-11 — Topology initialization severity

- **INFO:** no successful topology snapshot is recorded after the configured
  no-data window (default three hours). Check the Publisher AXL URL, credentials
  and node URL mappings during initial setup.
- **HIGH:** collection succeeded before but has stopped refreshing for that
  window. The alarm recovers only when valid topology data arrives again.
- Successful health samples are retained for 90 days. Keep that history;
  deleting it resets the evidence of initialization. An already open HIGH
  does not recover because history expires and suppresses the setup INFO.
- Upgrade note: see the targeted migration procedure in release 7.0-12 above
  for an already open HIGH that originated during initial setup.
- Discovery triggers, other severities and polling intervals are unchanged.
  Core dependency remains 7.0-12. Upgrade the existing cluster template in place.

## Release 7.0-10 — Operations overview

Upgrade **every CUCM core node to 7.0-12 first**, then import cluster 7.0-10.
Existing registration-impact alerts remain unchanged. The dashboard adds
current CallsActive by node, node-summed call activity, other station devices,
MGCP registrations, SIP-trunk states and five separate media-resource types:
MTP, Transcoder, Software Conference, Hardware Conference and Video Conference.
CPU/memory and DB replication are shown per node; topology and problems remain.
Call history defaults to three hours. Counts have no decimal places; percentages
have one. Discovered node graphs show latest values in their legends and page
through larger node populations.

### Additional setup: choose one SIP-trunk source

| Macro on the virtual cluster host | Example | Where to find the value |
|---|---|---|
| `{$CUCM.CLUSTER.TRUNK.SOURCE.HOST}` | `cucm-pub.example.com` | Zabbix **Data collection → Hosts → Host name** of ONE core host with a healthy RIS SIP-trunk collector, normally the Publisher. Technical name, not visible name or URL. |

For a two-node example, the source group `CUCM Example Cluster Nodes` contains
`cucm-pub.example.com` and `cucm-sub.example.com`, both with core 7.0-12.
Both technical names must match their AXL node identities; matching
local source-discovery keys are supplied by the core (ordinary item tags do
not expand `{HOST.HOST}` for aggregate filtering). The virtual cluster host
is not a source-group member. Set the trunk source to `cucm-pub.example.com`;
never sum duplicate trunk inventories from both nodes.

### What the dashboard values mean

| Metric | Source and interpretation |
|---|---|
| Call activity | Existing PerfMon CallsActive. The sum is **node call-processing activity**, not guaranteed distinct conversations. No estimated division/deduplication. |
| Hardware phones | RegisteredHardwarePhones; the new summary requires complete fresh inputs. The existing baseline/impact logic is retained. |
| Other station devices | RegisteredOtherStationDevices, including possible soft clients, CTI and voicemail ports; not a SIP-phone count. |
| MGCP registered | RegisteredMGCPGateway; no configured-total ratio and no SCCP-gateway inference. |
| SIP trunks | One source's RIS snapshot. In service means RIS Registered, not SIP REGISTER or end-to-end call reachability. Runtime population is not configured inventory. |
| Media | Active/Available/Total from node-local CallManager counters, separated by resource type. |
| Utilization | `100 × sum(Active) / sum(Total)`, not the average of node percentages. Total=0 displays **No registered capacity**, not 100% free or proof of absent configuration. |

Media OutOfResources counters and reset-safe changes are available in core
Latest data. Zabbix discards first/reset delta samples instead of creating an
exhaustion spike. No generic capacity triggers are added.

The complete SIP/SCCP phone split is **not available** from the validated
PerfMon source. No CLI, bulk telephone RIS query or phone LLD was added.
Hardware-phone counts must not be used to infer the missing protocol split.

### Freshness and troubleshooting

Routine Cisco polling is unchanged: CallManager PerfMon normally 2m, local
cluster calculations 5m, existing SIP runtime 10m. These are last-polled values,
not real-time telemetry. After import, allow the next hourly topology discovery
and several normal five-minute calculation cycles to populate new children.

Check **Operations data** and each metric's `data complete` item. Exactly one
fresh, supported source is required for every topology node; stale, duplicate,
missing or extra sources invalidate the aggregate. Missing data is never zero.
Calculated items deliberately become unavailable when completeness fails.
Dashboard lookups expire old operation values after 6m, trunks after 12m and
hourly topology after 3h. Fix the source/mapping rather than bypassing the gate.
The new source-label script and one-identity source discovery run locally and
perform no HTTP request. They discover one CUCM node identity, never phones.

This release adds **zero routine Cisco requests**, but adds Zabbix-side
calculations. No new Cisco credentials, permissions or services are required.
Sources: [Cisco PerfMon API](https://developer.cisco.com/docs/sxml/perfmon-api/)
and [Cisco counter definitions](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cucm/service/15/rtmt/cucm_b_cisco-unified-rtmt-administration-15/cucm_m_performance-counters-and-alerts-15.html).

Monitor CUCM node availability, CallManager Group membership and cluster-wide
hardware-phone registration from one virtual Zabbix host. The required CUCM
core template collects the node metrics; this template combines them with
Publisher AXL topology and node-local ControlCenter status.

## 1. Prepare CUCM and Zabbix

You need CUCM 15, Zabbix 7.0 and the
[**Cisco Unified Communications Manager 15 by API** core template](../../template_cisco_unified_communications_manager/7.0/README.md)
**7.0-12 or later**. The core registration counter must have the
`metric=registered-hardware-phones` tag. Import and configure the core template
first, and confirm that its registered-hardware-phone item receives data.

The Zabbix Server or assigned Proxy must reach the Publisher and every
monitored node over HTTPS on TCP 8443. If DNS is unavailable, use the IP
mapping in section 4. Perform connectivity checks from the collector, not
only from your administration workstation.

In CUCM:

1. In **Cisco Unified Serviceability → Tools → Service Activation**, verify
   **Cisco AXL Web Service** is activated on the Publisher. Check its running
   status under **Tools → Control Center - Feature Services**.
2. Under **CUCM Administration → User Management → Application User**, create
   a dedicated account, for example `zbx_cucm_ro`.
3. Under **User Management → User Settings → Access Control Group**, configure
   read-only AXL access using the **Standard AXL API Users** and
   **Standard AXL Read Only API Access** roles, and add the application user.
   Also grant **Standard CCM Server Monitoring** for service monitoring.
   See [Cisco's AXL authentication guide](https://developer.cisco.com/docs/axl/authentication/).
4. Verify that the account can read ControlCenter service status on both nodes.
   Use the application account in the macros below; the cluster template
   does not require an operating-system/SSH account.

## 2. Collect your values

All setup examples use **two servers: one Publisher and one Subscriber**.
Both are members of `CMG-Primary` and run Cisco CallManager in this example.
For larger clusters, add the other monitored members.

| Value | Example | Where to find it |
|---|---|---|
| Publisher node identity | `cucm-pub.example.test` | CUCM Administration → **System → Server → Find**, open the Publisher and read **Host Name/IP Address**. |
| Subscriber node identity | `cucm-sub1.example.test` | Same page, open the Subscriber. Copy the configured identity; it may be a short name, FQDN or IP. Do not add a domain yourself. |
| Node IP addresses | Publisher `192.0.2.10`, Subscriber `192.0.2.11` | On each node: **Cisco Unified OS Administration → Settings → IP → Ethernet**. Read the address without changing it. |
| Publisher AXL base URL | `https://192.0.2.10:8443` | Build it from the Publisher IP above: `https://<publisher-IP>:8443`. Do not add `/axl/`; the script adds it. |
| Node connection URLs | `https://192.0.2.10:8443` and `https://192.0.2.11:8443` | Build one HTTPS base URL from each node's own IP. These are the JSON values in section 4. |
| Application username/password | `zbx_cucm_ro` / your actual secret | **User Management → Application User**. Use the account you prepared; an existing password cannot be read back. |
| AXL schema version | `15.0` | For this CUCM 15 template, retain `15.0`. Check the installed product release in **Cisco Unified OS Administration → Show → Software**; do not enter its full build number as the schema version. |
| CallManager Group name and members | `CMG-Primary`, Publisher then Subscriber | CUCM Administration → **System → Cisco Unified CM Group**. Open the group and check its name and selected members. |
| Device Pool assignment | `DP-HeadOffice` → `CMG-Primary` | CUCM Administration → **System → Device Pool**, open the pool and read **Cisco Unified Communications Manager Group**. Discovery reads this automatically; no macro is required. |

These are documentation addresses and names; replace them with your own.

## 3. Create the three Zabbix hosts

| Technical host name | Linked template | In source group `CUCM production nodes`? |
|---|---|---|
| `cucm-pub.example.test` | CUCM core 7.0-11+ | Yes |
| `cucm-sub1.example.test` | CUCM core 7.0-11+ | Yes |
| `cucm-example-cluster` | CUCM cluster | No |

1. Configure the two real node hosts using the core README. For clarity, use
   their CUCM identities as their technical Zabbix host names.
2. Create the source group under **Data collection → Host groups** and add
   only the monitored members of this cluster.
3. Import the cluster YAML under **Data collection → Templates → Import**.
4. Under **Data collection → Hosts**, create `cucm-example-cluster`, link
   this cluster template and assign a separate group such as `CUCM clusters`.
   No agent interface is required. Select a Server/Proxy with the connectivity
   described above.
5. On this virtual host, open **Macros → Inherited and host macros** and
   enter the values in section 4.

The cluster discovers nodes that belong to a CallManager Group. Match the
source group to those discovered nodes. A Publisher used only for administration
and absent from every CallManager Group must not be added to this source group.
It can still have the core template and remains the AXL endpoint.

The current completeness check compares counts and freshness. It does not
detect a wrong host substituted for a correct host in a same-sized group;
verify the membership during setup.

## 4. Set the connection macros

Enter the **macro name and value in separate fields**, without backticks.
Credentials on a real node host are not inherited by the virtual cluster host.

| Macro | Value for the two-node example | Action |
|---|---|---|
| `{$CUCM.AXL.URL}` | `https://192.0.2.10:8443` | Required: replace with your Publisher base URL from section 2. |
| `{$CUCM.API.USER}` | `zbx_cucm_ro` | Required: replace the shipped `zabbix-monitor` example with your application user. |
| `{$CUCM.API.PASSWORD}` | Your actual application-user password | Required: enter as **Secret text**. The template intentionally leaves it empty. |
| `{$CUCM.CLUSTER.SOURCE.HOSTGROUP}` | `CUCM production nodes` | Required: use the exact group created in Zabbix. Shipped example: `CUCM cluster nodes`. |
| `{$CUCM.API.VERSION}` | `15.0` | Keep the default for CUCM 15. |
| `{$CUCM.CLUSTER.NODE.URLS}` | Copy the two-node JSON below | Needed when discovered names cannot be resolved. Default `{}` uses DNS. |
| `{$CUCM.HTTP.PROXY}` | Empty, or `http://proxy.example.test:3128` | Optional outbound HTTP proxy, supplied by your network team. This is not the Zabbix Proxy selection. |

### Copyable two-node IP mapping

Paste this entire JSON object into the value of
`{$CUCM.CLUSTER.NODE.URLS}`, then replace both names and both IPs:

```json
{"cucm-pub.example.test":"https://192.0.2.10:8443","cucm-sub1.example.test":"https://192.0.2.11:8443"}
```

The **left side** is the exact CUCM node identity from **System → Server**.
The **right side** is that node's connection URL. With IPs on the right,
Zabbix does not need DNS for the names on the left. More nodes go inside the
same braces as additional comma-separated entries.

- Use **one** outer object: `{...,...}`, not two objects `{...},{...}`.
- Put ordinary double quotes `"` around every name and URL.
- Copy plain text, not Markdown links such as `[name](http://name/)`.
- Do not include backticks, an outer pair of quotes or a trailing comma.
- An unused mapping is `{}`, not an empty field. Unmapped node names and
  hostnames used in URLs still require DNS.

The mapping affects only the cluster's ControlCenter connections. It does not
configure the individual core-template hosts.

## 5. Enable node and group alerts

First check **Cisco Unified Serviceability → Tools → Control Center -
Feature Services** on each node: only expect Cisco CallManager where it
should run. For our two-node example, add these host macros:

| Macro name | Value | Meaning |
|---|---|---|
| `{$CUCM.CLUSTER.NODE.EXPECTED:"cucm-pub.example.test"}` | `1` | Publisher CallManager must be available. |
| `{$CUCM.CLUSTER.NODE.EXPECTED:"cucm-sub1.example.test"}` | `1` | Subscriber CallManager must be available. |
| `{$CUCM.CLUSTER.CMG.EXPECTED:"CMG-Primary"}` | `1` | This group must have at least two configured members. |

Use your names from section 2 inside the quotes. These are concrete overrides
of the template macros `{$CUCM.CLUSTER.NODE.EXPECTED:"{#NODE}"}` and
`{$CUCM.CLUSTER.CMG.EXPECTED:"{#CMGROUP}"}`. Both default to `0`.
A value of `1` enables that expectation; `0` disables it.

API/topology and source-completeness alerts are independent of these switches.
Registration-impact alerts automatically become eligible once their baseline
and data-completeness conditions are met.

## 6. Leave these defaults for the first deployment

These are monitoring settings, not values to look up in CUCM. Every example
below is also its shipped default. Together with sections 4 and 5, this covers
all **19 cluster-template macros**.

| Macro | Default/example | Meaning and format |
|---|---|---|
| `{$CUCM.CLUSTER.TOPOLOGY.INTERVAL}` | `1h` | Read topology every hour. |
| `{$CUCM.CLUSTER.TOPOLOGY.NODATA}` | `3h` | Alert after no successful topology data for three hours; adjust with the topology interval. |
| `{$CUCM.CLUSTER.NODE.RUNTIME.INTERVAL}` | `5m` | Read node status every five minutes; alert timing assumes this interval. |
| `{$CUCM.CLUSTER.SOURCE.FRESHNESS}` | `6m` | Accept core registration values up to six minutes old. |
| `{$CUCM.CLUSTER.MAX.NODES}` | `12` | Integer limit 1–12; a safety cap, not the expected number of nodes. Keep 12 for the two-node example. |
| `{$CUCM.CLUSTER.MAX.CMGROUPS}` | `12` | Integer limit 1–12 for topology groups. |
| `{$CUCM.CLUSTER.PHONE.BASELINE.WINDOW}` | `7d` | Rolling registration average over available history within seven days. |
| `{$CUCM.CLUSTER.PHONE.BASELINE.MIN.SAMPLES}` | `720` | Positive integer; at five-minute intervals, approximately 60 hours of successful samples before alerts can arm. A nonzero baseline is also required. |
| `{$CUCM.CLUSTER.PHONE.HIGH.PCT}` | `90` | High threshold: percentage above Disaster and at or below 90. Enter a number without `%`. |
| `{$CUCM.CLUSTER.PHONE.DISASTER.PCT}` | `50` | Disaster threshold: percentage at or below 50. Keep it below High; enter a number without `%`. |

Time values use Zabbix suffixes: `m` = minutes, `h` = hours, `d` = days.

## 7. Verify the first collection

Save the host. Under **Monitoring → Latest data**, select the virtual cluster
host and include internal items. Run **Execute now** once on
**CUCM internal: cluster topology raw/master**, or wait for its hourly poll.
Allow subsequent normal five-minute cycles for node checks and calculations.

For the example above, expect:

| Item | Expected result |
|---|---|
| Topology health | Healthy / `1` |
| Discovered nodes | `2` |
| Core-template source nodes / fresh source nodes | `2` / `2` |
| Core-template source completeness | Complete / `1` |
| CallManager Groups / Device Pools | Match the actual CUCM configuration |
| Both node CallManager states | Started |
| Registered hardware phones | Sum of the two core source counters; valid zero is possible |
| Registration baseline ready | Initially `0`; later `1` only with enough samples and a nonzero average |

A baseline that is not ready is normal during startup. A red unsupported
error is different: inspect its upstream items and verify recovery after a
normal poll; do not wait seven days to investigate it.

## Troubleshooting

| Symptom | Check |
|---|---|
| `invalid node URL mapping JSON` | Correct the value in section 4. Remove Markdown links, quote the URLs and keep both entries in one object. Refresh the topology master once after saving. |
| Node identity rejected | Compare JSON keys with **System → Server**; do not substitute a Zabbix display name or invent a FQDN. |
| Cannot resolve host | Map both nodes to IP URLs; also use a Publisher IP for AXL if needed. |
| HTTP 401/403 | Check application credentials and access-control roles, separately on the cluster host and core hosts. |
| AXL HTTP/SOAP error | Check the Publisher base URL, AXL service, schema version and read-only permissions. |
| `topology.nodes is not supported` | Inspect the topology raw/master error first; the count and completeness errors may be consequences. |
| Source count differs from discovered count | Correct the source group's members; exclude the virtual host, unrelated clusters and nodes absent from the discovered topology. |
| Sources stale or registration aggregate has no data | Check core counter support, freshness and the required metric tag on both source hosts. |
| Unexpected node/group alert | Check the exact EXPECTED context and the intended Cisco CallManager service/group membership. |

## Dashboard and scope

The template reports group membership and node service availability, plus
cluster-wide hardware-phone registration relative to a rolling baseline.
Default registration alerts require three qualifying five-minute samples:
Disaster at or below 50%, High above 50% and at or below 90%, subject to
source/topology health and baseline readiness.

Topology is collected hourly, and node service status every five minutes.
There is no individual-phone discovery, bulk RIS phone query or per-Device-Pool
registration count. Device Pools provide configuration context. Software and
patch inventory are outside this template's scope.

## Documentation changelog

- 7.0-10: operations dashboard, core 7.0-12 prerequisite, one-source trunk
  selection, media-capacity semantics and missing-data guidance added.

- Reorganized deployment into preparation, two-node setup, connection macros,
  alert opt-in and first-poll verification.
- Added CUCM menu locations for manual values and grouped all 19 macros by purpose.
- Consolidated JSON guidance; clarified DNS, source membership and baseline startup.
- Documentation only; template version and polling behavior unchanged.

## License

Maintainer: DevYves89

MIT License. By contributing this template, the maintainer agrees that this
file and the associated export are distributed under the MIT License.
