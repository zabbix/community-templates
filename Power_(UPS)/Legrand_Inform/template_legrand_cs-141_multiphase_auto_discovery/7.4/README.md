# Zabbix templates – UPS with Generex CS121 / CS141 card (Legrand and other vendors)

Zabbix 7.4 templates for monitoring UPS units with the **Generex CS121** or **CS141 SNMP network card**. They were built and tested on **Legrand** UPS units, but they only use the standard **UPS-MIB (RFC 1628)**, so they work with UPS units from **other vendors** too. See [Compatibility](#compatibility).

## ✨ Highlights

- ⚡ **Automatic phase discovery**: **input, output and bypass phases are discovered automatically, based on how many phases the UPS reports.** A 1-phase UPS gets one set of items, a 3-phase UPS gets three, each with its own triggers and graphs. The same template works for both, and you don't have to set anything by hand.
- 🔋 **Battery monitoring**: status, charge, minutes remaining, voltage, temperature and time on battery
- 🚨 **Ready-to-use triggers**: on battery, low charge, overload, voltage / frequency out of range, alarms, input line problems

## Contents

| File | Template | Use for |
|------|----------|---------|
| `template_ups_generex_cs121.yaml` | `HW UPS Generex CS121 (Legrand and other UPS, RFC 1628)` | UPS with the older **CS121** card |
| `template_ups_generex_cs141.yaml` | `HW UPS Generex CS141 (Legrand and other UPS, RFC 1628)` | UPS with the newer **CS141** card |

Both templates have the same items, discovery rules and triggers, plus the host graph `Battery`. The differences are listed in [CS121 vs. CS141](#cs121-vs-cs141).

**Items**
- Battery: status, estimated charge remaining (%), estimated minutes remaining, voltage, temperature, seconds on battery
- Health: number of active alarms, input line bads counter
- Identification: vendor, model, agent software version, name, location, uptime (filled into host inventory)
- ICMP ping / loss / response time

**Discovery rules (phases)**

Each rule reads its table from UPS-MIB and creates one set of items **per phase found**:

| Rule | MIB table | Items per phase |
|------|-----------|-----------------|
| **UPS Input Phases** | `upsInputTable` (`1.3.6.1.2.1.33.1.3.3`) | frequency, voltage, current, power |
| **UPS Output Phases** | `upsOutputTable` (`1.3.6.1.2.1.33.1.4.4`) | voltage, power, load (%) |
| **UPS Bypass Phases** | `upsBypassTable` (`1.3.6.1.2.1.33.1.5.3`) | voltage, current, power |

Each phase also gets its own graph (`UPS Input Phase N`, `UPS Output Phase N`, `UPS Bypass Phase N`).

**Triggers**

| Trigger | Severity |
|---------|----------|
| HOST DOWN (unavailable by ICMP ping) | Disaster |
| UPS running on battery (> 30 s) | High |
| Battery status not normal | High |
| Battery charge depleted (< 20 %) | High |
| Battery temperature high | High |
| UPS input power line bad | High |
| UPS overloaded phase N (> 60 %) | High |
| Output voltage outside nominal phase N (< 200 V or > 250 V) | High |
| High ICMP ping loss | High |
| Battery charge less than 80 % | Warning |
| Battery time remaining below 10 minutes | Warning |
| Battery temperature warning | Warning |
| UPS alarm present | Warning |
| Input frequency outside nominal phase N | Warning |
| UPS low output power phase N (< 10 W) | Warning |
| UPS bypassed phase N | Warning |
| High ICMP ping response time | Warning |
| UPS load changed phase N (± 1000 W) | Info |
| Device rebooted | Info |

All triggers depend on *HOST DOWN*, so when the UPS is unreachable you only get one alert. Device triggers are tagged `Loc: {INVENTORY.LOCATION1}`.

## Compatibility

The templates don't use any vendor-specific OIDs, only the standard UPS-MIB (RFC 1628, `1.3.6.1.2.1.33`). They should work with:

- ✅ **Any UPS with a Generex CS121 / CS141 card**, whatever the brand. Generex cards are built into UPS units from many vendors, often under the vendor's own name. Tested on **Legrand**.
- ✅ **Other SNMP cards that support RFC 1628**, for example Eaton Network-M2 or Socomec Net Vision (not tested).
- ⚠️ **APC Network Management Card**: supports UPS-MIB only partly. A template based on PowerNet-MIB is a better fit there.

### UPS vendors that ship Generex CS121 / CS141 cards

Generex makes CS121 / CS141 firmware for the following UPS vendors (OEM firmware list on [generex.de](https://www.generex.de/support/downloads/ups/cs141), October 2026). A UPS from any of these vendors with a CS121 or CS141 card (often sold under the vendor's own name) should work with these templates. Not every UPS model from a vendor uses a Generex card, so check which card your UPS has.

| | | | |
|---|---|---|---|
| ABB | Ablerex | AdPoS | AEG Power Solutions |
| AG IT Project | AKI Power Systems | Akkutronik | Allnet |
| Alpha | Altervac | apra net | AROS (Riello) |
| Astrid | Benning | Borri | British Power Conversion |
| CET | Centiel ² | Compu Power South Africa | Coromatic |
| CTA | Delta Electronics | DFM Select | DKC Europe |
| DRS Pivotal Power | E-TEC | Eaton / Powerware | Effekta |
| Elinex | ELIT | Enedo | EnerSys |
| Errepi | Eurotech Sweden | Exponential Power | FSB-Power |
| Fuji Electric | General Electric (GE) | Gustav Klein | Gutor |
| Hoppecke | Infosec | Inform | International Business Resources ² |
| Jovy Atlas | Kamic | Kaufel | Kess |
| **Legrand** (tested) | Leistung ² | Meta System Energy | Multimatic |
| NetMinder | Newave | Nitram | Online USV-Systeme |
| Phoenix Contact ¹ | Piller Power Systems | Power-All | Power Shield ² |
| Predictive Technology | Rehlko (Kohler Power) | Riello | Roline |
| Roton | S2S | Salicru | Sander |
| Sapotec | Schneider Electric | Sicotec | Siel |
| SNG | Staco Energy | Statron | Thycon |
| Triathlon | TwinSource | UPS Service | Vertiv |
| Woehrle | XPC | | |

¹ CS121 only &nbsp; ² CS141 only

Only **Legrand** has been tested. For the other vendors this list says that a Generex card exists for them, not that every value is reported. Feedback on other UPS models is welcome, open an issue or write to [info@duprtech.sk](mailto:info@duprtech.sk).

Things to check on a UPS from a different vendor:

- Some UPS units don't report every value (for example battery temperature, bypass or power per phase). Those items become *Not supported*, or return 0 and can raise the *Low output power* trigger. Disable what your UPS doesn't have.
- Battery voltage, input current and frequency are divided by 10, as the CS121 / CS141 card reports them. A different card may use another scale.
- If one template doesn't return data, try the other one. CS121 reads OIDs without the `.0` suffix and CS141 with it.

### CS121 vs. CS141

| | CS121 | CS141 |
|---|---|---|
| SNMP OIDs | without `.0` suffix | with `.0` suffix |
| Battery temperature warning / high | > 50 °C / > 60 °C | > 55 °C / > 65 °C |
| Input frequency outside nominal | < 47 Hz or > 53 Hz | < 45 Hz or > 55 Hz |
| UPS low output power (< 10 W) | enabled | disabled (not discovered) |
| Battery temperature warning depends on high | no | yes |
| Phase triggers can be closed manually | yes | no |

## Requirements

- Zabbix server / proxy **7.4** or newer
- SNMP (v1 / v2c) enabled on the network card, reachable from the Zabbix server / proxy
- `fping` installed on the server / proxy (ICMP items)

## Installation

1. **Import the template** that matches your card: *Data collection → Templates → Import* → `template_ups_generex_cs121.yaml` or `template_ups_generex_cs141.yaml`
2. **Create the UPS host**:
   - Add an SNMP interface (network card IP address) and set the SNMP community
   - Link the template `HW UPS Generex CS121 (...)` or `HW UPS Generex CS141 (...)`
   - Turn on host inventory (*Automatic*) if you want vendor, model and location filled in
3. Wait for discovery to run (phase discovery runs once a day; you can trigger it with *Execute now*).

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$ICMP_LOSS_WARN}` | `20` | Ping loss threshold (%) |
| `{$ICMP_RESPONSE_TIME_WARN}` | `0.15` | Ping response time threshold (s) |

Set the SNMP community **on the host** (or as a global macro), never in the template itself.

## Notes

- The thresholds for voltage (200–250 V), frequency, load (60 %) and battery temperature are set for a 230 V / 50 Hz grid. Edit the trigger prototypes if your UPS or grid is different.
- If your UPS has no bypass, the *UPS Bypass Phases* rule finds nothing and creates no items.
- Don't link both templates to the same host. They use the same item keys.
- Upgrading from an older version: the technical template names stay `HW UPS Legrand CS121` / `HW UPS Legrand CS141`, so importing the new file updates the existing template and keeps your hosts and history.

## Custom work & support

Need something extra? I can extend or customize these templates for your company's needs, for example new metrics, triggers, dashboards, other UPS models or integration with your environment. Feel free to get in touch: 📧 [info@duprtech.sk](mailto:info@duprtech.sk)

If this work makes sense to you, give the repo a ⭐ star or support me on Ko-fi ☕

I'm adding more tools and templates over time, so feel free to [follow me on GitHub](https://github.com/DuprTECH) to see what's new.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/duprtech)

## More scripts, improvements and frequent updates

This folder holds a snapshot of the template. **More scripts, improvements and frequent updates are on my GitHub:**

- 🆕 newer versions and frequent updates
- 🐞 bug fixes
- 🧩 extra scripts and improvements for the template

👉 **Repository:** https://github.com/DuprTECH/Zabbix-UPS-Generex-CS121-CS141  
👤 **My GitHub:** https://github.com/DuprTECH
