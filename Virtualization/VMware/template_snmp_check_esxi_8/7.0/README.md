# VMware ESXi 8 by SNMP — Zabbix 7.0

Import file: `template_snmp_check_esxi_8.yaml` — template name **VMware ESXi 8 by SNMP**.

Monitors a VMware ESXi 8.0 host through its built-in SNMP agent, without vCenter and without the VMware API. Rewritten from scratch: the earlier file in this folder was a copy of the vCenter (VCSA) template, and its process checks (`vpxd`, `vmdird`, `vmware-sts-idmd`…) do not exist on an ESXi host.

Every OID comes from the MIB modules in [files/vmware](files/vmware), limited to the groups that **VMWARE-ESX-AGENTCAP-MIB `vmwESX80x`** declares as implemented by the ESXi 8.0 agent.

MIBs used: **SNMPv2-MIB**, **HOST-RESOURCES-MIB**, **IF-MIB**, **VMWARE-SYSTEM-MIB**, **VMWARE-RESOURCES-MIB**, **VMWARE-VMINFO-MIB**, **VMWARE-ENV-MIB**.

> **Not yet verified with `snmpwalk` against a live ESXi 8 host.** OIDs and value semantics follow the MIB files; the points that depend on real agent output are called out below (VM state strings, `vmwSELCapacity`, `hrDeviceTable` types, process names).

*Vietnamese version: [files/README_vi.md](files/README_vi.md)*

---

# 0. Preparing the ESXi host

```sh
# SNMPv2c
esxcli system snmp set --communities <community>
# datastores > 2 TB: without it hrStorageSize saturates at INT_MAX
esxcli system snmp set --largestorage true
# optional: send traps to the Zabbix server/proxy
esxcli system snmp set --targets <zabbix-ip>@162/<community>
esxcli system snmp set --enable true
esxcli network firewall ruleset set --ruleset-id snmp --enabled true
esxcli system snmp get
```

For SNMPv3 use `--authentication`, `--privacy`, `--engineid` and `--users` instead of `--communities`. SNMP version and credentials belong to the **host interface** in Zabbix, not to the template.

The IF-MIB traffic items use 64-bit `Counter64` objects: poll with **SNMPv2c or SNMPv3**, not SNMPv1.

The trap items need `snmptrapd` + the Zabbix SNMP trapper on the server or proxy.

---

# 1. Monitored items

## 1.1 Availability and system

| Item | Key | Source | Units | Interval |
| --- | --- | --- | --- | --- |
| ICMP ping | `icmpping` | simple check | | 1m |
| ICMP loss | `icmppingloss` | simple check | % | 1m |
| ICMP response time | `icmppingsec` | simple check | s | 1m |
| SNMP agent availability | `zabbix[host,snmp,available]` | internal | | 1m |
| System name | `system.name` | `1.3.6.1.2.1.1.5.0` sysName | | 15m |
| System description | `system.descr[sysDescr.0]` | `1.3.6.1.2.1.1.1.0` | | 15m |
| System location | `system.location[sysLocation.0]` | `1.3.6.1.2.1.1.6.0` | | 15m |
| System contact details | `system.contact[sysContact.0]` | `1.3.6.1.2.1.1.4.0` | | 15m |
| System object ID | `system.objectid[sysObjectID.0]` | `1.3.6.1.2.1.1.2.0` | | 15m |
| Uptime (network) | `system.net.uptime[sysUpTime.0]` | `1.3.6.1.2.1.1.3.0` | uptime | 1m |
| Uptime (hardware) | `system.hw.uptime[hrSystemUptime.0]` | `1.3.6.1.2.1.25.1.1.0` | uptime | 1m |
| ESXi Shell sessions | `system.users.num[hrSystemNumUsers.0]` | `1.3.6.1.2.1.25.1.5.0` | | 5m |
| Number of processes | `proc.num[hrSystemProcesses.0]` | `1.3.6.1.2.1.25.1.6.0` | | 5m |

**Uptime (hardware)** counts from boot; **Uptime (network)** counts from the start of `snmpd`, which restarts whenever `esxcli system snmp set` changes the configuration. The restart trigger therefore uses the hardware uptime.

On ESXi `hrSystemNumUsers` is the number of active **ESXi Shell** sessions (AGENTCAP-MIB).

## 1.2 ESXi version — VMWARE-SYSTEM-MIB

| Item | Key | OID | Interval |
| --- | --- | --- | --- |
| Product name | `vmware.product.name[vmwProdName.0]` | `1.3.6.1.4.1.6876.1.1.0` | 1h |
| Product version | `vmware.product.version[vmwProdVersion.0]` | `1.3.6.1.4.1.6876.1.2.0` | 1h |
| Product build | `vmware.product.build[vmwProdBuild.0]` | `1.3.6.1.4.1.6876.1.4.0` | 1h |
| Product update level | `vmware.product.update[vmwProdUpdate.0]` | `1.3.6.1.4.1.6876.1.5.0` | 1h |
| Product patch level | `vmware.product.patch[vmwProdPatch.0]` | `1.3.6.1.4.1.6876.1.6.0` | 1h |

Name, version and build also fill the host inventory (Software, OS short, Software app A).

## 1.3 CPU and memory

| Item | Key | Source | Units | Interval |
| --- | --- | --- | --- | --- |
| hrProcessorLoad walk *(master, no history)* | `system.cpu.walk[hrProcessorLoad]` | walk `1.3.6.1.2.1.25.3.3.1.2` | | 1m |
| CPU utilization | `system.cpu.util` | dependent — average of all rows | % | 1m |
| Number of logical CPUs | `system.cpu.num` | dependent — row count | | 1m |
| Number of physical CPUs | `vmware.cpu.num[vmwNumCPUs.0]` | `1.3.6.1.4.1.6876.3.1.1.0` | | 1h |
| Total memory (VMware) | `vmware.memory.size[vmwMemSize.0]` | `1.3.6.1.4.1.6876.3.2.1.0` ×1024 | B | 1h |
| Memory available for VMs (VMware) | `vmware.memory.avail[vmwMemAvail.0]` | `1.3.6.1.4.1.6876.3.2.3.0` ×1024 | B | 1h |

`CPU utilization` walks `hrProcessorLoad` once (one row per logical CPU, 1-minute average) and averages it with JSONPath, so there is one SNMP request instead of one per thread.

`vmwMemAvail` is a **configuration** figure (`vmwMemSize − vmwMemCOS`, and COS is always 0 on ESXi), not free memory. Real usage comes from the memory discovery rule.

## 1.4 `Memory discovery` — HOST-RESOURCES-MIB `hrStorageTable`

Filter: `hrStorageType` matches `{$MEMORY.TYPE.MATCHES}` (`hrStorageRam`, the "Real Memory" row). Discovery `1h`.

| Item | OID | Units | Interval |
| --- | --- | --- | --- |
| Total memory | `hrStorageSize` `.5` × allocation units | B | 15m |
| Used memory | `hrStorageUsed` `.6` × allocation units | B | 1m |
| Memory utilization | calculated: used / total × 100 | % | 1m |

Graph prototype: *Memory usage*.

## 1.5 `Datastore discovery` — HOST-RESOURCES-MIB `hrStorageTable`

Filter: `hrStorageType` matches `{$VFS.FS.FSTYPE.MATCHES}` (`hrStorageFixedDisk`), plus a name filter on the mount path `{#FSNAME}`. Discovery `1h`. Visorfs ramdisks are not reported by ESXi.

### Datastore names

**ESXi SNMP does not expose the friendly datastore name.** Checked with `snmpwalk` on an ESXi 8 host: `hrStorageDescr` and `hrFSMountPoint` both return `/vmfs/volumes/<uuid>`, and `hrFSRemoteMountPoint` is empty for VMFS. A JavaScript step strips the prefix into `{#FSUUID}`, which is used in item, trigger and graph names, in the `datastore` tag and as macro context:

```
Datastore [64382f1f-e60d35ca-e545-30d042989461]: Space utilization
```

To find which datastore a UUID belongs to, run `esxcli storage filesystem list` on the host (columns Mount Point and Volume Name).

### Shared (SAN) datastores: exclude them, they are monitored by a separate template

This rule is meant for **host-local storage only**. A VMFS datastore on a SAN LUN is mounted by every host of the cluster, and each host reports it with the same UUID. The items do not conflict, since they belong to different hosts, but the same datastore would be polled N times and a full datastore would open N identical problems. **Shared datastores are monitored once, by a separate template**, and must be excluded here.

SNMP cannot tell local and shared datastores apart automatically. Checked with `snmpwalk` on an ESXi 8 host with a Dell PERC local disk and Dell EMC (DGC) Fibre Channel LUNs:

- `hrDeviceDescr` does show the LUN model (`LUN DELL PERC H730P Mini …` vs `LUN DGC VRAID 5007 …`);
- but a datastore cannot be linked to its LUN: `hrPartitionFSIndex` returns a per-device counter (1, 2, … on every LUN) instead of the `hrFSTable` index, and `hrFSTable` has no device reference.

Exclude them by UUID with `{$VFS.FS.FSUUID.NOT_MATCHES}`, set on the **host group of the cluster** so every host gets the same list:

```sh
esxcli storage vmfs extent list          # VMFS UUID -> Device Name
esxcli storage core device list | grep -E "^naa|Display Name|Is Shared Clusterwide"
```

```
{$VFS.FS.FSUUID.NOT_MATCHES} = ^(64382f1f-e60d35ca-e545-30d042989461|68359f81-1031e575-89d4-20040fe2cdcf|6a3b5015-75bdd474-9824-30d042989461)$
```

Add the UUID of every new SAN datastore to the list. Items of a datastore that stops matching are removed after the rule's *Delete lost resources* period (7 days by default).

What stays: local VMFS datastores, the `OSDATA` system volume (VMFS-L) and the two small UUID volumes not listed by `esxcli storage vmfs extent list`, which are most likely the `BOOTBANK1`/`BOOTBANK2` vfat partitions — all host-specific. Exclude them the same way if you do not want them. NFS datastores were not tested; if they appear, exclude them with the same macro.

The *Disk device discovery* rule still lists SAN LUNs. That is intended: `hrDeviceStatus` is each host's own view of the LUN, so a LUN down on one host is a host-specific problem.

| Item | OID | Units | Interval |
| --- | --- | --- | --- |
| Total space | `hrStorageSize` `.5` × allocation units | B | 15m |
| Used space | `hrStorageUsed` `.6` × allocation units | B | 5m |
| Space utilization | calculated: used / total × 100 | % | 5m |

Graph prototype: *Space usage*. `hrStorageSize` is an `Integer32`: without `--largestorage true` a datastore above 2 TB is truncated and its percentages are wrong.

## 1.6 `Host bus adapter discovery` — VMWARE-RESOURCES-MIB `vmwHostBusAdapterTable`

Source `1.3.6.1.4.1.6876.3.5.2.1` — the adapters listed by `esxcfg-scsidevs -a`. Discovery `1h`. Model `{#HBA.MODEL}` and driver `{#HBA.DRIVER}` are read at discovery time and shown in descriptions.

| Item | OID | Interval |
| --- | --- | --- |
| HBA status | `.4` `vmwHbaStatus` — unknown(1) normal(2) marginal(3) critical(4) failed(5) | 3m |

Template-level: **Number of host bus adapters** `vmware.hba.num[vmwHostBusAdapterNumber.0]` (`1.3.6.1.4.1.6876.3.5.1.0`, 15m).

Software adapters (iSCSI, NVMe/TCP…) commonly report `unknown(1)`, which raises nothing.

## 1.7 `Disk device discovery` — HOST-RESOURCES-MIB `hrDeviceTable`

Filter: `hrDeviceType` matches `{$ESXI.HRDEVICE.TYPE.MATCHES}` (`hrDeviceDiskStorage`). Discovery `1h`.

| Item | OID | Interval |
| --- | --- | --- |
| Device status | `1.3.6.1.2.1.25.3.2.1.5` `hrDeviceStatus` — unknown(1) running(2) warning(3) testing(4) down(5) | 3m |

Per the AGENTCAP-MIB, ESXi reports running/warning/down/unknown for disks, only running/unknown for NICs and always unknown for CPUs — which is why only disks are discovered by default.

## 1.8 `Virtual machine discovery` — VMWARE-VMINFO-MIB `vmwVmTable`

| Item | Key | Interval |
| --- | --- | --- |
| vmwVmTable walk *(master, no history)* | `vmware.vm.walk[vmwVmTable]` — walk of `1.3.6.1.4.1.6876.2.1.1` columns 2, 4, 5, 6, 8, 9, 10 | 3m |
| Number of registered VMs | `vmware.vm.count` | 3m |
| Number of powered on / powered off / suspended VMs | `vmware.vm.count[poweredOn\|poweredOff\|suspended]` | 3m |

The discovery rule and its prototypes are **dependent** on the walk, with a JavaScript + *Discard unchanged 1h* step so discovery runs only when the VM list changes.

| Prototype | Key | Source column | Notes |
| --- | --- | --- | --- |
| Power state | `vmware.vm.power.state["{#VM.UUID}"]` | `.6` `vmwVmState` | 0 off, 1 on, 2 suspended, 3 unknown |
| Guest state | `vmware.vm.guest.state["{#VM.UUID}"]` | `.8` `vmwVmGuestState` | 0 notrunning, 1 running, 2 shuttingdown, 3 resetting, 4 standby, 5 unknown |
| Guest OS | `vmware.vm.guest.os["{#VM.UUID}"]` | `.4` `vmwVmGuestOS` | `E: …` means VMware Tools not running |
| Number of vCPUs | `vmware.vm.cpu.num["{#VM.UUID}"]` | `.9` `vmwVmCpus` | |
| Configured memory | `vmware.vm.memory.size["{#VM.UUID}"]` | `.5` `vmwVmMemSize` ×1048576 | B |

**Why the UUID and not the SNMP index:** `vmwVmIdx` "may change upon reboot" (VMINFO-MIB). Keying items by index would silently swap history between VMs after a host reboot, so every prototype picks its row by `vmwVmUUID` instead. A VM that is unregistered or vMotioned away stops matching; its items go unsupported and are **deleted after 7 days**.

Power and guest state are converted to numbers by JavaScript that lower-cases the text and strips spaces, so `poweredOn` and `powered on` are both accepted.

## 1.9 Management agents — HOST-RESOURCES-MIB `hrSWRunTable`

| Item | Key | Interval |
| --- | --- | --- |
| hrSWRunName walk *(master, no history)* | `system.sw.walk[hrSWRunName]` — walk `1.3.6.1.2.1.25.4.2.1.2` | 5m |
| Number of hostd processes | `proc.num[hostd]` — names matching `{$ESXI.PROC.HOSTD.MATCHES}` | 5m |
| Number of vpxa processes | `proc.num[vpxa]` — names matching `{$ESXI.PROC.VPXA.MATCHES}` | 5m |

## 1.10 Hardware — VMWARE-ENV-MIB

| Item | Key | OID | Interval |
| --- | --- | --- | --- |
| Hardware status source | `vmware.env.source[vmwEnvSource.0]` | `1.3.6.1.4.1.6876.4.20.100.0` | 1h |
| IPMI SEL entries | `vmware.env.sel.num[vmwEnvNumber.0]` | `1.3.6.1.4.1.6876.4.20.1.0` | 15m |
| IPMI SEL capacity | `vmware.env.sel.capacity[vmwSELCapacity.0]` | `1.3.6.1.4.1.6876.4.20.30.0` | 15m |

On ESXi 8 `vmwEnvSource` should read `ipmi(4)`: the agent reads the BMC System Event Log directly. `vmwEnvTable` itself (the SEL rows) is a log, not a state table, so it is not polled — new entries are detected through `vmwEnvNumber` and, when traps are configured, through the trap items below.

## 1.11 SNMP traps

| Item | Key matches | Notification OIDs under `1.3.6.1.4.1.6876.4.1.0` |
| --- | --- | --- |
| SNMP traps (fallback) | `snmptrap.fallback` | everything not matched below |
| IPMI SEL event raised | `vmwEnvIpmiSelFull`, `…MemoryRaised`, `…PowerSupplyRaised`, `…FanRaised`, `…CpuRaised` | `.390` `.400` `.410` `.420` `.430` |
| IPMI SEL event cleared | `vmwEnvIpmiSel…Cleared` | `.401` `.411` `.421` `.431` |
| VM power state change | `vmwVmPoweredOn`, `vmwVmPoweredOff`, `vmwVmSuspended` | `.1` `.2` `.5` |
| VM heartbeat lost | `vmwVmHBLost` | `.3` |

Each regex matches the notification **by name** (MIBs loaded in `snmptrapd`) **or by numeric OID**, so the template works either way.

## 1.12 `Network interfaces discovery` — IF-MIB

Physical NICs (`vmnicN`, `ifType` 6) and VMkernel interfaces (`vmkN`). Loopback (`ifType` 24), `notPresent` and admin-down interfaces are filtered out. Discovery `1h`.

| Item | OID | Units | Interval |
| --- | --- | --- | --- |
| Bits received / sent | `ifHCInOctets` / `ifHCOutOctets` (64-bit) | bps | 3m |
| Inbound / outbound packets with errors | `ifInErrors` / `ifOutErrors` | /s | 3m |
| Inbound / outbound packets discarded | `ifInDiscards` / `ifOutDiscards` | /s | 3m |
| Speed | `ifHighSpeed` ×1000000 | bps | 5m |
| Operational status | `ifOperStatus` | | 1m |
| Interface type | `ifType` | | 1h |

Graph prototype: *Network traffic*. `ifAdminStatus` is read-only on ESXi.

## 1.13 Graphs

*CPU utilization*, *Virtual machines* (registered / on / off / suspended), plus the prototypes listed above.

---

# 2. Alerting triggers

## 2.1 Availability and system

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| Unavailable by ICMP ping | HIGH | | |
| No SNMP data collection | WARNING | | Unavailable by ICMP ping |
| High ICMP ping loss | WARNING | | Unavailable by ICMP ping |
| High ICMP ping response time | WARNING | | High ICMP ping loss |
| Host has been restarted | WARNING | ✓ | No SNMP data collection |
| System name has changed | INFO | ✓ | |
| ESXi build has changed | INFO | ✓ | |
| Active ESXi Shell sessions | INFO | ✓ | |

**Host has been restarted**: `last(hrSystemUptime) < 10m` and `max(hrSystemUptime,15m) < {$UPTIME.WRAP.THRESHOLD}`. `TimeTicks` is a 32-bit counter that wraps after 497 days with no reboot; the second condition suppresses that false alert.

**Active ESXi Shell sessions** fires when `hrSystemNumUsers > {$ESXI.SHELL.SESSIONS.MAX}` (0). Hardened hosts keep the shell disabled, so any session is worth knowing about.

## 2.2 CPU, memory, management agents

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| High CPU utilization | WARNING | | No SNMP data collection |
| High memory utilization | AVERAGE | | |
| Management agent hostd is not running | HIGH | | No SNMP data collection |
| vCenter agent vpxa is not running | AVERAGE | | hostd is not running |

- CPU: `min(system.cpu.util,5m) > {$CPU.UTIL.CRIT}` (90).
- Memory: `min(memory utilization,5m) > {$MEMORY.UTIL.MAX}` (90).
- hostd / vpxa: no matching process for 10 minutes. `snmpd` is independent of `hostd`, so SNMP keeps answering when `hostd` dies. The vpxa trigger only runs when `{$ESXI.VPXA.CONTROL}=1` — set it to `0` on standalone hosts that are not in vCenter.

## 2.3 Storage

| Trigger | Severity | Manual close | Depends on | Rule |
| --- | --- | --- | --- | --- |
| Datastore [..]: Space is critically low | AVERAGE | ✓ | | Datastore discovery |
| Datastore [..]: Space is low | WARNING | ✓ | Space is critically low | Datastore discovery |
| HBA ..: Adapter is in critical state | HIGH | | | HBA discovery |
| HBA ..: Adapter is in warning state | WARNING | | Adapter is in critical state | HBA discovery |
| Number of host bus adapters has decreased | WARNING | ✓ | | template |
| Device [..]: Device is down | AVERAGE | | | Disk device discovery |
| Device [..]: Device is in warning state | WARNING | | Device is down | Disk device discovery |

- Datastore: space utilization `> {$VFS.FS.PUSED.MAX.CRIT}` (90) / `> {$VFS.FS.PUSED.MAX.WARN}` (80). Both macros accept the datastore UUID as context, e.g. `{$VFS.FS.PUSED.MAX.CRIT:"64382f1f-e60d35ca-e545-30d042989461"}=97`.
- HBA: critical when `vmwHbaStatus ≥ {$ESXI.SUBSYSTEM.CRIT.STATUS}` (4 = critical or failed); warning when `= {$ESXI.SUBSYSTEM.WARN.STATUS}` (3 = marginal).
- Disk device: `hrDeviceStatus = 5` (down) / `= 3` (warning).
- HBA count: the value dropped compared to the previous poll.

## 2.4 Virtual machines

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| VM ..: Virtual machine is not powered on | WARNING | ✓ | |
| VM ..: Guest OS is not running | WARNING | ✓ | Virtual machine is not powered on |
| Virtual machine guest heartbeat lost *(trap)* | WARNING | ✓ | |

Both polled VM triggers fire on a **state change** and use a separate recovery expression:

```
not powered on:  last(power)<>1 and last(power,#2)=1
    recovery:    last(power)=1
guest not running: last(power)=1 and last(guest)<>1 and last(guest,#2)=1
    recovery:      last(guest)=1 or last(power)<>1
```

| Scenario | Power state | Guest state | Problem |
| --- | --- | --- | --- |
| VM kept off on purpose | `0 0 0` | — | none |
| Running VM is shut down | `1 1 0` | | **not powered on** — until powered on again |
| VM is suspended | `1 1 2` | | **not powered on** |
| Guest OS hangs / Tools stops | `1 1 1` | `1 1 0` | **guest not running** |
| VM without VMware Tools | `1 1 1` | `5 5 5` | none |

A VM that was already off when the template was linked raises nothing. Silence one VM with `{$ESXI.VM.POWER.CONTROL:"<vm name>"}=0` or `{$ESXI.VM.GUEST.CONTROL:"<vm name>"}=0`; drop VMs from discovery altogether with `{$ESXI.VM.NAME.NOT_MATCHES}` (for example `^vCLS` for the vSphere Cluster Service VMs).

**vMotion and DRS:** a VM migrated to another host disappears from this host's `vmwVmTable`, so its items go unsupported instead of reporting "powered off" — no false alarm.

## 2.5 Hardware

| Trigger | Severity | Manual close | Status |
| --- | --- | --- | --- |
| New IPMI SEL entries | INFO | ✓ | enabled |
| IPMI hardware event raised *(trap)* | WARNING | ✓ | enabled |
| IPMI System Event Log is almost full | WARNING | | **disabled** |

- **New IPMI SEL entries**: `vmwEnvNumber` grew since the previous poll. Works without traps. Review with `localcli hardware ipmi sel list`.
- **Trap triggers** (`IPMI hardware event raised`, `Virtual machine guest heartbeat lost`): `nodata(trap item, {$ESXI.TRAP.EVENT.HOLD}) = 0` — open while a matching trap was received within the last hour, then close by themselves.
- **SEL almost full** is disabled because VMWARE-ENV-MIB contradicts itself on `vmwSELCapacity`: the object is described as "free space left", while `vmwEnvIpmiSelFull` is sent when it "reaches 100% capacity". Compare the item with `localcli hardware ipmi sel get` on your hardware; if the value is **percent used**, enable the trigger (`≥ {$ESXI.SEL.CAPACITY.MAX}`, 90), otherwise change the expression to `<= 10`.

## 2.6 Network interfaces

| Trigger | Severity | Manual close | Depends on |
| --- | --- | --- | --- |
| Link down | AVERAGE | ✓ | |
| High bandwidth usage | WARNING | ✓ | Link down |
| High error rate | WARNING | ✓ | Link down |
| Ethernet has changed to lower speed than it was before | INFO | ✓ | Link down |

- **Link down** fires only when `ifOperStatus` *changes* to `down(2)` — unused NICs never alert. Silence one with `{$IFCONTROL:"vmnic3"}=0`.
- **High bandwidth**: 15-minute average of in or out above `{$IF.UTIL.MAX}` % (90) of `ifHighSpeed`; recovers 3 points lower.
- **High error rate**: in or out errors above `{$IF.ERRORS.WARN}` (2/s) for 5 minutes; recovers below 80 % of the threshold.
- **Lower speed**: `ifHighSpeed` decreased on an `ifType 6` interface that is not down.

---

# 3. Macros

## 3.1 Thresholds

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$CPU.UTIL.CRIT}` | `90` | CPU utilization (%), 5-minute minimum |
| `{$MEMORY.UTIL.MAX}` | `90` | Memory utilization (%), 5-minute minimum |
| `{$VFS.FS.PUSED.MAX.CRIT}` | `90` | Datastore critical threshold (%), context = datastore UUID |
| `{$VFS.FS.PUSED.MAX.WARN}` | `80` | Datastore warning threshold (%), context = datastore UUID |
| `{$IF.UTIL.MAX}` | `90` | Interface bandwidth (%), context = ifName |
| `{$IF.ERRORS.WARN}` | `2` | Interface errors per second, context = ifName |
| `{$ICMP_LOSS_WARN}` | `20` | ICMP loss (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | ICMP response time (s) |
| `{$SNMP.TIMEOUT}` | `5m` | Window of *No SNMP data collection* |
| `{$UPTIME.WRAP.THRESHOLD}` | `496d` | Uptime above which a drop to zero is a counter wrap, not a reboot |
| `{$ESXI.SHELL.SESSIONS.MAX}` | `0` | ESXi Shell sessions allowed |
| `{$ESXI.SEL.CAPACITY.MAX}` | `90` | SEL threshold for the disabled SEL trigger |
| `{$ESXI.TRAP.EVENT.HOLD}` | `1h` | How long a trap problem stays open |

## 3.2 Status values

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$ESXI.SUBSYSTEM.CRIT.STATUS}` | `4` | `vmwHbaStatus` ≥ 4 (critical, failed) |
| `{$ESXI.SUBSYSTEM.WARN.STATUS}` | `3` | `vmwHbaStatus` = marginal |
| `{$ESXI.HRDEVICE.CRIT.STATUS}` | `5` | `hrDeviceStatus` = down |
| `{$ESXI.HRDEVICE.WARN.STATUS}` | `3` | `hrDeviceStatus` = warning |

## 3.3 Switches

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$ESXI.VPXA.CONTROL}` | `1` | `0` disables the vpxa trigger (standalone host) |
| `{$ESXI.VM.POWER.CONTROL}` | `1` | `{$ESXI.VM.POWER.CONTROL:"<vm>"}=0` silences the power trigger of a VM |
| `{$ESXI.VM.GUEST.CONTROL}` | `1` | `{$ESXI.VM.GUEST.CONTROL:"<vm>"}=0` silences the guest trigger of a VM |
| `{$IFCONTROL}` | `1` | `{$IFCONTROL:"<ifName>"}=0` silences *Link down* |

## 3.4 Discovery filters

| Macro | Default | Meaning |
| --- | --- | --- |
| `{$MEMORY.TYPE.MATCHES}` | `.*(\.2\|hrStorageRam)$` | Memory row of `hrStorageTable` |
| `{$VFS.FS.FSTYPE.MATCHES}` | `.*(\.4\|hrStorageFixedDisk)$` | Datastore rows of `hrStorageTable` |
| `{$VFS.FS.FSNAME.MATCHES}` / `…NOT_MATCHES` | `.+` / `CHANGE_IF_NEEDED` | Datastore mount path |
| `{$VFS.FS.FSUUID.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Datastore UUIDs to exclude — **list the shared (SAN) datastores here**, on the cluster host group |
| `{$ESXI.HBA.NAME.MATCHES}` / `…NOT_MATCHES` | `.*` / `CHANGE_IF_NEEDED` | HBA name (`vmhbaN`) |
| `{$ESXI.HRDEVICE.TYPE.MATCHES}` | `.*(\.6\|hrDeviceDiskStorage)$` | `hrDeviceType` to discover |
| `{$ESXI.HRDEVICE.DESCR.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Exclude devices by description |
| `{$ESXI.VM.NAME.MATCHES}` / `…NOT_MATCHES` | `.*` / `CHANGE_IF_NEEDED` | VM name |
| `{$ESXI.PROC.HOSTD.MATCHES}` | `^hostd` | `hrSWRunName` of hostd |
| `{$ESXI.PROC.VPXA.MATCHES}` | `^vpxa` | `hrSWRunName` of vpxa |
| `{$NET.IF.IFTYPE.MATCHES}` / `…NOT_MATCHES` | `.*` / `^24$` | `ifType`; loopback excluded |
| `{$NET.IF.IFNAME.MATCHES}` / `…NOT_MATCHES` | `^.*$` / loopback names | `ifName` |
| `{$NET.IF.IFADMINSTATUS.MATCHES}` / `…NOT_MATCHES` | `^.*` / `^2$` | skip admin down |
| `{$NET.IF.IFOPERSTATUS.MATCHES}` / `…NOT_MATCHES` | `^.*$` / `^6$` | skip notPresent |
| `{$NET.IF.IFALIAS.*}`, `{$NET.IF.IFDESCR.*}` | `.*` / `CHANGE_IF_NEEDED` | `ifAlias`, `ifDescr` |

If `proc.num[hostd]` reads `0` on a healthy host, run `snmpwalk -v2c -c <community> <host> 1.3.6.1.2.1.25.4.2.1.2` and adjust `{$ESXI.PROC.HOSTD.MATCHES}` to the name the agent reports.

---

# 4. Not covered

- **Shared (SAN) datastores**: monitored once by a separate template, not per host — see *Shared (SAN) datastores* in section 1.5.
- **Per-VM performance** (CPU ready, disk latency, per-VM network): not in any SNMP MIB — use the Zabbix *VMware* template (VMware API).
- **Hardware sensors** (fan RPM, temperatures, PSU state as values): ESXi 8 only exposes them as IPMI SEL events (`vmwEnvTable`, traps); use the server's BMC (iDRAC/iLO/XCC) template for sensor readings.
- **vSAN, NSX, vCenter services**: the NSX/VCHA/vROps/SRM MIBs in `files/vmware` belong to other products and are not used.
- **Per-core CPU items**: only the average and the core count are collected, to avoid hundreds of items on large hosts.
