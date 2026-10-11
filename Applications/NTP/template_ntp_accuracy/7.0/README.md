# NTP Accuracy Monitoring (Zabbix 7.0)

## Overview
Comprehensive NTP accuracy monitoring template for Zabbix 7.0 LTS supporting both local daemon (`ntpq -p`) and remote appliance external check monitoring.

### Key Features
- **Master Item Architecture**: Consolidates `ntpq -p` output parsing to eliminate repetitive command executions.
- **LLD Peer Tracking**: Automatically detects all active, candidate, standby, and falseticker peers with sync status role tracking (`master`, `standby`, `outlyer`, `falseticker`).
- **External Check Support**: Ships with standalone Python agentless probe (`zabbix_ntp_check.py`) for network switches and appliances.
- **72-Column SVG Dashboard**: Integrated with Zabbix 7.0 modern full-width cards and SVG trend graphs.

## Requirements
- Zabbix 7.0 or newer
- Zabbix Agent / Agent 2 with `AllowKey=system.run[*]`

## Upstream Repository
- [qryuu/time-sync-monitoring-to-zabbix](https://github.com/qryuu/time-sync-monitoring-to-zabbix)\n