# eXtremeTemplate

## Overview

This repository contains Zabbix templates for monitoring Wing VX9000 wireless controllers and their managed access points (APs). It consists of two templates:

- **wing‑vx9000**: base template for the controller itself  
- **wing‑vx9000_AP**: template applied automatically to each discovered AP  

All SNMP OIDs, discovery rules, item prototypes, host prototypes and value maps are defined in `eXtremeTemplate.yaml` :contentReference[oaicite:0]{index=0}.

---

## Templates Included

| Template Name     | Description                                               |
|-------------------|-----------------------------------------------------------|
| **wing‑vx9000**   | Monitors controller-level metrics: global client count, ICMP reachability, adopted AP IPs, etc. :contentReference[oaicite:1]{index=1} |
| **wing‑vx9000_AP**| Automatically applied to each AP discovered under the controller; collects AP‑specific metrics like CPU, RAM, uptime, serial, ping, etc. :contentReference[oaicite:2]{index=2} |

---

## Macros Used

| Macro        | Description                                                             |
|--------------|-------------------------------------------------------------------------|
| `{$APIP}`    | IP address of the discovered AP                                         |
| `{$APNAME}`  | Friendly name of the AP                                                 |
| `{$APTYPE}`  | AP hardware type                                                        |
| `{$APUPTIME}`| Uptime string of the AP                                                 |
| `{$SNMPINDEX}`| Raw SNMP index used to distinguish multiple instances (APs or SSIDs)   |

All of the above are set in the **WING AP data** host prototype :contentReference[oaicite:3]{index=3}.

---

## Discovery Rules

| Name             | Description                                                                                          | Type         | Key           |
|------------------|------------------------------------------------------------------------------------------------------|--------------|---------------|
| **WING AP data** | Discovers APs via SNMP, creates a host per AP, links the `wing‑vx9000_AP` template and sets macros. | `SNMP agent` | `wingApdata`  :contentReference[oaicite:4]{index=4} |
| **WING SSID data** | Discovers SSIDs in use and counts clients per SSID.                                               | `SNMP agent` | `wingSsids`   :contentReference[oaicite:5]{index=5} |

### WING AP data

- **OID**: `discovery[{#APNAME},1.3.6.1.4.1.388.50.1.4.2.25.1.1.1.9,{#APIP},1.3.6.1.4.1.388.50.1.4.2.25.1.1.1.13]`  
- **Item prototypes**  
  - `AP {#SNMPINDEX}` → `apName[{#SNMPINDEX}]` (SNMP_AGENT, TEXT, disabled by default) :contentReference[oaicite:6]{index=6}  
- **Host prototypes**  
  - Creates a host named `{#APNAME}`, adds it to group **Templates**, links **wing‑vx9000_AP**, and defines macros `{$APIP}`, `{$APNAME}`, `{$APTYPE}`, `{$APUPTIME}`, `{$SNMPINDEX}` :contentReference[oaicite:7]{index=7}  

### WING SSID data

- **OID**: `discovery[{#SSID},1.3.6.1.4.1.388.50.1.3.4.1.1.4]`  
- **Item prototypes**  
  - `Wireless:{#SSID}` → `clients[{#SSID}]` (SNMP_AGENT, JSONPATH/JS preprocessing to count unique clients) :contentReference[oaicite:8]{index=8}  

---

## Items Collected

### wing‑vx9000

| Name                      | Type         | Key              | Notes                                  |
|---------------------------|--------------|------------------|----------------------------------------|
| adopted IPs               | SNMP_AGENT   | `adoptedApIPs`   | SNMP walk, disabled by default        :contentReference[oaicite:9]{index=9} |
| Global Clients Connected  | SNMP_AGENT   | `GlobalClientCount` | Total connected clients            :contentReference[oaicite:10]{index=10} |
| ICMP ping                 | SIMPLE       | `icmpping`       | Checks controller reachability        :contentReference[oaicite:11]{index=11} |

### wing‑vx9000_AP

| Name                              | Type         | Key                           | Notes                                                        |
|-----------------------------------|--------------|-------------------------------|--------------------------------------------------------------|
| AP clients connected              | SNMP_AGENT   | `apClientsConnected[{$APNAME}]` | Current client count on AP                                  :contentReference[oaicite:12]{index=12} |
| AP cpu info                       | SNMP_AGENT   | `apcpuinfo[{$APNAME}]`        | Device CPU info (TEXT)                                     :contentReference[oaicite:13]{index=13} |
| AP firmware                       | SNMP_AGENT   | `apfirmware[{$APNAME}]`       | Firmware version (TEXT)                                     :contentReference[oaicite:14]{index=14} |
| AP model                          | SNMP_AGENT   | `apmodel[{$APNAME}]`          | Model identifier (TEXT)                                     :contentReference[oaicite:15]{index=15} |
| AP mac address of parent controller | SNMP_AGENT | `apparent[{$APNAME}]`         | Parent controller MAC (SNMP_GET_VALUE preprocessing)        :contentReference[oaicite:16]{index=16} |
| AP percentage cpu usage           | SNMP_AGENT   | `appercentagecpuusage[{$APNAME}]` | Multiplied by 0.1                                         :contentReference[oaicite:17]{index=17} |
| AP percentage ram usage           | SNMP_AGENT   | `apramusage[{$APNAME}]`       | Calculated via JavaScript                                  :contentReference[oaicite:18]{index=18} |
| AP serial number                  | SNMP_AGENT   | `apserialnumber[{$APNAME}]`   | Serial number (TEXT)                                        :contentReference[oaicite:19]{index=19} |
| AP uptime                         | SNMP_AGENT   | `apuptime[{$APNAME}]`         | Uptime in seconds (JS parsing)                             :contentReference[oaicite:20]{index=20} |
| AP ping                           | SIMPLE       | `icmpping[{$APIP}]`           | Reachability test for each AP                              :contentReference[oaicite:21]{index=21} |

---

## Triggers

### wing‑vx9000

- **Controller ICMP lost**  
  Expression: `max(/wing‑vx9000/icmpping,5m)=0`  
  Name: _controller ICMP ping Lost connection 5 minutes ago_ (HIGH) :contentReference[oaicite:22]{index=22}  

### wing‑vx9000_AP

- **AP ICMP lost**  
  Expression: `max(/wing‑vx9000_AP/icmpping[{$APIP}],5m)=0`  
  Name: _AP {$APNAME} ICMP ping Lost connection 5 minutes ago_ (HIGH) :contentReference[oaicite:23]{index=23}  

---

## Value Maps

| Name                            | Mapping                                          |
|---------------------------------|--------------------------------------------------|
| **Service state**               | 0 → Down, 1 → Up                                 |
| **zabbix.host.available**       | 0 → not available, 1 → available, 2 → unknown    |

All defined in `eXtremeTemplate.yaml` :contentReference[oaicite:24]{index=24}.  

---

