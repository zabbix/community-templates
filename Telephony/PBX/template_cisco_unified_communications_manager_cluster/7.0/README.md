# Cisco Unified Communications Manager 15 cluster by API

## Overview

Optional agentless cluster-impact monitoring for one Cisco Unified
Communications Manager 15 cluster. Link it once to a virtual Zabbix **cluster
host**—not to the Publisher or a Subscriber. It is exported for Zabbix 7.0
with `vendor.name: Zabbix` and `vendor.version: 7.0-7`.

The template combines a small read-only Publisher AXL topology snapshot with
existing values from the core **Cisco Unified Communications Manager 15 by
API** template. It monitors CallManager Group failover topology and a
cluster-wide registered-hardware-phone impact signal, without individual-phone
LLD, `listPhone`, or RISPort70 queries.

Maintainer: DevYves89

## Requirements

- Zabbix Server or Proxy 7.0 with HTTPS access to each discovered CUCM node
  on port 8443 and to the Publisher AXL endpoint. Process-node FQDNs normally
  resolve directly; use the exact URL mapping macro below if they do not.
- A dedicated CUCM application user assigned **Standard CCM Server
  Monitoring** and a custom read-only AXL group containing **Standard AXL API
  Users** plus **Standard AXL Read Only API Access**.
- **Cisco Unified Communications Manager 15 by API** release `7.0-9` or
  later linked to every Publisher/Subscriber source host.
- One dedicated Zabbix host group containing exactly those core-template node
  hosts. The virtual cluster host must not be in this group.
- Cisco AXL Web Service and ControlCenter Serviceability API enabled. The AXL
  URL must point to the Publisher.

## Configuration

1. Import this export and create one virtual Zabbix host for the CUCM cluster.
   It requires no agent interface and does not populate host inventory fields.
2. Link this template only to that virtual cluster host.
3. Create a host group containing only the real CUCM node hosts with the core
   template. Their **technical Zabbix host names must exactly match** the
   normalized AXL process-node identities. Set the group's exact name in
   `{$CUCM.CLUSTER.SOURCE.HOSTGROUP}` on the virtual host. The template also
   creates an exact per-discovered-node cross-host reference, so a partial,
   stale, or mismatched source population blocks registration-impact alerts.
4. On the virtual host, configure the Publisher `{$CUCM.AXL.URL}`, AXL API
   version, the dedicated application user, its secret password, and optional
   HTTP proxy. The credentials are never stored in the export.
5. If an AXL process-node FQDN is not resolvable by the Zabbix Server/Proxy,
   set `{$CUCM.CLUSTER.NODE.URLS}` to an exact JSON mapping, for example
   `{"cucm1.example":"https://192.0.2.10:8443"}`. Each key must be an exact
   discovered AXL process-node identity; unknown nodes, non-HTTPS URLs and
   malformed JSON fail closed. Do not map two nodes to one endpoint.
6. Set contextual `{$CUCM.CLUSTER.NODE.EXPECTED:"<node>"}=1` only for real
   discovered nodes whose CallManager service must be `Started`. Set
   `{$CUCM.CLUSTER.CMG.EXPECTED:"<group>"}=1` only for groups that must have
   two or more configured members. Both defaults are `0`.

| Macro | Default | Purpose |
|---|---:|---|
| `{$CUCM.CLUSTER.TOPOLOGY.INTERVAL}` | `1h` | Publisher AXL topology refresh. |
| `{$CUCM.CLUSTER.NODE.RUNTIME.INTERVAL}` | `5m` | Per-node ControlCenter state check. |
| `{$CUCM.CLUSTER.NODE.URLS}` | `{}` | Optional exact AXL-node → ControlCenter HTTPS URL JSON mapping. |
| `{$CUCM.CLUSTER.MAX.NODES}` | `12` | Hard fail-closed discovery cap; only integer values `1`–`12` are accepted. |
| `{$CUCM.CLUSTER.MAX.CMGROUPS}` | `12` | Hard fail-closed CallManager Group cap; only integer values `1`–`12` are accepted. |
| `{$CUCM.CLUSTER.SOURCE.FRESHNESS}` | `6m` | Maximum age for every core registration source. |
| `{$CUCM.CLUSTER.PHONE.BASELINE.WINDOW}` | `7d` | Cluster registration rolling mean. |
| `{$CUCM.CLUSTER.PHONE.BASELINE.MIN.SAMPLES}` | `720` | Samples needed before impact alerts arm. |
| `{$CUCM.CLUSTER.PHONE.HIGH.PCT}` | `90` | High upper threshold, inclusive. |
| `{$CUCM.CLUSTER.PHONE.DISASTER.PCT}` | `50` | Disaster lower threshold, inclusive. |

The source-completeness check requires matching topology/source-group
cardinality and exactly one fresh exact core-template value for every discovered
process node. Missing or duplicate node-tagged sources fail closed. Valid topology is an additional explicit gate on every registration-impact
trigger, so an unavailable topology item cannot create a secondary calculated-
item error. CUCM short node names and FQDNs are
reconciled only when the short name identifies exactly one process node;
ambiguous identities fail closed. CUCM's `CM_<node-short-name>` CallManager
service form is accepted through that same uniqueness gate. The live validator
also requires exact source-host and normalized AXL-node identities.

## Metrics and alerts

- Publisher AXL `listProcessNode`, `listCallManagerGroup`, and
  `listDevicePool` once per hour, then one read-only `getCallManagerGroup`
  request per discovered group to retrieve its ordered members. Duplicate,
  malformed, unresolved, inconsistent, or over-cap topology is rejected as a
  whole.
- Node LLD with each node's CallManager Group and Device Pool context, then a
  direct ControlCenter `Cisco CallManager` state check every five minutes.
- CallManager Group LLD with the ordered primary/secondary/tertiary members,
  plus Device Pool → CallManager Group LLD.
- Existing core-template `RegisteredHardwarePhones` values aggregated by
  exact per-discovered-node Zabbix 7.0 calculated items. Each item selects
  its source within the configured host group by the core item's exact
  `node:{HOST.HOST}` tag. Exactly one fresh tagged source is required per
  discovered node; the host group's count and freshness must still match
  topology before impact alerts can arm.
- A seven-day rolling baseline and percentage, gated until 720 aggregate
  samples exist and every source is fresh and complete.
- **Disaster** when registration remains at or below 50% of baseline for
  three five-minute samples; **High** when it is above 50% and at or below
  90% for the same sustained period.
- **High** for an expected node with no valid state for ten minutes or a
  sustained `Stopped` state. **Warning** for an expected CallManager Group
  with fewer than two configured members for ten minutes. A stale topology or
  incomplete core inputs is **High** and blocks the registration-impact ladder.
- An RTMT-inspired **Cluster operations overview** with topology/source cards,
  registration and coverage graphs, and current problems.

The default maximum of 12 nodes means at most 2.4 ControlCenter status
requests/minute. The three hourly AXL list calls plus at most 12 bounded group
detail reads add 0.25 AXL requests/minute.
The template makes no phone
inventory or RISPort70 request; it does not provide per-phone or
per-Device-Pool registration status.

## Security and limitations

All CUCM requests are read-only. Use the least-privileged user described
above, a secret Zabbix macro for its password, and validated TLS in production.
The Publisher is the source of configuration topology; ControlCenter calls are
node-local runtime checks.

CUCM device pools choose an ordered CallManager Group for endpoint registration
failover. This template reports the relationship as incident context, but it
does not infer that every device in a Device Pool has failed over or is down.
For Cisco RISPort70 device-query limits and rate guidance, see the
[RISPort70 API](https://developer.cisco.com/docs/sxml/risport70-api/).

## License

MIT License. By contributing this template, the maintainer agrees that this
file and associated template export are distributed under the MIT License.
