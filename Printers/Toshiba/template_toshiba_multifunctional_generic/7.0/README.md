# Printer Toshiba multifunctional generic

## Description

**SNMP Template for Toshiba printers**
**Author:** Myrenic

## Macros used

There are no macros used in this template.

## Template links

There are no template links in this template.

## Discovery rules

| Name                        | Description                              | Key                       | Type       | Interval |
| --------------------------- | ---------------------------------------- | ------------------------- | ---------- | -------- |
| Consumables Level Discovery | Discovery of toner levels for all colors | ConsumablesLevelDiscovery | SNMP agent | 1h       |

### Item Prototypes

| Name                             | Key                                | SNMP OID                                | Type       | Value Type | Units |
| -------------------------------- | ---------------------------------- | --------------------------------------- | ---------- | ---------- | ----- |
| Consumables Level - {#SNMPVALUE} | prtConsumablesLevel\[{#SNMPINDEX}] | .1.3.6.1.2.1.43.11.1.1.9.1.{#SNMPINDEX} | SNMP agent | Float      | %     |

### Trigger Prototypes

| Name                               | Expression                                          | Severity |
| ---------------------------------- | --------------------------------------------------- | -------- |
| {#SNMPVALUE}: consumable is empty  | last(/Printer Toshiba multifunctional generic/prtConsumablesLevel[{#SNMPINDEX}])=0   | High  |
| {#SNMPVALUE}: consumable is nearly empty | last(/Printer Toshiba multifunctional generic/prtConsumablesLevel[{#SNMPINDEX}])<3 and last(/Printer Toshiba multifunctional generic/prtConsumablesLevel[{#SNMPINDEX}])>-3         | Information     |

## Items collected

| Name                    | Description                                              | Type       | Key                         | Interval |
| ----------------------- | -------------------------------------------------------- | ---------- | --------------------------- | -------- |
| Device Manufacturer     | Textual identification of the device manufacturer        | SNMP agent | deviceManufacturer          | 1d       |
| Device Model            |                                                          | SNMP agent | deviceModel                 | 1d       |
| Printer Status          |                                                          | SNMP agent | prtConsoleDisplayBufferText | default  |
| Printer Display Message |                                                          | SNMP agent | prtDisplayMessageText       | default  |
| Page Counter            |                                                          | SNMP agent | prtMarkerLifeCount          | 30m      |
| Device Contact          | Contact person for this managed node                     | SNMP agent | sysContact                  | 1d       |
| Device Location         | Physical location of this node                           | SNMP agent | sysLocation                 | 1d       |
| Device Name             | Administratively-assigned name for this node             | SNMP agent | sysName                     | 1d       |
| Device Uptime           | Time since the system's network management was restarted | SNMP agent | sysUpTime                   | default  |

## Triggers

| Name                               | Expression                                          | Severity |
| ---------------------------------- | --------------------------------------------------- | -------- |
| Black toner empty                  | last(/Printer Toshiba multifunctional generic/prtBlackTonerLevel)=0   | Average  |
| Printer restarted                  | change(/Printer Toshiba multifunctional generic/sysUpTime)<10         | Info     |
