# Zabbix Template SONiC by SNMP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Monitors switches running **SONiC** (Software for Open Networking in the Cloud) via SNMP. Built and tested against a Dell PowerSwitch (HwSku `DellEMC-S5232f-C32`) running **Dell Enterprise SONiC 4.6.0 (Standard)**, using vendor-neutral MIBs from [sonic-snmpagent](https://github.com/sonic-net/sonic-snmpagent), so it should apply to other SONiC platforms too.

## Why this template is thin

SONiC doesn't implement Dell's legacy Force10 chassis MIB (`F10-S-SERIES-CHASSIS-MIB`, used by [Dell Force S-Series by SNMP](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/net/dell_force_s_series_snmp)) or OS10's proprietary chassis MIB (`DELLEMC-OS10-CHASSIS-MIB`, used by [Dell SmartFabric OS10 by SNMP](../../Dell/template_smartfabric_os10_snmp)). Migrating a switch from FTOS/OS10 to SONiC? Use this template instead - those chassis/CPU/fan/PSU OIDs won't resolve.

Instead of reimplementing host, interface and filesystem monitoring, **this template links to the official "Linux by SNMP" template** and only adds physical chassis sensors via the standards-based `ENTITY-MIB`/`ENTITY-SENSOR-MIB`. Attaching just "SONiC by SNMP" to a host also pulls in everything from "Linux by SNMP" automatically.

## Requirements

- **Zabbix Server** 7.0+
- **SNMP Agent** module enabled on the Zabbix server
- The official **"Linux by SNMP"** template already imported (ships with Zabbix; source: [templates/os/linux_snmp_snmp](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/os/linux_snmp_snmp)) - linked by name, not duplicated.

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

| Item/Discovery Rule | Description | Source |
|---|---|---|
| `sonic.sensor.raw` | Plain item (not a discovery rule) - one combined `walk[]` of `entPhySensorType`/`Scale`/`Precision`/`Value` and `entPhysicalDescr`. Master item for both rules below; not meant to be looked at directly (history disabled). | This template |
| `sonic.sensor.discovery` | Port-associated sensors (DOM temperature/power/bias/voltage), tagged `interface`, limited to the lanes the port's transceiver actually supports (see below) | This template |
| `sonic.sensor.chassis.discovery` | Everything else (CPU/ASIC/system temperature, PSU, fan tachometers) - same shape, no `interface` tag or lane limiting | This template |
| `net.if.discovery`, `cpu.discovery[snmp]`, `vfs.fs.discovery[snmp]`, `vfs.dev.discovery[snmp]`, `net.if.duplex.discovery` | Interfaces, per-core CPU, filesystems, block devices, duplex | Linked "Linux by SNMP" |

Both discovery rules are `DEPENDENT` on `sonic.sensor.raw`, parsing its raw text themselves (JS regex) rather than Zabbix's `discovery[]` OID helper - needed to cross-reference each port's transceiver-type descriptor against sensors that live at a different index, and to avoid the `filter:` error described below.

### Per-port lane limiting

A single-lane SFP/SFP28 port gets the same 4 lane-slots in `entPhySensorTable` as a 4-lane QSFP port. `sonic.sensor.discovery` reads each port's transceiver-type descriptor (e.g. `"SFP for Eth1/34"`, `"QSFP28 for Eth1/1"`) and only discovers the lanes that form factor actually has:

| Form factor | Lanes |
|---|---|
| `SFP`, `SFP+`, `SFP28`, `SFP56` | 1 |
| `SFP-DD` | 2 |
| `QSFP`, `QSFP+`, `QSFP28`, `QSFP56` | 4 |
| `QSFP-DD`, `OSFP` | 8 |

An unrecognized form factor is left unrestricted rather than risk hiding real data.

Confirmed on real hardware: `Eth1/34` (SFP) went from 4 discovered lanes (1 real + 3 permanently phantom) down to exactly 1; `Eth1/1` (QSFP28, 4 real lanes) was unaffected. `SFP-DD`/`QSFP-DD`/`OSFP` are correct per spec but untested on real hardware - if your build phrases these differently than `"<TYPE> for <ifname>"`, that port's lanes are left unrestricted rather than break.

### Trigger prototypes added by this template

- Sensor reports non-operational / unavailable status (`entPhySensorOperStatus`)
- Sensor temperature warning/critical (only fires for `entPhySensorType=8`, i.e. Celsius sensors)

### Why some entPhysicalTable entries never turn into items

`entPhysicalTable` includes pure container/aggregate entries - the chassis itself, each fan tray, each individual fan, the PSU as a whole, the management port container - with neither an `entPhySensorType` nor an `entPhySensorValue`. Both discovery rules only emit a row when both parse as real numbers. Confirmed on real hardware: 445 physical entities, 398 with an actual sensor row, 47 without.

This filtering happens in JavaScript rather than a discovery-rule `filter:` block because Zabbix's `filter:` mechanism hard-errors (`no value received for macro`) if a macro has no value at all for some row, rather than treating it as empty - and `entPhySensorType` isn't reliably present for every walked row.

### Sensor naming and filtering in Latest data

Sensor item names are derived, not a literal copy of `entPhysicalDescr` - e.g. `Eth1/1/1 DOM RX Power` rather than `DOM RX Power Sensor for Eth1/1/1: Power`. Each item is also tagged for drill-down instead of one flat list of ~400 names:

| Tag | Value | Purpose |
|---|---|---|
| `component` | `cpu`, `asic`, `psu`, `fan`, `network`, or `chassis` - classified from the description | Matches "Linux by SNMP"'s own tag vocabulary, so filtering **Latest data** by `component: cpu` shows CPU utilization *and* CPU temperature together |
| `interface` | e.g. `Eth1/1` - port sensors only, truncated to the parent port for breakout lanes | Matches "Linux by SNMP"'s interface tag, so filtering by `interface: Eth1/1` shows that port's traffic counters *and* DOM sensors together |
| `measurement` | `Temperature`, `Power`, `Current`, `DC voltage`, `Fan speed`, `Airflow`, `Humidity`, `Frequency`, `State` | Filter to one kind of reading across every sensor |
| `sensor` | Cleaned label, e.g. `DOM RX Power`; all PSU sub-sensors collapse to a single `PSU 1` | Collapses near-identical values into one filterable tag |

DOM RX/TX power and TX bias are scaled to **mW/mA**, not W/A, for readability - port sensors only; `sonic.sensor.chassis.discovery` never rescales, since any chassis-level electrical readings it discovers would be legitimately whole V/A/W units (though on the tested hardware there are none - see caveats).

### No swap on SONiC

SONiC switches run off flash storage with no swap partition. The linked "Linux by SNMP" template's `system.swap.free`/`system.swap.total` items just read 0, and `system.swap.pfree[snmp]` shows "Not supported" (division by zero) - harmless, its trigger already guards on `total>0`. Disable the three swap items at the host level (**Data collection → Hosts → Items**, or **Mass update** across hosts) if you want them gone rather than just idle.

## Macros

| Macro | Default | Notes |
|---|---|---|
| `{$SENSOR.DOM.IGNORE}` | 0 | Set to 1 with an interface context to silence "is unavailable" for that port's DOM sensors - see below |
| `{$SENSOR.TEMP.CRIT}` | 65 | °C, only applies to Celsius-type sensors |
| `{$SENSOR.TEMP.WARN}` | 55 | °C, only applies to Celsius-type sensors |
| `{$VFS.FS.FSNAME.NOT_MATCHES}` | `^(/dev\|/sys\|/run\|/proc\|/etc\|/host\|/tmp\|/var/tmp\|.+/shm$)` | Overrides the "Linux by SNMP" default - see caveats below |

All macros from the linked "Linux by SNMP" template apply as-is; override at the host level as needed.

### "Unavailable" DOM sensors that aren't a fault

`entPhySensorOperStatus=unavailable(2)` fires the "is unavailable" trigger, but usually isn't a fault - `nonoperational(3)` is. Two benign causes that can occur even with lane limiting in place: an unrecognized transceiver form factor left unrestricted, or a non-optical transceiver (e.g. SFP-to-RJ45 copper) with no laser/photodiode, so RX/TX power and TX bias read `unavailable` on every lane.

Set `{$SENSOR.DOM.IGNORE:"Eth1/34"}` = `1` at the host level (parent port, not a lane) to silence either case for that port; items keep polling normally, and non-operational still alerts.

## Known caveats

Determined from a full `snmpwalk` of the mib-2 subtree against a real Dell PowerSwitch S5232F-ON running Enterprise SONiC 4.6.0 Standard, and confirmed end-to-end by importing this template into a live Zabbix 7.0 instance and polling that same switch - all 779 discovered `sonic.*` items resolved with sane values (only the one expected swap "Not supported" case). Your platform/build may differ - please validate and open an issue/PR with findings.

- **`ENTITY-MIB`/`ENTITY-SENSOR-MIB` are confirmed POPULATED** - 445 physical entities, 398 sensors: CPU/ASIC temperature, 3x system airflow temperature, inlet airflow, 2x PSU temperature, 8 fan tachometers + 2 PSU fans, and per-port DOM temperature. Make sure `ENTITY-MIB`/`ENTITY-SENSOR-MIB` are loaded locally when you `snmpwalk` yourself, or net-snmp falls back to generic `mib-2.47.../mib-2.99...` OIDs instead of symbolic names.
- **No PSU voltage/current/power sensors on this hardware** - only PSU temperature and fan tachometer are backed by real data. `entPhysicalDescr` lists a `"Voltage for PSU 1/2"` entry, but it has no corresponding `entPhySensorType`/`Value` row (confirmed with `snmpget`, both return "No Such Instance") and is filtered out the same way as the container entities above; there's no PSU current or power entry at all on this build. Other hardware exposing those electrically would be picked up automatically.
- **`sonic.sensor.raw`'s stored value can silently truncate at exactly 65535 bytes** if you re-enable its history to inspect it directly - confirmed reproducible on this 445-entity device, close to the ceiling for a single combined `walk[]` item. This doesn't affect the discovery rules, which consume the untruncated value straight from the poller before it's written to history - only the stored debug copy looks incomplete. If a future device is large enough that *live* discovery starts dropping rows too, splitting the walk into two master items (`entPhysicalDescr` separately from the four `ENTITY-SENSOR-MIB` columns) would fix it.
- **SNMP traps for temperature are not implemented here** - polling only. Dell's release notes (reportedly 4.5.3+) also mention traps as a complementary push-based path.
- **`UCD-SNMP-MIB` is confirmed POPULATED** - "Linux by SNMP"'s memory items (`vm.memory.*`) returned real values (16 GB total, ~4% utilized) despite living under the private enterprises branch, which a default-scope `snmpwalk` doesn't reach.
- **No real disk/partition in `hrStorageTable`** on the tested build - only memory pools and Docker bind-mount pseudo-filesystems, filtered by `{$VFS.FS.FSNAME.NOT_MATCHES}` above.
- `sysObjectID` reports Dell's enterprise OID regardless of NOS - identifies the hardware, not the agent software.

## Related templates

- [Dell Force S-Series by SNMP](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/net/dell_force_s_series_snmp) - for switches running FTOS/Dell Networking OS (not SONiC)
- [Dell SmartFabric OS10 by SNMP](../../Dell/template_smartfabric_os10_snmp) - for the same Dell "-ON" hardware running SmartFabric OS10 instead of SONiC
- [Official Zabbix Templates](https://www.zabbix.com/integrations)

## License

This project is licensed under the MIT License.

## Disclaimer

This template is provided as-is and was validated against a single platform/build. Test thoroughly in your environment before production use.
