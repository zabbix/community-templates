# Grandstream UCM 63xx SNMP

## Description

Grandstream UCM 63xx template - SNMP

## Overview

SNMP Zabbix template for Grandstream UCM 63xx PBX series.

**Note**: this template has been developed and tested on a UCM6301 with firmare 1.0.29.21.

Tests on different models and firmwares are welcome.

## Author

Copyright © 2026 KMorwath

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Requirements

The GS-SNMP-MIB or GS-UCM63XX-SNMP-MIB mib file needs to be installed. See https://www.grandstream.com/support/tools.

## Macros used

There are no macros used in this template.

## Template links

There are no template links in this template.

Use "Linux by SNMP template" to monitor the OS.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery calls|Retrieve call data by type|SNMP agent|gs.calls.discovery|
|Discovery extensions|Retrieve extensions|SNMP agent|gs.ext.discovery|
|Discovery LAN/WAN settings|Retrieve LAN/WAN settings|SNMP agent|gs.intf.discovery|
|Discovery processes|Retrieve main processes and status|SNMP agent|gs.processes.discovery|
|Discovery SIP Trunks|Retrieve SIP trunks|SNMP agent|gs.sip.trunk.discovery|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|TBD|||


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Trunk {#TRUNKNAME} not registered|||high|
|Process {#PROCESSNAME} crashed|||high|
