# OPNsense by REST API

Zabbix template that monitors an OPNsense firewall over its own REST API. No SNMP, no Zabbix
agent on the firewall, one API key with read privileges.

Import into **Zabbix 7.0 or later**. The export declares format 7.0, which every later
release accepts.

Everything in here was measured against a live OPNsense 26.7 with a restricted monitoring
key, not read off the documentation. Where the API turned out to behave differently than
expected, that is written down in [Notes](#notes) rather than smoothed over.

## Contents

- [What it monitors](#what-it-monitors)
- [Setup](#setup)
- [Privileges](#privileges)
- [Macros](#macros)
- [Discovery](#discovery)
- [Triggers](#triggers)
- [Dashboard](#dashboard)
- [Notes](#notes)
- [License](#license)

## What it monitors

107 items, 14 discovery rules with 70 item prototypes, 52 triggers, 36 macros and a dashboard
with 8 pages.

| Area | Source endpoint |
|------|-----------------|
| Processor utilisation, split into user, system and interrupt | `diagnostics/activity/get_activity` |
| Core count, load average over 1, 5 and 15 minutes, load per core | `diagnostics/cpu_usage/get_c_p_u_type`, `diagnostics/system/system_time` |
| Memory, swap per device, filesystems | `diagnostics/system/system_resources`, `system_swap`, `system_disk` |
| Temperature per sensor | `diagnostics/system/system_temperature` |
| Kernel network memory, mbuf clusters, denied requests | `diagnostics/interface/get_memory_statistics` |
| netisr queue drops, total and per protocol | `diagnostics/interface/get_netisr_statistics` |
| IP and TCP protocol error rates | `diagnostics/interface/get_protocol_statistics` |
| Interface traffic, errors, link state, per interface blocks | `diagnostics/traffic/_interface`, `diagnostics/firewall/pf_statistics/interfaces` |
| pf state table and source tracking, with their limits | `diagnostics/firewall/pf_states`, `pf_statistics/info`, `pf_statistics/memory` |
| pf counters, SYN floods, malformed packets | `diagnostics/firewall/pf_statistics/info` |
| Ruleset size, fingerprint, evaluation rate, unmatched rules | `diagnostics/firewall/pf_statistics/rules` |
| pf table entries against the configured ceiling | `firewall/alias/get_table_size` |
| Blocked share of the firewall log | `diagnostics/firewall/stats?group_by=action` |
| Gateways, address, status, round trip time, loss, deviation | `routes/gateway/status` |
| CARP status per address, demotion factor, maintenance mode | `diagnostics/interface/get_vip_status` |
| IPsec phase 1 and phase 2, per connection | `ipsec/sessions/searchPhase1`, `search_phase2` |
| WireGuard instances and peers | `wireguard/service/show` |
| OpenVPN instances and clients | `openvpn/service/search_sessions` |
| Services, discovered and checked | `core/service/search` |
| Clock synchronisation, offset, stratum, reachable peers | `ntpd/service/status` |
| Firmware state, pending updates, business license, version | `core/firmware/status`, `core/firmware/info` |
| Configuration change timestamp, uptime | `diagnostics/system/system_time` |
| UPS, battery, load, runtime, voltage | `nut/diagnostics/upsstatus` |

## Setup

### 1. Create the API key

In the OPNsense GUI under **System, Access, Users**, create a user without a login shell, for
example `zabbix`, give it the privileges from the next section, then add an API key. The
download contains the key and the secret.

### 2. Import the template

**Data collection, Templates, Import**, then select `template_opnsense_by_rest_api.yaml`.

### 3. Create the host

Create a host with an agent interface carrying the firewall address, link the template, and
set the three connection macros:

| Macro | Value |
|-------|-------|
| `{$OPNS.KEY}` | the API key |
| `{$OPNS.SECRET}` | the API secret |
| `{$OPNS.PORT}` | the HTTPS port of the web interface, default 443 |

The items address the firewall through `{HOST.IP}`, so the interface address is what counts,
not the DNS name.

## Privileges

Measured with a restricted key, not taken from the documentation. Ten privileges are needed,
eight of them read only.

| Privilege in the GUI | Internal ID | Needed for | Read only |
|----------------------|-------------|------------|-----------|
| Lobby: Dashboard | `page-system-login-logout` | system resources, time, disks, swap, temperature, core count, pf states | yes |
| Diagnostics: Netstat | `page-diagnostics-netstat` | interface statistics, mbuf pool, netisr queues, protocol errors | yes |
| Diagnostics: Firewall statistics | `page-diagnostics-pf-info` | pf counters, source tracking, ruleset | yes |
| Diagnostics: System Activity | `page-diagnostics-system-activity` | processor utilisation | yes |
| Status: NTP | `page-status-ntp` | clock synchronisation | yes |
| Diagnostics: Logs: Firewall: Summary View | `page-diagnostics-logs-firewall-summary` | blocked share of the firewall log | yes |
| Firewall: Aliases | `page-firewall-aliases` | pf table entry usage, also exposes every alias content | yes |
| Reporting: Traffic | `page-status-trafficgraph` | interface discovery, traffic and counters | yes |
| Status: Services | `page-status-services` | service run state | **no**, also permits starting and stopping services |
| System: Firmware | `page-system-firmware-manualupdate` | firmware state, pending updates, business license, version | **no**, its pattern `api/core/firmware/*` also covers reboot, poweroff, install and remove |

Two of them grant more than reading. Without **Status: Services** the service discovery stays
empty and nothing else breaks. Without **System: Firmware** the five firmware items, the
license item and the version item stay unsupported; the version is also available from
`diagnostics/system/system_information`, which Lobby: Dashboard already covers.

`page-nut` is needed only if a UPS is monitored. It comes with the NUT plugin and covers
`api/nut/*`. Without it the UPS master returns HTTP 403 even with the item enabled.

## Macros

### Connection

| Macro | Default | Purpose |
|-------|---------|---------|
| `{$OPNS.KEY}` | empty | API key |
| `{$OPNS.SECRET}` | empty | API secret |
| `{$OPNS.PORT}` | `443` | HTTPS port of the web interface |

### Thresholds

| Macro | Default | Purpose |
|-------|---------|---------|
| `{$OPNS.CPU.UTIL.WARN}` | `85` | Processor utilisation counting as high, averaged over ten minutes |
| `{$OPNS.CPU.LOAD.MAX}` | `2` | Load average counting as high |
| `{$OPNS.LOAD.AVG5.WARN}` | `4` | Absolute five minute load average counting as high |
| `{$OPNS.LOAD.PERCORE.WARN}` | `1` | Five minute load per core, 1 means the cores are exactly saturated |
| `{$OPNS.MEMORY.UTIL.MAX}` | `90` | Memory utilisation counting as high |
| `{$OPNS.MBUF.UTIL.WARN}` | `80` | Share of the mbuf cluster limit counting as filling up |
| `{$OPNS.SWAP.UTIL.WARN}` | `5` | Swap in use counting as a problem. A firewall should not swap at all, so this is deliberately low. Per device through macro context |
| `{$OPNS.TEMP.CRIT}` | `80` | Sensor temperature in degrees Celsius. Per sensor through context, for example `{$OPNS.TEMP.CRIT:"dev.cpu.0.temperature"}` |
| `{$OPNS.FS.PUSED.MAX.WARN}` | `90` | Filesystem utilisation, warning |
| `{$OPNS.FS.PUSED.MAX.CRIT}` | `95` | Filesystem utilisation, critical |
| `{$OPNS.STATE.TABLE.UTIL.MAX}` | `90` | pf state table fill level counting as high |
| `{$OPNS.PF.SRCNODES.UTIL.CRIT}` | `90` | Source tracking table fill level counting as critical |
| `{$OPNS.PF.TABLES.UTIL.WARN}` | `80` | Share of the pf table entry budget counting as filling up. Relevant with block lists or GeoIP aliases |
| `{$OPNS.GW.MIN.PACKET.LOSS}` | `10` | Gateway packet loss counting as a problem |
| `{$OPNS.GW.HIGH.PACKET.LOSS}` | `50` | Gateway packet loss counting as severe |
| `{$OPNS.NTP.OFFSET.WARN}` | `100` | Clock offset in milliseconds. Generous for a LAN time source and still far below what breaks Kerberos or IPsec |
| `{$OPNS.LICENSE.EXPIRY.WARN}` | `30` | Days before the business license expires |
| `{$OPNS.NUT.BAT.LOW}` | `30` | UPS battery charge counting as low |
| `{$OPNS.NUT.BAT.RUNTIME}` | `600` | Remaining UPS runtime in seconds |
| `{$OPNS.NUT.HIGH.LOAD}` | `80` | UPS load counting as high |

### Discovery filters and switches

| Macro | Default | Purpose |
|-------|---------|---------|
| `{$OPNS.IF.CONTROL}` | `1` | Set to 0, per interface through context, to silence the interface down trigger |
| `{$OPNS.IF.NAME.NOT_MATCHES}` | `^(pflog\|pfsync\|enc\|lo)\d*$` | Interfaces excluded from discovery |
| `{$OPNS.SERVICE.ID.NOT_MATCHES}` | `^$` | Services excluded from discovery, excludes nothing by default |
| `{$OPNS.OPENVPN.ID.NOT_MATCHES}` | `^$` | OpenVPN instances excluded from discovery |
| `{$OPNS.OPENVPN.CONTROL}` | `1` | Set to 0, per instance through context, to silence the OpenVPN down trigger |
| `{$OPNS.WG.INSTANCE.MATCHES}` / `.NOT_MATCHES` | `.+` / `^$` | WireGuard instance discovery filter |
| `{$OPNS.WG.PEER.MATCHES}` / `.NOT_MATCHES` | `.+` / `^$` | WireGuard peer discovery filter |
| `{$OPNS.FS.FSNAME.MATCHES}` / `.NOT_MATCHES` | `.+` / `^(/dev\|/sys\|/run\|/proc\|.+/shm$)` | Filesystem discovery filter by mount point |
| `{$OPNS.FS.FSTYPE.MATCHES}` / `.NOT_MATCHES` | filesystem list / `^\s$` | Filesystem discovery filter by type |

## Discovery

| Rule | Discovers |
|------|-----------|
| Interface Stats Discovery | traffic, errors and per interface pf blocks |
| Network interfaces | link state and inbound errors |
| Gateway Discovery | address, status, round trip time, loss, deviation |
| Interface CARP Discovery | CARP status per virtual address |
| Disk Discovery | filesystems |
| Swap devices | swap per device |
| Temperature sensors | one item per sensor |
| netisr queues | queue drops per protocol |
| Services | run state per service |
| FW Action Discovery | firewall log actions |
| IPsec Phase1 Discovery | tunnels, with phase 2 per connection |
| WireGuard Instance Discovery | instances |
| WireGuard Peer Discovery | peers, traffic and handshake age |
| OpenVPN instances and clients | instances and connected clients |

## Triggers

52 in total: 2 Disaster, 13 High, 11 Average, 18 Warning, 8 Info.

Disaster is reserved for a gateway that is down and for a low UPS battery. High covers the
cases where the firewall is losing packets or a tunnel is gone: denied kernel network memory,
pf dropping packets for lack of memory, the state limit being hit, a filling source tracking
table, a hot sensor, a CARP status change, a dead WireGuard instance or peer, an unconnected
IPsec tunnel, an unreachable API and the UPS running on battery.

Warning is the working range: utilisation and load, clock offset, swap in use, malformed
packets, pf table entries filling up, protocol level errors. Info reports facts rather than
faults: configuration changes, ruleset and rule count changes, a version change, available
firmware updates, a reboot, and a gateway whose monitoring is switched off.

## Dashboard

Eight pages, 84 widgets. The grid is the full 72 columns wide.

| Page | Shows |
|------|-------|
| Overview | memory, state table, processor and load per core as gauges, six tiles, firewall actions over time, CARP status, filesystems as a honeycomb |
| Packet filter | state table, source tracking and pf table utilisation, twelve tiles, state churn and searches, rule matches against evaluations, drops and limit hits, malformed packets |
| Interfaces | link state per interface, traffic, blocked and passed bytes side by side, errors, queue drops and collisions |
| Gateways | status honeycomb, round trip time and packet loss side by side, deviation below |
| VPN | WireGuard peers and instances, peer traffic, IPsec phase 1 tunnels and phase 2 traffic |
| System | processor, memory and load per core, uptime, version, cores, configuration change timestamp, both load averages, utilisation split, temperature and swap honeycombs |
| Kernel and protocols | mbuf utilisation, clusters in use, denied requests, netisr drops per protocol, IP and TCP error rates |
| Services, clock and power | every service as a honeycomb, clock synchronisation, offset, stratum, reachable peers, CARP demotion and maintenance, UPS battery, status, load and runtime |

## Notes

**snake_case in API paths is not always optional.** OPNsense routes `systemResources` and
`system_resources` to the same controller action, so an administrator key never notices a
difference. Some privilege patterns are exact, and `ACL.php` matches them with `preg_match`
without the `i` modifier, so a monitoring key gets HTTP 403 on the camelCase spelling. That
is the case for `diagnostics/system/system_resources` and `diagnostics/firewall/pf_states`.
Other areas carry a wildcard pattern and take either spelling, which is why
`ipsec/sessions/searchPhase1` works and is left as it is. Test privileges with the restricted
key, never with an admin key.

**Gateway monitoring switched off.** A gateway without a monitor address reports a tilde for
round trip time, loss and deviation, and a status of `none` that the API translates to
`Online`. The three items discard the reading in that case and stay empty instead of
substituting a number. While monitoring is off, an outage of that gateway raises nothing,
because the down trigger works on packet loss. That is what the Info trigger is for.

**IPsec phase 2** needs one request per connection. `searchPhase2Action` reads its connection
from `getPost('id')` and returns an empty set for a plain GET, so phase 2 is an HTTP agent
prototype inside the phase 1 rule that posts `id={#IPSECNAME}`. Where the API leaves
`phase1desc` empty, the tunnel name stands in, because the discovery uses that field as the
entity identity and identical keys would collapse into one.

**Physical interface counters** come from `diagnostics/traffic/_interface`, not from
`netstat`, whose counters reset on every read.

**JavaScript is kept to a minimum.** Parsing happens once on the master item, dependent items
read the result with plain JSONPath. A step on a prototype would run per value and per
discovered instance.

**The pf ruleset item** polls every ten minutes on purpose. The response carries the full text
of every rule, and rule changes are not a per minute concern.

## License

MIT, like this repository. The template is derived from `OPNsense by HTTP-JSON` in this same
repository (MIT, Copyright 2021 Zabbix), with the greater part of the current content added on
top. It carries its own name and its own uuids, so both can be linked to the same host and an
import of one does not touch the other.

Maintained at https://github.com/Garfieldttt/opnsense-zabbix-template.
