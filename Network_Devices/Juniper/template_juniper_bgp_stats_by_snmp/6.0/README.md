# Juniper BGP Stats by SNMP

## Overview

This template uses SNMP-LLD to generate monitoring items that collect BGP neighbor-related information, including neighbor state, the number of route entries received, and other data.

Template is made in version 6.4, which theoretically supports zabbix 5.4 or higher, try to modify the version field if you have problems with importing.

### Author
change4826

### Features

1. Supports IPv4/IPv6 BGP neighbors.
2. Uses preprocessing to handle IPv4/IPv6 address hex to text parsing, abbreviation.

### Items

1. Peer State: Represents the adjacency state of BGP neighbors.
2. PrefixesAccepted count: Represents the number of route entries received from specific neighbors and accepted after policy filtering.
3. PrefixesReceived count: Represents the total number of route entries received from specific neighbors.

### Triggers

1. Peer State: A base trigger on neighbor adjacency status, set as unclassified level and can be freely adjusted as needed.
2. PrefixesAccepted: Triggered when the latest value is not 0 and greater than 100, and the change interval of the latest value is greater than 40% (set in {$DIFF_RATIO}) compared to the change interval at the same time the previous day.

### Macros

1. {$DIFF_RATIO}: Used in triggers to define the change ratio of PrefixesAccepted, for example, 0.4 represents 40%.
2. {$ACCEPT_MIN}: Used in triggers to define the minimum value of PrefixesAccepted count received.

### LLD filters

- {$IGNORE_ASN}: Defines the range or individual Autonomous System Numbers to be ignored.
- {#PEEREMOTEADDR}: Optional, this LLD macro can be used to filter individual peers if needed.
- {#PEERSTATE}: Only considers adjacency with an established=6 state.

### Other Suggestions

- It is recommended to set trigger dependency chains: PrefixesAccepted->Peer State->other Juniper Device template triggers such as **High ICMP ping loss/High ICMP ping response time/Unavailable by ICMP ping/No SNMP data collection**.
- Be sure to test and make good use of LLD filters before deploying in a production environment.
- If you encounter a Zabbix error snmp_parse_oid() during testing, you may need to add mibs -BGP4-V2-MIB-JUNIPER in /etc/snmp/snmp.conf to cancel the parsing of mib-jnx-bgpmib2.txt, or move mib-jnx-bgpmib2.txt out of the corresponding snmp-mib-path directory.
- Tested on MX series such as MX960, MX480, MX240, etc. Other QFX51 series are also applicable, and Junos versions 12-20 are compatible.
