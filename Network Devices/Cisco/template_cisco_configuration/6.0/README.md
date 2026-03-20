# SNMP Cisco Configuration

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Who changed configuration|<p>This object indicates the user who last reset the Config Change Tracking ID.</p>|`SNMP agent`|ccmctIdWhoChanged<p>Update: 3600</p>|
|Running configuration last saved|<p>The value of sysUpTime when the running configuration was last saved (written). If the value of ccmHistoryRunningLastChanged is greater than ccmHistoryRunningLastSaved, the configuration has been changed but not saved. What constitutes a safe saving of the running configuration is a management policy issue beyond the scope of this MIB. For some installations, writing the running configuration to a terminal may be a way of capturing and saving it. Others may use local or remote storage. Thus ANY write is considered saving for the purposes of the MIB.</p>|`SNMP agent`|ccmHistoryRunningLastSaved<p>Update: 3600</p>|
|Running startup last changed|<p>The value of sysUpTime when the startup configuration was last written to. In general this is the default configuration used when cold starting the system. It may have been changed by a save of the running configuration or by a copy from elsewhere.</p>|`SNMP agent`|ccmHistoryStartupLastChanged<p>Update: 3600</p>|
|Running configuration last changed|<p>The value of sysUpTime when the running configuration was last changed. If the value of ccmHistoryRunningLastChanged is greater than ccmHistoryRunningLastSaved, the configuration has been changed but not saved.</p>|`SNMP agent`|ccmHistoryRunningLastChanged<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

