# Samsung SL-C480W by SNMPv2

## Overview

Template for color laser printer Samsung Xpress SL-C480W and other similiar models.


## Setup

No special setup needed.
Just add template in Zabbix GUI `Data collection -> Templates -> Import` and add your printer to it.<br/>
Optional modify `{$CARTRIDGE_INFO}`, `{$CARTRIDGE_WARN}`, `{$CARTRIDGE_CRIT}` macros (description below).


## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$SNMP_COMMUNITY}|<p>-</p>|`public`|Text macro|
|{$CARTRIDGE_INFO}|<p>Create a notification if a cartridges fill level / units wear level falls below that value</p>|`20`|Text macro|
|{$CARTRIDGE_WARN}|<p>Create a warning if a cartridges fill level / units wear level falls below that value</p>|`10`|Text macro|
|{$CARTRIDGE_CRIT}|<p>Create a critical warning if a cartridges fill level / units wear level falls below that value</p>|`5`|Text macro|

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key|Interval|
|----|-----------|----|---|--------|
|Samsung C480W: Black Toner Cartridge|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.1|1d|
|Samsung C480W: Black Toner Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.1|10m|
|Samsung C480W: Black Toner Level|---|`CALCULATED`|BPersent|10m|
|Samsung C480W: Black Toner Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.1|10m|
|Samsung C480W: Cyan Toner Cartridge|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.2|1d|
|Samsung C480W: Cyan Toner Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.2|10m|
|Samsung C480W: Cyan Toner Level|---|`CALCULATED`|CPersent|10m|
|Samsung C480W: Cyan Toner Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.2|10m|
|Samsung C480W: Device running state: Printer status|Recognized warnings ...|`SNMP_AGENT`|mib-2.1.25.3.2.1.5.1|5m|
|Samsung C480W: Device running status: Error message|---|`SNMP_AGENT`|mib-2.1.43.18.1.1.8.1.1|5m|
|Samsung C480W: Friction Separation Pad (Tray 1)|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.9|1d|
|Samsung C480W: Friction Separation Pad (Tray 1) Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.9|10m|
|Samsung C480W: Friction Separation Pad (Tray 1) Level|Value shows in percent ...|`CALCULATED`|FSP1Persent|10m|
|Samsung C480W: Friction Separation Pad (Tray 1) Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.9|10m|
|Samsung C480W: Fuser Unit|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.7|1d|
|Samsung C480W: Fuser Unit Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.7|10m|
|Samsung C480W: Fuser Unit Level|Value shows in percent ...|`CALCULATED`|FUPersent|10m|
|Samsung C480W: Fuser Unit Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.7|10m|
|Samsung C480W: Imaging Unit|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.5|1d|
|Samsung C480W: Imaging Unit Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.5|10m|
|Samsung C480W: Imaging Unit Level|Value shows in percent ...|`CALCULATED`|IUPersent|10m|
|Samsung C480W: Imaging Unit Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.5|10m|
|Samsung C480W: Magenta Toner Cartridge|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.3|1d|
|Samsung C480W: Magenta Toner Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.3|10m|
|Samsung C480W: Magenta Toner Level|---|`CALCULATED`|MPersent|10m|
|Samsung C480W: Magenta Toner Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.3|10m|
|Samsung C480W: Rubber Pick Up (Tray 1) Roller|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.8|1d|
|Samsung C480W: Rubber Pick Up (Tray 1) Roller Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.8|10m|
|Samsung C480W: Rubber Pick Up (Tray 1) Roller Level|Value shows in percent ...|`CALCULATED`|RPU1Persent|10m|
|Samsung C480W: Rubber Pick Up (Tray 1) Roller Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.8|10m|
|Samsung C480W: System Name|---|`SNMP_AGENT`|mib-2.43.5.1.1.16.1|1d|
|Samsung C480W: System Serial Number|Device serial number fr ...|`SNMP_AGENT`|mib-2.43.5.1.1.17.1|1d|
|Samsung C480W: Total Pages Print Count|---|`SNMP_AGENT`|mib-2.43.10.2.1.4.1.1|1h|
|Samsung C480W: Transfer Belt|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.6|1d|
|Samsung C480W: Transfer Belt Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.6|10m|
|Samsung C480W: Transfer Belt Level|Value shows in percent ...|`CALCULATED`|BTPersent|10m|
|Samsung C480W: Transfer Belt Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.6|10m|
|Samsung C480W: Waste Toner Container|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.10|1d|
|Samsung C480W: Waste Toner Container Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.10|10m|
|Samsung C480W: Waste Toner Container Level|Value shows in percent ...|`CALCULATED`|WTCPersent|10m|
|Samsung C480W: Waste Toner Container Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.10|10m|
|Samsung C480W: Yellow Toner Cartridge|---|`SNMP_AGENT`|mib-2.43.11.1.1.6.1.4|1d|
|Samsung C480W: Yellow Toner Count|---|`SNMP_AGENT`|mib-2.43.11.1.1.9.1.4|10m|
|Samsung C480W: Yellow Toner Level|---|`CALCULATED`|YPersent|10m|
|Samsung C480W: Yellow Toner Resource|---|`SNMP_AGENT`|mib-2.43.11.1.1.8.1.4|10m|


## Triggers

|Item|Trigger(s)|
|----|-----------|
|Samsung C480W: Black Toner Cartridge||
|Samsung C480W: Black Toner Count||
|Samsung C480W: Black Toner Level|*Samsung C480W: Black toner approaching a low level soon*<br/>*Samsung C480W: Black toner level almost empty*<br/>*Samsung C480W: Black toner level low*|
|Samsung C480W: Black Toner Resource||
|Samsung C480W: Cyan Toner Cartridge||
|Samsung C480W: Cyan Toner Count||
|Samsung C480W: Cyan Toner Level|*Samsung C480W: Cyan toner approaching a low level soon*<br/>*Samsung C480W: Cyan toner level almost empty*<br/>*Samsung C480W: Cyan toner level low*|
|Samsung C480W: Cyan Toner Resource||
|Samsung C480W: Device running state: Printer status|*Samsung C480W: Device printer status is not OK*|
|Samsung C480W: Device running status: Error message|*Samsung C480W: Device printer status: {ITEM.LASTVALUE}*|
|Samsung C480W: Friction Separation Pad (Tray 1)||
|Samsung C480W: Friction Separation Pad (Tray 1) Count||
|Samsung C480W: Friction Separation Pad (Tray 1) Level|*Samsung C480W: Friction Separation Pad (Tray 1) is almost used*<br/>*Samsung C480W: Friction Separation Pad (Tray 1) will be worn out in the future*<br/>*Samsung C480W: Friction Separation Pad (Tray 1) will soon be used up*|
|Samsung C480W: Friction Separation Pad (Tray 1) Resource||
|Samsung C480W: Fuser Unit||
|Samsung C480W: Fuser Unit Count||
|Samsung C480W: Fuser Unit Level|*Samsung C480W: Fuser unit is almost used*<br/>*Samsung C480W: Fuser unit will be worn out in the future*<br/>*Samsung C480W: Fuser unit will soon be used up*|
|Samsung C480W: Fuser Unit Resource||
|Samsung C480W: Imaging Unit||
|Samsung C480W: Imaging Unit Count||
|Samsung C480W: Imaging Unit Level|*Samsung C480W: Imaging unit is almost used*<br/>*Samsung C480W: Imaging unit will be worn out in the future*<br/>*Samsung C480W: Imaging unit will soon be used up*|
|Samsung C480W: Imaging Unit Resource||
|Samsung C480W: Magenta Toner Cartridge||
|Samsung C480W: Magenta Toner Count||
|Samsung C480W: Magenta Toner Level|*Samsung C480W: Magenta toner approaching a low level soon*<br/>*Samsung C480W: Magenta toner level almost empty*<br/>*Samsung C480W: Magenta toner level low*|
|Samsung C480W: Magenta Toner Resource||
|Samsung C480W: Rubber Pick Up (Tray 1) Roller||
|Samsung C480W: Rubber Pick Up (Tray 1) Roller Count||
|Samsung C480W: Rubber Pick Up (Tray 1) Roller Level|*Samsung C480W: Rubber Pick Up (Tray 1) is almost used*<br/>*Samsung C480W: Rubber Pick Up (Tray 1) will be worn out in the future*<br/>*Samsung C480W: Rubber Pick Up (Tray 1) will soon be used up*|
|Samsung C480W: Rubber Pick Up (Tray 1) Roller Resource||
|Samsung C480W: System Name||
|Samsung C480W: System Serial Number||
|Samsung C480W: Total Pages Print Count||
|Samsung C480W: Transfer Belt||
|Samsung C480W: Transfer Belt Count||
|Samsung C480W: Transfer Belt Level|*Samsung C480W: Transfer Belt is almost used*<br/>*Samsung C480W: Transfer Belt will be worn out in the future*<br/>*Samsung C480W: Transfer Belt will soon be used up*|
|Samsung C480W: Transfer Belt Resource||
|Samsung C480W: Waste Toner Container||
|Samsung C480W: Waste Toner Container Count||
|Samsung C480W: Waste Toner Container Level|*Samsung C480W: Waste toner container need replacement*<br/>*Samsung C480W: Waste toner container need replacement now*<br/>*Samsung C480W: Waste toner container need to be replaced in the future*|
|Samsung C480W: Waste Toner Container Resource||
|Samsung C480W: Yellow Toner Cartridge||
|Samsung C480W: Yellow Toner Count||
|Samsung C480W: Yellow Toner Level|*Samsung C480W: Yellow toner approaching a low level soon*<br/>*Samsung C480W: Yellow toner level almost empty*<br/>*Samsung C480W: Yellow toner level low*|
|Samsung C480W: Yellow Toner Resource||


## Graphs

|Graph|Type|
|----|-----------|
|Samsung C480W: Black toner level|Pie|
|Samsung C480W: Cyan toner level|Pie|
|Samsung C480W: Friction separation pad (Tray 1)|Pie|
|Samsung C480W: Imaging unit level|Pie|
|Samsung C480W: Magenta toner Level|Pie|
|Samsung C480W: Remaining fuser life|Pie|
|Samsung C480W: Rubber pick up (Tray 1) roller|Pie|
|Samsung C480W: Transfer belt level|Pie|
|Samsung C480W: Waste toner container level (remaining)|Pie|
|Samsung C480W: Yellow toner level|Pie|

## Dashboards

|Name|Widgets|
|----|-----------|
|Samsung C480W: Wearing parts state|10|

## Demo

Example of a fired trigger:
![Example: A fired trigger](http://www.kluge.rocks:12080/static/github/zabbix_c480w/template_triggered.jpg)

Dashboard: Samsung C480W: Wearing parts state:
![Dashboard overview shows usage level of cyan, magenta, yellow, black, imaging unit and more](http://www.kluge.rocks:12080/static/github/zabbix_c480w/graphs_example.jpg)


## Known issues

Currently there are no issues known.

## Author

Dr.Miles (GitHub DeepDreamer89)

## Feedback

If you encounter problems or have some improvements, you can write me a mail.
`dr[DOT]miles{@}kluge[DOT]rocks`
