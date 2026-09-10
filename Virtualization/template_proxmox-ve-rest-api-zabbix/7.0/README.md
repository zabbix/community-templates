# Zabbix Template Proxmox VE REST API

This Zabbix template enables full monitoring of a Proxmox VE environment via the official REST API (Proxmox VE 7.0+). No Zabbix agent is required inside VMs or on the PVE host. It collects host and cluster metrics, VM and LXC container data, backup jobs, storage status, tasks, network interfaces, HA resources, disk health, and user accounts. It also covers the PVE services themselves, ZFS pools, replication jobs, certificate expiry, APT repository state and the subscription status, the HA local resource managers, SDN zones and Ceph.

Works on standalone single-node setups as well as full clusters. Ceph is detected automatically, on clusters without Ceph no Ceph item is created.

---

## Requirements

- Zabbix Server 7.0 or higher
- Proxmox VE 7.0 or higher (SDN zone discovery needs Proxmox VE 9)
- API token with read permissions (see setup below)

---

## 1. Create the API Token

### Option A, Without Privilege Separation (recommended, simpler)

1. **Create a user** (skip if using `root@pam`)
   - **Datacenter → Permissions → Users → Add**
   - User: `zabbix@pam`, set a password → **Add**

2. **Assign read-only role to the user**
   - **Datacenter → Permissions → Add → User Permission**
   - Path: `/` · User: `zabbix@pam` · Role: `PVEAuditor` · Propagate: ✓ → **Add**

3. **Create the API token**
   - **Datacenter → Permissions → API Tokens → Add**
   - User: `zabbix@pam` · Token ID: `Zabbix` · **Privilege Separation: disabled** → **Add**
   - **Copy the token secret, it is shown only once.**

The token inherits all permissions from the user. Header format:
```
PVEAPIToken=zabbix@pam!Zabbix=<token-secret>
```

---

### Option B, With Privilege Separation (granular, more secure)

1. Follow steps 1-2 from Option A.

2. **Create the API token**
   - **Datacenter → Permissions → API Tokens → Add**
   - User: `zabbix@pam` · Token ID: `Zabbix` · **Privilege Separation: enabled** → **Add**

3. **Grant permission to the token explicitly**
   - **Datacenter → Permissions → Add → API Token Permission**
   - Path: `/` · Token: `zabbix@pam!Zabbix` · Role: `PVEAuditor` · Propagate: ✓ → **Add**

> **Permissions:** `PVEAuditor` covers every item enabled by default, Ceph included. Disks and ZFS need `Sys.Audit` on path `/`, not on `/nodes/{node}`. An item without permission turns unsupported (HTTP 403); check that the role is set on `/` with **Propagate** enabled.

> **Pending updates:** `/nodes/{node}/apt/update` needs `Sys.Modify`, which `PVEAuditor` does not have. The item `pve.apt.update.raw` and its dependent item are therefore **disabled by default**. The repository state is monitored through `/nodes/{node}/apt/repositories`, which only needs `Sys.Audit`.

---

## 2. Installation

1. Download `template_proxmox-ve-rest-api.yaml`
2. In Zabbix: **Data collection → Templates → Import**
3. Create a new host:
   - **Data collection → Hosts → Create host**
   - Host name: e.g. `proxmox01`
   - Template: `Template Proxmox VE REST API`
   - Group: e.g. `Virtual machines`
   - Interfaces: leave empty (template uses HTTP agent, no Zabbix agent needed)
4. Set the required macros on the host (see below)
5. **Cluster with several nodes:** create one host per node as above, each with `{$PVE_IP}` and `{$PVE_NODE}` of its own node, and set `{$PVE.DATACENTER.PAUSE}` to `1-7,00:00-24:00` on all of them but one. Guests, node states, quorum, HA, backup jobs, users, SDN and Ceph are the same on every node; without the pause they are requested and alerted once per node. Set the macro before the host collects its first data, otherwise the datacenter items of that host keep their last values and their problems stay open until closed.

| Host | `{$PVE_IP}` / `{$PVE_NODE}` | `{$PVE.DATACENTER.PAUSE}` |
|------|-----------------------------|---------------------------|
| `pve01` | node pve01 | `7,23:59-24:00` (default) |
| `pve02`, `pve03`, ... | their own node | `1-7,00:00-24:00` |

A standalone node needs nothing beyond steps 1-4.

**Upgrading:** Name and UUID of the template are unchanged, so an import updates it in place and keeps the history.

---

## 3. Macros

### Required

| Macro | Example | Description |
|-------|---------|-------------|
| `{$PVE_IP}` | `192.168.1.10` | IP address or hostname of the PVE server |
| `{$PVE_PORT}` | `8006` | API port (default: 8006) |
| `{$PVE_NODE}` | `pve` | Node name as shown in PVE (Datacenter → Node) |
| `{$PVE_API_USER}` | `zabbix@pam` | API user including realm |
| `{$PVE_API_TOKEN_ID}` | `Zabbix` | Token ID |
| `{$PVE_API_TOKEN}` | *(secret)* | Token secret, set as **Secret text** macro type |

### Cluster and Load Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$PVE.DATACENTER.PAUSE}` | `7,23:59-24:00` | Period in which the datacenter-wide data is not requested on this host: guests on all nodes, node states, quorum, HA, backup jobs, users, SDN and Ceph. In a cluster keep the default on one host and set `1-7,00:00-24:00` on the others. The default only skips the last minute of the week. |
| `{$PVE.GUEST.DETAIL.INTERVAL}` | `10m` | Interval of the per guest status request that supplies balloon size, machine type and LXC swap. One request per guest, keep it long in large clusters. |
| `{$PVE.GUEST.DETAIL.VMID.MATCHES}` | `.*` | Only guests whose VMID matches get the per guest status request. `^$` switches it off for all guests. |

### Threshold Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$CPU_USAGE_AVERAGE}` | `85` | CPU warning threshold (%) |
| `{$CPU_USAGE_HIGH}` | `99` | CPU critical threshold (%) |
| `{$LXC.CPU.WARN}` | `85` | LXC CPU warning threshold (%) |
| `{$LXC.CPU.HIGH}` | `99` | LXC CPU critical threshold (%) |
| `{$MEMORY.UTIL.MAX}` | `90` | Host memory warning threshold (%) |
| `{$SWAP.UTIL.MAX}` | `80` | Host swap warning threshold (%). The trigger stays silent on hosts without swap. |
| `{$ROOTFS.UTIL.WARN}` | `90` | Root filesystem warning threshold (%) |
| `{$ROOTFS.UTIL.CRIT}` | `95` | Root filesystem critical threshold (%) |
| `{$STORAGE.UTIL.WARN}` | `80` | Storage pool warning threshold (%) |
| `{$STORAGE.UTIL.CRIT}` | `90` | Storage pool critical threshold (%) |
| `{$CLUSTER.NODES.OFFLINE.MAX}` | `0` | Max. tolerated offline nodes (raise during maintenance) |
| `{$DISK.WEAROUT.MIN}` | `20` | Min. SSD wearout remaining before warning (%) |
| `{$PVE.USER.EXPIRE.TIME}` | `172800` | Seconds before user expiry to warn (172800 = 2 days). Context form per user. |
| `{$DISK.TEMP.MAX}` | `60` | Disk temperature threshold (degrees Celsius). Context form `{$DISK.TEMP.MAX:"/dev/sda"}` raises it for one disk. |
| `{$NODE.CPU.UTIL.MAX}` | `90` | Node CPU utilization (%) before the high CPU trigger fires. |
| `{$ZFS.UTIL.WARN}` | `80` | ZFS pool usage (%) for the average severity trigger. Context form `{$ZFS.UTIL.WARN:"rpool"}`. |
| `{$ZFS.UTIL.CRIT}` | `90` | ZFS pool usage (%) for the high severity trigger. |
| `{$ZFS.FRAG.WARN}` | `60` | ZFS free space fragmentation (%) before warning. |
| `{$ZFS.FRAG.UTIL.MIN}` | `70` | Pool usage (%) that must also be reached before the fragmentation warning fires. Context form per pool. |
| `{$PVE.REPL.FAIL.MAX}` | `0` | Tolerated consecutive failures of a replication job. Context form `{$PVE.REPL.FAIL.MAX:"105-0"}`. |
| `{$PVE.NOTBACKEDUP.MAX}` | `0` | Tolerated number of guests without a backup job. Raise it if some guests are deliberately excluded. |
| `{$PVE.BACKUP.JOBS.MIN}` | `1` | Minimum number of configured backup jobs. |
| `{$PVE.APT.REPO.ERRORS.MAX}` | `0` | Tolerated number of unparsable APT repository files. |
| `{$PVE.APT.REPO.WARN.MAX}` | `0` | Tolerated number of APT repository warnings. A host on the no-subscription repository permanently reports one warning, set this to 1 there. |
| `{$PVE.APT.UPDATES.MAX}` | `0` | Tolerated number of pending package updates. Only relevant if the disabled apt/update items are switched on. |
| `{$CEPH.UTIL.WARN}` / `{$CEPH.UTIL.CRIT}` | `75` / `85` | Ceph raw capacity thresholds (%) |
| `{$CEPH.OSD.UTIL.WARN}` / `{$CEPH.OSD.UTIL.CRIT}` | `80` / `90` | Per OSD utilization thresholds (%). Ceph itself warns at 85 and stops writes at 95. |
| `{$CEPH.OSD.LATENCY.MAX}` | `0.2` | OSD commit latency threshold in seconds |
| `{$CEPH.POOL.UTIL.WARN}` / `{$CEPH.POOL.UTIL.CRIT}` | `80` / `90` | Pool utilization thresholds (%) |

### Timing Macros

Values must carry a time unit.

| Macro | Default | Description |
|-------|---------|-------------|
| `{$TASK.ALERT.WINDOW}` | `1h` | How long a failed task keeps alerting. |
| `{$BACKUP.ALERT.WINDOW}` | `24h` | How long a failed backup keeps alerting. |
| `{$PVE.BACKUP.RUN.MAX}` | `3h` | How long a single backup may run before it is reported as hanging. |
| `{$PVE.BACKUP.JOB.STALE}` | `2d` | Maximum time a backup job may go without a next run. |
| `{$DISK.MISSING.TIME}` | `3h` | How long a disk may be absent from the disk list before the missing disk trigger fires. |
| `{$IFACE.ACTIVE.WINDOW}` | `7d` | An interface must have been up once within this window before the interface down trigger fires. |
| `{$PVE.REPL.LAG}` | `2h` | Maximum age of the last successful replication. Must stay above the replication schedule. |
| `{$PVE.CERT.EXPIRE.DAYS}` | `21d` | Lead time before certificate expiry. |
| `{$PVE.SUBSCRIPTION.EXPIRE.DAYS}` | `30d` | Lead time before the subscription expires. |
| `{$CEPH.HEALTH.WARN.PERIOD}` | `15m` | How long Ceph must stay at HEALTH_WARN or worse before the warning fires. |
| `{$CEPH.OSD.LATENCY.PERIOD}` | `30m` | How long the OSD latency must stay above the threshold. |
| `{$CEPH.PG.NOT_CLEAN.PERIOD}` | `1h` | How long placement groups may stay not active+clean. |

### Discovery Filter Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$IFACE.NOT_MATCHES}` | `^(tap\|veth\|fwbr\|fwpr\|fwln)` | Host interface names excluded from discovery. The default drops the per-guest interfaces Proxmox creates. |
| `{$PVE.SERVICE.MATCHES}` | `^(pve-cluster\|pvedaemon\|pveproxy\|pvestatd\|pve-firewall\|pvescheduler\|pve-ha-crm\|pve-ha-lrm)$` | Which PVE services are discovered. `corosync` only runs on cluster members, add it on those hosts. |
| `{$CEPH.POOL.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Ceph pools whose name matches are not discovered. |

### Alert Enable/Disable Macros

Set to `0` to suppress a trigger globally. Supports context macros for per-instance suppression.

| Macro | Default | Description |
|-------|---------|-------------|
| `{$ENABLE_BACKUP_ALERT}` | `1` | Backup failure trigger |
| `{$ENABLE_NODE_STATUS_ALERT}` | `1` | Node offline trigger |
| `{$ENABLE_STORAGE_AVAILABLE_ALERT}` | `1` | Storage high usage trigger |
| `{$ENABLE_STORAGE_INACTIVE_ALERT}` | `1` | Storage inactive trigger |
| `{$ENABLE_TASK_ALERT}` | `1` | Task failure trigger |
| `{$ENABLE_VM_STOP_ALERT}` | `1` | VM/LXC stopped trigger |
| `{$PVE.BACKUP.JOB.ALERT}` | `1` | Backup job triggers. Context form per job. |
| `{$PVE.SERVICE.STATE.ALERT}` | `1` | PVE service not running trigger. Context form `{$PVE.SERVICE.STATE.ALERT:"pveproxy"}=0` silences one service. |
| `{$PVE.SUBSCRIPTION.ALERT}` | `0` | Subscription status trigger. Off by default so community hosts do not alert on status `notfound`. Set to `1` on hosts that carry a subscription. |

---

## 4. Discovery Rules

| Rule | Source | Discovers |
|------|--------|-----------|
| `discover.lxc` | `/cluster/resources` | LXC containers on every node, with CPU, memory, disk, network metrics |
| `discover.qemu` | `/cluster/resources` | QEMU/KVM VMs on every node, with CPU, memory, disk, network metrics |
| `discover.nodes` | `/nodes` | Cluster nodes with status and uptime |
| `discover.storage` | `/nodes/{node}/storage` | Storage pools with capacity and active status |
| `discover.backup` | `/nodes/{node}/tasks?typefilter=vzdump` | Backup jobs (vzdump/PBS), grouped by VM, most recent run |
| `discover.backup.jobs` | `/cluster/backup` | Configured backup jobs with enabled state and next run |
| `discover.tasks` | `/nodes/{node}/tasks` | Non-backup tasks, deduplicated per type |
| `discover.users` | `/access/users` | PVE user accounts with expiration monitoring |
| `discover.network` | `/nodes/{node}/network` | Host network interfaces (bridge, bond, eth, vlan) |
| `discover.ha.resources` | `/cluster/ha/status/current` | HA-protected VMs and containers |
| `discover.ha.lrm` | `/cluster/ha/status/current` | The HA local resource manager of every node |
| `discover.sdn` | `/cluster/resources` | SDN zones per node (Proxmox VE 9) |
| `discover.disks` | `/nodes/{node}/disks/list` | Physical disks of any type with SMART health, temperature, size and wearout |
| `discover.pve.services` | `/nodes/{node}/services` | The systemd units PVE manages, with SubState, UnitFileState and ActiveState |
| `discover.zfs.pools` | `/nodes/{node}/disks/zfs` | Local ZFS pools with health, size, allocated, free, fragmentation, dedup ratio and calculated utilization |
| `discover.replication` | `/nodes/{node}/replication` | ZFS replication jobs with fail count, last sync, last try, duration and error message |
| `discover.certificates` | `/nodes/{node}/certificates/info` | Node certificates with expiry timestamp, subject and issuer |
| `discover.ceph.cluster` | `/cluster/ceph/status` | The Ceph cluster, only when Ceph is set up |
| `discover.ceph.osd` | `/nodes/localhost/ceph/osd` | Every OSD with state, utilization, latency and PG count |
| `discover.ceph.pools` | `/nodes/localhost/ceph/pool` | Every pool with utilization, size and min_size |

Every rule handles an empty list: a cluster without HA, replication jobs, containers or Ceph discovers nothing, the rule stays supported and resources that disappear are cleaned up.

---

## 5. Triggers

### Host-Level

| Trigger | Severity | Description |
|---------|----------|-------------|
| PVE API not reachable | High | No data from API for 5 minutes |
| High CPU usage | Average | PVE host CPU sustained high, threshold via `{$NODE.CPU.UTIL.MAX}` |
| High load average | Average | Load average ≥ number of CPUs |
| High memory usage | Average | Configurable via `{$MEMORY.UTIL.MAX}` |
| High root filesystem usage | Average / High | Two-level: warn and critical |
| Cluster lost quorum | Disaster | Only fires on actual clusters, not standalone nodes |
| Cluster nodes offline | High | Configurable tolerance via `{$CLUSTER.NODES.OFFLINE.MAX}` |
| VMs/LXC not all running | Info | Cluster-wide: running count < total count |
| Guests not covered by any backup job | Warning | Catches the guest that was created after the backup job was defined |
| APT repository files are broken | Warning | At least one repository file cannot be parsed, updates will fail |
| APT repository configuration has warnings | Info | For example the enterprise repository enabled without a subscription |
| Package updates pending | Info | Disabled by default, like the item it depends on |
| PVE subscription has expired | Average | The subscription period has ended, the enterprise repository is no longer accessible |
| PVE subscription expires soon | Warning | Advance warning via `{$PVE.SUBSCRIPTION.EXPIRE.DAYS}` |
| PVE subscription is not active | Warning | Status invalid, suspended or notfound. Off by default, see `{$PVE.SUBSCRIPTION.ALERT}` |
| HA manager (CRM) has stopped updating its status | High | The CRM master reports `old timestamp - dead?` |
| HA manager (CRM) reports time drift | Warning | The CRM master reports `detected time drift!` |

### VM / LXC Prototypes

| Trigger | Severity |
|---------|----------|
| CPU over threshold for 5 minutes | Average / High |
| Memory utilization over threshold | Warning |
| VM/LXC stopped | High |
| VM/LXC restarted (uptime < 10 min) | Info |
| RAM under-provisioned (>90% for 5 min) | Warning |
| RAM over-provisioned (<20% avg for 24h) | Info |
| CPU over-provisioned (<5% avg for 24h) | Info |
| VM/LXC migrated to another node | Info |

### Storage Prototypes

| Trigger | Severity |
|---------|----------|
| Storage inactive/unavailable | Average |
| Storage usage over warning threshold | Average |
| Storage usage over critical threshold | High |

### Other Prototypes

| Trigger | Severity |
|---------|----------|
| Backup failed | High |
| Backup running longer than `{$PVE.BACKUP.RUN.MAX}` | Average |
| Backup job disabled, too few jobs / job not rescheduled for `{$PVE.BACKUP.JOB.STALE}` | Warning / Average |
| Task failed | Warning |
| User account expiring within `{$PVE.USER.EXPIRE.TIME}` | Warning |
| Node offline | High |
| Network interface down | Warning |
| HA resource in error state | High |
| HA resource being fenced or recovered | High |
| HA LRM on a node is dead, unreadable or has lost its agent lock | High |
| HA node in maintenance mode | Info |
| SDN zone in error state | Warning |
| Disk SMART health not PASSED | High |
| Disk temperature above `{$DISK.TEMP.MAX}` | Warning |
| Disk no longer reported by the node | Average |
| SSD wearout below threshold | Warning |
| PVE service not running | Average |
| ZFS pool not ONLINE | High |
| ZFS pool fragmentation above `{$ZFS.FRAG.WARN}` | Warning |
| ZFS pool usage over warning / critical threshold | Average / High |
| Replication job failing | Average |
| Replication job has not synced within `{$PVE.REPL.LAG}` | Warning |
| Certificate expires within `{$PVE.CERT.EXPIRE.DAYS}` | Warning |

### Ceph

| Trigger | Severity |
|---------|----------|
| Ceph status cannot be read (after it was readable within the last day) | High |
| Ceph health HEALTH_ERR | High |
| Ceph health not OK for `{$CEPH.HEALTH.WARN.PERIOD}` | Warning |
| Ceph OSDs down / OSDs out | Average / Warning |
| Ceph OSD down (per OSD) | Average |
| Ceph OSD utilization over warning / critical threshold | Warning / High |
| Ceph OSD commit latency over threshold | Warning |
| Ceph monitor(s) out of quorum | Average |
| Ceph no active manager | High |
| Ceph placement groups not active+clean for `{$CEPH.PG.NOT_CLEAN.PERIOD}` | Warning |
| Ceph unfound objects | High |
| Ceph raw capacity over warning / critical threshold | Warning / High |
| Ceph pool utilization over warning / critical threshold | Warning / High |
| Ceph pool with min_size 1 | Warning |

The messages of the active Ceph health checks are in the item `Ceph health checks`.

---

## 6. Dashboard

The template includes a pre-built dashboard **"Proxmox VE - Monitoring Dashboard"** with the following pages:

| Page | Contents |
|------|----------|
| Overview | Cluster, quorum, nodes online, guests running and total, uptime, CPU, memory and root filesystem, problems |
| Virtual machines | Browse all VM items, VM status, history of the selected item |
| LXC containers | Browse all container items, container status, history of the selected item |
| Storage and disks | Storage utilization, disk health and temperature |
| Nodes and HA | Node status, HA resource states, HA local resource managers, HA manager, nodes offline, kernel, boot mode |
| Ceph | OSD status, pool utilization, browse all Ceph items |

---

## 7. Notes

- **Guests:** VMs and containers of every node are monitored from a single Zabbix host, and a live migration keeps their items and history.
- **Node-scoped data:** Disks, host network interfaces, storage, services, ZFS, replication, certificates and tasks come from the node in `{$PVE_NODE}`. For this data on every node, add one Zabbix host per node (see installation step 5).
- **Ceph:** Without Ceph the Ceph items stay supported and the item `Ceph API message` shows why no Ceph data exists.
- **Not available through the API:** CPU temperatures and traffic of physical NICs such as `eno1` or `vmbr0`. Use the Zabbix agent for those.

---

## Screenshots

<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-52-55" src="https://github.com/user-attachments/assets/3bb2fc8b-e892-4f7b-8dc8-5356986b9b1d" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-14" src="https://github.com/user-attachments/assets/f548341c-975d-44a3-b4d6-5acbb25517b7" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-22" src="https://github.com/user-attachments/assets/091a82e9-3eef-4fd6-84a4-2a806189fe50" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-29" src="https://github.com/user-attachments/assets/f06dde1f-3244-448d-b9e1-3e9e038b68f2" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-33" src="https://github.com/user-attachments/assets/ba551cbb-49c3-452c-ac75-887503af2e8e" />
