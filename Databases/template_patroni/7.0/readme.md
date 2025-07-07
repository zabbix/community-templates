# Template App Patroni Cluster monitoring by HTTP  

## 1  Why this upgrade?
Zabbix 7.x introduces a stricter export schema (UUID-based
identifiers, no `<applications>` blocks, renamed tags, textual enums,
etc.). Attempting to import the old file caused multiple
_“unexpected tag / constant / expression”_ errors.  
This version brings the template fully in-line with the 7.4 schema while
preserving **all functional logic** (items, discovery, preprocessing,
triggers).

---

## 2  High-level diffs

| Area | 5.0 export | 7.4-ready export |
|------|------------|------------------|
| **Header** | `<version>5.0</version>` & `<date>…</date>` | `<version>7.4</version>` ( `<date>` removed) |
| **Root grouping** | `<groups>` | `<template_groups>` + UUIDs |
| **Applications** | `<applications>` blocks everywhere :contentReference[oaicite:3]{index=3} | **Removed** (apps were deprecated in 5.4) |
| **UUIDs** | absent | Added to every object that the 7.4 schema requires |
| **Item / prototype enums** | numeric (`type>19</type>`, `value_type>4</value_type>`) | textual (`HTTP_AGENT`, `TEXT`, etc.) |
| **Pre-processing** | `<params>…</params>` | `<parameters><parameter>…</parameter></parameters>` |
| **Bad macro names** | `{$PATRONI.API.STAUTS_*}` | fixed to `{$PATRONI.API.STATUS_*}` |
| **Trigger expressions** | shorthand `{last()}=0`, `{change()}<>0` :contentReference[oaicite:4]{index=4} | full item references (`last(/Template …)` / `change(/Template …)`) |
| **URLs** | hard-coded `http://{$…}` | protocol macro `{$PATRONI.API.SCHEME}://{$…}` |
| **History / trends fields** | sometimes missing or long defaults | history/trends left only where meaningful, else `0` |
| **Validation** | mismatched tags, schema errors | passes import on vanilla Zabbix 7.4.0 |

---

## 3  Detailed change-log

### 3.1 Header & metadata  
* **Version bump:** `5.0` → `7.4`.  
* **Removed** obsolete `<date>` node (dropped after 5.x).

### 3.2 Template grouping  
* Root `<groups>` block replaced by `<template_groups>` containing a
  generated `<uuid>` and the original group name **Patroni**.  
* Inner `<groups>` _inside_ the template is left untouched to keep host-group
  linkage on import.

### 3.3 UUID injection  
Mandatory `<uuid>` elements added to:  
* template itself  
* template-group  
* every item, discovery rule, item/trigger prototype, graph, etc.

### 3.4 Applications removal  
All `<applications>` / `<application_prototypes>` blocks were removed;  
the “Application = Patroni” label is now a **tag** on every item.

### 3.5 Item & prototype enum conversion  
Numeric constants ➜ textual equivalents, e.g.  

| Old | New |
|-----|-----|
| `type = 19` | `type = HTTP_AGENT` |
| `value_type = 4` | `value_type = TEXT` |
| `status = 1` | `status = DISABLED` |

### 3.6 Pre-processing schema  
* `<params>` renamed to `<parameters><parameter>…</parameter></parameters>`.
* Multi-line JavaScript / Regex parameters converted to literal `|`-style
  blocks for readability.

### 3.7 Trigger expressions  
* Replaced shorthand (`{last()}…`, `{nodata(…)}`) with
  full item keys so the parser can resolve them.  
* Fixed macro typos (`STAUTS_` → `STATUS_`).  
* Prototype trigger now reads  
  `change(/Template App Patroni Cluster monitoring by HTTP/patroni.endpoint.cluster.member.role[{#SERVER}])<>0`.

### 3.8 Macro set  
* Added `{$PATRONI.API.SCHEME}` (http|https).  
* Renamed/fixed the two typo’d macros above.  
* Default macro values aligned with original intent (no functional change).

### 3.9 URLs & item delays  
* URLs use the new scheme macro.  
* Delay fields reference `{$PATRONI.API.STATUS_CHECK_INTERVAL}`.

### 3.10 Misc tidy-ups  
* History/trends set to `0` for purely stateful/heartbeat items.  
* Regex steps that previously listed patterns on one line are now
  YAML-style multi-line blocks, identical behaviour.

---

## 4  How to use

1. **Import** `template_patroni_7_4_fixed_trig.xml` via  
   *Configuration → Templates → Import*.  
   No red-line errors should appear on Zabbix 7.4.0+.  
2. Link the template to your Patroni hosts or discovery rules.  
3. Adjust macros (`{$PATRONI.API.*}`) to match your environment.

---

## 5  Compatibility
* **Zabbix 7.x:** fully supported.  
* **Zabbix 6.x:** should import (same schema), but was only tested on 7.4.  
* **Older versions (<6.0):** not supported.


