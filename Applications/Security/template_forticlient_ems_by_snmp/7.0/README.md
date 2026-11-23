# FortiClient EMS by SNMP

Author: [Nilleftw](https://github.com/Nilleftw).

Zabbix 7.0 template for FortiClient EMS 7.4.8. Import [template_forticlient_ems_by_snmp.yaml](template_forticlient_ems_by_snmp.yaml). Configure an SNMP interface on the Zabbix host and allow UDP/161 to the EMS appliance. The template uses numeric OIDs and does not require a local MIB installation.

Template vendor is **Nilleftw** (maintainer), with version **7.0-0** for the first numbered revision on the Zabbix 7.0 branch. This is a template revision, not an EMS version or a required Zabbix patch level. Template tags are `class: software`, `target: forticlient-ems`, and `target: fortinet`.

## Default monitoring

| Area | Enabled by default | Alert |
|---|---|---|
| Site license utilization | Yes | At least 90%; configurable with `{$EMS.LICENSE.WARN}` |
| System CPU | Yes | 15-minute average above 85%; `{$EMS.SNMP.CPU_WARN}` |
| System RAM | Yes | 15-minute average above 90%; `{$EMS.SNMP.RAM_WARN}` |
| Filesystem utilization | Yes | 15-minute average above 90%; `{$EMS.SNMP.DISK_WARN}` |
| SNMP license data availability | Yes | No license walk data for 20 minutes |
| System uptime | Yes | Informational |

Filesystem discovery includes `/` and `/boot` by default. Set `{$EMS.SNMP.FS.MATCHES}` on the host to a regular expression such as `^/$` to monitor only the root filesystem. The calculated utilization uses used and total blocks; the allocation-unit helper item is disabled by default.

Process CPU and memory, port and node metrics, database node metrics, site keepalive, network counters, and swap are disabled by default. To collect an optional group, enable its SNMP walk master and the relevant discovery rule or dependent items. Enabling a dependent item alone does not start polling a disabled master. Port, node, and database node values are informational; their service-status meaning has not been verified. One observed keepalive dependent item became unsupported during lab testing, so keepalive remains optional.

## Comparison with HTTP

| Capability | SNMP | HTTP |
|---|---|---|
| License utilization | Per site | Per license type and site |
| License expiry, seat counts, trial status | Unavailable | Available |
| CPU, RAM, disk utilization | Available | Available |
| Endpoint and security counts | Unavailable | Available |
| Certificate expiry | Unavailable | Available |
| HA and system status | Node metrics with unverified meaning | Available |
| Process and network diagnostics | Optional | Optional |

The templates therefore share the core capacity alerts, but HTTP provides broader EMS application monitoring. Do not enable both on the same host unless duplicate CPU, RAM, disk, and license metrics are intentional.

## Validation

Imported into Zabbix 7.0.32 and tested against FortiClient EMS 7.4.8. The SNMP host returned values for license utilization, total CPU, RAM, root and boot filesystem usage. All six discovered and static SNMP triggers were valid and no enabled item was unsupported after the lab host was updated. Validate filesystem indexes and item availability when importing into other EMS installations.

## License

MIT (repository-wide license). Maintained by Nilleftw; not an official Fortinet template.
