# Template GFS2 Cluster

Monitoring template for a shared-storage GFS2 cluster running on top of
Pacemaker, Corosync and DLM, with multipath and SCSI-3 PR fencing
(`fence_scsi`). Auto-discovers every mounted GFS2 filesystem and creates
items, triggers and graphs for each one.

## Overview

The template covers three layers of the cluster:

1. **Cluster services** - Pacemaker, Corosync and the DLM daemon
2. **Cluster state** - quorum, online/offline/UNCLEAN node counts, failed
   resources, stonith configuration, fencing events
3. **Per-filesystem** (Low-Level Discovery) - mount status, RW mode, write
   health check, used space, multipath active/total paths, SCSI-3 PR
   registered keys, read/write IOPS and throughput

All items and triggers carry the tag `Application: GFS2`. Per-filesystem
items additionally carry a `filesystem:` tag with the discovered name,
which makes Grafana drill-down straightforward.

## Tested with

- Zabbix Server 6.4
- Zabbix Agent 2 6.4 (active mode)
- Ubuntu 22.04 LTS
- Pacemaker 2.1, Corosync 3.1, DLM 4.x
- `dlm_controld` managed by Pacemaker as an OCF clone
  (`ocf:pacemaker:controld`)
- multipath-tools 0.8 with SCSI-3 PR capable backend storage

## Requirements

- Each cluster node must run Zabbix Agent 2 in **active mode**, with
  `Hostname=` matching the host name registered in Zabbix.
- The agent needs an extra `UserParameter` file and a `sudoers` fragment.
  Both ship with the template (see [Installation](#installation)).

## Installation

### On every cluster node

Copy `userparameter_gfs2_cluster.conf` and `sudoers_zabbix_gfs2_cluster`
to the node, then:

```bash
sudo install -o root -g root -m 0440 \
  sudoers_zabbix_gfs2_cluster \
  /etc/sudoers.d/zabbix-gfs2-cluster
sudo visudo -cf /etc/sudoers.d/zabbix-gfs2-cluster

sudo install -o root -g root -m 0644 \
  userparameter_gfs2_cluster.conf \
  /etc/zabbix/zabbix_agent2.d/

sudo systemctl restart zabbix-agent2
```

Verify with `zabbix_agent2 -t pacemaker.service` - it should return `active`.

### In the Zabbix frontend

1. **Configuration -> Templates -> Import**, select
   `template_gfs2_cluster.yaml`.
2. Link the imported template "GFS2 Cluster" to each cluster node host.
3. The active agent picks up the new configuration on the next refresh
   (default: 120 s). Restart the agent on the node to force it.

The Low-Level Discovery rule runs every hour and adds 11 items, 10 triggers
and 2 graphs per discovered GFS2 filesystem.

## Porting to other distros

The `UserParameter` file and the sudoers fragment use absolute paths for
Ubuntu 22.04. On RHEL, Rocky and similar distros, check the actual paths:

```bash
which pcs corosync-quorumtool dlm_tool multipath sg_persist
```

and adjust both files to match. Paths must agree between `UserParameter`
and `sudoers`.

## Macros

| Macro | Default | Description |
| --- | --- | --- |
| `{$CLUSTER_NODES_EXPECTED}` | `2` | Expected number of Online cluster nodes |
| `{$MULTIPATH_PATHS_WARN}` | `3` | Warning threshold for active multipath paths |
| `{$MULTIPATH_PATHS_HIGH}` | `2` | High-severity threshold for active multipath paths |

Override per host under **Configuration -> Hosts -> <host> -> Macros**.

## Items

### Standalone (11)

| Group | Key | Description |
| --- | --- | --- |
| Services | `pacemaker.service` | systemd state of pacemaker |
| Services | `corosync.service` | systemd state of corosync |
| Services | `dlm.service` | `pgrep dlm_controld` (managed by Pacemaker via OCF) |
| Cluster | `corosync.quorum` | 1 = quorate, 0 = no quorum |
| Cluster | `pacemaker.nodes.online` | Online node count |
| Cluster | `pacemaker.nodes.offline` | Offline node count |
| Cluster | `pacemaker.nodes.unclean` | UNCLEAN node count (being fenced) |
| Cluster | `pacemaker.resources.failed` | Resources in FAILED state |
| Cluster | `dlm.lockspaces` | Active DLM lockspaces |
| Fencing | `stonith.enabled` | 1 = stonith-enabled=true |
| Fencing | `cluster.fencing.count` | Count of real fencing events |

### LLD prototypes (11 per discovered filesystem)

| Key | Description |
| --- | --- |
| `gfs2.mount[{#GFS2_MOUNT}]` | 1 if mounted |
| `gfs2.rw[{#GFS2_MOUNT}]` | 1 if RW, 0 if RO/withdraw |
| `gfs2.write[{#GFS2_MOUNT}]` | 1 if sentinel write succeeded |
| `vfs.fs.size[{#GFS2_MOUNT},pused]` | Used space % (built-in agent key) |
| `multipath.paths.active[{#MPATH}]` | Active paths |
| `multipath.paths.total[{#MPATH}]` | Total paths |
| `scsi.keys.count[{#GFS2_DEVICE}]` | SCSI-3 PR registered keys |
| `diskstats.reads[{#MPATH}]` | Read IOPS (after `Change per second`) |
| `diskstats.writes[{#MPATH}]` | Write IOPS |
| `diskstats.read_bytes[{#MPATH}]` | Read throughput (B/s) |
| `diskstats.write_bytes[{#MPATH}]` | Write throughput (B/s) |

## Triggers

All trigger names start with `GFS2 -`.

### Standalone (11)

| Severity | Trigger |
| --- | --- |
| Disaster | Pacemaker is not running |
| Disaster | Corosync is not running |
| High | DLM daemon is not running |
| Disaster | Cluster has lost quorum |
| High | Cluster has fewer Online nodes than expected |
| Warning | N node(s) listed as Offline |
| High | N node(s) in UNCLEAN state |
| High | N cluster resource(s) in FAILED state |
| High | DLM has no active lockspaces |
| High | Stonith fencing is disabled |
| Average | New fencing event recorded |

### LLD prototypes (10 per discovered filesystem)

| Severity | Trigger |
| --- | --- |
| Disaster | Filesystem [name] is not mounted |
| Disaster | Filesystem [name] read-only / withdraw |
| High | Filesystem [name] write check failed |
| Warning | Filesystem [name] usage above 80% |
| High | Filesystem [name] usage above 90% |
| Disaster | Filesystem [name] usage above 95% |
| Warning | Multipath [name] paths degraded |
| High | Multipath [name] paths critical |
| Disaster | Multipath [name] has NO active paths |
| Warning | SCSI-3 PR has no registered keys |

## Graphs

The discovery rule generates two graph prototypes per filesystem:

- `GFS2 [name]: IOPS` - read + write IOPS
- `GFS2 [name]: throughput` - read + write bytes/sec

## License

[MIT](https://opensource.org/licenses/MIT).
