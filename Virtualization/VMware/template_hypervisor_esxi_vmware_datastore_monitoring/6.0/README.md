# Virt VMware Hypervisor ESXi - Andre Bello

## Overview

Contact: [andreantunes.si@gmail.com](mailto:andreantunes.si@gmail.com)


Skype: andreantunes.si


 


Incluied: Datastore free, free %, Total


Memory: Used memory, Used memory %, Total Memory,


 


*How to obtain ESXi UUID*


0. You need to enable MOB vib, esxcli does not seems to provide the valid uuid for this.


1. enable MOB vib : Go to you're vsphere Advanced Settings, Config, Hostagent, plugins, solo, check "Config.HostAgent.plugins.solo.enableMob"


2. Browse to https://esxi.hostname/mob/?moid=ha-host&doPath=hardware.systemInfo


3. disable MOB vib again (uncheck Config.HostAgent.plugins.solo.enableMob)


 Your HOSTNAME will be your UUID


Else:


**esxcfg-info -u** 


Used Macros:


{$USERNAME} -> User connect ESxi


{$PASSWORD} Password access to Esxi


{$URL} - https://Your ip Esxi/sdk


 



## Author

Andre Bello

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
|Uptime|<p>System uptime.</p>|`Simple check`|vmware.hv.uptime[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Number of bytes transmitted|<p>-</p>|`Simple check`|vmware.hv.network.out[{$URL},{HOST.HOST},bps]<p>Update: 600</p>|
|Number of bytes received|<p>-</p>|`Simple check`|vmware.hv.network.in[{$URL},{HOST.HOST},bps]<p>Update: 600</p>|
|Used memory %|<p>Physical memory usage on the host.</p>|`Calculated`|vmware.hv.memory.pused[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|CPU cores|<p>Number of physical CPU cores on the host. Physical CPU cores are the processors contained by a CPU package.</p>|`Simple check`|vmware.hv.hw.cpu.num[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|CPU frequency|<p>The speed of the CPU cores. This is an average value if there are multiple speeds. The product of CPU frequency and number of cores is approximately equal to the sum of the MHz for all the individual cores on the host.</p>|`Simple check`|vmware.hv.hw.cpu.freq[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Vendor|<p>The hardware vendor identification.</p>|`Simple check`|vmware.hv.hw.vendor[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Full name|<p>The complete product name, including the version information.</p>|`Simple check`|vmware.hv.fullname[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|CPU usage|<p>Aggregated CPU usage across all cores on the host in Hz. This is only available if the host is connected.</p>|`Simple check`|vmware.hv.cpu.usage[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|CPU model|<p>The CPU model.</p>|`Simple check`|vmware.hv.hw.cpu.model[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Bios UUID|<p>The hardware BIOS identification.</p>|`Simple check`|vmware.hv.hw.uuid[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Number of guest VMs|<p>Number of guest virtual machines.</p>|`Simple check`|vmware.hv.vm.num[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Used Memory|<p>Physical memory usage on the host.</p>|`Simple check`|vmware.hv.memory.used[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Cluster name|<p>Cluster name of the guest VM.</p>|`Simple check`|vmware.hv.cluster.name[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Total Memory|<p>Physical memory usage on the host.</p>|`Simple check`|vmware.hv.hw.memory[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Ballooned memory|<p>The amount of guest physical memory that is currently reclaimed through the balloon driver. Sum of all guest VMs.</p>|`Simple check`|vmware.hv.memory.size.ballooned[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Overall status|<p>The overall alarm status of the host: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.</p>|`Simple check`|vmware.hv.status[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Version|<p>Dot-separated version string.</p>|`Simple check`|vmware.hv.version[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Model|<p>The system model identification.</p>|`Simple check`|vmware.hv.hw.model[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|CPU threads|<p>Number of physical CPU threads on the host.</p>|`Simple check`|vmware.hv.hw.cpu.threads[{$URL},{HOST.HOST}]<p>Update: 600</p>|
|Average read latency of the datastore $3|<p>-</p>|`Simple check`|vmware.hv.datastore.read[{$URL},{HOST.HOST},{#DATASTORE},latency]<p>Update: 600</p><p>LLD</p>|
|Datastore Free $3|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE},free]<p>Update: 600</p><p>LLD</p>|
|Datastore Free % $3|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE},pfree]<p>Update: 600</p><p>LLD</p>|
|Datastore Total % $3|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE},total]<p>Update: 600</p><p>LLD</p>|
|Average write latency of the datastore $3|<p>-</p>|`Simple check`|vmware.hv.datastore.write[{$URL},{HOST.HOST},{#DATASTORE},latency]<p>Update: 600</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#DATASTORE} is  85% Used|<p>-</p>|<p>**Expression**: last(/Virt VMware Hypervisor ESXi - Andre Bello/vmware.hv.datastore.size[{$URL},Virt VMware Hypervisor ESXi - Andre Bello,{#DATASTORE},pfree])<15</p><p>**Recovery expression**: </p>|average|
|{#DATASTORE} is  90% Used|<p>-</p>|<p>**Expression**: last(/Virt VMware Hypervisor ESXi - Andre Bello/vmware.hv.datastore.size[{$URL},Virt VMware Hypervisor ESXi - Andre Bello,{#DATASTORE},pfree])<10</p><p>**Recovery expression**: </p>|high|
|{#DATASTORE} is  95% Used|<p>-</p>|<p>**Expression**: last(/Virt VMware Hypervisor ESXi - Andre Bello/vmware.hv.datastore.size[{$URL},Virt VMware Hypervisor ESXi - Andre Bello,{#DATASTORE},pfree])<5</p><p>**Recovery expression**: </p>|disaster|
|{#DATASTORE} is  85% Used (LLD)|<p>-</p>|<p>**Expression**: last(/Virt VMware Hypervisor ESXi - Andre Bello/vmware.hv.datastore.size[{$URL},Virt VMware Hypervisor ESXi - Andre Bello,{#DATASTORE},pfree])<15</p><p>**Recovery expression**: </p>|average|
|{#DATASTORE} is  90% Used (LLD)|<p>-</p>|<p>**Expression**: last(/Virt VMware Hypervisor ESXi - Andre Bello/vmware.hv.datastore.size[{$URL},Virt VMware Hypervisor ESXi - Andre Bello,{#DATASTORE},pfree])<10</p><p>**Recovery expression**: </p>|high|
|{#DATASTORE} is  95% Used (LLD)|<p>-</p>|<p>**Expression**: last(/Virt VMware Hypervisor ESXi - Andre Bello/vmware.hv.datastore.size[{$URL},Virt VMware Hypervisor ESXi - Andre Bello,{#DATASTORE},pfree])<5</p><p>**Recovery expression**: </p>|disaster|
