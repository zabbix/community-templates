# Ubiquiti UniFi AP by SNMP

## Overview

This template monitors Ubiquiti UniFi access points directly through SNMP. It
collects device health, physical Ethernet uplink counters, and UniFi radio
utilization without requiring SSH access to the access point.

The template uses numeric OIDs, so MIB files are not required on the Zabbix
server.

## Requirements

- Zabbix 7.4 or newer
- SNMPv2c or SNMPv3 configured on the Zabbix host interface
- IF-MIB, SNMPv2-MIB, UCD-SNMP-MIB, and UI-MIB exposed by the access point

Validated on a UAP-AC-Lite running firmware 6.8.2.15592.

## Setup

1. Enable SNMP in UniFi Network.
2. Create a Zabbix host with an SNMP interface pointing to the access point.
3. Import `template_ubiquiti_unifi_ap_by_snmp.yaml`.
4. Link `Ubiquiti UniFi AP by SNMP` to the host.

SNMPv3 with SHA authentication and AES-128 privacy is recommended. When using
SNMPv2c, configure a unique read-only community and restrict UDP/161 at the
firewall.

Do not link this template and another full IF-MIB template to the same host
unless their item keys are known not to conflict.

## Collected data

- ICMP and SNMP availability
- System name, model, firmware, and uptime
- Total, free, and cached memory
- Physical interface state, speed, traffic, errors, and discarded packets
- Radio band, packet rates, and channel utilization
- Discovered uplink and radio graphs in the template dashboard

## Macros used

| Name | Description | Default |
| --- | --- | ---: |
| `{$ICMP_LOSS_WARN}` | Warning threshold of ICMP packet loss in percent. | `20` |
| `{$ICMP_RESPONSE_TIME_WARN}` | Warning threshold of average ICMP response time in seconds. | `0.2` |
| `{$IF.DISCARDS.WARN}` | Warning threshold of discarded packets per second. Supports interface-name context. | `5` |
| `{$IF.ERRORS.WARN}` | Warning threshold of errored packets per second. Supports interface-name context. | `0` |
| `{$IF.SPEED.MIN}` | Minimum expected physical interface speed in bps. Supports interface-name context. | `100000000` |
| `{$IFCONTROL}` | Set to 0 to disable link-state alerts. Supports interface-name context. | `1` |
| `{$NET.IF.IFNAME.MATCHES}` | Regular expression selecting physical interfaces for discovery. | `^eth[0-9]+$` |
| `{$RADIO.CHANNEL.UTIL.MAX}` | Maximum channel utilization in percent. Supports radio-band context. | `80` |
| `{$SNMP.TIMEOUT}` | Time interval for the SNMP availability trigger. | `5m` |

For an AC Lite expected to negotiate at 1 Gbit/s, set
`{$IF.SPEED.MIN:"eth0"}` to `1000000000` on the host.

## Known limitations

- The tested UAP-AC-Lite SNMP agent does not expose EtherLike-MIB FCS,
  collision, or symbol-error counters. Check the switch port for detailed
  FCS/CRC counters.
- Model and firmware are parsed from `SNMPv2-MIB::sysDescr`, because the tested
  firmware does not expose the corresponding UI-MIB system objects.
- SNMP traps are not currently supported by UniFi Network.
