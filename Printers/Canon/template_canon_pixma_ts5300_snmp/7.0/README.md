# Canon PIXMA TS5300 by SNMP

## Overview

Template for the Canon PIXMA TS5300 series inkjet printers, monitored over the network with SNMP v1. It uses
only standard MIBs (Printer-MIB, HOST-RESOURCES-MIB, IF-MIB, MIB-2), so no MIB files have to be installed on
the Zabbix server or proxy.

The existing Canon templates in this repository target laser devices (toner colours, waste toner, counters
from the private Canon MIB `1.3.6.1.4.1.1602`), which an inkjet PIXMA does not answer. This template covers
what the TS5300 actually exposes:

- ink tank levels (low-level discovery, one set of items per tank) with a low ink trigger,
- free space of the waste ink absorbers (low-level discovery) with an "almost full" trigger,
- page counters (lifetime and since power-on),
- device status, printer status and the detected error state decoded into readable text,
- text shown on the printer display,
- model with firmware version, serial number, uptime,
- Wi-Fi link state and speed,
- IP, TCP, UDP, ICMP and SNMP packet rates.

Tested with Zabbix 8.0, exported in 7.0 format.

## Setup

1. Connect the printer to the network (Wi-Fi) and make sure SNMP is enabled in its LAN settings.
2. Give the printer a fixed IP address (DHCP reservation on the router).
3. Import `template_canon_pixma_ts5300_snmp.yaml` in *Data collection* → *Templates* → *Import*.
4. Create a host with an **SNMP interface**: printer IP address, port 161, SNMP version **SNMPv1**,
   community `{$SNMP_COMMUNITY}`, *Use combined requests* unchecked.
5. If the community differs from the global macro `{$SNMP_COMMUNITY}`, set the macro on the host
   (type *Secret text*).
6. Link the template *Canon PIXMA TS5300 by SNMP* to the host.

Discovery rules run once per hour; use *Execute now* on both rules to get the supply items immediately.

## Macros used

| Name | Description | Default |
| --- | --- | --- |
| `{$INK.PCT.MIN}` | Ink level threshold of the low ink trigger, in %. | `10` |
| `{$WASTE.PCT.MIN}` | Free space threshold of the waste ink absorber trigger, in %. | `10` |
| `{$SNMP_COMMUNITY}` | SNMP community of the printer. Not defined in the template – the global Zabbix macro is used unless it is overridden on the host. | `public` (global macro) |

## Template links

There are no template links in this template.

## Discovery rules

| Name | Description | Key | Interval |
| --- | --- | --- | --- |
| Supplies: ink tanks | `prtMarkerSuppliesTable` entries of class 3 (supplyThatIsConsumed). | `canon.ink.discovery` | 1h |
| Supplies: waste ink absorbers | `prtMarkerSuppliesTable` entries of class 4 (receptacleThatIsFilled). | `canon.waste.discovery` | 1h |

## Items collected

| Name | Description | Key | Interval |
| --- | --- | --- | --- |
| Model and firmware | `hrDeviceDescr` | `canon.model` | 1h |
| Serial number | `prtGeneralSerialNumber` | `canon.serial` | 1h |
| Uptime (SNMP agent) | `sysUpTime` | `canon.uptime` | 5m |
| Device status | `hrDeviceStatus`: running = OK, warning = e.g. low ink, down = error | `canon.device.status` | 5m |
| Printer status | `hrPrinterStatus`: idle, printing, warmup | `canon.printer.status` | 5m |
| Detected errors | `hrPrinterDetectedErrorState` decoded into text (low paper, no paper, low ink, no ink, door open, paper jam, offline, service requested, …); `none` = no errors | `canon.printer.errors` | 5m |
| Console display | `prtConsoleDisplayBufferText`, e.g. `Sleeping.` | `canon.display` | 5m |
| Pages: total | `prtMarkerLifeCount` | `canon.pages.total` | 5m |
| Pages: since power-on | `prtMarkerPowerOnCount` | `canon.pages.poweron` | 5m |
| Wi-Fi: operational status | `ifOperStatus` of ifIndex 1 | `canon.wifi.status` | 5m |
| Wi-Fi: link speed | `ifSpeed` of ifIndex 1 | `canon.wifi.speed` | 5m |
| TCP: segments received / sent | `tcpInSegs`, `tcpOutSegs`, per second | `canon.tcp.in_segs`, `canon.tcp.out_segs` | 5m |
| UDP: datagrams received / sent | `udpInDatagrams`, `udpOutDatagrams`, per second | `canon.udp.in_datagrams`, `canon.udp.out_datagrams` | 5m |
| IP: datagrams received / sent | `ipInReceives`, `ipOutRequests`, per second | `canon.ip.in_receives`, `canon.ip.out_requests` | 5m |
| ICMP: messages received | `icmpInMsgs`, per second | `canon.icmp.in_msgs` | 5m |
| SNMP: packets received | `snmpInPkts`, per second | `canon.snmp.in_pkts` | 5m |

Item prototypes (for every discovered ink tank and waste ink absorber):

| Name | Description | Key | Interval |
| --- | --- | --- | --- |
| Ink: {#SUP.NAME}: level (raw) | `prtMarkerSuppliesLevel` | `canon.ink.level[{#SNMPINDEX}]` | 5m |
| Ink: {#SUP.NAME}: capacity (raw) | `prtMarkerSuppliesMaxCapacity` | `canon.ink.max[{#SNMPINDEX}]` | 1h |
| Ink: {#SUP.NAME}: level, % | Calculated: level / capacity × 100 | `canon.ink.pct[{#SNMPINDEX}]` | 5m |
| Waste ink absorber: {#SUP.NAME}: free space (raw) | `prtMarkerSuppliesLevel` | `canon.waste.level[{#SNMPINDEX}]` | 5m |
| Waste ink absorber: {#SUP.NAME}: capacity (raw) | `prtMarkerSuppliesMaxCapacity` | `canon.waste.max[{#SNMPINDEX}]` | 1h |
| Waste ink absorber: {#SUP.NAME}: free space, % | Calculated: level / capacity × 100 | `canon.waste.pct[{#SNMPINDEX}]` | 5m |

## Triggers

Trigger prototypes (one per discovered supply):

| Name | Description | Expression | Severity |
| --- | --- | --- | --- |
| Ink: {#SUP.NAME} is low | The ink level is below `{$INK.PCT.MIN}`%. Prepare a new ink tank. | `last(/Canon PIXMA TS5300 by SNMP/canon.ink.pct[{#SNMPINDEX}])<{$INK.PCT.MIN}` | Warning |
| Waste ink absorber: {#SUP.NAME} is almost full | The free space of the waste ink absorber is below `{$WASTE.PCT.MIN}`%. A full absorber blocks the printer and has to be replaced by service. | `last(/Canon PIXMA TS5300 by SNMP/canon.waste.pct[{#SNMPINDEX}])<{$WASTE.PCT.MIN}` | High |

There are no availability triggers on purpose: a home printer is usually switched off or asleep most of the
time. Link an ICMP or SNMP availability template if the printer is expected to be always on.

## Notes

- **Waste ink absorbers report free space.** For supplies of class *receptacleThatIsFilled* the Printer-MIB
  level is the remaining capacity (RFC 3805), so 100 % means an empty absorber and 0 % a full one. A full
  absorber stops the printer until it is replaced by service.
- Supply levels of `-2` (unknown) and `-3` (some remaining) make the raw level item *not supported* with an
  explanatory message instead of storing a meaningless number. The same applies to a capacity of `-1`
  (unrestricted), `-2` (unknown) or `0`; the percentage item is then not calculated.
- Right after discovery some calculated percentage items may be *not supported* ("not enough data") until
  the first raw level has been collected; they recover on the next check (5 minutes). Rate items
  (IP/TCP/UDP/ICMP/SNMP) show values after the second poll.
- `ifOperStatus` and `ifSpeed` are read from ifIndex 1: the TS5300 has a single network interface (Wi-Fi).
- The printer does not provide interface traffic counters (`ifInOctets`, `ifHCInOctets`), `tcpCurrEstab`,
  `tcpPassiveOpens`, `icmpOutMsgs`, the cover table (`prtCoverTable`) or the alert table (`prtAlertTable`).
  Input trays only report level `-3`, so they are not monitored.
- When the printer is powered off, all items become unavailable; in sleep mode it keeps answering SNMP.

## Author

lesiulodz ([@lesiulodz](https://github.com/lesiulodz))

## License

MIT, as all templates in this repository.
