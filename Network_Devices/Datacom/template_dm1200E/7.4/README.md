# DATACOM DM1200E - SNMP Monitoring

## Overview

SNMP monitoring template for **DATACOM DM1200E** network device.

Includes:

- SNMP Discovery for network interfaces  
- SNMP monitoring of system and protocol statistics  
- IPv6 support  
- Performance and traffic metrics  

## Author

Vinicius A. Almeida  
GitHub: [https://github.com/vinicius-a-almeida](https://github.com/vinicius-a-almeida)

## Macros used

There are no macros linked in this template.

## Template links

There are no template links in this template.

## Discovery rules

| Name | Description | Type | Key and additional info |
|------|-------------|------|--------------------------|
| Network Interface Discovery | <p>Discovers all network interfaces using IF-MIB::ifTable.</p> | `SNMP agent` | ifDescr<p>Update: 3600</p> |
| System OR Table Discovery | <p>Discovers system object resources via sysORTable.</p> | `SNMP agent` | sysORID<p>Update: 3600</p> |

## Items collected

| Name | Description | Type | Key and additional info |
|------|-------------|------|--------------------------|
| System Uptime | <p>Uptime of the system since last restart.</p> | `SNMP agent` | sysUpTimeInstance<p>Update: 300</p> |
| System Description | <p>Textual description of the device.</p> | `SNMP agent` | sysDescr<p>Update: 3600</p> |
| System Contact | <p>Administrative contact for the device.</p> | `SNMP agent` | sysContact<p>Update: 3600</p> |
| System Location | <p>Physical location of the device.</p> | `SNMP agent` | sysLocation<p>Update: 3600</p> |
| System Name | <p>Name assigned to the device.</p> | `SNMP agent` | sysName<p>Update: 3600</p> |
| System Object ID | <p>Vendor-specific identification.</p> | `SNMP agent` | sysObjectID<p>Update: 3600</p> |
| Interface Count | <p>Number of interfaces present on the device.</p> | `SNMP agent` | ifNumber<p>Update: 3600</p> |
| IP Forwarding | <p>Indicates whether IP forwarding is enabled.</p> | `SNMP agent` | ipForwarding<p>Update: 3600</p> |
| Default TTL | <p>Default Time To Live for IP packets.</p> | `SNMP agent` | ipDefaultTTL<p>Update: 3600</p> |
| IP In/Out Statistics | <p>Traffic statistics (packets, errors, discards).</p> | `SNMP agent` | ipInReceives / ipOutRequests<p>Update: 300</p> |
| ICMP Echo Requests | <p>Number of ICMP echo requests received.</p> | `SNMP agent` | icmpInEchos<p>Update: 300</p> |
| TCP Active Opens | <p>Number of active TCP opens.</p> | `SNMP agent` | tcpActiveOpens<p>Update: 300</p> |
| UDP In Datagrams | <p>Number of incoming UDP datagrams.</p> | `SNMP agent` | udpInDatagrams<p>Update: 300</p> |
| SNMP In/Out Packets | <p>SNMP message statistics.</p> | `SNMP agent` | snmpInPkts / snmpOutPkts<p>Update: 300</p> |
| IPv6 Forwarding | <p>Indicates if IPv6 forwarding is enabled.</p> | `SNMP agent` | ipv6IpForwarding<p>Update: 3600</p> |
| IPv6 Interface Count | <p>Number of IPv6 interfaces.</p> | `SNMP agent` | ipv6IfNumber<p>Update: 3600</p> |


