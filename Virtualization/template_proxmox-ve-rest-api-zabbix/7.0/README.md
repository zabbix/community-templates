# Zabbix Template Proxmox VE REST API

This Zabbix template enables full monitoring of a Proxmox VE environment via the official REST API (Proxmox VE 7.0+). No Zabbix agent is required inside VMs or on the PVE host. It collects host and cluster metrics, VM and LXC container data, backup jobs, storage status, tasks, network interfaces, HA resources, disk health, and user accounts. It also covers the PVE services themselves, ZFS pools, replication jobs, certificate expiry, APT repository state and the subscription status.

Works on standalone single-node setups as well as full clusters.

---

## Requirements

- Zabbix Server 7.0 or higher
- Proxmox VE 7.0 or higher
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

> **Note for pending updates:** `/nodes/{node}/apt/update` is the only endpoint in this template that requires `Sys.Modify` rather than `Sys.Audit`, so `PVEAuditor` cannot read it. The corresponding master item `pve.apt.update.raw` and its dependent item are therefore **disabled by default**. Enable them only if you accept granting the monitoring token write level permissions. The repository state is monitored through `/nodes/{node}/apt/repositories` instead, which only needs `Sys.Audit`.

> **Note for disk monitoring:** `/nodes/{node}/disks/list` requires the `Sys.Audit` privilege. `PVEAuditor` includes this privilege. If disk items show "not supported", verify that the role is applied with **Propagate** enabled and that the token has the correct path `/`.

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
| `{$PVE.USER.EXPIRE.TIME}` | `172800` | Seconds before user expiry to warn (172800 = 2 days) |
| `{$DISK.TEMP.MAX}` | `60` | Disk temperature threshold (degrees Celsius). Context form `{$DISK.TEMP.MAX:"/dev/sda"}` raises it for one disk. |
| `{$NODE.CPU.UTIL.MAX}` | `90` | Node CPU utilization (%) before the high CPU trigger fires. This threshold used to be hardcoded in the trigger expression. |
| `{$ZFS.UTIL.WARN}` | `80` | ZFS pool usage (%) for the average severity trigger. ZFS performance degrades noticeably above 80%. Context form `{$ZFS.UTIL.WARN:"rpool"}`. |
| `{$ZFS.UTIL.CRIT}` | `90` | ZFS pool usage (%) for the high severity trigger. |
| `{$ZFS.FRAG.WARN}` | `60` | ZFS free space fragmentation (%) before warning. |
| `{$PVE.REPL.FAIL.MAX}` | `0` | Tolerated consecutive failures of a replication job. Context form `{$PVE.REPL.FAIL.MAX:"105-0"}`. |
| `{$PVE.NOTBACKEDUP.MAX}` | `0` | Tolerated number of guests without a backup job. Raise it if some guests are deliberately excluded. |
| `{$PVE.APT.REPO.ERRORS.MAX}` | `0` | Tolerated number of unparsable APT repository files. |
| `{$PVE.APT.REPO.WARN.MAX}` | `0` | Tolerated number of APT repository warnings. A host on the no-subscription repository permanently reports one warning, set this to 1 there. |
| `{$PVE.APT.UPDATES.MAX}` | `0` | Tolerated number of pending package updates. Only relevant if the disabled apt/update items are switched on. |

### Timing Macros

Values must carry a time unit.

| Macro | Default | Description |
|-------|---------|-------------|
| `{$TASK.ALERT.WINDOW}` | `1h` | How long a failed task keeps alerting. Proxmox VE only keeps the most recent tasks, so without this window a one-off failure would alert forever. |
| `{$BACKUP.ALERT.WINDOW}` | `24h` | How long a failed backup keeps alerting. |
| `{$DISK.MISSING.TIME}` | `3h` | How long a disk may be absent from the disk list before the missing disk trigger fires. The list refreshes hourly. |
| `{$IFACE.ACTIVE.WINDOW}` | `7d` | An interface must have been up once within this window before the interface down trigger fires. |
| `{$PVE.REPL.LAG}` | `2h` | Maximum age of the last successful replication. Must stay above the replication schedule, otherwise the trigger fires between two runs. |
| `{$PVE.CERT.EXPIRE.DAYS}` | `21d` | Lead time before certificate expiry. |
| `{$PVE.SUBSCRIPTION.EXPIRE.DAYS}` | `30d` | Lead time before the subscription expires. |

### Discovery Filter Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$IFACE.NOT_MATCHES}` | `^(tap\|veth\|fwbr\|fwpr\|fwln)` | Host interface names excluded from discovery. The default drops the per-guest interfaces Proxmox creates. |
| `{$PVE.SERVICE.MATCHES}` | `^(pve-cluster\|pvedaemon\|pveproxy\|pvestatd\|pve-firewall)$` | Which PVE services are discovered. `corosync`, `pve-ha-lrm` and `pve-ha-crm` are excluded by default because they are legitimately inactive on a standalone node. Extend the regex in a cluster. |

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
| `discover.backup` | `/nodes/{node}/tasks` | Backup jobs (vzdump/PBS), grouped by VM, most recent run |
| `discover.tasks` | `/nodes/{node}/tasks` | Non-backup tasks, deduplicated per type |
| `discover.users` | `/access/users` | PVE user accounts with expiration monitoring |
| `discover.network` | `/nodes/{node}/network` | Host network interfaces (bridge, bond, eth, vlan) |
| `discover.ha.resources` | `/cluster/ha/status/current` | HA-protected VMs and containers |
| `discover.disks` | `/nodes/{node}/disks/list` | Physical disks of any type with SMART health, temperature, size and wearout |
| `discover.pve.services` | `/nodes/{node}/services` | The systemd units PVE manages, with SubState, UnitFileState and ActiveState |
| `discover.zfs.pools` | `/nodes/{node}/disks/zfs` | Local ZFS pools with health, size, allocated, free, fragmentation, dedup ratio and calculated utilization |
| `discover.replication` | `/nodes/{node}/replication` | ZFS replication jobs with fail count, last sync, last try, duration and error message |
| `discover.certificates` | `/nodes/{node}/certificates/info` | Node certificates with expiry timestamp, subject and issuer |

---

## 5. Triggers

### Host-Level

| Trigger | Severity | Description |
|---------|----------|-------------|
| PVE API not reachable | High | No data from API for 5 minutes. When the API is gone this is the cause of every other outage, so it outranks the individual failures. |
| High CPU usage | Average | PVE host CPU sustained high, threshold via `{$NODE.CPU.UTIL.MAX}` |
| High load average | Average | Load average ≥ number of CPUs |
| High memory usage | Average | Configurable via `{$MEMORY.UTIL.MAX}` |
| High root filesystem usage | Average / High | Two-level: warn and critical |
| Cluster lost quorum | Disaster | Only fires on actual clusters, not standalone nodes |
| Cluster nodes offline | High | Configurable tolerance via `{$CLUSTER.NODES.OFFLINE.MAX}` |
| VMs/LXC not all running | Info | Cluster-wide: running count < total count |
| Guests not covered by any backup job | Warning | From `/cluster/backup-info/not-backed-up`. Catches the guest that was created after the backup job was defined. |
| APT repository files are broken | Warning | At least one repository file cannot be parsed, updates will fail |
| APT repository configuration has warnings | Info | For example the enterprise repository enabled without a subscription |
| Package updates pending | Info | Disabled by default, like the item it depends on |
| PVE subscription has expired | Average | The subscription period has ended, the enterprise repository is no longer accessible |
| PVE subscription expires soon | Warning | Advance warning via `{$PVE.SUBSCRIPTION.EXPIRE.DAYS}`, depends on the expired trigger so only one is open at a time |
| PVE subscription is not active | Warning | Status invalid, suspended or notfound. Off by default, see `{$PVE.SUBSCRIPTION.ALERT}` |

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
| Task failed | Warning |
| User account expiring within 2 days | Warning |
| Node offline | High |
| Network interface down | Warning |
| HA resource in error state | High |
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

---

## 6. Dashboard

The template includes a pre-built dashboard **"Proxmox VE - Monitoring Dashboard"** with the following pages:

| Page | Contents |
|------|----------|
| Overview | Version, Uptime, CPU%, Memory%, Cluster status, VMs running/total, active Problems |
| PVE | RootFS graph, Load Average (time-series), CPU and Memory graphs |
| Storage | Utilization pie charts, usage % trend, active status |
| QEMU/KVM-VMs | CPU, memory, disk I/O, network, status per VM |
| LXC - Container | CPU, memory, swap, disk I/O, network, status per container |
| Backup | Backup status per VM |
| Nodes | Node status and uptime |
| Cluster | Cluster name, quorum, nodes online/total, VMs running/total, problems |
| HA & Disks | Network interface status, HA resource states |
| Tasks | Task status per type |
| Network | VM and LXC network I/O (current and cumulative) |

---

## 7. Notes

- **Cluster support:** Guest discovery and all guest metrics come from `/cluster/resources`, so VMs and containers on every node are monitored from a single Zabbix host and a live migration does not break their items. Each guest carries a `{#NODE}` macro and a `Node of <vmid>` item, and an informational trigger fires when that value changes. Five guest values are not part of `/cluster/resources` and are still read from the node given by `{$PVE_NODE}`: QEMU balloon size, balloon minimum and machine type, plus LXC swap and maximum swap. For guests on other nodes these five stay empty instead of turning unsupported.
- **Node-scoped data:** Disks, host network interfaces, storage, tasks, time, version and host status are read per node from `{$PVE_NODE}`. To monitor several nodes in that depth, add one Zabbix host per PVE node with its own `{$PVE_NODE}`.
- **Single-node without cluster:** Fully supported. `pve.cluster.quorum` returns `1` and `pve.cluster.name` returns `standalone`, the quorum-lost trigger will not fire.
- **Disk monitoring:** Requires `Sys.Audit` privilege. If disk items show "not supported", check that the API token role is applied with Propagate enabled at path `/`.
- **HA monitoring:** Only relevant if PVE HA is configured. If no HA resources exist, discovery returns nothing and the rule stays supported. HA data is read from `/cluster/ha/status/current`, which carries the CRM master status and one entry per HA-managed service. The plain `/cluster/ha/status` path is a directory index only and returns no status data.
- **SSD wearout:** Read from `/nodes/{node}/disks/list`, not from the SMART endpoint, which does not return this value. Disks that report a non-numeric wearout, such as rotating disks, are discarded instead of turning the item unsupported.
- **CPU temperatures:** Not available through the PVE REST API. Requires an agent or custom script.
- **Physical NIC traffic:** Not available either. `/nodes/{node}/netstat` returns per-guest tap devices and resets its counters on every read, so there are no byte counters for `eno1` or `vmbr0`. `/nodes/{node}/rrddata` only carries the node aggregate.
- **ZFS:** `/nodes/{node}/disks/zfs` requires `Sys.Audit` on `/`, not on `/nodes/{node}`. On nodes without ZFS the discovery simply returns nothing and stays supported.
- **Replication:** The list endpoint already carries the job state, so no extra request per job is needed. Fields such as `last_sync` and `error` are absent before the first run or while the job is healthy; those items discard the value instead of turning unsupported.
- **Subscription:** `/nodes/{node}/subscription` needs no special permission and answers with HTTP 200 even without a subscription, reporting status `notfound`. Unlike the certificate endpoint it reports `nextduedate` as a plain date string rather than an epoch, so a single JavaScript preprocessing line converts it for the expiry triggers. Those triggers need no enable macro: a host without a subscription reports no due date, so the item stays empty and they cannot fire.
- **Permission errors:** The API answers with HTTP 403, so an item lacking permissions turns visibly unsupported rather than silently staying empty.
- **ZFS pool health:** Stored as a number with a value map rather than as text, so it can be graphed and shown on a dashboard. 0 is ONLINE, everything above is a fault. The mapping is done with preprocessing steps, not with a script. A state outside the seven known zpool states leaves text in place and the item turns visibly unsupported instead of reporting a wrong number.
- **Long term data:** Numeric performance and capacity items keep 365 days of trends. Timestamp items such as `last_sync` or `notafter` deliberately keep trends disabled, a trend over a Unix timestamp carries no meaning.

---

## Screenshots

<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-52-55" src="https://github.com/user-attachments/assets/3bb2fc8b-e892-4f7b-8dc8-5356986b9b1d" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-14" src="https://github.com/user-attachments/assets/f548341c-975d-44a3-b4d6-5acbb25517b7" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-22" src="https://github.com/user-attachments/assets/091a82e9-3eef-4fd6-84a4-2a806189fe50" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-29" src="https://github.com/user-attachments/assets/f06dde1f-3244-448d-b9e1-3e9e038b68f2" />
<img width="3801" height="2145" alt="Bildschirmfoto vom 2026-08-16 23-53-33" src="https://github.com/user-attachments/assets/ba551cbb-49c3-452c-ac75-887503af2e8e" />



