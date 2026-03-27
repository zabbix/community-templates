# Zabbix Template — Schleifenbauer PDU

Monitors **Schleifenbauer Smart PDUs** (Power Distribution Units) via SNMPv2c using the modern Zabbix SNMP approach (`walk[]`/`get[]` master items with dependent items and Low-Level Discovery). Supports both standalone and daisy-chained (databus ring) PDU deployments.

**Author:** Brandon van der Loo ([@metrotyranno](https://github.com/metrotyranno))  
**License:** MIT  
**Zabbix version:** 7.4  
**SNMP version:** v2c  
**Vendor MIB:** SCHLEIFENBAUER-DATABUS-MIB (enterprise OID `1.3.6.1.4.1.31034`)  
**Vendor documentation:** https://www.schleifenbauer.eu

---

## Requirements

- Zabbix 7.4 or later
- SNMPv2c enabled on the PDU
- The **ICMP Ping** template (linked automatically; shipped with Zabbix)
- No external scripts or user parameters required

---

## Setup

1. **Enable SNMP** on the PDU:
   - Log in to the PDU web interface or serial console
   - Navigate to Network → SNMP and enable SNMPv2c
   - Set the community string (default: `public`)

2. **Import the template** into Zabbix:
   - Go to *Data collection → Templates → Import*
   - Select `template_schleifenbauer_pdu.yaml`
   - Accept defaults and click *Import*

3. **Create a host** for each PDU gateway (the first/only PDU, or the ring master):
   - Set the SNMP interface IP and port (default: UDP 161)
   - Link the template **Template_Schleifenbauer PDU**
   - Set the macros below if non-default values are needed

4. **Wait for discovery** — LLD rules run every hour by default. After the first cycle, per-device, per-outlet, per-input, per-branch and per-sensor items will be created automatically.

> **Daisy-chained deployments:** A single Zabbix host pointing at the ring gateway discovers all PDUs on the bus. Each PDU gets its own device index (`{#DEVINDEX}`) which is used in all item keys.

---

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$SNMP_COMMUNITY}` | `public` | SNMPv2c community string |
| `{$SNMP_PORT}` | `161` | SNMP UDP port |
| `{$PDU_TEMP_WARN}` | `40` | Internal temperature warning threshold (°C) |
| `{$PDU_TEMP_HIGH}` | `50` | Internal temperature critical threshold (°C) |
| `{$PDU_LOAD_WARN}` | `80` | Load warning threshold (% of outlet maximum current) |
| `{$PDU_LOAD_HIGH}` | `95` | Load critical threshold (% of outlet maximum current) |

---

## Discovery Rules

| Rule | Key | Discovers |
|------|-----|-----------|
| Device Discovery | `sdb.lld.devices` | All PDUs on the databus (one per `{#DEVINDEX}`) |
| Input Phase Discovery | `sdb.lld.inputs` | Input phases per device (`{#DEVINDEX}.{#ININDEX}`) |
| Metered Outlet Discovery | `sdb.lld.outlets.mt` | Metered outlets with current/power/energy |
| Switched Outlet Discovery | `sdb.lld.outlets.sw` | Switched outlets with on/off control state |
| Branch Circuit Discovery | `sdb.lld.branches` | Branch circuits with current and breaker state |
| External Sensor Discovery | `sdb.lld.sensors` | Temperature, humidity and contact sensors |

---

## Items

### Global (databus-level)

| Item | Key | Description |
|------|-----|-------------|
| Devices on Bus | `sdb.mgmt.devices` | Total number of PDUs detected on the ring |
| Addressable Devices | `sdb.mgmt.addressable` | Number of addressable devices |
| Ring State | `sdb.mgmt.ring_state` | Databus ring topology state (0=Open/Fault, 1=Closed/OK) |
| Ring Breach Index | `sdb.mgmt.ring_breach` | Index of the device where the ring is broken |

### Per-Device (discovered)

| Category | Items |
|----------|-------|
| **Identity** | Firmware version, product ID, serial number, MAC address, hardware address, unit address, name, location, device type, SPDM version |
| **Configuration** | Display brightness, lock state, buzzer state, max load per phase, switch delay |
| **System Status** | Operational status, alert status, temperature alert flag, current alert flag, voltage alert flag, outlet alert flag, hardware alert flag |
| **Measurements** | Internal/external temperature, internal/external temperature peak, residual current, residual current peak |

### Per-Input Phase (discovered)

Actual current, peak current, actual voltage, minimum voltage, active power (W), apparent power (VA), power factor (%), energy total (!kWh), energy subtotal (!kWh), max configured amperage

### Per-Metered Outlet (discovered)

Actual current, peak current, actual voltage, active power (W), apparent power (VA), power factor (%), energy total (!kWh), energy subtotal (!kWh), outlet state (on/off), scheduled state

### Per-Switched Outlet (discovered)

Outlet state (on/off), scheduled state

### Per-Branch Circuit (discovered)

Actual current, peak current, actual voltage, minimum voltage, active power (W), apparent power (VA), power factor (%), energy total (!kWh), energy subtotal (!kWh), breaker state

### Per-External Sensor (discovered)

Sensor type, sensor value (×0.01 scaling for temperature/humidity)

> **Note:** All centi-unit values (centiAmpere, centiVolt, centiCelsius) are divided by 100 using a MULTIPLIER(0.01) preprocessing step. Energy values are stored in raw kWh with auto-scaling disabled (`!kWh`) to show the full unscaled value.

---

## Triggers

| Name | Severity | Notes |
|------|----------|-------|
| PDU: Databus ring is open (fault) | Average | Fires only after ring was previously closed. Supports manual close. |
| PDU [{#DEVNAME}]: Device status code is non-zero | High | Non-zero operational status register |
| PDU [{#DEVNAME}]: Temperature alert active | High | Internal temperature alert flag set by PDU firmware |
| PDU [{#DEVNAME}]: Input current alert (phase …) | Average | Firmware current alert on input phase |
| PDU [{#DEVNAME}]: Input voltage alert (phase …) | Warning | Firmware voltage alert on input phase |
| PDU [{#DEVNAME}]: Outlet current drop detected (outlet …) | High | Outlet current alert from firmware |
| PDU [{#DEVNAME}]: Residual current alert | Average | RCD/residual current threshold exceeded |
| PDU [{#DEVNAME}]: Hardware alert on slave … | High | Hardware fault on daisy-chained slave device |
| PDU [{#DEVNAME}]: Branch current alert (branch …) | Average | Branch circuit current alert |
| PDU Dev[{#DEVINDEX}] Sensor [{#SNSNAME}]: Temperature high | Average | External temperature sensor > 35 °C (adjust `{$PDU_TEMP_WARN}`) |

---

## Value Maps

| Name | Values |
|------|--------|
| Schleifenbauer Device Type | 0=PDU, 1=DPM, 2=hPDU-G3, 3=DPM27E |
| Schleifenbauer Outlet State | 0=Off, 1=On |
| Schleifenbauer Ring State | 0=Open (Fault), 1=Closed (OK) |
| Schleifenbauer Alert Status | 0=No Alert |
| Schleifenbauer Outlet Scheduled | 0=Idle, 1=Pending |
| Schleifenbauer Sensor Type | T=Temperature (°C), H=Humidity (%), I=Dry switch contact |
| Schleifenbauer Sensor Contact State | 0=Open, 1=Closed (applied to sensor value items for type I dry contacts) |

---

## Tested With

- Schleifenbauer hPDU (G3 series)
- Zabbix 7.4

---

## License

MIT License — see [LICENSE](https://opensource.org/licenses/MIT)
