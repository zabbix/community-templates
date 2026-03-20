# SNMP HP MSA 2040 SAN

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Connectivity unit info|<p>A display string containing a name for this connectivity unit. This object value should be persistent between boots.</p>|`SNMP agent`|connUnitName<p>Update: 24h</p>|
|Connectivity unit sensor info|<p>A textual identification of the sensor intended primarily for operator use.</p>|`SNMP agent`|connUnitSensorName<p>Update: 24h</p>|
|Connectivity unit port info|<p>A user-defined name for this port. This means that up to DisplayString characters may be supported. If less than, then the name will be truncated in the connunit.</p>|`SNMP agent`|connUnitPortName<p>Update: 24h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Connectivity unit {#CONNUNITNAME} global ID|<p>An optional global-scope identifier for this connectivity unit. It MUST be a WWN for this connectivity unit or 16 octets of value zero. WWN formats requiring fewer than 16 octets MUST be extended to 16 octets with trailing zero octets, Left justified, zero filled, If a WWN is used for connUnitId, the same WWN MUST be used for connUnitGlobalId. When a non-zero value is provided, it SHOULD be persistent across agent and unit resets. It SHOULD be globally unique. It SHOULD be one of these FC-PH/PH3 formats: IEEE (NAA=1) IEEE Extended (NAA=2) IEEE Registered (NAA=5). IEEE Registered extended (NAA=6). Use of the IEEE formats allows any IEEE-registered vendor to assure global uniqueness independently. The following are some references on IEEE WWN formats: http://standards.ieee.org/regauth/oui/tutorials/fibreformat.html http://standards.ieee.org/regauth/oui/tutorials/fibrecomp_id.html If one or more WWNs are associated with the connUnit via other management methods, one of them SHOULD be used for connUnitGlobalId. If there is not a WWN assigned specifically to the connUnit, there is some merit, though not a requirement, to using a WWN assigned to (one of) its permanently attached FC/LAN interface(s). This can not risk uniqueness, though. As a counterexample, if your agent runs in a host and the host has an HBA, it is quite possible that agent, host, and HBA will all be distinct connUnits, so the host and agent can not use the WWN of the HBA. Another example: If your hub has a built-in Ethernet port, it might be reasonable for the hub to use its MAC address (prefixed with the appropriate NAA) as its connUnitId. But if the Ethernet were a replaceable PCCard, the hub should have an independent ID.</p>|`SNMP agent`|connUnitGlobalID[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Connectivity unit {#CONNUNITNAME} ID|<p>The unique identification for this connectivity unit among those within this proxy domain. The value MUST be unique within the proxy domain because it is the index variable for connUnitTable. The value assigned to a given conectivity unit SHOULD be persistent across agent and unit resets. It SHOULD be the same as connUnitGlobalId if connUnitGlobalId is known and stable.</p>|`SNMP agent`|connUnitID[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Connectivity unit {#CONNUNITNAME} state|<p>This object reports the overall state of the connectivity unit. The meaning of all values is essentially self-explanatory. Any of these values may occur with any of the ConnUnitStatus values.</p>|`SNMP agent`|connUnitState[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Connectivity unit {#CONNUNITNAME} status|<p>Overall status of the connectivity unit. The goal of this object is to be the single poll point to check the status of the connunit. If there is any other component that has warning, then this should be set to warning, etc. Any of these values may occur with any of the ConnUnitState values.</p>|`SNMP agent`|connUnitStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Connectivity unit {#CONNUNITNAME} type|<p>The type of this connectivity unit.</p>|`SNMP agent`|connUnitType[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|Connectivity unit sensor {#CONNUNITSENSORNAME} status|<p>The status indicated by the sensor.</p>|`SNMP agent`|connUnitSensorStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Connectivity unit port {#CONNUNITPORTNAME} state|<p>The user selected state of the port hardware.</p>|`SNMP agent`|connUnitPortState[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Connectivity unit port {#CONNUNITPORTNAME} status|<p>An overall protocol status for the port. This value of connUnitPortState is not online, then this is reported Unknown.</p>|`SNMP agent`|connUnitPortStatus[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Connectivity unit {#CONNUNITNAME} have failed status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitStatus[{#SNMPINDEX}])=5</p><p>**Recovery expression**: </p>|high|
|Connectivity unit {#CONNUNITNAME} have unknown state|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitState[{#SNMPINDEX}])=3</p><p>**Recovery expression**: </p>|high|
|Connectivity unit {#CONNUNITNAME} have unknown status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|high|
|Connectivity unit {#CONNUNITNAME} have unused status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|high|
|Connectivity unit {#CONNUNITNAME} have warning status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitStatus[{#SNMPINDEX}])=4</p><p>**Recovery expression**: </p>|high|
|Connectivity unit port {#CONNUNITPORTNAME} have failure status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitPortStatus[{#SNMPINDEX}])=5</p><p>**Recovery expression**: </p>|high|
|Connectivity unit port {#CONNUNITPORTNAME} have unknown status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitPortStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|high|
|Connectivity unit port {#CONNUNITPORTNAME} have warning status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitPortStatus[{#SNMPINDEX}])=4</p><p>**Recovery expression**: </p>|high|
|Connectivity unit port {#CONNUNITPORTNAME} not in online state|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitPortState[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
|Connectivity unit sensor {#CONNUNITSENSORNAME} have failed status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitSensorStatus[{#SNMPINDEX}])=5</p><p>**Recovery expression**: </p>|high|
|Connectivity unit sensor {#CONNUNITSENSORNAME} have other status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitSensorStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|high|
|Connectivity unit sensor {#CONNUNITSENSORNAME} have unknown status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitSensorStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|high|
|Connectivity unit sensor {#CONNUNITSENSORNAME} have warning status|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitSensorStatus[{#SNMPINDEX}])=4</p><p>**Recovery expression**: </p>|high|
|Connectivity unit {#CONNUNITNAME} have failed status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitStatus[{#SNMPINDEX}])=5</p><p>**Recovery expression**: </p>|high|
|Connectivity unit {#CONNUNITNAME} have unknown state (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitState[{#SNMPINDEX}])=3</p><p>**Recovery expression**: </p>|high|
|Connectivity unit {#CONNUNITNAME} have unknown status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|high|
|Connectivity unit {#CONNUNITNAME} have unused status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|high|
|Connectivity unit {#CONNUNITNAME} have warning status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitStatus[{#SNMPINDEX}])=4</p><p>**Recovery expression**: </p>|high|
|Connectivity unit sensor {#CONNUNITSENSORNAME} have failed status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitSensorStatus[{#SNMPINDEX}])=5</p><p>**Recovery expression**: </p>|high|
|Connectivity unit sensor {#CONNUNITSENSORNAME} have other status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitSensorStatus[{#SNMPINDEX}])=2</p><p>**Recovery expression**: </p>|high|
|Connectivity unit sensor {#CONNUNITSENSORNAME} have unknown status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitSensorStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|high|
|Connectivity unit sensor {#CONNUNITSENSORNAME} have warning status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitSensorStatus[{#SNMPINDEX}])=4</p><p>**Recovery expression**: </p>|high|
|Connectivity unit port {#CONNUNITPORTNAME} have failure status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitPortStatus[{#SNMPINDEX}])=5</p><p>**Recovery expression**: </p>|high|
|Connectivity unit port {#CONNUNITPORTNAME} have unknown status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitPortStatus[{#SNMPINDEX}])=1</p><p>**Recovery expression**: </p>|high|
|Connectivity unit port {#CONNUNITPORTNAME} have warning status (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitPortStatus[{#SNMPINDEX}])=4</p><p>**Recovery expression**: </p>|high|
|Connectivity unit port {#CONNUNITPORTNAME} not in online state (LLD)|<p>-</p>|<p>**Expression**: last(/SNMP HP MSA 2040 SAN/connUnitPortState[{#SNMPINDEX}])<>2</p><p>**Recovery expression**: </p>|high|
