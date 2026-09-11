# HP A5500 HI — Comware 5 — Zabbix 7.0

[English](README.md) | [Vietnamese](readme_vi.md)

SNMP template for the **HP A5500-48G-4SFP HI Switch with 2 interface Slots**, running
**Comware 5.20.99, Release 5501P36**. Imported template name: **HP A5500 HI**.
No linked templates are required. Supports SNMPv2c/SNMPv3 as configured on the host's SNMP interface.

## Target device

Successfully tested on **HP A5500-48G-4SFP HI** running **Comware 5.20.99, Release 5501P36**,
with **Zabbix 7.0.29**. Hardware details below come from the supplied `display version` output.

| Component | Details |
|---|---|
| Model | HP A5500-48G-4SFP HI Switch with 2 interface Slots |
| Software | HPE Comware 5.20.99, Release 5501P36 |
| CPU / SDRAM | 2 processors / 1024 MB |
| Flash | 4096 KB NOR, 512 MB NAND |
| Hardware / CPLD / Bootrom | REV.C / 003 / 215 |
| SubSlot 0 | 48GE + 4SFP + 2SFP PLUS, REV.C |
| SubSlot 1 | 2 XFP, REV.B |
| SubSlot 2 | 2 XFP, REV.B |

The template does not hard-code port counts, processor counts, slots or physical entity indexes.
The SDRAM/flash capacities above describe the device; they are not hard-coded item values.
The `2 Processors` line does not guarantee two CPU entries in SNMP: Comware may report
aggregate utilization per module.

## Setup

1. Import `template_hp_a5500_switch_snmp.yaml` under **Data collection → Templates** in Zabbix 7.0.
2. Add an SNMP interface to the host using the switch management IP and UDP port `161`.
   Allow the server/proxy to access SNMP and read the MIB branches listed below.
3. Match the host's SNMP settings to the switch configuration. For **SNMPv3 authPriv**,
   use SHA/AES if configured on the switch, then create and reference these host macros:
   `{$SNMP_V3_USER}` (Security name), `{$SNMP_V3_AUTHPASSPHRASE}` (Authentication
   passphrase), and `{$SNMP_V3_PRIVPASSPHRASE}` (Privacy passphrase). Set both passphrase
   macros to **Secret text**. For **SNMPv2c**, create `{$SNMP_COMMUNITY}` on the host
   and reference it in the SNMP community field.
4. Link **HP A5500 HI**, allow the master items and discovery rules to run, then check
   **Monitoring → Latest data** and any items marked `Unsupported`.

Create the authentication macros on the host; the YAML contains no sample passwords.
Numeric OIDs are used throughout, so MIB files do not need to be installed on the server/proxy.

Separate UUIDs allow this template to be imported alongside the A5120 template. If the
host already uses A5120, resolve the existing template linkage before linking A5500,
since several item keys overlap. The new template does not automatically migrate
CPU/memory/temperature history from fixed items to LLD items. If an earlier A5500 copy
was imported under the A5120 name, check which template the host uses before unlinking
it or deleting old data.

## Collected data

| Category | Item / discovery | Collection |
|---|---|---|
| System information | `sysName`, `sysDescr`, `sysLocation`, `sysContact` | SNMP, every hour |
| SNMP uptime | `SysUptime` | SNMP, every 5 minutes; TimeTicks converted to seconds |
| Hardware | `hardware.walk` | ENTITY-MIB + HH3C-ENTITY-EXT-MIB, every minute |
| CPU/memory | `module.discovery`; `switch.cpu[index]`, `switch.memory[index]` | Dependent discovery/items per module |
| Temperature | `temperature.discovery`; `switch.temp[index]` | Dependent discovery/items per entity |
| Fans | `fan.discovery`; `fan.status[index]` | Entity class 7, HH3C status |
| Power supplies | `psu.discovery`; `psu.status[index]` | Entity class 6, HH3C status |
| Interfaces | `net.if.walk`, `net.if.discovery` | Bulk walk every minute, dependent discovery/items |
| Traffic | `net.if.in[...]`, `net.if.out[...]` | Counter64 → change per second → multiply by 8, bps |
| Speed | `net.if.speed[...]` | ifHighSpeed × 1,000,000, bps |
| Interface status | `net.if.adminstatus[...]`, `net.if.status[...]` | ifAdminStatus / ifOperStatus |
| CRC | `CRC.Errors[index]` | dot3StatsFCSErrors every 2 minutes, Ethernet only |

Master items do not store history. Discovery uses a one-hour heartbeat for unchanged
results; metric items still update at the master item's polling interval. Graphs are
provided for CPU/memory per module and traffic per interface. A single `walk[]` may
require multiple SNMP packets: admin/operational status share the same master result,
but this is not an atomic snapshot of the switch.

### Hardware discovery

- CPU/memory discovery selects entities whose `entPhysicalDescr` matches
  `{$HP.MODULE.DESCR.MATCHES}` and whose CPU and memory readings are both within 0–100%.
  By default, it matches `Module level1`, Fabric Module descriptions, or descriptions
  containing `CPU`, without case sensitivity. Idle CPUs reporting 0% are included.
- If CPU/memory items are missing, inspect the actual entity descriptions and adjust
  the filter macro. Do not infer indexes from slot numbers or reuse index `.30` from
  another device.
- Temperature discovery accepts entities reporting 1–999 °C. Zero and negative values
  are excluded to avoid unsupported readings; this filter is not intended for sensors
  that must measure 0 °C or negative temperatures.
- Rows missing required columns do not create items. Empty entity names fall back to
  the description, then to the entity index.
- Fan/power supply monitoring uses `hh3cEntityExtErrorStatus`: `2 = normal`,
  `4 = entityAbsent`, `1 = notSupported`. This differs from the active/deactive mapping
  in LSW-DEV-ADM-MIB. Empty slots and unsupported states do not raise fault alerts;
  an empty power supply slot alone does not trigger a loss-of-redundancy alert.

### Interface discovery

Discovery includes `ifType=6` (Ethernet, including GE/10GE), `136` (Vlan-interface),
and `161` (Bridge-Aggregation). SFP+/XFP ports are discovered through IF-MIB without
hard-coded interface names.

VLAN interfaces are monitored for status and link down only by default. Set
`{$NET.IF.NO_TRAFFIC.IFTYPE.MATCHES}` to `^$` to enable traffic, speed and graphs
if the VLAN interfaces actually support those counters. CRC remains limited to
`ifType=6`. Bridge-Aggregation interfaces have traffic, speed and status monitoring
where supported by the device, but no CRC items.

## Alerts

| Alert | Problem / recovery conditions |
|---|---|
| High CPU/memory usage | All samples within 5 minutes exceed the threshold, default 80%. Recovers when all samples within 5 minutes are below the threshold minus 5 percentage points. |
| High temperature | The 5-minute average exceeds the threshold, default 60 °C. Recovers when all samples within 5 minutes are at or below the threshold minus 5 °C. |
| Fan fault | Status 3 (POST failure), 41 (fan error), or 91 (hardware faulty). |
| Power supply fault | Status 3, 51 (PSU error), 61 (RPS error), or 91. |
| Link down | Admin status is up, current operational status is down, and the previous operational sample was up. Remains open until operational status is no longer down, admin status becomes down, or IFCONTROL=0. |
| High bandwidth usage | The 15-minute inbound or outbound average exceeds the threshold, default 90%. Recovers when both directions are below the threshold minus 3 percentage points, or speed=0. |
| CRC errors | More than 1 new FCS error between two samples taken 2 minutes apart. A counter decrease due to reset does not raise an alert. |
| Low SNMP uptime | sysUpTime is below 10 minutes; check the CLI/logs to determine the cause. |

Interfaces already down when monitoring starts do not raise link-down alerts.
The 60 °C threshold is configurable monitoring policy, **not a hardware temperature
limit published by HPE**.

`sysUpTime.0` measures time since the SNMP management subsystem initialized. It may
differ from chassis uptime in `display version` and wraps after approximately 497 days.
The alert is named **SNMP uptime is less than 10 minutes**; it does not confirm a switch
reboot. Check logs/CLI output to distinguish a reboot, SNMP agent restart and counter
wrap, particularly for a device that has already been running for 60 weeks as reported.

## Configuration macros

| Macro | Default | Purpose |
|---|---|---|
| `{$HP.MODULE.DESCR.MATCHES}` | `(?i)(^module level1$\|fabric.*module\|cpu)` | CPU/memory module description regex |
| `{$CPU.UTIL.MAX}` | `80` | CPU threshold in %, supports entity-name context |
| `{$MEMORY.UTIL.MAX}` | `80` | Memory threshold in %, supports entity-name context |
| `{$TEMP.MAX}` | `60` | Temperature threshold in °C, supports entity-name context |
| `{$IF.UTIL.MAX}` | `90` | Bandwidth threshold in %, supports ifName context |
| `{$IFCONTROL}` | `1` | Set to 0 to disable the link-down trigger, supports ifName context |
| `{$NET.IF.IFTYPE.MATCHES}` | `^(6\|136\|161)$` | Interface types to discover |
| `{$NET.IF.NO_TRAFFIC.IFTYPE.MATCHES}` | `^136$` | Interface types monitored for status only |

Examples: `{$IFCONTROL:"GigabitEthernet1/0/24"}=0`,
`{$IF.UTIL.MAX:"Ten-GigabitEthernet1/1/1"}=80`. Use the actual names returned by discovery;
these examples do not guarantee the switch's interface numbering. Keep thresholds
above the corresponding hysteresis offsets so that recovery conditions remain reachable.

## Verify OIDs on R5501P36

Run these commands from the server/proxy with valid SNMP credentials. Replace the
placeholders before running them:

```sh
snmpwalk -v3 -l authPriv -u '<SNMP_USER>' -a SHA -A '<AUTH_PASSPHRASE>' \
  -x AES -X '<PRIV_PASSPHRASE>' -On '<SWITCH_IP>' 1.3.6.1.2.1.47.1.1.1.1

snmpwalk -v3 -l authPriv -u '<SNMP_USER>' -a SHA -A '<AUTH_PASSPHRASE>' \
  -x AES -X '<PRIV_PASSPHRASE>' -On '<SWITCH_IP>' 1.3.6.1.4.1.25506.2.6.1.1.1.1
```

| OID | Data |
|---|---|
| `1.3.6.1.2.1.47.1.1.1.1.2` | entPhysicalDescr |
| `1.3.6.1.2.1.47.1.1.1.1.5` | entPhysicalClass |
| `1.3.6.1.2.1.47.1.1.1.1.7` | entPhysicalName |
| `1.3.6.1.4.1.25506.2.6.1.1.1.1.6` | hh3cEntityExtCpuUsage |
| `1.3.6.1.4.1.25506.2.6.1.1.1.1.8` | hh3cEntityExtMemUsage |
| `1.3.6.1.4.1.25506.2.6.1.1.1.1.12` | hh3cEntityExtTemperature |
| `1.3.6.1.4.1.25506.2.6.1.1.1.1.19` | hh3cEntityExtErrorStatus |
| `1.3.6.1.2.1.31.1.1.1.6` / `1.3.6.1.2.1.31.1.1.1.10` | ifHCInOctets / ifHCOutOctets |
| `1.3.6.1.2.1.31.1.1.1.15` | ifHighSpeed, Mbps |
| `1.3.6.1.2.1.10.7.2.1.3` | dot3StatsFCSErrors |

Match index suffixes between ENTITY-MIB and HH3C-ENTITY-EXT-MIB. If discovery returns
no entities, check the SNMP view/ACL, missing columns and module filter macro. An uplink
operating at 10 Gbit/s should report `10000` for `ifHighSpeed`; compare this with the
CLI speed. If walks time out, check connectivity and adjust the SNMP interface timeout
or Max repetition setting.

For other firmware releases or hardware configurations, use the checks above to confirm
available MIB branches, entity names and logical interface counters.

## References and credits

- [HPE: Comware CPU/memory/temperature OIDs and device-specific indexes](https://support.hpe.com/hpesc/public/docDisplay?docId=sf000098678en_us&docLocale=en_US).
- [Official HP Comware HH3C template, Zabbix 7.0](https://github.com/zabbix/zabbix/blob/release/7.0/templates/net/hp_hh3c_snmp/template_net_hp_hh3c_snmp.yaml): reference for module filters, entity classes and the HH3C status mapping.
- [Zabbix 7.0: SNMP agent and bulk walks](https://www.zabbix.com/documentation/7.0/en/manual/config/items/itemtypes/snmp).

Adapted from the HP A5120 template by **Jakub Samek**. This version replaces fixed
hardware OIDs with discovery, assigns separate UUIDs, retains interface monitoring
from the 7.0 version and updates the documentation for the A5500 HI.
