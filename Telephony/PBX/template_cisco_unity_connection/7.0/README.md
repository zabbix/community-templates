# Cisco Unity Connection 15 by API

## Release 7.0-5 — 2026-09-07

Parse certificate notAfter from ASN.1 Validity and reject non-finite/null CPU samples without reporting collection success.

No new requests, polling changes, item keys or trigger thresholds.

Zabbix 7.0.29 import, stored version, semantic re-export and isolated stored-script runtime checks passed during the September 7–8 acceptance run. A controlled service test encountered a Stop timeout and unsupported transition states; the service was restored, but the required outage/alarm/recovery test did not pass. This update is not a production-release approval.

## Overview

Monitors Cisco Unity Connection 15 through read-only VMREST/CUPI, Cisco
Serviceability PerfMon, ControlCenter SOAP, and Cisco VOS Certificate
Management APIs. The template is exported for Zabbix 7.0 and stores its
template release as `vendor.name: Zabbix` and `vendor.version: 7.0-5`.

Maintainer: DevYves89

## Requirements

- Zabbix Server or Proxy 7.0 with network access to the Unity HTTPS endpoints.
- A dedicated Unity user without a mailbox and with **Read Only Administrator**
  for GET-only VMREST/CUPI and Serviceability monitoring. If a particular CUC
  release rejects a required read endpoint, **System Administrator** is the
  documented compatibility fallback.
- A separate Cisco VOS Certificate Management account created with privilege
  `0` (read APIs only) when certificate discovery is enabled.
- TLS trust configured at the Zabbix Server or Proxy for production systems.

## Configuration

Link the template to one Unity Connection node and set these host macros:

| Macro | Required | Purpose |
|---|---:|---|
| `{$CUC.URL}` | yes | Unity base URL, without a trailing slash. |
| `{$CUC.FQDN}` | yes | Node FQDN for the independent HTTPS reachability check. |
| `{$CUC.SERVICEABILITY.URL}` | yes | Cisco Serviceability SOAP base URL, normally port 8443. |
| `{$CUC.CERT.URL}` | certificate only | Cisco VOS Certificate Management base URL. |
| `{$CUC.API.USER}` / `{$CUC.API.PASSWORD}` | yes | Read-only Unity account and secret password. |
| `{$CUC.OS.USER}` / `{$CUC.OS.PASSWORD}` | certificate only | Separate privilege-0 VOS Certificate Management account and secret password. |
| `{$CUC.NODE}` | yes | Exact Unity node name used in PerfMon counter paths. |
| `{$CUC.HTTP.PROXY}` | no | HTTP proxy URL for HTTP-agent collectors; empty means direct connection. |

Configure the supplied interval, threshold, and discovery-exclusion macros to
match the local deployment. `{$CUC.TELEPHONY.REQUIRED}` controls whether the
Unity telephony baseline is considered mandatory for alerts.

Cisco documents the application roles in the [Unity Connection 15 System
Administration Guide](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/connection/15/administration/guide/b_15cucsag/b_12xcucsag_chapter_010.html)
and the privilege-0 platform account in the [Certificate Management
authentication guide](https://developer.cisco.com/docs/certificate-management/authentication/).

## Metrics and alerts

- VMREST availability, version, and inventory counts.
- CPU, memory, swap, system, partition, and network-interface PerfMon data.
- Voice-port utilization, calls, MWI failures, voice sessions, failsafes, and
  opening-greeting delay.
- Message Store queue, delivery rate, retry/failure deltas, VMREST throttling
  telemetry when exposed by the node, and file-replication latency/rate.
- ControlCenter service discovery and state.
- Identity-certificate discovery with UTC expiry, Subject/Issuer CN, full DN,
  SAN, Key Usage, and Extended Key Usage metadata from the existing PEM
  snapshot.
- Independent HTTPS reachability and an RTMT-inspired operations overview with
  common health/system/workload summary cards and current problems.

Raw transport/master items are tagged `scope=internal`; operator-facing items
are tagged `scope=operator`. The template collects only read-only endpoints
and does not start, stop, restart, or otherwise modify Unity services.
Replication alerts remain opt-in through `{$CUC.REPLICATION.EXPECTED}`. The
three VMREST Container dependents are disabled by default and should be enabled
only when the raw master proves that the installed CUC release exposes those
counters.

Latest Data uses the shared Cisco Collaboration tag contract: operator items
have `scope=operator` and a component such as `api`, `system`, `storage`,
`network`, `services`, `certificates`, `replication`, or `telephony`; internal
transport/master payloads use `scope=internal`.

## Security and limitations

Store passwords only as Zabbix secret macros. Install the appropriate CA chain
and use certificate verification in production. Available PerfMon counters and
services vary by Unity Connection version and deployment.

## License

MIT License. By contributing this template, the maintainer agrees that this
file and associated template export are distributed under the MIT License.
