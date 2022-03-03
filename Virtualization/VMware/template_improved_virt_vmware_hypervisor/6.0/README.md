# Template Virt VMware Hypervisor

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Datastore discovery|<p>-</p>|`Simple check`|vmware.hv.datastore.discovery[{$URL},{HOST.HOST}]<p>Update: 86400</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Overall status|<p>The overall alarm status of the host: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.</p>|`Simple check`|vmware.hv.status[{$URL},{HOST.HOST}]<p>Update: 300</p>|
|Vendor|<p>The hardware vendor identification.</p>|`Simple check`|vmware.hv.hw.vendor[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|CPU model|<p>The CPU model.</p>|`Simple check`|vmware.hv.hw.cpu.model[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|Version|<p>Dot-separated version string.</p>|`Simple check`|vmware.hv.version[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|CPU usage|<p>Aggregated CPU usage across all cores on the host in Hz. This is only available if the host is connected.</p>|`Simple check`|vmware.hv.cpu.usage[{$URL},{HOST.HOST}]<p>Update: 300</p>|
|Full name|<p>The complete product name, including the version information.</p>|`Simple check`|vmware.hv.fullname[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|Number of guest VMs|<p>Number of guest virtual machines.</p>|`Simple check`|vmware.hv.vm.num[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|CPU Usage Percentage|<p>-</p>|`Calculated`|vmware.hv.hw.cpu.total.percent[{$URL},{HOST.HOST}]<p>Update: 60</p>|
|CPU cores|<p>Number of physical CPU cores on the host. Physical CPU cores are the processors contained by a CPU package.</p>|`Simple check`|vmware.hv.hw.cpu.num[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|Used memory|<p>Physical memory usage on the host.</p>|`Simple check`|vmware.hv.memory.used[{$URL},{HOST.HOST}]<p>Update: 300</p>|
|Model|<p>The system model identification.</p>|`Simple check`|vmware.hv.hw.model[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|Number of bytes transmitted|<p>-</p>|`Simple check`|vmware.hv.network.out[{$URL},{HOST.HOST},bps]<p>Update: 300</p>|
|Bios UUID|<p>The hardware BIOS identification.</p>|`Simple check`|vmware.hv.hw.uuid[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|Number of bytes received|<p>-</p>|`Simple check`|vmware.hv.network.in[{$URL},{HOST.HOST},bps]<p>Update: 300</p>|
|Health state rollup|<p>The host health state rollup sensor value: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.</p>|`Simple check`|vmware.hv.sensor.health.state[{$URL},{HOST.HOST}]<p>Update: 300</p>|
|Total memory|<p>The physical memory size.</p>|`Simple check`|vmware.hv.hw.memory[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|Uptime|<p>System uptime.</p>|`Simple check`|vmware.hv.uptime[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|CPU frequency|<p>The speed of the CPU cores. This is an average value if there are multiple speeds. The product of CPU frequency and number of cores is approximately equal to the sum of the MHz for all the individual cores on the host.</p>|`Simple check`|vmware.hv.hw.cpu.freq[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|Cluster name|<p>Cluster name of the guest VM.</p>|`Simple check`|vmware.hv.cluster.name[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|CPU Total Frequency|<p>-</p>|`Calculated`|vmware.hv.hw.cpu.total[{$URL},{HOST.HOST}]<p>Update: 60</p>|
|Ballooned memory|<p>The amount of guest physical memory that is currently reclaimed through the balloon driver. Sum of all guest VMs.</p>|`Simple check`|vmware.hv.memory.size.ballooned[{$URL},{HOST.HOST}]<p>Update: 300</p>|
|Used memory percentage|<p>-</p>|`Calculated`|vmware.hv.hw.memory.total.percent[{$URL},{HOST.HOST}]<p>Update: 60</p>|
|CPU threads|<p>Number of physical CPU threads on the host.</p>|`Simple check`|vmware.hv.hw.cpu.threads[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|Datacenter name|<p>Datacenter name of the hypervisor.</p>|`Simple check`|vmware.hv.datacenter.name[{$URL},{HOST.HOST}]<p>Update: 3600</p>|
|Available memory|<p>-</p>|`Calculated`|vmware.hv.memory.available[{$URL},{HOST.HOST}]<p>Update: 60</p>|
|Average read latency of the datastore $3|<p>-</p>|`Simple check`|vmware.hv.datastore.read[{$URL},{HOST.HOST},{#DATASTORE},latency]<p>Update: 300</p><p>LLD</p>|
|Average write latency of the datastore $3|<p>-</p>|`Simple check`|vmware.hv.datastore.write[{$URL},{HOST.HOST},{#DATASTORE},latency]<p>Update: 300</p><p>LLD</p>|
|Free space on datastore $3|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE},free]<p>Update: 300</p><p>LLD</p>|
|Free space on datastore $3 (percentage)|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE},pfree]<p>Update: 300</p><p>LLD</p>|
|Total size of datastore $3|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE}]<p>Update: 300</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} - Free space on datastore {#DATASTORE} is {ITEM.LASTVALUE1} - {ITEM.LASTVALUE2} remaining|<p>-</p>|<p>**Expression**: min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},pfree],5m)<=90 and min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},free],5m)<=0</p><p>**Recovery expression**: min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},pfree],5m)>=88</p>|average|
|{HOST.NAME} - Free space on datastore {#DATASTORE} is {ITEM.LASTVALUE1} - {ITEM.LASTVALUE2} remaining|<p>-</p>|<p>**Expression**: min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},pfree],5m)<=95 and min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},free],5m)<=0</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} - Free space on datastore {#DATASTORE} is {ITEM.LASTVALUE1} - {ITEM.LASTVALUE2} remaining (LLD)|<p>-</p>|<p>**Expression**: min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},pfree],5m)<=90 and min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},free],5m)<=0</p><p>**Recovery expression**: min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},pfree],5m)>=88</p>|average|
|{HOST.NAME} - Free space on datastore {#DATASTORE} is {ITEM.LASTVALUE1} - {ITEM.LASTVALUE2} remaining (LLD)|<p>-</p>|<p>**Expression**: min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},pfree],5m)<=95 and min(/Template Virt VMware Hypervisor/vmware.hv.datastore.size[{$URL},Template Virt VMware Hypervisor,{#DATASTORE},free],5m)<=0</p><p>**Recovery expression**: </p>|high|
