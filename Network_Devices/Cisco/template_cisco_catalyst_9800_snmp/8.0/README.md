# Cisco Catalyst 9800 RESTCONF for Zabbix 8.0

The template uses RESTCONF for 6 GHz / Wi-Fi 6E and Wi-Fi 7 monitoring and SNMP traps for immediate notifications.

> [!NOTE]
> This template specializes in Wireless LAN monitoring. It is designed to be used in conjunction with the standard "Cisco IOS by SNMP" template for generic system statistics, such as CPU/Memory utilization, interface traffic, and hardware inventory.

## Requirements

- Cisco Catalyst 9800 Series Wireless LAN Controller
  - RESTCONF must be enabled (IOS XE 16.10 or later recommended)
  - HTTPS Server must be enabled
  - SNMP Traps (optional)
- Zabbix 8.0

## Configuration (Cisco Catalyst 9800 WLC)

Enable RESTCONF and the HTTPS server on the Cisco Catalyst 9800 WLC, and create a user with appropriate privileges.

```cisco
configure terminal
 ip http secure-server
 restconf
 username [USER] privilege 15 secret [PASSWORD]
end
```

Example configuration for using SNMP Traps (SNMPv3 Recommended):
```cisco
! Enable Traps
snmp-server enable traps wireless bsnAutoRF
snmp-server enable traps rf

! Create SNMPv3 Group and User (AuthPriv mode)
snmp-server group [SNMPv3 Group] v3 priv
snmp-server user [SNMPv3 Username] [SNMPv3 Group] v3 auth sha [AUTH_PASS] priv aes 128 [PRIV_PASS]

! Configure Trap Destination
snmp-server host [ZABBIX IP ADDRESS] version 3 priv [SNMPv3 Username]

! Check your EngineID
#show snmp engineID
Local SNMP engineID: [SNMP engineID]
Remote Engine ID          IP-addr    Port

```

> [!NOTE]
> Refer to the Zabbix Documentation to configure `snmptrapd` for SNMPv3 Traps so that Zabbix accepts them from your devices.
> The configuration below is an example; ensure the EngineID and credentials match your actual device settings.
```shell
# snmptrapd.conf
createUser -e [SNMP engineID] [SNMPv3 Username] SHA [AUTH_PASS] AES [PRIV_PASS]
authuser log,execute [SNMPv3 Username]

```
https://www.zabbix.com/documentation/current/en/manual/config/items/itemtypes/snmptrap


## Usage

1. Import the template into Zabbix.
2. Set the macros on the host. Change the username and password according to your environment.

| Macro | Description | Default Value |
| --- | --- | --- |
| `{$RESTCONF.URL}` | Base URL for RESTCONF. Usually does not need to be changed. | `https://{HOST.CONN}/restconf/data` |
| `{$RESTCONF.USER}` | Username for RESTCONF connection | `admin` |
| `{$RESTCONF.PASS}` | Password for RESTCONF connection | `adminpassword` |
| `{$C9800.AP.CORRELATION.GROUP}` | Shared identifier for WLCs that can serve the same APs | Empty |

## AP rejoin across controllers

The AP trap item accepts `bsnAPDisassociated` and `ciscoLwappApAssociated` notifications. A Join on the same controller can recover a Disjoin for the same AP through trigger-level correlation. To recover a Disjoin when an AP joins a different controller, link this template to each participating WLC and verify that its association and disassociation traps reach the matching Zabbix host. See the [Zabbix SNMP trap setup](https://www.zabbix.com/documentation/8.0/en/manual/config/items/itemtypes/snmptrap).

A Zabbix Super admin must create the following rules in **Data collection → Event correlation**. Set **Type of calculation** to **And**. Zabbix stores these rules at server level, so configure them after importing the template and before setting the host macro.

| Rule | Conditions | Operation |
| --- | --- | --- |
| Cisco Catalyst 9800 AP rejoin | Old event tag value `c9800-ap-event` equals `disjoin`.<br>New event tag value `c9800-ap-event` equals `join`.<br>Event tag pair with old and new tag `AP`.<br>Event tag pair with old and new tag `c9800-ap-group`. | Close old events |
| Cisco Catalyst 9800 AP Join signal | New event tag value `c9800-ap-event` equals `join`. | Close new event |

Set `{$C9800.AP.CORRELATION.GROUP}` on each participating WLC host to the same nonempty identifier, such as `campus-a`. Use different identifiers for independent controller groups that may reuse AP names. An empty value keeps the Join trigger inactive. Exclude events tagged `c9800-ap-event=join` from any general problem notification actions if those actions can match the correlation signal.

Verify that a Join on one WLC closes an earlier matching Disjoin on another WLC. A Disjoin with a different AP name or group stays open. A Join with no matching Disjoin closes on its own. Events created before configuration may lack the correlation tags. Confirm where the AP is registered before closing those events manually. To disable cross-controller recovery, clear the group macro on each participating WLC before disabling the two rules.

See the [Zabbix global event correlation documentation](https://www.zabbix.com/documentation/8.0/en/manual/events/event_correlation/global) for the condition and operation settings.

### Validation

The template was imported into a clean Zabbix 8.0.0 instance. SNMPv2c traps from separate simulated WLCs verified that a Join recovered the matching Disjoin. An open Disjoin for a different AP and an open Disjoin for the same AP name in another group stayed open. The test also verified that a Join without an AP name did not generate a Join event, standalone and consecutive Join signals closed, and same-controller recovery worked with the group macro left empty.

## Discovery Rules

| Name | Description | Type | Update Interval |
| --- | --- | --- | --- |
| Mobility Node Discovery | Discovers mobility group members and monitors tunnel status. | Dependent | 0 (Follows Master item) |
| Radio Slot Discovery | Discovers AP radio slots and dynamically maps AP name and frequency band (2.4/5/6GHz).<br>Creates items using AP Name instead of MAC address. | Script | 1h |
| WLAN SSID Discovery | Discovers SSIDs (WLAN profiles) and monitors client counts. | Dependent | 0 (Follows Master item) |

## Items

### HTTP Agent / RESTCONF
Main metrics retrieved via RESTCONF.

| Name | Description | Type |
| --- | --- | --- |
| HA Local State | HA Local Status (Active/Standby etc.) | Dependent |
| HA Peer State | HA Peer Status | Dependent |
| HA Last Switchover Reason | Reason for the last switchover | Dependent |
| Mobility Node {#NODE.IP}: Link Status | Mobility tunnel status (up/down) | Dependent |
| Total Joined AP Count | Total count of joined APs | HTTP Agent |
| Rogue AP: Total Count | Total count of detected Rogue APs | HTTP Agent |
| Rogue AP: Total Client Count | Total count of clients connected to Rogue APs | HTTP Agent |
| AP {#AP.NAME} ({#FREQ.NAME}): Operating Channel | Operating Channel per AP/Frequency | Dependent |
| AP {#AP.NAME} ({#FREQ.NAME}): Channel Utilization | Channel utilization per AP/Frequency (CCA) | Dependent |
| AP {#AP.NAME} ({#FREQ.NAME}): Client Count | Client count per AP/Frequency | Dependent |
| AP {#AP.NAME} ({#FREQ.NAME}): Noise Level | Noise level per AP/Frequency | Dependent |
| SSID {#WLAN.NAME}: Client Count | Client count per SSID | Dependent |

### SNMP Trap
Events requiring real-time notification are received via SNMP Trap.

| Name | Description | Type |
| --- | --- | --- |
| SNMP Trap - Channel Changed | AP Channel Changed Trap (bsnAPCurrentChannelChanged) | SNMP Trap |
| SNMP Trap - RadarChannelDetected | DFS Radar Detected Trap (bsnRadarChannelDetected) | SNMP Trap |
| SNMP Trap - AP disassociation | AP Disassociation/Reassociation Trap (bsnAPDisassociated / ciscoLwappApAssociated) | SNMP Trap |

### Useful Tips: Suppressing Syslog Messages

Frequent RESTCONF polling may generate excessive `%DMI-5-AUTH_PASSED` syslog messages, filling up the logs.

Example log:
```
Jan 10 15:22:03.380: %DMI-5-AUTH_PASSED: Chassis 1 R0/0: dmiauthd: User 'admin' authenticated successfully from 192.168.1.1:0  for rest over http. External groups: PRIV15
```

To suppress these specific messages, you can configure a syslog discriminator:

```cisco
logging discriminator RESTCONF msg-body drops rest
logging buffered discriminator RESTCONF
logging console discriminator RESTCONF
logging monitor discriminator RESTCONF
```

## Why RESTCONF?
With the release of IOS XE 17.18.2, Cisco is progressively deprecating legacy protocols to enforce a "Secure by Design" philosophy. While migrating from SNMPv2 to SNMPv3 is encouraged, the encryption overhead of SNMPv3 often severely impacts data retrieval performance, even in smaller environments, frequently exceeding the default Zabbix SNMP timeout of 3 seconds.

RESTCONF reports the frequency bands of each AP, so Zabbix can retrieve 6 GHz metrics for the APs that support them.
