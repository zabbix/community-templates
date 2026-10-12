# ASUS RT-AX89X Monitoring Template for Zabbix 7.0

A high-performance, lightweight, and comprehensive All-in-One Zabbix 7.0 LTS monitoring template designed specifically for the **ASUS RT-AX89X** flagship Wi-Fi 6 router (powered by Qualcomm IPQ8074 Hawkeye SoC).

---

## Overview

By consolidating all metrics into a single SSH Master Item, this template minimizes router resource consumption and eliminates potential instability caused by frequent polling. It includes a built-in 3-tab modern template dashboard providing out-of-the-box visibility into system telemetry, Wi-Fi 6 RF health, and 15 independent thermal zones.

### Key Features
- **Single SSH Master Item Architecture**: Runs a single compound bash query every 30 seconds (`top`, `uptime`, `loadavg`, `ping`, thermal zones, `iwconfig`, `wlanconfig`), returning structured JSON parsed into Dependent Items.
- **Wi-Fi 6 RF Telemetry**: Accurately tracks connected client counts (UINT64) separated by 2.4 GHz and 5 GHz bands, average/min RSSI, SNR, and noise floor.
- **Autonomous LLD for All 15 Thermal Zones**: Auto-discovers all 15 hardware thermal sensors on the IPQ8074 platform (CPU cores, NSS cores, system blocks, chipsets, wireless power amplifiers).
- **Zabbix 7.0 Native 3-Tab Template Dashboard**:
  - **Tab 1: System Overview**: Semi-circular CPU gauge, memory breakdown doughnut chart, Google DNS ping latency, detailed CPU breakdown, and memory trends.
  - **Tab 2: Wi-Fi Quality**: Connected client cards, staircase client count trends, and 5 GHz / 2.4 GHz RF metrics.
  - **Tab 3: Thermal Zones**: Comprehensive grid view displaying waveforms for all 15 thermal sensors.

---

## Requirements

- **Zabbix Server / Proxy**: 7.0 LTS or newer (with SSH check support enabled)
- **Target Router**: ASUS RT-AX89X
  - Firmware: Stock Asuswrt or Asuswrt-Merlin
  - SSH daemon enabled under **Administration -> System -> SSH Daemon**

---

## Setup & Configuration

1. Import `template_asus_rt_ax89x.yaml` into your Zabbix 7.0 Web UI (**Data collection -> Templates -> Import**).
2. Create or open the host for your ASUS router, link the `ASUS-Router` template, and set the router IP address.
3. In the host's **Macros** tab, configure the user macros:

| Macro | Default | Type | Required | Description |
| :--- | :--- | :--- | :---: | :--- |
| `{$SSH_USER}` | (empty) | Text | **Yes** | SSH login username for the router |
| `{$SSH_PASS}` | (empty) | **Secret text** | **Yes** | SSH login password for the router |
| `{$AX89X.TEMP.WARN}` | `80` | Text | Optional | Thermal zone temperature warning threshold (°C) |

> [!WARNING]
> **Security Notice**:
> - In Asuswrt, the SSH account is identical to the router's web administration account (root privileges). Never enable "Allow SSH access from WAN" under **Administration -> System -> SSH Daemon** (keep SSH accessible from LAN only).
> - Always configure `{$SSH_PASS}` as **Secret text** in the Zabbix Web UI.

---

## Upstream Repository & Japanese Version

Maintained at: https://github.com/qryuu/zabbix-template-asus-rt-ax89x  
A dedicated Japanese edition is also available under `Network_Devices/template_asus_rt_ax89x_japanese/7.0/`.
