# Zabbix Template Proxmox Backup Server by HTTP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This Zabbix template enables full monitoring of a Proxmox Proxmox Backup Server via the official REST API. It collects host metrics, datastore status, disk status, services, and subscription information, and automatically generates discovery rules for datastores disks, zfs pools and running services. In addition to appliance and datastore health, it monitors per-backup-group **snapshot freshness** across all namespaces (alerting when a group's most recent backup becomes too old) and detects **failed backup and other tasks** from the node task log.

---

## Requirements

- **Zabbix Server** version 7.4 or higher  
- **HTTP Agent** module enabled on the Zabbix server  
- Proxmox Backup Server API token with read permissions for System, Datastores and **Remotes** (`RemoteAudit` is required to see sync jobs at all — see below)
- Host macros defined on the Zabbix host object (see “Macros” section)
- A Proxmox Backup Server certificate that the Zabbix server trusts (see “TLS certificate validation”)

### TLS certificate validation

The template validates the Proxmox Backup Server's TLS certificate on every request, because each request carries the API token in an `Authorization` header and an unvalidated connection would expose that token to interception.

A default PBS installation uses a **self-signed** certificate, which the Zabbix server will not trust out of the box. Either install a certificate from a CA the Zabbix server already trusts, or add the PBS CA certificate to the trust store of the machine running the Zabbix server (on Debian/Ubuntu: drop the CA into `/usr/local/share/ca-certificates/` and run `update-ca-certificates`, then restart `zabbix-server`).

If the certificate is not trusted, the items fail and the **API service not available** trigger fires — the template will not fall back to an unverified connection.

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

5. **Assign RemoteAudit role** *(needed for sync-job monitoring)*
   - Under **Access Control → Permissions**, click **Add → User Permission**  
     - **Path:** `/remote`
     - **User:** `zabbix@pbs`
     - **Role:** `RemoteAudit`
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

4. **Assign RemoteAudit role** — *required for sync-job monitoring*
   - Go to **Datacenter → Permissions** → **Add → API Token Permission**
     - **Path:** `/remote`
     - **User/Group/API Token:** `zabbix@pbs!Zabbix`
     - **Role:** `RemoteAudit`
   - Click **Add**.

> ### ⚠ Why `RemoteAudit` matters more than it looks
>
> Sync jobs are **remote-scoped**, and PBS **filters configuration listings by permission**: a token that
> may not read `/remote` is handed an **empty list, not a `403`**.
>
> So a token with only `Audit` and `DatastoreAudit` sees *zero* **pull** sync jobs, every sync item
> reports success, and **sync monitoring silently does nothing** — while looking perfectly healthy. If you
> run pull sync jobs, grant `RemoteAudit` or you are not monitoring them.
>
> Note this is only **half** of what makes sync monitoring go quiet. `/admin/sync` also defaults to
> listing **pull** jobs only, so a server whose sync jobs are all **push** jobs reports none no matter
> what privileges you grant. The template passes `sync-direction=all` to cover both — see
> `{$PBS.SYNC.DIRECTION}`.

`Audit` on `/`, `DatastoreAudit` on `/datastore` and `RemoteAudit` on `/remote` are sufficient for everything this template monitors — no write privileges are needed anywhere.

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
| `{$PBS.APT.REPOSITORIES.ENABLED.MIN}` | `1`        | Minimum number of enabled APT repositories expected on a node. Set to `0` with a node context if a node intentionally has no enabled repositories. |
| `{$PBS.SNAPSHOT.AGE.WARN}`       | `30h`            | Age of a backup group's most recent snapshot above which a WARNING trigger fires (suits a daily schedule). |
| `{$PBS.SNAPSHOT.AGE.HIGH}`       | `50h`            | Age above which a HIGH trigger fires.                                                                    |
| `{$PBS.SNAPSHOT.INTERVAL}`       | `15m`            | Polling interval of the backup-group list used for snapshot freshness. Each poll lists every backup group of each datastore across all namespaces, so keep this interval moderate. |
| `{$PBS.SNAPSHOT.IGNORE.COMMENT}` | `(?i)no-monitor` | Regex matched against a group's comment; a match suppresses that group's freshness triggers.            |
| `{$PBS.SYNC.DIRECTION}`          | `all`            | Which sync jobs to list. `/admin/sync` defaults to `pull`, so a server whose sync jobs are all **push** jobs reports none at all and its sync monitoring silently does nothing. `all` covers both. Only change this if your PBS predates push sync and rejects the parameter. |
| `{$PBS.TASKS.DAYS}`              | `2`              | Age window (days) of tasks scanned when looking for failed tasks.                                       |
| `{$PBS.LLD.DISABLE.LOST}`        | `1h`             | Grace period after which a discovered backup-group item is disabled once its group no longer exists.    |
| `{$PBS.LLD.KEEP.LOST}`           | `14d`            | Period after which a vanished, already-disabled backup-group item is deleted (must exceed `{$PBS.LLD.DISABLE.LOST}`). |
| `{$PBS.SUBSCRIPTION.STATE.ACTIVE}`   | `active`         | Regex of subscription states considered acceptable. **Running PBS without a subscription? Set this to `active\|notfound`** — see “Running without a subscription” below. |
| `{$PBS.VERIFY.INTERVAL}`         | `1h`             | Polling interval of the snapshot verification state. Each poll lists every snapshot of every datastore across all namespaces, which is markedly more expensive than the other items, so keep this interval long. |
| `{$PBS.VERIFY.JOB.EXPECTED}`     | `1`              | Whether a verify job is expected to exist for a datastore. Set to `0`, optionally with a datastore context, to suppress the “No verify job configured” trigger for datastores intentionally left unverified. |
| `{$PBS.SNAPSHOT.UNVERIFIED.WARN}` | `0`             | Snapshots missed by verification tolerated per datastore before the “Snapshots missed by verification” trigger fires. Supports a `{#DATASTORE.NAME}` context. |

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
- APT repository check
- Backup group snapshot too old (warning / high)
- Failed backup tasks
- Failed other tasks
- Failed manual verify tasks
- Maintenance job (garbage collection / prune / verify / sync) finished with error or warning
- No verify job configured on a datastore
- Snapshots failing verification (high) / snapshots missed by verification (warning)

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
- **Failed manual verify tasks** (`proxmox.tasks.error.verify`) — verify tasks started by hand (worker types `verify`, `verify_snapshot`, `verify_group`). Scheduled verify jobs (`verificationjob`) are deliberately excluded here because they are already covered per datastore; the `/admin/verify` endpoint that the per-datastore items read only knows about *configured* jobs, so without this item a manual verify that found corruption would report nowhere.
- **Failed other tasks** (`proxmox.tasks.error.other`) — errored tasks whose worker type is neither a backup job nor one of the maintenance jobs already monitored per datastore (garbage collection, prune, sync, verify); it catches e.g. tape and reader tasks.

Each raises a HIGH trigger while at least one matching failed task is present in the window, and recovers automatically once the window clears. Scheduled garbage-collection, prune, verify and sync outcomes are intentionally **not** duplicated here — they are tracked per datastore by the `proxmox.datastore.{gc,prune,verify,sync}.last-run-state` items.

## Running without a subscription

Proxmox Backup Server is free software; the subscription is optional paid support. Running without one is a normal, fully supported deployment — and a **Dockerised PBS cannot hold a subscription at all**. Such a node reports its subscription state as `notfound`, permanently.

PBS reports exactly one of: `new`, `notfound`, `active`, `invalid`, `expired`, `suspended`.

`{$PBS.SUBSCRIPTION.STATE.ACTIVE}` is a **regular expression listing the states you consider acceptable**, and defaults to `active`. If you have no subscription, set it to:

```
{$PBS.SUBSCRIPTION.STATE.ACTIVE} = active|notfound
```

Do this **instead of disabling the trigger.** `notfound` then stops alerting, while `invalid`, `expired` and `suspended` still do — and those are genuinely worth knowing about even on a free install. Disabling the trigger outright throws that away. The macro supports a node context, so you can set it per node.

## APT Repository Monitoring

The template reads `/nodes/{node}/apt/repositories` once per hour and stores the parsed repository state.

It creates node-level items for:

- enabled APT repository count
- repository parser error count
- repository warning count (PBS API warnings plus enabled non-production standard repositories such as `pbs-no-subscription` or `pbstest`)
- standard repository states
- repository diagnostics text

Two WARNING triggers are generated:

- **APT repository parsing errors** — fires when PBS reports one or more problematic repository files, or when the repository endpoint cannot be queried.
- **No enabled APT repositories** — fires when the enabled repository count is below `{$PBS.APT.REPOSITORIES.ENABLED.MIN}` (default `1`).

The warning count is collected but does not alert by default because PBS can report advisory repository messages that are useful context but not universally actionable. It also counts enabled Proxmox standard repositories that are not recommended for production use, for example `pbs-no-subscription` and `pbstest`.

If the repository endpoint itself cannot be queried, the diagnostics item includes the HTTP status and the beginning of the response body so permission problems, missing endpoints and API errors can be distinguished.

## Verification Monitoring

Verification is what detects corrupt backup data, so the template tracks it from three angles. They are complementary — none of them subsumes the others.

**1. Did the verify job run, and did it pass?** The per-datastore `proxmox.datastore.verify.last-run-state` item reports the outcome of the datastore's configured verify jobs, and raises a **HIGH** trigger when the last run failed (a failed verify means at least one corrupt chunk) and a **WARNING** when it completed with warnings. Where a datastore has several verify jobs, the *worst* outcome is reported, so a failing job is not hidden behind a healthy one.

**2. Is there a verify job at all?** A datastore with no verify job configured is never checked for corruption, and its verify item never receives a value — which on a dashboard is indistinguishable from a healthy datastore. The **Verify job configured** item makes that state explicit and raises a **WARNING**. Set `{$PBS.VERIFY.JOB.EXPECTED}` to `0` (optionally with a datastore context) for datastores you intentionally leave unverified.

**3. What is the actual state of the data?** The **Get snapshot verification state** item walks every snapshot of every datastore across all namespaces and reports two counts per datastore:

- **Snapshots failing verification** — snapshots whose last verification *failed*. This is corrupt backup data; restoring from those snapshots may not be possible. Raises a **HIGH** trigger.
- **Snapshots missed by verification** — snapshots that **already existed when a verify job last finished** and are *still* unverified. That run should have covered them and did not, so verification is silently skipping data: its scope does not reach them, or it is not completing. They are neither known-good nor known-bad. Raises a **WARNING** above `{$PBS.SNAPSHOT.UNVERIFIED.WARN}`.

  Backups taken *since* the last verify run are **not** counted — they are waiting their turn, not being skipped. This distinction matters: on any datastore that backs up more often than it verifies (a daily backup with a weekly verify, say), simply counting *all* unverified snapshots would be non-zero roughly six days in seven and would tell you nothing at all.

Because it enumerates every snapshot, this item polls on its own slow interval (`{$PBS.VERIFY.INTERVAL}`, one hour by default). A datastore whose snapshot list cannot be read is omitted rather than reported as clean, so a transient API failure cannot silently clear a real alarm.

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
