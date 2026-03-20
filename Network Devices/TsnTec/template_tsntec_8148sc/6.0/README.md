# Network-TSN-8148SC

## Overview

Zabbix 6.0 template for **Time-Sensitive Networking (TSN) devices** that expose standard SNMP objects (IF-MIB, HOST-RESOURCES-MIB, SNMPv2-MIB) plus enterprise OIDs for hardware sensors, power supplies and SFP optics.

## Macros used

| Macro | Default | Purpose |
| ----- | ------- | ------- |
| `{$CPU.UTIL.CRIT}` | 50 | CPU % before trigger |
| `{$MEMORY.UTIL.MAX}` | 90 | Memory % before trigger |
| `{$ICMP_LOSS_WARN}` | 20 | Loss % before trigger |
| `{$ICMP_RESPONSE_TIME_WARN}` | 0.15 | RTT seconds before trigger |
| `{$IFCONTROL}` | 1 | Set 0 to disable link-down triggers on selected ports |
| `{$SNMP.TIMEOUT}` | 5m | SNMP availability window |

## Template links

There are no template links in this template.

## Discovery rules

| Name | OID | Description |
| ---- | --- | ----------- |
| **Network interfaces discovery** | `net.if.discovery` | Creates items for every interface that matches admin/oper status and name/alias filters. |

## Items collected

| Item | Key | Unit | Note |
| ---- | --- | ---- | ---- |
| ICMP ping | `icmpping` | – | Availability trigger |
| ICMP loss | `icmppingloss` | % | 5-min average |
| ICMP response time | `icmppingsec` | s | 5-min average |
| CPU utilisation | `system.cpuutilization.percent` | % | 1-min average, triggers ≥ 50 % by default |
| Memory utilisation | `system.mem.util` | % | triggers ≥ 90 % |
| **Switch temperature** | `system.switch.thermal` | °C | Switch-ASIC sensor |
| **FPGA temperature** | `system.fpga.thermal` | °C | FPGA sensor |
| **Fan speeds** (left / right) | `system.left.fanspeed`<br>`system.right.fanspeed` | rpm |  |
| **Power supplies** (left / right) | voltage, current, power | V, mA, W | Enterprise OID 65531.1.19-28 |
| Device uptime | `system.net.uptime` | uptime | 0.01 s → “X days …” |
| SNMP agent availability | `zabbix[host,snmp,available]` | – | Internal, triggers if SNMP down |


## Triggers

| Name | Expression | Default Threshold | Severity |
| ---- | ---------- | ----------------- | -------- |
| **Unavailable by ICMP ping** | `max(icmpping,#3)=0` | 3 lost | DISASTER |
| **High ICMP loss** | `min(icmppingloss,5m)>20%` | 20 % | WARNING |
| **High ICMP response time** | `avg(icmppingsec,5m)>0.15` | 150 ms | WARNING |
| **High CPU utilization** | `min(cpu.util,5m)>50%` | 50 % | WARNING |
| **High Memory utilization** | `min(mem.util,5m)>90%` | 90 % | WARNING |
| **Link down** | `ifOperStatus=2 & admin=1` | – | AVERAGE (manual close) |

## Tested on
Zabbix 6.0 + TsnTec 8148SC

## Supported by
Community
