# Zabbix Templates Proxmox VE REST API

Monitoring of Proxmox VE over the official REST API (Proxmox VE 7.0+). No Zabbix agent is needed on the PVE hosts or inside the guests. The import file contains two templates that split the work the same way Proxmox VE does:

| Template | Link it to | Covers |
|----------|------------|--------|
| `Proxmox VE Cluster by REST API` | exactly one Zabbix host per cluster (or per standalone node) | Guests on every node, node states, quorum, HA manager, HA local resource managers and HA resources, backup jobs and guests without backup, users, SDN zones and, where present, Ceph |
| `Proxmox VE Node by REST API` | one Zabbix host per PVE node | Node status, CPU, memory, swap, root filesystem, disks with SMART, ZFS pools, storage, host network, PVE services, tasks, backups, replication, certificates, APT and subscription |

Cluster-wide data is requested once per cluster instead of once per node, so a cluster of ten nodes no longer queries every guest ten times and no longer raises every guest problem ten times.

Ceph is detected automatically. On clusters without Ceph no Ceph item is created and nothing is evaluated.

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
   - Path: `/` · User: `zabbix@pam` · Role: `PVEAuditor` · Propagate: enabled → **Add**

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
   - Path: `/` · Token: `zabbix@pam!Zabbix` · Role: `PVEAuditor` · Propagate: enabled → **Add**

`PVEAuditor` covers everything both templates read, Ceph included. The one exception:

> **Note for pending updates:** `/nodes/{node}/apt/update` is the only endpoint that requires `Sys.Modify` rather than `Sys.Audit`, so `PVEAuditor` cannot read it. The master item `pve.apt.update.raw` and its dependent item are therefore **disabled by default**. Enable them only if you accept granting the monitoring token write level permissions. The repository state is monitored through `/nodes/{node}/apt/repositories` instead, which only needs `Sys.Audit`.

> **Note for disk monitoring:** `/nodes/{node}/disks/list` requires the `Sys.Audit` privilege. `PVEAuditor` includes this privilege. If disk items show "not supported", verify that the role is applied with **Propagate** enabled and that the token has the correct path `/`.

---

## 2. Installation

1. Download `7.0/template_proxmox-ve-rest-api.yaml`
2. In Zabbix: **Data collection → Templates → Import**. The file creates both templates.
3. Create the hosts. Interfaces stay empty, both templates use the HTTP agent.

**Standalone node:** one host, link both templates, set the macros once.

**Cluster:**

| Host | Template | `{$PVE_IP}` | `{$PVE_NODE}` |
|------|----------|-------------|---------------|
| `pve-cluster` | `Proxmox VE Cluster by REST API` | any node, ideally a DNS name or virtual IP that always points to a running node | not needed |
| `pve01`, `pve02`, ... | `Proxmox VE Node by REST API` | the node itself | the node name as shown in PVE |

Link the cluster template to one host per cluster only. A second host with the same cluster template doubles every cluster request and every guest problem.

### Upgrading from `Template Proxmox VE REST API`

The cluster template keeps the UUID of the former single template. Importing the file with **Delete missing** enabled renames the former template, removes the node items from it and creates the node template next to it. Then link `Proxmox VE Node by REST API` to every host that should keep node monitoring. Guest, HA, backup job and user history is kept. Node items are created anew, so their history starts again.

---

## 3. Macros

### Connection (both templates)

| Macro | Example | Description |
|-------|---------|-------------|
| `{$PVE_IP}` | `192.168.1.10` | IP address or hostname of the PVE API |
| `{$PVE_PORT}` | `8006` | API port (default: 8006) |
| `{$PVE_API_USER}` | `zabbix@pam` | API user including realm |
| `{$PVE_API_TOKEN_ID}` | `Zabbix` | Token ID |
| `{$PVE_API_TOKEN}` | *(secret)* | Token secret, set as **Secret text** macro type |
| `{$PVE_NODE}` | `pve` | Node template only: node name as shown in PVE (Datacenter → Node) |

### Cluster template

| Macro | Default | Description |
|-------|---------|-------------|
| `{$CPU_USAGE_AVERAGE}` | `85` | VM CPU warning threshold (%) |
| `{$CPU_USAGE_HIGH}` | `99` | VM CPU critical threshold (%) |
| `{$LXC.CPU.WARN}` | `85` | LXC CPU warning threshold (%) |
| `{$LXC.CPU.HIGH}` | `99` | LXC CPU critical threshold (%) |
| `{$CLUSTER.NODES.OFFLINE.MAX}` | `0` | Tolerated offline nodes (raise during maintenance) |
| `{$PVE.NOTBACKEDUP.MAX}` | `0` | Tolerated number of guests without a backup job |
| `{$PVE.BACKUP.JOBS.MIN}` | `1` | Minimum number of configured backup jobs |
| `{$PVE.BACKUP.JOB.STALE}` | `2d` | Maximum time a backup job may go without a next run |
| `{$PVE.USER.EXPIRE.TIME}` | `172800` | Seconds before user expiry to warn (172800 = 2 days) |
| `{$PVE.GUEST.DETAIL.INTERVAL}` | `10m` | Interval of the per guest status request that supplies balloon size, machine type and LXC swap. This is one request per guest, keep it long in large clusters. |
| `{$PVE.GUEST.DETAIL.VMID.MATCHES}` | `.*` | Only guests whose VMID matches get the per guest status request. `^$` switches it off for all guests, which leaves one request per minute for all guest metrics together. |
| `{$CEPH.HEALTH.WARN.PERIOD}` | `15m` | How long Ceph must stay at HEALTH_WARN or worse before the warning fires |
| `{$CEPH.UTIL.WARN}` / `{$CEPH.UTIL.CRIT}` | `75` / `85` | Ceph raw capacity thresholds (%) |
| `{$CEPH.OSD.UTIL.WARN}` / `{$CEPH.OSD.UTIL.CRIT}` | `80` / `90` | Per OSD utilization thresholds (%). Ceph itself warns at 85 and stops writes at 95. |
| `{$CEPH.OSD.LATENCY.MAX}` | `0.2` | OSD commit latency threshold in seconds |
| `{$CEPH.OSD.LATENCY.PERIOD}` | `30m` | How long the latency must stay above the threshold |
| `{$CEPH.POOL.UTIL.WARN}` / `{$CEPH.POOL.UTIL.CRIT}` | `80` / `90` | Pool utilization thresholds (%) |
| `{$CEPH.PG.NOT_CLEAN.PERIOD}` | `1h` | How long placement groups may stay not active+clean |
| `{$CEPH.POOL.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Pools whose name matches are not discovered |
| `{$ENABLE_NODE_STATUS_ALERT}` | `1` | Node offline trigger |
| `{$ENABLE_VM_STOP_ALERT}` | `1` | VM/LXC stopped trigger, context form per VMID |
| `{$PVE.BACKUP.JOB.ALERT}` | `1` | Backup job triggers, context form per job |

### Node template

| Macro | Default | Description |
|-------|---------|-------------|
| `{$NODE.CPU.UTIL.MAX}` | `90` | Node CPU utilization (%) before the high CPU trigger fires |
| `{$MEMORY.UTIL.MAX}` | `90` | Host memory warning threshold (%) |
| `{$SWAP.UTIL.MAX}` | `80` | Host swap warning threshold (%). The trigger stays silent on hosts without swap. |
| `{$ROOTFS.UTIL.WARN}` / `{$ROOTFS.UTIL.CRIT}` | `90` / `95` | Root filesystem thresholds (%) |
| `{$STORAGE.UTIL.WARN}` / `{$STORAGE.UTIL.CRIT}` | `80` / `90` | Storage thresholds (%) |
| `{$DISK.WEAROUT.MIN}` | `20` | Minimum SSD wearout remaining before warning (%) |
| `{$DISK.TEMP.MAX}` | `60` | Disk temperature threshold (degrees Celsius), context form `{$DISK.TEMP.MAX:"/dev/sda"}` |
| `{$ZFS.UTIL.WARN}` / `{$ZFS.UTIL.CRIT}` | `80` / `90` | ZFS pool usage thresholds (%), context form per pool |
| `{$ZFS.FRAG.WARN}` | `60` | ZFS free space fragmentation (%) before warning |
| `{$ZFS.FRAG.UTIL.MIN}` | `70` | Pool usage (%) that must also be reached before the fragmentation warning fires, context form per pool |
| `{$PVE.REPL.FAIL.MAX}` | `0` | Tolerated consecutive failures of a replication job, context form per job |
| `{$PVE.APT.REPO.ERRORS.MAX}` | `0` | Tolerated number of unparsable APT repository files |
| `{$PVE.APT.REPO.WARN.MAX}` | `0` | Tolerated APT repository warnings. A host on the no-subscription repository permanently reports one warning, set this to 1 there. |
| `{$PVE.APT.UPDATES.MAX}` | `0` | Tolerated pending package updates. Only relevant if the disabled apt/update items are switched on. |
| `{$TASK.ALERT.WINDOW}` | `1h` | How long a failed task keeps alerting |
| `{$BACKUP.ALERT.WINDOW}` | `24h` | How long a failed backup keeps alerting |
| `{$PVE.BACKUP.RUN.MAX}` | `3h` | How long a single backup may run before it is reported as hanging |
| `{$DISK.MISSING.TIME}` | `3h` | How long a disk may be absent from the disk list before the missing disk trigger fires |
| `{$IFACE.ACTIVE.WINDOW}` | `7d` | An interface must have been up once within this window before the interface down trigger fires |
| `{$PVE.REPL.LAG}` | `2h` | Maximum age of the last successful replication |
| `{$PVE.CERT.EXPIRE.DAYS}` | `21d` | Lead time before certificate expiry |
| `{$PVE.SUBSCRIPTION.EXPIRE.DAYS}` | `30d` | Lead time before the subscription expires |
| `{$IFACE.NOT_MATCHES}` | `^(tap\|veth\|fwbr\|fwpr\|fwln)` | Host interface names excluded from discovery |
| `{$PVE.SERVICE.MATCHES}` | `^(pve-cluster\|pvedaemon\|pveproxy\|pvestatd\|pve-firewall\|pvescheduler\|pve-ha-crm\|pve-ha-lrm)$` | Services to discover. These run on every node, standalone or clustered. `corosync` only runs on cluster members, add it on those hosts. |
| `{$ENABLE_BACKUP_ALERT}` | `1` | Backup failure trigger |
| `{$ENABLE_STORAGE_AVAILABLE_ALERT}` | `1` | Storage high usage trigger |
| `{$ENABLE_STORAGE_INACTIVE_ALERT}` | `1` | Storage inactive trigger |
| `{$ENABLE_TASK_ALERT}` | `1` | Task failure trigger |
| `{$PVE.SERVICE.STATE.ALERT}` | `1` | PVE service not running trigger, context form `{$PVE.SERVICE.STATE.ALERT:"pveproxy"}=0` |
| `{$PVE.SUBSCRIPTION.ALERT}` | `0` | Subscription status trigger. Off by default so community hosts do not alert on status `notfound`. |

Time macros must carry a unit (`1h`, `30m`).

---

## 4. Discovery Rules

| Template | Rule | Source | Discovers |
|----------|------|--------|-----------|
| Cluster | `discover.qemu` | `/cluster/resources` | VMs on every node with CPU, memory, disk and network metrics |
| Cluster | `discover.lxc` | `/cluster/resources` | Containers on every node with CPU, memory, disk and network metrics |
| Cluster | `discover.nodes` | `/nodes` | Cluster nodes with status and uptime |
| Cluster | `discover.ha.resources` | `/cluster/ha/status/current` | HA-managed VMs and containers |
| Cluster | `discover.ha.lrm` | `/cluster/ha/status/current` | The HA local resource manager of every node |
| Cluster | `discover.sdn` | `/cluster/resources` | SDN zones per node (Proxmox VE 9) |
| Cluster | `discover.backup.jobs` | `/cluster/backup` | Backup jobs with enabled state and next run |
| Cluster | `discover.users` | `/access/users` | User accounts with expiration |
| Cluster | `discover.ceph.cluster` | `/cluster/ceph/status` | The Ceph cluster, only when Ceph is set up |
| Cluster | `discover.ceph.osd` | `/nodes/localhost/ceph/osd` | Every OSD with state, utilization, latency and PG count |
| Cluster | `discover.ceph.pools` | `/nodes/localhost/ceph/pool` | Every pool with utilization, size and min_size |
| Node | `discover.storage` | `/nodes/{node}/storage` | Storages with capacity and active status |
| Node | `discover.backup` | `/nodes/{node}/tasks?typefilter=vzdump` | Backup runs (vzdump/PBS), most recent run per guest |
| Node | `discover.tasks` | `/nodes/{node}/tasks` | Other tasks, deduplicated per type |
| Node | `discover.network` | `/nodes/{node}/network` | Host network interfaces |
| Node | `discover.disks` | `/nodes/{node}/disks/list` | Physical disks with SMART health, temperature, size and wearout |
| Node | `discover.pve.services` | `/nodes/{node}/services` | PVE systemd units |
| Node | `discover.zfs.pools` | `/nodes/{node}/disks/zfs` | ZFS pools with health, usage, fragmentation and dedup ratio |
| Node | `discover.replication` | `/nodes/{node}/replication` | Replication jobs with fail count, last sync and error |
| Node | `discover.certificates` | `/nodes/{node}/certificates/info` | Node certificates with expiry |

Every rule handles an empty list: a cluster without HA, replication jobs, containers or Ceph discovers nothing and the rule stays supported, and resources that disappear are cleaned up.

---

## 5. Triggers

### Cluster template

| Trigger | Severity |
|---------|----------|
| PVE cluster API not reachable (no data for 5 minutes) | High |
| Cluster lost quorum | Disaster |
| Cluster nodes offline | High |
| Node offline | High |
| Not all VMs/LXC running | Info |
| Guests not covered by any backup job | Warning |
| Backup job disabled, stale or too few jobs | Warning |
| VM/LXC stopped, restarted, CPU or memory over threshold, over- or under-provisioned | Info to High |
| VM/LXC migrated to another node | Info |
| HA manager (CRM) has stopped updating its status | High |
| HA manager (CRM) reports time drift | Warning |
| HA LRM on a node is dead, unreadable or has lost its agent lock | High |
| HA node in maintenance mode | Info |
| HA resource in error state | High |
| HA resource being fenced or recovered | High |
| SDN zone in error state | Warning |
| User account expiring | Warning |
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

The messages of the active Ceph health checks are in the item `Ceph health checks`. Zabbix shortens item values to 20 characters in trigger names, operational data and descriptions, so the triggers point to that item instead of repeating the text.

### Node template

| Trigger | Severity |
|---------|----------|
| PVE API not reachable (no data for 5 minutes) | High |
| High CPU usage, high load average | Average |
| High memory usage, high swap usage | Average / Warning |
| High root filesystem usage | Average / High |
| Storage inactive, storage usage over warning / critical threshold | Average / High |
| Disk SMART health not OK, temperature too high, disk missing, SSD wearout low | Warning to High |
| ZFS pool not ONLINE, usage or fragmentation too high | Warning to High |
| PVE service not running | Average |
| Network interface down | Warning |
| Backup failed, backup running longer than `{$PVE.BACKUP.RUN.MAX}` | High / Average |
| Task failed | Warning |
| Replication job failing or not synced within `{$PVE.REPL.LAG}` | Average / Warning |
| Certificate expires within `{$PVE.CERT.EXPIRE.DAYS}` | Warning |
| APT repository files broken, repository warnings, updates pending | Warning / Info |
| Subscription expired, expires soon, not active | Average / Warning |

---

## 6. Dashboards

| Template | Dashboard | Pages |
|----------|-----------|-------|
| Cluster | Proxmox VE cluster | Overview (cluster, quorum, nodes, guests, HA manager, Ceph, guests without backup job, problems), Virtual machines, LXC containers, Nodes and HA, Ceph |
| Node | Proxmox VE node | Overview (uptime, kernel, boot mode, subscription, CPU, memory and root filesystem, problems), Storage and disks |

---

## 7. Notes

- **Load on large clusters:** Guest metrics come from a single `/cluster/resources` request per minute. Zabbix indexes the JSONPath filters of the dependent items, so the cost per guest stays flat as the cluster grows. The only per guest request is the status call for balloon size, machine type and LXC swap; its interval and scope are set with `{$PVE.GUEST.DETAIL.INTERVAL}` and `{$PVE.GUEST.DETAIL.VMID.MATCHES}`. Values that rarely change, such as names, sizes, versions and states, are only stored when they change or once an hour. Numeric items keep 7 days of history and 365 days of trends.
- **Ceph:** PVE answers every Ceph call with HTTP 500 and `{"data":null,"message":...}` while Ceph is not set up. The Ceph master items accept that status, so they stay supported without Ceph, and the item `Ceph API message` shows the reason. The Ceph items are created by a discovery that only finds something when a Ceph status is returned. OSD and pool data is read from `/nodes/localhost/...`: `localhost` is the node that answers the API call, so the paths work on every node. Pool utilization is reported by Ceph as a fraction and converted to percent.
- **HA:** HA data is read from `/cluster/ha/status/current`. PVE reports the CRM and LRM states as text such as `pve (active, <timestamp>)`; a regular expression keeps only the state, so the value only changes when the state does. Without HA the manager status reads `unknown` and both HA discoveries find nothing.
- **Backups:** Backup runs are read with `typefilter=vzdump`. PVE returns only the 50 most recent tasks, and on a node with snapshot or file push automation the unfiltered list can hold no backup at all.
- **Timeouts:** Every HTTP item sets its timeout explicitly, 20 seconds for the API calls and 10 seconds for the per guest status request. Without it Zabbix falls back to 3 seconds, which `/nodes/{node}/disks/list` exceeds on nodes with several disks.
- **Reachability:** The "API not reachable" triggers evaluate a small dependent item (`pve.uptime`, `pve.cluster.vms.total`). `nodata()` cannot evaluate the raw API items because they keep no history.
- **Guests on other nodes:** Every guest carries a `{#NODE}` macro. The per guest status request is sent to the node the guest runs on, so all values are correct for guests on every node, and an informational trigger reports migrations.
- **Standalone node:** `pve.cluster.quorum` returns `1` and `pve.cluster.name` returns `standalone`, the quorum trigger does not fire.
- **SSD wearout:** Read from `/nodes/{node}/disks/list`, not from the SMART endpoint, which does not return this value. Disks that report a non-numeric wearout, such as rotating disks, are discarded instead of turning the item unsupported.
- **CPU temperatures:** Not available through the PVE REST API. Requires an agent or custom script.
- **Physical NIC traffic:** Not available either. `/nodes/{node}/netstat` returns per-guest tap devices and resets its counters on every read, so there are no byte counters for `eno1` or `vmbr0`.
- **ZFS:** `/nodes/{node}/disks/zfs` requires `Sys.Audit` on `/`, not on `/nodes/{node}`.
- **Replication:** The list endpoint already carries the job state, so no extra request per job is needed.
- **Subscription:** `/nodes/{node}/subscription` answers with HTTP 200 even without a subscription and reports status `notfound`. The due date is a plain date string, converted to Unix time for the expiry triggers. Without a subscription there is no due date, the item reports 0 and the expiry triggers ignore it.
- **Permission errors:** The API answers with HTTP 403, so an item lacking permissions turns visibly unsupported rather than silently staying empty.
- **ZFS pool health:** Stored as a number with a value map, 0 is ONLINE, everything above is a fault. A state outside the seven known zpool states leaves text in place and the item turns visibly unsupported instead of reporting a wrong number.

---

## Screenshots

The screenshots show the single template before the split into a cluster and a node template.

<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-52-55" src="https://github.com/user-attachments/assets/3bb2fc8b-e892-4f7b-8dc8-5356986b9b1d" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-14" src="https://github.com/user-attachments/assets/f548341c-975d-44a3-b4d6-5acbb25517b7" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-22" src="https://github.com/user-attachments/assets/091a82e9-3eef-4fd6-84a4-2a806189fe50" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-29" src="https://github.com/user-attachments/assets/f06dde1f-3244-448d-b9e1-3e9e038b68f2" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-33" src="https://github.com/user-attachments/assets/ba551cbb-49c3-452c-ac75-887503af2e8e" />
