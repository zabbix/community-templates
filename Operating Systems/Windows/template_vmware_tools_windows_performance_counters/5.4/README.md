# VMware Tools Windows performance counters

## Overview

VMware Tools Windows performance counters Template
==================================================


Introduction
------------


This is my approach for a performance monitoring Template of VMware Tools for Windows.


This Template was created on and for Zabbix 3.4 and VMware Tools 9+ on Windows Server 2008 R2 / 2012 R2 / 2016.


Installation
------------


1. Zabbix Agent should be installed, configured and working.
2. VMware Tools should be installed and working.
3. Import the Template.
4. Link the Template to your desired Windows Host(s).


Notes
-----


* 19 Items, 1 disabled which I never needed (VM Processor - Shares)
* Every Item has the Description field populated with the official description of the perfmon values.
* No Trigger, Graphs, Screens or LLD Discovery rules defined.
* I did my very best at defining the Preprocessing steps for each item value like MB, Hz and Percent. I hope I got them all right.


Check the Github Page for latest version and instructions.



## Author

Marco Hofmann

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|VM Processor - Reservation in MHz|<p>The minimum processing power in MHz available to the virtual machine. Assigning a CPU Reservation ensures that even as other virtual machines on the same host consume shared processing power, there is still a certain minimum amount for this virtual machine.</p>|`Zabbix agent`|perf_counter["\VM Processor(_Total)\Reservation in MHz"]<p>Update: 10m</p>|
|VM Memory - Memory Mapped in MB|<p>The mapped memory size of this virtual machine. This is the current total amount of guest memory that is backed by physical memory. Note that this number may include pages of memory shared between multiple virtual machines and thus may be an overestimate of the amount of physical host memory *consumed* by this virtual machine.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Mapped in MB"]<p>Update: 1m</p>|
|VM Memory - Memory Shared Saved in MB|<p>The estimated amount of physical memory on the host saved from copy-on-write (COW) shared guest physical memory.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Shared Saved in MB"]<p>Update: 1m</p>|
|VM Processor - Limit in MHz|<p>The maximum processing power in MHz allowed to the virtual machine. Assigning a CPU Limit ensures that this virtual machine never consumes more than a certain amount of the available processor power. By limiting the amount of processing power consumed, a portion of the processing power becomes available to other virtual machines.</p>|`Zabbix agent`|perf_counter["\VM Processor(_Total)\Limit in MHz"]<p>Update: 10m</p>|
|VM Memory - Memory Reservation in MB|<p>The minimum amount of memory that is guaranteed to the virtual machine. Assigning a Memory Reservation ensures that even as other virtual machines on the same host consume memory, there is still a certain minimum amount for this virtual machine.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Reservation in MB"]<p>Update: 5m</p>|
|VM Memory - Memory Target Size|<p>Memory Target Size.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Target Size"]<p>Update: 1m</p>|
|VM Processor - Effective VM Speed in MHz|<p>The approximate average effective speed of the VM's virtual CPU over the time period between the two samples.</p>|`Zabbix agent`|perf_counter["\VM Processor(_Total)\Effective VM Speed in MHz"]<p>Update: 1m</p>|
|VM Memory - Memory Active in MB|<p>The estimated amount of memory the virtual machine is actively using.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Active in MB"]<p>Update: 1m</p>|
|VM Memory - Memory Ballooned in MB|<p>The amount of memory that has been reclaimed from this virtual machine via the VMware Memory Balloon mechanism.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Ballooned in MB"]<p>Update: 1m</p>|
|VM Memory - Memory Overhead in MB|<p>The amount of overhead memory associated with this virtual machine consumed on the host system.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Overhead in MB"]<p>Update: 1m</p>|
|VM Memory - Memory Swapped in MB|<p>The amount of memory associated with this virtual machine that has been swapped by ESX.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Swapped in MB"]<p>Update: 1m</p>|
|VM Memory - Memory Shares|<p>The number of memory shares allocated to the virtual machine.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Shares"]<p>Update: 5m</p>|
|VM Memory - Memory Used in MB|<p>The estimated amount of physical host memory currently consumed for this virtual machine's physical memory. This is the same as (Memory Mapped in MB) - (Memory Shared Saved in MB).</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Used in MB"]<p>Update: 1m</p>|
|VM Memory - Memory Limit in MB|<p>The maximum amount of memory that is allowed to the virtual machine. Assigning a Memory Limit ensures that this virtual machine never consumes more than a certain amount of the allowed memory. By limiting the amount of memory consumed, a portion of this shared resource is allowed to other virtual machines.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Limit in MB"]<p>Update: 5m</p>|
|VM Memory - Memory Shared in MB|<p>The amount of physical memory associated with this virtual machine that is copy-on-write (COW) shared on the host.</p>|`Zabbix agent`|perf_counter["\VM Memory\Memory Shared in MB"]<p>Update: 5m</p>|
|VM Processor - CPU stolen time|<p>The time (in ms) that the VM was runnable but not scheduled to run.</p>|`Zabbix agent`|perf_counter["\VM Processor(_Total)\CPU stolen time"]<p>Update: 1m</p>|
|VM Processor - Shares|<p>The number of CPU shares allocated to the virtual machine.</p>|`Zabbix agent`|perf_counter["\VM Processor(_Total)\Shares"]<p>Update: 10m</p>|
|VM Processor - % Processor Time|<p>Current load of the VM's virtual processor.</p>|`Zabbix agent`|perf_counter["\VM Processor(_Total)\% Processor Time"]<p>Update: 1m</p>|
|VM Processor - Host processor speed in MHz|<p>Host Processor speed.</p>|`Zabbix agent`|perf_counter["\VM Processor(_Total)\Host processor speed in MHz"]<p>Update: 10m</p>|


## Triggers

There are no triggers in this template.

