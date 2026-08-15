 sc  # Podman by Zabbix Agent Active

## Overview

Monitors rootful and rootless Podman containers via a central JSON collector script running as a cron job. Supports multiple users (rootful + rootless) on the same host without UserParameters or sudo configuration.

The collector script (`scripts/zabbix_podman_collect.sh`) runs every minute as root, detects active Podman sockets, collects data per user via `runuser`, and writes `/var/log/podman.json`. The Zabbix Agent (active) reads this file as a single master item; all other items are dependent.

## Requirements

- Zabbix Agent (active) ≥ 7.0
- Podman ≥ 4.0
- Python 3
- Linux with rootless Podman support (tested on Debian 13; other distributions not tested)

## Setup

### 1. Deploy collector script

```bash
cp Podman-by-Zabbix-Agent-Active/scripts/zabbix_podman_collect.sh /usr/local/bin/
chmod 750 /usr/local/bin/zabbix_podman_collect.sh
```

### 2. Add cron job

```
crontab -e
*/5 * * * * root /usr/local/bin/zabbix_podman_collect.sh
```

Optional environment variables:

| Variable | Default | Description |
|----------|---------|-------------|
| `PODMAN_COLLECT_TIMEOUT` | `30` | Per-command timeout in seconds |
| `PODMAN_COLLECT_DISK` | `1` | Set to `0` to skip `podman system df` (faster on large hosts) |

### 3. Verify output

```bash
cat /var/log/podman.json | python3 -m json.tool | head -40
```

### 4. Import template

Import `7.0/template_podman_by_zabbix_agent.yaml` via **Data collection → Templates → Import**.

### 5. Assign to host

Link **Podman by Zabbix Agent Active** to the host. No additional agent configuration required.

## Large environments

If not all containers/pods appear in Zabbix, increase these values in `/etc/zabbix/zabbix_agent2.conf`:

```
BufferSize=1000
Timeout=30
```

Then restart the agent.

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|`{$PODMAN.UPDATE.INTERVAL}`|How often Zabbix reads the collector JSON|`60s`|Text macro|
|`{$PODMAN.NODATA.TIMEOUT}`|Alert if collector JSON is not updated within this period|`5m`|Text macro|
|`{$PODMAN.CONTAINER.MATCHES}`|LLD filter: container names to include (regex)|`.*`|Text macro|
|`{$PODMAN.CONTAINER.NOT_MATCHES}`|LLD filter: container names to exclude (regex)|`CHANGE_IF_NEEDED`|Text macro|
|`{$PODMAN.CPU.CRIT}`|Container CPU usage threshold for trigger (%)|`90`|Text macro|
|`{$PODMAN.MEM.CRIT}`|Container memory usage threshold for trigger (%)|`90`|Text macro|
|`{$PODMAN.STORE.CRIT}`|Storage usage threshold per user for trigger (%)|`90`|Text macro|
|`{$PODMAN.IMAGES.UNUSED.MAX}`|INFO trigger if unused images per user exceed this count|`3`|Text macro|
|`{$PODMAN.IMAGE.MATCHES}`|LLD filter: image names to include (regex)|`.*`|Text macro|
|`{$PODMAN.IMAGE.NOT_MATCHES}`|LLD filter: image names to exclude (regex)|`CHANGE_IF_NEEDED`|Text macro|
|`{$PODMAN.IMAGE.USER.NOT_MATCHES}`|LLD filter: skip images owned by these users (regex)|`^root$`|Text macro|

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Container discovery|Discovers all containers (including stopped) per user|`Dependent item`|`podman.containers.discovery`<p>Update: 0</p>|
|Image discovery|Discovers local images per user|`Dependent item`|`podman.images.discovery`<p>Update: 0</p>|
|Network discovery|Discovers user-defined networks per user|`Dependent item`|`podman.networks.discovery`<p>Update: 0</p>|
|Pod discovery|Discovers pods per user|`Dependent item`|`podman.pods.discovery`<p>Update: 0</p>|
|User discovery|Discovers Podman users (rootful and rootless)|`Dependent item`|`podman.users.discovery`<p>Update: 0</p>|
|Volume discovery|Discovers volumes per user|`Dependent item`|`podman.volumes.discovery`<p>Update: 0</p>|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Podman: raw data|Master item full JSON from collector script|`Zabbix agent (active)`|`vfs.file.contents[/var/log/podman.json]`<p>Update: {$PODMAN.UPDATE.INTERVAL}</p>|
|Podman: last collection timestamp|Timestamp of last successful collector run|`Dependent item`|`podman.collected_at`<p>Update: 0</p>|
|Podman: collector version|Version of the collector script|`Dependent item`|`podman.collector_version`<p>Update: 0</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): state|Numeric container state with value map: 0 created, 1 initialized, 2 running, 3 paused, 4 exited, 5 stopped, 6 unknown, 7 stopping, 8 configured, 9 removing|`Dependent item`|`podman.container.state[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): CPU usage|CPU usage in % (snapshot)|`Dependent item`|`podman.container.cpu[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): memory usage|Memory usage in % of limit|`Dependent item`|`podman.container.mem.pct[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): memory used|Memory used in bytes|`Dependent item`|`podman.container.mem.used[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): memory limit|Memory limit in bytes (0 = unlimited)|`Dependent item`|`podman.container.mem.limit[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): network in|Inbound network traffic in bytes/s|`Dependent item`|`podman.container.net.in[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): network out|Outbound network traffic in bytes/s|`Dependent item`|`podman.container.net.out[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): block in|Block read throughput in bytes/s|`Dependent item`|`podman.container.block.in[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): block out|Block write throughput in bytes/s|`Dependent item`|`podman.container.block.out[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): PIDs|Number of processes running in the container|`Dependent item`|`podman.container.pids[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): restart count|Cumulative restart count (from inspect)|`Dependent item`|`podman.container.restarts[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): health status|Health check result: healthy / unhealthy / starting|`Dependent item`|`podman.container.health[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): exit code|Last exit code (0 = clean exit)|`Dependent item`|`podman.container.exitcode[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): OOM killed|1 if container was killed by the OOM killer|`Dependent item`|`podman.container.oom_killed[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Container [{#CONTAINER_NAME}] ({#USER}): ports|Published port mappings|`Dependent item`|`podman.container.ports[{#CONTAINER_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Pod [{#POD_NAME}] ({#USER}): status|Numeric pod status with value map: 0 Running, 1 Created, 2 Stopped, 3 Exited, 4 Paused, 5 Dead, 6 Degraded, 7 Error|`Dependent item`|`podman.pod.status[{#POD_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Pod [{#POD_NAME}] ({#USER}): container count|Total number of containers in the pod|`Dependent item`|`podman.pod.containers[{#POD_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Image [{#IMAGE_NAME}] ({#USER}): created|Image creation timestamp|`Dependent item`|`podman.image.created[{#IMAGE_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|Image [{#IMAGE_NAME}] ({#USER}): size|Image size in bytes|`Dependent item`|`podman.image.size[{#IMAGE_NAME},{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: containers running|Currently running containers|`Dependent item`|`podman.user.containers.running[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: containers total|Total containers including stopped|`Dependent item`|`podman.user.containers.total[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: containers stopped|Number of stopped/exited containers|`Dependent item`|`podman.user.containers.exited[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: pods running|Running or degraded pods|`Dependent item`|`podman.user.pods.running[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: pods total|Total pods|`Dependent item`|`podman.user.pods.total[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: networks total|Total user-defined networks|`Dependent item`|`podman.user.networks.total[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: volumes total|Total volumes|`Dependent item`|`podman.user.volumes.total[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: images total|Total local images|`Dependent item`|`podman.user.images.total[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: unused images|Images with no associated containers (cleanup candidates)|`Dependent item`|`podman.user.images.unused[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: Podman version|Installed Podman version string|`Dependent item`|`podman.user.version[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: storage used|Reclaimable storage used in bytes|`Dependent item`|`podman.user.store.used[{#USER}]`<p>Update: 0, LLD</p>|
|User [{#USER}]: storage allocated|Total storage allocated in bytes|`Dependent item`|`podman.user.store.allocated[{#USER}]`<p>Update: 0, LLD</p>|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Podman: collector data not updated for {$PODMAN.NODATA.TIMEOUT}|JSON file not refreshed collector may have stopped|`nodata(/Podman by Zabbix Agent Active/vfs.file.contents[/var/log/podman.json],{$PODMAN.NODATA.TIMEOUT})=1`|Warning|
|Container [{#CONTAINER_NAME}] ({#USER}): not running|State code above 3 for the whole window: exited, stopped, unknown, stopping, configured or removing. Codes 0, 1 and 3 do not raise it|`min(/.../podman.container.state[...],500)>3`|High|
|Container [{#CONTAINER_NAME}] ({#USER}): exited with error|Container exited with a non-zero exit code|`last(/.../podman.container.state[...])=4 and last(/.../podman.container.exitcode[...])>0`|Average|
|Container [{#CONTAINER_NAME}] ({#USER}): restarted|Restart count has increased|`change(/.../podman.container.restarts[...])>0`|Warning|
|Container [{#CONTAINER_NAME}] ({#USER}): health check failing|Health check status is unhealthy|`last(/.../podman.container.health[...])="unhealthy"`|Average|
|Container [{#CONTAINER_NAME}] ({#USER}): killed by OOM killer|Container was terminated due to out-of-memory|`last(/.../podman.container.oom_killed[...])=1`|Average|
|Container [{#CONTAINER_NAME}] ({#USER}): CPU high|Average CPU > {$PODMAN.CPU.CRIT}% over 5 minutes|`avg(/.../podman.container.cpu[...],5m)>{$PODMAN.CPU.CRIT}`|Warning|
|Container [{#CONTAINER_NAME}] ({#USER}): memory high|Average memory % > {$PODMAN.MEM.CRIT}% over 5 minutes|`avg(/.../podman.container.mem.pct[...],5m)>{$PODMAN.MEM.CRIT}`|Warning|
|Pod [{#POD_NAME}] ({#USER}): not running|Pod status is not Running and not Degraded|`min(/.../podman.pod.status[...],5m)>0 and min(/.../podman.pod.status[...],5m)<>6`|High|
|Pod [{#POD_NAME}] ({#USER}): degraded|Some containers in the pod are not running|`min(/.../podman.pod.status[...],5m)=6`|Average|
|User [{#USER}]: storage usage high|Used/Allocated storage > {$PODMAN.STORE.CRIT}%|`last(.../store.allocated[...])>0 and last(.../store.used[...])/last(.../store.allocated[...])*100>{$PODMAN.STORE.CRIT}`|Warning|
|User [{#USER}]: {ITEM.LASTVALUE1} unused images|Unused image count > {$PODMAN.IMAGES.UNUSED.MAX} consider running `podman image prune`|`last(/.../podman.user.images.unused[...])>{$PODMAN.IMAGES.UNUSED.MAX}`|Info|

## State comparisons

`podman.container.state` and `podman.pod.status` are numeric items with a value map. Triggers must compare against the numeric code, never against the mapped label, because Zabbix evaluates the raw value. A state that no STR_REPLACE step maps to a number leaves the item unsupported and silently disables every trigger on it, so any new state podman introduces has to be added to both the preprocessing chain and the value map.

## Tested with

- Podman 4.9.x / 5.x on Debian 13
- Zabbix 7.0 LTS

Other distributions have not been tested.
