# Template SAP Host Agent by Zabbix agent 2

## Description

This template is designed for monitoring **SAP Host Agent** performance and system status using **Zabbix Agent 2** with a native custom plugin. It discovers and monitors key host parameters collected via the SAP Host Agent, including CPU, Memory, Swap, Disk I/O, Filesystems, Network Interfaces, Instance processes and OS details.

## Requirements

To use this template, the following components are required:

1. **Zabbix Agent 2** installed on the same host running the SAP Host Agent or on any other host that can reach it via the network.
2. Native **SAP Host Agent** Zabbix plugin installed on the same host where Zabbix Agent 2 is running.
3. **SAP Host Agent** must be active and configured with read access to its web service interface (typically running on port `1128` HTTP or `1129` HTTPS).

## Installation

1. **Install the Zabbix Agent 2 Plugin**:
   - **Native Packages**: You can use pre-compiled packages for Debian/Ubuntu, SUSE (SLES) or Red Hat (RHEL/CentOS) ecosystems. Detailed instructions on adding repositories and installing these packages can be found on the [Documentation Website](https://docs.ravenlayer.com/plugins/zabbix-agent2-plugin-sapagent/).
   - **Build from Source**: Alternatively, you can build the plugin directly from the source code available in the [GitHub Repository](https://github.com/RavenLayer/zabbix-agent2-plugin-sapagent/).

2. **Import the Template**:
   - Download the `template_sap_host_agent.xml` file.
   - Import the XML file into your Zabbix server (**Configuration** -> **Templates** -> **Import**).

3. **Configure Host Macros**:
   - Link the template to your target host.
   - Adjust the user macro values (e.g., `{$SAP.AGENT.URI}`, `{$SAP.AGENT.USER}` and `{$SAP.AGENT.PASSWORD}`) according to your target SAP Host Agent deployment.

---

## Macros

| Name | Default Value | Description |
| --- | --- | --- |
| `{$SAP.AGENT.PASSWORD}` | | Password for SAP Host Agent basic authentication. |
| `{$SAP.AGENT.URI}` | `http://localhost:1128` | URI of the SAP Host Agent API. |
| `{$SAP.AGENT.USER}` | `sapadm` | Username for SAP Host Agent basic authentication. |
| `{$CPU.UTIL.CRIT}` | `90` | Critical threshold for CPU utilization. |
| `{$IF.ERRORS.WARN}` | `2` | Warning threshold for network interface errors. |
| `{$LOAD_AVG_PER_CPU.MAX.WARN}` | `1.5` | Load per CPU considered sustainable. |
| `{$MEMORY.AVAILABLE.MIN}` | `20M` | The warning threshold of the available memory. |
| `{$MEMORY.UTIL.MAX}` | `90` | The warning threshold of the memory utilization. |
| `{$SWAP.PFREE.MIN.WARN}` | `50` | Warning threshold for minimum percentage of free swap space. |
| `{$VFS.DEV.AWAIT.WARN}` | `20` | Disk average wait time (in ms) before the trigger would fire |
| `{$VFS.FS.FREE.MIN.CRIT}` | `5G` | The critical threshold of the filesystem utilization. |
| `{$VFS.FS.FREE.MIN.WARN}` | `10G` | The warning threshold of the filesystem utilization. |
| `{$VFS.FS.PUSED.MAX.CRIT}` | `90` | Critical threshold for filesystem utilization percentage. |
| `{$VFS.FS.PUSED.MAX.WARN}` | `80` | Warning threshold for filesystem utilization percentage. |

---

## Items

| Name | Type | Key |
| --- | --- | --- |
| Interrupts per second | Zabbix agent | `sap.agent.cpu.intr[<common_params>]` |
| Load average (1m avg) | Zabbix agent | `sap.agent.cpu.load[<common_params>,avg1]` |
| Load average (5m avg) | Zabbix agent | `sap.agent.cpu.load[<common_params>,avg5]` |
| Load average (15m avg) | Zabbix agent | `sap.agent.cpu.load[<common_params>,avg15]` |
| Number of CPUs | Zabbix agent | `sap.agent.cpu.num[<common_params>]` |
| Context switches per second | Zabbix agent | `sap.agent.cpu.switches[<common_params>]` |
| CPU utilization | DEPENDENT | `sap.agent.cpu.util` |
| CPU idle time | Zabbix agent | `sap.agent.cpu.util[<common_params>,all,idle]` |
| CPU iowait time | Zabbix agent | `sap.agent.cpu.util[<common_params>,all,iowait]` |
| CPU steal time | Zabbix agent | `sap.agent.cpu.util[<common_params>,all,steal]` |
| CPU system time | Zabbix agent | `sap.agent.cpu.util[<common_params>,all,system]` |
| CPU user time | Zabbix agent | `sap.agent.cpu.util[<common_params>,all,user]` |
| Memory utilization | CALCULATED | `sap.agent.mem.util` |
| Available physical memory | Zabbix agent | `sap.agent.mem[<common_params>,phy,available]` |
| Free physical memory | Zabbix agent | `sap.agent.mem[<common_params>,phy,free]` |
| Total physical memory | Zabbix agent | `sap.agent.mem[<common_params>,phy,size]` |
| Total virtual memory | Zabbix agent | `sap.agent.mem[<common_params>,virt,size]` |
| Operating system name | Zabbix agent | `sap.agent.os.name[<common_params>]` |
| Operating system version | Zabbix agent | `sap.agent.os.version[<common_params>]` |
| SAP agent ping | Zabbix agent | `sap.agent.ping[<common_params>]` |
| Swap-in bytes per second | Zabbix agent | `sap.agent.swap.in[<common_params>,bytes]` |
| Swap-in pages per second | Zabbix agent | `sap.agent.swap.in[<common_params>,pages]` |
| Swap-out bytes per second | Zabbix agent | `sap.agent.swap.out[<common_params>,bytes]` |
| Swap-out pages per second | Zabbix agent | `sap.agent.swap.out[<common_params>,pages]` |
| Free swap space | Zabbix agent | `sap.agent.swap.size[<common_params>,free]` |
| Total swap space | Zabbix agent | `sap.agent.swap.size[<common_params>,total]` |
| Used swap space | Zabbix agent | `sap.agent.swap.size[<common_params>,used]` |
| Swap utilization | CALCULATED | `sap.agent.swap.util` |
| Version of SAP agent running | Zabbix agent | `sap.agent.version[<common_params>]` |

---

## Discovery Rules

### CPU discovery

**Key**: `sap.agent.cpu.discovery[<common_params>]`  
**Description**: Discovery of CPUs.

| Item Prototype Name | Type | Key |
| --- | --- | --- |
| CPU {#CPU.ID} utilization | DEPENDENT | `sap.agent.cpu.util["{#CPU.ID}]` |
| CPU {#CPU.ID} idle time | Zabbix agent | `sap.agent.cpu.util[<common_params>,{#CPU.ID},idle]` |
| CPU {#CPU.ID} iowait time | Zabbix agent | `sap.agent.cpu.util[<common_params>,{#CPU.ID},iowait]` |
| CPU {#CPU.ID} system time | Zabbix agent | `sap.agent.cpu.util[<common_params>,{#CPU.ID},system]` |
| CPU {#CPU.ID} user time | Zabbix agent | `sap.agent.cpu.util[<common_params>,{#CPU.ID},user]` |

### Block devices discovery

**Key**: `sap.agent.dev.discovery[<common_params>]`  
**Description**: Discovery of block devices.

| Item Prototype Name | Type | Key |
| --- | --- | --- |
| Device {#DEVNAME}: IO rate | Zabbix agent | `sap.agent.dev[<common_params>,{#DEVNAME},io]` |
| Device {#DEVNAME}: Queue length | Zabbix agent | `sap.agent.dev[<common_params>,{#DEVNAME},queue]` |
| Device {#DEVNAME}: Service time | Zabbix agent | `sap.agent.dev[<common_params>,{#DEVNAME},svc]` |
| Device {#DEVNAME}: Throughput | Zabbix agent | `sap.agent.dev[<common_params>,{#DEVNAME},tput]` |
| Device {#DEVNAME}: Utilization | Zabbix agent | `sap.agent.dev[<common_params>,{#DEVNAME},util]` |
| Device {#DEVNAME}: Wait time | Zabbix agent | `sap.agent.dev[<common_params>,{#DEVNAME},wait]` |

### Mounted filesystem discovery

**Key**: `sap.agent.fs.discovery[<common_params>]`  
**Description**: Discovery of file systems of different types.

| Item Prototype Name | Type | Key |
| --- | --- | --- |
| Filesystem {#FSNAME}: Free space | Zabbix agent | `sap.agent.fs.size[<common_params>,{#FSNAME},free]` |
| Filesystem {#FSNAME}: Total space | Zabbix agent | `sap.agent.fs.size[<common_params>,{#FSNAME},total]` |
| Filesystem {#FSNAME}: Space utilization | CALCULATED | `sap.agent.fs.util["{#FSNAME}]` |

### Network interface discovery

**Key**: `sap.agent.net.discovery[<common_params>]`  
**Description**: Discovery of network interfaces.

| Item Prototype Name | Type | Key |
| --- | --- | --- |
| Interface {#IFNAME}: Incoming traffic | Zabbix agent | `sap.agent.net.in[<common_params>,{#IFNAME},bytes]` |
| Interface {#IFNAME}: Incoming errors | Zabbix agent | `sap.agent.net.in[<common_params>,{#IFNAME},errors]` |
| Interface {#IFNAME}: Incoming packets | Zabbix agent | `sap.agent.net.in[<common_params>,{#IFNAME},packets]` |
| Interface {#IFNAME}: Outgoing traffic | Zabbix agent | `sap.agent.net.out[<common_params>,{#IFNAME},bytes]` |
| Interface {#IFNAME}: Outgoing errors | Zabbix agent | `sap.agent.net.out[<common_params>,{#IFNAME},errors]` |
| Interface {#IFNAME}: Outgoing packets | Zabbix agent | `sap.agent.net.out[<common_params>,{#IFNAME},packets]` |

### Process discovery

**Key**: `sap.agent.proc.discovery[<common_params>]`  
**Description**: Discovery of instance processes.

| Item Prototype Name | Type | Key |
| --- | --- | --- |
| Process {#PROCESS.DESC}: Get info | Zabbix agent | `sap.agent.proc.get[<common_params>,{#INSTANCE.NAME},{#PROCESS.NAME}]` |
| Process {#PROCESS.DESC} pid | DEPENDENT | `sap.agent.proc["{#INSTANCE.NAME},{#PROCESS.NAME},pid]` |
| Process {#PROCESS.DESC} start time | DEPENDENT | `sap.agent.proc["{#INSTANCE.NAME},{#PROCESS.NAME},starttime]` |
| Process {#PROCESS.DESC} status | DEPENDENT | `sap.agent.proc["{#INSTANCE.NAME},{#PROCESS.NAME},status]` |

### SAP Database discovery

**Key**: `sap.agent.db.discovery[<common_params>]`  
**Description**: Discovery of all SAP databases running on the host. Returns a JSON array containing database discovery macros (`{#DB.NAME}`, `{#DB.PROTOCOL}`, `{#DB.HOST}` and `{#DB.PORT}`).

No pre-defined item prototypes are included in this template, but this rule can be used to configure custom monitoring for each discovered database.

---

## Screenshots

Below are standard visual layouts and dashboards generated by this template:

* **Problems**: Triggers for processes and filesystems

<img width="847" height="421" alt="problems" src="https://github.com/user-attachments/assets/e7109a08-f9a4-4d02-9b61-604c8d58d910" />

* **System Performance**: Displays CPU usage, system load, memory and swap utilization.

<img width="616" height="296" alt="cpuutil" src="https://github.com/user-attachments/assets/aeab6168-a44f-45c2-a973-b4fd0a8b1265" />
<img width="671" height="296" alt="sysload" src="https://github.com/user-attachments/assets/5ef814dc-8286-4458-b2ea-fc89fb9c1948" />
<img width="616" height="268" alt="memusage" src="https://github.com/user-attachments/assets/e404c22a-b214-4bd5-a6eb-ea6f815561ed" />
<img width="616" height="268" alt="swapusage" src="https://github.com/user-attachments/assets/50414451-ee9a-4b0e-91a9-f1d7b5f55d34" />

* **Block Devices**: Real-time visualization of disk utilization, queue length and IO rate per device.

<img width="671" height="268" alt="diskutil" src="https://github.com/user-attachments/assets/0fd0e356-c5cd-4aec-84f1-6da081fa49ab" />
<img width="671" height="282" alt="diskio" src="https://github.com/user-attachments/assets/62a0670a-5075-4a2a-ae05-f88b35fa84e8" />
<img width="616" height="254" alt="diskthru" src="https://github.com/user-attachments/assets/a88a45c3-13cc-4c8e-b0aa-a561f4d879cd" />

* **Network Interfaces**: Incoming/outgoing bandwidth utilization and packet rates.

<img width="616" height="268" alt="nettraffic" src="https://github.com/user-attachments/assets/80b5948a-15ae-463d-9d73-9258713c5e09" />
<img width="616" height="296" alt="netpackets" src="https://github.com/user-attachments/assets/b24107d2-f160-4857-83bb-8c37d1bdb676" />
