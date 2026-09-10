# Cisco Unified Communications Manager 15 by API

## Release 7.0-10 — 2026-09-07

Fixed exact ControlCenter service identity and record boundaries for state, reason and uptime; parse certificate notAfter from ASN.1 Validity; reject non-finite/null CPU samples without reporting collection success.

No new requests, polling changes, item keys or trigger thresholds.

Zabbix 7.0.29 import, stored version, semantic re-export and isolated stored-script runtime checks passed during the September 7–8 acceptance run. Overall acceptance is not complete: Subscriber identity/failover verification, legacy SIP-discovery reconciliation and dashboard readability remain open. This update is not a production-release approval.

## Overview

Monitors Cisco Unified Communications Manager 15 through read-only AXL,
RISPort70, PerfMon, ControlCenter SOAP, and Cisco VOS Certificate Management
APIs. The template is exported for Zabbix 7.0 and stores its template release
as `vendor.name: Zabbix` and `vendor.version: 7.0-10`.

Maintainer: DevYves89

## Requirements

- Zabbix Server or Proxy 7.0 with network access to the CUCM HTTPS endpoints.
- A dedicated CUCM application user assigned to **Standard CCM Server
  Monitoring** and to a custom AXL read-only access control group containing
  **Standard AXL API Users** plus **Standard AXL Read Only API Access**.
- A separate Cisco VOS Certificate Management account created with privilege
  `0` (read APIs only) when certificate discovery is enabled.
- TLS trust configured at the Zabbix Server or Proxy for production systems.

## Configuration

Link the template to one CUCM node and set these host macros before collection:

| Macro | Required | Purpose |
|---|---:|---|
| `{$CUCM.URL}` | yes | CUCM API base URL, including port 8443. |
| `{$CUCM.AXL.URL}` | yes | CUCM Publisher AXL base URL. Use the Publisher value on every node host, including Subscribers. |
| `{$CUCM.FQDN}` | yes | Node FQDN for the independent HTTPS reachability check. |
| `{$CUCM.API.USER}` / `{$CUCM.API.PASSWORD}` | yes | Shared read-only AXL, PerfMon, RISPort70, and ControlCenter account and secret password. |
| `{$CUCM.NODE}` | yes | Exact CUCM node name used in PerfMon counter paths. |
| `{$CUCM.OS.USER}` / `{$CUCM.OS.PASSWORD}` | certificate only | Separate privilege-0 VOS Certificate Management account and secret password. |
| `{$CUCM.HTTP.PROXY}` | no | HTTP proxy URL for HTTP-agent collectors; empty means direct connection. |

Threshold, discovery-filter, expected-service, and polling macros are
documented in the template itself. Keep `{$CUCM.DB.REPLICATION.EXPECTED}` at
`0` on standalone Publishers; set it to `1` only when replication is known to
be expected. Service outage triggers are opt-in through the contextual
`{$CUCM.SERVICE.EXPECTED:"<service name>"}` macro.
SIP-trunk outage triggers use the same opt-in contract through
`{$CUCM.SIP.TRUNK.EXPECTED:"<trunk name>"}`.

Installed-package inventory is not included. CUCM VOS requires an interactive
CLI session for `show version active`; native Zabbix SSH uses a noninteractive
exec request and returns only the VOS startup banner in live validation. Cisco
does not provide a validated stable read-only public API for the installed COP,
device-pack, and phone-load package list. An external interactive SSH helper
would be separate from this agentless community template.

Cisco documents the required access in the [AXL authentication
guide](https://developer.cisco.com/docs/axl/authentication/), [PerfMon getting
started guide](https://developer.cisco.com/site/sxml/learn/getting-started/perfmon/),
[RISPort getting started guide](https://developer.cisco.com/site/sxml/learn/getting-started/risport/),
[RISPort70 response contract](https://developer.cisco.com/docs/sxml/risport70-api/),
[RIS timestamp-semantics clarification](https://community.cisco.com/t5/management/cucm-12-risport-quot-last-active-quot-and-quot-last-registered/td-p/4075726),
and [Certificate Management authentication
guide](https://developer.cisco.com/docs/certificate-management/authentication/).

## Metrics and alerts

- API health for AXL, RISPort70, PerfMon, ControlCenter, and Certificate
  Management.
- CPU, memory, swap, uptime, process/thread counts, disk IOPS, partition and
  network-interface performance.
- Active and Inactive VOS image-partition utilization as informational values;
  their expected image occupancy is excluded from generic capacity alerts.
- CallManager media capacity, Average Expected Delay, Code Yellow/Red, and
  call-processing queue/rejection metrics.
- ControlCenter service state, reason, uptime and expected-service alarms.
- Certificate discovery with expiry, Subject, Issuer, SAN, user-friendly Key
  Usage, and Extended Key Usage metadata from the existing PEM snapshot.
- SIP-trunk PerfMon call statistics plus bounded RISPort70 registration,
  registering-node, and full-service-uptime discovery. A valid absent runtime
  record remains absent and is never fabricated as Down; malformed or future
  registration timestamps fail closed.
- An RTMT-inspired operations overview with common health/system/workload
  summary cards, performance graphs, AXL throttling, Code Yellow/Red,
  expected delay, SIP runtime-state aggregates, and current problems.

Latest Data uses stable item-tag axes: `scope=operator|internal`, functional
`component`, and collector `source`. Discovered items additionally carry their
concrete `certificate`, `partition`, `service`, or `sip_trunk` value;
certificate fields use `metric=expiry|identity|usage`. Configure the discovery
exclusion macros for the local topology before enabling optional alerts.

AXL is configuration inventory rather than a per-node runtime API, so
`{$CUCM.AXL.URL}` must name the Publisher for all hosts in a cluster. PerfMon,
RISPort70, and ControlCenter continue to use the node-local `{$CUCM.URL}`.

## Security and limitations

The template performs read-only API calls. Store passwords only as Zabbix
secret macros. CUCM API availability, installed services, PerfMon counters,
and certificate endpoints vary by deployment; unsupported APIs should be
disabled or correctly provisioned rather than treated as a zero metric.

Release 7.0-9 is the feature-frozen agentless infrastructure bugfix baseline.
Its `RegisteredHardwarePhones` item additionally carries the dynamic
`node:{HOST.HOST}` tag. This adds no collection load and lets the separate
CUCM cluster template correlate aggregate inputs with AXL process-node
identities.
Installed-package inventory remains deferred until a stable read-only API or
an agentless interactive transport can be validated.
Phone-level monitoring, CDR/CMR call quality, DRS, NTP, hardware/core-dump
alarms, RTMT alert ingestion, Smart Licensing, and unvalidated gateway
discovery require separate optional templates or a newly proven bounded
read-only source.

## License

MIT License. By contributing this template, the maintainer agrees that this
file and associated template export are distributed under the MIT License.
