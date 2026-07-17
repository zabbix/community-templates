# Kentix Devices by SNMP

## Overview

Zabbix template for monitoring **Kentix devices** over **SNMP** using the official `KENTIXDEVICES` SMIv2 MIB supplied in `files/kentixdevices.mib`.

The template is designed as a broad, model-independent implementation for devices that expose the Kentix enterprise branch:

```text
1.3.6.1.4.1.37954.5
```

It covers the pollable scalar objects and tables defined by the MIB, including:

- Environmental measurements:
  - temperature,
  - humidity,
  - dew point,
  - CO and CO₂,
  - air quality,
  - heat detection and thermal-imaging fire detection.
- Security and sensor states:
  - motion,
  - vibration,
  - reed contacts,
  - latch,
  - tilt,
  - connection state,
  - latency,
  - battery state.
- I/O monitoring:
  - 16 digital input tables,
  - 8 output tables,
  - 8 analog input tables,
  - 3 leakage tables.
- Electrical monitoring:
  - three phases,
  - voltage,
  - current,
  - frequency,
  - active, reactive and apparent power,
  - power consumption,
  - RCM AC/DC.
- Kentix groups and group alarm states.
- Rack-unit power data.
- System information, alarm summaries and measurement multipliers.
- Kentix SNMP traps and logbook tables, disabled by default.

The current template contains:

- **47 static items**:
  - 39 SNMP polling items,
  - 8 disabled SNMP trap items.
- **100 low-level discovery rules**.
- **466 item prototypes**.
- **16 static triggers**.
- **32 trigger prototypes**.
- **19 user macros**.
- **4 value maps**.

> **Scope:** This template is universal for devices implementing the `KENTIXDEVICES` MIB. It does not cover legacy Kentix models that use a different MIB tree, such as older `KMX-LAN` implementations.

> **Optional objects:** The MIB describes capabilities for several Kentix product families. A particular model may implement only part of them. Unsupported tables normally discover no rows, while unsupported static scalar objects may appear as `UNSUPPORTED` and can be disabled at host level.

---

## Requirements

- Zabbix version: **7.4 or newer**.
- Zabbix server or proxy with:
  - Net-SNMP tools and libraries,
  - the supplied `KENTIXDEVICES` MIB installed,
  - network access to UDP port 161 on the Kentix device.
- A Kentix device implementing:

  ```text
  sysObjectID.0 = 1.3.6.1.4.1.37954.5
  ```

- SNMPv2c or SNMPv3 configured on the device.

The template was developed and validated with Zabbix 7.4 and a **Kentix MultiSensor-TI-BLE** running firmware **08.06.02**. Other devices may expose a different subset of the MIB.

---

## MIB installation (important)

The template uses symbolic OIDs such as:

```text
KENTIXDEVICES::tempValue
KENTIXDEVICES::alarmtemp.0
KENTIXDEVICES::sensorName
```

The `kentixdevices.mib` file must therefore be installed on the machine that performs the SNMP polling. If the host is monitored through a Zabbix proxy, install the MIB on the **proxy**, not only on the Zabbix server.

Without the MIB, Zabbix reports errors such as:

> `snmp_parse_oid(): cannot parse OID "KENTIXDEVICES::alarmtemp.0"`

### 1. Install the MIB

Copy the supplied file to the Net-SNMP MIB directory:

```bash
sudo cp files/kentixdevices.mib /usr/share/snmp/mibs/kentixdevices.mib
sudo chmod 0644 /usr/share/snmp/mibs/kentixdevices.mib
```

The module name inside the file is:

```text
KENTIXDEVICES DEFINITIONS ::= BEGIN
```

The filename itself may use lowercase letters; the symbolic module name remains `KENTIXDEVICES`.

### 2. Configure Net-SNMP

Add or adjust the following entries in `/etc/snmp/snmp.conf`:

```conf
mibdirs +/usr/share/snmp/mibs
mibs +KENTIXDEVICES
```

Loading only the required module is preferable to `mibs +ALL`, because `+ALL` can generate unrelated warnings from incomplete third-party or distribution MIB packages.

### 3. Verify MIB resolution

Run the checks as the same operating-system user that runs Zabbix:

```bash
sudo -u zabbix snmptranslate \
  -M /usr/share/snmp/mibs \
  -m +KENTIXDEVICES \
  -On KENTIXDEVICES::tempValue

sudo -u zabbix snmptranslate \
  -M /usr/share/snmp/mibs \
  -m +KENTIXDEVICES \
  -On KENTIXDEVICES::alarmtemp.0
```

Both commands must return numeric OIDs.

### 4. Restart the polling process

After installing or changing the MIB, restart the component that performs the SNMP polling:

```bash
sudo systemctl restart zabbix-server
```

or, when the host is monitored by a proxy:

```bash
sudo systemctl restart zabbix-proxy
```

---

## Setup

> Zabbix should be configured according to the official  
> [Templates out of the box](https://www.zabbix.com/documentation/7.4/en/manual/config/templates_out_of_the_box) guidance.

1. **Enable SNMP on the Kentix device**

   - Enable SNMPv2c or SNMPv3.
   - Configure the community or SNMPv3 credentials.
   - Permit queries from the Zabbix server or proxy address.
   - Verify that UDP port 161 is reachable.

2. **Install the Kentix MIB**

   Follow the steps in the *MIB installation* section above on the Zabbix server or proxy that will poll the device.

3. **Import the template**

   Import:

   ```text
   template_kentix_snmp.yaml
   ```

   The imported template name is:

   ```text
   Kentix Devices by SNMP
   ```

4. **Create the Kentix host**

   - Add an SNMP interface using the device IP address and port `161`.
   - Select SNMPv2 or configure SNMPv3 as required.
   - Set the community directly or through a host macro such as `{$SNMP_COMMUNITY}`.
   - Link **Kentix Devices by SNMP**.

5. **Recommended SNMP interface settings**

   Some Kentix firmware versions are sensitive to large SNMP bulk requests. A conservative configuration is:

   ```text
   SNMP version: SNMPv2
   Max repetition count: 1
   ```

   If polling becomes delayed or several items share large `Last check` gaps, disable **Use combined requests** for the host SNMP interface. Unsupported Kentix OIDs may otherwise delay other items in the same combined request.

6. **Adjust measurement scale macros**

   Compare the raw values and Kentix multiplier items with the values shown in the device interface. Override the `{$KENTIX.SCALE.*}` macros at host level when necessary.

7. **Wait for discovery or execute it manually**

   The default LLD interval is `10m`. To populate items immediately, use **Execute now** on the required discovery rules.

---

## Macros used

| Name | Description | Default |
|------|-------------|---------|
| `{$KENTIX.ALARM.OK}` | Numeric value treated as the normal state for Kentix `Unsigned32` alarm fields. | `0` |
| `{$KENTIX.CONFIG.INTERVAL}` | Polling interval for configuration and inventory values. | `1h` |
| `{$KENTIX.LLD.INTERVAL}` | Low-level discovery interval. | `10m` |
| `{$KENTIX.LLD.LIFETIME}` | Retention period for entities no longer returned by LLD. | `30d` |
| `{$KENTIX.NODATA}` | Period without SNMP uptime data before the device is considered unavailable. | `10m` |
| `{$KENTIX.POLL.INTERVAL}` | Polling interval for current Kentix SNMP values. | `1m` |
| `{$KENTIX.SCALE.ACTIVEPOWER}` | Zabbix multiplier for active-power current values. | `1` |
| `{$KENTIX.SCALE.APPARENTPOWER}` | Zabbix multiplier for apparent-power current values. | `1` |
| `{$KENTIX.SCALE.CO2}` | Zabbix multiplier for CO₂ current values. | `1` |
| `{$KENTIX.SCALE.CONSUMPTION}` | Zabbix multiplier for consumption current values. | `1` |
| `{$KENTIX.SCALE.CURRENT}` | Zabbix multiplier for electrical current values. | `1` |
| `{$KENTIX.SCALE.DEWPOINT}` | Zabbix multiplier for dew-point current values. | `0.1` |
| `{$KENTIX.SCALE.FREQUENCY}` | Zabbix multiplier for frequency current values. | `1` |
| `{$KENTIX.SCALE.HUMIDITY}` | Zabbix multiplier for humidity current values. | `0.1` |
| `{$KENTIX.SCALE.RCM.AC}` | Zabbix multiplier for RCM AC values. | `1` |
| `{$KENTIX.SCALE.RCM.DC}` | Zabbix multiplier for RCM DC values. | `1` |
| `{$KENTIX.SCALE.REACTIVEPOWER}` | Zabbix multiplier for reactive-power current values. | `1` |
| `{$KENTIX.SCALE.TEMPERATURE}` | Zabbix multiplier for temperature and heat-detection current values. | `0.1` |
| `{$KENTIX.SCALE.VOLTAGE}` | Zabbix multiplier for voltage current values. | `1` |

### Measurement scaling

Kentix provides separate multiplier objects such as `multiplierTemperature`, `multiplierHumidity` and `multiplierVoltage`. Zabbix preprocessing cannot dynamically use the latest value of another item as a multiplier, so the template uses host-overridable `{$KENTIX.SCALE.*}` macros.

Only **current raw measurement values** are scaled. Device-provided Min, Max and threshold objects are already returned in engineering units and are intentionally not scaled.

Example for a device returning:

```text
tempValue = 358
multiplierTemperature = 10
```

Use:

```text
{$KENTIX.SCALE.TEMPERATURE}=0.1
```

The resulting Zabbix value is `35.8 °C`.

---

## Items and low-level discovery

The template defines **47 static items** and **100 discovery rules** with **466 item prototypes**.

### System and identification

Static items include:

- SNMP system description.
- SNMP system name.
- SNMP object ID.
- Uptime.
- Temperature unit.
- Kentix measurement multiplier values.

The uptime item converts SNMP `TimeTicks` from hundredths of a second to seconds before applying the Zabbix `uptime` unit.

### Aggregate alarm states

Static alarm-state items include, among others:

- always-active and armed alarms,
- system alarm,
- temperature, humidity and dew-point alarms,
- fire and sabotage alarms,
- CO alarm,
- voltage, current, frequency and power alarms,
- GSM and sensor-communication states.

These are summary states. Detailed sensor-specific problems are generated by trigger prototypes inside the corresponding LLD rules.

### Environmental and security discovery

LLD rules cover:

- temperature,
- humidity,
- dew point,
- CO and CO₂,
- air quality and air-quality fire,
- heat detection,
- thermal-imaging fire detection,
- motion,
- vibration,
- latency,
- battery,
- connection,
- latch,
- reed/reed2,
- tilt,
- RCM AC and DC.

The thermal-imaging value is handled as a temperature and uses `{$KENTIX.SCALE.TEMPERATURE}`.

### Inputs, outputs and leakage

The template includes separate discovery rules for:

- digital inputs 1–16,
- outputs 1–8,
- analog inputs 1–8,
- leakage tables 1–3.

### Three-phase electrical monitoring

For each phase, discovery covers:

- general phase information,
- voltage,
- current,
- frequency,
- active power,
- reactive power,
- apparent power.

Measurement trigger prototypes include the current engineering value in **Operational data** by using `{ITEM.LASTVALUE2}`.

### Groups and rack units

Discovery includes:

- Kentix groups,
- group active/apparent power and consumption for supply lines A and B,
- general/environmental group alarm states,
- power-related group alarm states,
- rack-unit inventory,
- rack-unit active/apparent power and consumption for supply lines A and B.

The group-state implementation uses LLD overrides so an item is created only when its individual MIB column exists on the device.

### Logbooks

The following discoveries are included but **disabled by default**:

- Access logbook.
- Event logbook.
- System logbook.

Logbook tables can create many short-lived discovered entities. Enable them only after reviewing the expected volume and retention requirements.

### SNMP traps

Eight SNMP trap items are included but **disabled by default**:

- Access Event.
- Alarm Event.
- Alarm State Change Event Device.
- Alarm State Change Event Group.
- Heartbeat.
- Login Event.
- Structured Access Event.
- Structured Alarm Event.

Enabling these items also requires a working Zabbix SNMP trap receiver and trap forwarding configuration, which is outside the scope of this template.

---

## Triggers

The template contains **16 static triggers** and **32 trigger prototypes**.

### Aggregate device alarms

Static triggers are provided for selected collective alarm states, including:

- active, reactive and apparent power,
- current, voltage and frequency,
- temperature, humidity and dew point,
- CO,
- fire,
- sabotage,
- system alarm,
- armed and always-active alarm groups.

There is also a **No SNMP data** trigger based on:

```text
nodata(/Kentix Devices by SNMP/kentix.system.uptime,{$KENTIX.NODATA})=1
```

### Discovered sensor alarms

Trigger prototypes are created for supported environmental, security and power measurements. They use the device-provided alarm field rather than calculating an independent threshold in Zabbix.

For measurement-based prototypes, the expression also verifies that the associated current value has recent data:

```text
last(...alarm[{#SNMPINDEX}])<>{$KENTIX.ALARM.OK}
and
nodata(...value[{#SNMPINDEX}],5m)=0
```

The associated current measurement is shown in **Operational data** through:

```text
{ITEM.LASTVALUE2}
```

This allows the Problems view to show the current temperature, humidity, voltage, current, power or other measurement next to the alarm.

### Severity

- Most discovered alarm-state triggers use **Average** severity.
- Thermal-imaging fire detection uses **High** severity.
- The SNMP no-data trigger uses **Warning** severity.

Adjust severities at template or host level to match the local alarm policy.

---

## Value maps

The template defines the following value maps:

| Name | Mapping |
|------|---------|
| **Kentix Alarm state** | `0 → Normal`, `1 → Alarm` |
| **Kentix Armed state** | `0 → Armed`, `1 → Disarmed` |
| **Kentix Open/Closed** | `0 → Closed`, `1 → Open` |
| **Kentix TruthValue** | `1 → True`, `2 → False` |

---

## Template tags

Template-level tags:

- `device: kentix-device`
- `protocol: snmp`
- `vendor: kentix`

Items and prototypes also use tags such as:

- `component`
- `entity`
- `table`
- `scope`

These tags can be used in dashboards, Problems widgets, actions and service filtering.

---

## Notes and limitations

- The template requires the official `KENTIXDEVICES` MIB and uses symbolic OIDs throughout.
- The MIB must be installed on the actual Zabbix server or proxy performing the polling.
- The template covers the full MIB, but each Kentix model implements only a subset of the available features.
- Unsupported LLD tables normally create no items. Most multi-column discoveries require the primary `{#DISCOVERY}` macro to exist, preventing rows found only through `sensorName` from creating false items.
- Some optional **static scalar objects** may still become `UNSUPPORTED` with `No Such Object available on this agent at this OID`. Disable those inherited items on hosts that do not implement the corresponding function.
- Some Kentix SNMP agents respond poorly to large combined or bulk requests. `Max repetition count = 1` is recommended when timeouts occur; disabling combined requests can prevent unsupported scalar OIDs from delaying valid items.
- SNMPv1 is not required and may be disabled on newer devices. SNMPv2c or SNMPv3 is recommended.
- Logbook discovery and SNMP trap items are disabled by default.
- Scale macro defaults match the development device but must be validated for each Kentix model and firmware.
- Min, Max and threshold values are intentionally not processed by the current-value scale macros.
- The template does not include graph prototypes or dashboards.

---

## Troubleshooting

### Symbolic OID cannot be parsed

Error:

```text
snmp_parse_oid(): cannot parse OID "KENTIXDEVICES::..."
```

Verify MIB installation with `snmptranslate` as the `zabbix` user and restart the Zabbix server or proxy.

### SNMP GET works, but a full enterprise walk times out

Some devices may not respond correctly when the walk begins at the Kentix root or encounters an unsupported scalar. Test the exact table column used by the LLD rule instead:

```bash
snmpwalk -m '' -On \
  -v2c -c 'COMMUNITY' \
  DEVICE_IP \
  .1.3.6.1.4.1.37954.5.2.2.1.2
```

A valid response such as:

```text
.1.3.6.1.4.1.37954.5.2.2.1.2.1 = INTEGER: 358
```

means the table can be discovered with `{#SNMPINDEX}=1`.

### LLD items are not visible yet

- Confirm that the discovery rule is enabled.
- Use **Execute now**.
- Check the rule's latest error and LLD result.
- Remember that measurements do not need to change before they are discovered.

### Incorrect engineering value

Compare:

- the raw SNMP value,
- the corresponding Kentix multiplier item,
- the value displayed in the Kentix web interface.

Then override the appropriate `{$KENTIX.SCALE.*}` macro on the host.

### Polling intervals are much longer than configured

- Check **Administration → Queue**.
- Set SNMP **Max repetition count** to `1`.
- Disable **Use combined requests** when unsupported OIDs delay valid items.
- Disable optional static items that consistently return `No Such Object`.
- Verify that enough SNMP pollers are available on the server or proxy.

---

## Feedback

If you find an unsupported Kentix model, an incorrect OID interpretation, a missing unit, or a better value mapping, open an issue or pull request in the repository where this template is maintained. Include:

- Kentix model and firmware version,
- `sysObjectID.0`,
- the relevant numeric `snmpwalk` output,
- the affected Zabbix item or discovery rule.
