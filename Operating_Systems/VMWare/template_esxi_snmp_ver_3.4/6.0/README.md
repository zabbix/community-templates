# Template SNMP OS ESXi

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Environment discovery|<p>A unique identifier that does not persist across management restarts</p>|`SNMP agent`|vmwEnvIndex<p>Update: 3600</p>|
|Virtual Machines|<p>Name by which this vm is displayed. It is not guaranteed to be unique. MOB: https://esx.example.com/mob/?moid=vmwVmIdx&doPath=summary%2eguest</p>|`SNMP agent`|vmwVmDisplayName<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ESXi Build|<p>This identifier represents the most specific identifier. VIM Property: AboutInfo.build https://esx.example.com/mob/?moid=ServiceInstance&doPath=content%2eabout</p>|`SNMP agent`|vmwProdBuild.0<p>Update: 3600</p>|
|ESXi Version|<p>The product's version release identifier. Format is Major.Minor.Update VIM Property: AboutInfo.version https://esx.example.com/mob/?moid=ServiceInstance&doPath=content%2eabout</p>|`SNMP agent`|vmwProdVersion.0<p>Update: 3600</p>|
|ESXi memory size|<p>Amount of physical memory present on machine as provided by Hypervisor. It is computed from the sum of vmwMemCOS plus unreserved property as reported VIM subsystem. Unreserved is computed from hypervisor's total number of memory pages. VIM Parent Container: https://esx.example.com/mob/?moid=memorySystem VIM property: unreserved MOB: https://esx.example.com/mob/?moid=memoryManagerSystem&doPath=consoleReservationInfo For reference here two other related VIM properties: VIM property: memorySize MOB: https://esx.example.com/mob/?moid=ha%2dhost&doPath=summary%2ehardware VIM property: totalMemory MOB: https://esx.example.com/mob/?moid=ha%2dcompute%2dres&doPath=summary</p>|`SNMP agent`|vmwMemSize<p>Update: 3600</p>|
|ESXi memory used|<p>-</p>|`Calculated`|vmwMemUsed<p>Update: 60s</p>|
|ESXi memory available|<p>Amount of memory available to run Virutal Machines and to allocate for hypervisor needs. It is computed by subtracting vmwMemCOS from vmwMemSize. The result is the amount of memory available to VMs and to the hypervisor. To get a more accurate view of memory available to VMs the following property represents the amount of resources available for the root resource pool for running virtual machines. VIM property: effectiveMemory MOB: https://esx.example.com/mob/?moid=ha%2dcompute%2dres&doPath=summary</p>|`SNMP agent`|vmwMemAvail<p>Update: 60s</p>|
|ESXi physical CPU numbers|<p>Number of physical CPUs on the system.</p>|`SNMP agent`|vmwNumCpus<p>Update: 3600</p>|
|ESXi name|<p>This product's name. VIM Property: AboutInfo.name https://esx.example.com/mob/?moid=ServiceInstance&doPath=content%2eabout</p>|`SNMP agent`|vmwProdName.0<p>Update: 3600</p>|
|ESXi subsystem {#SNMPINDEX} description|<p>Human readable description of this event</p>|`SNMP agent`|vmwEventDescription[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|ESXi subsystem {#SNMPINDEX} status|<p>Last reported state of this component</p>|`SNMP agent`|vmwSubsystemStatus[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|ESXi subsystem {#SNMPINDEX} type|<p>Hardware component reporting environmental state</p>|`SNMP agent`|vmwSubsystemType[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|VM {#SNMPVALUE} Guest OS|<p>Operating system running on this vm. This value corresponds to the value specified when creating the VM and unless set correctly may differ from the actual OS running. Will return one of the values if set in order: Vim.Vm.GuestInfo.guestFullName Vim.Vm.GuestInfo.guestId Vim.Vm.GuestInfo.guestFamily MOB: https://esx.example.com/mob/?moid=vmwVmIdx&doPath=guest where moid = vmwVmIdx. If VMware Tools is not running, value will be of form 'E: error message'</p>|`SNMP agent`|vmwVMGuestOS.[{#SNMPINDEX}]<p>Update: 3600</p><p>LLD</p>|
|VM {#SNMPVALUE} Guest State|<p>Operation mode of guest operating system. Values include: running - Guest is running normally. shuttingdown - Guest has a pending shutdown command. resetting - Guest has a pending reset command. standby - Guest has a pending standby command. notrunning - Guest is not running. unknown - Guest information is not available. VIM Property: guestState MOB: https://esx.example.com/mob/?moid=vmwVmIdx&doPath=guest</p>|`SNMP agent`|vmwVMGuestState.[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|VM {#SNMPVALUE} Power State|<p>Power state of the virtual machine. VIM Property: powerState MOB: https://esx.example.com/mob/?moid=vmwVmIdx&doPath=summary%2eruntime</p>|`SNMP agent`|vmwVMState.[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|VM {#SNMPVALUE} CPUs Number|<p>Number of virtual CPUs assigned to this virtual machine. VIM Property: numCPU MOB: https://esx.example.com/mob/?moid=vmwVmIdx&doPath=config%2ehardware</p>|`SNMP agent`|vmwVMCPUs.[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|VM {#SNMPVALUE} Memory Size|<p>Memory configured for this virtual machine. Memory > MAX Integer32 is reported as max integer32. VIM Property: memoryMB MOB: https://esx.example.com/mob/?moid=vmwVmIdx&doPath=config%2ehardware</p>|`SNMP agent`|vmwVMMemSize.[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Guest Tools not running on {#SNMPVALUE}|<p>-</p>|<p>**Expression**: find(/Template SNMP OS ESXi/vmwVMGuestState.[{#SNMPINDEX}],,"regexp","not running")=1</p><p>**Recovery expression**: </p>|information|
|ESXi subsystem {#SNMPINDEX} on {HOST.NAME} status is not OK|<p>-</p>|<p>**Expression**: last(/Template SNMP OS ESXi/vmwSubsystemStatus[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
|ESXi subsystem {#SNMPINDEX} on {HOST.NAME} status is not OK (LLD)|<p>-</p>|<p>**Expression**: last(/Template SNMP OS ESXi/vmwSubsystemStatus[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
|Guest Tools not running on {#SNMPVALUE} (LLD)|<p>-</p>|<p>**Expression**: find(/Template SNMP OS ESXi/vmwVMGuestState.[{#SNMPINDEX}],,"regexp","not running")=1</p><p>**Recovery expression**: </p>|information|
