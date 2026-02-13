# macOS macmon by Zabbix

## Overview

The **macOS macmon** template for Zabbix provides monitoring of Apple Silicon–based macOS systems using the `macmon` utility.  
It collects detailed metrics about power consumption, temperatures, CPU/GPU usage, and memory utilization.

This template is designed to work with **Zabbix Agent (active)** and parses JSON output from `macmon`.

---

## Screenshots

### Overview Dashboard
![Overview Dashboard](screenshots/dashboard.png)

---

## Requirements

- Zabbix Server / Proxy **7.0 or later**
- Zabbix Agent (active)
- macOS on Apple Silicon (M1/M2/M3)
- `macmon` utility installed on the monitored host

---

## Tested Versions

- macOS Sonoma / Ventura
- Zabbix 7.0
- macmon (Homebrew version)

---

## Installation

### 1. Install macmon

Install `macmon` using Homebrew:

```bash
HOMEBREW_NO_AUTO_UPDATE=1 brew install macmon
```

---

### 2. Configure Zabbix Agent

Create a configuration file for the Zabbix agent:

```bash
cd /usr/local/etc/zabbix/zabbix_agentd
cat > macmon.conf <<EOF
UserParameter=macmon.json,/opt/homebrew/bin/macmon pipe -s1 -i 500 | head -n1
EOF
```

---

### 3. Restart Zabbix Agent

Restart the Zabbix agent service:

```bash
launchctl stop com.zabbix.zabbix_agentd
sleep 2
launchctl start com.zabbix.zabbix_agentd
```

---

### 4. Import and Assign the Template

1. Import the template `Template macOS macmon.yaml` into Zabbix.
2. Assign **Template macOS macmon** to the target host.
3. Ensure the host is configured with **Zabbix Agent (active)**.

---

## Monitored Metrics

### Power
- Total system power
- CPU power
- GPU power
- GPU RAM power
- ANE power

### Temperature
- CPU average temperature
- GPU average temperature

### CPU / GPU Usage
- Performance cores usage (%)
- Efficiency cores usage (%)
- GPU usage (%)

### Memory
- RAM total
- RAM used
- RAM usage (%)
- Swap total
- Swap usage

### Frequency
- P-cores (Hz)
- E-cores (Hz)
- GPU (Hz)

---

## Triggers

- High CPU temperature
- High GPU temperature
- Excessive power consumption
- High memory usage
- High swap usage

All thresholds are configurable via user macros.

---

## Macros Used

| Macro | Description | Default |
|------|------------|---------|
| {$MAX_CPU_TEMP} | Maximum CPU temperature | 95 |
| {$MAX_GPU_TEMP} | Maximum GPU temperature | 95 |
| {$MAX_POWER} | Maximum power usage (W) | 25 |
| {$MEMORY_USE_PERCENT} | Maximum RAM usage (%) | 95 |
| {$SWAP_ALERT_SIZE} | Swap usage alert size (GB) | 4 |

---

## Dashboards

The template includes a built-in dashboard with the following graphs:

- Power consumption
- Temperatures
- CPU / GPU usage
- Memory usage
- Swap usage
- Frequency

---

## Troubleshooting

- Ensure `macmon` runs correctly when executed manually.
- Verify the Zabbix agent is running in **active** mode.
- Check the item **macmon: raw JSON output** for valid data.
- Confirm the correct Homebrew path (`/opt/homebrew/bin/macmon`).

---

## License

This template is provided as-is, without any warranty.  
You are free to modify and use it in your Zabbix environment.
