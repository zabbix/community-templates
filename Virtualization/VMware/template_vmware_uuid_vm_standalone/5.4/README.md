# VM VMware UUID VM Standalone

## Overview

Standalone template modified from Zabbix's "VM VMware Guest" for monitoring selected VMs instead of all VMs as per Zabbix's auto-discovery template. Modified from 3.4.7 and 3.0.15


 


 **Requirements**


* Read-only ESXi user credentials
* ESXi server IP address
* VM (Virtual Machine not host) UUID
* VMware Tools installed in VM


**To obtain** **VM UUID** (<http://www-01.ibm.com/support/docview.wss?uid=swg21682150>)


* Login to vSphere client
* Go to Virtual Machines
* Verify column headers include UUID. If not, right button click on column header and select UUID
* Select desire VM, right button click and "Copy to Clipboard"
* CTRL-V into text editor, select UUID, copy and paste.


UUID value can also be obtained by viewing the VM's .vmx file via SSH shell. Value is defined as **uuid.bios** but must be formatted in the correct form. So if uuid.bios="42 10 c1 62 e3 1e 70 e6-4a 03 b4 6a bb e1 7b 4f", UUID is  "4210c162-e31e-70e6-4a03-b46abbe17b4f"


 


**To use** 


* Create new Host
* Go to **Templates**
* Search for, select "VMware UUID VM Standalone" and add
* Go to **Macros**, **Inherited and Host Macros**
* Click Change to modify the values for
	+ {$USERNAME} : ESXi username
	+ {$PASSWORD} : ESXi password
	+ {$URL} : https://{ESXi-IP-Address}/sdk
	+ {$UUID} : UUID in lower case
* Click Add


For those using Grafana, I have uploaded the dashboard to <https://grafana.com/dashboards/4809>


 


**Others**


Edit **zabbix\_server.conf** and update value of **StartVMwareCollectors** to more than 0 and restart zabbix-server.



## Author

Zabbix

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PASSWORD}|<p>-</p>|`{Password}`|Text macro|
|{$URL}|<p>-</p>|`https://{ESXi}/sdk`|Text macro|
|{$USERNAME}|<p>-</p>|`zabbix`|Text macro|
|{$UUID}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Network device discovery|<p>Discovery of all network devices.</p>|`Simple check`|vmware.vm.net.if.discovery[{$URL},{$UUID}]<p>Update: 1h</p>|
|Mounted filesystem discovery|<p>Discovery of all guest file systems.</p>|`Simple check`|vmware.vm.vfs.fs.discovery[{$URL},{$UUID}]<p>Update: 1h</p>|
|Disk device discovery|<p>Discovery of all disk devices.</p>|`Simple check`|vmware.vm.vfs.dev.discovery[{$URL},{$UUID}]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU usage|<p>Current upper-bound on CPU usage. The upper-bound is based on the host the virtual machine is current running on, as well as limits configured on the virtual machine itself or any parent resource pool. Valid while the virtual machine is running.</p>|`Simple check`|vmware.vm.cpu.usage[{$URL},{$UUID}]<p>Update: 1m</p>|
|Memory size|<p>Total size of configured memory.</p>|`Simple check`|vmware.vm.memory.size[{$URL},{$UUID}]<p>Update: 1m</p>|
|Datacenter name|<p>Datacenter name of the guest VM.</p>|`Simple check`|vmware.vm.datacenter.name[{$URL},{$UUID}]<p>Update: 1m</p>|
|Uptime|<p>System uptime.</p>|`Simple check`|vmware.vm.uptime[{$URL},{$UUID}]<p>Update: 1m</p>|
|Cluster name|<p>Cluster name of the guest VM.</p>|`Simple check`|vmware.vm.cluster.name[{$URL},{$UUID}]<p>Update: 1h</p>|
|Guest memory usage|<p>The amount of guest physical memory that is being used by the VM.</p>|`Simple check`|vmware.vm.memory.size.usage.guest[{$URL},{$UUID}]<p>Update: 1m</p>|
|Unshared storage space|<p>Total storage space, in bytes, occupied by the virtual machine across all datastores, that is not shared with any other virtual machine.</p>|`Simple check`|vmware.vm.storage.unshared[{$URL},{$UUID}]<p>Update: 1m</p>|
|Hypervisor name|<p>Hypervisor name of the guest VM.</p>|`Simple check`|vmware.vm.hv.name[{$URL},{$UUID}]<p>Update: 1h</p>|
|Private memory|<p>Amount of memory backed by host memory and not being shared.</p>|`Simple check`|vmware.vm.memory.size.private[{$URL},{$UUID}]<p>Update: 1m</p>|
|Uncommitted storage space|<p>Additional storage space, in bytes, potentially used by this virtual machine on all datastores.</p>|`Simple check`|vmware.vm.storage.uncommitted[{$URL},{$UUID}]<p>Update: 1m</p>|
|Compressed memory|<p>The amount of memory currently in the compression cache for this VM.</p>|`Simple check`|vmware.vm.memory.size.compressed[{$URL},{$UUID}]<p>Update: 1m</p>|
|Committed storage space|<p>Total storage space, in bytes, committed to this virtual machine across all datastores.</p>|`Simple check`|vmware.vm.storage.committed[{$URL},{$UUID}]<p>Update: 1m</p>|
|Swapped memory|<p>The amount of guest physical memory swapped out to the VM's swap device by ESX.</p>|`Simple check`|vmware.vm.memory.size.swapped[{$URL},{$UUID}]<p>Update: 1m</p>|
|Host memory usage|<p>The amount of host physical memory allocated to the VM, accounting for saving from memory sharing with other VMs.</p>|`Simple check`|vmware.vm.memory.size.usage.host[{$URL},{$UUID}]<p>Update: 1m</p>|
|Power state|<p>The current power state of the virtual machine.</p>|`Simple check`|vmware.vm.powerstate[{$URL},{$UUID}]<p>Update: 1m</p>|
|Shared memory|<p>The amount of guest physical memory shared through transparent page sharing.</p>|`Simple check`|vmware.vm.memory.size.shared[{$URL},{$UUID}]<p>Update: 1m</p>|
|CPU ready|<p>Time that the virtual machine was ready, but could not get scheduled to run on the physical CPU during last measurement interval (VMware vCenter/ESXi Server performance counter sampling interval - 20 seconds)</p>|`Simple check`|vmware.vm.cpu.ready[{$URL},{$UUID}]<p>Update: 1m</p>|
|Number of virtual CPUs|<p>Number of virtual CPUs assigned to the guest.</p>|`Simple check`|vmware.vm.cpu.num[{$URL},{$UUID}]<p>Update: 1m</p>|
|Ballooned memory|<p>The amount of guest physical memory that is currently reclaimed through the balloon driver.</p>|`Simple check`|vmware.vm.memory.size.ballooned[{$URL},{$UUID}]<p>Update: 1m</p>|
|Number of bytes received on interface {#IFDESC}|<p>-</p>|`Simple check`|vmware.vm.net.if.in[{$URL},{$UUID},{#IFNAME},bps]<p>Update: 1m</p><p>LLD</p>|
|Number of packets received on interface {#IFDESC}|<p>-</p>|`Simple check`|vmware.vm.net.if.in[{$URL},{$UUID},{#IFNAME},pps]<p>Update: 1m</p><p>LLD</p>|
|Number of bytes transmitted on interface {#IFDESC}|<p>-</p>|`Simple check`|vmware.vm.net.if.out[{$URL},{$UUID},{#IFNAME},bps]<p>Update: 1m</p><p>LLD</p>|
|Number of packets transmitted on interface {#IFDESC}|<p>-</p>|`Simple check`|vmware.vm.net.if.out[{$URL},{$UUID},{#IFNAME},pps]<p>Update: 1m</p><p>LLD</p>|
|Free disk space on {#FSNAME}|<p>-</p>|`Simple check`|vmware.vm.vfs.fs.size[{$URL},{$UUID},{#FSNAME},free]<p>Update: 1m</p><p>LLD</p>|
|Free disk space on {#FSNAME} (percentage)|<p>-</p>|`Simple check`|vmware.vm.vfs.fs.size[{$URL},{$UUID},{#FSNAME},pfree]<p>Update: 1m</p><p>LLD</p>|
|Total disk space on {#FSNAME}|<p>-</p>|`Simple check`|vmware.vm.vfs.fs.size[{$URL},{$UUID},{#FSNAME},total]<p>Update: 1h</p><p>LLD</p>|
|Used disk space on {#FSNAME}|<p>-</p>|`Simple check`|vmware.vm.vfs.fs.size[{$URL},{$UUID},{#FSNAME},used]<p>Update: 1m</p><p>LLD</p>|
|Average number of bytes read from the disk {#DISKDESC}|<p>-</p>|`Simple check`|vmware.vm.vfs.dev.read[{$URL},{$UUID},{#DISKNAME},bps]<p>Update: 1m</p><p>LLD</p>|
|Average number of reads from the disk {#DISKDESC}|<p>-</p>|`Simple check`|vmware.vm.vfs.dev.read[{$URL},{$UUID},{#DISKNAME},ops]<p>Update: 1m</p><p>LLD</p>|
|Average number of bytes written to the disk {#DISKDESC}|<p>-</p>|`Simple check`|vmware.vm.vfs.dev.write[{$URL},{$UUID},{#DISKNAME},bps]<p>Update: 1m</p><p>LLD</p>|
|Average number of writes to the disk {#DISKDESC}|<p>-</p>|`Simple check`|vmware.vm.vfs.dev.write[{$URL},{$UUID},{#DISKNAME},ops]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

