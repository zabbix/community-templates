# OpenStack Glance NFS Storage Template

Zabbix 7.2 template for monitoring OpenStack Glance NFS storage mounts.

## Features

- Automatic discovery of NFS mounts under `/mnt/glance*`
- Free space monitoring (bytes and percentage)
- Used and total space tracking
- Inode usage monitoring
- Multi-level alerting (Info at 30%, Warning at 20%, Critical at 10%)
- Pie chart visualization of disk space usage

## Requirements

- Zabbix 7.2+
- Zabbix agent 2 (active mode)
- Linux OS with NFS mounts under `/mnt/glance` or `/mnt/glance-unity`

## Setup

1. Import `glance-nfs-storage.yaml` into Zabbix
2. Link template to hosts with Glance NFS mounts
3. Wait for discovery (runs every 1 hour by default)

## Monitored Metrics

- **Free space** - Available disk space in bytes and percentage
- **Used space** - Consumed disk space in bytes
- **Total space** - Total disk capacity in bytes
- **Free inodes** - Available file system inodes (percentage)

## Triggers

| Severity | Condition | Description |
|----------|-----------|-------------|
| HIGH | < 10% free space | Critically low disk space |
| WARNING | < 20% free space | Low disk space |
| INFO | < 30% free space | Disk space notification |
| WARNING | < 20% free inodes | Critically low inodes |

## Discovery Rules

The template uses Zabbix's built-in `vfs.fs.discovery` with filters:
- **File system type**: `nfs` or `nfs4`
- **Mount point**: Matches pattern `/mnt/glance*`

This automatically discovers:
- `/mnt/glance`
- `/mnt/glance-unity`
- Any other mounts under `/mnt/glance*`

## Author

Created by Claude Code (2026-02-12)
Version: 1.0
