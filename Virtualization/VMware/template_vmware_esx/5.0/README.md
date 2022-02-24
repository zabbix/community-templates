# Template VM VMware

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template VM VMware macros|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discover VMware hypervisors|<p>Discovery of hypervisors.</p>|`Simple check`|vmware.hv.discovery[{$URL}]<p>Update: 1h</p>|
|Discover VMware VMs|<p>Discovery of guest virtual machines.</p>|`Simple check`|vmware.vm.discovery[{$URL}]<p>Update: 1h</p>|
|Discover VMware clusters|<p>Discovery of clusters</p>|`Simple check`|vmware.cluster.discovery[{$URL}]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Full name|<p>-</p>|`Simple check`|vmware.fullname[{$URL}]<p>Update: 1h</p>|
|Event log|<p>-</p>|`Simple check`|vmware.eventlog[{$URL}]<p>Update: 1m</p>|
|Version|<p>-</p>|`Simple check`|vmware.version[{$URL}]<p>Update: 1h</p>|
|Status of "{#CLUSTER.NAME}" cluster|<p>-</p>|`Simple check`|vmware.cluster.status[{$URL},{#CLUSTER.NAME}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

# Template VM VMware Guest

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template VM VMware macros|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network device discovery|<p>Discovery of all network devices.</p>|`Simple check`|vmware.vm.net.if.discovery[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Mounted filesystem discovery|<p>Discovery of all guest file systems.</p>|`Simple check`|vmware.vm.vfs.fs.discovery[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Disk device discovery|<p>Discovery of all disk devices.</p>|`Simple check`|vmware.vm.vfs.dev.discovery[{$URL},{HOST.HOST}]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of virtual CPUs|<p>Number of virtual CPUs assigned to the guest.</p>|`Simple check`|vmware.vm.cpu.num[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Cluster name|<p>Cluster name of the guest VM.</p>|`Simple check`|vmware.vm.cluster.name[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Committed storage space|<p>Total storage space, in bytes, committed to this virtual machine across all datastores.</p>|`Simple check`|vmware.vm.storage.committed[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Uncommitted storage space|<p>Additional storage space, in bytes, potentially used by this virtual machine on all datastores.</p>|`Simple check`|vmware.vm.storage.uncommitted[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Swapped memory|<p>The amount of guest physical memory swapped out to the VM's swap device by ESX.</p>|`Simple check`|vmware.vm.memory.size.swapped[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Host memory usage|<p>The amount of host physical memory allocated to the VM, accounting for saving from memory sharing with other VMs.</p>|`Simple check`|vmware.vm.memory.size.usage.host[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Datacenter name|<p>Datacenter name of the guest VM.</p>|`Simple check`|vmware.vm.datacenter.name[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Ballooned memory|<p>The amount of guest physical memory that is currently reclaimed through the balloon driver.</p>|`Simple check`|vmware.vm.memory.size.ballooned[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Hypervisor name|<p>Hypervisor name of the guest VM.</p>|`Simple check`|vmware.vm.hv.name[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Unshared storage space|<p>Total storage space, in bytes, occupied by the virtual machine across all datastores, that is not shared with any other virtual machine.</p>|`Simple check`|vmware.vm.storage.unshared[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Compressed memory|<p>The amount of memory currently in the compression cache for this VM.</p>|`Simple check`|vmware.vm.memory.size.compressed[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Memory size|<p>Total size of configured memory.</p>|`Simple check`|vmware.vm.memory.size[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|CPU ready|<p>Time that the virtual machine was ready, but could not get scheduled to run on the physical CPU during last measurement interval (VMware vCenter/ESXi Server performance counter sampling interval - 20 seconds)</p>|`Simple check`|vmware.vm.cpu.ready[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|CPU usage|<p>Current upper-bound on CPU usage. The upper-bound is based on the host the virtual machine is current running on, as well as limits configured on the virtual machine itself or any parent resource pool. Valid while the virtual machine is running.</p>|`Simple check`|vmware.vm.cpu.usage[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Uptime|<p>System uptime.</p>|`Simple check`|vmware.vm.uptime[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Shared memory|<p>The amount of guest physical memory shared through transparent page sharing.</p>|`Simple check`|vmware.vm.memory.size.shared[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Private memory|<p>Amount of memory backed by host memory and not being shared.</p>|`Simple check`|vmware.vm.memory.size.private[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Power state|<p>The current power state of the virtual machine.</p>|`Simple check`|vmware.vm.powerstate[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Guest memory usage|<p>The amount of guest physical memory that is being used by the VM.</p>|`Simple check`|vmware.vm.memory.size.usage.guest[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Number of bytes received on interface {#IFDESC}|<p>-</p>|`Simple check`|vmware.vm.net.if.in[{$URL},{HOST.HOST},{#IFNAME},bps]<p>Update: 1m</p><p>LLD</p>|
|Number of packets received on interface {#IFDESC}|<p>-</p>|`Simple check`|vmware.vm.net.if.in[{$URL},{HOST.HOST},{#IFNAME},pps]<p>Update: 1m</p><p>LLD</p>|
|Number of bytes transmitted on interface {#IFDESC}|<p>-</p>|`Simple check`|vmware.vm.net.if.out[{$URL},{HOST.HOST},{#IFNAME},bps]<p>Update: 1m</p><p>LLD</p>|
|Number of packets transmitted on interface {#IFDESC}|<p>-</p>|`Simple check`|vmware.vm.net.if.out[{$URL},{HOST.HOST},{#IFNAME},pps]<p>Update: 1m</p><p>LLD</p>|
|Free disk space on {#FSNAME}|<p>-</p>|`Simple check`|vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},free]<p>Update: 1m</p><p>LLD</p>|
|Free disk space on {#FSNAME} (percentage)|<p>-</p>|`Simple check`|vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},pfree]<p>Update: 1m</p><p>LLD</p>|
|Total disk space on {#FSNAME}|<p>-</p>|`Simple check`|vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},total]<p>Update: 1h</p><p>LLD</p>|
|Used disk space on {#FSNAME}|<p>-</p>|`Simple check`|vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},used]<p>Update: 1m</p><p>LLD</p>|
|Average number of bytes read from the disk {#DISKDESC}|<p>-</p>|`Simple check`|vmware.vm.vfs.dev.read[{$URL},{HOST.HOST},{#DISKNAME},bps]<p>Update: 1m</p><p>LLD</p>|
|Average number of reads from the disk {#DISKDESC}|<p>-</p>|`Simple check`|vmware.vm.vfs.dev.read[{$URL},{HOST.HOST},{#DISKNAME},ops]<p>Update: 1m</p><p>LLD</p>|
|Average number of bytes written to the disk {#DISKDESC}|<p>-</p>|`Simple check`|vmware.vm.vfs.dev.write[{$URL},{HOST.HOST},{#DISKNAME},bps]<p>Update: 1m</p><p>LLD</p>|
|Average number of writes to the disk {#DISKDESC}|<p>-</p>|`Simple check`|vmware.vm.vfs.dev.write[{$URL},{HOST.HOST},{#DISKNAME},ops]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

# Template VM VMware Hypervisor

## Macros used

There are no macros links in this template.

## Template links

|Name|
|----|
|Template VM VMware macros|


## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Datastore discovery|<p>-</p>|`Simple check`|vmware.hv.datastore.discovery[{$URL},{HOST.HOST}]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Model|<p>The system model identification.</p>|`Simple check`|vmware.hv.hw.model[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Total memory|<p>The physical memory size.</p>|`Simple check`|vmware.hv.hw.memory[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Full name|<p>The complete product name, including the version information.</p>|`Simple check`|vmware.hv.fullname[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|CPU frequency|<p>The speed of the CPU cores. This is an average value if there are multiple speeds. The product of CPU frequency and number of cores is approximately equal to the sum of the MHz for all the individual cores on the host.</p>|`Simple check`|vmware.hv.hw.cpu.freq[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|CPU model|<p>The CPU model.</p>|`Simple check`|vmware.hv.hw.cpu.model[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Datacenter name|<p>Datacenter name of the hypervisor.</p>|`Simple check`|vmware.hv.datacenter.name[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Total Ghz|<p>-</p>|`Calculated`|vmware.hv.hw.cpu.total[{$URL},{HOST.HOST}]<p>Update: 30s</p>|
|Used memory|<p>Physical memory usage on the host.</p>|`Simple check`|vmware.hv.memory.used[{$URL},{HOST.HOST}]<p>Update: 30s</p>|
|CPU usage|<p>Aggregated CPU usage across all cores on the host in Hz. This is only available if the host is connected.</p>|`Simple check`|vmware.hv.cpu.usage[{$URL},{HOST.HOST}]<p>Update: 30s</p>|
|Ballooned memory|<p>The amount of guest physical memory that is currently reclaimed through the balloon driver. Sum of all guest VMs.</p>|`Simple check`|vmware.hv.memory.size.ballooned[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Uptime|<p>System uptime.</p>|`Simple check`|vmware.hv.uptime[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Number of bytes received|<p>-</p>|`Simple check`|vmware.hv.network.in[{$URL},{HOST.HOST},bps]<p>Update: 1m</p>|
|Number of guest VMs|<p>Number of guest virtual machines.</p>|`Simple check`|vmware.hv.vm.num[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|CPU Utilização %|<p>-</p>|`Calculated`|vmware.hv.hw.cpu.total.percent[{$URL},{HOST.HOST}]<p>Update: 30s</p>|
|Health state rollup|<p>The host health state rollup sensor value: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.</p>|`Simple check`|vmware.hv.sensor.health.state[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Vendor|<p>The hardware vendor identification.</p>|`Simple check`|vmware.hv.hw.vendor[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|CPU cores|<p>Number of physical CPU cores on the host. Physical CPU cores are the processors contained by a CPU package.</p>|`Simple check`|vmware.hv.hw.cpu.num[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Overall status|<p>The overall alarm status of the host: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.</p>|`Simple check`|vmware.hv.status[{$URL},{HOST.HOST}]<p>Update: 1m</p>|
|Cluster name|<p>Cluster name of the guest VM.</p>|`Simple check`|vmware.hv.cluster.name[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Version|<p>Dot-separated version string.</p>|`Simple check`|vmware.hv.version[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Bios UUID|<p>The hardware BIOS identification.</p>|`Simple check`|vmware.hv.hw.uuid[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Number of bytes transmitted|<p>-</p>|`Simple check`|vmware.hv.network.out[{$URL},{HOST.HOST},bps]<p>Update: 1m</p>|
|Memória Utilizada %|<p>-</p>|`Calculated`|vmware.hv.hw.memory.percent[{$URL},{HOST.HOST}]<p>Update: 30s</p>|
|CPU threads|<p>Number of physical CPU threads on the host.</p>|`Simple check`|vmware.hv.hw.cpu.threads[{$URL},{HOST.HOST}]<p>Update: 1h</p>|
|Average read latency of the datastore {#DATASTORE}|<p>-</p>|`Simple check`|vmware.hv.datastore.read[{$URL},{HOST.HOST},{#DATASTORE},latency]<p>Update: 1m</p><p>LLD</p>|
|Free space on datastore {#DATASTORE} (percentage)|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE},pfree]<p>Update: 1m</p><p>LLD</p>|
|Total size of datastore {#DATASTORE}|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE}]<p>Update: 1m</p><p>LLD</p>|
|Average write latency of the datastore {#DATASTORE}|<p>-</p>|`Simple check`|vmware.hv.datastore.write[{$URL},{HOST.HOST},{#DATASTORE},latency]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Espaço no datastore "{#DATASTORE}" está acima de 70%|<p>-</p>|<p>**Expression**: {Template VM VMware Hypervisor:vmware.hv.datastore.size[{$URL},Template VM VMware Hypervisor,{#DATASTORE},pfree].avg(5m)}<=30</p><p>**Recovery expression**: </p>|average|
|Espaço no datastore "{#DATASTORE}" está acima de 75%|<p>-</p>|<p>**Expression**: {Template VM VMware Hypervisor:vmware.hv.datastore.size[{$URL},Template VM VMware Hypervisor,{#DATASTORE},pfree].avg(5m)}<=25</p><p>**Recovery expression**: </p>|high|
|Espaço no datastore "{#DATASTORE}" está acima de 80%|<p>-</p>|<p>**Expression**: {Template VM VMware Hypervisor:vmware.hv.datastore.size[{$URL},Template VM VMware Hypervisor,{#DATASTORE},pfree].avg(5m)}<=20</p><p>**Recovery expression**: </p>|disaster|
|Espaço no datastore "{#DATASTORE}" está acima de 70% (LLD)|<p>-</p>|<p>**Expression**: {Template VM VMware Hypervisor:vmware.hv.datastore.size[{$URL},Template VM VMware Hypervisor,{#DATASTORE},pfree].avg(5m)}<=30</p><p>**Recovery expression**: </p>|average|
|Espaço no datastore "{#DATASTORE}" está acima de 75% (LLD)|<p>-</p>|<p>**Expression**: {Template VM VMware Hypervisor:vmware.hv.datastore.size[{$URL},Template VM VMware Hypervisor,{#DATASTORE},pfree].avg(5m)}<=25</p><p>**Recovery expression**: </p>|high|
|Espaço no datastore "{#DATASTORE}" está acima de 80% (LLD)|<p>-</p>|<p>**Expression**: {Template VM VMware Hypervisor:vmware.hv.datastore.size[{$URL},Template VM VMware Hypervisor,{#DATASTORE},pfree].avg(5m)}<=20</p><p>**Recovery expression**: </p>|disaster|
