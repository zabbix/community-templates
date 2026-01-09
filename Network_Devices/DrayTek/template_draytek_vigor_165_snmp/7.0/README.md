# Template for DrayTek Vigor 165 VLDS2+ modem/router - SNMP

Template for reading DrayTek Vigor 165 data using SNMP.

May work with other models (i.e. Vigor 130. Vigor 167) but has not been tested.

Copyright © KMorwath.

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

## Usage

The VDSL2-LINE-MIB mib file needs to be installed, follow your operating system
instruction to add it if missing.

SNMP must be enabled in the device settings. Goto Sytem Maintenance > Management
and enable the SNMP Agent. SNMPv3 is not supported, use SNMP v2c. Set parameters
as needed.

Some data are returned only in "router mode" - i.e. WAN RX/TX. In "modem/bridge"
mode they are not available, via SNMP.

