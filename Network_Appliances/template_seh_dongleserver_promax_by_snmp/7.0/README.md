# SEH Dongle Server ProMAX by SNMP

## Overview

This template monitors the **SEH Dongle Server ProMAX (UTN Server)** using SNMP polling, with ICMP and TCP service availability checks and an HTTP-based firmware update check. It covers system health (CPU/memory/temperature), network interfaces, USB dongle port status and capacity, NTP, DNS, and SNMP security posture, and alerts when a newer firmware release is published on the SEH website.

The template uses the vendor's private enterprise MIB (`1.3.6.1.4.1.1229`, SEH Computertechnik GmbH) alongside the standard `IF-MIB` for network interfaces.

## Requirements

- Zabbix version: **7.0**
- SNMP access to the device (SNMPv3 recommended - see [Macros](#macros))
- Zabbix server/proxy must be able to reach the device via:
  - SNMP (UDP/161)
  - ICMP (for ping/loss/response-time checks)
  - TCP (for UTN and UTN-SSL port checks)
  - Outbound HTTPS (for the firmware-check item, which polls `seh-technology.com` directly from the Zabbix server/proxy, not the device)
- A Zabbix host with an **SNMP interface** configured and linked to this template

## Template Group

`Templates/Network devices`

## Setup

1. Create a host in Zabbix and configure its **SNMP interface** (IP/port of the DongleServer ProMAX).
2. Set the host's SNMP interface to **SNMPv3**, using the credentials matching `{$SEH.SNMP.USER}` / `{$SEH.SNMP.AUTHPRIV_PASSWORD}` (security level authPriv is assumed - configure auth/priv protocols on the interface to match the device).
3. Link the template `SEH Dongle Server ProMAX by SNMP` to the host.
4. Override the macros below as needed at the host level (thresholds, URL, TCP ports, USB port discovery filter, USB capacity).
5. If you want the "URL Check" web scenario to actually run, set `{$SEH.URL}` to the device's management URL - it is empty by default and the check will not be meaningful until set.
6. Review `{$SEH.PORT.NOT_MATCHES}` (default `CHANGE_IF_NEEDED`) and set it to a real regex, or the placeholder value itself will simply never match and every discovered USB port will be included.

## Macros

| Macro | Default | Description                                                |
|---|---|------------------------------------------------------------|
| `{$SEH.BOX.TEMP.CRIT}` | `60` | Internal enclosure temperature, critical threshold (°C)    |
| `{$SEH.BOX.TEMP.WARN}` | `50` | Internal enclosure temperature, warning threshold (°C)     |
| `{$SEH.CPU.TEMP.CRIT}` | `85` | CPU temperature, critical threshold (°C)                   |
| `{$SEH.CPU.TEMP.WARN}` | `75` | CPU temperature, warning threshold (°C)                    |
| `{$SEH.CPU.UTIL.CRIT}` | `90` | CPU utilization, critical threshold (%)                    |
| `{$SEH.CPU.UTIL.WARN}` | `80` | CPU utilization, warning threshold (%)                     |
| `{$SEH.ICMP_LOSS_WARN}` | `20` | ICMP packet loss warning threshold (%)                     |
| `{$SEH.ICMP_RESPONSE_TIME_WARN}` | `0.15` | ICMP response time warning threshold (seconds)             |
| `{$SEH.IF.ERRORS.WARN}` | `2` | Interface in/out error rate warning threshold (errors/sec) |
| `{$SEH.IF.UTIL.MAX}` | `90` | Interface bandwidth utilization warning threshold (%)      |
| `{$SEH.MEMORY.UTIL.CRIT}` | `90` | Memory utilization, critical threshold (%)                 |
| `{$SEH.MEMORY.UTIL.WARN}` | `80` | Memory utilization, warning threshold (%)                  |
| `{$SEH.PHY.TEMP.CRIT}` | `85` | Ethernet transceiver temperature, critical threshold (°C)  |
| `{$SEH.PHY.TEMP.WARN}` | `75` | Ethernet transceiver temperature, warning threshold (°C)*  |
| `{$SEH.PORT.MATCHES}` | `^.*` | Regex to include USB ports in discovery*                   |
| `{$SEH.PORT.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Regex to exclude USB ports from discovery                  |
| `{$SEH.SNMP.USER}` | `sehread` | SNMPv3 username                                            |
| `{$SEH.SNMP.AUTHPRIV_PASSWORD}` | *(secret, unset)* | SNMPv3 auth/priv passphrase                                |
| `{$SEH.URL}` | *(unset)* | URL used by the "URL Check" web scenario                   |
| `{$SEH.USB.UTIL.MAX}` | `80` | USB port capacity-usage warning threshold (%)              |
| `{$SEH.UTN.PORT}` | `9200` | UTN (non-SSL) TCP port checked for availability            |
| `{$SEH.UTNSSL.PORT}` | `9443` | UTN SSL TCP port checked for availability                  |

\* `{$SEH.PHY.TEMP.WARN}` and `{$SEH.PORT.MATCHES}` have their in-template descriptions swapped (see [Known Limitations](#known-limitations)); the table above shows their correct/intended meaning.

## What Gets Collected

### Availability checks
- **ICMP ping / loss / response time** simple checks against the host IP
- **TCP port checks** UTN port (`{$SEH.UTN.PORT}`) and UTN-SSL port (`{$SEH.UTNSSL.PORT}`)
- **URL Check** HTTP web scenario against `{$SEH.URL}`, expects HTTP 200
- **SNMP reachability** derived from `nodata()` on the uptime item, 5m window (see [Triggers](#triggers))

### System / device information (text items, low-frequency polling)
Bonjour name, device information, system information, system name, IP/gateway/MAC address, primary/secondary DNS, NTP server/status/timezone, SNMPv1/SNMPv3 status, configured UTN and UTN-SSL ports (as reported by the device itself, separate from the TCP checks above).

### Performance metrics
- CPU utilization (%)
- Memory utilization (%) collected as "free %" from the device and inverted in preprocessing to represent used %
- System uptime
- Internal enclosure temperatures (Box1/Box2/Box3)
- CPU temperature
- Ethernet transceiver temperatures (PHY1/PHY2)

### Firmware version tracking
- **Current Firmware Version** (`seh.fw.currentversion`) human-readable version string, extracted via regex from the device-info text item
- **Current Firmware Numeric Version** (`seh.fw.numeric`) calculated from the major/release/subrelease OIDs into a single comparable number
- **Latest Firmware Version** / **Latest Firmware Numeric Version** scraped from the SEH downloads page (`seh.fw.page`, HTTP agent item) via regex, then converted to the same numeric format
- A template-level trigger fires when the installed numeric version is behind the latest published numeric version

### USB / dongle capacity
- **Total USB Ports** (`seh.usb.total`) - number of entries in the device's UTN port table
- **Connected USB Devices Count** (`seh.usb.connected.count`) - calculated via `count_foreach()` over all discovered port-status items
- A template-level trigger compares connected count against total ports (`{$SEH.USB.UTIL.MAX}`) to flag high USB capacity usage

### Discovery rules

**Network Interface Discovery** (`IF-MIB`, standard `ifTable` walk)
Per interface: admin status, operational status, MTU, speed, interface type, inbound/outbound bits (bps), inbound/outbound discards, inbound/outbound errors.
Trigger prototypes: link down, high inbound/outbound bandwidth usage (vs. `{$SEH.IF.UTIL.MAX}`), high input/output error rate (vs. `{$SEH.IF.ERRORS.WARN}`) - all error/bandwidth triggers depend on (are suppressed by) the link-down trigger.

**USB Port Discovery** (SEH proprietary MIB)
Per USB dongle port: connected host, manufacturer, product, and a derived status (Absent / Present-Host-Absent / Present-Host-Present). Filterable via `{$SEH.PORT.MATCHES}` / `{$SEH.PORT.NOT_MATCHES}`. Discovered entities are kept indefinitely (`lifetime: DELETE_NEVER`).
Trigger prototypes: dongle present but not connected to a UTN manager host, dongle removed from a port.

## Triggers

| Trigger | Severity | Notes                                                                                                              |
|---|---|--------------------------------------------------------------------------------------------------------------------|
| `{HOST.NAME} Unavailable by ICMP ping` | High | 3 consecutive failed pings                                                                                         |
| `High ICMP ping loss on {HOST.NAME}` | Warning | Depends on ICMP-unavailable trigger                                                                                |
| `High ICMP ping response time on {HOST.NAME}` | Warning | Depends on loss + unavailable triggers                                                                             |
| `Port TCP {$SEH.UTN.PORT} on {HOST.NAME} is Down` | High | TCP port monitoring                                                                                                |
| `Port TCP {$SEH.UTNSSL.PORT} on {HOST.NAME} is Down` | High | TCP port monitoring                                                                                                |
| `Critical / High CPU utilization` | High / Warning | Warning depends on Critical                                                                                        |
| `Critical / High Memory utilization` | High / Warning | Warning depends on Critical                                                                                        |
| `BOX1/BOX2/BOX3 Temperature above warning/critical` | High / Warning | Warning depends on Critical                                                                                        |
| `CPU Temperature above warning/critical` | High / Warning | Warning depends on Critical                                                                                        |
| `PHY1/PHY2 Temperature above warning/critical` | High / Warning | Warning depends on Critical                                                                                        |
| `No SNMP data collection` | High | `nodata()` on uptime item, 5m                                                                                      |
| `{HOST.NAME} has been restarted` | Average | Manual close, uptime < 10m                                                                                         |
| `SNMPv1 Enabled: Risk of Security Vulnerability` | Warning | Manual close                                                                                                       |
| `Firmware Update Available` | Info | Manual close, compares numeric firmware versions                                                                   |
| `SEH URL is Down` | High | Depends on the "URL Check" web scenario                                                                            |
| `All USB Ports Occupied` | High | Manual close, fires when connected count = total usb ports available |
| `No USB devices connected` | Info | Recovers via explicit recovery expression                                                                          |
| `USB port utilization is above {$SEH.USB.UTIL.MAX}%` | High | Template-level, connected/total ratio                                                                              |
| `Interface link down / high error rate / high bandwidth usage` | High / Warning | Per-interface, from discovery                                                                                      |
| `USB Not Connected to any UTN Manager on Port {#PORT}` | Warning | Per-port, from discovery                                                                                           |
| `USB Dongle Removed from Port {#PORT}` | Average | Per-port, from discovery                                                                                           |

## Value Maps

- **ICMP-Status-Mapping** - 0=Down, 1=Up
- **IF-Admin-Status-Mapping** - 1=Up, 2=Down, 3=Testing
- **IF-Operational-Status-Mapping** - 1=Up, 2=Down, 3=Testing, 4=Unknown, 5=Dormant, 6=NotPresent, 7=LowerLayerDown
- **IF-Type-Mapping** - 6=ethernetCsmacd, 24=softwareLoopback, 131=tunnel
- **NTP-Status-Mapping** - 0=Disabled, 1=Enabled
- **Port-Status-Mapping** - 0=USB Absent, 1=USB Present Host Absent, 2=USB Present Host Present
- **SNMP-Status-Mapping** - 0=Disabled, 1=Enabled

## Contributing / Feedback

Issues and pull requests are welcome. Please include your device firmware version and Zabbix version when reporting problems with specific OIDs or discovery behavior.