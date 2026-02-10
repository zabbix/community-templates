## Eaton 9PX SNMPv3 Template (XUPS + RFC1628)

### Overview

This template provides production-ready monitoring for Eaton 9PX UPS devices using SNMP.

It combines Eaton's XUPS-MIB with the standard RFC1628 UPS-MIB where possible to improve stability and reduce vendor lock-in.

The template is intentionally designed to avoid unsupported OIDs and minimize `No Such Instance` polling errors observed on real hardware.

SNMP traps are not required.

---

### Key Features

**Reliable polling-based monitoring**

* No trap dependency
* Debounced triggers to reduce alert noise
* Device-validated OIDs only

**Core UPS health monitoring**

* Output source and protection state
* Battery runtime and charge
* Input status
* Active alarm count
* Bypass detection
* Shutdown risk detection

**Electrical metrics**

* Input voltage (per phase via LLD)
* Output voltage, current, load %, watts
* Bypass voltage and current

Metrics commonly listed in XUPS but not consistently implemented (for example battery current or input total current) were intentionally excluded after hardware validation.

---

### Trigger Design

Severity ladder suitable for infrastructure workloads:

**DISASTER**

* Output not powered
* Low battery shutdown risk
* Battery failure

**HIGH**

* UPS on bypass
* Input not good
* Output not protected
* Output powered without continuity

**AVERAGE**

* Active alarms present
* Non-normal output source
* Unknown output state

**WARNING**

* On battery (debounced)

The template focuses on high signal-to-noise alerting and avoids transient state alarms.

---

### Inventory Integration

Automatically populates:

* Name (sysDescr)
* Alias / hostname (sysName)
* Model and serial numbers
* UPS firmware version (RFC1628 upsIdentFirmwareVersion)
* Contact and location

Standard UPS-MIB firmware is preferred over vendor-specific OIDs when available.

---

### Discovery Strategy

Low-level discovery is used for:

* Input phases
* Output phases
* Bypass phases

Item names use the reported phase label (for example `L1/A`) for readability.

Discovery intervals may safely be increased (for example to 12h), as UPS topology rarely changes.

---

### SNMP Version

Developed for **SNMPv3**, but compatible with SNMPv2 if credentials are adjusted.

---

### Tested Hardware

Validated on:

* **UPS:** Eaton 9PX 3000i RT 3U

  * Firmware: **01.28.17724**

* **Network Management Card:** Eaton Cybersecure Gigabit **Network-M3**

  * Firmware: **2.1.2**

---

### Compatibility Notes

The template was developed and verified on Eaton Network-M3 hardware.

Older network cards (such as Network-M2) may expose different OIDs and could require adjustments.

Devices implementing both XUPS-MIB and RFC1628 should work with minimal or no modification.

---

### Design Goals

* Prefer standards over vendor-specific objects
* Avoid polling unsupported metrics
* Provide actionable alerts
* Maintain low operational noise
* Be safe for production infrastructure
* Require minimal tuning after import

---

### Notes

Some XUPS alarm table objects were intentionally excluded due to inconsistent implementation across firmware versions.
The template instead relies on alarm counters and state monitoring for improved reliability.

---

### Recommended Host Settings

* Inventory mode: **Automatic**
* SNMP timeout: 5s
* Retries: 2

---

Feedback and validation on additional Eaton models are welcome.
