# Storware Backup and Recovery Template

Zabbix 7.2 template for monitoring Storware vProtect/Backup & Recovery via REST API.

## Features

- API health monitoring
- Node status tracking (total, running, offline)
- Task monitoring (running, queued, failed, finished)
- VM protection status
- Per-instance backup monitoring with auto-discovery
- Backup destination capacity monitoring

## Requirements

- Zabbix 7.2+
- Storware vProtect 7.x with API access (port 8181)

## Setup

1. Import `storware-template.json` into Zabbix
2. Link template to a host
3. Configure host macros:
   - `{$STORWARE.API.URL}` - API base URL (e.g., `https://storware.local:8181/api`)
   - `{$STORWARE.USER}` - API username
   - `{$STORWARE.PASSWORD}` - API password

## Optional Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$STORWARE.BACKUP.STALE.HOURS}` | 24 | Hours threshold for stale backup |
| `{$STORWARE.BACKUP.CHECK.HOURS}` | 24 | Hours to look back for failed backups |
| `{$STORWARE.BD.WARNING.PCT}` | 80 | Storage warning threshold % |
| `{$STORWARE.BD.CRITICAL.PCT}` | 90 | Storage critical threshold % |

## Triggers

- API unavailable (DISASTER)
- Nodes offline (HIGH)
- Failed tasks (WARNING)
- Failed backups in last 24h (HIGH)
- VMs without recent backup (WARNING)
- Storage usage thresholds (WARNING/HIGH)
