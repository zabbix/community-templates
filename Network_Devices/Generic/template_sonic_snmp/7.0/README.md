# Zabbix Template SONiC by SNMP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This template monitors switches running **SONiC** (Software for Open Networking in the Cloud) via SNMP. It was built for and tested against a Dell PowerSwitch (HwSku `DellEMC-S5232f-C32`) running **Dell Enterprise SONiC Distribution 4.6.0 (Standard)**, but only uses vendor-neutral MIBs from the upstream [sonic-snmpagent](https://github.com/sonic-net/sonic-snmpagent) project, so it should apply to SONiC on other switch platforms too.

## Why this template is thin

SONiC's control plane is Debian Linux running net-snmp. It does **not** implement Dell's legacy Force10 chassis MIB (`F10-S-SERIES-CHASSIS-MIB`, used by the official [Dell Force S-Series by SNMP](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/net/dell_force_s_series_snmp) template) or Dell OS10's proprietary chassis MIB (`DELLEMC-OS10-CHASSIS-MIB`, used by [Dell SmartFabric OS10 by SNMP](../../Dell/template_smartfabric_os10_snmp) in this repo). If you're migrating a switch from FTOS/Dell Networking OS or SmartFabric OS10 to SONiC, replace those templates with this one rather than trying to reuse them - their chassis/CPU/fan/PSU OIDs will not resolve.

Instead of reimplementing host, interface and filesystem monitoring, **this template links to the official "Linux by SNMP" template** and only adds what that template doesn't cover: physical chassis sensors via the standards-based `ENTITY-MIB`/`ENTITY-SENSOR-MIB`. Attaching just "SONiC by SNMP" to a host also pulls in everything from "Linux by SNMP" automatically (interfaces, CPU, memory, filesystems, ICMP checks, etc.) via Zabbix's template linking.

## Requirements

- **Zabbix Server** version 7.4 or higher
- **SNMP Agent** module enabled on the Zabbix server
- The official **"Linux by SNMP"** template already imported (ships with Zabbix; source: [templates/os/linux_snmp_snmp](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/os/linux_snmp_snmp) in zabbix/zabbix). Import it first if it isn't already in your instance - this template links to it by name and does not duplicate its items.

## 1. Enable SNMP on the switch

Dell SONiC supports SNMP v2c and v3 for GET requests only (no SET). Example v2c config:

```
sonic(config)# snmp-server community <community-string> ro
sonic(config)# snmp-server contact user@example.com
sonic(config)# snmp-server location "Network rack"
```

See Dell's [How to configure SNMP v2c on Dell Networking SONiC](https://www.dell.com/support/kbdoc/en-us/000222508/dell-networking-sonic-how-to-configure-snmp-v2c) for the full procedure and v3 setup.

## Installation

1. Import the official **"Linux by SNMP"** template first if you don't already have it.
2. Download `template_sonic_snmp.yaml` from this directory and import it (**Data collection → Templates → Import**).
3. Create or select a host, assign the **SONiC by SNMP** template, and add an SNMP interface with your community string/credentials.
4. Review the macros below and adjust for your platform/build.

## Contents of the template

### Discovery rules

| Item/Discovery Rule  | Description                                                        | Source |
|-----------------------|---------------------------------------------------------------------|--------|
| `sonic.sensor.raw`          | Plain item (not a discovery rule) - one combined `walk[]` of `entPhySensorType`/`Scale`/`Precision`/`Value` and `entPhysicalDescr`. Master item for both rules below; not meant to be looked at directly (history disabled). | This template |
| `sonic.sensor.discovery`    | Port-associated sensors (DOM temperature/power/bias/voltage) via `entPhySensorTable` - tagged with `interface`, and limited to the lanes the port's actual transceiver supports (see below) | This template |
| `sonic.sensor.chassis.discovery` | Everything else (CPU/ASIC/system temperature, PSU, fan tachometers) - same table and item/trigger shape as `sonic.sensor.discovery`, just without the `interface` tag or lane limiting | This template |
| `net.if.discovery`, `cpu.discovery[snmp]`, `vfs.fs.discovery[snmp]`, `vfs.dev.discovery[snmp]`, `net.if.duplex.discovery` | Interfaces, per-core CPU, filesystems, block devices, duplex | Linked "Linux by SNMP" |

Both discovery rules are `DEPENDENT` items with `sonic.sensor.raw` as their master item, parsing its raw walk text themselves (regex, in JavaScript) rather than using Zabbix's `discovery[]` OID helper. This is needed for the lane-limiting below - `discovery[]` can only look up columns at the *same* index it's walking, and the transceiver-type descriptor lives at a different one - but it also sidesteps the `filter:` error described further down, and means both rules see the exact same data (parsed independently, since JS preprocessing can't share results between items) and split purely on whether `{#SENSOR_IFNAME}` came out empty.

### Per-port lane limiting

A single-lane SFP/SFP28 port gets the same 4 lane-slots in `entPhySensorTable` as a 4-lane QSFP port - without this, `Eth1/34` (SFP) would discover phantom `Eth1/34/2`, `/3`, `/4` DOM power/bias items that permanently read `unavailable(2)`/`0`, alongside the one real lane. `sonic.sensor.discovery`'s preprocessing also parses `entPhysicalDescr`'s transceiver-type entries (e.g. `"SFP for Eth1/34"`, `"QSFP28 for Eth1/1"`) from the same raw walk and skips discovering any lane beyond what that port's form factor supports:

| Form factor | Lanes |
|---|---|
| `SFP`, `SFP+`, `SFP28`, `SFP56` | 1 |
| `SFP-DD` | 2 |
| `QSFP`, `QSFP+`, `QSFP28`, `QSFP56` | 4 |
| `QSFP-DD`, `OSFP` | 8 |

A port whose transceiver-type entry isn't found at all (unrecognized form factor, or no transceiver present) is left unrestricted rather than risk hiding real data.

Confirmed against a real switch for the `SFP`/`QSFP28` rows: `Eth1/34` (SFP, actually fiber not copper) went from discovering 4 lanes' worth of RX/TX power and TX bias (3 real, 9 permanently phantom) down to exactly the 1 real lane, while `Eth1/1` (QSFP28, 4 real lanes) was unaffected. The `SFP-DD`/`QSFP-DD`/`OSFP` rows are correct per spec (OSFP is "Octal" - 8 lanes, not a QSFP variant despite the similar name) but exercised only with synthetic `entPhysicalDescr` text, not seen on real hardware - if your build phrases these differently than `"<TYPE> for <ifname>"`, they won't match and that port's lanes are left unrestricted (same as today) rather than break.

### Trigger prototypes added by this template

- Sensor reports non-operational / unavailable status (`entPhySensorOperStatus`)
- Sensor temperature warning/critical (only fires for `entPhySensorType=8`, i.e. Celsius sensors)

### Why some entPhysicalTable entries never turn into items

`entPhysicalTable` includes pure container/aggregate entries - the chassis itself, each fan tray, each individual fan (as opposed to its tachometer), the PSU as a whole, the management port container - that have neither an `entPhySensorType` nor an `entPhySensorValue`. Both discovery rules' JavaScript preprocessing only emits a row when both parse as real numbers from the raw walk, so these never turn into items in the first place. Confirmed against a real walk: 445 physical entities, 398 with an actual sensor row, 47 without (chassis/fan-tray/fan/PSU/MGMT containers) - without this, that's 47 x 2 items = 94 permanently "Not supported".

This (and the lane limiting above) is done in JavaScript rather than a discovery-rule `filter:` block on purpose: Zabbix's filter mechanism throws `Cannot evaluate expression: ... no value received for macro "{#SENSOR_TYPE}"` if that macro has no value at all for some row, rather than treating it as an empty string that fails a regex match - and `entPhySensorType` is not reliably present for every row these rules would otherwise walk. If you're adapting this template and see that same error, check for a `filter:` referencing a macro that isn't guaranteed on every discovered row and move the check into preprocessing instead.

### Sensor naming and filtering in Latest data

Sensor item names are derived, not a literal copy of `entPhysicalDescr` - e.g. `CPU On-board: Temperature` (not `CPU On-board: Value`), `Eth1/1/1 DOM RX Power` (not `DOM RX Power Sensor for Eth1/1/1: Power`), `FAN 1: Fan speed` (not `Tachometers for FAN 1: Value` - Dell's agent reports fan tachometers as `entPhySensorType=unknown(2)` rather than `rpm(10)`, so the kind is overridden by name for these). Each item is also tagged for drill-down instead of leaving you to scroll one flat list of ~400 names:

| Tag | Value | Purpose |
|---|---|---|
| `component` | `cpu`, `asic`, `psu`, `fan`, `network`, or `chassis` (fallback: system-level ambient/airflow sensors with no more specific match) - classified from the description | Same tag name the linked "Linux by SNMP" template uses (`component: cpu`, `component: memory`, etc.), so filtering **Latest data** by `component: cpu` shows CPU utilization *and* CPU On-board temperature together. Classification order matters for edge cases: a PSU's own internal fan ("Tachometers for PSU 1 FAN 1") is `psu`, not `fan`. |
| `interface` | e.g. `Eth1/1` - present only on items from `sonic.sensor.discovery`; `sonic.sensor.chassis.discovery`'s items have no `interface` tag at all | Same tag name the linked "Linux by SNMP" template uses for its own interface items, so filtering **Latest data** by `interface: Eth1/1` shows that port's traffic counters *and* its DOM sensors together. For breakout-port lanes (`Eth1/1/1`..`Eth1/1/4`, one per optical lane) this is truncated to the parent port so it still matches; the lane number is kept in the item name instead. |
| `measurement` | `Temperature`, `Power`, `Current`, `DC voltage`, `Fan speed`, `Airflow`, `Humidity`, `Frequency`, `State` - derived from `entPhySensorType` (with the tachometer override above) | Filter to one kind of reading across every interface/sensor |

DOM Power/Current readings (RX/TX optical power, TX bias) are displayed in **mW/mA**, not W/A - `sonic.sensor.discovery`'s items scale the RFC 3433-normalized SI value by another 1000x and use `mW`/`mA` as the unit, since raw watts/amps for these is a small fraction (e.g. `0.0005 W`) and unreadable. This only applies to `sonic.sensor.discovery` (port-associated sensors); `sonic.sensor.chassis.discovery`'s PSU voltage/current/power readings stay in V/A/W since those are legitimately whole units.
| `sensor` | The description with the trailing `for <id>` stripped, e.g. `DOM RX Power` instead of `DOM RX Power Sensor for Eth1/1/1`. All PSU sub-sensors (`PSU1 Airflow`, `Temperature for PSU 1`, `Tachometers for PSU 1 FAN 1`) further collapse to a single `PSU 1` - the item name keeps the full detail, only this tag merges. | Collapses what would otherwise be dozens of near-identical tag values (one per port/lane), or several unrelated-looking ones per PSU, into one |

To go from "the interface" to "its DOM sensors" in the UI: filter Latest data by the `interface` tag first, then narrow further with the `measurement` or `sensor` tag.

### No swap on SONiC

SONiC switches run off flash storage with no swap partition (and swap is generally avoided on flash to limit wear). The linked "Linux by SNMP" template's `system.swap.free`/`system.swap.total` items will just read 0, and `system.swap.pfree[snmp]` (a calculated `free/total*100`) will show "Not supported" from the division by zero. Its "High swap space usage" trigger already guards on `total>0`, so no action is needed there - but if you want the idle items gone rather than just quiet, disable them at the host level: **Data collection → Hosts → [host] → Items**, filter for `swap`, select the three items, **Disable**. For multiple SONiC hosts, use **Mass update** across them instead of repeating this per host.

## Macros

| Macro | Default | Notes |
|---|---|---|
| `{$SENSOR.DOM.IGNORE}` | 0 | Set to 1 with an interface context to silence "is unavailable" for that port's DOM sensors - see below |
| `{$SENSOR.TEMP.CRIT}` | 65 | Only applies to Celsius-type sensors |
| `{$SENSOR.TEMP.WARN}` | 55 | Only applies to Celsius-type sensors |
| `{$VFS.FS.FSNAME.NOT_MATCHES}` | `^(/dev\|/sys\|/run\|/proc\|/etc\|/host\|/tmp\|/var/tmp\|.+/shm$)` | Overrides the "Linux by SNMP" default - see caveats below |

All macros from the linked "Linux by SNMP" template (CPU/memory/swap thresholds, interface filters, etc.) apply as-is; override them at the host level as needed.

### Permanently "unavailable" DOM lanes on single-lane ports

`entPhySensorOperStatus=unavailable(2)` fires the "is unavailable" trigger, but it commonly doesn't mean anything is wrong - `nonoperational(3)` ("is non-operational") is the one that actually indicates a fault and is unaffected by any of this. Two confirmed-benign causes:

- **Form factor, not media type.** A single-lane SFP/SFP28 port still gets 4 lane-slots allocated in `entPhySensorTable`, the same as a 4-lane QSFP port - lanes 2-4 permanently read `unavailable` regardless of what's plugged in, fiber or copper. Confirmed against a real switch: a QSFP28 port had all 4 lanes reading `ok(1)`, while an SFP port had lane 1 `ok(1)` and lanes 2-4 `unavailable(2)`.
- **Non-optical transceivers** (e.g. an SFP-to-RJ45 copper module) have no laser or photodiode, so RX/TX power and TX bias will permanently read `unavailable` on every lane.

You can tell which transceiver type a port has directly from SNMP - `entPhysicalDescr` includes an entry literally named e.g. `"QSFP28 for Eth1/1"` or `"SFP for Eth1/34"` (not currently surfaced as a template item, but visible in a walk with `ENTITY-MIB` loaded).

To silence either case for a specific port, set a host-level macro with the **parent port** (not a lane) as context, e.g. `{$SENSOR.DOM.IGNORE:"Eth1/34"}` = `1` - this covers all of that port's lanes at once, since they share the same interface tag. This only suppresses the unavailable-status trigger for that port's DOM sensors; the items keep polling and reporting normally, and non-operational still alerts.

## Known caveats

These were determined from a full `snmpwalk` of the mib-2 subtree (`.1.3.6.1.2.1`) against a real Dell PowerSwitch S5232F-ON running Enterprise SONiC 4.6.0 Standard. Your platform/build may differ - please validate and open an issue/PR with findings.

- **`ENTITY-MIB`/`ENTITY-SENSOR-MIB` are confirmed POPULATED** - 445 physical entities and ~398 sensors: CPU/ASIC on-board temperature, 3x system airflow temperature, inlet airflow, 2x PSU temperature + PSU voltage/current/power rails, 4 fan trays (2 fans each) with tachometers, and per-port transceiver DOM temperature for every front-panel port. `sonic.sensor.discovery` should populate well out of the box on this platform/build. Note: if you check this yourself with `snmpwalk -m ALL`, make sure `ENTITY-MIB` and `ENTITY-SENSOR-MIB` are actually present in your local MIB directory - without them, net-snmp silently falls back to rendering these OIDs as generic `mib-2.47.../mib-2.99...` instead of symbolic `ENTITY-MIB::.../ENTITY-SENSOR-MIB::...` names, which is easy to miss if you're grepping by MIB name (as happened while building this template).
- **SNMP traps for temperature are not implemented here.** Dell's SONiC release notes (reportedly 4.5.3/4.6.0) also mention temperature exposed via traps; this template only polls. Since polling is confirmed to work well, traps would be a complementary push-based path rather than a required one - worth adding if you want threshold-crossing notifications without waiting for the next poll, but it needs the specific trap OID/varbind layout (from the release notes or a captured trap) plus a configured trap receiver, neither of which this template assumes.
- **UCD-SNMP-MIB is unverified.** "Linux by SNMP"'s memory/swap/interrupt items use UCD-SNMP-MIB (private enterprises branch `1.3.6.1.4.1.2021`), which a default-scope `snmpwalk` (no OID argument) never reaches - so its presence on SONiC could not be confirmed or denied from this data. Its `HOST-RESOURCES-MIB`-based items (per-core CPU via `hrProcessorTable`, filesystem discovery via `hrStorageTable`, `hrSystemUptime`) **were** confirmed populated with real data, so CPU discovery and uptime should work regardless.
- **No real disk/partition shows up in `hrStorageTable`** on the tested build - only memory pools (physical/virtual/buffers/cached/shared/swap/available) and a long list of Docker bind-mount pseudo-filesystems (`/etc/hosts`, `/etc/resolv.conf`, `/etc/hostname`, `/host/reboot-cause`, `/tmp`, `/var/tmp`, `/run/redis*`, `/proc/*`, etc.). The `{$VFS.FS.FSNAME.NOT_MATCHES}` override above filters the confirmed noise; if your build reports an actual data partition, it should still be discovered since only the listed prefixes are excluded.
- `sysObjectID` reports Dell's enterprise OID (`1.3.6.1.4.1.674...`) regardless of which NOS is running - this identifies the hardware product, not the agent software, so don't use it to infer MIB support.

## Related templates

- [Dell Force S-Series by SNMP](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/net/dell_force_s_series_snmp) - for switches running FTOS/Dell Networking OS (not SONiC)
- [Dell SmartFabric OS10 by SNMP](../../Dell/template_smartfabric_os10_snmp) - for the same Dell "-ON" hardware running SmartFabric OS10 instead of SONiC
- [Official Zabbix Templates](https://www.zabbix.com/integrations)

## License

This project is licensed under the MIT License.

## Disclaimer

This template is provided as-is and was validated against a single platform/build. Test thoroughly in your environment before production use.
