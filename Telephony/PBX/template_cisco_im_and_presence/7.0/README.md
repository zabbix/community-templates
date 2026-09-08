# Cisco IM and Presence 15 by API

## Release 7.0-4 — 2026-09-07

Parse certificate notAfter from ASN.1 Validity; reject missing service states rather than borrowing another record; use the canonical YAML for all deployment helpers to preserve CStatus validation.

No new requests, polling changes, item keys or trigger thresholds.

Zabbix 7.0.29 import, stored version, semantic re-export, isolated stored-script checks and the actual shared CUP import path passed during the September 7–8 acceptance run. Overall acceptance failed: swap utilization remains unsupported despite valid source counters on two tested nodes; the controlled service outage remains untested. This update is not a production-release approval.

## Overview

Monitors Cisco Unified Presence (CUP), now named Cisco IM and Presence Service
(IM&P), through read-only Cisco Serviceability PerfMon and ControlCenter SOAP.
The self-contained template is exported for Zabbix 7.0 and stores its release
as `vendor.name: Zabbix` and `vendor.version: 7.0-4`.

Maintainer: DevYves89

## Requirements

- Zabbix Server or Proxy 7.0 with HTTPS access to each IM&P node on TCP 8443.
- A dedicated Serviceability monitoring account with read access to PerfMon
  and ControlCenter. Do not use a personal administrator account.
- `SOAP -Performance Monitoring APIs` and the monitored IM&P services running.
- The exact local Serviceability node name for `{$CUP.NODE}`.

## Configuration

Link the template to one host per IM&P node and override these host macros:

| Macro | Required | Purpose |
|---|---:|---|
| `{$CUP.SERVICEABILITY.URL}` | yes | HTTPS Serviceability base URL including port 8443. |
| `{$CUP.NODE}` | yes | Exact local PerfMon node name. |
| `{$CUP.API.USER}` / `{$CUP.API.PASSWORD}` | yes | Read-only Serviceability account and secret password. |
| `{$CUP.API.TIMEOUT}` | no | Request timeout for read-only HTTP/SOAP/API calls; default `30s`. |
| `{$CUP.CPU.WARN}` / `{$CUP.CPU.HIGH}` | no | CPU warning/high thresholds; defaults `80` / `95` percent. |

`{$CUP.URL}`, `{$CUP.ROLE}`, and `{$CUP.SERVICES.CRITICAL}` are informational
context macros reserved for forward-compatible extensions. This baseline does
not reference them in item or trigger expressions.

The exported HTTP items have TLS peer and host verification disabled to support
appliance certificates in labs. Install the issuing CA on the Zabbix server or
proxy and enable both checks before production use.

## Metrics and alerts

- RTMT-inspired operations overview with PerfMon/ControlCenter health, system
  performance, IM&P workload, and current problems.
- PerfMon and ControlCenter collection health.
- CPU utilization, free physical memory, memory utilization, used swap, and
  total swap.
- Active SIP Proxy sessions, active IM sessions, and active presence
  subscriptions.
- Identity-certificate discovery with readable CN, issuer, SAN, UTC expiry,
  Key Usage, and Extended Key Usage fields derived from the existing PEM
  snapshot.
- Internal raw PerfMon and critical-service ControlCenter snapshots, tagged
  `scope=internal`; operator-facing values are tagged `scope=operator`.
- Triggers for missing PerfMon/ControlCenter data and sustained elevated/high
  CPU utilization.

The YAML contains 15 items and four triggers. It has no linked-template or
external-file dependency and performs no configuration or service changes.
No service-state trigger is inferred from the raw ControlCenter snapshot.
Latest Data uses the shared Cisco Collaboration tag contract: operator items
have `scope=operator` and a component such as `api`, `system`, `storage`,
`network`, `services`, `certificates`, or `telephony`; internal transport
payloads use `scope=internal`.

Cisco documents the relevant IM&P services in the official
[Services Guide](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cucm/admin/15/adminGd/cucm_b_administration-guide-15/cucm_b_test-adminguide_chapter_010111.html).

## Security and limitations

Store the password only as a Zabbix secret macro. Available PerfMon counters
and Serviceability permissions can vary by installed Cisco release. Validate
the dedicated account and counter names before production rollout.

## License

MIT License. By contributing this template, the maintainer agrees that this
file and associated template export are distributed under the MIT License.
