# Huawei OptiX RTN by SNMP

## Overview

Templates for **Huawei OptiX RTN** microwave radios (RTN 905, 910A, 950A, 980 and 380H) for **Zabbix 7.0**, by SNMP.

They monitor:
- NE information: name, NE ID, IP, model, software version, uptime, NE state
- boards: working state, temperature against the board's own threshold, hardware, software and FPGA versions
- ODUs: RX and TX power, configured TX power, frequencies, T/R spacing, band, transmitter mute, bar code
- radio IF ports: RX/TX modulation, capacity, adaptive modulation and ATPC settings, channel bandwidth, link ID, far-end NE
- 15-minute radio performance: RSL/TSL min/avg/max, SNR, MSE, BER and FEC counters
- Ethernet and radio ports: traffic (instant rate and octet counters), utilization, drops and FCS errors
- active alarms from the NE alarm table (curAlmDataTable), as one problem per alarm with its location
- PTP (IEEE 1588) time synchronisation, PTP ports, system clock state
- PLA groups, IF 1+1 protection, control board (DPS) protection on the RTN 980
- E-LAN services and the VLANs on their ports

Ports, IFs and ODUs are named with their far-end NE name (learned over the radio link), or the port name configured on
the NE, e.g. `ODU 21 (IF 1/1, SITE-B)`.

The file holds six templates:

| Template | Link it to |
|---|---|
| Huawei OptiX RTN by SNMP | Any RTN NE (common items only) |
| Huawei OptiX RTN 905 by SNMP | RTN 905 |
| Huawei OptiX RTN 910A by SNMP | RTN 910A |
| Huawei OptiX RTN 950A by SNMP | RTN 950A |
| Huawei OptiX RTN 980 by SNMP | RTN 980 |
| Huawei OptiX RTN 380H by SNMP | RTN 380H |

Each model template links the base template and adds the items only that model supports (fan, system clock, PLA,
IF 1+1, FEC; DPS on the RTN 980; PLL and far-end NE ID on the RTN 380H). Link **one** template per host: the model
template, or the base template if the model is not listed.

## Requirements

- Zabbix 7.0
- SNMP v2c access to the NE (read community), from the Zabbix server or proxy
- SNMP timeout of the server or proxy (`Timeout=` in zabbix_server.conf / zabbix_proxy.conf) of **15 seconds**: some NEs answer slowly
- Simple checks (ICMP ping) enabled: `fping` installed on the server or proxy

## Setup

1. Import `template_huawei_optix_rtn_snmp.yaml` (Data collection > Templates > Import).
2. Create a host for the NE with an SNMP interface (the NE IP, SNMPv2, the `{$SNMP_COMMUNITY}` macro set to the read community).
3. Link the model template of the NE. The base template's item *Device model* shows the model if you are not sure.
4. Optional: tune the macros below on the host, e.g. a per-link RSL threshold `{$RTN.ODU.RX.WARN:"21"}` for ODU 21.

Discovery rules run about once an hour; use *Execute now* on a rule to fill a new host at once.

In the Zabbix 6.0 template every discovery rule has its own interval (3667 s, 3734 s, ...), so that the table walks of one
NE do not all run in the same second: Zabbix 6.0 schedules the items of one SNMP interface that share an interval at the
same time, and many RTN NEs answer such bursts with genError.

## Author

Saeed Alipour

## License

MIT


## Template: Huawei OptiX RTN by SNMP

Huawei OptiX RTN microwave radios (RTN 905, 910A, 950A, 980, 380H) by SNMP. Common items for all models: NE info, boards and temperatures, ODU power and frequencies, IF modulation and capacity, 15-minute radio performance (RSL/TSL, SNR, MSE), Ethernet/radio port traffic and active alarms. Link the model template (e.g. 'Huawei OptiX RTN 950A by SNMP') instead of this one to get model-specific items too. OIDs from the Huawei OPTIX MIBs, checked against SNMP walks of RTN 905, 910A, 950A, 980 and 380H NEs. Set the SNMP timeout of the server or proxy (Timeout=) to 15 seconds: some NEs answer slowly.

### Macros

| Macro | Default | Description |
|---|---|---|
| `{$RTN.INTERVAL.RADIO}` | `1m` | Poll interval for radio values (ODU power, modulation, capacity). |
| `{$RTN.INTERVAL.TRAFFIC}` | `5m` | Poll interval for Ethernet/radio port traffic. |
| `{$RTN.INTERVAL.PM}` | `5m` | Poll interval for 15-minute performance values (RSL/TSL, SNR, MSE). |
| `{$RTN.INTERVAL.STATUS}` | `5m` | Poll interval for boards, temperatures and status values. |
| `{$RTN.INTERVAL.ALARM}` | `5m` | How often active alarms are discovered (Zabbix 6.0 template; each run loads the server's LLD workers). |
| `{$RTN.INTERVAL.INVENTORY}` | `1h` | Poll interval for configuration and inventory values. |
| `{$RTN.INTERVAL.VERSION}` | `1d` | Poll interval for board versions and ODU bar codes. |
| `{$RTN.INTERVAL.SERVICE}` | `1d` | Poll interval for E-LAN service settings and port VLAN lists. |
| `{$RTN.SNMP.TIMEOUT}` | `15s` | Zabbix 7 template only: timeout of the active-alarm walk (walk[] item). All other items use classic OIDs, which take the proxy's Timeout= setting (set it to 15). |
| `{$RTN.ODU.RX.WARN}` | `-65` | RSL (dBm) below which a warning is raised. Per ODU with the ODU number as context, e.g. {$RTN.ODU.RX.WARN:27}. |
| `{$RTN.ODU.RX.NOSIGNAL}` | `-85` | RSL (dBm) below which the link is considered down. |
| `{$RTN.ODU.RX.DROP}` | `10` | RSL drop (dB) below the 1-day average that raises a warning. |
| `{$RTN.RSL.FADE}` | `10` | Gap (dB) between 15-minute average and minimum RSL that counts as fading. |
| `{$RTN.TEMP.MARGIN}` | `10` | Warn when a board is within this many °C of its own high threshold. |
| `{$RTN.ETH.UTIL.WARN}` | `70` | Port utilization (%) that raises a Warning after {$RTN.ETH.UTIL.PERIOD}. Per port with slot/port as context, e.g. {$RTN.ETH.UTIL.WARN:17/5}. |
| `{$RTN.ETH.UTIL.HIGH}` | `80` | Port utilization (%) that raises an Average problem after {$RTN.ETH.UTIL.PERIOD}. Per port, e.g. {$RTN.ETH.UTIL.HIGH:17/5}. |
| `{$RTN.ETH.UTIL.PERIOD}` | `5m` | How long utilization must stay above a level before a problem opens. |
| `{$RTN.ALARM.EID.IGNORE}` | `^$` | Alarm IDs (curAlmEID) that never raise problems, as a regex. The default ignores nothing. Example for alarms that are often standing conditions: ^(13047\|412\|333)$ = almPassWordNeedChange, almPowerAbnormal (one power input not connected) and almClkNoTraceMode (clock free-run). The alarm value map lists every ID. |
| `{$RTN.ALARM.MIN.ACTIVE}` | `5m` | Flap protection: window in which an alarm must be seen {$RTN.ALARM.MIN.SAMPLES} times. |
| `{$RTN.ALARM.MIN.SAMPLES}` | `4` | Flap protection: polls (one per minute) an alarm must be seen in before its problem opens. |
| `{$RTN.ALARM.NODATA}` | `5m` | An alarm problem closes when its row has been gone from the alarm table this long. |
| `{$RTN.CLOCK.ALERT}` | `1` | 1 = raise clock problems (system clock not tracing, PTP not locked, PTP port faulty). Set 0 on a host whose clock or time runs free by design. |
| `{$RTN.CLOCK.PERIOD}` | `10m` | How long a clock must stay out of the tracing/locked state before a problem opens. |
| `{$RTN.ICMP.LOSS.WARN}` | `20` | ICMP loss (%) warning threshold. |
| `{$RTN.ICMP.RESPONSE.WARN}` | `0.3` | ICMP response time (s) warning threshold. |
| `{$SNMP.TIMEOUT}` | `5m` | No SNMP answer for this long raises a problem. |

### Items

| Name | Key | Interval | Description |
|---|---|---|---|
| NE name | `rtn.ne.name` | {$RTN.INTERVAL.INVENTORY} | NE name configured on the device (optixNeName). sysName is always "Optix product" on these radios. |
| NE ID | `rtn.ne.id` | {$RTN.INTERVAL.INVENTORY} | NE ID (optixNeID). Extended ID = value / 65536, basic ID = value % 65536. |
| NE IP address | `rtn.ne.ip` | {$RTN.INTERVAL.INVENTORY} | NE IP address (optixNeIP). |
| Device model | `rtn.ne.model` | {$RTN.INTERVAL.INVENTORY} | Device type (optixNeDeviceType). |
| NE state | `rtn.ne.state` | {$RTN.INTERVAL.STATUS} | NE status (optixNeState): installing or running. |
| Software version | `rtn.ne.software` | {$RTN.INTERVAL.INVENTORY} | sysDescr. Many NEs leave it empty; where set it holds the software version (e.g. V100R019C10SPC300). |
| Uptime | `rtn.ne.uptime` | {$RTN.INTERVAL.STATUS} | sysUpTime. Note: the 32-bit counter wraps after 497 days, which looks like a restart. |
| SNMP agent availability | `zabbix[host,snmp,available]` | 1m | Zabbix internal check: 0 = SNMP not available, 1 = available. |
| ICMP ping | `icmpping` | 1m |  |
| ICMP loss | `icmppingloss` | 1m |  |
| ICMP response time | `icmppingsec` | 1m |  |
| Active critical alarms | `rtn.alarm.count[critical]` | dependent | Number of active critical alarms (curAlmDataTable), excluding {$RTN.ALARM.EID.IGNORE}. |
| Active major alarms | `rtn.alarm.count[major]` | dependent | Number of active major alarms (curAlmDataTable), excluding {$RTN.ALARM.EID.IGNORE}. |
| Active minor alarms | `rtn.alarm.count[minor]` | dependent | Number of active minor alarms (curAlmDataTable), excluding {$RTN.ALARM.EID.IGNORE}. |

### Triggers

| Name | Severity | Expression |
|---|---|---|
| NE is not in running state | Average | `last(/TEMPLATE/rtn.ne.state)=0` |
| Device has been restarted (uptime < 10m) | Warning | `last(/TEMPLATE/rtn.ne.uptime)<10m` |
| No SNMP data collection | Average | `max(/TEMPLATE/zabbix[host,snmp,available],{$SNMP.TIMEOUT})=0` |
| Unavailable by ICMP ping | High | `max(/TEMPLATE/icmpping,#3)=0` |
| High ICMP ping loss | Warning | `min(/TEMPLATE/icmppingloss,5m)>{$RTN.ICMP.LOSS.WARN} and min(/TEMPLATE/icmppingloss,5m)<100` |
| High ICMP ping response time | Warning | `avg(/TEMPLATE/icmppingsec,5m)>{$RTN.ICMP.RESPONSE.WARN}` |

### Discovery rule: Board discovery

Boards in the subrack (optixLogBoardTable).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#BOARD.NAME}: State | `rtn.board.state[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Board working status (optixPhyBoardState). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#BOARD.NAME}: Board is not working | High | `last(/TEMPLATE/rtn.board.state[{#SNMPINDEX}])=0` |

### Discovery rule: Board version discovery

Hardware (PCB), software and FPGA version of each board (optixPhyBDVerInfo).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#BOARD.NAME}: {#VER.FIELD} version | `rtn.board.version[{#SNMPINDEX},{#VER.KEY}]` | {$RTN.INTERVAL.VERSION} | {#VER.FIELD} version of the board, from its version information (optixPhyBDVerInfo). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#BOARD.NAME}: {#VER.FIELD} version changed | Info | `change(/TEMPLATE/rtn.board.version[{#SNMPINDEX},{#VER.KEY}])=1` |

### Discovery rule: Board temperature discovery

Boards that report a temperature.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#BOARD.NAME}: Temperature | `rtn.board.temp[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Board temperature (optixLogBoardCurTemp). |
| {#BOARD.NAME}: Temperature high threshold | `rtn.board.temp.high[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Upper temperature threshold set on the board (optixLogBoardTempHighTh). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#BOARD.NAME}: Temperature is above the board's high threshold | High | `min(/TEMPLATE/rtn.board.temp[{#SNMPINDEX}],5m)>=last(/TEMPLATE/rtn.board.temp.high[{#SNMPINDEX}])` |
| {#BOARD.NAME}: Temperature is near the board's high threshold | Warning | `min(/TEMPLATE/rtn.board.temp[{#SNMPINDEX}],5m)>=last(/TEMPLATE/rtn.board.temp.high[{#SNMPINDEX}])-{$RTN.TEMP.MARGIN}` |

### Discovery rule: ODU discovery

Outdoor units (optixRtnOduPowerTable, deprecated MIB module that all firmware supports).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#ODU.NAME}: RX power | `rtn.odu.rx.power[{#SNMPINDEX}]` | {$RTN.INTERVAL.RADIO} | Actual received power, RSL (optixRtnOduActualRxPower, 0.1 dBm). |
| {#ODU.NAME}: TX power | `rtn.odu.tx.power[{#SNMPINDEX}]` | {$RTN.INTERVAL.RADIO} | Actual transmit power (optixRtnOduActualTxPower, 0.1 dBm). |
| {#ODU.NAME}: TX power, configured | `rtn.odu.tx.power.cfg[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Configured transmit power (optixRtnOduCfgTxPower). |
| {#ODU.NAME}: Power to be received | `rtn.odu.rx.power.expected[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Receive power the RF port is configured to expect (optixRtnOduCfgToBeRxPower). |
| {#ODU.NAME}: TX frequency | `rtn.odu.tx.freq[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Actual transmit frequency (optixRtnOduActualTxFreq, kHz). |
| {#ODU.NAME}: RX frequency | `rtn.odu.rx.freq[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Actual receive frequency (optixRtnOduActualRxFreq, kHz). |
| {#ODU.NAME}: T/R spacing | `rtn.odu.trspacing[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Configured transmit/receive spacing (optixRtnOduCfgTRSpacing, kHz). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#ODU.NAME}: No received signal | High | `max(/TEMPLATE/rtn.odu.rx.power[{#SNMPINDEX}],3m)<{$RTN.ODU.RX.NOSIGNAL}` |
| {#ODU.NAME}: Low received signal level | Warning | `max(/TEMPLATE/rtn.odu.rx.power[{#SNMPINDEX}],5m)<{$RTN.ODU.RX.WARN:"{#ODU.SLOT}"}` |
| {#ODU.NAME}: RX power dropped below its daily average | Warning | `avg(/TEMPLATE/rtn.odu.rx.power[{#SNMPINDEX}],10m)<avg(/TEMPLATE/rtn.odu.rx.power[{#SNMPINDEX}],1d)-{$RTN.ODU.RX.DROP}` |
| {#ODU.NAME}: TX frequency changed | Info | `change(/TEMPLATE/rtn.odu.tx.freq[{#SNMPINDEX}])<>0` |

| Graph prototype | Items |
|---|---|
| {#ODU.NAME}: RX and TX power | `rtn.odu.rx.power[{#SNMPINDEX}]`, `rtn.odu.tx.power[{#SNMPINDEX}]` |
| {#ODU.NAME}: TX and RX frequency | `rtn.odu.tx.freq[{#SNMPINDEX}]`, `rtn.odu.rx.freq[{#SNMPINDEX}]` |
| {#ODU.NAME}: T/R spacing | `rtn.odu.trspacing[{#SNMPINDEX}]` |

### Discovery rule: ODU barcode discovery

ODU bar codes (not reported by every ODU).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#ODU.NAME}: Barcode | `rtn.odu.barcode[{#SNMPINDEX}]` | {$RTN.INTERVAL.VERSION} | ODU bar code / serial number (optixRtnOduFactoryInfo). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#ODU.NAME}: ODU was replaced (barcode changed) | Info | `change(/TEMPLATE/rtn.odu.barcode[{#SNMPINDEX}])=1` |

### Discovery rule: ODU frequency band discovery

ODUs that report their frequency band.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#ODU.NAME}: Frequency band | `rtn.odu.band[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | ODU frequency band (optixRtnOduFreqBand). |

### Discovery rule: ODU transmitter state discovery

ODUs that report their actual transmitter state.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#ODU.NAME}: Transmitter state | `rtn.odu.tx.state[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Actual transmitter state (optixRtnOduActualWorkState): muted or unmuted. |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#ODU.NAME}: Transmitter is muted | Average | `last(/TEMPLATE/rtn.odu.tx.state[{#SNMPINDEX}])=0` |

### Discovery rule: Radio IF discovery

Radio IF ports in use (modulation not 0).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: RX modulation | `rtn.if.rx.mode[{#SNMPINDEX}]` | {$RTN.INTERVAL.RADIO} | Current receive modulation (optixRtnIFPortCurrRxMode). |
| {#IF.NAME}: TX modulation | `rtn.if.tx.mode[{#SNMPINDEX}]` | {$RTN.INTERVAL.RADIO} | Current transmit modulation (optixRtnIFPortCurrTxMode). |
| {#IF.NAME}: RX capacity | `rtn.if.rx.capacity[{#SNMPINDEX}]` | {$RTN.INTERVAL.RADIO} | Current receive service capacity with adaptive modulation (optixRtnIFPortAMCurrRxRate, Mbit/s). |
| {#IF.NAME}: TX capacity | `rtn.if.tx.capacity[{#SNMPINDEX}]` | {$RTN.INTERVAL.RADIO} | Current transmit service capacity (optixRtnIFPortAMCurrSendRate, Mbit/s). |
| {#IF.NAME}: Full capacity | `rtn.if.capacity.peak[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Full AM service capacity (optixRtnIFPortAMPeakRate, Mbit/s). |
| {#IF.NAME}: Guaranteed capacity | `rtn.if.capacity.guaranteed[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Guaranteed AM service capacity (optixRtnIFPortAMGuaranteeRate, Mbit/s). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#IF.NAME}: Radio link down (no modulation) | High | `last(/TEMPLATE/rtn.if.rx.mode[{#SNMPINDEX}])=0` |
| {#IF.NAME}: RX modulation changed | Info | `change(/TEMPLATE/rtn.if.rx.mode[{#SNMPINDEX}])<>0` |
| {#IF.NAME}: Running below full capacity (modulation downshift) | Warning | `max(/TEMPLATE/rtn.if.rx.capacity[{#SNMPINDEX}],10m)<last(/TEMPLATE/rtn.if.capacity.peak[{#SNMPINDEX}]) and last(/TEMPLATE/rtn.if.rx.capacity[{#SNMPINDEX}])>0` |

| Graph prototype | Items |
|---|---|
| {#IF.NAME}: Capacity | `rtn.if.rx.capacity[{#SNMPINDEX}]`, `rtn.if.tx.capacity[{#SNMPINDEX}]` |
| {#IF.NAME}: Modulation | `rtn.if.rx.mode[{#SNMPINDEX}]`, `rtn.if.tx.mode[{#SNMPINDEX}]` |

### Discovery rule: Radio IF settings discovery

Link ID, adaptive modulation and ATPC settings of the radio IF ports in use.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: Link ID | `rtn.if.link.id[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Radio link ID configured on the port (optixRtnIFPortCfgLinkID). Both ends of a link must use the same ID. |
| {#IF.NAME}: AM status | `rtn.if.am.state[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Adaptive modulation enabled or disabled (optixRtnIFPortAMEnableStatus). |
| {#IF.NAME}: Min modulation | `rtn.if.am.min[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Lowest modulation adaptive modulation may use (optixRtnIFPortAMBottomMod). 0 when AM is disabled (the NE reports -1). |
| {#IF.NAME}: Max modulation | `rtn.if.am.max[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Highest modulation adaptive modulation may use (optixRtnIFPortAMPeakMod). 0 when AM is disabled (the NE reports -1). |
| {#IF.NAME}: ATPC | `rtn.if.atpc.state[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Automatic transmit power control enabled or disabled (optixRtnIFATPCEnableState). |
| {#IF.NAME}: ATPC upper threshold | `rtn.if.atpc.high[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | ATPC upper RSL threshold (optixRtnIFATPCHighThreshold, 0.1 dBm). |
| {#IF.NAME}: ATPC lower threshold | `rtn.if.atpc.low[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | ATPC lower RSL threshold (optixRtnIFATPCLowThreshold, 0.1 dBm). |

### Discovery rule: Radio IF channel bandwidth discovery

IF ports that report their channel bandwidth (not RTN 380H and some old RTN 950A firmware).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: Channel bandwidth | `rtn.if.bw[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Radio channel bandwidth (optixRtnIFPortChannelBandWidth). |

### Discovery rule: Radio link neighbour discovery

Radio ports that report a far-end NE name.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: Far-end NE | `rtn.if.farend[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Name of the NE at the other end of this radio link, as the radio learns it over the air (optixRtnNeighbourNeName). The port name typed on the NE is not always up to date. |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#IF.ID}: Far-end NE changed to {ITEM.LASTVALUE} | Warning | `change(/TEMPLATE/rtn.if.farend[{#SNMPINDEX}])=1 and length(last(/TEMPLATE/rtn.if.farend[{#SNMPINDEX}]))>0` |

### Discovery rule: Radio IF performance discovery

Radio IF performance: SNR, MSE and BER of the current 15-minute period.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: SNR, min | `rtn.if.pm.snr.min[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Minimum SNR (pmIfSnrMin, 0.1 dB). Current 15-minute PM period. |
| {#IF.NAME}: SNR, avg | `rtn.if.pm.snr.avg[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Average SNR (pmIfSnrAvg, 0.1 dB). Current 15-minute PM period. |
| {#IF.NAME}: SNR, max | `rtn.if.pm.snr.max[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Maximum SNR (pmIfSnrMax, 0.1 dB). Current 15-minute PM period. |
| {#IF.NAME}: MSE, avg | `rtn.if.pm.mse.avg[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Average MSE (pmIfMseAvg, 0.1 dB). Current 15-minute PM period. |
| {#IF.NAME}: MSE, worst | `rtn.if.pm.mse.max[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Highest (worst) MSE (pmIfMseMax, 0.1 dB). Current 15-minute PM period. |
| {#IF.NAME}: MSE, best | `rtn.if.pm.mse.min[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Lowest (best) MSE (pmIfMseMin, 0.1 dB). Current 15-minute PM period. |
| {#IF.NAME}: BER | `rtn.if.pm.ber[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Bit error rate counter (pmIfBer). Current 15-minute PM period. |

| Graph prototype | Items |
|---|---|
| {#IF.NAME}: SNR | `rtn.if.pm.snr.min[{#SNMPINDEX}]`, `rtn.if.pm.snr.avg[{#SNMPINDEX}]`, `rtn.if.pm.snr.max[{#SNMPINDEX}]` |
| {#IF.NAME}: MSE | `rtn.if.pm.mse.min[{#SNMPINDEX}]`, `rtn.if.pm.mse.avg[{#SNMPINDEX}]`, `rtn.if.pm.mse.max[{#SNMPINDEX}]` |

### Discovery rule: ODU performance discovery

ODU performance: RSL and TSL of the current 15-minute period.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#ODU.NAME}: RSL, min | `rtn.odu.pm.rsl.min[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Minimum received signal level (pmRslMin, 0.1 dBm). Current 15-minute PM period. |
| {#ODU.NAME}: RSL, avg | `rtn.odu.pm.rsl.avg[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Average received signal level (pmRslAvg, 0.1 dBm). Current 15-minute PM period. |
| {#ODU.NAME}: RSL, max | `rtn.odu.pm.rsl.max[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Maximum received signal level (pmRslMax, 0.1 dBm). Current 15-minute PM period. |
| {#ODU.NAME}: TSL, min | `rtn.odu.pm.tsl.min[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Minimum transmit signal level (pmTslMin, 0.1 dBm). Current 15-minute PM period. |
| {#ODU.NAME}: TSL, avg | `rtn.odu.pm.tsl.avg[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Average transmit signal level (pmTslAvg, 0.1 dBm). Current 15-minute PM period. |
| {#ODU.NAME}: TSL, max | `rtn.odu.pm.tsl.max[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Maximum transmit signal level (pmTslMax, 0.1 dBm). Current 15-minute PM period. |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#ODU.NAME}: Fading: RSL dipped {$RTN.RSL.FADE} dB below average in this 15-minute period | Warning | `last(/TEMPLATE/rtn.odu.pm.rsl.avg[{#SNMPINDEX}])-last(/TEMPLATE/rtn.odu.pm.rsl.min[{#SNMPINDEX}])>{$RTN.RSL.FADE}` |

| Graph prototype | Items |
|---|---|
| {#ODU.NAME}: RSL (15-minute min/avg/max) | `rtn.odu.pm.rsl.min[{#SNMPINDEX}]`, `rtn.odu.pm.rsl.avg[{#SNMPINDEX}]`, `rtn.odu.pm.rsl.max[{#SNMPINDEX}]` |

### Discovery rule: Ethernet port discovery

Ethernet and radio ports with performance monitoring (ethPortPmCurTable).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PORT.NAME}: Bits received | `rtn.eth.in[{#SNMPINDEX}]` | {$RTN.INTERVAL.TRAFFIC} | Received bits per second, averaged from the cumulative RX octet counter (pmRXOCTETS). The NE can stop updating the counter for 1-2 minutes and then catch up, so single values can be too low and then too high: use RX rate (instant) for current traffic. |
| {#PORT.NAME}: Bits sent | `rtn.eth.out[{#SNMPINDEX}]` | {$RTN.INTERVAL.TRAFFIC} | Sent bits per second, averaged from the cumulative TX octet counter (pmTXOCTETS). The NE can stop updating the counter for 1-2 minutes and then catch up, so single values can be too low and then too high: use TX rate (instant) for current traffic. |
| {#PORT.NAME}: RX rate (instant) | `rtn.eth.in.rate[{#SNMPINDEX}]` | {$RTN.INTERVAL.TRAFFIC} | Instant receive rate reported by the NE (pmRXBPS). |
| {#PORT.NAME}: TX rate (instant) | `rtn.eth.out.rate[{#SNMPINDEX}]` | {$RTN.INTERVAL.TRAFFIC} | Instant transmit rate reported by the NE (pmTXBPS). |

| Graph prototype | Items |
|---|---|
| {#PORT.NAME}: Traffic | `rtn.eth.in.rate[{#SNMPINDEX}]`, `rtn.eth.out.rate[{#SNMPINDEX}]` |

### Discovery rule: Ethernet port utilization discovery

Ports that report bandwidth utilization.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PORT.NAME}: RX utilization | `rtn.eth.util.rx[{#SNMPINDEX}]` | {$RTN.INTERVAL.TRAFFIC} | Receive bandwidth utilization (pmPORTRXBWUTILIZATION, 0.01 %). |
| {#PORT.NAME}: TX utilization | `rtn.eth.util.tx[{#SNMPINDEX}]` | {$RTN.INTERVAL.TRAFFIC} | Transmit bandwidth utilization (pmPORTTXBWUTILIZATION, 0.01 %). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#PORT.NAME}: RX utilization above {$RTN.ETH.UTIL.HIGH}% | Average | `min(/TEMPLATE/rtn.eth.util.rx[{#SNMPINDEX}],{$RTN.ETH.UTIL.PERIOD})>{$RTN.ETH.UTIL.HIGH:"{#PORT.SP}"}` |
| {#PORT.NAME}: RX utilization above {$RTN.ETH.UTIL.WARN}% | Warning | `min(/TEMPLATE/rtn.eth.util.rx[{#SNMPINDEX}],{$RTN.ETH.UTIL.PERIOD})>{$RTN.ETH.UTIL.WARN:"{#PORT.SP}"}` |
| {#PORT.NAME}: TX utilization above {$RTN.ETH.UTIL.HIGH}% | Average | `min(/TEMPLATE/rtn.eth.util.tx[{#SNMPINDEX}],{$RTN.ETH.UTIL.PERIOD})>{$RTN.ETH.UTIL.HIGH:"{#PORT.SP}"}` |
| {#PORT.NAME}: TX utilization above {$RTN.ETH.UTIL.WARN}% | Warning | `min(/TEMPLATE/rtn.eth.util.tx[{#SNMPINDEX}],{$RTN.ETH.UTIL.PERIOD})>{$RTN.ETH.UTIL.WARN:"{#PORT.SP}"}` |

### Discovery rule: Ethernet port RX drop discovery

Ports that report received packet drops.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PORT.NAME}: RX dropped packets | `rtn.eth.drop.in[{#SNMPINDEX}]` | {$RTN.INTERVAL.TRAFFIC} | Received packets dropped (pmRXDROPPKTS). |

### Discovery rule: Ethernet port TX drop discovery

Ports that report transmitted packet drops.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PORT.NAME}: TX dropped packets | `rtn.eth.drop.out[{#SNMPINDEX}]` | {$RTN.INTERVAL.TRAFFIC} | Transmit packets dropped (pmTXDROPPKTS). |

### Discovery rule: Ethernet port FCS discovery

Ports that report FCS errors.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PORT.NAME}: FCS errors | `rtn.eth.fcs[{#SNMPINDEX}]` | {$RTN.INTERVAL.TRAFFIC} | Frames with FCS errors per second (pmETHFCS). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#PORT.NAME}: FCS errors | Warning | `min(/TEMPLATE/rtn.eth.fcs[{#SNMPINDEX}],5m)>0` |

### Discovery rule: PTP discovery

PTP (IEEE 1588) time synchronisation, on NEs where it is enabled.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| PTP time lock state | `rtn.ptp.time.lock[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | PTP time lock state (optixPktPtpTimeLockState). |
| PTP clock state | `rtn.ptp.clock.state[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | PTP clock tracking state (optixPktPtpClockState): free-run, locked or holdover out of spec. |
| PTP frequency lock state | `rtn.ptp.freq.lock[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | PTP clock (frequency) lock state (optixPktPtpLockState). |
| PTP source mode | `rtn.ptp.src.mode[{#SNMPINDEX}]` | {$RTN.INTERVAL.INVENTORY} | Time source mode (optixPktPtpSrcMode): PTP, or the physical clock (no time source). |
| PTP grandmaster ID (high) | `rtn.ptp.gm.high[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Upper 32 bits of the grandmaster clock ID (optixPktPtpGrandMasterGrandmasterID1). |
| PTP grandmaster ID (low) | `rtn.ptp.gm.low[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Lower 32 bits of the grandmaster clock ID (optixPktPtpGrandMasterGrandmasterID2). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| PTP clock is not locked | Average | `((count(/TEMPLATE/rtn.ptp.clock.state[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD},"eq",1)=0 and count(/TEMPLATE/rtn.ptp.clock.state[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD})>0) or (count(/TEMPLATE/rtn.ptp.time.lock[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD},"eq",1)=0 and count(/TEMPLATE/rtn.ptp.time.lock[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD})>0)) and {$RTN.CLOCK.ALERT}=1` |

### Discovery rule: PTP port discovery

Ports with PTP enabled (optixPktPtpClockTable).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PTP.PORT.NAME}: State | `rtn.ptp.port.state[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | PTP port state (optixPktPtpClockRealState): master, slave, passive, faulty, ... |
| {#PTP.PORT.NAME}: Link state | `rtn.ptp.port.link[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | PTP port link state (optixPktPtpClockLinkState). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#PTP.PORT.NAME}: PTP port is faulty | Warning | `(count(/TEMPLATE/rtn.ptp.port.state[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD},"ne",2)=0 and count(/TEMPLATE/rtn.ptp.port.state[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD})>0) and {$RTN.CLOCK.ALERT}=1` |

### Discovery rule: E-LAN service discovery

E-LAN (multipoint Ethernet) services configured on the NE (optixElanTable).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#ELAN.LABEL}: Tag type | `rtn.elan.tagmode[{#SNMPINDEX}]` | {$RTN.INTERVAL.SERVICE} | Tag type of the E-LAN service (optixElanTagMode): tag-aware, C-aware or S-aware. |
| {#ELAN.LABEL}: MAC address learning | `rtn.elan.maclearn[{#SNMPINDEX}]` | {$RTN.INTERVAL.SERVICE} | Self-learning of MAC addresses on the E-LAN service (optixElanMacLearnEnable). |

### Discovery rule: E-LAN UNI discovery

Ports (UNIs) of the E-LAN services and the VLANs they carry (optixElanUniTable).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#ELAN.LABEL}: {#UNI.NAME}: VLAN count | `rtn.elan.uni.vlans[{#SNMPINDEX}]` | {$RTN.INTERVAL.SERVICE} | Number of VLANs this port carries in the E-LAN service (optixElanUniVlanNum). |
| {#ELAN.LABEL}: {#UNI.NAME}: VLANs | `rtn.elan.uni.vlanlist[{#SNMPINDEX}]` | {$RTN.INTERVAL.SERVICE} | VLANs this port carries in the E-LAN service, e.g. 3,8,11-12,14 (optixElanUniVlanlist). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#ELAN.LABEL}: {#UNI.ID}: VLANs changed to {ITEM.LASTVALUE} | Info | `change(/TEMPLATE/rtn.elan.uni.vlanlist[{#SNMPINDEX}])=1` |

### Discovery rule: Active alarm discovery

One entity per active critical/major/minor alarm (curAlmDataTable). Alarm IDs matching {$RTN.ALARM.EID.IGNORE} are skipped.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| Alarm {#ALM.NAME} ({#ALM.LOCATION}): Severity | `rtn.alarm.severity[{#SNMPINDEX}]` | dependent | Severity of an active alarm (curAlmSeverity). Alarm ID {#ALM.EID}. |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#ALM.NAME} ({#ALM.LOCATION}) [critical] | High | `last(/TEMPLATE/rtn.alarm.severity[{#SNMPINDEX}])=1 and nodata(/TEMPLATE/rtn.alarm.severity[{#SNMPINDEX}],{$RTN.ALARM.NODATA})=0 and count(/TEMPLATE/rtn.alarm.severity[{#SNMPINDEX}],{$RTN.ALARM.MIN.ACTIVE})>={$RTN.ALARM.MIN.SAMPLES}` |
| {#ALM.NAME} ({#ALM.LOCATION}) [major] | Average | `last(/TEMPLATE/rtn.alarm.severity[{#SNMPINDEX}])=2 and nodata(/TEMPLATE/rtn.alarm.severity[{#SNMPINDEX}],{$RTN.ALARM.NODATA})=0 and count(/TEMPLATE/rtn.alarm.severity[{#SNMPINDEX}],{$RTN.ALARM.MIN.ACTIVE})>={$RTN.ALARM.MIN.SAMPLES}` |
| {#ALM.NAME} ({#ALM.LOCATION}) [minor] | Warning | `last(/TEMPLATE/rtn.alarm.severity[{#SNMPINDEX}])=3 and nodata(/TEMPLATE/rtn.alarm.severity[{#SNMPINDEX}],{$RTN.ALARM.NODATA})=0 and count(/TEMPLATE/rtn.alarm.severity[{#SNMPINDEX}],{$RTN.ALARM.MIN.ACTIVE})>={$RTN.ALARM.MIN.SAMPLES}` |

### Graphs

| Graph | Items |
|---|---|
| ICMP response time and loss | `icmppingsec`, `icmppingloss` |
| Uptime | `rtn.ne.uptime` |

## Template: Huawei OptiX RTN 905 by SNMP

Huawei OptiX RTN 905 by SNMP. Links 'Huawei OptiX RTN by SNMP' and adds the subrack items: fan, system clock, PLA groups, IF 1+1 protection and FEC counters.


### Items

| Name | Key | Interval | Description |
|---|---|---|---|
| Fan speed | `rtn.fan.speed` | {$RTN.INTERVAL.STATUS} | Fan speed (optixFanSpeed). |

### Triggers

| Name | Severity | Expression |
|---|---|---|
| Fan has stopped | Average | `last(/TEMPLATE/rtn.fan.speed)=4` |

### Discovery rule: System clock discovery

System clock (one row, indexed by the control board slot).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| Clock work mode | `rtn.clock.mode[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | System clock work mode (optixSdhSysSynWorkMode) on the control board in slot {#SNMPINDEX}: tracing, holdover or free-run. |

| Trigger prototype | Severity | Expression |
|---|---|---|
| Clock is not tracing (slot {#SNMPINDEX}) | Warning | `(count(/TEMPLATE/rtn.clock.mode[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD},"eq",1)=0 and count(/TEMPLATE/rtn.clock.mode[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD})>0) and {$RTN.CLOCK.ALERT}=1` |

### Discovery rule: PLA group discovery

Physical link aggregation (PLA/EPLA) groups.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PLA.NAME}: Main unit link status | `rtn.pla.main.link[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Link status of the main unit (optixRtnPhyLagPGMainLinkStatus). |
| {#PLA.NAME}: Main unit hardware status | `rtn.pla.main.hw[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Hardware status of the main unit (optixRtnPhyLagPGMainHardStatus). |
| {#PLA.NAME}: Main unit role | `rtn.pla.main.role[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Whether the main unit currently works as master (optixRtnPhyLagPGMainPuWorkStatus). |
| {#PLA.NAME}: Slave unit link status | `rtn.pla.slave.link[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Link status of slave unit 1 (optixRtnPhyLagPGStatePu1LinkStatus). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#PLA.NAME}: Main unit link is abnormal | Average | `last(/TEMPLATE/rtn.pla.main.link[{#SNMPINDEX}])=1` |
| {#PLA.NAME}: Slave unit link is abnormal | Average | `last(/TEMPLATE/rtn.pla.slave.link[{#SNMPINDEX}])=1` |

### Discovery rule: IF 1+1 protection discovery

IF 1+1 HSB/SD/FD protection groups.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| IF 1+1 group {#SNMPINDEX}: Working board state | `rtn.if1p1.work[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevWorkBoardState. |
| IF 1+1 group {#SNMPINDEX}: Protection board state | `rtn.if1p1.prot[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevProtectBoardState. |
| IF 1+1 group {#SNMPINDEX}: Switch request | `rtn.if1p1.request[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevSwtichRequest. |
| IF 1+1 group {#SNMPINDEX}: Current working board | `rtn.if1p1.active[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Slot of the board currently carrying traffic (optixRtn1j1PGStateDevWorkBoardID). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| IF 1+1 group {#SNMPINDEX}: Working board failed | Average | `last(/TEMPLATE/rtn.if1p1.work[{#SNMPINDEX}])=1` |
| IF 1+1 group {#SNMPINDEX}: Protection board failed | Average | `last(/TEMPLATE/rtn.if1p1.prot[{#SNMPINDEX}])=1` |
| IF 1+1 group {#SNMPINDEX}: Protection switched | Info | `change(/TEMPLATE/rtn.if1p1.request[{#SNMPINDEX}])<>0` |

### Discovery rule: Radio IF FEC discovery

FEC error counters (not on RTN 380H).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: FEC corrected errors | `rtn.if.pm.fec[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Errors corrected by FEC in the current 15-minute period (pmFecBefCorEr). |

## Template: Huawei OptiX RTN 910A by SNMP

Huawei OptiX RTN 910A by SNMP. Links 'Huawei OptiX RTN by SNMP' and adds the subrack items: fan, system clock, PLA groups, IF 1+1 protection and FEC counters.


### Items

| Name | Key | Interval | Description |
|---|---|---|---|
| Fan speed | `rtn.fan.speed` | {$RTN.INTERVAL.STATUS} | Fan speed (optixFanSpeed). |

### Triggers

| Name | Severity | Expression |
|---|---|---|
| Fan has stopped | Average | `last(/TEMPLATE/rtn.fan.speed)=4` |

### Discovery rule: System clock discovery

System clock (one row, indexed by the control board slot).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| Clock work mode | `rtn.clock.mode[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | System clock work mode (optixSdhSysSynWorkMode) on the control board in slot {#SNMPINDEX}: tracing, holdover or free-run. |

| Trigger prototype | Severity | Expression |
|---|---|---|
| Clock is not tracing (slot {#SNMPINDEX}) | Warning | `(count(/TEMPLATE/rtn.clock.mode[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD},"eq",1)=0 and count(/TEMPLATE/rtn.clock.mode[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD})>0) and {$RTN.CLOCK.ALERT}=1` |

### Discovery rule: PLA group discovery

Physical link aggregation (PLA/EPLA) groups.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PLA.NAME}: Main unit link status | `rtn.pla.main.link[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Link status of the main unit (optixRtnPhyLagPGMainLinkStatus). |
| {#PLA.NAME}: Main unit hardware status | `rtn.pla.main.hw[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Hardware status of the main unit (optixRtnPhyLagPGMainHardStatus). |
| {#PLA.NAME}: Main unit role | `rtn.pla.main.role[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Whether the main unit currently works as master (optixRtnPhyLagPGMainPuWorkStatus). |
| {#PLA.NAME}: Slave unit link status | `rtn.pla.slave.link[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Link status of slave unit 1 (optixRtnPhyLagPGStatePu1LinkStatus). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#PLA.NAME}: Main unit link is abnormal | Average | `last(/TEMPLATE/rtn.pla.main.link[{#SNMPINDEX}])=1` |
| {#PLA.NAME}: Slave unit link is abnormal | Average | `last(/TEMPLATE/rtn.pla.slave.link[{#SNMPINDEX}])=1` |

### Discovery rule: IF 1+1 protection discovery

IF 1+1 HSB/SD/FD protection groups.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| IF 1+1 group {#SNMPINDEX}: Working board state | `rtn.if1p1.work[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevWorkBoardState. |
| IF 1+1 group {#SNMPINDEX}: Protection board state | `rtn.if1p1.prot[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevProtectBoardState. |
| IF 1+1 group {#SNMPINDEX}: Switch request | `rtn.if1p1.request[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevSwtichRequest. |
| IF 1+1 group {#SNMPINDEX}: Current working board | `rtn.if1p1.active[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Slot of the board currently carrying traffic (optixRtn1j1PGStateDevWorkBoardID). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| IF 1+1 group {#SNMPINDEX}: Working board failed | Average | `last(/TEMPLATE/rtn.if1p1.work[{#SNMPINDEX}])=1` |
| IF 1+1 group {#SNMPINDEX}: Protection board failed | Average | `last(/TEMPLATE/rtn.if1p1.prot[{#SNMPINDEX}])=1` |
| IF 1+1 group {#SNMPINDEX}: Protection switched | Info | `change(/TEMPLATE/rtn.if1p1.request[{#SNMPINDEX}])<>0` |

### Discovery rule: Radio IF FEC discovery

FEC error counters (not on RTN 380H).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: FEC corrected errors | `rtn.if.pm.fec[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Errors corrected by FEC in the current 15-minute period (pmFecBefCorEr). |

## Template: Huawei OptiX RTN 950A by SNMP

Huawei OptiX RTN 950A by SNMP. Links 'Huawei OptiX RTN by SNMP' and adds the subrack items: fan, system clock, PLA groups, IF 1+1 protection and FEC counters.


### Items

| Name | Key | Interval | Description |
|---|---|---|---|
| Fan speed | `rtn.fan.speed` | {$RTN.INTERVAL.STATUS} | Fan speed (optixFanSpeed). |

### Triggers

| Name | Severity | Expression |
|---|---|---|
| Fan has stopped | Average | `last(/TEMPLATE/rtn.fan.speed)=4` |

### Discovery rule: System clock discovery

System clock (one row, indexed by the control board slot).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| Clock work mode | `rtn.clock.mode[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | System clock work mode (optixSdhSysSynWorkMode) on the control board in slot {#SNMPINDEX}: tracing, holdover or free-run. |

| Trigger prototype | Severity | Expression |
|---|---|---|
| Clock is not tracing (slot {#SNMPINDEX}) | Warning | `(count(/TEMPLATE/rtn.clock.mode[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD},"eq",1)=0 and count(/TEMPLATE/rtn.clock.mode[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD})>0) and {$RTN.CLOCK.ALERT}=1` |

### Discovery rule: PLA group discovery

Physical link aggregation (PLA/EPLA) groups.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PLA.NAME}: Main unit link status | `rtn.pla.main.link[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Link status of the main unit (optixRtnPhyLagPGMainLinkStatus). |
| {#PLA.NAME}: Main unit hardware status | `rtn.pla.main.hw[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Hardware status of the main unit (optixRtnPhyLagPGMainHardStatus). |
| {#PLA.NAME}: Main unit role | `rtn.pla.main.role[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Whether the main unit currently works as master (optixRtnPhyLagPGMainPuWorkStatus). |
| {#PLA.NAME}: Slave unit link status | `rtn.pla.slave.link[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Link status of slave unit 1 (optixRtnPhyLagPGStatePu1LinkStatus). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#PLA.NAME}: Main unit link is abnormal | Average | `last(/TEMPLATE/rtn.pla.main.link[{#SNMPINDEX}])=1` |
| {#PLA.NAME}: Slave unit link is abnormal | Average | `last(/TEMPLATE/rtn.pla.slave.link[{#SNMPINDEX}])=1` |

### Discovery rule: IF 1+1 protection discovery

IF 1+1 HSB/SD/FD protection groups.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| IF 1+1 group {#SNMPINDEX}: Working board state | `rtn.if1p1.work[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevWorkBoardState. |
| IF 1+1 group {#SNMPINDEX}: Protection board state | `rtn.if1p1.prot[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevProtectBoardState. |
| IF 1+1 group {#SNMPINDEX}: Switch request | `rtn.if1p1.request[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevSwtichRequest. |
| IF 1+1 group {#SNMPINDEX}: Current working board | `rtn.if1p1.active[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Slot of the board currently carrying traffic (optixRtn1j1PGStateDevWorkBoardID). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| IF 1+1 group {#SNMPINDEX}: Working board failed | Average | `last(/TEMPLATE/rtn.if1p1.work[{#SNMPINDEX}])=1` |
| IF 1+1 group {#SNMPINDEX}: Protection board failed | Average | `last(/TEMPLATE/rtn.if1p1.prot[{#SNMPINDEX}])=1` |
| IF 1+1 group {#SNMPINDEX}: Protection switched | Info | `change(/TEMPLATE/rtn.if1p1.request[{#SNMPINDEX}])<>0` |

### Discovery rule: Radio IF FEC discovery

FEC error counters (not on RTN 380H).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: FEC corrected errors | `rtn.if.pm.fec[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Errors corrected by FEC in the current 15-minute period (pmFecBefCorEr). |

## Template: Huawei OptiX RTN 980 by SNMP

Huawei OptiX RTN 980 by SNMP. Links 'Huawei OptiX RTN by SNMP' and adds the subrack items: fan, system clock, PLA groups, IF 1+1 protection and FEC counters. Adds control board (DPS) protection.


### Items

| Name | Key | Interval | Description |
|---|---|---|---|
| Fan speed | `rtn.fan.speed` | {$RTN.INTERVAL.STATUS} | Fan speed (optixFanSpeed). |

### Triggers

| Name | Severity | Expression |
|---|---|---|
| Fan has stopped | Average | `last(/TEMPLATE/rtn.fan.speed)=4` |

### Discovery rule: System clock discovery

System clock (one row, indexed by the control board slot).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| Clock work mode | `rtn.clock.mode[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | System clock work mode (optixSdhSysSynWorkMode) on the control board in slot {#SNMPINDEX}: tracing, holdover or free-run. |

| Trigger prototype | Severity | Expression |
|---|---|---|
| Clock is not tracing (slot {#SNMPINDEX}) | Warning | `(count(/TEMPLATE/rtn.clock.mode[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD},"eq",1)=0 and count(/TEMPLATE/rtn.clock.mode[{#SNMPINDEX}],{$RTN.CLOCK.PERIOD})>0) and {$RTN.CLOCK.ALERT}=1` |

### Discovery rule: PLA group discovery

Physical link aggregation (PLA/EPLA) groups.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#PLA.NAME}: Main unit link status | `rtn.pla.main.link[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Link status of the main unit (optixRtnPhyLagPGMainLinkStatus). |
| {#PLA.NAME}: Main unit hardware status | `rtn.pla.main.hw[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Hardware status of the main unit (optixRtnPhyLagPGMainHardStatus). |
| {#PLA.NAME}: Main unit role | `rtn.pla.main.role[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Whether the main unit currently works as master (optixRtnPhyLagPGMainPuWorkStatus). |
| {#PLA.NAME}: Slave unit link status | `rtn.pla.slave.link[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Link status of slave unit 1 (optixRtnPhyLagPGStatePu1LinkStatus). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#PLA.NAME}: Main unit link is abnormal | Average | `last(/TEMPLATE/rtn.pla.main.link[{#SNMPINDEX}])=1` |
| {#PLA.NAME}: Slave unit link is abnormal | Average | `last(/TEMPLATE/rtn.pla.slave.link[{#SNMPINDEX}])=1` |

### Discovery rule: IF 1+1 protection discovery

IF 1+1 HSB/SD/FD protection groups.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| IF 1+1 group {#SNMPINDEX}: Working board state | `rtn.if1p1.work[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevWorkBoardState. |
| IF 1+1 group {#SNMPINDEX}: Protection board state | `rtn.if1p1.prot[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevProtectBoardState. |
| IF 1+1 group {#SNMPINDEX}: Switch request | `rtn.if1p1.request[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | optixRtn1j1PGDevSwtichRequest. |
| IF 1+1 group {#SNMPINDEX}: Current working board | `rtn.if1p1.active[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Slot of the board currently carrying traffic (optixRtn1j1PGStateDevWorkBoardID). |

| Trigger prototype | Severity | Expression |
|---|---|---|
| IF 1+1 group {#SNMPINDEX}: Working board failed | Average | `last(/TEMPLATE/rtn.if1p1.work[{#SNMPINDEX}])=1` |
| IF 1+1 group {#SNMPINDEX}: Protection board failed | Average | `last(/TEMPLATE/rtn.if1p1.prot[{#SNMPINDEX}])=1` |
| IF 1+1 group {#SNMPINDEX}: Protection switched | Info | `change(/TEMPLATE/rtn.if1p1.request[{#SNMPINDEX}])<>0` |

### Discovery rule: Radio IF FEC discovery

FEC error counters (not on RTN 380H).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: FEC corrected errors | `rtn.if.pm.fec[{#SNMPINDEX}]` | {$RTN.INTERVAL.PM} | Errors corrected by FEC in the current 15-minute period (pmFecBefCorEr). |

### Discovery rule: Control board protection discovery

DPS (control board) protection groups, RTN 980 only.

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| DPS group {#SNMPINDEX}: State | `rtn.dps.state[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Control/cross-connect board protection group state (optixDpsState). "Adding" is commonly reported as the steady state. |
| DPS group {#SNMPINDEX}: Working board | `rtn.dps.working[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | Slot of the first protection unit (optixDpsFstBid). |

## Template: Huawei OptiX RTN 380H by SNMP

Huawei OptiX RTN 380H (full-outdoor E-band radio) by SNMP. Links 'Huawei OptiX RTN by SNMP' and adds clock PLL state and far-end NE identification.


### Items

| Name | Key | Interval | Description |
|---|---|---|---|
| Clock PLL lock state | `rtn.clock.pll` | {$RTN.INTERVAL.STATUS} | System clock PLL lock state (optixpktSYSclkpllLockstate). |
| Clock work mode | `rtn.clock.mode` | {$RTN.INTERVAL.STATUS} | Packet clock work mode (optixpktSysSynWorkMode): tracing, holdover or free-run. |
| Power mode | `rtn.power.mode` | {$RTN.INTERVAL.INVENTORY} | NE power mode (optixRtnDevPowerMode). |

### Triggers

| Name | Severity | Expression |
|---|---|---|
| Clock PLL is unlocked | Average | `last(/TEMPLATE/rtn.clock.pll)=0` |
| Clock is not tracing | Warning | `(count(/TEMPLATE/rtn.clock.mode,{$RTN.CLOCK.PERIOD},"eq",1)=0 and count(/TEMPLATE/rtn.clock.mode,{$RTN.CLOCK.PERIOD})>0) and {$RTN.CLOCK.ALERT}=1` |

### Discovery rule: Radio link identification discovery

Link identification: far-end NE ID per IF port (RTN 380H).

| Item prototype | Key | Interval | Description |
|---|---|---|---|
| {#IF.NAME}: Far-end NE ID | `rtn.link.far.neid[{#SNMPINDEX}]` | {$RTN.INTERVAL.STATUS} | NE ID of the radio at the other end of the link (optixRtnLineFindOutNeid). optixRtnLineFindInNeid is the local NE ID. |

| Trigger prototype | Severity | Expression |
|---|---|---|
| {#IF.NAME}: Far-end NE changed | Warning | `change(/TEMPLATE/rtn.link.far.neid[{#SNMPINDEX}])<>0` |
