README.md

This is a simple Zabbix template to apply to Dell ML3 tape libraries.
There are no macros, and only a few value mappings.

This template auto discovers tape drives, and pulls key data for each drive:
 - Drive generation (LTO9, etc)
 - Drive FW revision
 - Drive Port state
   
Several other static items are created:
  - AutoClean Enabled
  - Power Supply Status
  - Power Supply Redundancy State
  - Chassis Serial Number
  - NTP State (Enabled/Disabled)
  - NTP Server Defined
  - Number of Tape slots
  - Number of I/O Slots (mailslots)

Zabbix Version: 7.4

Instructions:

-Create your host (ML3 library)

-Setup SNMPv2 or SNMPv3 on the ML3 library

-Configure Zabbix host with proper SNMP community name, or SNMPv3 credentials to access your ML3 Tape Library

-Apply this template to the host

