# Dell SmartFabric OS10 by SNMP (Advanced) — 7.0 vs 7.4

This is a Zabbix 7.0-compatible port of the [7.4 advanced template](../7.4/template_smartfabric_os10_advanced.yaml). Functionally equivalent, with these differences:

## Card Discovery flattened

The 7.4 template nests `Card Discovery` under `Chassis Discovery` via `parent_discovery_rule`, a feature that only exists in Zabbix 7.4+. This port makes `Card Discovery` a standalone, non-nested rule fed by a new top-level item (`SNMP walk Card table`) that walks the whole card table in one pass and derives both the chassis and card index from the row's compound SNMP index.

Side effect: card items/tags now key on `{#CHASSIS_ID}` (numeric chassis index) instead of `{#CHASSIS_PPID}` (chassis serial number). Card-side keying (`{#CARD_PPID}`, serial number) is unchanged.

## CPU utilization is fully discovery-driven

The 7.4 template ships two hardcoded `CALCULATED` items (`CPU 1 Usage`, `CPU 2 Usage`) pointing at fixed SNMP indices, feeding two dashboard Gauge widgets — because Gauge widgets can't bind to LLD-discovered items. This port drops both hardcoded items and their gauges, and instead adds a graph prototype on the existing `CPU usage Discovery` rule, shown on a new "CPU Usage" dashboard page (one graph per discovered CPU). No hardcoded indices, and it scales to however many CPUs a given switch actually reports.

The discovered CPU items are named `CPU {#CPU_NUM}` (1, 2, 3, ... in walk order) instead of the raw, often unreadable SNMP index, via a discovery-rule-level JS preprocessing step. They're also tagged `component: cpu`.

## Everything else

Items, remaining discovery rules, triggers, macros, valuemaps, and other dashboard pages are unchanged from the 7.4 template.
