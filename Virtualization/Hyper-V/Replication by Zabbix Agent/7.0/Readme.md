# Hyper-V-Replication-by-Zabbix-Agent
by @Treeefort

## Summary
This template simply monitors Hyper-V virtual machine running state and replication health. 

If you're looking for more detailed monitoring, check out [a-schild/Zabbix-HyperV-Templates](https://github.com/a-schild/Zabbix-HyperV-Templates).

This template requires Zabbix Agent installed on the Hyper-V host, and nothing else. All data is obtained using WMI calls directly from the Zabbix Agent.

It was created because other Hyper-V templates in Zabbix all used Powershell calls, and the Hyper-V VMMS service on my hosts is really slow to respond to Get-VM calls. The Powershell scripts kept timing out with Zabbix's hard-maximum timeout value of 30 seconds. All I really want to monitor anyway is Replication health, as I'm already monitoring the VMs themselves independently.

## What's in the Template?
```
1 Macro - Input of a string with wildcard for VM names to ignore
1 Item - WMI Data
1 Trigger - 
  High: Alerts if no new data has come in in the last 10 minutes.
1 Discovery Rule
  2 Item Prototypes
    VM State
    Replication Health
  4 Alert Prototypes
    High: Replication is Critical (Something other than Off, Running, or Paused)
    Info: Replication is disabled
    Warning: Replication is paused
    Info: VM is off
```
    

## Setup
1. Download `Hyper-V-Replication-by-Zabbix-Agent.yaml`.
2. In Zabbix, go to `Data Collection` -> `Templates` and then `Import` the .yaml with the button in the upper-right.
3. Create a new Host using a Zabbix Agent interface and attach the template.
4. Optional: In Host `Macros` you can set `{$IGNORED}` for any VMs you don't want to monitor. This uses [WQL syntax](https://learn.microsoft.com/en-us/windows/win32/wmisdk/wql-sql-for-wmi), so Wildcard is `%`

(Example: All of my replicated VMs got renamed to "Replica-<VMNAME>" to keep things organized. I don't want to monitor these because they're replicat*ed*, not replicat*ing*. So, I have my `{$IGNORED}` macro set to `Replica-%` and these replicated VMs are not discovered.)

## Thanks
This is my first Zabbix template and I'm not a Zabbix expert in the slightest. I'll try to help if you have issues, but this little project was mainly cobbled together using the knowledge of others.

Huge thanks to [this dude nryc on Reddit](https://www.reddit.com/r/zabbix/comments/k0pzyi/tutorial_for_lld_dependent_items_from_the_same/) for this very informative post laying out logically how to work with JSON data when doing LLD. That foundational knowledge is the lynchpin of this whole thing.
