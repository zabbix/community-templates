# Zabbix Template Proxmox VE REST API

This Zabbix template enables full monitoring of a Proxmox VE environment via the official REST API (Proxmox VE 7.0+). No Zabbix agent is required inside VMs or on the PVE host. It collects host and cluster metrics, VM and LXC container data, backup jobs, storage status, tasks, network interfaces, HA resources, disk health, and user accounts.

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

### Timing Macros

Values must carry a time unit.

| Macro | Default | Description |
|-------|---------|-------------|
| `{$TASK.ALERT.WINDOW}` | `1h` | How long a failed task keeps alerting. Proxmox VE only keeps the most recent tasks, so without this window a one-off failure would alert forever. |
| `{$BACKUP.ALERT.WINDOW}` | `24h` | How long a failed backup keeps alerting. |
| `{$DISK.MISSING.TIME}` | `3h` | How long a disk may be absent from the disk list before the missing disk trigger fires. The list refreshes hourly. |
| `{$IFACE.ACTIVE.WINDOW}` | `7d` | An interface must have been up once within this window before the interface down trigger fires. |

### Discovery Filter Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$IFACE.NOT_MATCHES}` | `^(tap\|veth\|fwbr\|fwpr\|fwln)` | Host interface names excluded from discovery. The default drops the per-guest interfaces Proxmox creates. |

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

---

## 5. Triggers

### Host-Level

| Trigger | Severity | Description |
|---------|----------|-------------|
| PVE API not reachable | Average | No data from API for 5 minutes |
| High CPU usage (>90%) | Average | PVE host CPU sustained high |
| High load average | Average | Load average ≥ number of CPUs |
| High memory usage | Average | Configurable via `{$MEMORY.UTIL.MAX}` |
| High root filesystem usage | Average / High | Two-level: warn and critical |
| Cluster lost quorum | Disaster | Only fires on actual clusters, not standalone nodes |
| Cluster nodes offline | High | Configurable tolerance via `{$CLUSTER.NODES.OFFLINE.MAX}` |
| VMs/LXC not all running | Info | Cluster-wide: running count < total count |

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

---

## Screenshots

<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/d41f3f60-8220-4326-a2c2-6f28f1ffae57" />
<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/9d4975cd-bf00-4f17-a92f-a67c3d66f162" />
<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/0b1d7b96-e4a2-4b65-9879-0bf9dc69270b" />
<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/d95a382b-00eb-439c-9250-7e0b340ec453" />
<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/48d17e9c-71ae-4e27-8fbe-eb64c666a917" />
