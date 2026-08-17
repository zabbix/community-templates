# Community template with the additions from this repository

`template_opnsense_by_http_json-7.4-extended.yaml` is the Zabbix community template
`Network_Devices/OPNsense/template_opnsense_by_http_json/7.4` with the parts of
`../opnsense-by-http-api.yaml` added that it does not already cover.

Template name, template UUID and the vendor block are unchanged, so importing this file
updates an existing `OPNsense by HTTP-JSON` instead of creating a second template. Everything
added carries fresh UUIDs, so the original `OPNsense by HTTP API` template can stay imported
next to it.

Of the community part, every item, discovery rule, trigger and macro is untouched byte for
byte. Two things are deliberately not: four URLs are corrected and the dashboard is rebuilt,
both documented below and both enforced by `check.py`, which fails if anything else changes.

Pinned upstream copy: `upstream-7.4.yaml`, blob `b5303cdd47311eb2463a9cf4183e1b09f1e9ab4e`.

## Rebuilding

```sh
python3 merged/build.py    # splices the additions into the pinned upstream copy
python3 merged/check.py    # proves nothing else changed and validates the result
```

`check.py` diffs the result against the pinned copy up to the dashboard block and fails if
any upstream line there was deleted or changed rather than only inserted, apart from the four
declared corrections. It re-applies the correction list itself, so a fifth one cannot slip in.
For the rebuilt dashboard it checks that the uuid and name still match upstream and reports
which of the old widget sources are not reused verbatim. It also verifies UUIDs, master item
links, calculated formulas, trigger expressions, macro definitions, value map references and
that every dashboard widget points at an item that exists.

To pick up a new upstream release, replace `upstream-7.4.yaml` and run both scripts again.

`build.py --upstream` additionally writes `upstream-pr/template_opnsense_by_http_json.yaml`,
the same result with the vendor version bumped to `0.31`, for a pull request against
`zabbix/community-templates`. `upstream-pr/PR.md` has the steps and the commit message.

`verify_live.py` queries a real firewall with the monitoring API key and replays every added
preprocessing chain, including the JavaScript steps:

```sh
OPNS_KEY=... OPNS_SECRET=... python3 merged/verify_live.py --host 192.168.10.254
```

## Corrections to the community template

Four URLs are corrected. They are the only upstream lines this build changes, they are
declared in one list in `build.py`, and `check.py` fails if that list grows silently.

| Item | Was | Now | Why |
|------|-----|-----|-----|
| `opns.raw.fw.states` | `diagnostics/firewall/pfStates` | `diagnostics/firewall/pf_states` | HTTP 403 for every non administrator key |
| `opns.raw.memory.status` | `diagnostics/system/systemResources` | `diagnostics/system/system_resources` | same |
| `opns.ipsec.phase1.raw` | `https://{HOST.IP}/api/...` | `https://{HOST.IP}:{$OPNS.PORT}/api/...` | pinned to 443, ignoring the port macro |
| `opns.ipsec.phase2.raw` | `https://{HOST.IP}/api/...` | `https://{HOST.IP}:{$OPNS.PORT}/api/...` | same |

The first two are the interesting ones. OPNsense routes both spellings to the same
controller action (`Router.php` builds the action name with
`lcfirst(str_replace('_', '', ucwords($element, '_')))`), so an administrator key never sees
a problem. The privilege patterns, however, are `api/diagnostics/firewall/pf_states` and
`api/diagnostics/system/system_resources`, both exact rather than wildcards, and `ACL.php`
matches them with `preg_match` without the `i` modifier. A monitoring user with the
Lobby: Dashboard privilege therefore gets HTTP 403 on the camelCase spelling, which takes
out the firewall state items, the state table utilization and all memory items.

## What was added

67 items (14 of them HTTP agent masters), 5 discovery rules with 8 item prototypes,
23 triggers, 4 trigger prototypes, 1 graph prototype, 12 macros and 4 value maps.

| Area | Endpoint |
|------|----------|
| Processor utilization, split into user, system and interrupt | `diagnostics/activity/get_activity` |
| Core count, and load per core derived from it | `diagnostics/cpu_usage/getCPUType` |
| pf table entries against the configured ceiling | `firewall/alias/get_table_size` |
| Clock synchronization, offset, stratum, reachable peers | `ntpd/service/status` |
| Kernel network memory, mbuf clusters and denied requests | `diagnostics/interface/get_memory_statistics` |
| netisr queue drops, total and per protocol | `diagnostics/interface/get_netisr_statistics` |
| IP and TCP protocol error rates | `diagnostics/interface/get_protocol_statistics` |
| Ruleset size, fingerprint, evaluation rate, unmatched rules | `diagnostics/firewall/pf_statistics/rules` |
| pf counters, state table rates, source nodes, SYN floods | `diagnostics/firewall/pf_statistics/info` |
| pf source node limit | `diagnostics/firewall/pf_statistics/memory` |
| Service run state, discovered | `core/service/search` |
| Swap per device, discovered | `diagnostics/system/system_swap` |
| Temperature per sensor, discovered | `diagnostics/system/system_temperature` |
| Inbound errors and link state per interface, discovered | `diagnostics/interface/get_interface_statistics` |

Seven more items ride along on masters the community template already polls, so they cost no
extra request: the configuration change timestamp and load average over 5 and 15 minutes from
`opns.raw.load`, the blocked share of the firewall log from `opns.raw.fw.action`, the CARP
demotion factor and maintenance mode from `opns.raw.interfaces.carp`, and the OPNsense version
from `opns.raw.product.info`.

Interface inbound errors and link state come with their own discovery rule rather than as
extra prototypes on the community interface discovery, because that rule stays untouched.
Both rules discover the same interfaces, but no metric exists twice.

Left out because the community template already covers it: memory, uptime, filesystems,
gateways, interface traffic and counters, per interface pf block counters, CARP status per
address, IPsec, WireGuard, pf state table current and limit, and pending updates.

## Dashboard

The `OPNsense Info` dashboard is rebuilt, keeping its uuid and name so an import updates it
rather than adding a second one. Three defects made that worth doing:

- the CPU load widget sets `Show=5`, which Zabbix 7.0 refuses outright with
  `Invalid parameter "Show/5": value must be one of 1, 2, 3, 4`
- both pie charts plot a total against a part of that same total, so "used" is drawn as a
  slice of "total plus used" and always looks about half its real size
- the pages use 41, 45 and 55 of the 72 grid columns, so everything sits in the left two
  thirds, and `Gateway RTT*` also matches `Gateway RTTd`, mixing round trip time into one
  graph with its own standard deviation

Everything the old pages showed is still shown. The two pie charts are replaced by the
utilization gauges that state the same fact correctly, and the page name typo `Inerfaces`
is gone. The UPS, WireGuard and IPsec items that ship with the template but appeared on no
page now have one.

| Page | Shows |
|------|-------|
| Overview | Memory, state table, processor and load per core as gauges, six tiles from CPU load to state limit, firewall actions over time, CARP status, and all filesystems as a honeycomb |
| Packet filter | State table, source tracking and pf table utilization, twelve tiles from states in use to source limit hits, state table churn and searches, rule matches against evaluations, drops and limit hits, malformed packets |
| Interfaces | Link state per interface, traffic, blocked and passed bytes side by side, and inbound errors, output errors, queue drops and collisions in one graph |
| Gateways | Status honeycomb, round trip time and packet loss side by side, deviation below |
| VPN | WireGuard peers and instances, peer traffic, IPsec phase 1 tunnels and phase 2 traffic |
| System | Processor, memory and load per core, uptime, version, cores, configuration change timestamp, both load averages, processor utilization split into user, system and interrupt, load average over time, temperature and swap honeycombs |
| Kernel and protocols | mbuf utilization, clusters in use, denied requests, netisr drops, kernel network memory and netisr drops per protocol, IP and TCP error rates |
| Services, clock and power | Every service as a honeycomb, clock synchronization, offset, stratum and reachable peers, CARP demotion and maintenance, UPS battery, status, load and runtime, clock offset and UPS voltage over time |

Layout, colours and thresholds live in `dashboard.py`. The grid is 72 columns wide. Every
widget type and field name used there already occurs in a dashboard that imports into a
running Zabbix 7.0, so none of it is guessed, and `check.py` resolves all 110 item
references before the file is ever imported.

## Privileges on the OPNsense monitoring user

Measured against a live OPNsense 26.7 with a restricted key, not read off the documentation.

The added endpoints need these on top of what the community template already required. Only
the last one grants more than reading, and without it the service discovery simply stays
empty:

| Privilege in the GUI | Internal ID | Needed for | Read only |
|----------------------|-------------|------------|-----------|
| Lobby: Dashboard | `page-system-login-logout` | swap, temperature, core count, load average, configuration change timestamp | yes |
| Diagnostics: Netstat | `page-diagnostics-netstat` | interface errors and link state, mbuf pool, netisr queues, protocol errors | yes |
| Diagnostics: Firewall statistics | `page-diagnostics-pf-info` | pf counters, source tracking, ruleset | yes |
| Diagnostics: System Activity | `page-diagnostics-system-activity` | processor utilization | yes |
| Status: NTP | `page-status-ntp` | clock synchronization | yes |
| Diagnostics: Logs: Firewall: Summary View | `page-diagnostics-logs-firewall-summary` | blocked share of the firewall log | yes |
| Firewall: Aliases | `page-firewall-aliases` | pf table entry usage, also exposes every alias content | yes |
| Status: Services | `page-status-services` | service run state | **no**, permits starting and stopping services |

Two more are needed by items the community template already had, and are easy to miss
because the symptom is an HTTP 403 on a raw item rather than on the item you are looking at:

| Privilege in the GUI | Internal ID | Without it |
|----------------------|-------------|------------|
| System: Firmware | `page-system-firmware-manualupdate` | the five firmware update items, the business license item and the OPNsense version stay unsupported. Its pattern is `api/core/firmware/*`, which also covers reboot, poweroff, install and remove, so this one is **not** read only |
| Reporting: Traffic | `page-status-trafficgraph` | the whole community interface discovery stays empty, so no traffic, no counters, no per interface pf block counters. Read only |

The version item is fed from `core/firmware/info` rather than `system_information`, so it
needs System: Firmware. If you would rather not grant that privilege, source the version and
the pending update indicator from `diagnostics/system/system_information` instead, which
Lobby: Dashboard covers; both items exist in `../opnsense-by-http-api.yaml`.

## Added macros

All of them are thresholds with usable defaults, none has to be set.

| Macro | Default | Purpose |
|-------|---------|---------|
| `{$OPNS.CPU.UTIL.WARN}` | 85 | Processor utilization counting as high, over ten minutes |
| `{$OPNS.LOAD.AVG5.WARN}` | 4 | Absolute five minute load average counting as high |
| `{$OPNS.LOAD.PERCORE.WARN}` | 1 | Load per core counting as high, 1 means the cores are saturated |
| `{$OPNS.MBUF.UTIL.WARN}` | 80 | Share of the mbuf cluster limit counting as filling up |
| `{$OPNS.NTP.OFFSET.WARN}` | 100 | Clock offset in milliseconds counting as high |
| `{$OPNS.PF.SRCNODES.UTIL.CRIT}` | 90 | Source tracking table fill level counting as critical |
| `{$OPNS.PF.TABLES.UTIL.WARN}` | 80 | Share of the pf table entry budget counting as filling up |
| `{$OPNS.SWAP.UTIL.WARN}` | 5 | Swap in use counting as a problem, per device via context |
| `{$OPNS.TEMP.CRIT}` | 80 | Sensor temperature in degrees Celsius, per sensor via context |
| `{$OPNS.IF.CONTROL}` | 1 | Set to 0, per interface via context, to silence the down trigger |
| `{$OPNS.IF.NAME.NOT_MATCHES}` | `^(pflog\|pfsync\|enc\|lo)\d*$` | Interfaces excluded from the added discovery |
| `{$OPNS.SERVICE.ID.NOT_MATCHES}` | `^$` | Services excluded from discovery, excludes nothing by default |
