# VM VMware UUID ESXi Standalone

## Overview

Standalone template modified from Zabbix's "VM VMware Hypervisor" template that includes ESXI event log from Zabbix's "VM VMware" template. Modified from 3.4.7 and 3.0.15


 


Requirements


1. Read-only ESXi user credentials
2. ESXi server UUID#
3. ESXi server IP address


Zabbix config required


Edit **zabbix\_server.conf,** update **StartVMwareCollectors** value to more than 0 and restart zabbix-server. For more details, refer to <https://www.zabbix.com/documentation/4.0/manual/vm_monitoring#configuration>


To use 


1. Create new Host* (preferably in host group VMware)
2. Go to **Templates**
3. Search for, select "VMware UUID ESXi Standalone" and add
4. Go to **Macros**, **Inherited and host Macros**
5. Click **Change** to modify the values for
	1. {$USERNAME} : ESXi username
	2. {$PASSWORD} : ESXi password
	3. {$URL} : <https://{ESXi-IP-Address}/sdk>
	4. {$UUID} : UUID in lower case#
6. Click **Add**


**#**Obtaining UUID


Login to your ESXi server, run**esxcfg-info -u |awk '{print tolower($0)}'** from SSH shell (Thanks to Travis Quinnelly)


Else


1. Vsphere Advanced Settings, Config, Hostagent, plugins, solo, check "Config.HostAgent.plugins.solo.enableMob"
2. Browse to [https:///mob/?moid=ha-host&doPath=hardware.systemInfo](mob/?moid=ha-host&doPath=hardware.systemInfo)
3. Copy down value
4. Uncheck as in step 1


*Grafana dashboard


For those using Grafana, I have uploaded dashboard to <https://grafana.com/dashboards/4812>. Note that your host must be in Zabbix host group **VMware**. 


 


Others


If template does not work, try using the official Zabbix VMware monitoring (e.g. <https://www.zabbix.com/documentation/4.0/manual/vm_monitoring>) 


 



## Author

Zabbix

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PASSWORD}|<p>-</p>|``|Text macro|
|{$URL}|<p>-</p>|`https://{ESXi}/sdk`|Text macro|
|{$USERNAME}|<p>-</p>|`zabbix`|Text macro|
|{$UUID}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Datastore discovery|<p>-</p>|`Simple check`|vmware.hv.datastore.discovery[{$URL},{$UUID}]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU cores|<p>Number of physical CPU cores on the host. Physical CPU cores are the processors contained by a CPU package.</p>|`Simple check`|vmware.hv.hw.cpu.num[{$URL},{$UUID}]<p>Update: 1h</p>|
|Full name|<p>The complete product name, including the version information.</p>|`Simple check`|vmware.hv.fullname[{$URL},{$UUID}]<p>Update: 1h</p>|
|Uptime|<p>System uptime.</p>|`Simple check`|vmware.hv.uptime[{$URL},{$UUID}]<p>Update: 1h</p>|
|Event log|<p>-</p>|`Simple check`|vmware.eventlog[{$URL}]<p>Update: 1m</p>|
|CPU usage|<p>Aggregated CPU usage across all cores on the host in Hz. This is only available if the host is connected.</p>|`Simple check`|vmware.hv.cpu.usage[{$URL},{$UUID}]<p>Update: 1m</p>|
|Bios UUID|<p>The hardware BIOS identification.</p>|`Simple check`|vmware.hv.hw.uuid[{$URL},{$UUID}]<p>Update: 1h</p>|
|CPU frequency|<p>The speed of the CPU cores. This is an average value if there are multiple speeds. The product of CPU frequency and number of cores is approximately equal to the sum of the MHz for all the individual cores on the host.</p>|`Simple check`|vmware.hv.hw.cpu.freq[{$URL},{$UUID}]<p>Update: 1h</p>|
|Used memory|<p>Physical memory usage on the host.</p>|`Simple check`|vmware.hv.memory.used[{$URL},{$UUID}]<p>Update: 1m</p>|
|Cluster name|<p>Cluster name of the guest VM.</p>|`Simple check`|vmware.hv.cluster.name[{$URL},{$UUID}]<p>Update: 1h</p>|
|Version|<p>Dot-separated version string.</p>|`Simple check`|vmware.hv.version[{$URL},{$UUID}]<p>Update: 1h</p>|
|Vendor|<p>The hardware vendor identification.</p>|`Simple check`|vmware.hv.hw.vendor[{$URL},{$UUID}]<p>Update: 1h</p>|
|Model|<p>The system model identification.</p>|`Simple check`|vmware.hv.hw.model[{$URL},{$UUID}]<p>Update: 1h</p>|
|Health state rollup|<p>The host health state rollup sensor value: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.</p>|`Simple check`|vmware.hv.sensor.health.state[{$URL},{$UUID}]<p>Update: 1m</p>|
|Number of bytes transmitted|<p>-</p>|`Simple check`|vmware.hv.network.out[{$URL},{$UUID},bps]<p>Update: 1m</p>|
|Total memory|<p>The physical memory size.</p>|`Simple check`|vmware.hv.hw.memory[{$URL},{$UUID}]<p>Update: 1h</p>|
|CPU threads|<p>Number of physical CPU threads on the host.</p>|`Simple check`|vmware.hv.hw.cpu.threads[{$URL},{$UUID}]<p>Update: 1h</p>|
|CPU model|<p>The CPU model.</p>|`Simple check`|vmware.hv.hw.cpu.model[{$URL},{$UUID}]<p>Update: 1h</p>|
|Number of bytes received|<p>-</p>|`Simple check`|vmware.hv.network.in[{$URL},{$UUID},bps]<p>Update: 1m</p>|
|Number of guest VMs|<p>Number of guest virtual machines.</p>|`Simple check`|vmware.hv.vm.num[{$URL},{$UUID}]<p>Update: 1h</p>|
|Datacenter name|<p>Datacenter name of the hypervisor.</p>|`Simple check`|vmware.hv.datacenter.name[{$URL},{$UUID}]<p>Update: 1m</p>|
|Ballooned memory|<p>The amount of guest physical memory that is currently reclaimed through the balloon driver. Sum of all guest VMs.</p>|`Simple check`|vmware.hv.memory.size.ballooned[{$URL},{$UUID}]<p>Update: 1m</p>|
|Overall status|<p>The overall alarm status of the host: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.</p>|`Simple check`|vmware.hv.status[{$URL},{$UUID}]<p>Update: 1m</p>|
|Average read latency of the datastore $3|<p>-</p>|`Simple check`|vmware.hv.datastore.read[{$URL},{$UUID},{#DATASTORE},latency]<p>Update: 1m</p><p>LLD</p>|
|Free space on datastore $3 (percentage)|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{$UUID},{#DATASTORE},pfree]<p>Update: 1m</p><p>LLD</p>|
|Total size of datastore $3|<p>-</p>|`Simple check`|vmware.hv.datastore.size[{$URL},{$UUID},{#DATASTORE}]<p>Update: 1m</p><p>LLD</p>|
|Average write latency of the datastore $3|<p>-</p>|`Simple check`|vmware.hv.datastore.write[{$URL},{$UUID},{#DATASTORE},latency]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

