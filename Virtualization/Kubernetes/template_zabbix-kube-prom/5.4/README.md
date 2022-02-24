# Kube by Prom API

## Description

This template works out of the box as soon as Prometheus (Prometheus-operator) is available inside your cluster; it does not require any Zabbix agent installation or configuration. It allows external monitoring of the Kubernetes cluster through ingress, without any NodePort declaration. It uses the Prometheus API to create a Zabbix host for each pod available inside the Kubernetes cluster. {$PROM.API.URL} must contains the Prometheus entry point into your Kubernetes cluster. Zabbix pod hosts are created with the "Template Kube Pod by Prom API" template by default.

## Overview

 ### Description


zabbix-kube-prom is a batch of Zabbix LLD templates for Zabbix server.


It is used for external Kubernetes monitoring by Zabbix via Prometheus API.


### Installation


1. Install [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) into the Kubernetes cluster.
2. Import global Zabbix Template (zabbix-kube-prom.xml) into your Zabbix server.
3. Create or import a host identifying your Kubernetes cluster where Prometheus is deployed.
4. Let LLD create discovered nodes as new "Zabbix hosts"
5. Let LLD create discovered pods as new "Virtual Zabbix hosts


### Templates


The global export (zabbix-kube-prom.xml) contains following templates:




| Templates | Description |
| --- | --- |
| Template Kube by Prom API | Creates a Zabbix host for each pod and node discovered. |
| Template Kube Node by Prom API | Template applied to the created host (node). |
| Template Kube Pod by Prom API | Template applied to the created host (pod). |


### Licenses




| Template | License |
| --- | --- |
| Template OS Linux by Prom | *GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README) |
| Template Kube by Prom APITemplate Kube Node by Prom APITemplate Kube Pod by Prom API | *GNU General Public License v3.0*[Copyright (C) 2021 Diagnostica Stago](https://www.stago.com/) |




---


 



## Author

Laurent Marchelli

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$VFS.FS.PUSED.MAX.CRIT}|<p>-</p>|`90`|Text macro|
|{$VFS.FS.PUSED.MAX.WARN}|<p>-</p>|`80`|Text macro|
|{$CPU.UTIL.CRIT}|<p>-</p>|`90`|Text macro|
|{$IF.ERRORS.WARN}|<p>-</p>|`2`|Text macro|
|{$IF.UTIL.MAX}|<p>-</p>|`90`|Text macro|
|{$IFCONTROL}|<p>-</p>|`1`|Text macro|
|{$KERNEL.MAXFILES.MIN}|<p>-</p>|`256`|Text macro|
|{$LOAD_AVG_PER_CPU.MAX.WARN}|<p>Load per CPU considered sustainable. Tune if needed.</p>|`1.5`|Text macro|
|{$MEMORY.AVAILABLE.MIN}|<p>-</p>|`20M`|Text macro|
|{$MEMORY.UTIL.MAX}|<p>-</p>|`90`|Text macro|
|{$NET.IF.IFALIAS.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFALIAS.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$NET.IF.IFNAME.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFNAME.NOT_MATCHES}|<p>Filter out loopbacks, nulls, docker veth links and docker0 bridge by default</p>|`(^Software Loopback Interface|^NULL[0-9.]*$|^[Ll]o[0-9.]*$|^[Ss]ystem$|^Nu[0-9.]*$|^veth[0-9a-z]+$|docker[0-9]+|br-[a-z0-9]{12})`|Text macro|
|{$NET.IF.IFOPERSTATUS.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFOPERSTATUS.NOT_MATCHES}|<p>Ignore notPresent(7)</p>|`^7$`|Text macro|
|{$NODE_EXPORTER_PORT}|<p>TCP Port node_exporter is listening on.</p>|`9100`|Text macro|
|{$PROM.API.URL}|<p>Prometheus API URL. Can be overridden on the host or linked template level.</p>|`http://prometheus.k8scluster.nuci7.lan:8080/api/v1/`|Text macro|
|{$PROM.NODE.IP.MATCHES}|<p>This macro is used in node discovery. Can be overridden on the host or linked template level.</p>|`^.*$`|Text macro|
|{$PROM.NODE.IP.NOT_MATCHES}|<p>This macro is used in node discovery. Can be overridden on the host or linked template level.</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$PROM.NODE.NAME.MATCHES}|<p>This macro is used in node discovery. Can be overridden on the host or linked template level.</p>|`^.*$`|Text macro|
|{$PROM.NODE.NAME.NOT_MATCHES}|<p>This macro is used in node discovery. Can be overridden on the host or linked template level.</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$PROM.POD.DEVICE.MATCHES}|<p>Device regex used in pod's metric discovery. Can be overridden on the host or linked template level.</p>|`^.*$`|Text macro|
|{$PROM.POD.DEVICE.NOT_MATCHES}|<p>Device interface regex used in pod's metric discovery. Can be overridden on the host or linked template level.</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$PROM.POD.IFNAME.MATCHES}|<p>Network interface regex used in pod's metric discovery. Can be overridden on the host or linked template level.</p>|`^.*$`|Text macro|
|{$PROM.POD.IFNAME.NOT_MATCHES}|<p>Network interface regex used in pod's metric discovery. Can be overridden on the host or linked template level.</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$PROM.POD.NAME.MATCHES}|<p>This macro is used in pod discovery. Can be overridden on the host or linked template level.</p>|`^.*$`|Text macro|
|{$PROM.POD.NAME.NOT_MATCHES}|<p>This macro is used in pod discovery. Can be overridden on the host or linked template level.</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$PROM.POD.NAMESPACE.MATCHES}|<p>This macro is used in pod discovery. Can be overridden on the host or linked template level.</p>|`^.*$`|Text macro|
|{$PROM.POD.NAMESPACE.NOT_MATCHES}|<p>This macro is used in pod discovery. Can be overridden on the host or linked template level.</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$PROM.POD.SERVICE.MATCHES}|<p>This macro is used in pod discovery. Can be overridden on the host or linked template level.</p>|`^.*$`|Text macro|
|{$PROM.POD.SERVICE.NOT_MATCHES}|<p>This macro is used in pod discovery. Can be overridden on the host or linked template level.</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$SWAP.PFREE.MIN.WARN}|<p>-</p>|`50`|Text macro|
|{$SYSTEM.FUZZYTIME.MAX}|<p>-</p>|`60`|Text macro|
|{$VFS.DEV.DEVNAME.MATCHES}|<p>This macro is used in block devices discovery. Can be overridden on the host or linked template level</p>|`.+`|Text macro|
|{$VFS.DEV.DEVNAME.NOT_MATCHES}|<p>This macro is used in block devices discovery. Can be overridden on the host or linked template level</p>|`^(loop[0-9]*|sd[a-z][0-9]+|nbd[0-9]+|sr[0-9]+|fd[0-9]+|dm-[0-9]+|ram[0-9]+|ploop[a-z0-9]+|md[0-9]*|hcp[0-9]*|zram[0-9]*)`|Text macro|
|{$VFS.DEV.READ.AWAIT.WARN}|<p>Disk read average response time (in ms) before the trigger would fire</p>|`20`|Text macro|
|{$VFS.DEV.WRITE.AWAIT.WARN}|<p>Disk write average response time (in ms) before the trigger would fire</p>|`20`|Text macro|
|{$VFS.FS.FSDEVICE.MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^.+$`|Text macro|
|{$VFS.FS.FSDEVICE.NOT_MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^\s$`|Text macro|
|{$VFS.FS.FSNAME.MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`.+`|Text macro|
|{$VFS.FS.FSNAME.NOT_MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^(/dev|/sys|/run|/proc|.+/shm$)`|Text macro|
|{$VFS.FS.FSTYPE.MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^(btrfs|ext2|ext3|ext4|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|apfs|refs|ntfs|fat32|zfs)$`|Text macro|
|{$VFS.FS.FSTYPE.NOT_MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^\s$`|Text macro|
|{$VFS.FS.INODE.PFREE.MIN.CRIT}|<p>-</p>|`10`|Text macro|
|{$VFS.FS.INODE.PFREE.MIN.WARN}|<p>-</p>|`20`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Kube pod|<p>-</p>|`HTTP agent`|prom.pod.discovery<p>Update: 1m</p>|
|Kube node|<p>-</p>|`HTTP agent`|prom.node.discovery<p>Update: 1m</p>|


## Items collected

There are no items in this template.

## Triggers

There are no triggers in this template.

# Kube Node by Prom API

## Description

This template works out of the box as soon as Prometheus (Prometheus-operator) is available inside your cluster; it does not require any Zabbix agent installation or configuration. It allows external monitoring of the Kubernetes cluster through ingress, without any NodePort declaration. It uses the Prometheus API to create a Zabbix host for each pod available inside the Kubernetes cluster. {$PROM.API.URL} must contains the Prometheus entry point into your Kubernetes cluster. Zabbix pod hosts are created with the "Template Kube Pod by Prom API" template by default.

## Overview

 ### Description


zabbix-kube-prom is a batch of Zabbix LLD templates for Zabbix server.


It is used for external Kubernetes monitoring by Zabbix via Prometheus API.


### Installation


1. Install [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) into the Kubernetes cluster.
2. Import global Zabbix Template (zabbix-kube-prom.xml) into your Zabbix server.
3. Create or import a host identifying your Kubernetes cluster where Prometheus is deployed.
4. Let LLD create discovered nodes as new "Zabbix hosts"
5. Let LLD create discovered pods as new "Virtual Zabbix hosts


### Templates


The global export (zabbix-kube-prom.xml) contains following templates:




| Templates | Description |
| --- | --- |
| Template Kube by Prom API | Creates a Zabbix host for each pod and node discovered. |
| Template Kube Node by Prom API | Template applied to the created host (node). |
| Template Kube Pod by Prom API | Template applied to the created host (pod). |


### Licenses




| Template | License |
| --- | --- |
| Template OS Linux by Prom | *GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README) |
| Template Kube by Prom APITemplate Kube Node by Prom APITemplate Kube Pod by Prom API | *GNU General Public License v3.0*[Copyright (C) 2021 Diagnostica Stago](https://www.stago.com/) |




---


 



## Author

Laurent Marchelli

## Description

Official Linux template using node exporter. Known Issues: Description: node_exporter v0.16.0 renamed many metrics. CPU utilization for 'guest' and 'guest_nice' metrics are not supported in this template with node_exporter < 0.16. Disk IO metrics are not supported. Other metrics provided as 'best effort'. See https://github.com/prometheus/node_exporter/releases/tag/v0.16.0 for details. Version: below 0.16.0 Description: metric node_network_info with label 'device' cannot be found, so network discovery is not possible. Version: below 0.18 You can discuss this template or leave feedback on our forum https://www.zabbix.com/forum/zabbix-suggestions-and-feedback/387225-discussion-thread-for-official-zabbix-template-for-linux Template tooling version used: 0.34

## Overview

 ### Description


zabbix-kube-prom is a batch of Zabbix LLD templates for Zabbix server.


It is used for external Kubernetes monitoring by Zabbix via Prometheus API.


### Installation


1. Install [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) into the Kubernetes cluster.
2. Import global Zabbix Template (zabbix-kube-prom.xml) into your Zabbix server.
3. Create or import a host identifying your Kubernetes cluster where Prometheus is deployed.
4. Let LLD create discovered nodes as new "Zabbix hosts"
5. Let LLD create discovered pods as new "Virtual Zabbix hosts


### Templates


The global export (zabbix-kube-prom.xml) contains following templates:




| Templates | Description |
| --- | --- |
| Template Kube by Prom API | Creates a Zabbix host for each pod and node discovered. |
| Template Kube Node by Prom API | Template applied to the created host (node). |
| Template Kube Pod by Prom API | Template applied to the created host (pod). |


### Licenses




| Template | License |
| --- | --- |
| Template OS Linux by Prom | *GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README) |
| Template Kube by Prom APITemplate Kube Node by Prom APITemplate Kube Pod by Prom API | *GNU General Public License v3.0*[Copyright (C) 2021 Diagnostica Stago](https://www.stago.com/) |




---


 



## Author

Laurent Marchelli

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$CPU.UTIL.CRIT}|<p>-</p>|`90`|Text macro|
|{$IF.ERRORS.WARN}|<p>-</p>|`2`|Text macro|
|{$IF.UTIL.MAX}|<p>-</p>|`90`|Text macro|
|{$IFCONTROL}|<p>-</p>|`1`|Text macro|
|{$KERNEL.MAXFILES.MIN}|<p>-</p>|`256`|Text macro|
|{$LOAD_AVG_PER_CPU.MAX.WARN}|<p>Load per CPU considered sustainable. Tune if needed.</p>|`1.5`|Text macro|
|{$MEMORY.AVAILABLE.MIN}|<p>-</p>|`20M`|Text macro|
|{$MEMORY.UTIL.MAX}|<p>-</p>|`90`|Text macro|
|{$NET.IF.IFALIAS.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFALIAS.NOT_MATCHES}|<p>-</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$NET.IF.IFNAME.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFNAME.NOT_MATCHES}|<p>Filter out loopbacks, nulls, docker veth links and docker0 bridge by default</p>|`(^Software Loopback Interface|^NULL[0-9.]*$|^[Ll]o[0-9.]*$|^[Ss]ystem$|^Nu[0-9.]*$|^veth[0-9a-z]+$|docker[0-9]+|br-[a-z0-9]{12})`|Text macro|
|{$NET.IF.IFOPERSTATUS.MATCHES}|<p>-</p>|`^.*$`|Text macro|
|{$NET.IF.IFOPERSTATUS.NOT_MATCHES}|<p>Ignore notPresent(7)</p>|`^7$`|Text macro|
|{$NODE_EXPORTER_PORT}|<p>TCP Port node_exporter is listening on.</p>|`9100`|Text macro|
|{$PROM.API.URL}|<p>-</p>|``|Text macro|
|{$SWAP.PFREE.MIN.WARN}|<p>-</p>|`50`|Text macro|
|{$SYSTEM.FUZZYTIME.MAX}|<p>-</p>|`60`|Text macro|
|{$VFS.DEV.DEVNAME.MATCHES}|<p>This macro is used in block devices discovery. Can be overridden on the host or linked template level</p>|`.+`|Text macro|
|{$VFS.DEV.DEVNAME.NOT_MATCHES}|<p>This macro is used in block devices discovery. Can be overridden on the host or linked template level</p>|`^(loop[0-9]*|sd[a-z][0-9]+|nbd[0-9]+|sr[0-9]+|fd[0-9]+|dm-[0-9]+|ram[0-9]+|ploop[a-z0-9]+|md[0-9]*|hcp[0-9]*|zram[0-9]*)`|Text macro|
|{$VFS.DEV.READ.AWAIT.WARN}|<p>Disk read average response time (in ms) before the trigger would fire</p>|`20`|Text macro|
|{$VFS.DEV.WRITE.AWAIT.WARN}|<p>Disk write average response time (in ms) before the trigger would fire</p>|`20`|Text macro|
|{$VFS.FS.FSDEVICE.MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^.+$`|Text macro|
|{$VFS.FS.FSDEVICE.NOT_MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^\s$`|Text macro|
|{$VFS.FS.FSNAME.MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`.+`|Text macro|
|{$VFS.FS.FSNAME.NOT_MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^(/dev|/sys|/run|/proc|.+/shm$)`|Text macro|
|{$VFS.FS.FSTYPE.MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^(btrfs|ext2|ext3|ext4|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|apfs|refs|ntfs|fat32|zfs)$`|Text macro|
|{$VFS.FS.FSTYPE.NOT_MATCHES}|<p>This macro is used in filesystems discovery. Can be overridden on the host or linked template level</p>|`^\s$`|Text macro|
|{$VFS.FS.INODE.PFREE.MIN.CRIT}|<p>-</p>|`10`|Text macro|
|{$VFS.FS.INODE.PFREE.MIN.WARN}|<p>-</p>|`20`|Text macro|
|{$VFS.FS.PUSED.MAX.CRIT}|<p>-</p>|`90`|Text macro|
|{$VFS.FS.PUSED.MAX.WARN}|<p>-</p>|`80`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Block devices discovery|<p>-</p>|`Dependent item`|vfs.dev.discovery[node_exporter]<p>Update: 0</p>|
|Mounted filesystem discovery|<p>Discovery of file systems of different types.</p>|`Dependent item`|vfs.fs.discovery[node_exporter]<p>Update: 0</p>|
|Network interface discovery|<p>Discovery of network interfaces. Requires node_exporter v0.18 and up.</p>|`Dependent item`|net.if.discovery[node_exporter]<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Load average (1m avg)|<p>-</p>|`Dependent item`|system.cpu.load.avg1[node_exporter]<p>Update: 0</p>|
|CPU guest time|<p>Guest time (time spent running a virtual CPU for a guest operating system)</p>|`Dependent item`|system.cpu.guest[node_exporter]<p>Update: 0</p>|
|CPU idle time|<p>The time the CPU has spent doing nothing.</p>|`Dependent item`|system.cpu.idle[node_exporter]<p>Update: 0</p>|
|Operating system architecture|<p>Operating system architecture of the host.</p>|`Dependent item`|system.sw.arch[node_exporter]<p>Update: 0</p>|
|System boot time|<p>-</p>|`Dependent item`|system.boottime[node_exporter]<p>Update: 0</p>|
|Interrupts per second|<p>-</p>|`Dependent item`|system.cpu.intr[node_exporter]<p>Update: 0</p>|
|Available memory|<p>Available memory, in Linux, available = free + buffers + cache. On other platforms calculation may vary. See also: https://www.zabbix.com/documentation/current/manual/appendix/items/vm.memory.size_params</p>|`Dependent item`|vm.memory.available[node_exporter]<p>Update: 0</p>|
|Version of node_exporter running|<p>-</p>|`Dependent item`|agent.version[node_exporter]<p>Update: 0</p>|
|System description|<p>Labeled system information as provided by the uname system call.</p>|`Dependent item`|system.descr[node_exporter]<p>Update: 0</p>|
|Context switches per second|<p>-</p>|`Dependent item`|system.cpu.switches[node_exporter]<p>Update: 0</p>|
|Load average (5m avg)|<p>-</p>|`Dependent item`|system.cpu.load.avg5[node_exporter]<p>Update: 0</p>|
|Free swap space|<p>The free space of swap volume/file in bytes.</p>|`Dependent item`|system.swap.free[node_exporter]<p>Update: 0</p>|
|CPU system time|<p>The time the CPU has spent running the kernel and its processes.</p>|`Dependent item`|system.cpu.system[node_exporter]<p>Update: 0</p>|
|Load average (15m avg)|<p>-</p>|`Dependent item`|system.cpu.load.avg15[node_exporter]<p>Update: 0</p>|
|System uptime|<p>System uptime in 'N days, hh:mm:ss' format.</p>|`Dependent item`|system.uptime[node_exporter]<p>Update: 0</p>|
|Total swap space|<p>The total space of swap volume/file in bytes.</p>|`Dependent item`|system.swap.total[node_exporter]<p>Update: 0</p>|
|Get node_exporter metrics|<p>-</p>|`HTTP agent`|node_exporter.get<p>Update: 1m</p>|
|System local time|<p>System local time of the host.</p>|`Dependent item`|system.localtime[node_exporter]<p>Update: 0</p>|
|System name|<p>System host name.</p>|`Dependent item`|system.name[node_exporter]<p>Update: 0</p>|
|CPU user time|<p>The time the CPU has spent running users' processes that are not niced.</p>|`Dependent item`|system.cpu.user[node_exporter]<p>Update: 0</p>|
|CPU iowait time|<p>Amount of time the CPU has been waiting for I/O to complete.</p>|`Dependent item`|system.cpu.iowait[node_exporter]<p>Update: 0</p>|
|CPU utilization|<p>CPU utilization in %</p>|`Dependent item`|system.cpu.util[node_exporter]<p>Update: 0</p>|
|CPU softirq time|<p>The amount of time the CPU has been servicing software interrupts.</p>|`Dependent item`|system.cpu.softirq[node_exporter]<p>Update: 0</p>|
|Memory utilization|<p>Memory used percentage is calculated as (total-available)/total*100</p>|`Calculated`|vm.memory.util[node_exporter]<p>Update: 1m</p>|
|CPU guest nice time|<p>Time spent running a niced guest (virtual CPU for guest operating systems under the control of the Linux kernel)</p>|`Dependent item`|system.cpu.guest_nice[node_exporter]<p>Update: 0</p>|
|CPU interrupt time|<p>The amount of time the CPU has been servicing hardware interrupts.</p>|`Dependent item`|system.cpu.interrupt[node_exporter]<p>Update: 0</p>|
|Number of open file descriptors|<p>-</p>|`Dependent item`|fd.open[node_exporter]<p>Update: 0</p>|
|Operating system|<p>-</p>|`Dependent item`|system.sw.os[node_exporter]<p>Update: 0</p>|
|Total memory|<p>Total memory in Bytes</p>|`Dependent item`|vm.memory.total[node_exporter]<p>Update: 0</p>|
|Free swap space in %|<p>The free space of swap volume/file in percent.</p>|`Calculated`|system.swap.pfree[node_exporter]<p>Update: 1m</p>|
|Maximum number of open file descriptors|<p>It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.</p>|`Dependent item`|kernel.maxfiles[node_exporter]<p>Update: 0</p>|
|CPU steal time|<p>The amount of CPU 'stolen' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).</p>|`Dependent item`|system.cpu.steal[node_exporter]<p>Update: 0</p>|
|Number of CPUs|<p>-</p>|`Dependent item`|system.cpu.num[node_exporter]<p>Update: 0</p>|
|CPU nice time|<p>The time the CPU has spent running users' processes that have been niced.</p>|`Dependent item`|system.cpu.nice[node_exporter]<p>Update: 0</p>|
|{#DEVNAME}: Disk read request avg waiting time (r_await)|<p>This formula contains two boolean expressions that evaluates to 1 or 0 in order to set calculated metric to zero and to avoid division by zero exception.</p>|`Calculated`|vfs.dev.read.await[node_exporter,"{#DEVNAME}"]<p>Update: 1m</p><p>LLD</p>|
|{#DEVNAME}: Disk write request avg waiting time (w_await)|<p>This formula contains two boolean expressions that evaluates to 1 or 0 in order to set calculated metric to zero and to avoid division by zero exception.</p>|`Calculated`|vfs.dev.write.await[node_exporter,"{#DEVNAME}"]<p>Update: 1m</p><p>LLD</p>|
|{#DEVNAME}: Disk average queue size (avgqu-sz)|<p>Current average disk queue, the number of requests outstanding on the disk at the time the performance data is collected.</p>|`Dependent item`|vfs.dev.queue_size[node_exporter,"{#DEVNAME}"]<p>Update: 0</p><p>LLD</p>|
|{#DEVNAME}: Disk read rate|<p>r/s. The number (after merges) of read requests completed per second for the device.</p>|`Dependent item`|vfs.dev.read.rate[node_exporter,"{#DEVNAME}"]<p>Update: 0</p><p>LLD</p>|
|{#DEVNAME}: Disk read time (rate)|<p>Rate of total read time counter. Used in r_await calculation</p>|`Dependent item`|vfs.dev.read.time.rate[node_exporter,"{#DEVNAME}"]<p>Update: 0</p><p>LLD</p>|
|{#DEVNAME}: Disk utilization|<p>This item is the percentage of elapsed time that the selected disk drive was busy servicing read or writes requests.</p>|`Dependent item`|vfs.dev.util[node_exporter,"{#DEVNAME}"]<p>Update: 0</p><p>LLD</p>|
|{#DEVNAME}: Disk write rate|<p>w/s. The number (after merges) of write requests completed per second for the device.</p>|`Dependent item`|vfs.dev.write.rate[node_exporter,"{#DEVNAME}"]<p>Update: 0</p><p>LLD</p>|
|{#DEVNAME}: Disk write time (rate)|<p>Rate of total write time counter. Used in w_await calculation</p>|`Dependent item`|vfs.dev.write.time.rate[node_exporter,"{#DEVNAME}"]<p>Update: 0</p><p>LLD</p>|
|{#FSNAME}: Space utilization|<p>Space utilization in % for {#FSNAME}</p>|`Calculated`|vfs.fs.pused[node_exporter,"{#FSNAME}"]<p>Update: 1m</p><p>LLD</p>|
|{#FSNAME}: Used space|<p>Used storage in Bytes</p>|`Calculated`|vfs.fs.used[node_exporter,"{#FSNAME}"]<p>Update: 1m</p><p>LLD</p>|
|{#FSNAME}: Free space|<p>-</p>|`Dependent item`|vfs.fs.free[node_exporter,"{#FSNAME}"]<p>Update: 0</p><p>LLD</p>|
|{#FSNAME}: Free inodes in %|<p>-</p>|`Dependent item`|vfs.fs.inode.pfree[node_exporter,"{#FSNAME}"]<p>Update: 0</p><p>LLD</p>|
|{#FSNAME}: Total space|<p>Total space in Bytes</p>|`Dependent item`|vfs.fs.total[node_exporter,"{#FSNAME}"]<p>Update: 0</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets discarded|<p>-</p>|`Dependent item`|net.if.in.discards[node_exporter,"{#IFNAME}"]<p>Update: 0</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Inbound packets with errors|<p>-</p>|`Dependent item`|net.if.in.errors[node_exporter,"{#IFNAME}"]<p>Update: 0</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits received|<p>-</p>|`Dependent item`|net.if.in[node_exporter,"{#IFNAME}"]<p>Update: 0</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets discarded|<p>-</p>|`Dependent item`|net.if.out.discards[node_exporter,"{#IFNAME}"]<p>Update: 0</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Outbound packets with errors|<p>-</p>|`Dependent item`|net.if.out.errors[node_exporter"{#IFNAME}"]<p>Update: 0</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Bits sent|<p>-</p>|`Dependent item`|net.if.out[node_exporter,"{#IFNAME}"]<p>Update: 0</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Speed|<p>Sets value to 0 if metric is missing in node_exporter output.</p>|`Dependent item`|net.if.speed[node_exporter,"{#IFNAME}"]<p>Update: 0</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Operational status|<p>Indicates the interface RFC2863 operational state as a string. Possible values are:"unknown", "notpresent", "down", "lowerlayerdown", "testing","dormant", "up". Reference: https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-net</p>|`Dependent item`|net.if.status[node_exporter,"{#IFNAME}"]<p>Update: 0</p><p>LLD</p>|
|Interface {#IFNAME}({#IFALIAS}): Interface type|<p>node_network_protocol_type protocol_type value of /sys/class/net/<iface>.</p>|`Dependent item`|net.if.type[node_exporter,"{#IFNAME}"]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: change(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])<0 and last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])>0 and ( last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=6 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=7 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=11 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=62 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=69 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=117 ) and (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])<>2)</p><p>**Recovery expression**: (change(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])>0 and last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"],#2)>0) or (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: change(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])<0 and last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])>0 and (last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=6 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=1) and (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])<>2)</p><p>**Recovery expression**: (change(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])>0 and last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"],#2)>0) or (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage ( > {$IF.UTIL.MAX:"{#IFNAME}"}% )|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: (avg(/Kube Node by Prom API/net.if.in[node_exporter,"{#IFNAME}"],15m)>(90/100)*last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"]) or avg(/Kube Node by Prom API/net.if.out[node_exporter,"{#IFNAME}"],15m)>(90/100)*last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])) and last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])>0</p><p>**Recovery expression**: avg(/Kube Node by Prom API/net.if.in[node_exporter,"{#IFNAME}"],15m)<((90-3)/100)*last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"]) and avg(/Kube Node by Prom API/net.if.out[node_exporter,"{#IFNAME}"],15m)<((90-3)/100)*last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate ( > {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: min(/Kube Node by Prom API/net.if.in.errors[node_exporter,"{#IFNAME}"],5m)>2 or min(/Kube Node by Prom API/net.if.out.errors[node_exporter"{#IFNAME}"],5m)>2</p><p>**Recovery expression**: max(/Kube Node by Prom API/net.if.in.errors[node_exporter,"{#IFNAME}"],5m)<2*0.8 and max(/Kube Node by Prom API/net.if.out.errors[node_exporter"{#IFNAME}"],5m)<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])=2 and (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"],#1)<>last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"],#2))=1)</p><p>**Recovery expression**: last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])<>2</p>|average|
|{#DEVNAME}: Disk read/write request responses are too high (read > {$VFS.DEV.READ.AWAIT.WARN:"{#DEVNAME}"} ms for 15m or write > {$VFS.DEV.WRITE.AWAIT.WARN:"{#DEVNAME}"} ms for 15m)|<p>This trigger might indicate disk {#DEVNAME} saturation.</p>|<p>**Expression**: min(/Kube Node by Prom API/vfs.dev.read.await[node_exporter,"{#DEVNAME}"],15m) > 20 or min(/Kube Node by Prom API/vfs.dev.write.await[node_exporter,"{#DEVNAME}"],15m) > 20</p><p>**Recovery expression**: </p>|warning|
|{#FSNAME}: Disk space is critically low (used > {$VFS.FS.PUSED.MAX.CRIT:"{#FSNAME}"}%)|<p>Two conditions should match: First, space utilization should be above {$VFS.FS.PUSED.MAX.CRIT:"{#FSNAME}"}. Second condition should be one of the following: - The disk free space is less than 5G. - The disk will be full in less than 24 hours.</p>|<p>**Expression**: last(/Kube Node by Prom API/vfs.fs.pused[node_exporter,"{#FSNAME}"])>90 and ((last(/Kube Node by Prom API/vfs.fs.total[node_exporter,"{#FSNAME}"])-last(/Kube Node by Prom API/vfs.fs.used[node_exporter,"{#FSNAME}"]))<5G or timeleft(/Kube Node by Prom API/vfs.fs.pused[node_exporter,"{#FSNAME}"],1h,100)<1d)</p><p>**Recovery expression**: </p>|average|
|{#FSNAME}: Disk space is low (used > {$VFS.FS.PUSED.MAX.WARN:"{#FSNAME}"}%)|<p>Two conditions should match: First, space utilization should be above {$VFS.FS.PUSED.MAX.WARN:"{#FSNAME}"}. Second condition should be one of the following: - The disk free space is less than 10G. - The disk will be full in less than 24 hours.</p>|<p>**Expression**: last(/Kube Node by Prom API/vfs.fs.pused[node_exporter,"{#FSNAME}"])>80 and ((last(/Kube Node by Prom API/vfs.fs.total[node_exporter,"{#FSNAME}"])-last(/Kube Node by Prom API/vfs.fs.used[node_exporter,"{#FSNAME}"]))<10G or timeleft(/Kube Node by Prom API/vfs.fs.pused[node_exporter,"{#FSNAME}"],1h,100)<1d)</p><p>**Recovery expression**: </p>|warning|
|{#FSNAME}: Running out of free inodes (free < {$VFS.FS.INODE.PFREE.MIN.CRIT:"{#FSNAME}"}%)|<p>It may become impossible to write to disk if there are no index nodes left. As symptoms, 'No space left on device' or 'Disk is full' errors may be seen even though free space is available.</p>|<p>**Expression**: min(/Kube Node by Prom API/vfs.fs.inode.pfree[node_exporter,"{#FSNAME}"],5m)<10</p><p>**Recovery expression**: </p>|average|
|{#FSNAME}: Running out of free inodes (free < {$VFS.FS.INODE.PFREE.MIN.WARN:"{#FSNAME}"}%)|<p>It may become impossible to write to disk if there are no index nodes left. As symptoms, 'No space left on device' or 'Disk is full' errors may be seen even though free space is available.</p>|<p>**Expression**: min(/Kube Node by Prom API/vfs.fs.inode.pfree[node_exporter,"{#FSNAME}"],5m)<20</p><p>**Recovery expression**: </p>|warning|
|{#DEVNAME}: Disk read/write request responses are too high (read > {$VFS.DEV.READ.AWAIT.WARN:"{#DEVNAME}"} ms for 15m or write > {$VFS.DEV.WRITE.AWAIT.WARN:"{#DEVNAME}"} ms for 15m) (LLD)|<p>This trigger might indicate disk {#DEVNAME} saturation.</p>|<p>**Expression**: min(/Kube Node by Prom API/vfs.dev.read.await[node_exporter,"{#DEVNAME}"],15m) > 20 or min(/Kube Node by Prom API/vfs.dev.write.await[node_exporter,"{#DEVNAME}"],15m) > 20</p><p>**Recovery expression**: </p>|warning|
|{#FSNAME}: Disk space is critically low (used > {$VFS.FS.PUSED.MAX.CRIT:"{#FSNAME}"}%) (LLD)|<p>Two conditions should match: First, space utilization should be above {$VFS.FS.PUSED.MAX.CRIT:"{#FSNAME}"}. Second condition should be one of the following: - The disk free space is less than 5G. - The disk will be full in less than 24 hours.</p>|<p>**Expression**: last(/Kube Node by Prom API/vfs.fs.pused[node_exporter,"{#FSNAME}"])>90 and ((last(/Kube Node by Prom API/vfs.fs.total[node_exporter,"{#FSNAME}"])-last(/Kube Node by Prom API/vfs.fs.used[node_exporter,"{#FSNAME}"]))<5G or timeleft(/Kube Node by Prom API/vfs.fs.pused[node_exporter,"{#FSNAME}"],1h,100)<1d)</p><p>**Recovery expression**: </p>|average|
|{#FSNAME}: Disk space is low (used > {$VFS.FS.PUSED.MAX.WARN:"{#FSNAME}"}%) (LLD)|<p>Two conditions should match: First, space utilization should be above {$VFS.FS.PUSED.MAX.WARN:"{#FSNAME}"}. Second condition should be one of the following: - The disk free space is less than 10G. - The disk will be full in less than 24 hours.</p>|<p>**Expression**: last(/Kube Node by Prom API/vfs.fs.pused[node_exporter,"{#FSNAME}"])>80 and ((last(/Kube Node by Prom API/vfs.fs.total[node_exporter,"{#FSNAME}"])-last(/Kube Node by Prom API/vfs.fs.used[node_exporter,"{#FSNAME}"]))<10G or timeleft(/Kube Node by Prom API/vfs.fs.pused[node_exporter,"{#FSNAME}"],1h,100)<1d)</p><p>**Recovery expression**: </p>|warning|
|{#FSNAME}: Running out of free inodes (free < {$VFS.FS.INODE.PFREE.MIN.CRIT:"{#FSNAME}"}%) (LLD)|<p>It may become impossible to write to disk if there are no index nodes left. As symptoms, 'No space left on device' or 'Disk is full' errors may be seen even though free space is available.</p>|<p>**Expression**: min(/Kube Node by Prom API/vfs.fs.inode.pfree[node_exporter,"{#FSNAME}"],5m)<10</p><p>**Recovery expression**: </p>|average|
|{#FSNAME}: Running out of free inodes (free < {$VFS.FS.INODE.PFREE.MIN.WARN:"{#FSNAME}"}%) (LLD)|<p>It may become impossible to write to disk if there are no index nodes left. As symptoms, 'No space left on device' or 'Disk is full' errors may be seen even though free space is available.</p>|<p>**Expression**: min(/Kube Node by Prom API/vfs.fs.inode.pfree[node_exporter,"{#FSNAME}"],5m)<20</p><p>**Recovery expression**: </p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: change(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])<0 and last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])>0 and ( last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=6 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=7 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=11 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=62 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=69 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=117 ) and (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])<>2)</p><p>**Recovery expression**: (change(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])>0 and last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"],#2)>0) or (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before (LLD)|<p>This Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.</p>|<p>**Expression**: change(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])<0 and last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])>0 and (last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=6 or last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])=1) and (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])<>2)</p><p>**Recovery expression**: (change(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"])>0 and last(/Kube Node by Prom API/net.if.type[node_exporter,"{#IFNAME}"],#2)>0) or (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])=2)</p>|information|
|Interface {#IFNAME}({#IFALIAS}): High bandwidth usage ( > {$IF.UTIL.MAX:"{#IFNAME}"}% ) (LLD)|<p>The network interface utilization is close to its estimated maximum bandwidth.</p>|<p>**Expression**: (avg(/Kube Node by Prom API/net.if.in[node_exporter,"{#IFNAME}"],15m)>(90/100)*last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"]) or avg(/Kube Node by Prom API/net.if.out[node_exporter,"{#IFNAME}"],15m)>(90/100)*last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])) and last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])>0</p><p>**Recovery expression**: avg(/Kube Node by Prom API/net.if.in[node_exporter,"{#IFNAME}"],15m)<((90-3)/100)*last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"]) and avg(/Kube Node by Prom API/net.if.out[node_exporter,"{#IFNAME}"],15m)<((90-3)/100)*last(/Kube Node by Prom API/net.if.speed[node_exporter,"{#IFNAME}"])</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): High error rate ( > {$IF.ERRORS.WARN:"{#IFNAME}"} for 5m) (LLD)|<p>Recovers when below 80% of {$IF.ERRORS.WARN:"{#IFNAME}"} threshold</p>|<p>**Expression**: min(/Kube Node by Prom API/net.if.in.errors[node_exporter,"{#IFNAME}"],5m)>2 or min(/Kube Node by Prom API/net.if.out.errors[node_exporter"{#IFNAME}"],5m)>2</p><p>**Recovery expression**: max(/Kube Node by Prom API/net.if.in.errors[node_exporter,"{#IFNAME}"],5m)<2*0.8 and max(/Kube Node by Prom API/net.if.out.errors[node_exporter"{#IFNAME}"],5m)<2*0.8</p>|warning|
|Interface {#IFNAME}({#IFALIAS}): Link down (LLD)|<p>This trigger expression works as follows: 1. Can be triggered if operations status is down. 2. {$IFCONTROL:"{#IFNAME}"}=1 - user can redefine Context macro to value - 0. That marks this interface as not important. No new trigger will be fired if this interface is down. 3. {TEMPLATE_NAME:METRIC.diff()}=1) - trigger fires only if operational status was up(1) sometime before. (So, do not fire 'ethernal off' interfaces.) WARNING: if closed manually - won't fire again on next poll, because of .diff.</p>|<p>**Expression**: 1=1 and (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])=2 and (last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"],#1)<>last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"],#2))=1)</p><p>**Recovery expression**: last(/Kube Node by Prom API/net.if.status[node_exporter,"{#IFNAME}"])<>2</p>|average|


# Kube Pod by Prom API

## Description

This template works out of the box as soon as Prometheus (Prometheus-operator) is available inside your cluster; it does not require any Zabbix agent installation or configuration. It allows external monitoring of the Kubernetes cluster through ingress, without any NodePort declaration. It uses the Prometheus API to create a Zabbix host for each pod available inside the Kubernetes cluster. {$PROM.API.URL} must contains the Prometheus entry point into your Kubernetes cluster. Zabbix pod hosts are created with the "Template Kube Pod by Prom API" template by default.

## Overview

 ### Description


zabbix-kube-prom is a batch of Zabbix LLD templates for Zabbix server.


It is used for external Kubernetes monitoring by Zabbix via Prometheus API.


### Installation


1. Install [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) into the Kubernetes cluster.
2. Import global Zabbix Template (zabbix-kube-prom.xml) into your Zabbix server.
3. Create or import a host identifying your Kubernetes cluster where Prometheus is deployed.
4. Let LLD create discovered nodes as new "Zabbix hosts"
5. Let LLD create discovered pods as new "Virtual Zabbix hosts


### Templates


The global export (zabbix-kube-prom.xml) contains following templates:




| Templates | Description |
| --- | --- |
| Template Kube by Prom API | Creates a Zabbix host for each pod and node discovered. |
| Template Kube Node by Prom API | Template applied to the created host (node). |
| Template Kube Pod by Prom API | Template applied to the created host (pod). |


### Licenses




| Template | License |
| --- | --- |
| Template OS Linux by Prom | *GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README) |
| Template Kube by Prom APITemplate Kube Node by Prom APITemplate Kube Pod by Prom API | *GNU General Public License v3.0*[Copyright (C) 2021 Diagnostica Stago](https://www.stago.com/) |




---


 



## Author

Laurent Marchelli

## Description

Official Linux template using node exporter. Known Issues: Description: node_exporter v0.16.0 renamed many metrics. CPU utilization for 'guest' and 'guest_nice' metrics are not supported in this template with node_exporter < 0.16. Disk IO metrics are not supported. Other metrics provided as 'best effort'. See https://github.com/prometheus/node_exporter/releases/tag/v0.16.0 for details. Version: below 0.16.0 Description: metric node_network_info with label 'device' cannot be found, so network discovery is not possible. Version: below 0.18 You can discuss this template or leave feedback on our forum https://www.zabbix.com/forum/zabbix-suggestions-and-feedback/387225-discussion-thread-for-official-zabbix-template-for-linux Template tooling version used: 0.34

## Overview

 ### Description


zabbix-kube-prom is a batch of Zabbix LLD templates for Zabbix server.


It is used for external Kubernetes monitoring by Zabbix via Prometheus API.


### Installation


1. Install [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) into the Kubernetes cluster.
2. Import global Zabbix Template (zabbix-kube-prom.xml) into your Zabbix server.
3. Create or import a host identifying your Kubernetes cluster where Prometheus is deployed.
4. Let LLD create discovered nodes as new "Zabbix hosts"
5. Let LLD create discovered pods as new "Virtual Zabbix hosts


### Templates


The global export (zabbix-kube-prom.xml) contains following templates:




| Templates | Description |
| --- | --- |
| Template Kube by Prom API | Creates a Zabbix host for each pod and node discovered. |
| Template Kube Node by Prom API | Template applied to the created host (node). |
| Template Kube Pod by Prom API | Template applied to the created host (pod). |


### Licenses




| Template | License |
| --- | --- |
| Template OS Linux by Prom | *GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README) |
| Template Kube by Prom APITemplate Kube Node by Prom APITemplate Kube Pod by Prom API | *GNU General Public License v3.0*[Copyright (C) 2021 Diagnostica Stago](https://www.stago.com/) |




---


 



## Author

Laurent Marchelli

## Overview

 ### Description


zabbix-kube-prom is a batch of Zabbix LLD templates for Zabbix server.


It is used for external Kubernetes monitoring by Zabbix via Prometheus API.


### Installation


1. Install [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) into the Kubernetes cluster.
2. Import global Zabbix Template (zabbix-kube-prom.xml) into your Zabbix server.
3. Create or import a host identifying your Kubernetes cluster where Prometheus is deployed.
4. Let LLD create discovered nodes as new "Zabbix hosts"
5. Let LLD create discovered pods as new "Virtual Zabbix hosts


### Templates


The global export (zabbix-kube-prom.xml) contains following templates:




| Templates | Description |
| --- | --- |
| Template Kube by Prom API | Creates a Zabbix host for each pod and node discovered. |
| Template Kube Node by Prom API | Template applied to the created host (node). |
| Template Kube Pod by Prom API | Template applied to the created host (pod). |


### Licenses




| Template | License |
| --- | --- |
| Template OS Linux by Prom | *GNU General Public License v2.0 or later*[Copyright (C) 2001-2021 Zabbix SIA](https://github.com/zabbix/zabbix/blob/master/README) |
| Template Kube by Prom APITemplate Kube Node by Prom APITemplate Kube Pod by Prom API | *GNU General Public License v3.0*[Copyright (C) 2021 Diagnostica Stago](https://www.stago.com/) |




---


 



## Author

Laurent Marchelli

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PROM.POD.DEVICE.MATCHES}|<p>Device regex used in pod's metric discovery. Can be overridden on the host or linked template level.</p>|`^.*$`|Text macro|
|{$PROM.POD.DEVICE.NOT_MATCHES}|<p>Device interface regex used in pod's metric discovery. Can be overridden on the host or linked template level.</p>|`CHANGE_IF_NEEDED`|Text macro|
|{$PROM.POD.IFNAME.MATCHES}|<p>Network interface regex used in pod's metric discovery. Can be overridden on the host or linked template level.</p>|`^.*$`|Text macro|
|{$PROM.POD.IFNAME.NOT_MATCHES}|<p>Network interface regex used in pod's metric discovery. Can be overridden on the host or linked template level.</p>|`CHANGE_IF_NEEDED`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery memory|<p>-</p>|`Dependent item`|prom.pod.discovery[memory]<p>Update: 0</p>|
|Discovery storage_fs|<p>-</p>|`Dependent item`|prom.pod.discovery[storage,fs]<p>Update: 0</p>|
|_New Discovery|<p>-</p>|`Dependent item`|prom.pod.discovery[new]<p>Update: 0</p>|
|Discovery monitoring|<p>-</p>|`Dependent item`|prom.pod.discovery[monitoring]<p>Update: 0</p>|
|Discovery storage|<p>-</p>|`Dependent item`|prom.pod.discovery[storage]<p>Update: 0</p>|
|Discovery network|<p>-</p>|`Dependent item`|prom.pod.discovery[network]<p>Update: 0</p>|
|Discovery cpu|<p>-</p>|`Dependent item`|prom.pod.discovery[cpu]<p>Update: 0</p>|
|Discovery spec|<p>-</p>|`Dependent item`|prom.pod.discovery[spec]<p>Update: 0</p>|
|Discovery cpu_usage|<p>-</p>|`Dependent item`|prom.pod.discovery[cpu_usage]<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Metrics spec|<p>-</p>|`HTTP agent`|prom.pod.metrics[spec]<p>Update: 1m</p>|
|Metrics storage_fs|<p>-</p>|`HTTP agent`|prom.pod.metrics[storage,fs]<p>Update: 1m</p>|
|Metrics storage|<p>-</p>|`HTTP agent`|prom.pod.metrics[storage]<p>Update: 1m</p>|
|Metrics monitoring|<p>-</p>|`HTTP agent`|prom.pod.metrics[monitoring]<p>Update: 1m</p>|
|Metrics cpu|<p>-</p>|`HTTP agent`|prom.pod.metrics[cpu]<p>Update: 30s</p>|
|Metrics network|<p>-</p>|`HTTP agent`|prom.pod.metrics[network]<p>Update: 1m</p>|
|_New Metrics|<p>-</p>|`HTTP agent`|prom.pod.metrics[new]<p>Update: 5s</p>|
|Metrics memory|<p>-</p>|`HTTP agent`|prom.pod.metrics[memory]<p>Update: 1m</p>|
|Metrics cpu_usage|<p>-</p>|`HTTP agent`|prom.pod.metrics[cpu_usage]<p>Update: 30s</p>|
|{#CONTAINER} - {#METRIC}|<p>-</p>|`Dependent item`|prom.pod.metrics[memory,{#CONTAINER},{#METRIC}]<p>Update: 0</p><p>LLD</p>|
|{#CONTAINER} - Storage {#DEVICE}: {#METRIC}|<p>-</p>|`Dependent item`|prom.pod.metrics[storage,{#CONTAINER},{#METRIC},{#DEVICE}]<p>Update: 0</p><p>LLD</p>|
|{#CONTAINER} - {#METRIC}|<p>-</p>|`Dependent item`|prom.pod.metrics[new,{#CONTAINER},{#METRIC}]<p>Update: 0</p><p>LLD</p>|
|{#METRIC} ({#TYPE},{#RESULT})|<p>-</p>|`Dependent item`|prom.pod.metrics[monitoring,{#METRIC},{#TYPE},{#RESULT}]<p>Update: 0</p><p>LLD</p>|
|{#CONTAINER} - {#METRIC}|<p>-</p>|`Dependent item`|prom.pod.metrics[storage,{#CONTAINER},{#METRIC}]<p>Update: 0</p><p>LLD</p>|
|Network {#IFNAME}: {#METRIC}|<p>-</p>|`Dependent item`|prom.pod.metrics[network,{#METRIC},{#IFNAME}]<p>Update: 0</p><p>LLD</p>|
|{#CONTAINER} - {#METRIC}|<p>-</p>|`Dependent item`|prom.pod.metrics[cpu,{#CONTAINER},{#METRIC}]<p>Update: 0</p><p>LLD</p>|
|{#CONTAINER} - {#METRIC}|<p>-</p>|`Dependent item`|prom.pod.metrics[spec,{#CONTAINER},{#METRIC}]<p>Update: 0</p><p>LLD</p>|
|{#CONTAINER} - container_cpu_usage_seconds_total|<p>-</p>|`Dependent item`|prom.pod.metrics[cpu_usage,{#CONTAINER},container_cpu_usage_seconds_total]<p>Update: 0</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

