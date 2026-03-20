# Fortigate Managed FortiAP Zabbix Template

## Description
This Zabbix template provides advanced monitoring for Fortinet Access Points (FortiAPs) managed by a FortiGate Wireless Controller. It uses **Host Prototypes** to automatically create a dedicated Zabbix Host for every discovered Access Point.

**Credits:** This template is based on the original work by [Alexander Bakaldin](https://github.com/abakaldin) and has been modified to support individual host discovery and Zabbix 7.x features.

## Compatibility
- **Zabbix Version:** 7.0.23 (compatible with 6.0+)
- **FortiGate Version:** v7.2.11
- **FortiAP Version:** v7.4.x, v7.2.x

## Key Features
- **Host Prototypes:** Automatically populates your Zabbix inventory with managed APs.
- **Dynamic Naming:** Uses the AP's configured name as the Hostname.
- **Software Inventory:** Collects Software Version and Profile Name.
- **Performance Monitoring:** CPU Usage (%), Memory Usage (%), and connected Station count.
- **Trigger Logic:** Offline alerts trigger only after 3 consecutive failed samples (#3) to reduce false positives.

## Setup Instructions
1. Assign the template `SNMP Fortigate Wifi Access Points` to your **FortiGate** host.
2. The discovery rule will create individual hosts in the `Managed FortiAPs` host group.
3. Ensure the `SNMP FortiAP Instance` template is imported along with the parent.
