# Alcatel-Lucent Enterprise OmniSwitch AOS 6.x

## Overview

**Alcatel-Lucent Enterprise OmniSwitch AOS Release 6.x**
========================================================



This template allows to monitor Alcatel-Lucent Enterprise OmniSwitch running AOS Release 6.x via SNMPv3. It is possible that the template also works for SNMPv1/v2c, but I'll not put any efforts in testing this (as there is no good reason not to use SNMPv3 where it is available).


Features
--------


* Automatic Discovery of all stack elements
* CPU (1 Min avg, 1 Hr max => Graph + Trigger for all slots)
* Memory (1 Min avg, 1 Hr max => Graph + Trigger for all slots)
* RX/TX Load (1 Min avg, 1 Hr max => Graph + Trigger for all slots)
* Switch Temperature (1 Min avg, 1 Hr max => Graph + Trigger for all slots)
* Power over Ethernet (PoE) ports (max power available & actual power consumption => Graph)
* System
	+ Device Contact
	+ Device Description
	+ Device Location
	+ Device Name
	+ Device Uptime
	+ Device type/model for all slots
	+ Device serial number for all slots
	+ Device Flash Freespace => Graph + Trigger for all slots
* Discovery
	+ All Ethernet Ports (regardless of state up/down)
	+ All IP Interfaces
	+ Associated In/OutOctets + Graphs based on Ethernet Port (ifDescription / IP-Interface name)
	+ Power over Ethernet ports (max power available & actual power consumption)


SNMPv3 configuration on ALE OmniSwitch AOS Release 6.x
------------------------------------------------------



```
-> user snmpv3 password snmpv3password sha+aes read-only all
```

Template configuration
----------------------


* Open "Configuration -> Templates -> Template Alcatel-Lucent Enterprise OmniSwitch AOS 6.x -> Macros" and set the three entries (see screenshot for reference)


Feedback / Things to note
-------------------------


* Feedback is welcome, but please note that this is/was an effort during my free time
* Reach out to me via Twitter @BennyE\_HH or via GitHub (with the associated account to this article)
* As per my knowledge it is not yet possible to generate a graph via LLD that will contain several sub-elements (e.g. all slots CPU/Memory etc) => see ZBXNEXT-927 for details


Changelog
---------


* 09.04.2018 - Initial release
* 14.04.2018 - Modified the template to discover most elements dynamically (now compatible to stacked and standalone OmniSwitch units)
* 28.04.2019 - Due to popular request, the individual PoE power consumption per port was added **(due to the use of regsub function, Zab**


## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_V3_AUTHPASSPHRASE}|<p>-</p>|`password_auth`|Text macro|
|{$SNMP_V3_PRIVPASSPHRASE}|<p>-</p>|`password_priv`|Text macro|
|{$SNMP_V3_USER}|<p>-</p>|`user`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discover ALE OmniSwitch AOS Release 6.x|<p>ALCATEL-IND1-PORT-MIB::esmSlotNumber.X - X is the slot number (element of the stack)</p>|`SNMP agent`|esmSlotNumber<p>Update: 3600</p>|
|Discover ALE OmniSwitch Entity AOS Release 6.x|<p>ENTITY-MIB::entPhysicalContainedIn.X - X is the slot number (element of the stack) and VALUE is Entity-value</p>|`SNMP agent`|slotindex<p>Update: 3600</p>|
|Discover ALE OmniSwitch AOS Release 6.x PoE Slot/Port|<p>AlcatelIND1InLinePowerEthernet::alaPethPsePortPowerMaximum.X.Y - X is the slot number (element of the stack) and Y is the port number.</p>|`SNMP agent`|poeSlotPortNumber<p>Update: 3600</p>|
|Discover Ethernet Interfaces|<p>-</p>|`SNMP agent`|ifDescription<p>Update: 3600</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Device description|<p>SNMPv2-MIB::sysDescr.0 - A textual description of the entity. This value should include the full name and version identification of the system's hardware type, software operating-system, and networking software.</p>|`SNMP agent`|sysDescr<p>Update: 300</p>|
|SysUptime|<p>DISMAN-EVENT-MIB::sysUpTimeInstance - Uptime of the system in TimeTicks (100 timeticks == 1 second)</p>|`SNMP agent`|SysUptime<p>Update: 60</p>|
|Device location|<p>SNMPv2-MIB::sysLocation.0 - The physical location of this node (e.g., `telephone closet, 3rd floor'). If the location is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysLocation<p>Update: 300</p>|
|Device contact details|<p>SNMPv2-MIB::sysContact.0 - The textual identification of the contact person for this managed node, together with information on how to contact this person. If no contact information is known, the value is the zero-length string.</p>|`SNMP agent`|sysContact<p>Update: 300</p>|
|Device name|<p>SNMPv2-MIB::sysName.0 - An administratively-assigned name for this managed node. By convention, this is the node's fully-qualified domain name. If the name is unknown, the value is the zero-length string.</p>|`SNMP agent`|sysName<p>Update: 300</p>|
|CPU usage 1 hr max slot {#SNMPVALUE}|<p>-</p>|`SNMP agent`|cpu1hrmax.slot.[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|CPU usage 1 min avg slot {#SNMPVALUE}|<p>-</p>|`SNMP agent`|cpu1minavg.slot.[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Freespace /flash slot {#SNMPVALUE}|<p>-</p>|`SNMP agent`|flashfreespace.slot.[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Memory usage 1 hr max slot {#SNMPVALUE}|<p>-</p>|`SNMP agent`|memory1hrmax.slot.[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Memory usage 1 min avg slot {#SNMPVALUE}|<p>-</p>|`SNMP agent`|memory1minavg.slot.[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|RXTX usage 1 hr max slot {#SNMPVALUE}|<p>-</p>|`SNMP agent`|rxtx1hrmax.slot.[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|RXTX usage 1 min avg slot {#SNMPVALUE}|<p>-</p>|`SNMP agent`|rxtx1minavg.slot.[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|Device type of slot {#SNMPINDEX}|<p>-</p>|`SNMP agent`|devicemodel.slot.[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Device serial number of slot {#SNMPINDEX}|<p>-</p>|`SNMP agent`|serialnumber.slot.[{#SNMPINDEX}]<p>Update: 300</p><p>LLD</p>|
|Temperature on slot {#SNMPINDEX}|<p>-</p>|`SNMP agent`|temperature.slot.[{#SNMPINDEX}]<p>Update: 60s</p><p>LLD</p>|
|PoE Power Actual {{#SNMPINDEX}.regsub("([0-9]+)\.([0-9]+)", \1/\2)}|<p>AlcatelIND1InLinePowerEthernet::alaPethPsePortPowerActual -- This object contains the actual amount of power used by a port</p>|`SNMP agent`|poepoweractual.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|PoE Power Maximum {{#SNMPINDEX}.regsub("([0-9]+)\.([0-9]+)", \1/\2)}|<p>AlcatelIND1InLinePowerEthernet::alaPethPsePortPowerMaximum -- This object controls maximum amount of power per port</p>|`SNMP agent`|poepowermax.[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|InOctets {#SNMPVALUE}|<p>-</p>|`SNMP agent`|inoctets.[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|
|OutOctets {#SNMPVALUE}|<p>-</p>|`SNMP agent`|outoctets.[{#SNMPVALUE}]<p>Update: 60s</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|CPU usage on slot [{#SNMPVALUE}] > 80%|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:cpu1minavg.slot.[{#SNMPVALUE}].last()}>80</p><p>**Recovery expression**: </p>|warning|
|Flash freespace on slot [{#SNMPVALUE}] < 32 MB|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:flashfreespace.slot.[{#SNMPVALUE}].last()}<33554432</p><p>**Recovery expression**: </p>|warning|
|Memory usage on slot [{#SNMPVALUE}] > 80%|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:memory1minavg.slot.[{#SNMPVALUE}].last()}>80</p><p>**Recovery expression**: </p>|warning|
|RXTX load on slot [{#SNMPVALUE}] > 80 %|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:rxtx1minavg.slot.[{#SNMPVALUE}].last()}>80</p><p>**Recovery expression**: </p>|warning|
|Temperature on slot {#SNMPINDEX} > 55 °C|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:temperature.slot.[{#SNMPINDEX}].last()}>55</p><p>**Recovery expression**: </p>|warning|
|CPU usage on slot [{#SNMPVALUE}] > 80% (LLD)|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:cpu1minavg.slot.[{#SNMPVALUE}].last()}>80</p><p>**Recovery expression**: </p>|warning|
|Flash freespace on slot [{#SNMPVALUE}] < 32 MB (LLD)|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:flashfreespace.slot.[{#SNMPVALUE}].last()}<33554432</p><p>**Recovery expression**: </p>|warning|
|Memory usage on slot [{#SNMPVALUE}] > 80% (LLD)|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:memory1minavg.slot.[{#SNMPVALUE}].last()}>80</p><p>**Recovery expression**: </p>|warning|
|RXTX load on slot [{#SNMPVALUE}] > 80 % (LLD)|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:rxtx1minavg.slot.[{#SNMPVALUE}].last()}>80</p><p>**Recovery expression**: </p>|warning|
|Temperature on slot {#SNMPINDEX} > 55 °C (LLD)|<p>-</p>|<p>**Expression**: {Alcatel-Lucent Enterprise OmniSwitch AOS 6.x:temperature.slot.[{#SNMPINDEX}].last()}>55</p><p>**Recovery expression**: </p>|warning|
