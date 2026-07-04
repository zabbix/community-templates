# Zabbix Template Proxmox Backup Server by HTTP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This Zabbix template enables full monitoring of a Proxmox Proxmox Backup Server via the official REST API. It collects host metrics, datastore status, disk status, services, and subscription information, and automatically generates discovery rules for datastores disks, zfs pools and running services. In addition to appliance and datastore health, it monitors per-backup-group **snapshot freshness** across all namespaces (alerting when a group's most recent backup becomes too old) and detects **failed backup and other tasks** from the node task log.

---

## Requirements

- **Zabbix Server** version 7.4 or higher  
- **HTTP Agent** module enabled on the Zabbix server  
- Proxmox Backup Server API token with read permissions for System and Datastores
- Host macros defined on the Zabbix host object (see “Macros” section)
  
## 1. Create the Zabbix API User

1. **Log in**  
   - Open the Proxmox Backup Server web interface.

2. **Create the user**  
   - Navigate to **Access Control → User Management → **Add**
   - **User name:** `zabbix@pbs`
   - **Password:** (choose a strong password)
   - **Email:** (optional)
   - Click **Add**.

3. **Assign Audit role**
   - Under **Access Control → Permissions**, click **Add → User Permission**  
     - **Path:** `/`
     - **User:** `zabbix@pbs`
     - **Role:** `Audit`
   - Click **Add**.

4. **Assign DatastoreAudit role**
   - Under **Access Control → Permissions**, click **Add → User Permission**  
     - **Path:** `/datastore`
     - **User:** `zabbix@pbs`
     - **Role:** `DatastoreAudit`
   - Click **Add**.

---

## 2. Create the API Token with Privilege Separation

1. **Generate the token**  
   - Go to **Access Control → API Tokens** → **Add**
     - **User:** `zabbix@pbs`
     - **Token ID:** `Zabbix`
   - Click **Add** and note the **Token Secret**.

2. **Assign Audit role**
   - Go to **Datacenter → Permissions** → **Add → API Token Permission**
     - **Path:** `/`
     - **User/Group/API Token:** `zabbix@pbs!Zabbix`
     - **Role:** `Audit`
   - Click **Add**.

3. **Assign DatastoreAudit role**
   - Go to **Datacenter → Permissions** → **Add → API Token Permission**
     - **Path:** `/datastore`
     - **User/Group/API Token:** `zabbix@pbs!Zabbix`
     - **Role:** `DatastoreAudit`
   - Click **Add**.

The `Audit` role on `/` and `DatastoreAudit` on `/datastore` are sufficient for the snapshot-freshness and task-error monitoring described below — no additional permissions are required.

## Installation

1. Download the template `template_proxmox_backup_server_by_http.yaml`.  
2. In the Zabbix web interface, go to **Configuration → Templates → Import** and import the template.  
3. Create a new host:
   - Go to **Configuration → Hosts → Create host**
   - Enter a **Host name** (e.g. `pbs01`)
   - Assign the template **Template Proxmox Backup Server by HTTP**
   - Set the appropriate **Group** (e.g. `Linux servers`)
   - Leave the **Interfaces** section empty (the template uses the API, not an agent)
4. Configure the required host macros (see the “Macros” section of the documentation).

## Usage

1. Create an API token on the Proxmox Backup Server.  
2. Add or select the host in Zabbix.
3. Assign the “Template Proxmox Backup Server by HTTP” to the host.
4. Configure macros on the host’s Template tab (API credentials, node name, etc.).
5. Enable monitoring and check initial metrics under **Monitoring → Latest data**.

## Macros

### Required Macros

| Macro                   | Example Value      | Description                                          |
|-------------------------|--------------------|------------------------------------------------------|
| `{$PBS.URL.HOST}`       | `192.168.1.1`      | IP address or hostname of the Proxmox Backup Server  |
| `{$PBS.URL.PORT}`       | `8007`             | TCP port of the Proxmox API (default: 8007)          |
| `{$PBS.TOKEN.ID}`       | `zabbix@pbs!Zabbix`| Name/ID of the API token                             |
| `{$PBS.TOKEN.SECRET}`   | **SECRET_TEXT**    | API token (store as a secret macro on the host)      |

### Optional Macros

These have sensible defaults and only need changing to override behaviour. The snapshot-age macros support per-backup-group overrides via the `{#BACKUP.GROUP}` macro context (e.g. set `{$PBS.SNAPSHOT.AGE.WARN:"vm/100"}` on the host to relax the threshold for a single group). The context matches by group name only, so the same group name in different namespaces shares one threshold.

| Macro                            | Default          | Description                                                                                              |
|----------------------------------|------------------|--------------------------------------------------------------------------------------------------------|
| `{$PBS.SNAPSHOT.AGE.WARN}`       | `30h`            | Age of a backup group's most recent snapshot above which a WARNING trigger fires (suits a daily schedule). |
| `{$PBS.SNAPSHOT.AGE.HIGH}`       | `50h`            | Age above which a HIGH trigger fires.                                                                    |
| `{$PBS.SNAPSHOT.INTERVAL}`       | `15m`            | Polling interval of the backup-group list used for snapshot freshness. Each poll lists every backup group of each datastore across all namespaces, so keep this interval moderate. |
| `{$PBS.SNAPSHOT.IGNORE.COMMENT}` | `(?i)no-monitor` | Regex matched against a group's comment; a match suppresses that group's freshness triggers.            |
| `{$PBS.TASKS.DAYS}`              | `2`              | Age window (days) of tasks scanned when looking for failed tasks.                                       |
| `{$PBS.LLD.DISABLE.LOST}`        | `1h`             | Grace period after which a discovered backup-group item is disabled once its group no longer exists.    |
| `{$PBS.LLD.KEEP.LOST}`           | `14d`            | Period after which a vanished, already-disabled backup-group item is deleted (must exceed `{$PBS.LLD.DISABLE.LOST}`). |

## Contents of the Template

### 1. Discovery Rules

| Discovery Rule                   | Description                                                 |
|----------------------------------|-------------------------------------------------------------|
| **proxmox.datastore.discovery**  | Detection of all datastores                                 |
| **proxmox.node.discovery**       | Detection of all nodes (currently only localhost)           |
| **proxmox.disk.discovery**       | Detection of all disks                                      |
| **proxmox.disk.ssd.discovery**   | Detect if disk is SSD                                       |
| **proxmox.service.discovery**    | Detection of all running services                           |
| **proxmox.zfs.discovery**        | Detection of all zfs pools                                  |
| **proxmox.backupgroup.discovery**| Detection of backup groups (backup-type/backup-id) that have at least one snapshot, in any datastore and namespace |

### 2. Trigger Prototypes

- Low space on datastore
- ZFS health
- SSD wearout
- Service failure
- Node performance issues
- Subscription check
- Update check
- Backup group snapshot too old (warning / high)
- Failed backup tasks
- Failed other tasks

## Backup Group Snapshot Freshness

The **Backup group discovery** rule (`proxmox.backupgroup.discovery`) discovers every backup group — a `backup-type/backup-id` pair such as `vm/100` or `host/myclient` — that has at least one snapshot in any datastore and any namespace (including the root namespace), and creates a **Last snapshot age** item per group. Each discovered item is identified by datastore, namespace and group, so the same group name in different namespaces is tracked separately; an empty namespace suffix in an item or trigger name denotes the datastore's root namespace. That item reports the number of seconds since the group's most recent snapshot, so it measures end-to-end freshness: for datastores fed by a sync job the snapshots keep the source's original backup time, so the age on the sync target reflects the client backup plus the sync.

Two trigger prototypes alert when a group falls behind schedule:

- **WARNING** when the age exceeds `{$PBS.SNAPSHOT.AGE.WARN}` (default `30h`)
- **HIGH** when the age exceeds `{$PBS.SNAPSHOT.AGE.HIGH}` (default `50h`)

The HIGH trigger suppresses the WARNING one (dependency), so a stale group raises a single alert. Both defaults suit a daily backup schedule; override them globally or per group using the `{#BACKUP.GROUP}` macro context.

### Suppressing freshness alerts for retained backups

When a source VM/CT has been deleted but its backups are intentionally kept, the group stops receiving new snapshots and would otherwise alert forever. To silence such a group, add a marker to its comment in PBS (**Datastore → Content → select the group → Edit comment**) matching `{$PBS.SNAPSHOT.IGNORE.COMMENT}` (default: the text `no-monitor`, case-insensitive). A discovery override then drops the freshness trigger prototypes for that group while keeping the age item. Comments are stored per group per namespace, so this suppresses only that group in the namespace whose comment you edit.

### Lost-group lifecycle

A group that disappears from PBS (for example after the last snapshot is pruned) is not deleted from Zabbix immediately. Its item is first **disabled** after `{$PBS.LLD.DISABLE.LOST}` (default `1h`) so Zabbix stops polling the gone resource, and then **deleted** after `{$PBS.LLD.KEEP.LOST}` (default `14d`). `{$PBS.LLD.KEEP.LOST}` must be larger than `{$PBS.LLD.DISABLE.LOST}`.

## Backup Task Errors

The **Get failed tasks** item polls the node task log for tasks that finished with an error or warning within the last `{$PBS.TASKS.DAYS}` days (default `2`) and feeds two dependent items:

- **Failed backup tasks** (`proxmox.tasks.error.backup`) — client backup jobs that did not complete. This is the signal for "a backup failed", which the per-datastore maintenance-job monitoring does not cover.
- **Failed other tasks** (`proxmox.tasks.error.other`) — errored tasks whose worker type is neither a backup job nor one of the maintenance jobs already monitored per datastore (garbage collection, prune, sync, verify); it catches e.g. tape and reader tasks.

Each raises a HIGH trigger while at least one matching failed task is present in the window, and recovers automatically once the window clears. Garbage-collection, prune, verify and sync outcomes are intentionally **not** duplicated here — they are already tracked per datastore by the `proxmox.datastore.{gc,prune,verify,sync}.last-run-state` items.

## Related Projects

- [Official Zabbix Templates](https://www.zabbix.com/integrations)
- [Proxmox Backup Server API](https://pbs.proxmox.com/docs/api-viewer/index.html)

## License

This project is licensed under the MIT License.

## Authors

- **nikosch86** – Inspiration ("Proxmox Backup Server via HTTPS API" template) and contributions  
- **krumboeck** – Initial work (krumboeck@universalnet.at)  
- **Voltkraft** – Inspiration and contributions  


## Disclaimer

This template is provided as-is. Test thoroughly in your environment before production use. The author is not responsible for any issues that may arise from using this template.
