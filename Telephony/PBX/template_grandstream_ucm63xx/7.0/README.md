# Grandstream UCM 63xx SNMP

## Description

Grandstream UCM 63xx template - SNMP

## Overview

SNMP Zabbix template for Grandstream UCM 63xx PBX series.

**Note**: this template has been developed and tested on a UCM6301 with firmare 1.0.29.21.

Tests on different models and firmwares are welcome.

## Author

Copyright © 2026 KMorwath.

This software is dual-licensed under the terms of the AGPLv3 license and the MIT License.
You may choose to use, modify, and distribute this software under the terms of either license.
        
AGPLv3 License

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

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
and associated documentation files (the “Software”), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject 
to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


# Requirements

The GS-UCM63XX-SNMP-MIB mib file needs to be installed. See https://www.grandstream.com/support/tools.

Follow your operating system instructions to add additional mib files.

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
