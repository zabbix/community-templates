# Template "Rittal PDU 7979 by SNMP"

Template for monitoring Rittal PDU 7979 with CMC III controller over SNMPv2.

The template focuses on two logical parts of the device:

- **PDU-Controller** – CMC III controller health, system status and inventory.
- **PDU-SWI** – switched PDU module: electrical measurements (I/U/P/E, cos φ) and socket states, including per-phase auto-discovery.

Zabbix version: 7.4+  
Template group: `Templates/Power`  
Template name: `Rittal PDU 7979 by SNMP`  

---

## Features

- **PDU-Controller (CMC III)**
  - Unit status, overall device and message status (with value maps).
  - System health status for **temperature**, **current** and **supply**, with error info strings.
  - CPU load average (1 min) with warning/critical thresholds.
  - Inventory: serial number, HW/FW/OS revisions, production code.
  - Uptime and current power source.

- **PDU-SWI (switched PDU)**
  - Device status and status text from `cmcIIIDevTable`.
  - Inventory: name, alias, type OID, article number, location, FW/HW revisions, serial number.
  - Timestamp of last change for the PDU device.
  - Total input frequency, neutral current, total active power and total active energy.

- **Per-phase auto-discovery (via `cmcIIIVarTable`)**
  - For each detected phase (L1, L2, L3, …):
    - Phase voltage (L-N).
    - Phase current.
    - Phase power factor (cos φ).
    - Phase active, reactive and apparent power.
    - Phase active energy.
  - All per-phase entities are discovered automatically, so the template is suitable for 1-phase and 3-phase PDUs.

- **Socket auto-discovery**
  - Discovers sockets by name pattern `Sockets.Socket NN.General.Status`.
  - Creates item per socket with a human-friendly socket number (`01`–`13` etc.).
  - Trigger prototype for sockets that are not in state `On`.

- **Built-in value maps**
  - PDU-Controller unit status.
  - PDU-Controller overall device status.
  - PDU-Controller overall message status.
  - PDU-Controller device status.
  - PDU-Controller unit mode.
  - PDU-Controller unit current source.

---

## Requirements

- **Zabbix server:** 7.4 or newer.
- **Device:** Rittal PDU 7979 with CMC III controller and switched PDU module.
- **Protocol:** SNMPv2 enabled on the CMC III.
- **Network access:** Zabbix server (or proxy) must reach the CMC III SNMP interface (UDP/161).

The template is designed for SNMP polling directly from Zabbix (no agent required on the device).

---

## Setup

1. **Import the template**
   - In Zabbix frontend go to:  
     **Configuration → Templates → Import**  
     and import `template_power_rittal_pdu_7979_snmp_lld_final.yaml`.

2. **Create a host**
   - Create a host that represents your Rittal PDU.
   - Add an **SNMP interface** with the IP address of the CMC III controller.
   - Set **SNMP community** according to your environment (global, host or template macro – see below).

3. **Link the template**
   - On the host, under **Templates**, link:
     - `Rittal PDU 7979 by SNMP`

4. **Adjust macros (optional but recommended)**
   - Tune thresholds in **Macros → Inherited and host macros** on the host if default values do not match your installation (see “Macros used”).

5. **Wait for discovery**
   - Per-phase and socket entities are created by LLD rules.
   - Give it at least one discovery cycle (by default 1 hour) or run “Check now” on discovery rules while testing.

---

## Macros used

The template defines the following user macros (with reasonable defaults). You can override them at the host level to match your power design and limits.

| Macro                                | Default | Description                                                                 |
|--------------------------------------|---------|-----------------------------------------------------------------------------|
| `{$RITTAL.PDU.DEVIDX}`               | `2`     | Device index of the PDU-SWI in `cmcIIIDevTable/cmcIIIVarTable`.            |
| `{$RITTAL.PDU.LOADAVG1.WARN}`        | `2`     | Warning threshold for controller 1-min CPU load average.                   |
| `{$RITTAL.PDU.LOADAVG1.CRIT}`        | `3`     | Critical threshold for controller 1-min CPU load average.                  |
| `{$RITTAL.PDU.FREQ.MIN}`             | `49`    | Minimum acceptable input frequency (Hz).                                   |
| `{$RITTAL.PDU.FREQ.MAX}`             | `51`    | Maximum acceptable input frequency (Hz).                                   |
| `{$RITTAL.PDU.VOLT.LN.MIN}`          | `210`   | Minimum acceptable phase line-to-neutral voltage (V).                      |
| `{$RITTAL.PDU.VOLT.LN.MAX}`          | `250`   | Maximum acceptable phase line-to-neutral voltage (V).                      |
| `{$RITTAL.PDU.CURRENT.NEUTRAL.MAX}`  | `15`    | Maximum neutral line current (A).                                          |
| `{$RITTAL.PDU.CURRENT.PHASE.WARN}`   | `12`    | Warning threshold for per-phase current (A).                               |
| `{$RITTAL.PDU.CURRENT.PHASE.CRIT}`   | `14`    | Critical threshold for per-phase current (A).                              |
| `{$RITTAL.PDU.POWER.TOTAL.WARN}`     | `3000`  | Warning threshold for total active power (W).                              |
| `{$RITTAL.PDU.POWER.TOTAL.CRIT}`     | `3400`  | Critical threshold for total active power (W).                             |
| `{$RITTAL.PDU.POWER.PHASE.WARN}`     | `2500`  | Warning threshold for per-phase active power (W).                          |
| `{$RITTAL.PDU.POWER.PHASE.CRIT}`     | `2800`  | Critical threshold for per-phase active power (W).                         |
| `{$RITTAL.PDU.PF.MIN}`               | `0.80`  | Minimum acceptable power factor (cos φ) for each phase.                    |

> Note: SNMP community is typically configured on the host SNMP interface. You may additionally use a template or host macro `{$SNMP_COMMUNITY}` in your environment if you follow Zabbix best practices.

---

## Items

The template defines about **33 regular items**, split between PDU-Controller and PDU-SWI:

### PDU-Controller

Examples:

- Unit status, overall device status, overall message status (with value maps).
- System health temperature/current/supply status and detailed error info.
- CPU load average (1 min).
- Uptime.
- Serial number, HW/FW/OS revisions, production code.
- Current source (AC adapter, PoE, etc.).

### PDU-SWI (switched PDU)

Examples:

- Device status (numeric + text).
- Name, alias, type OID, article number, location.
- Firmware and hardware revisions.
- Serial number.
- Last change timestamp.
- Total input frequency.
- Neutral current.
- Total active power and total active energy.

---

## Discovery rules

The template includes **8 discovery rules**:

1. **PDU-SWI: socket general status discovery**
   - Discovers socket objects based on `Sockets.Socket NN.General.Status`.
   - Creates:
     - Item prototype: `PDU-SWI: Socket {#SOCKET} status`
     - Trigger prototype: `PDU-SWI: Socket {#SOCKET} status is not On`

2. **PDU-SWI: Phase voltage (L-N) discovery**
   - Discovers available phases (L1, L2, L3, …).
   - Item prototype: `PDU-SWI: Phase {#PHASE} voltage (L-N)` (V)
   - Trigger prototype: phase voltage out of range (uses `{$RITTAL.PDU.VOLT.LN.MIN}` / `{$RITTAL.PDU.VOLT.LN.MAX}`).

3. **PDU-SWI: Phase current discovery**
   - Item prototype: `PDU-SWI: Phase {#PHASE} current` (A)
   - Trigger prototypes:
     - Phase current is high (`{$RITTAL.PDU.CURRENT.PHASE.WARN}`).
     - Phase current is critical (`{$RITTAL.PDU.CURRENT.PHASE.CRIT}`).

4. **PDU-SWI: Phase power factor (cos φ) discovery**
   - Item prototype: `PDU-SWI: Phase {#PHASE} power factor (cos φ)`
   - Trigger prototype: phase power factor is low (uses `{$RITTAL.PDU.PF.MIN}`).

5. **PDU-SWI: Phase active power discovery**
   - Item prototype: `PDU-SWI: Phase {#PHASE} active power` (W)
   - Trigger prototypes:
     - Phase active power is high (`{$RITTAL.PDU.POWER.PHASE.WARN}`).
     - Phase active power is critical (`{$RITTAL.PDU.POWER.PHASE.CRIT}`).

6. **PDU-SWI: Phase reactive power discovery**
   - Item prototype: `PDU-SWI: Phase {#PHASE} reactive power` (var).

7. **PDU-SWI: Phase apparent power discovery**
   - Item prototype: `PDU-SWI: Phase {#PHASE} apparent power` (VA).

8. **PDU-SWI: Phase active energy discovery**
   - Item prototype: `PDU-SWI: Phase {#PHASE} active energy` (kWh).

---

## Triggers

The template defines around **13 regular triggers** plus **multiple trigger prototypes** for discovered entities.

### Examples – PDU-Controller

- **Unit status is not OK** – non-OK controller unit state.
- **Overall device status is not OK** – problems reported by CMC III.
- **Overall message status is not OK** – non-OK message state.
- **System health temperature/current/supply status is not OK** – controller system health problems.
- **High / critical CPU load** – based on 1-minute load and `{$RITTAL.PDU.LOADAVG1.*}` macros.

### Examples – PDU-SWI

- **Device status is not OK** – switched PDU device status not “ok”.
- **Input frequency out of range** – uses `{$RITTAL.PDU.FREQ.MIN}` / `{$RITTAL.PDU.FREQ.MAX}`.
- **Neutral current is high** – uses `{$RITTAL.PDU.CURRENT.NEUTRAL.MAX}`.
- **Total active power is high / critical** – uses `{$RITTAL.PDU.POWER.TOTAL.WARN}` / `.CRIT`.

### Examples – LLD trigger prototypes

- **Socket {#SOCKET} status is not On**.
- **Phase {#PHASE} voltage out of range**.
- **Phase {#PHASE} current high / critical**.
- **Phase {#PHASE} power factor is low**.
- **Phase {#PHASE} active power high / critical**.

All thresholds are configurable via template macros to match your PDU rating and local limits.

---

## Installation notes and tips

- Verify that the **device index** in `{$RITTAL.PDU.DEVIDX}` matches your PDU-SWI position in `cmcIIIDevTable`.  
  The default `2` is typical but may differ depending on your CMC III configuration.
- After first import, check:
  - That socket discovery created the expected number of sockets (01–13 or as installed).
  - That phase discovery reflects your wiring (single phase vs 3-phase system).
- For production, adjust:
  - Voltage and frequency ranges to match your grid.
  - Current and power thresholds to match PDU rating and derating rules.
  - Minimal power factor acceptable for your installation.

---

## Feedback / Issues

If you notice incorrect OIDs, missing metrics or want to improve the thresholds and descriptions:

- Open an issue or pull request in the Zabbix **community-templates** repository.
- Provide:
  - Zabbix version, template version.
  - Rittal PDU model and firmware.
  - Relevant screenshots / SNMP walk fragments from your device.
