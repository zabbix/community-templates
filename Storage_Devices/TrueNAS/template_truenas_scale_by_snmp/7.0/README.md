# TrueNAS SCALE by SNMP

## Overview

This template monitors TrueNAS SCALE through SNMP. It covers system health,
CPU and memory, network interfaces, disks, ZFS pools, datasets, zvols, ARC,
L2ARC, and ZIL activity. Optional SNMP trap items collect TrueNAS alerts.

The template uses the TrueNAS enterprise MIB layout introduced in 2026. It is
intended for SCALE releases whose dataset, zvol, L2ARC, and ZIL OIDs no longer
match older FreeNAS and early TrueNAS SCALE templates.

## Requirements

| Requirement | Details |
| --- | --- |
| Zabbix | 7.0 or later |
| TrueNAS | SCALE 25.10 or later |
| SNMP | An SNMP interface configured on the Zabbix host |
| Network | UDP/161 from the Zabbix server or proxy to TrueNAS |
| Traps | UDP/162 and a Zabbix trap receiver, optional |

The template uses numeric OIDs from HOST-RESOURCES-MIB, SNMPv2-MIB,
UCD-DISKIO-MIB, UCD-SNMP-MIB, and TRUENAS-MIB (enterprise 50536).

## Setup

1. Enable the SNMP service in the TrueNAS web interface.
2. Import `template_truenas_scale_by_snmp.yaml` into Zabbix.
3. Create or edit the TrueNAS host and add an SNMP interface for its management
   address.
4. Configure the SNMP credentials on that interface.
5. Link `TrueNAS SCALE by SNMP` to the host.
6. Adjust the template macros for the environment's capacity, temperature,
   utilization, and discovery thresholds.

To use alert trap monitoring, configure TrueNAS to send SNMP alerts to the
Zabbix trap receiver. Polling works without trap reception.

## Template summary

| Area | Count |
| --- | ---: |
| Zabbix version | 7.0 |
| Regular items | 43 |
| Low-level discovery rules | 7 |
| Item prototypes | 32 |
| User macros | 36 |
| Dashboards | 1 |

## Discovery

The template discovers:

- CPU cores
- network interfaces
- disk temperatures
- ZFS datasets
- ZFS pools
- ZFS volumes
- block devices

Discovery filters and trigger thresholds are exposed as host-overridable user
macros. Review the `MATCHES` and `NOT_MATCHES` macros after linking the
template, especially when dataset or interface names differ from the defaults.

## Compatibility notes

TrueNAS changed several enterprise OID branches between older SCALE releases
and the 2026 TRUENAS-MIB:

| Data | Older branch | 2026 branch |
| --- | --- | --- |
| datasets | `.50536.1.2.1.1` | `.50536.1.6.1.1` |
| zvols | `.50536.1.3.1.1` | `.50536.1.2.1.1` |
| L2ARC | `.50536.1.5` | `.50536.1.4` |
| ZIL | `.50536.1.6` | `.50536.1.5` |

This template was tested by its upstream maintainer with TrueNAS SCALE 25.10.4
and Zabbix 7.0. It was independently validated with TrueNAS SCALE 25.10.5 and
Zabbix 7.0.29.

The community repository also contains `TrueNAS by WebSocket API` for Zabbix
7.4. That template uses a WebSocket bridge and is an alternative for Zabbix
7.4 deployments; it is not an in-place replacement for this Zabbix 7.0 SNMP
template.

## Source and license

Upstream project:
<https://github.com/tr1plus/zabbix_truenas_SCALE_snmp>

Vendored from upstream commit
`5722edab3e2f7337817faee869569f6d257119bd` dated 2026-06-09. The dashboard
widget order and one graph sort order were normalized so repeated Zabbix 7.0
imports remain stable; monitored OIDs and item definitions are unchanged.

The template is distributed under GNU GPL v2 or later. See
`files/LICENSE.upstream`.

## Author

Template maintained upstream by
[`tr1plus`](https://github.com/tr1plus). Community-repository packaging and
TrueNAS SCALE 25.10.5 validation contributed by
[`hshimomura`](https://github.com/hshimomura).
