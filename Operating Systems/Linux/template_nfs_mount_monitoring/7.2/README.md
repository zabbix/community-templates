# NFS Mount Monitoring

## Overview

Generic template for monitoring NFS mount points on Linux hosts. Uses Low Level Discovery to automatically find and monitor all NFS mounts matching a configurable path filter.

Designed to work with any NFS mount setup — override the `{$NFS_MOUNT_PATH}` macro at the host level to target specific mounts (e.g. Fluentd logging, OpenStack Glance, or any other NFS share).

### Requirements

- Zabbix agent (passive) or Zabbix agent 2
- Linux OS with NFS mounts (`nfs` or `nfs4` filesystem type)

### Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$NFS_MOUNT_PATH}` | `^/mnt/.*$` | Regex filter for mount path. Override per host to target specific mounts. |
| `{$NFS_FREE_WARN}` | `20` | Warning threshold: trigger when free space % drops below this value. |
| `{$NFS_FREE_CRIT}` | `10` | Critical threshold: trigger when free space % drops below this value. |

### Discovered items (per NFS mount)

| Item | Key | Interval |
|------|-----|----------|
| Free space | `vfs.fs.size[{#FSNAME},free]` | 5m |
| Free space, % | `vfs.fs.size[{#FSNAME},pfree]` | 5m |
| Used space | `vfs.fs.size[{#FSNAME},used]` | 5m |
| Total space | `vfs.fs.size[{#FSNAME},total]` | 1h |
| Free inodes, % | `vfs.fs.inode[{#FSNAME},pfree]` | 5m |

### Triggers

| Trigger | Severity | Condition |
|---------|----------|-----------|
| Disk space critically low | High | Free space < `{$NFS_FREE_CRIT}`% |
| Disk space low | Warning | Free space < `{$NFS_FREE_WARN}`% (suppressed if critical fires) |
| Free inodes low | Warning | Free inodes < 20% |
| Mount not present or unreachable | High | No data for 15 minutes (manual close) |

### Graphs

- **Disk space usage** — Pie chart showing free vs used space per mount

### Examples

Override `{$NFS_MOUNT_PATH}` at the host level to target specific mounts:

| Use case | Macro value |
|----------|-------------|
| Fluentd logging NFS | `^/mnt/nfs/fluentd.*$` |
| OpenStack Glance | `^/mnt/glance.*$` |
| All `/mnt` mounts (default) | `^/mnt/.*$` |
